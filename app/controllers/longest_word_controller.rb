class LongestWordController < ApplicationController
  def game
    @grid = generate_grid.join(" ")
  end

  def score
    attempt = params[:query]
    grid = @grid
    result = run_game(attempt, grid, 10, 15)
    @result = result[:score], result[:message]
  end

  def generate_grid
  Array.new(9) { ('A'..'Z').to_a[rand(26)] }
  end

  def run_game(attempt, grid, start_time, end_time)
    result = {}
    result[:score], result[:message] = score_and_message(grid)
    result
  end

  def score_and_message(grid)
    if params[:query]
      score = compute_score
      [score, "well done"]
    else
      [0, "not in the grid"]
    end
  end

  def compute_score
    params[:query].size * 3
  end

end
