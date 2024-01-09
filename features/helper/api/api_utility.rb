def get_user_token(identifier, password)
  url = URI(get_config_data("endpoints")['login']['url'])

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Post.new(url)
  request["Content-Type"] = "application/json"
  request.body = JSON.dump({
                             :"identifier" => identifier,
                             :"password" => password
                           })

  response = https.request(request)
  object = JSON.parse(response.read_body, object_class: OpenStruct)
  object.data.token
end
