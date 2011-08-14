class AddVideoUrlToAdmins < ActiveRecord::Migration
  def self.up
    add_column :admins, :video_url, :text
  end

  def self.down
    remove_column :admins, :video_url
  end
end
