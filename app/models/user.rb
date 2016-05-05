class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  has_many :histories
  has_many :foods, through: :histories

  validates :email,
            presence: true,
            uniqueness: true,
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  validates :password,
            presence: {if: :password_required?},
            confirmation: {if: :password_required?},
            length: {within: Devise.password_length, allow_blank: true}

  validates :first_name, :last_name, presence: true

  before_create :set_default_roles

  ROLES = %i(god account_owner)

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

  private

  def set_default_roles
    self.roles = :account_owner if self.roles.empty?
  end

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
