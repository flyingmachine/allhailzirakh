class AddIncompleteField < ActiveRecord::Migration
  def self.up
    add_column :verbs, :incomplete, :boolean
  end

  def self.down
    remove_column :verbs, :incomplete
  end
end
