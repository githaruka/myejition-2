class DictionariesController < ApplicationController
  before_action :dictionary_substitution, except: [:index, :new, :create, :search]

  def index
    @search = Dictionary.ransack(params[:q])
    @dictionaries = @search.result
    #category_id = params[:q][:category_id_eq]
    #@category = Category.find_by(id: category_id)

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
    @contents = @dictionary.contents
    @likes = Like.where(dictionary_id: @dictionary.id)
    if user_signed_in?
      @like = Like.find_by(user_id: current_user.id, dictionary_id: @dictionary.id)
    end
  end

  def edit
    if current_user.id != @dictionary.user_id
      redirect_to root_path
    end
  end

  def update
    if @dictionary.update(dictionary_params)
      redirect_to dictionary_path(@dictionary)
    else
      render :edit
    end
  end

  def destroy
    @contents = @dictionary.contents
    if current_user.id == @dictionary.user_id
      @contents.destroy
      @dictionary.destroy
      redirect_to user_path(current_user)
    else
      redirect_to dictionary_path(@dictionary)
    end
  end

  def search
    @dictionaries = @q.result(distinct: true)
  end

  private

  def dictionary_params
    params.require(:dictionary).permit(:name,:info,:category_id).merge(user_id: current_user.id)
  end

  def dictionary_substitution
    @dictionary = Dictionary.find(params[:id])
  end

end
