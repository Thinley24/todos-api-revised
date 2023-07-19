class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # model association
  has_many :tasks, class_name: 'Task', foreign_key: :created_by
  # validations
  validates :email, :encrypted_password, presence: true
end
