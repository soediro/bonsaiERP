class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.references :organisation
      t.references :user
      t.string :role
      t.string :settings
      t.boolean :creator

      t.timestamps
    end
    add_index :links, :user_id
    add_index :links, :organisation_id
  end

  def self.down
    drop_table :links
  end
end
