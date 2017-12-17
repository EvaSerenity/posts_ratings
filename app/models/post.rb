class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings

  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :user_ip
end