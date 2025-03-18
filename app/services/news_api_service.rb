 'httparty'

class NewsApiService
  BASE_URL = "https://newsapi.org/v2/top-headlines"

  def self.fetch_news(category = "general")
    response = HTTParty.get(BASE_URL, query: {
      country: "us",
      category: category,
      apiKey: "e9eb3708b4f5485fbdc4550f01f5230d"
    })

    if response.success?
      response["articles"]
    else
      []
    end
  end
end
