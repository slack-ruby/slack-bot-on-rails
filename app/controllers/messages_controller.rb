class MessagesController < ApplicationController
  def index
    data = (1..10).map do |i|
      { id: i, message: Rails.cache.read(i) }
    end
    render json: data
  end
end
