require 'json'
require 'uri'
require 'net/http'

def invoke(event:, context:)
  cmd = Hash[URI.decode_www_form(event['body'])].fetch('text', 'help')
  res = Net::HTTP.post URI(ENV['EVAL_URL']), cmd, "Content-Type" => "application/json"

  {
    statusCode: 200,
    body: "```#{res.body}```"
  }
end
