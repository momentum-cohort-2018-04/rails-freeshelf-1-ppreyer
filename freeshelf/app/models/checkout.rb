# == Schema Information
#
# Table name: checkouts
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
