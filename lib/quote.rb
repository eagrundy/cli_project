
class Quote
    # Creating reader and writter for these properties that I am receiving from the Api call. I am grabbing these.
    attr_accessor :quote, :author, :season, :episode

    @@all = []

    def initialize(quote, author, season, episode)
        @quote = quote
        @author = author
        @season = season
        @episode = episode
        @@all << self
    end

    # Creating a class method so I can read the all array
    def self.all
        @@all
    end

    # Creating a class method to clear data from the screen once the user chooses to go back and see other quotes
    def self.clear_all
        @@all = []
    end

    # Iterates over the all array and use method map to go over the quotes, list them using the authors with the index + 1
    def self.display_list_of_authors
        puts "\nPlease, choose one of the following characters' number to see its quotes:\n"
        self.all.map{|quote| quote.author}.uniq.each_with_index {|name, index| puts "#{index + 1 }. #{name}"}
    end
end