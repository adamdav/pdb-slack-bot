require 'json'
# require 'net/http'

def invoke(event:, context:)
  body = {
    message: 'Go Serverless v1.0! Your function executed successfully!',
    input: event
  }.to_json

  # uri = URI(ENV['SLACK_URL'])

  # res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  #   req = Net::HTTP::Post.new(uri)
  #   req['Content-Type'] = 'application/json'
  #   req['Authorization'] = "Bearer #{ENV['SLACK_TOKEN']}"
  #   req.set_form_data('channel' => '', 'text' => body)
  #   http.request(req)
  # end

  {
    statusCode: 200,
    body: body
  }
end
