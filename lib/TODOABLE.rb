require "TODOABLE/version"
require 'dotenv'
require 'rest-client'
require "base64"
Dotenv.load('./.env')
require 'pry'

module TODOABLE
  class Error < StandardError; end
  URL = "https://todoable.teachable.tech/api"


  def self.request_to_api(method:, header:, url:, payload: "" )
    RestClient::Request.execute(
    method: method,
    url: url,
    payload: payload ,
    headers:   {
        :Authorization => header,
        :accept => :json,
        :content_type => :json
      }
   )
  end

  def self.initialize(username, password)
       url = URL + "/authenticate"
       auth_details = "#{username}:#{password}"
       header_req = "Basic " + Base64::encode64(auth_details)
       response = request_to_api(method: :post, header: header_req, url: url )
       ENV['TOKEN']= JSON.parse(response.to_str)["token"]
  end

  def self.create(payload, post_url)
    token = ENV['TOKEN']
    url = URL + post_url
    # RestClient.post(url, {name: name},  :Authorization => "Token token=#{token}" )
    response = request_to_api(method: :post, header: "Token token=#{token}", url: url,
    payload: payload)
  end

  def self.get_all(url)
    request_to_api(method: :get,  header: "Token token="+ "\"" + token + "\"", url: url )
  end

  def patch(name, post_url)
  end
end
