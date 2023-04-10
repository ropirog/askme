class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  validates :body, presence: true
  validates :body, length: { maximum: 280 }

  after_save_commit :update_hashtags

  private

  def update_hashtags
    self.hashtags =
      "#{body} #{answer}".downcase.scan(Hashtag::REGEX).uniq.map do |tag|
        Hashtag.find_or_create_by(name: tag.delete("#"))
      end
  end
end
