require 'json'

module Config

  F = open "config.json"

  CONFIG = {
    "CLIENT_KEY" => nil,
    "CLIENT_SECRET" => nil,
    "ACCESS_TOKEN" => nil,
    "ACCESS_SECRET" => nil
  }.update JSON.parse F.read

end
