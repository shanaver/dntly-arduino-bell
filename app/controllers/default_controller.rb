class DefaultController < ApplicationController
  require 'json'
  require 'net/http'
  require "uri"

  def index

    endpoint = 'https://www.dntly.com/api/v1/donately/events.json?type=donation.created&count=30'

    post_params = { 
      :type => "donation.created",
      :count => 30
    }

    headers = {
      "Authorization" => "Basic ZZZZZ",
      "Content-Type" => "application/json"
    }

    uri = URI.parse(endpoint)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true;

    req = Net::HTTP::Get.new(uri.path)
    req.set_form_data( post_params )
    req = Net::HTTP::Get.new(uri.path + '?' + req.body, headers)
    
    response = http.request(req)

    render :json => response.body

  end
  
end
