# Preview all emails at http://localhost:3000/rails/mailers/form_mailer
class FormMailerPreview < ActionMailer::Preview
  def carrier_email_preview
    FormMailer.carrier_email(Carrier.first.name, Carrier.first.id)
  end

  def facility_email_preview
    FormMailer.facility_email
  end

  def contact_email_preview
    FormMailer.contact_email
  end
end
