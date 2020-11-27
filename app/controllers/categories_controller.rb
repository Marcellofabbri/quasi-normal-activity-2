class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def delete
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to current_user_profile_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :image)
  end

  def current_user_profile_path
    "/#{current_user.username} #{current_user.id}"
  end

end