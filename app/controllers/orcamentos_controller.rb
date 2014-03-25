#encoding: utf-8
class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication, only: [:index, :new, :edit, :show, :create, :update, :destroy]

  # GET /orcamentos
  # GET /orcamentos.json
  def index
    cliente = Cliente.find(params[:cliente_id])

    @orcamentos = cliente.orcamentos
  end

  # GET /orcamentos/1
  # GET /orcamentos/1.json
  def show
    cliente = Cliente.find(params[:cliente_id])

    @orcamento = cliente.orcamentos.find(params[:id]) 
  end

  # GET /orcamentos/new
  def new
    cliente = Cliente.find(params[:cliente_id])

    @orcamento = cliente.orcamentos.build
  end

  # GET /orcamentos/1/edit
  def edit
    cliente = Cliente.find(params[:cliente_id])

    @orcamento = cliente.orcamentos.find(params[:id])
  end

  # POST /orcamentos
  # POST /orcamentos.json
  def create
    cliente = Cliente.find(params[:cliente_id])

    @orcamento = cliente.orcamentos.create(orcamento_params)

    if @orcamento.save
      redirect_to([@orcamento.cliente, @orcamento], notice: 'Orçamento criada com sucesso!')
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /orcamentos/1
  # PATCH/PUT /orcamentos/1.json
  def update
    cliente = Cliente.find(params[:cliente_id])

    @orcamento = cliente.orcamentos.find(params[:id])

    if @orcamento.update(orcamento_params)
      redirect_to([@orcamento.cliente,@orcamento], notice: 'Orçamento alterado com sucesso!')
    else
      render action: 'edit'
    end

  end

  # DELETE /orcamentos/1
  # DELETE /orcamentos/1.json
  def destroy
    cliente = Cliente.find(params[:cliente_id])

    @orcamento = cliente.orcamentos.find(params[:id])

    @orcamento.destroy
    redirect_to cliente_orcamentos_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamento
      @orcamento = Orcamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orcamento_params
      params.require(:orcamento).permit(:descricao, :validade, :cliente_id)      
    end   
end
