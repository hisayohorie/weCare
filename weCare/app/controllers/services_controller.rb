class ServicesController < ApplicationController
  before_action :login, only: %i(edit update)

  def index
    @services = Service.all
  end
end

  def new
    @service = Service.new

    respond_to do |format|
      format.html
      format.js
    end

  end

  def create

    if current_user
      @service = current_user.build(service_params)
      if @service.save
        redirect_to @service
      else
        render :new
      end
    else
      render :new, alert: "You need to login"
    end

  end

  def edit
    @service = Service.find(params[:id])
    if current_user
      if @service.update_attributes(service_params)
        redirect_to @service
      else
        render :edit
      end
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if current_user
      if @service.update_attributes(service_params)
        redirect_to @service
      else
        render :edit
      end
    end
  end

  def destroy
  end

  private
  def service_params
    params.require(:project).permit(:profile_id, :infant_care, :toddler_care, :tween_care, :teenage_care)
end
