class City < ApplicationRecord
  belongs_to :state, foreign_key: 'states_id'
end
