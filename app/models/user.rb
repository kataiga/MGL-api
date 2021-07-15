# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :omniauthable, :timeoutable, :confirmable, 
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :lockable,
         :trackable

  include DeviseTokenAuth::Concerns::User

  # validates :nickname, presence: true
  # validates :name, presence: true
  # validates :email, presence: true

end
