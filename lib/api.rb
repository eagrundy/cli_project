
class Api

# This is where I bring in the API and consume it.
# I created a fetch_quotes method. Used JSON to parse the response and return the "quotes" values key
    def self.fetch_quotes
        url = "https://seinfeld-quotes.herokuapp.com/quotes"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        quotes = JSON.parse(response)["quotes"]
    end

# pull the data I want after creating new objects with the data
    def self.create_quotes
        self.fetch_quotes.each{|quote| Quote.new(quote["quote"], quote["author"], quote["season"], quote["episode"])}
    end
end