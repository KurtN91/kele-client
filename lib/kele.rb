class Kele 

@authToken    

def initialize (baseUri, email, password)
    @baseUri =  baseUri
    @email = email
    @password = password

    @authToken = self.class.post(baseUri, body: {login_email_address: email, login_password: password})
end


end