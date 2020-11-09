class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :url
      t.string :shorten_url
      t.integer :count

      t.timestamps
    end
  end
end
