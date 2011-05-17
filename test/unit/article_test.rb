require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  test "title_is_required" do
    article = Article.new
    article.valid?
    assert_includes article.errors[:title], "can't be blank"
  end

  test "body_is_required" do
    article = Article.new
    article.valid?
    assert_includes article.errors[:body], "can't be blank"
  end

  test "status_should_be_DRAFT_or_POSTED" do
    article = Article.new :title => "x", :body=>"x"
    article.valid?
    assert_includes article.errors[:status], "should be DRAFT or POSTED"
  end

  test "status should either be DRAFT or POSTED (typos)" do
    article = Article.new :title => "x1", :body=>"x1"
    article.status="Dra   ft"
    refute article.valid?, "Input Error : #{article.status}"
    assert_includes article.errors[:status], "should be DRAFT or POSTED"
    article.status="PoStEd"
    refute article.valid?, "Input Error : #{article.status}"
    assert_includes article.errors[:status], "should be DRAFT or POSTED"
  end

  test "status should either be DRAFT or POSTED (valid)" do
    article = Article.new :title => "x2", :body=>"x2"
    article.status="Draft"
    assert article.valid?, article.errors.to_s
    article.status="Posted"
    assert article.valid?, article.errors.to_s
  end

  test "date_posted_should_be_filled_if_status_is_POSTED" do
    article = Article.new :title => "x1", :body=>"x1", :status=>"Posted"
    assert article.valid?
    assert_not_nil article.date_posted   
  end

  test "date_posted_should_not_be_filled_if_status_is_DRAFT" do
    article = Article.new :title => "x1", :body=>"x1", :status=>"Draft"
    assert article.valid?
    assert_nil article.date_posted   
  end

  test "belong_to_author" do
    author = Author.new :first_name=>"hehe", :last_name=>"hoho"
    article = Article.new :title => "x1", :body=>"x1", :status=>"Draft"
    assert_respond_to article, :author, "article has no relation to author"
    article.author = author
    author.save
    author.reload
    assert_equal article.author, author
  end

  test "has_many_comments" do
    article = Article.new :title => "x1", :body=>"x1", :status=>"Draft"
    comment = Comment.new :email => "hehe", :body=>"hehe", :comment_date=>Time.now
    assert_respond_to comment, :article, "comment has no relation to article"
    article.comments << comment
    article.save
    article.reload
    assert_includes article.comments, comment
  end
end
