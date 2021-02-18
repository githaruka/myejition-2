class ContentsController < ApplicationController
  before_action :set_dictionary, except: [:show, :destroy]
  def new
    @content = Content.new
    #@dictionary = Dictionary.find(params[:dictionary_id])
  end

  def create
    #@dictionary = Dictionary.find(params[:dictionary_id])
    @content = Content.new(content_params)    
    if @content.save
      redirect_to dictionary_path(@dictionary)
    else
      render :new
    end
  end

  def show
    @content = Content.find(params[:id])
    @dictionary = @content.dictionary
    #@search = Content.ransack(params[:q])
    #@contents = @search.result
  end
  

  def edit
    #@dictionary = Dictionary.find(params[:dictionary_id])
    @content = Content.find(params[:id])
    #if current_user.id != @dictionary.user_id 
      #redirect_to root_path
    #end
  end

  def update
    #@dictionary = Dictionary.find(params[:dictionary_id])
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to dictionary_content_path(@dictionary, @content)
    else
      rencer :edit
    end
  end

  def destroy
    @dictionary = Dictionary.find(params[:id])
    @content = Content.find(params[:id])
    if current_user.id == @dictionary.user_id
      @content.destroy
      redirect_to dictionary_path(@dictionary)
    end
  end

  private

  def content_params
    params.require(:content).permit(:phrase, :content_mean, :phrase_reference).merge(dictionary_id: @dictionary.id)
  end

  def set_dictionary
    @dictionary = Dictionary.find(params[:dictionary_id])
  end
end
