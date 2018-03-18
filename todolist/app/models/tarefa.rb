class Tarefa < ActiveRecord::Base
    validates :titulo, presence: true, length: { minimum: 1, maximum: 250 }
    validates :nota, presence: true
end
