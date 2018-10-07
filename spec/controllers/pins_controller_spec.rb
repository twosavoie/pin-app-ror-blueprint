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
      # Rspec lets us access the value of @pins intance variable using assigns[:pins]
      expect(assigns[:pins]).to eq(Pin.all)

    end

  end

end
