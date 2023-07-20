# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # model association
  has_many :tasks, class_name: 'Task', foreign_key: :created_by
  # validations
  validates_presence_of :email, uniqueness: true
  validates_presence_of :encrypted_password
end
