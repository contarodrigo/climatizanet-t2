class UsuariosController < ApplicationController
  before_action :require_authentication, only: [:index, :new, :edit, :show, :create, :update, :destroy]
  before_action :can_change, only: [:show, :edit, :update, :destroy]

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
    def usuario
      @usuario ||= Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nome, :email, :password, :password_confirmation)
    end

    def can_change
      unless usuario_logado? && usuario_corrente == usuario
        redirect_to root_path
      end
    end


end
