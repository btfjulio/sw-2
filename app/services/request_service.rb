# frozen_string_literal: true

class RequestService
  attr_reader :response

  def initialize(link, options = default_options)
    @link = link
    @options = options
    @retries = 0
  end

  def perform
    return if link.blank?

    call_page
  end

  private

  attr_reader :link, :options

  def call_page
    response = make_request
    return Nokogiri::HTML(response)
  rescue StandardError
    return if @retries.positive?

    prepare_to_retry
    retry
  end

  def make_request
    puts "Calling #{link}"
    sleep 1
    HTTParty.get(link, options)
  end

  def prepare_to_retry
    puts 'error.. retrying after 3 secs'
    @retries += 1
    sleep 3
  end

  def default_options
    {
      headers: { 'User-Agent' => 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0' }
    }
  end
end
