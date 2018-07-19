class ChangeColumnDurationToMovie < ActiveRecord::Migration
  def change
  	remove_column :movies, :duration
  	add_column :movies, :duration, :integer
  end
end
