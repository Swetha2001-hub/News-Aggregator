class LikesController < ApplicationController
    before_action :require_login
  
    def create
      @likeable = find_likeable
      existing_like = @likeable.likes.find_by(user: current_user)
  
      if existing_like
        if existing_like.like_type == params[:like_type].to_i
          existing_like.destroy # Remove like/dislike if clicked again
        else
          existing_like.update(like_type: params[:like_type])
        end
      else
        @likeable.likes.create(user: current_user, like_type: params[:like_type])
      end
  
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path }
        format.turbo_stream
      end
    end
  
    private
  
    def find_likeable
      params[:likeable_type].constantize.find(params[:likeable_id])
    end
  end
  