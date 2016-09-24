require 'oauth'
require 'json'
require './config'

class API

  def initialize
    @client = OAuth::Consumer.new(
        Config::CONFIG['CLIENT_KEY'],
        Config::CONFIG['CLIENT_SECRET'])
    @token = OAuth::Token.new(
        Config::CONFIG['ACCESS_TOKEN'],
        Config::CONFIG['ACCESS_SECRET'])
    @baseurl = "http://api.fanfou.com"
  end

  def home_timeline count
    path = "/statuses/home_timeline.json"
    query = URI.encode_www_form (
      {"count" => [ 60, /^\d+$/ =~ count ? count.to_i : 10 ].min}
    )
    response = get_request path, query
    if response.code == '200' then
      statuses = JSON.parse(response.body)
      print_timeline(statuses)
    end
  end

  def post status
    path = "/statuses/update.json"
    response = post_request path, status
    if response.code == '200' then
      tweet = JSON.parse(response.body)
      puts "Status sent successfully!"
    else
      puts "Fail! Could not send the message! " +
      "Code:#{response.code} Body:#{response.body}"
    end
  end

  def print_timeline(statuses)
    statuses.each { |tweet|
      puts tweet["user"]["name"]+": "+tweet["text"]+
            " | "+tweet["created_at"][0..-12]
    }
  end

  def get_request path, query
    address = URI "#{@baseurl}#{path}?#{query}"
    request = Net::HTTP::Get.new address.request_uri
    http = Net::HTTP.new address.host, address.port
    request.oauth! http, @client, @token
    http.start
    response = http.request request
    response
  end

  def post_request path, status
    address = URI "#{@baseurl}#{path}"
    request = Net::HTTP::Post.new address.request_uri
    request.set_form_data(
      "status" => status,
    )
    http = Net::HTTP.new address.host, address.port
    request.oauth! http, @client, @token
    http.start
    response = http.request request
    response
  end

  private :get_request, :post_request, :print_timeline

end
