require 'colorize'
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

    def self.display_quotes
        self.all.each{|quote| puts "\nQuote: ''#{quote.quote.blue}''\n Author: #{quote.author}\n Season: #{quote.season}\n Episode: #{quote.episode}\n"}
    end


    def self.find_by_name(author)
        self.all.select do |quote|
        quote.name == author
        end
    end
end