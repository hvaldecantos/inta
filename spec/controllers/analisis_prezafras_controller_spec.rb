require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AnalisisPrezafrasController do

  # This should return the minimal set of attributes required to create a valid
  # AnalisisPrezafra. As you add validations to AnalisisPrezafra, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "identificacion" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnalisisPrezafrasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all analisis_prezafras as @analisis_prezafras" do
      analisis_prezafra = AnalisisPrezafra.create! valid_attributes
      get :index, {}, valid_session
      assigns(:analisis_prezafras).should eq([analisis_prezafra])
    end
  end

  describe "GET show" do
    it "assigns the requested analisis_prezafra as @analisis_prezafra" do
      analisis_prezafra = AnalisisPrezafra.create! valid_attributes
      get :show, {:id => analisis_prezafra.to_param}, valid_session
      assigns(:analisis_prezafra).should eq(analisis_prezafra)
    end
  end

  describe "GET new" do
    it "assigns a new analisis_prezafra as @analisis_prezafra" do
      get :new, {}, valid_session
      assigns(:analisis_prezafra).should be_a_new(AnalisisPrezafra)
    end
  end

  describe "GET edit" do
    it "assigns the requested analisis_prezafra as @analisis_prezafra" do
      analisis_prezafra = AnalisisPrezafra.create! valid_attributes
      get :edit, {:id => analisis_prezafra.to_param}, valid_session
      assigns(:analisis_prezafra).should eq(analisis_prezafra)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AnalisisPrezafra" do
        expect {
          post :create, {:analisis_prezafra => valid_attributes}, valid_session
        }.to change(AnalisisPrezafra, :count).by(1)
      end

      it "assigns a newly created analisis_prezafra as @analisis_prezafra" do
        post :create, {:analisis_prezafra => valid_attributes}, valid_session
        assigns(:analisis_prezafra).should be_a(AnalisisPrezafra)
        assigns(:analisis_prezafra).should be_persisted
      end

      it "redirects to the created analisis_prezafra" do
        post :create, {:analisis_prezafra => valid_attributes}, valid_session
        response.should redirect_to(AnalisisPrezafra.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved analisis_prezafra as @analisis_prezafra" do
        # Trigger the behavior that occurs when invalid params are submitted
        AnalisisPrezafra.any_instance.stub(:save).and_return(false)
        post :create, {:analisis_prezafra => { "identificacion" => "invalid value" }}, valid_session
        assigns(:analisis_prezafra).should be_a_new(AnalisisPrezafra)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AnalisisPrezafra.any_instance.stub(:save).and_return(false)
        post :create, {:analisis_prezafra => { "identificacion" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested analisis_prezafra" do
        analisis_prezafra = AnalisisPrezafra.create! valid_attributes
        # Assuming there are no other analisis_prezafras in the database, this
        # specifies that the AnalisisPrezafra created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AnalisisPrezafra.any_instance.should_receive(:update_attributes).with({ "identificacion" => "MyString" })
        put :update, {:id => analisis_prezafra.to_param, :analisis_prezafra => { "identificacion" => "MyString" }}, valid_session
      end

      it "assigns the requested analisis_prezafra as @analisis_prezafra" do
        analisis_prezafra = AnalisisPrezafra.create! valid_attributes
        put :update, {:id => analisis_prezafra.to_param, :analisis_prezafra => valid_attributes}, valid_session
        assigns(:analisis_prezafra).should eq(analisis_prezafra)
      end

      it "redirects to the analisis_prezafra" do
        analisis_prezafra = AnalisisPrezafra.create! valid_attributes
        put :update, {:id => analisis_prezafra.to_param, :analisis_prezafra => valid_attributes}, valid_session
        response.should redirect_to(analisis_prezafra)
      end
    end

    describe "with invalid params" do
      it "assigns the analisis_prezafra as @analisis_prezafra" do
        analisis_prezafra = AnalisisPrezafra.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AnalisisPrezafra.any_instance.stub(:save).and_return(false)
        put :update, {:id => analisis_prezafra.to_param, :analisis_prezafra => { "identificacion" => "invalid value" }}, valid_session
        assigns(:analisis_prezafra).should eq(analisis_prezafra)
      end

      it "re-renders the 'edit' template" do
        analisis_prezafra = AnalisisPrezafra.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AnalisisPrezafra.any_instance.stub(:save).and_return(false)
        put :update, {:id => analisis_prezafra.to_param, :analisis_prezafra => { "identificacion" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested analisis_prezafra" do
      analisis_prezafra = AnalisisPrezafra.create! valid_attributes
      expect {
        delete :destroy, {:id => analisis_prezafra.to_param}, valid_session
      }.to change(AnalisisPrezafra, :count).by(-1)
    end

    it "redirects to the analisis_prezafras list" do
      analisis_prezafra = AnalisisPrezafra.create! valid_attributes
      delete :destroy, {:id => analisis_prezafra.to_param}, valid_session
      response.should redirect_to(analisis_prezafras_url)
    end
  end

end
