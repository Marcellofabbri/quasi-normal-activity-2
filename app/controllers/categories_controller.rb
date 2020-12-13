class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def delete
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(name: params[:category][:name], image: params[:category][:image])
    redirect_to current_user_profile_path
  end

  def destroy
    category = Category.destroy(params[:id])
    head :no_content
  end

  def show
    @categories = Category.all.select { |category| category.user_id == current_user.id }
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