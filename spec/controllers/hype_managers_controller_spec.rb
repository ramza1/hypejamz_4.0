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

describe HypeManagersController do

  # This should return the minimal set of attributes required to create a valid
  # HypeManager. As you add validations to HypeManager, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all hype_managers as @hype_managers" do
      hype_manager = HypeManager.create! valid_attributes
      get :index
      assigns(:hype_managers).should eq([hype_manager])
    end
  end

  describe "GET show" do
    it "assigns the requested hype_manager as @hype_manager" do
      hype_manager = HypeManager.create! valid_attributes
      get :show, :id => hype_manager.id.to_s
      assigns(:hype_manager).should eq(hype_manager)
    end
  end

  describe "GET new" do
    it "assigns a new hype_manager as @hype_manager" do
      get :new
      assigns(:hype_manager).should be_a_new(HypeManager)
    end
  end

  describe "GET edit" do
    it "assigns the requested hype_manager as @hype_manager" do
      hype_manager = HypeManager.create! valid_attributes
      get :edit, :id => hype_manager.id.to_s
      assigns(:hype_manager).should eq(hype_manager)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new HypeManager" do
        expect {
          post :create, :hype_manager => valid_attributes
        }.to change(HypeManager, :count).by(1)
      end

      it "assigns a newly created hype_manager as @hype_manager" do
        post :create, :hype_manager => valid_attributes
        assigns(:hype_manager).should be_a(HypeManager)
        assigns(:hype_manager).should be_persisted
      end

      it "redirects to the created hype_manager" do
        post :create, :hype_manager => valid_attributes
        response.should redirect_to(HypeManager.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved hype_manager as @hype_manager" do
        # Trigger the behavior that occurs when invalid params are submitted
        HypeManager.any_instance.stub(:save).and_return(false)
        post :create, :hype_manager => {}
        assigns(:hype_manager).should be_a_new(HypeManager)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        HypeManager.any_instance.stub(:save).and_return(false)
        post :create, :hype_manager => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested hype_manager" do
        hype_manager = HypeManager.create! valid_attributes
        # Assuming there are no other hype_managers in the database, this
        # specifies that the HypeManager created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        HypeManager.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => hype_manager.id, :hype_manager => {'these' => 'params'}
      end

      it "assigns the requested hype_manager as @hype_manager" do
        hype_manager = HypeManager.create! valid_attributes
        put :update, :id => hype_manager.id, :hype_manager => valid_attributes
        assigns(:hype_manager).should eq(hype_manager)
      end

      it "redirects to the hype_manager" do
        hype_manager = HypeManager.create! valid_attributes
        put :update, :id => hype_manager.id, :hype_manager => valid_attributes
        response.should redirect_to(hype_manager)
      end
    end

    describe "with invalid params" do
      it "assigns the hype_manager as @hype_manager" do
        hype_manager = HypeManager.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        HypeManager.any_instance.stub(:save).and_return(false)
        put :update, :id => hype_manager.id.to_s, :hype_manager => {}
        assigns(:hype_manager).should eq(hype_manager)
      end

      it "re-renders the 'edit' template" do
        hype_manager = HypeManager.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        HypeManager.any_instance.stub(:save).and_return(false)
        put :update, :id => hype_manager.id.to_s, :hype_manager => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested hype_manager" do
      hype_manager = HypeManager.create! valid_attributes
      expect {
        delete :destroy, :id => hype_manager.id.to_s
      }.to change(HypeManager, :count).by(-1)
    end

    it "redirects to the hype_managers list" do
      hype_manager = HypeManager.create! valid_attributes
      delete :destroy, :id => hype_manager.id.to_s
      response.should redirect_to(hype_managers_url)
    end
  end

end
