class StampsController < ApplicationController
  def index
    @stamp_topics = current_user.stamp_topics
  end

  def create
    stamp = Stamp.new
    stamp.user_id = current_user.id
    stamp.topic_id = params[:topic_id]

    if stamp.save
      redirect_to topics_path, success: 'スタンプを押しました'
    else
      redirect_to topics_path, danger: 'スタンプを押せませんでした'
    end
  end
  
  def destroy
    Stamp.find_by(topic_id: params[:topic_id], user_id: current_user.id).destroy
    flash[:success] = "スタンプを消しました"
    redirect_to topics_path
  end
end