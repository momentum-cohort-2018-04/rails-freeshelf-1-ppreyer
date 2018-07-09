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

class Book < ApplicationRecord  
  belongs_to :user
  has_many :users, through: :checkouts
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :url, presence: true
end

