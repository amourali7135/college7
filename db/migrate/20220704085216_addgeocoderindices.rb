class Addgeocoderindices < ActiveRecord::Migration[7.0]
  def change
    add_index :programs, [:latitude, :longitude]
    add_index :users, [:latitude, :longitude]
  end
end
