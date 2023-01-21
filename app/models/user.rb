class User < ApplicationRecord
  has_many :questions

  has_secure_password
  before_validation :downcase_nickname, :downcase_email
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A[a-zA-Z0-9_]+\z/ }
  validates :nav_color, format: { with: /\A#(\h{3}){1,2}\z/ }

  private

  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
