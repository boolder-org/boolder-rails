
require 'jwt'

payload = {
    "alg": "ES256",
    "kid": "Z6GNAP797T", # key id
    "typ": "JWT"
}

header = {
    "iss": "8Y46BCZUL9", # team id
    "iat": 1611565416, # Time.now.to_i
    "exp": 1927098250, # (Time.now + 10.years).to_i
     # "origin": "https://mywebsite.org"
}

ecdsa_key = OpenSSL::PKey::EC.new File.read(Rails.root.join('config', 'apple-maps', 'AuthKey_Z6GNAP797T.p8'))

ecdsa_public = OpenSSL::PKey::EC.new ecdsa_key
ecdsa_public.private_key = nil


token = JWT.encode payload, ecdsa_key, 'ES256', header

puts token

decoded_token = JWT.decode token, ecdsa_public, true, { algorithm: 'ES256' }
puts decoded_token






# token 
eyJpc3MiOiI4WTQ2QkNaVUw5IiwiaWF0IjoxNjExNTY1NDE2LCJleHAiOjE5MjcwOTgyNTAsImFsZyI6IkVTMjU2In0.eyJhbGciOiJFUzI1NiIsImtpZCI6Ilo2R05BUDc5N1QiLCJ0eXAiOiJKV1QifQ.DBfKNep2qzLtIh7QJ15I7XyChXQsN1nntPmSFZsNOProHgB7npdz4xEnma8uhorftlR3AWq_HIS1lVsKz1Pqkw