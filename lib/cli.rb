require 'pry'
class Cli

    def start
        puts "\n*-------------------------------------*"
        puts "\nHello, Seinfeld's fan!"
        puts "\n*-------------------------------------*"
        sleep(1)
        puts ""
        puts "Are you ready for some laughs? (1-2)\n \n1. Yes \n2. No! Exit\n"
        
        index = self.initial_input
        Api.create_quotes
        @@authors = Quote.all.map{|quote| quote.author}.uniq
        Quote.display_list_of_authors
        index = self.secondary_input
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

    def initial_input
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
        puts "2. No"
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
        puts "\nInvalid entry. Try again.\n".colorize(:light_red)
        sleep(1)
    end


    def display_quotes_by_authors(name)
        seinfeld = Quote.all.select{|quote| quote.author == name}

        if seinfeld.length > 10
            seinfeld[1..10].each{|quote| puts "\nQuote: ''#{quote.quote.blue}''\n Author: #{quote.author}\n Season: #{quote.season}\n Episode: #{quote.episode}\n"}
        else
            seinfeld.each{|quote| puts "\nQuote: ''#{quote.quote.blue}''\n Author: #{quote.author}\n Season: #{quote.season}\n Episode: #{quote.episode}\n"}
        end 
    end
end