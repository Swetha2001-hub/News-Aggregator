class ArticlesController < ApplicationController
  def index
    @category = params[:category] || "general"
    @articles = NewsApiService.fetch_news(@category)

    # Apply search filter if a query is provided
    if params[:query].present?
      search_term = params[:query].downcase
      @articles.select! { |article| article["title"].downcase.include?(search_term) }
    end

    # Fetch trending articles (saved at least once)
    @trending_articles = Favorite.select("article_title, article_url, COUNT(*) as save_count")
                                 .group("article_title, article_url")
                                 .having("COUNT(*) >= 1")
                                 .order("save_count DESC")
                                 .limit(5)

    # Apply pagination
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(5)

    Rails.logger.info "Trending Articles: #{@trending_articles.inspect}"
  end
end
