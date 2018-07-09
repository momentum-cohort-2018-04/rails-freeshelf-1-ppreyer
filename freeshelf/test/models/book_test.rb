# == Schema Information
#
# Table name: books
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  author      :string
#  description :text
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save book without title" do
    book = Book.new
    assert_not book.save, "Saved the book without a title"
  end
  test "should not save book without author" do
    book = Book.new
    assert_not book.save, "Saved the book without an author"
  end
  test "should not save book without description" do
    book = Book.new
    assert_not book.save, "Saved the book without a url"
  end
  test "should not save book without url" do
    book = Book.new
    assert_not book.save, "Saved the book without a url"
  end
end
