
class Api


    def self.fetch_quotes
        url = "https://seinfeld-quotes.herokuapp.com/quotes"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        quotes = JSON.parse(response)["quotes"]
    end


    def self.create_quotes
        self.fetch_quotes.each{|quote| Quote.new(quote["quote"], quote["author"], quote["season"], quote["episode"])}
    end
end