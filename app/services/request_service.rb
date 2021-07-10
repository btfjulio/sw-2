# frozen_string_literal: true

class RequestService
  def initialize(link, options = {})
    @link = link
    @options = options
  end

  def perform
    return if link.blank?

    call_page
  end

  private

  attr_reader :link, :options

  def call_page
    call_message
    HTTParty.get(link, options)
  rescue StandardError
    retry_message
    (retries =+ 1 && retry) if retries.zero?
  end

  def retries
    @_retries ||= 0
  end

  def call_message
    puts "Calling #{link}&page=#{@page}"
  end

  def retry_message
    puts 'error.. retrying after 3 secs'
  end
end
