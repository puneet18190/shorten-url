class AddTitleToRecord < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :title, :text
  end
end
