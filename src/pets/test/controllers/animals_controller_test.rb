require 'test_helper'

class AnimalsControllerTest < ActionController::TestCase
  setup do
    @animal = animals(:one)
    @update = {
      :name           => 'Mighty',
      :age            => '1',
      :type_of_animal => 'Mouse',
      :description    => 'Here I come to save the day!'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:animals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create animal" do
    assert_difference('Animal.count') do
      #post :create, animal: { age: @animal.age, description: @animal.description, name: @animal.name, type_of_animal: @animal.type_of_animal }
      post :create, animal: @update
    end

    assert_redirected_to animal_path(assigns(:animal))
  end

  test "should show animal" do
    get :show, id: @animal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @animal
    assert_response :success
  end

  test "should update animal" do
    #patch :update, id: @animal, animal: { age: @animal.age, description: @animal.description, name: @animal.name, type_of_animal: @animal.type_of_animal }
    put :update :id => @animal.to_param, :animal => @update
    assert_redirected_to animal_path(assigns(:animal))
  end

  test "should destroy animal" do
    assert_difference('Animal.count', -1) do
      delete :destroy, id: @animal
    end

    assert_redirected_to animals_path
  end
end
