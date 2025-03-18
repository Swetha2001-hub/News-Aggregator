class ArticleMailer < ApplicationMailer
    default from: "notifications@newsaggregator.com"
  
    def new_article_notification(user, article)
      @user = user
      @article = article
      mail(to: @user.email, subject: "New Article in Your Favorite Category")
    end
  end
  