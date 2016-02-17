class FormMailer < ApplicationMailer
  default from: 'admin@briskforms.com'

  def form_submission(form, contents)
    @contents = contents
    @form = form
    mail(to: @form.email, subject: 'Form Submission')
  end

  def form_confirmation(form)
    @form = form
    mail(to: @form.email, subject: 'Confirm Form Creation')
  end

end
