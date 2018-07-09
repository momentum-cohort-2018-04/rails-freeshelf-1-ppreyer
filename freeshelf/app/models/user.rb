# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

class User < ApplicationRecord
  has_secure_password
  has_many :checkouts
  has_many :books_to_read, through: :checkouts, class_name: 'Book'
  has_many :books
  
  def to_s
    name
  end
end
