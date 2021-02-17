class UsersController < ApplicationController
  def show
    @dictionary = Dictionary.find(params[:id])
    @user = @dictionary.user
    #@user = User.find(params[:id])
    @dictionaries = @user.dictionaries
  end
end
