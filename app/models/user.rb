class User < ApplicationRecord
  include ::UserConcern

  EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/.freeze
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }

  before_validation :normalize_email

  after_create :add_char_stats
  after_update :update_char_stats
  after_destroy :remove_char_stats

  def normalize_email
    self.email = email&.downcase&.strip
  end
end
