class PagesController < ApplicationController
  def home
    @user = User.find_by(username: current_user.username)
    @current_user_handle = @user.username + "#{@user.id}"
    print(@current_user_handle)
  end

  def user_home
    @page = Page.new(params[:user_id])
  end
end