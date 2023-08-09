# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # model association
  belongs_to :role
  has_many :created_tasks, class_name: 'Task', foreign_key: 'creator_id', dependent: :destroy
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assignee_id', dependent: :nullify
  # validations
  validates_presence_of :email, uniqueness: true
  validates_presence_of :encrypted_password
  validates_presence_of :role_id
end
