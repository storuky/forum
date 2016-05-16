module Spa
  extend ActiveSupport::Concern

  included do
    before_action :set_model
    before_action :set_resource, only: [:show, :edit, :update, :destroy]

    def index
      respond_to do |format|
        format.html
        format.json {
          if params[:filter]
            filter_params = params.require(:filter).permit(filter_fields)
            collection = @model.where(filter_params)
          else
            collection = @model
          end

          render json: Oj.dump({
            total_count: collection.count,
            serializer: serializer,
            collection: collection.page(params[:page]).per(20).pluck(*pluck_fields),
            page: params[:page] || 1
          })
        }
      end
    end

    def show
      respond_to do |format|
        format.html
        format.json {
          @resource = @model.where(id: params[:id]).pluck(*pluck_fields)
          
          render json: Oj.dump({
            collection: @resource,
            serializer: serializer,
            single: true
          })
        }
      end
    end

    def new
      new_params = resource_params rescue {}
      @resource = @model.new(new_params)
      authorize @resource, :create?

      respond_to do |format|
        format.html
        format.json {
          render json: Oj.dump(@resource)
        }
      end
    end

    def edit
      authorize @resource, :update?
      respond_to do |format|
        format.html
        format.json {
          render json: Oj.dump(@resource)
        }
      end
    end

    def create
      @resource = @model.new resource_params
      authorize @resource

      if @resource.save
        @collection = @model.where(id: @resource.id).pluck(*pluck_fields)
        result = {
          collection: @collection,
          serializer: serializer,
          single: true,
        }.merge(redirect_options[:update] || {})
        
        render json: Oj.dump(result)
      else
        render json: {errors: @resource.errors, msg: @resource.errors.full_messages.join(', ')}, status: 422
      end
    end

    def update
      authorize @resource
      if @resource.update(resource_params)
        render json: {resource: @resource, msg: "#{@model.name} успешно обновлен"}.merge(redirect_options[:update] || {})
      else
        render json: {errors: @resource.errors, msg: @resource.errors.full_messages.join(', ')}, status: 422
      end
    end

    def destroy
      authorize @resource
      @resource.destroy
      render json: {msg: "#{@model.name} успешно удален"}
    end

    private
      def set_resource
        @resource = @model.find(params[:id])
      end

      def pluck_fields
        @model.pluck_fields
      end

      def check_auth
        unless current_user
          render json: {msg: "Вы не авторизованы"}, status: 403
        end
      end

      def redirect_options
        {}
      end

      def serializer
        serializer = "#{@model.model_name}Serializer"
      end
  end
end