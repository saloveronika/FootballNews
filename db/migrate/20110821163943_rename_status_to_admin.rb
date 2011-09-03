class RenameStatusToAdmin < ActiveRecord::Migration
  def self.up
	remove_column :users, :status
	add_column :users, :admin, :boolean, :default => false
  end

  def self.down
	add_column :users, :status, :string
	remove_column :users, :admin
  end
end
