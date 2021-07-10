# frozen_string_literal: true

require 'vcr'

RSpec.configure do |config|
  config.around(:each) do |example|
    vcr_tag = example.metadata[:vcr]

    if vcr_tag == false
      VCR.turned_off(&example)
    else
      options = vcr_tag.is_a?(Hash) ? vcr_tag : {}
      path_data = [example.metadata[:description]]
      parent = example.example_group
      while parent != RSpec::ExampleGroups
        path_data << parent.metadata[:description]
        # Newer versions of rspec may require you to use module_parent instead
        parent = parent.module_parent
      end

      name = path_data.map do |str|
        str.underscore.gsub(/\./, '').gsub(%r{[^\w/]+}, '_').gsub(%r{/$}, '')
      end.reverse.join('/')

      VCR.use_cassette(name, options, &example)
    end
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
end
