class CreateVerbs < ActiveRecord::Migration
  def self.up
    create_table :verbs do |t|
      t.string :name
      t.string :command
      t.integer :roundtime, :default => 0
      t.string :you_see
      t.string :target_sees
      t.string :others_see
      t.string :your_status, :default => "standing"
      t.text   :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :verbs
  end
end
