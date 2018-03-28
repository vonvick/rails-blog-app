require 'jwt'

class JsonWebToken
  class << self
    def encode payload
      payload.reverse_merge!(meta)
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode token
      body = JWT.decode(token , Rails.application.secrets.secret_key_base)
    end

    def valid_payload payload
      if expired(payload) || payload['issuer'] != meta[:issuer] || payload['client'] != meta[:client]
        return false
      else
        return true
      end
    end

    def meta
      {
        exp: 24.hours.from_now.to_i,
        issuer: 'issuing agent',
        client: 'client agent'
      }
    end

    def expired payload
      Time.at(payload['exp']) < Time.now
    end
  end
end