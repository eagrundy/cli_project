require 'pry'
class Cli

    @@authors = ["jerry", "elaine", "george", "kramer", "newman"]

    def start
        # puts ""
        puts "\n*-------------------------------------*"
        puts "\nHello, Seinfeld's fan!"
        puts "\n*-------------------------------------*"
        sleep(1)
        puts ""
        puts "Please, choose one of the following characters to see its quotes: (1-5)"
        puts ""
        self.display_authors
        index = self.initial_input
        # here the code that selects by author
        Api.create_quotes
        Quote.display_quotes
        puts ""
        self.another_quote?
    end

    def input_to_index(input)
        input.to_i - 1
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
            puts "Please, choose one of the following characters to see its quotes: (1-5)"
            
            puts ""
            self.display_authors
            index = self.initial_input
        # here the code that select by author
            Api.create_quotes
            Quote.display_quotes
            puts ""
            self.another_quote?
        elsif index == 1
            goodbye
        else
            invalid_entry
            self.another_quote?
        end
    end
  
    def initial_input
        input = gets.chomp
        index = input_to_index(input)

        if !index.between?(0,4)
            puts "Please, select a number between 1 and 5".colorize(:light_red)
            self.initial_input
        end
        index
    end

    def goodbye
        puts "  \nThat's a shame!\n       Goodbye!\n".colorize(:red)
    end

    def invalid_entry
        puts "\nInvalid entry. Try again.\n".colorize(:light_red)
        sleep(1)
    end

    def self.authors
        @@authors
    end


    def display_authors
        Cli.authors.each_with_index{|authors, index| puts " #{index + 1}. #{authors.capitalize}"}
        # Quote.all.map{|quote| quote.author}.uniq.each_with_index {|name, index| puts "#{index + 1 }. #{name}"}
        # Quote.all.each_with_index do |quote, index|
        #     puts "#{index + 1}. #{quote.author}"
    end
end