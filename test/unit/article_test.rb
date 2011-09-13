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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
fixtures :articles

	test "article attributes must not be empty" do
	article = Article.new
	assert article.invalid?
	assert article.errors[:title].any?
	assert article.errors[:description].any?
	assert article.errors[:image_url].any?
end

def new_article(image_url)
Article.new(:title	=> "Football",
	:description	=> "Something new",
	:image_url	=> image_url)
	
end

	test "image url" do
	ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
	bad = %w{ fred.doc fred.gif/more fred.gif.more }
	
	ok.each do |name|
		assert new_article(name).valid?, " #{name} shouldn't be invalid"
	end
	bad.each do |name|
		assert new_article(name).invalid?, " #{name} shouldn't be valid"
	end
	end

	test "article is not valid without a unique title" do
      article = Article.new(:title => articles(:ruby).title,
						:description => "yyy",
						:image_url => "fred.gif")
      assert !article.save
      assert_equal "has already been taken" , article.errors[:title].join('; ' )
	end

end
