class Addslugtotrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trails, :slug, :string
  end
end
