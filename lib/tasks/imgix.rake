require 'net/http'
require 'net/https' # for openssl

def head(path)
  uri = URI('https://boolder.imgix.net')

  response=nil
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  http.head(path)
end

namespace :imgix do
  
  task warmup: :environment do
    
    Topo.published.find_each do |topo|

      paths = [
        "/#{topo.photo.key}?ixlib=rails-4.2.0&#{Topo::IMGIX_LARGE.to_query}&dpr=1&q=75",
        "/#{topo.photo.key}?ixlib=rails-4.2.0&#{Topo::IMGIX_LARGE.to_query}&dpr=2&q=50",
      ]

      paths.each do |path|

        response = head(path)
        puts "Topo ##{topo.id}"
        puts path
        puts response["x-cache"]
        # response.each { |key, value| puts key.ljust(40) + " : " + value }

        sleep 1.0
      end
    end
  end
end