class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication, only: [:index, :new, :edit, :show, :create, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    orcamento = Orcamento.find(params[:orcamento_id])

    @items = orcamento.items
    @orcamento = orcamento
  end

  # GET /items/1
  # GET /items/1.json
  def show
    orcamento = Orcamento.find(params[:orcamento_id])

    @item = orcamento.items.find(params[:id]) 
    @items = orcamento.items
    @orcamento = orcamento
  end

  # GET /items/new
  def new
    orcamento = Orcamento.find(params[:orcamento_id])

    @item = orcamento.items.build
    @items = orcamento.items
    @orcamento = orcamento
  end

  # GET /items/1/edit
  def edit
    orcamento = Orcamento.find(params[:orcamento_id])

    @item = orcamento.items.find(params[:id]) 
    @items = orcamento.items
    @orcamento = orcamento
  end

  # POST /items
  # POST /items.json
  def create
    orcamento = Orcamento.find(params[:orcamento_id])

    @item = orcamento.items.create(item_params)
    @items = orcamento.items 
    @orcamento = orcamento
    redirect_to new_orcamento_item_path   
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    orcamento = Orcamento.find(params[:orcamento_id])
    @item = orcamento.items.find(params[:id])
    @items = orcamento.items 
    @orcamento = orcamento

    redirect_to new_orcamento_item_path
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    orcamento = Orcamento.find(params[:orcamento_id])
    @item = orcamento.items.find(params[:id])
    @orcamento = orcamento

    @item.destroy
    redirect_to new_orcamento_item_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:qtdequipamento, :qtdtubulacao, :qtdextra, :tubulacao, :extra, :valor, :descricao, :tipo_Servico, :tipo_produto, :produto, :potencia, :unidade_medida, :info)
    end
end
