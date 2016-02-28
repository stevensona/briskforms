require 'securerandom'

class FormController < ApplicationController

  protect_from_forgery except: :submit

  def new
  end

  def create
    @form = Form.new
    #@form.source_url = params['source_url']
    @form.email = params['email']
    @form.success_url = params['success_url']
    #@form.failure_url = params['failure_url']
    @form.url = SecureRandom.hex
    @form.admin_url = SecureRandom.hex
    @form.confirm_url = SecureRandom.hex
    @form.confirmed = false
    if @form.save
      FormMailer.form_confirmation(@form).deliver_now
      flash[:notice] = "Form action handler created"
      redirect_to "/show/#{@form.admin_url}"
    else
      flash[:error] = "Please fill out the form completely."
      redirect_to "/new"
    end
  end

  def confirm
    @form = Form.find_by! confirm_url: params[:id]
    @form.confirmed = true
    @form.save
    if @form.save
      flash[:notice] = "Thank you for confirming your email. Your form is now ready to use."
      redirect_to "/show/#{@form.admin_url}"
    else
      flash[:error] = "Something went wrong."
      redirect_to root_path
    end

  end

  def delete
    Form.where(admin_url: params[:id]).destroy_all 
    flash[:notice] = "Form action handler destroyed"
    redirect_to '/new'
  end

  def show
    @form = Form.find_by! admin_url: params[:id]
    flash.now[:error] = "This form has not yet been confirmed. Please check your email for a link." if not @form.confirmed
  end

  def submit
    #TODO throttle submission rate to 10 per form per hour?
    @form = Form.find_by! url: params[:id]

    if @form.confirmed
      FormMailer.form_submission(@form, params).deliver_now
      respond_to do |format|
        format.json do
          render :json => {
            :status => :ok,
            :message => 'form submitted'
          }, :callback => params['callback']
        end
        format.html { redirect_to @form.success_url }
      end
    else
      respond_to do |format|
        format.json do
          render :json => {
            :status => :error,
            :message => 'form not activated'
          }, :callback => params['callback']
        end
        format.html { redirect_to @form.success_url } #fail silently
      end
    end
  end
end
