class Article < ActiveRecord::Base
	validates :title, :description, :image_url, :presence => true
	validates :title, :uniqueness => true
	validates :image_url, :format => {
		:with => %r{\.(gif|jpg|png)$}i,
		:message => 'Wrong extension' #'Вкажіть правильне розширення для картинки (GIF, JPG або PNG)'
	}
end
