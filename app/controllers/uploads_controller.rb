class UploadsController < ApplicationController
  before_action :authenticate_user!
  before_action :timeout

  def avatar
    avatar = Avatar.new(body: params[:attachments].first)

    if avatar.save
      avatar_url = avatar.body.thumb.url
      current_user.update(avatar_id: avatar.id, avatar_url: avatar_url)
      render json: Oj.dump([avatar_url])
    else
      render json: {msg: avatar.errors.full_messages.join(", ")}
    end
  end

  private
    def timeout
      if current_user.role != 'admin' && current_user.avatar && (current_user.avatar.created_at > DateTime.now - 10.second rescue nil)
        render json: {msg: "Аватар нельзя обновлять чаще чем раз в 10 секунд"}, status: 422
      end
    end
end
