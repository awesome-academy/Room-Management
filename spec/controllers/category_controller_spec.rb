require "rails_helper"
include SessionsHelper

RSpec.describe CategoriesController, type: :controller do
  let(:category) {FactoryBot.create :category}
  let(:room) {FactoryBot.create :room, category_id: category.id}
  subject {FactoryBot.create :category}
  let(:valid_attributes) {FactoryBot.attributes_for :category}
  let(:invalid_attributes) {FactoryBot.attributes_for :category, name: ""}
  
  context "not login" do
    describe "GET #index" do
      let!(:categories) { FactoryBot.create_list :category, 3 }
      it "assigns @categories" do
        expect(assigns(:categories)).to eq assigns(categories)
      end

      it "not login index" do
        get :index
        expect(response).to redirect_to login_url
      end
    end

    describe "GET #new" do
      it "not login new" do
        get :index
        expect(response).to redirect_to login_url
      end
    end

    describe "GET #edit" do
      it "not login edit" do
        get :index
        expect(response).to redirect_to login_url
      end
    end

    describe "GET #show" do
      it "not login show" do
        get :index
        expect(response).to redirect_to login_url
      end
    end
  end
  
  context "user is administrator" do
    before do
      admin = FactoryBot.create :user, role: 1, room_id: room.id
      log_in admin
    end

    describe "GET #index" do
      let!(:categories) { FactoryBot.create_list :category, 3 }

      it "assigns @categories" do
        expect(assigns(:categories)).to eq assigns(categories)
      end

      it "logined get index" do
        get :index
        expect(response).to render_template "index"
      end
    end

    describe "GET #new" do
      it "assigns @category" do
        expect(assigns(:category)).to eq assigns(category)
      end

      it "logined get new" do
        get :new
        expect(response).to render_template "new"
      end
    end

    describe "GET #edit" do
      it "assigns @category" do
        expect(assigns(:category)).to eq assigns(category)
      end

      it "logined get edit" do
        get :edit, params: {id: category}
        expect(response).to render_template "edit"
      end

      context "resource not found" do
        it "get edit fail"  do
          get :edit, params: {id: 0}
          expect(response).to redirect_to root_path
        end
      end     
    end

    describe "GET #show" do
      context "category exist" do
        it "logined get show" do
          get :show, params: {id: subject.id}
          expect(response).to render_template "show"
        end
      end

      context "category is not exist" do
        it "show fail" do
          get :show, params: {id: 0}
          expect(response).to redirect_to root_path
        end
      end
    end

    describe "POST #create" do
      context "valid params" do
        it "test create category" do
          expect {
            post :create, params: {category: valid_attributes}
          }.to change(Category, :count).by 1
        end

        it "test flash create" do
          post :create, params: {category: valid_attributes}
          expect(flash[:success]).to eq I18n.t("success")
        end        
      
        it "create category" do
          post :create, params: {category: valid_attributes}
          expect(response).to redirect_to category_path(Category.last)
        end
      end

      context "invalid params" do
        it "check create fail" do
          post :create, params: {category: invalid_attributes}
          expect(response).to render_template "new"
        end
      end
    end

    describe "GET #edit" do
      context "resource exist" do
        it "logined get edit" do
          get :edit, params: {id: category}
          expect(response).to render_template :edit
        end
      end

      context "resource not found" do
        it "logined get edit fail" do
          get :edit, params: {id: 0}
          expect(response).to redirect_to root_path
        end
      end
    end

    describe "PATCH #update" do
      context "with valid params" do
        it "assigns @category" do
          expect(assigns(:category)).to eq assigns(category)
        end
      end

      let(:new_attributes) do
        FactoryBot.attributes_for :category, name: "Sê vần"
      end
      
      it "update name" do
        patch :update, params: {id: category, category: new_attributes}
        category.reload
        expect(category.name).to eq new_attributes[:name]
      end

      it "checck flash update" do
        patch :update, params: {id: category, category: new_attributes}
        expect(flash[:success]).to eq I18n.t("success")
      end 

      it "check update category" do
        patch :update, params: {id: category, category: new_attributes}
        expect(response).to redirect_to categories_path
      end
    end

    context "with invalid params" do
      it do
        patch :update, params: {id: category, category: invalid_attributes}
        expect(response).to render_template :edit
      end
    end

    context "resource not found" do
      it "update fail" do
        patch :update, params: {id: 0}
        expect(response).to redirect_to root_path
      end
    end

    describe "DELETE #destroy" do
      context "resource exist" do
        it "assigns @category" do
          expect(assigns(:category)).to eq assigns(category)
        end

        it "delete check flash" do
          delete :destroy, params: {id: category}
          expect(flash[:success]).to eq I18n.t("success")
        end
        
        it "delete category" do
          delete :destroy, params: {id: category}
          expect(response).to redirect_to categories_url
        end
      end

      context "resource not found" do
        it "delete fail" do
          delete :destroy, params: {id: 0}
          expect(response).to redirect_to root_path
        end
      end
    end
  end
end
