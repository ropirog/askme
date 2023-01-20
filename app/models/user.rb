class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_nickname
  before_validation :downcase_email
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A[a-zA-Z0-9_]+\z/ }

  private

  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
