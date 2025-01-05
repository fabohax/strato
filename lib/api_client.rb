require 'httparty'
require 'dotenv/load'

class APIClient
  SIDESHIFT_API_URL = "https://sideshift.ai/api/v2/"

  def initialize(config)
    @access_key = config[:access_key]
    @secret_key = config[:secret_key]
    raise "API keys are missing" unless @access_key && @secret_key
  end

  def call_api(path, method: :get, body: nil)
    headers = {
      "Authorization" => "Bearer #{@access_key}",
      "Content-Type" => "application/json"
    }

    response = HTTParty.send(
      method,
      "#{SIDESHIFT_API_URL}#{path}",
      headers: headers,
      body: body ? body.to_json : nil
    )

    raise "API Error: #{response.code} - #{response.body}" unless response.success?

    response.parsed_response
  end
end
