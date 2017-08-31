class Kele 

@authToken    

def new (baseUri, email, password)
    @baseUri =  baseUri
    @email = email
    @password = password

    @authToken = self.class.post(baseUri, body: {login_email_address: email, login_password: password})
end


def get_me
    response = self.class.get(baseUri, headers: { "authorization" => @authToken })
    return JSON.parse(response)
end

end