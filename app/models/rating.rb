class Rating < ApplicationRecord
  belongs_to :post, counter_cache: true

  validates_presence_of :value
end