require_relative "api"
#require 'pry'
class Launch


    attr_accessor :name, :location_name, :blurb, :date, :loc_link, :id
    @@all = []


    def initialize        
        @@all << self  
    end

    def self.load
        API.get_data.each do |data|
            launch = Launch.new
            launch.name = data["name"]
            launch.location_name = data["location"]["pads"][0]["name"]
            launch.blurb = data["missions"]&[0]&["description"]
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
        puts "Description: #{location.blurb}"
        puts "Potential Date: #{location.date}"
        puts "Location URL: #{location.loc_link}"
    
    end



end



 
Launch.load
Launch.print_list