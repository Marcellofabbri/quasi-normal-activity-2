class UsersController < ApplicationController
  def show
    @user = User.find_by(username: current_user.username)
    @categories = @user.categories
    @handle = handle(@user)
    @stories = stories
  end

  def handle(user)
    user.username + "#{user.id}"
  end

  def stories
    allStories = []
    @categories.each do |category|
      category.stories.each do |story|
        allStories.push(story)
      end
    end
    return allStories
  end

end