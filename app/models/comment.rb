class Comment < ActiveRecord::Base
  belongs_to :post
  validate :content, presence: true
end
