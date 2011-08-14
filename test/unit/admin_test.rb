require 'test_helper'

class AdminTest < ActiveSupport::TestCase
fixtures :admins

	test "admin attributes must not be empty" do
	admin = Admin.new
	assert admin.invalid?
	assert admin.errors[:title].any?
	assert admin.errors[:description].any?
	assert admin.errors[:image_url].any?
end

def new_admin(image_url)
Admin.new(:title	=> "Football",
	:description	=> "Something new",
	:image_url	=> image_url)
	
end

	test "image url" do
	ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
	bad = %w{ fred.doc fred.gif/more fred.gif.more }
	
	ok.each do |name|
		assert new_admin(name).valid?, " #{name} shouldn't be invalid"
	end
	bad.each do |name|
		assert new_admin(name).invalid?, " #{name} shouldn't be valid"
	end
	end

	test "admin is not valid without a unique title" do
      admin = Admin.new(:title => admins(:ruby).title,
						:description => "yyy",
						:image_url => "fred.gif")
      assert !admin.save
      assert_equal "has already been taken" , admin.errors[:title].join('; ' )
	end

end
