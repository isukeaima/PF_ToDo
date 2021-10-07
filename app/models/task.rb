class Task < ApplicationRecord
  validates :sentence, presence: true
end
