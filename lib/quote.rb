
class Quote
    attr_accessor :quote, :author, :season, :episode

    @@all = []

    def initialize(quote, author, season, episode)
        @quote = quote
        @author = author
        @season = season
        @episode = episode
        @@all << self
    end


    def self.all
        @@all
    end

    def self.clear_all
        @@all = []
    end

    def self.display_list_of_authors
        puts "\nPlease, choose one of the following characters' number to see its quotes:\n"
        self.all.map{|quote| quote.author}.uniq.each_with_index {|name, index| puts "#{index + 1 }. #{name}"}
    end
end