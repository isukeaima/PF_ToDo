class Task < ApplicationRecord
  validates :sentence, presence: true

  enum category: { "時間が決まったタスク":0,"よく使うタスク":1,"たまたま行ったタスク":2,"ToDo":3 }
end
