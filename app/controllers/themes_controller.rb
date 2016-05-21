class ThemesController < ApplicationController
  include Spa

  before_action :set_title_and_description, only: [:show]

  private
    def set_model
      @model = Theme.order(:created_at)
    end

    def set_title_and_description
      @title = @resource.title
    end

    def redirect_options
      {
        create: {
          redirect_to_url: root_path
        },
        update: {
          redirect_to_url: root_path
        }
      }
    end

    def resource_params
      params.require(:theme).permit(:title, :group_id)
    end
end
