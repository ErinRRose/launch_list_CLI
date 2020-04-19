#require 'pry'
require 'colorize'
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
        puts "#{idx+1}:".colorize( :light_cyan ) 
        puts "#{launch.name}, #{launch.location_name}"
        end
    end

    def self.print_detail(selection)
        launch = @@all[selection-1]
        puts ""
        puts "Name:".colorize ( :light_cyan ) 
        puts "#{launch.name}"
        puts ""
        puts "Location:".colorize ( :light_cyan )
        puts "#{launch.location_name}"
        puts ""
        puts "Description:".colorize ( :light_cyan )
        puts "#{launch.blurb}"
        puts ""
        puts "Potential Date:".colorize ( :light_cyan )
        puts "#{launch.date}"
        puts ""
        puts "Location URL:".colorize ( :light_cyan )
        puts "#{launch.loc_link}"
    end



end



 
#LaunchListCLI::Launch.load
#Launch.print_list