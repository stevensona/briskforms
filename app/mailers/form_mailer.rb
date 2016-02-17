class FormMailer < ApplicationMailer
  default from: 'admin@frmactn.com'

  def form_submission(form, contents)
    @contents = contents
    @form = form
    mail(to: @form.email, subject: 'Form Submission')
  end
end
