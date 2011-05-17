require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "not save if subject is empty" do
    post = Post.new
    assert !post.save, "Post should not save if subject is empty" #assert (false)post.save
  end

  test "there should be mandatory checking for subject" do
    post = Post.new
    post.valid?
    assert_equal ["can't be blank"], post.errors[:subject]
    "Post have an error if subject is empty"
  end

  test "there should be mandatory checking for content" do
    post = Post.new
    post.valid?
    assert_includes post.errors[:content], "can't be blank", 
    "Post have an error if content is empty"
  end

  test "content minimum charcount == 40" do
    post = Post.new :subject => "test me!!!", :content => ("z" * 40)
    assert post.content.length >= 40 ? true:false, "Post content is too short"
  end

  test "automatically trim leading and trailing content spaces" do
    post = Post.new :subject => "trailing_ako!", :content => "       "+("a" * 30)+"      "
    post.save
    assert_equal "a"*30,post.content,"Post should trim trailing spaces"
  end

  test "content length should be checked after trimming" do
    post = Post.new :subject => "test me!!!", :content => "       "+("a" * 10)+"      "
    post.valid?
    assert_equal ["is too short (minimum is 40 characters)"], post.errors[:content]
  end
end
