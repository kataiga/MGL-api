class Platform < ApplicationRecord

    has_and_belongs_to_many :games
    accepts_nested_attributes_for :games
end
