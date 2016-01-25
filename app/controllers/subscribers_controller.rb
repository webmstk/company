class SubscribersController < ApplicationController
  before_action :load_subscriber, only: [:destroy, :notify]

  def create
    @subscriber = Subscriber.new(subscriber_params)
    authorize @subscriber

    @subscriber.save
  end

  def destroy
    authorize @subscriber
    @subscriber.destroy
  end

  def notify
    authorize @subscriber
    @subscriber.notify
  end


  private

  def load_subscriber
    @subscriber = Subscriber.find(params[:id])
  end

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end