class Game < ApplicationRecord 
    #definition de la validations des champs
    validates :game_name, presence: true, length: { minimum: 1 }
    validates :description, presence: true, length: {minimum: 10 }
    validates :release, presence: true
end
