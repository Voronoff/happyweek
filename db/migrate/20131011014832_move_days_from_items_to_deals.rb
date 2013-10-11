class MoveDaysFromItemsToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :sunday, :boolean
    add_column :deals, :monday, :boolean
    add_column :deals, :tuesday, :boolean
    add_column :deals, :wednesday, :boolean
    add_column :deals, :thursday, :boolean
    add_column :deals, :friday, :boolean
    add_column :deals, :saturday, :boolean

    remove_column :items, :sunday, :boolean
    remove_column :items, :monday, :boolean
    remove_column :items, :tuesday, :boolean
    remove_column :items, :wednesday, :boolean
    remove_column :items, :thursday, :boolean
    remove_column :items, :friday, :boolean
    remove_column :items, :saturday, :boolean
  end
end
