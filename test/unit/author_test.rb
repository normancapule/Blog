require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
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
    author = Author.new :first_name=>"hehe", :last_name=>"hoho"
    article = Article.new :title => "x2", :body=>"x2", :status=>"Posted"
    assert_respond_to author, :articles, "author has no relation to articles"
    author.articles << article
    author.save
    author.reload
    assert_includes  author.articles, article, "article is not included"
    assert_equal 2, author.articles.size, "author article size is more or less than 1"
  end
end
