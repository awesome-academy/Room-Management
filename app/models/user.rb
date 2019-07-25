class User < ApplicationRecord
  has_many :feed_backs, dependent: :destroy
  has_many :bills, dependent: :destroy  
end
