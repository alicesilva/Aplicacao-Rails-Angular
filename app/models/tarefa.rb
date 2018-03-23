class Tarefa < ActiveRecord::Base
    validates :titulo, presence: true
    validates :descricao, presence: true
    validates :data, presence: true

end
