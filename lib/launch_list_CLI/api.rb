require 'httparty'

class API 
    
    def get_data
     resp =  HTTParty.get('https://launchlibrary.net/1.3/launch')
     resp.parsed_response
    end

    
end
