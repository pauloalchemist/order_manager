class State < ApplicationRecord
  has_many :cities, foreign_key: 'states_id'
end
