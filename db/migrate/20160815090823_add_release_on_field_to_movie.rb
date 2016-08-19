class AddReleaseOnFieldToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :release_on, :datetime
  end
end
