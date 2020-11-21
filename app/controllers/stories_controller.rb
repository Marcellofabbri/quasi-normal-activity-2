class StoriesController < ApplicationController
  def new
    @story = Story.new
    @months = create_array_of_numbers(1, 12)
    @years = create_array_of_numbers(1900, Time.new.year)
  end

  private

  def create_array_of_numbers(from, to)
    n = from;
    array = []
    while n <= to do
      array.push(n)
      n += 1
    end
    return array
  end
end
