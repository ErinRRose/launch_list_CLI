#require 'pry'
class LaunchListCLI::Launch
    

    attr_accessor :name, :location_name, :blurb, :date, :loc_link, :id
    @@all = []


    def initialize        
        @@all << self  
    end

    def self.load
        LaunchListCLI::API.get_data.each do |data|
            launch = LaunchListCLI::Launch.new
            launch.name = data["name"]
            launch.location_name = data["location"]["pads"][0]["name"]
            if data["missions"].length >= 1
                launch.blurb = data["missions"][0]["description"]
            else
                launch.blurb = "No data available."
            end
            launch.loc_link = data["location"]["pads"][0]["mapURL"]
            launch.date = data["net"]
            launch.id = data["id"]
        end

    end

    

    def self.print_list
        @@all.each_with_index do |launch, idx|
        puts "#{idx+1}: #{launch.name}, #{launch.location_name}"
        end
    end

    def self.print_detail(selection)
        launch = @@all[selection-1]
        puts "Name: #{launch.name}"
        puts "Location: #{launch.location_name}"
        puts "Description: #{launch.blurb}"
        puts "Potential Date: #{launch.date}"
        puts "Location URL: #{launch.loc_link}"
    
    end



end



 
#LaunchListCLI::Launch.load
#Launch.print_list