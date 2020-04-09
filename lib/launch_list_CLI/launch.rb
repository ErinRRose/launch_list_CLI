require_relative "api"
class Launch


    attr_accessor :name, :location_name, :blurb, :date, :loc_link, :id
    @@all = []

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

    def iniitalize        
        @@all << self  
    end

    def self.print_list
        @@all.each_with_index do |launch, idx|
        puts "#{idx+1}: #{launch.name}, #{launch.location_name}"
        binding.pry
        end
    end


end


 
