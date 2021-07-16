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


  # check if no insult in nickname and name
  # nickname: no blank, no special chars exept _
  # name: blank alowed only between fName and lName, no special chars exept "' -"  

  private



end
