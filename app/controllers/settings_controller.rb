class SettingsController < ApplicationController

  def index
    @subscriber = Subscriber.new
    @subscribers = Subscriber.all

    authorize :setting, :index?
  end
end