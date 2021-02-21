require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://dad-jokes.p.rapidapi.com/random/joke")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-key"] = '671f2a6f42mshcfc662212e14b70p170b00jsn4ef8525ed5db'
request["x-rapidapi-host"] = 'dad-jokes.p.rapidapi.com'

JOKE = http.request(request)
