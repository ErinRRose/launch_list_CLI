require 'colorize'

class LaunchListCLI::CLI
    
    def start
        puts "Hello, Welcome to Launch List!".colorize( :cyan )
        LaunchListCLI::Launch.load #what happens if the load method doesn't work
        #assign @command variable
        @command = "L"
        #while @command is not exit
        while @command != "X"
            #run @command
            if @command == "L"
                show_list
            else
                show_detail(@command.to_i) 
            end

        end         
        #exit
        exit
    end

    def show_list
        puts "Here is a list of upcoming launches: ".colorize (:light_green)
        #print list 
        LaunchListCLI::Launch.print_list
        select_list
    end

    def show_detail(selection)
        #here is you selection
        puts "Here is your selection: ".colorize( :light_green )
        #show selection 
        LaunchListCLI::Launch.print_detail(selection)
        select_detail      
    end

    def select_list
        #loop until valid input
        loop do 
            puts ""
            puts "Please input your selection(1-10, X to exit): ".colorize (:light_cyan )
            #ask for choice
            #accept input
            @command = gets.strip.upcase
            #accept input
            if @command == "X" || @command.to_i.between?(1, 10)
                break
            end
        end      
    end

    def select_detail
        #loop until valid input
        loop do 
            puts ""
            puts "Please select(L) to see the list again or (X) to exit: ".colorize( :light_cyan )
            #ask for choice
            @command = gets.strip.upcase
            #accept input
            if @command == "X" || @command == "L"
                break
            end
        end
    end

    def exit
        #say goodbye
        puts "Thank you, goodbye!".colorize( :light_magenta )
    end
end