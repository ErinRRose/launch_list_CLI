require_relative "launch"

class CLI
    
    def start
        puts "Hello, Welcome to Launch List!"
        Launch.load #what happens if the load method doesn't work
        show_list

    end

    def show_list
        puts "Here is a list of upcoming launches: "
        #print list 
        Luanch.print_list
        select_list
    end

    def show_detail(selection)
        #here is you selection
        puts "Here is your selection: "
        #show selection 
        Launch.print_detail(selection)
        select_detail      
    end

    def select_list
        #loop until valid input
        loop do 
            puts "Please input your selection(1-10, X to exit): "
            #ask for choice
            #accept input
            command = gets.strip.upcase
            #accept input
            if command == "X" || command.to_i.between?(1, 10)
                break
            end
        end
        if command == "L"
            show_list
        else 
            exit
        end
    end

    def select_detail
        #loop until valid input
        loop do 
            puts "Please select(L) to see the list again or (X) to exit: "
            #ask for choice
            command = gets.strip.upcase
            #accept input
            if command == "X" || command == "L"
                break
            end
        end
        if command == "L"
            show_list
        else 
            exit
        end
    end

    def exit
        #say goodbye
        puts "Thank you, goodbye!"
    end
end