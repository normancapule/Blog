require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "email_should_be_filled" do
    comment = Comment.new
    comment.valid?
    assert_includes comment.errors[:email], "can't be blank"
  end

  test "body_should_be_filled" do
    comment = Comment.new
    comment.valid?
    assert_includes comment.errors[:email], "can't be blank"
  end

  test "comment_belongs_to_article" do
    article = Article.new :title => "x1", :body=>"x1", :status=>"Draft"
    comment = Comment.new :email => "hehe", :body=>"hehe", :comment_date=>Time.now
    assert_respond_to comment, :article, "comment has no relation to article"
    comment.article = article
    comment.save
    comment.reload
    assert_equal comment.article, article
  end
end
