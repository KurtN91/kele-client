require "httparty"
require "roadmap"

class Kele 
    include HTTParty
    include roadmap

    def new (email, password)
        @email = email
        @password = password
        initialize(email, password)
    end
    
    def initialize (email, password)
        @base_uri =  'https://www.bloc.io/api/v1'
        response = Kele.post("#{@base_uri}/sessions", body: {email: @email, password: @password})
        puts response
        if response && response["auth_token"] 
            @auth_token = response["auth_token"]
            puts "#{email} was logged in"
        else
            puts "login failed yo"
        end
    end
    
    
    def get_me
        response = self.class.get(@base_uri, headers: { "authorization" => @auth_token })
        return JSON.parse(response)
    end

    def get_mentor (id)
        @id = id
        response = self.class.get(@base_uri, headers: { "authorization" => @auth_token }, body: {id: @id})
        return JSON.parse(response)
    end

end