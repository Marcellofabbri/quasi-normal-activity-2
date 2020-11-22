class StoriesController < ApplicationController
  def new
    @story = Story.new
    @months = create_array_of_numbers(1, 12, true)
    @years = create_array_of_numbers(1900, Time.new.year, false)
  end

  def create
    @story = Story.new(story_params_with_timestamp)
    if @story.save
      redirect_to current_user_profile_path
    else
      render :new
    end
  end

  private

  def timestamp
    month = params[:month]
    year = params[:year]
    return Time.new(year.to_i, month.to_i, 10)
  end

  def story_params
    params.require(:story).permit(:title, :body, :month, :year, :category_id)
  end

  def story_params_with_timestamp
    { "title" => params[:title],
      "body" => params[:body],
      "timestamp" => timestamp,
      "category_id" => params[:category_id]
    }
  end

  def create_array_of_numbers(from, to, ascending)
    n = from;
    array = []
    while n <= to do
      array.push(n)
      n += 1
    end
    if ascending
      return array
    else
      return array.reverse
    end
  end

  def current_user_profile_path
    "/#{current_user.username} #{current_user.id}"
  end
end
