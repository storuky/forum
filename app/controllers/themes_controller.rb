class ThemesController < ApplicationController
  include Spa

  private
    def set_model
      @model = Theme.order(:created_at)
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
