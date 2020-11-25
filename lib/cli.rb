require 'pry'
class Cli

        # I invoke the API inside of the start method. As soon as I initiate a new session of the class Cli,
        # it is gonna collect the data (Api.create_quotes) and get it ready for the application
    def start
        puts "\n*-------------------------------------*"
        puts "\nHello, Seinfeld's fan!"
        puts "\n*-------------------------------------*"
        sleep(1)
        puts ""
        puts "Are you ready for some laughs? (1-2)\n \n1. Yes \n2. No! Exit.\n"
        
        index = self.initial_input
        Api.create_quotes
        # Had to use a class variable to invoke the data as a list of authors with unique values (the data has repeated authors names)
        @@authors = Quote.all.map{|quote| quote.author}.uniq
        Quote.display_list_of_authors
        index = self.secondary_input
        # Had to use the class variable authors and the index for each author to list out the quotes by authors after user input
        self.display_quotes_by_authors(@@authors[index])
        puts ""
        self.another_quote?
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def self.authors
        @@authors
    end

    # takes the input, then store it and use it to execute the logic
    def initial_input
        # grabs the user's input and store it before passing it to the method
        input = gets.chomp
        index = input_to_index(input)

        if !index.between?(0,1)
            puts "\nPlease, select a number between 1 and 2".colorize(:light_red)
            self.initial_input
        elsif index == 1
            goodbye
            exit
        end
        index
    end

    def secondary_input
        input = gets.chomp
        index = input_to_index(input)

        if !index.between?(0,37)
            puts "\nPlease, select a number from the list".colorize(:light_red)
            self.secondary_input
        else 
            index.between?(0,37)
            self.display_quotes_by_authors(@@authors[index])
        end
        index
    end

    def another_quote?
        puts "Would you like to see other quotes? (1-2)"
        puts "1. Yes"
        puts "2. No. Exit."
        input = gets.chomp
        index = input_to_index(input)

        if index == 0
            Quote.clear_all
            puts ""
            Api.create_quotes
            Quote.display_list_of_authors
            index = self.secondary_input
            self.display_quotes_by_authors(@@authors[index])
            puts ""
            self.another_quote?
        elsif index == 1
            goodbye
        else
            invalid_entry
            self.another_quote?
        end
    end

    def goodbye
        puts "  \nThat's a shame!\n       No soup for you!\n".colorize(:red)
    end

    def invalid_entry
        puts "\nInvalid entry. Try a number.\n".colorize(:light_red)
        sleep(1)
    end


    def display_quotes_by_authors(name)
        # Had to create a variable to store list of authors, to keep track of them and use them a little bit more in the block, after iterating over the all array in the Quote class, accessing each quote, telling it to list it by the name(author)
        # Then I use a if/else statement to list the quotes according to how many quotes each author has. If it has more than 10 quotes, then I ask it to list only 10.
        seinfeld = Quote.all.select{|quote| quote.author == name}

        if seinfeld.length > 10
            seinfeld[1..10].each{|quote| puts "\nQuote: ''#{quote.quote.blue}''\n Author: #{quote.author}\n Season: #{quote.season}\n Episode: #{quote.episode}\n"}
        else
            seinfeld.each{|quote| puts "\nQuote: ''#{quote.quote.blue}''\n Author: #{quote.author}\n Season: #{quote.season}\n Episode: #{quote.episode}\n"}
        end 
    end
end