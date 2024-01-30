class RoomsController < ApplicationController
  def show
    p @messages = Message.all
  end
end
