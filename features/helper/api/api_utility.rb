def get_user_token
  url = URI(get_config_data("API_BASE_URL") + "/auth/login")

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Post.new(url)
  request["Content-Type"] = "application/json"
  request.body = JSON.dump({
                             "username": get_config_data("VALID_USERNAME"),
                             "password": get_config_data("VALID_PASSWORD")
                           })

  response = https.request(request)
  object = JSON.parse(response.read_body, object_class: OpenStruct)
  return object.data.token
end