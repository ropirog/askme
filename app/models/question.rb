class Question < ApplicationRecord
  validates :body, presence: true
  validates :body, length: { maximum: 280 }

  def hidden?
    hidden
  end
end
