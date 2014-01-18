class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  def author?(user)
    if user != nil
      self[:author_id] == user[:id]
    else
      false
    end
  end

end
