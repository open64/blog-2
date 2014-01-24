class Comment < ActiveRecord::Base
  belongs_to :post
  validates :content, presence: true
  def author?(user)
    if user != nil
      self[:author_id] == user[:id]
    else
      false
    end
  end

end
