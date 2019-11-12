require 'json'
require 'uri'
require 'net/http'

def command(event:, context:)
  text = Hash[URI.decode_www_form(event['body'])]['text']

  cmd = case text
  when nil
    "help"
  else
    if text.strip == ''
      "help"
    else
      text.strip
    end
  end

  res = Net::HTTP.post URI(ENV['PUPPET_DEBUGGER_URL']), cmd, "Content-Type" => "application/json"

  {
    statusCode: 200,
    body: "```#{res.body}```"
  }
end
