class CreateVerbs < ActiveRecord::Migration
  def self.up
    create_table :verbs do |t|
      t.string :name
      t.string :command
      t.integer :roundtime
      t.string :you_see
      t.string :target_sees
      t.string :others_see
      t.text   :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :verbs
  end
end
