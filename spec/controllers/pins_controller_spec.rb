require 'spec_helper'
RSpec.describe PinsController do

  #here I will describe what I expect the GET index controller action to do
  describe "GET index" do

    #in plain English, what I expect to happen
    it 'renders the index template' do

      #ask RSpec to run whatever action you need done
      get :index

      #my expectation of what will happen when RSpec runs the action
      #this is the core of the RSpec testing framework
      #can expect .to matcher or .not_to matcher
      # keyword expect > what actually happened vs what you expected what happened to either match or not match
      expect(response).to render_template("index")
    end

    it 'populates @pins with all pins' do
      get :index
      # expect the @pins variable to equal all the pins in the database
      # Rspec lets us access the value of @pins instance variable using assigns[:pins]
      expect(assigns[:pins]).to eq(Pin.all)

    end

  end

  describe "GET new" do
    it 'responds with successfully' do
      get :new
      expect(response.success?).to be(true)
    end

    it 'renders the new view' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns an instance variable to a new pin' do
      get :new
      expect(assigns(:pin)).to be_a_new(Pin)
    end
  end

  describe "POST create" do
    before(:each) do
      @pin_hash = {
        title: "Rails Wizard",
        url: "http://railswizard.org",
        slug: "rails-wizard",
        text: "A fun and helpful Rails Resource",
        resource_type: "rails"}
       #should I change this so tests pass? pins_controller.rb 54 & pin.rb 2
    end

    after(:each) do
      pin = Pin.find_by_slug("rails-wizard")
      if !pin.nil?
        pin.destroy
      end
    end

    it 'responds with a redirect' do
      post :create, pin: @pin_hash
      expect(response.redirect?).to be(true)
    end

    it 'creates a pin' do
      post :create, pin: @pin_hash
      expect(Pin.find_by_slug("rails-wizard").present?).to be(true)
    end

    it 'redirects to the show view' do
      post :create, pin: @pin_hash
      expect(response).to redirect_to(pin_url(assigns(:pin)))
    end

    it 'redisplays new form on error' do
      # The title is required in the Pin model, so we'll
      # delete the title from the @pin_hash in order
      # to test what happens with invalid parameters
      @pin_hash.delete(:title)
      post :create, pin: @pin_hash
      expect(response).to render_template(:new)
    end

    it 'assigns the @errors instance variable on error' do
      # The title is required in the Pin model, so we'll
      # delete the title from the @pin_hash in order
      # to test what happens with invalid parameters
      @pin_hash.delete(:title)
      post :create, pin: @pin_hash
      expect(assigns[:errors].present?).to be(true)
    end

  end

  describe "GET edit" do
    # create a pin and use the id of that pin in your call
    before(:each) do
      @pin = Pin.first
      get :edit, :id => 1 # pin: @pin_hash # params: {id: @pin.id}
    end

    # get to pins/id/edit
    it 'responds with success' do
      get :edit, :id => 1 # @pin.id #, pin: @pin_hash
      expect(response.success?).to be(true)
    end

    it 'renders the edit temlate' do
      get :edit, :id => 1
      expect(response).to render_template(:edit)
    end

    # assigns an instance variable called @pin to the Pin with the appropriate id
    it 'assigns an instance variable called @pin to the Pin with the appropriate id' do
      get :edit, :id => 1
      expect(assigns(:pin)).to eq(Pin.first)
    end
  end

  describe "PUT update" do
    before(:each) do
      @pin = Pin.first
      get :edit, :id => 1 # pin: @pin_hash # params: {id: @pin.id}
    end
    # make a POST request to /pins with valid parameters
      # responds with success
      it 'responds with success' do
        get :edit, :id => 1 # @pin.id #, pin: @pin_hash
        expect(response.success?).to be(true)
      end
      # updates a pin
      # redirects to the show view
#      it 'redirects to the show view' do
#        post :create, :id => 1
#        expect(response).to redirect_to(pin_url(assigns(:pin)))
#      end
    # make a POST request to /pins with invalid parameters
      # assigns an @errors instance variable

      it 'renders the new view' do
        get :edit, :id => 1
        expect(response).to render_template(:edit, :id => 1)
      end
  end


end
