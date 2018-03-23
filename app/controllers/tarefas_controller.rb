class TarefasController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    before_action :set_tarefa, only: [:show, :update, :destroy]
    respond_to :json

  # GET /todos
  def index
    @tarefas = Tarefa.all
    respond_to do |format|
        format.json { render json: @tarefas }
      end
  end

  # POST /todos
  def create
    @tarefa = Tarefa.create!(tarefa_params)
    respond_to do |format|
        if @tarefa.save
          format.json { render json: @tarefa, status: :created, location: @tarefa }
        else
          format.json { render json: @tarefa.errors, status: :unprocessable_entity }
        end
    end
  end

  # GET /todos/:id
  def show
    respond_to do |format|
        format.json { render json: @tarefa }
      end
  end

  # PUT /todos/:id
  def update
    @tarefa.update(tarefa_params)
    respond_to do |format|
        if @tarefa.update_attributes(tarefa_params)
          format.json { head :no_content }
        else
          format.json { render json: @tarefa.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /todos/:id
  def destroy
    @tarefa.destroy
    respond_to do |format|
        format.json { head :no_content }
    end
  end

  private

  def tarefa_params
    # whitelist params
    params.permit(:titulo, :descricao, :data)
  end

  def set_tarefa
    @tarefa = Tarefa.find(params[:id])
  end
end
