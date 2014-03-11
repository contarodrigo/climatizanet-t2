class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication, only: [:index, :new, :edit, :show, :create, :update, :destroy]

  def index
    @clientes = Cliente.all
  end

  def show
  end

  def new
    @cliente = Cliente.new
  end

  def edit
  end

  def create
    #poderia ser assim...  @cliente = Cliente.new(params[:user])  usando mass-assignment, pag.64
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      #O métodoredirect_toenvia ao browser do usuário um código de resposta
      #“302” que signi!ca “Moved Temporarily”, dizendo ao navegador que ele deve ir para
      #outro endereço. tambem estamos escrevendo uma mensagem via "flash", 
      # Quando você escreve no flash, o conteúdo só estará disponível na próxima requisição. Por isso, é
      #normalmente utilizado em conjunto com redireções.
      redirect_to @cliente, notice: 'Cliente criado com sucesso!'
    else
      #redirecionar, perdemos todos os parâmetros que o usuário enviou e também as mensagens
      #de erro de validação quando executamos o método #save. Para essas
      #situações, devemos usar o#render, que não causa o redirecionamento.
      render action: 'new'
    end
  end

  def update
    if @cliente.update(cliente_params)
      redirect_to @cliente, notice: 'Cliente alterado com sucesso!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @cliente.destroy
      redirect_to clientes_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #proteção para mass-assignment
    def cliente_params
      params.require(:cliente).permit(:nome, :email, :cep, :endereco, :bairro, :municipio, :estado, :telefone, :celular, :cpf, :rg, :info)
    end
end
