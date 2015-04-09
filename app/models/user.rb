class User < ActiveRecord::Base
  has_many :movies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, email: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :sign_in_count, presence: true
  validates :user_name, presence: true

  def update_admin_status
    update_attributes(admin: true)

    save
  end

  def admin?
    admin
  end
end
