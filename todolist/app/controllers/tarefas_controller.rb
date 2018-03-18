class TarefasController < ApplicationController
    respond_to :json

    def index

        # Gather all post data
        tarefas = Tarefa.all
    
        # Respond to request with post data in json format
        respond_with(tarefas) do |format|
          format.json { render :json => tarefas.as_json }
        end

    end

    def create
        new_tarefa = Tarefa.new
        new_tarefa.titulo = params[:new_tarefa][:titulo][0...250] # Get only first 250 characters
        new_tarefa.nota = params[:new_tarefa][:nota]
        new_tarefa.data = params[:new_tarefa][:data]
        
        if new_tarefa.valid?
            new_tarefa.save!
        else
            render "public/422", :status => 422
            return
        end
  
        # Respond with newly created post in json format
        respond_with(new_tarefa) do |format|
            format.json { render :json => new_tarefa.as_json }
        end
    end

    def destroy
        tarefa = Tarefa.find(params[:id])

        tarefa.destroy

        respond_to do |format|
            format.json { head :no_content }
          end
    end
end
