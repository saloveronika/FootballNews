class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :title
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
