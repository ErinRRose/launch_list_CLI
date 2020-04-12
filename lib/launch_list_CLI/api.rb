class LaunchListCLI::API 
    
    def self.get_data
     resp =  HTTParty.get('https://launchlibrary.net/1.3/launch?mode=verbose')
     resp.parsed_response["launches"]
    end

    
end
