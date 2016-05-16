class SearchController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json {
        collection = Post.look_for(params[:q]).joins(:user, :topic).order("created_at DESC")
        render json: Oj.dump({
          total_count: collection.count,
          serializer: "PostSerializer",
          collection: collection.page(params[:page]).per(10).pluck(*Post.pluck_fields),
          page: params[:page] || 1
        })
      }
    end
  end
end
