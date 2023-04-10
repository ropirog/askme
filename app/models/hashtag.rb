class Hashtag < ApplicationRecord
  has_many :question_hashtags, dependent: :destroy
  has_many :questions, through: :question_hashtags

  scope :with_questions, -> { joins(:questions).distinct }

  REGEX = /#[[:word:]-]+/.freeze
end
