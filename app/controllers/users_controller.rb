class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @dictionaries = @user.dictionaries
  end
end
