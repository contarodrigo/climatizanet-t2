require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post :create, cliente: { bairro: @cliente.bairro, celular: @cliente.celular, cep: @cliente.cep, cpf: @cliente.cpf, email: @cliente.email, endereco: @cliente.endereco, estado: @cliente.estado, info: @cliente.info, municipio: @cliente.municipio, nome: @cliente.nome, rg: @cliente.rg, telefone: @cliente.telefone }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should show cliente" do
    get :show, id: @cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cliente
    assert_response :success
  end

  test "should update cliente" do
    patch :update, id: @cliente, cliente: { bairro: @cliente.bairro, celular: @cliente.celular, cep: @cliente.cep, cpf: @cliente.cpf, email: @cliente.email, endereco: @cliente.endereco, estado: @cliente.estado, info: @cliente.info, municipio: @cliente.municipio, nome: @cliente.nome, rg: @cliente.rg, telefone: @cliente.telefone }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should destroy cliente" do
    assert_difference('Cliente.count', -1) do
      delete :destroy, id: @cliente
    end

    assert_redirected_to clientes_path
  end
end
