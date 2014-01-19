class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validate :title, :description, presence: true
  def author?(user)
    if user != nil
      self[:author_id.to_i] == user[:id]
    else
      false
    end
  end

end
