class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  def index
    @usuarios = Usuario.all
  end


  def show
  end

  def new
    @usuario = Usuario.new
  end

  def edit
  end

  def create
    @usuario = Usuario.new(usuario_params)

      if @usuario.save
        redirect_to @usuario, notice: 'Usuario foi criado com sucesso!'
      else
        render action: 'new'
      end
  end

  def update
      if @usuario.update(usuario_params)
        redirect_to @usuario, notice: 'Usuario foi atualizado com sucesso'
      else
        render action: 'edit'
      end
  end

  def destroy
    if @usuario.destroy
      redirect_to usuarios_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nome, :email, :password, :password_confirmation)
    end
end
