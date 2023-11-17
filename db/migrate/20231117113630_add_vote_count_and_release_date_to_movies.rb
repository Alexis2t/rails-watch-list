class AddVoteCountAndReleaseDateToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :vote_count, :integer
    add_column :movies, :release_date, :date
  end
end
