require 'json'
require 'uri'
require 'net/http'

def command(event:, context:)
  cmd = Hash[URI.decode_www_form(event['body'])].fetch('text', 'help')
  res = Net::HTTP.post URI(ENV['PUPPET_DEBUGGER_URL']), cmd, "Content-Type" => "application/json"

  {
    statusCode: 200,
    body: "```#{res.body}```"
  }
end
