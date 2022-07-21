class Crew < ApplicationRecord
  belongs_to :members
  belongs_to :ships
end
