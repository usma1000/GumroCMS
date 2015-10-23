# Preview all emails at http://localhost:3000/rails/mailers/form_mailer
class FormMailerPreview < ActionMailer::Preview
  def carrier_email_preview
    FormMailer.carrier_email
  end
end
