class User < ActiveRecord::Base
  has_many :movies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :sign_in_count, presence: true
  validates :user_name, presence: true
  validates :admin, presence: true
  end


t.string   "email",                  default: "", null: false
t.string   "encrypted_password",     default: "", null: false
t.string   "reset_password_token"
t.datetime "reset_password_sent_at"
t.datetime "remember_created_at"
t.integer  "sign_in_count",          default: 0,  null: false
t.datetime "current_sign_in_at"
t.datetime "last_sign_in_at"
t.inet     "current_sign_in_ip"
t.inet     "last_sign_in_ip"
t.datetime "created_at"
t.datetime "updated_at"
t.string   "user_name",                           null: false
t.boolean  "admin",                               null: false
