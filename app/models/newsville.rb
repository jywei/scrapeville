class Newsville < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title_url, uniqueness: true
end
