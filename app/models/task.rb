class Task < ApplicationRecord
  validates :sentence, presence: true

  enum category: { "よく使うタスク":0,"時間が決まったタスク":1,"たまたま行ったタスク":2,"ToDo":3 }
end
