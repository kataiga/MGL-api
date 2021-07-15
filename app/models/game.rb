class Game < ApplicationRecord 
    #definition de la validations des champs
    validates :game_name, presence: true, length: { minimum: 1 }
    validates :description, presence: true, length: {minimum: 10 }
    validates :release, presence: true
    validates :editor_id, presence: true
    validates :devloper_id, presence: true
    


    belongs_to :editor
    belongs_to :devloper
    has_and_belongs_to_many :platforms, dependent: :destroy
    has_and_belongs_to_many :themes, dependent: :destroy
    has_and_belongs_to_many :genres, dependent: :destroy

end
