require 'pry'
class Cli

    @@authors = ["jerry", "elaine", "george", "kramer", "newman"]

    def start
        puts ""
        puts "Hello, Seinfeld's fan!".underline
        puts ""
        puts "Please, choose one of the following characters to see its quotes: (1-5)"
        puts ""
        # binding.pry
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
        else
            puts ""
            goodbye
        end
    end
  
    def initial_input
        input = gets.chomp
        index = input_to_index(input)

        if !index.between?(0,4)
            puts "Please, select a number between 1 and 5"
            self.initial_input
        end
        index
    end

    def goodbye
        puts "  That's a shame!\n      Goodbye!".red
    end

    def self.authors
        @@authors
    end


    def display_authors
        Cli.authors.each_with_index{|author, index| puts " #{index+1}. #{author.capitalize}"}
    end
end


    # def display_authors(author)
    #         seinfeld = Quote.find[author]
    #         seinfeld.each do |s|
    #          puts " Quote: #{s.quote}"
    #          puts " Author: #{s.author}"
    #          puts " Season: #{s.season}"
    #          puts " Episode: #{s.episode}"
    #         end
    #         
    #     end 


    #     qt = Quote.find_by_name(quote)
    #     qt.each{|quote| puts "\nQuote: '#{quote.quote}'\n Author: #{quote.author}\n Season: #{quote.season}\n Episode: #{quote.episode}\n"}
    # end

      #     # self.authors_list
    #     binding.pry
        # Quote.all.map{|quote| quote.author}.uniq.each_with_index {|name, index| puts "#{index+ 1 }. #{name}"}