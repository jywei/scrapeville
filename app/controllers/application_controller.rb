class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def google_news

  #   require 'nokogiri'
  #   require 'open-uri'
  #   require 'net/http'
  #   require 'OpenSSL'

  #   uri = URI.parse("https://news.google.com")
  #   http = Net::HTTP.new(uri.host, uri.port)
  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  #   @data = http.get(uri.request_uri)
  #   page = Nokogiri.HTML(@data.body)

  #   render text: page
  #   @newsvilles = page.css('.esc-body')
  # end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
    flash[:alert] = "Sorry, you are not authorized to access this area!"
  end

end
