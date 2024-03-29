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

describe FeaturedSongsController do

  # This should return the minimal set of attributes required to create a valid
  # FeaturedSong. As you add validations to FeaturedSong, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all featured_songs as @featured_songs" do
      featured_song = FeaturedSong.create! valid_attributes
      get :index
      assigns(:featured_songs).should eq([featured_song])
    end
  end

  describe "GET show" do
    it "assigns the requested featured_song as @featured_song" do
      featured_song = FeaturedSong.create! valid_attributes
      get :show, :id => featured_song.id.to_s
      assigns(:featured_song).should eq(featured_song)
    end
  end

  describe "GET new" do
    it "assigns a new featured_song as @featured_song" do
      get :new
      assigns(:featured_song).should be_a_new(FeaturedSong)
    end
  end

  describe "GET edit" do
    it "assigns the requested featured_song as @featured_song" do
      featured_song = FeaturedSong.create! valid_attributes
      get :edit, :id => featured_song.id.to_s
      assigns(:featured_song).should eq(featured_song)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FeaturedSong" do
        expect {
          post :create, :featured_song => valid_attributes
        }.to change(FeaturedSong, :count).by(1)
      end

      it "assigns a newly created featured_song as @featured_song" do
        post :create, :featured_song => valid_attributes
        assigns(:featured_song).should be_a(FeaturedSong)
        assigns(:featured_song).should be_persisted
      end

      it "redirects to the created featured_song" do
        post :create, :featured_song => valid_attributes
        response.should redirect_to(FeaturedSong.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved featured_song as @featured_song" do
        # Trigger the behavior that occurs when invalid params are submitted
        FeaturedSong.any_instance.stub(:save).and_return(false)
        post :create, :featured_song => {}
        assigns(:featured_song).should be_a_new(FeaturedSong)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FeaturedSong.any_instance.stub(:save).and_return(false)
        post :create, :featured_song => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested featured_song" do
        featured_song = FeaturedSong.create! valid_attributes
        # Assuming there are no other featured_songs in the database, this
        # specifies that the FeaturedSong created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FeaturedSong.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => featured_song.id, :featured_song => {'these' => 'params'}
      end

      it "assigns the requested featured_song as @featured_song" do
        featured_song = FeaturedSong.create! valid_attributes
        put :update, :id => featured_song.id, :featured_song => valid_attributes
        assigns(:featured_song).should eq(featured_song)
      end

      it "redirects to the featured_song" do
        featured_song = FeaturedSong.create! valid_attributes
        put :update, :id => featured_song.id, :featured_song => valid_attributes
        response.should redirect_to(featured_song)
      end
    end

    describe "with invalid params" do
      it "assigns the featured_song as @featured_song" do
        featured_song = FeaturedSong.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FeaturedSong.any_instance.stub(:save).and_return(false)
        put :update, :id => featured_song.id.to_s, :featured_song => {}
        assigns(:featured_song).should eq(featured_song)
      end

      it "re-renders the 'edit' template" do
        featured_song = FeaturedSong.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FeaturedSong.any_instance.stub(:save).and_return(false)
        put :update, :id => featured_song.id.to_s, :featured_song => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested featured_song" do
      featured_song = FeaturedSong.create! valid_attributes
      expect {
        delete :destroy, :id => featured_song.id.to_s
      }.to change(FeaturedSong, :count).by(-1)
    end

    it "redirects to the featured_songs list" do
      featured_song = FeaturedSong.create! valid_attributes
      delete :destroy, :id => featured_song.id.to_s
      response.should redirect_to(featured_songs_url)
    end
  end

end
