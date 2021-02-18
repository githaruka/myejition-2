class DictionariesController < ApplicationController
  before_action :dictionary_substitution, except: [:index, :new, :create]

  def index
    @dictionaries = Dictionary.order("created_at DESC").includes(:user)
    #@dictionary = Dictionary.find(params[:id])
    #@likes_count = Like.where(dictionary_id: @dictionary.id).count
  end

  def new
    @dictionary = Dictionary.new
  end

  def create
    @dictionary = Dictionary.new(dictionary_params)
    if @dictionary.save
      redirect_to dictionary_path(@dictionary)
    else
      render :new
    end
  end

  def show
    #@dictionary = Dictionary.find(params[:id])
    @contents = @dictionary.contents
    @likes = Like.where(dictionary_id: @dictionary.id)
    if user_signed_in?
      @like = Like.find_by(user_id: current_user.id, dictionary_id: @dictionary.id)
    end
    #@contents = Content.order("phrase ASC").includes(:dictionary)
  end

  def edit
    #@dictionary = Dictionary.find(params[:id])
    if current_user.id != @dictionary.user_id
      redirect_to root_path
    end
  end

  def update
    #@dictionary = Dictionary.find(params[:id])
    if @dictionary.update(dictionary_params)
      redirect_to dictionary_path(@dictionary)
    else
      render :edit
    end
  end

  def destroy
    #@dictionary = Dictionary.find(params[:id])
    @contents = @dictionary.contents
    if current_user.id == @dictionary.user_id
      @contents.destroy
      @dictionary.destroy
      redirect_to user_path(current_user)
    else
      redirect_to dictionary_path(@dictionary)
    end
  end

  private

  def dictionary_params
    params.require(:dictionary).permit(:name,:info,:category_id).merge(user_id: current_user.id)
  end

  def dictionary_substitution
    @dictionary = Dictionary.find(params[:id])
  end
end
