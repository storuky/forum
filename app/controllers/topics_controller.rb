class TopicsController < ApplicationController
  include Spa
  before_action :timeout, only: :create

  before_action :set_title_and_description, only: [:show]

  private
    def set_model
      @model = Topic.joins(:theme, :user).order("topics.updated_at DESC")
    end

    def set_title_and_description
      @title = @resource.title
      @description = @resource.content
    end

    def filter_fields
      [:theme_id]
    end

    def redirect_options
      {
        create: {
          redirect_to_url: topic_path(@resource)
        },
        update: {
          redirect_to_url: topic_path(@resource)
        }
      }
    end

    def resource_params
      params.require(:topic).permit(:title, :content, :theme_id)
      .merge({
        user_id: current_user.id
      })
    end

    def timeout
      if current_user.role != 'admin' && current_user.topics_count > 0 && (current_user.topics.last.created_at > DateTime.now - 30.second rescue false)
        render json: {msg: "#{@model.model_name} нельзя создавать чаще чем раз в 10 секунд"}, status: 422
      end
    end
end
