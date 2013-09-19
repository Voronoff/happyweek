class AddDescriptionToDealAndVenue < ActiveRecord::Migration
  def change
  	add_column :deals, :description, :text
  	add_column :venues, :description, :text
  end
end
