class HomesController < ApplicationController
  def top
    @recipes = Recipe.order(created_at: :desc).limit(1)
  end
  
end
