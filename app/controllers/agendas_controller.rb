class AgendasController < ApplicationController
  before_action :set_agenda, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication, only: [:index, :new, :edit, :show, :create, :update, :destroy]

  # GET /agendas
  # GET /agendas.json
  def index
    cliente = Cliente.find(params[:cliente_id])

    @agendas = cliente.agendas
  end

  # GET /agendas/1
  # GET /agendas/1.json
  def show
    cliente = Cliente.find(params[:cliente_id])

    @agenda = cliente.agendas.find(params[:id])    
  end

  # GET /agendas/new
  def new
    cliente = Cliente.find(params[:cliente_id])

    @agenda = cliente.agendas.build
  end

  # GET /agendas/1/edit
  def edit
    cliente = Cliente.find(params[:cliente_id])

    @agenda = cliente.agendas.find(params[:id])      
  end

  # POST /agendas
  # POST /agendas.json
  def create
    cliente = Cliente.find(params[:cliente_id])

    @agenda = cliente.agendas.create(agenda_params)

      if @agenda.save
        redirect_to([@agenda.cliente, @agenda], notice: 'Agenda criada com sucesso!')
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /agendas/1
  # PATCH/PUT /agendas/1.json
  def update
      cliente = Cliente.find(params[:cliente_id])

      @agenda = cliente.agendas.find(params[:id])

      if @agenda.update(agenda_params)
        redirect_to([@agenda.cliente, @agenda], notice: 'Agenda alterada com sucesso!')
      else
        render action: 'edit'
      end
  end

  # DELETE /agendas/1
  # DELETE /agendas/1.json
  def destroy
      cliente = Cliente.find(params[:cliente_id])

      @agenda = cliente.agendas.find(params[:id])

      @agenda.destroy
      redirect_to cliente_agendas_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agenda
      @agenda = Agenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agenda_params
      params.require(:agenda).permit(:data, :hora, :cliente_id)
    end
end
