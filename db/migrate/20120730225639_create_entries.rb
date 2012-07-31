class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :email
      t.text :text
      t.string :uuid
      t.timestamps
    end
  end
end
