class Post < ActiveRecord::Base
  has_many :comments
  def author?(user)
    if user != nil
      self[:author] == user[:name]
    else
      false
    end
  end

end
