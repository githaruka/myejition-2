class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(dictionary_id: params[:dictionary_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @dictionary = Dictionary.find(params[:dictionary_id])
    @like = Like.find_by(dictionary_id: params[:dictionary_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path) 
  end
end
