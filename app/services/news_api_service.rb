 'httparty'
 require 'dotenv/load' 

class NewsApiService
  BASE_URL = "https://newsapi.org/v2/top-headlines"

  def self.fetch_news(category = "general")
    response = HTTParty.get(BASE_URL, query: {
      country: "us",
      category: category,
      apiKey: ENV["NEWS_API_KEY"] 
    })

    if response.success?
      response["articles"]
    else
      []
    end
  end
end
