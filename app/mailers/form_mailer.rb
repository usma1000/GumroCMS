class FormMailer < ApplicationMailer
  default from: "GumroCMS"

  def carrier_email
    mail(to: 'info@gumroandassociates.com', subject: 'Carrier Form Submitted')
  end

  def facility_email
    mail(to: 'info@gumroandassociates.com', subject: 'Facility Form Submitted')
  end

  def contact_email
    mail(to: 'info@gumroandassociates.com', subject: 'Contact Form Submitted')
  end
end
