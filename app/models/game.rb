class Game < ApplicationRecord 
    #definition de la validations des champs
    validates :game_name, presence: true, length: { minimum: 1 }
    validates :description, presence: true, length: {minimum: 10 }
    validates :release, presence: true

    belongs_to :editor
    belongs_to :devloper
    has_and_belongs_to_many :platforms
    has_and_belongs_to_many :themes
    has_and_belongs_to_many :genres
end
