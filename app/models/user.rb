class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ratings, dependent: :destroy
  has_many :materials
  has_many :upvotes
  has_many :construction_systems

  enum :role, { admin: 0, free_user: 1, paying_user: 2 }
end
