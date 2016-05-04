class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  validates :email,
            presence: true,
            uniqueness: true

  validates :password,
            presence: { if: :password_required? },
            confirmation: { if: :password_required? },
            length: { within: Devise.password_length, allow_blank: true }

  private

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
