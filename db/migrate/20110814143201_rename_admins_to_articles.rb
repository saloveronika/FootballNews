class RenameAdminsToArticles < ActiveRecord::Migration
  def self.up
	rename_table :admins, :articles
  end

  def self.down
	rename_table :articles, :admins 
  end
end
