class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
    render :show
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.create(pin_params)
    if @pin.valid?
      @pin.save
      redirect_to "/pins/#{@pin.id}"
    else # copied from mvc_sinatra app # if using exception, see mvc-anagram,index & word.rb
#      @pin.errors.full_messages.each do |msg|
#        @errors = "#{@errors} #{msg}."
        # @error = "message" # from mvc_sinatra
        @errors = @pin.errors
        render :new
      end
  end

  def edit
#    @pin = Pin.find(pin_params)
#    erb :'/pins/:id/edit'
  end

  def update
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id) #:resource_type makes test pass but doesn't work (????)
  end
end
