require "net/http"
require "uri"

url = URI.parse("http://www.baidu.com/index")
http = Net::HTTP.start(url.host,url.port)
doc = http.get(url.path)
puts doc
