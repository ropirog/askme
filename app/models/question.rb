class Question < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates :body, length: { maximum: 280 }

  def hidden?
    hidden
  end
end
