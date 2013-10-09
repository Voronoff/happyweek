class SplitDealsIntoDealsAndItems < ActiveRecord::Migration
  def change
    rename_table :deals, :items
    rename_column :items, :venue_id, :deal_id
    remove_column :items, :name, :string
    remove_column :items, :description, :text

    create_table :deals do |t|
      t.integer :venue_id
      t.string :name
      t.text :description
      
      t.timestamps
    end
  end
end
