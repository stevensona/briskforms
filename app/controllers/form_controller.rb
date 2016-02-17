require 'securerandom'
class FormController < ApplicationController

  protect_from_forgery except: :submit

  def new
  end

  def create
    @form = Form.new
    @form.source_url = params['source_url']
    @form.email = params['email']
    @form.success_url = params['success_url']
    @form.failure_url = params['failure_url']
    @form.url = SecureRandom.hex
    @form.admin_url = SecureRandom.hex
    if @form.save
      flash[:notice] = "Form Action handler created!"
      redirect_to "/form/info/#{@form.admin_url}"
    else
      flash[:error] = "Something went wrong. Please fill out the form completely."
      redirect_to "/form/new"
    end

  end

  def delete
    Form.where(admin_url: params[:id]).destroy_all 
    flash[:notice] = "Form Action handler destroyed"
    redirect_to root_path
  end

  def info
    @form = Form.find_by! admin_url: params[:id]
  end

  def submit
    #TODO throttle submission rate to 10 per form per hour?
    @form = Form.find_by! url: params[:id]
    FormMailer.form_submission(@form, params).deliver_now
    redirect_to @form.success_url #TODO direct to failure if something fucks up
  end
end
