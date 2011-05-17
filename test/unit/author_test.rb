require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  def author
    @author ||= Author.new #OR=, || is like | except | will execute both
  end

  # Replace this with your real tests.
  test "last name is required" do
    author = Author.new
    author.valid?
    assert_includes author.errors[:last_name], "can't be blank"
  end

  test "first name is required" do
    author = Author.new
    author.valid?
    assert_includes author.errors[:first_name], "can't be blank"
  end

  test "author has many articles" do
    author.attributes ={:first_name => "hehe", :last_name=>"hoho", :avatar => image_file}
    article = Article.new :title => "x2", :body=>"x2", :status=>"Posted"
    assert_respond_to author, :articles, "author has no relation to articles"
    author.articles << article
    author.save
    author.reload
    assert_includes  author.articles, article, "article is not included"
    assert_equal 1, author.articles.size, "author article size is more or less than 1"
  end

  test "author should be valid with an avatar" do
    author.attributes ={:first_name => "hehe", :last_name=>"hoho", :avatar => image_file}
    assert author.valid?, "#{author.errors}"
  end

  test "author should require an avatar" do
    author.attributes ={:first_name => "hehe", :last_name=>"hoho"}
    assert_equal false, author.valid?, "should not be valid without an avatar"
  end

  test "avatar should not accept invalid images" do
    author.attributes ={:first_name => "hehe", :last_name=>"hoho", :avatar => invalid_image_file}
    assert_equal false, author.valid?, "should not be valid if image of avatar is invalid"
  end
end
