class AddSlugToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :slug, :string
  end
end
