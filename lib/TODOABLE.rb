require "TODOABLE/version"
require 'dotenv'
require 'rest-client'
require "base64"
Dotenv.load('./.env')
require 'pry'

module TODOABLE
  class Error < StandardError; end
  URL = "https://todoable.teachable.tech/api"


  def self.base_request_to_api(method:, header:, url:, payload: "" )
    res = RestClient::Request.execute(
    method: method,
    url: url,
    payload: payload.to_json,
    headers:   {
        :Authorization => header,
        :accept => :json,
        :content_type => :json
      }
   )

   case res.code
   when 204
     raise StandardError.new "No Content"
   when 401
     raise StandardError.new "Expired Token"
   when 422
     raise StandardError.new "Invalid Body"
   when 200
     return res
   end
  end

  def self.methods(method:, payload:"", url:)
    token = ENV['TOKEN']
    base_request_to_api(method: method, header: "Token token=#{token}", url: url,
    payload: payload)
  end

  def self.initialize(username, password)
       url = URL + "/authenticate"
       auth_details = "#{username}:#{password}"
       header_req = "Basic " + Base64::encode64(auth_details)
       response = base_request_to_api(method: :post, header: header_req, url: url )
       ENV['TOKEN']= JSON.parse(response.to_str)["token"]
  end

  def self.create(payload, post_url)

    url = URL + post_url
    # RestClient.post(url, {name: name},  :Authorization => "Token token=#{token}" )
     methods(method: post, url)
  end

  def self.get_all(get_url)
     url = URL + get_url
     methods(method: get, url)
  end

  def self.patch(name, post_url)
     methods(method: patch, post_url)
  end

  def self.get_info(get_info_url, id)
     url = get_info_url+id
     methods(method: get, url)
  end
end
