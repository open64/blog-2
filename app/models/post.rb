class Post < ActiveRecord::Base
  def author?(user)
    if user != nil
      self[:author] == user[:name]
    else
      false
    end
  end

end
