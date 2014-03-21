class EquipamentosController < ApplicationController
  before_action :set_equipamento, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication, only: [:index, :new, :edit, :show, :create, :update, :destroy]

  # GET /equipamentos
  # GET /equipamentos.json
  def index
    @search_query = params[:q]

    @equipamentos = usuario_corrente.equipamentos.search(@search_query)
  end

  # GET /equipamentos/1
  # GET /equipamentos/1.json
  def show
    @equipamento = usuario_corrente.equipamentos.find(params[:id])
  end

  # GET /equipamentos/new
  def new
    @equipamento = usuario_corrente.equipamentos.build
  end

  # GET /equipamentos/1/edit
  def edit
    @equipamento = usuario_corrente.equipamentos.find(params[:id]) 
  end

  # POST /equipamentos
  # POST /equipamentos.json
  def create
    @equipamento = usuario_corrente.equipamentos.build(equipamento_params)

    if @equipamento.save
      #O métodoredirect_toenvia ao browser do usuário um código de resposta
      #“302” que signi!ca “Moved Temporarily”, dizendo ao navegador que ele deve ir para
      #outro endereço. tambem estamos escrevendo uma mensagem via "flash", 
      # Quando você escreve no flash, o conteúdo só estará disponível na próxima requisição. Por isso, é
      #normalmente utilizado em conjunto com redireções.
      redirect_to @equipamento, notice: 'Equipamento criado com sucesso!'
    else
      #redirecionar, perdemos todos os parâmetros que o usuário enviou e também as mensagens
      #de erro de validação quando executamos o método #save. Para essas
      #situações, devemos usar o#render, que não causa o redirecionamento.
      render action: 'new'
    end
  end

  # PATCH/PUT /equipamentos/1
  # PATCH/PUT /equipamentos/1.json
  def update
    @equipamento = usuario_corrente.equipamentos.find(params[:id])

    if @equipamento.update(equipamento_params)
      redirect_to @equipamento, notice: 'Equipamento alterado com sucesso!'
    else
      render action: 'edit'
    end
  end

  # DELETE /equipamentos/1
  # DELETE /equipamentos/1.json
  def destroy
    @equipamento = usuario_corrente.equipamentos.find(params[:id])
    @equipamento.destroy
      redirect_to equipamentos_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipamento
      @equipamento = Equipamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipamento_params
      params.require(:equipamento).permit(:descricao, :marca, :fornecedor, :potencia, :tipo, :modelo, :info)
    end
end
