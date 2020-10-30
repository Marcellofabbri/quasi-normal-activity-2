class PagesController < ApplicationController
  def home
  end

  def user_home
    @page = Page.new(params[:user_id])
  end
end