require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      @req = req
      if !req.cookies.empty?
        cookie = req.cookies.find {|cookie| cookie.name == "_rails_lite_app"}.value
        @cookie_hash = JSON.parse(cookie)
      else
        #add cookie

        # @cookie_hash = JSON.parse(cookie)
      end
    end

    def [](key)
      return @cookie_hash[key]
    end

    def []=(key, val)
      if @cookie_hash.nil?
        @cookie_hash = Hash.new
      end
        @cookie_hash[key] = val

    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
        res.cookies << WEBrick::Cookie.new("_rails_lite_app", @cookie_hash.to_json)
    end

  end
end
