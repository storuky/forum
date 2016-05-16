class PostsController < ApplicationController
  include Spa
  before_action :timeout, only: :create

  private
    def set_model
      @model = Post.joins(:user, :topic).order(:created_at)
    end

    def filter_fields
      [:theme_id, :topic_id]
    end

    def resource_params
      topic = Topic.find(params[:post][:topic_id])
      title = params[:post][:title]

      params.require(:post).permit(:content, :title, :topic_id)
      .merge({
        theme_id: topic.theme_id,
        user_id: current_user.id,
        title: title.present? ? title : "Re: #{topic.title}"
      })
    end

    def timeout
      if current_user.role != 'admin' && current_user.posts_count > 0 && (current_user.posts.last.created_at > DateTime.now - 10.second rescue nil)
        render json: {msg: "#{@model.model_name} нельзя создавать чаще чем раз в 10 секунд"}, status: 422
      end
    end
end
