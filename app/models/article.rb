# == Schema Information
#
# Table name: articles
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  video_url   :text
#

class Article < ActiveRecord::Base
	validates :title, :description, :image_url, :presence => true
	validates :title, :uniqueness => true
	validates :image_url, :format => {
		:with => %r{\.(gif|jpg|png)$}i,
		:message => 'Wrong extension' #'Вкажіть правильне розширення для картинки (GIF, JPG або PNG)'
	}
end
