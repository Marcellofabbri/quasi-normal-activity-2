class UsersController < ApplicationController
  def show
    @user = User.find_by(username: current_user.username)
    @categories = @user.categories
    @handle = handle(@user)
    @story = Story.new
  end

  def handle(user)
    user.username + "#{user.id}"
  end
end