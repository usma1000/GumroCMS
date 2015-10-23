class FormMailer < ApplicationMailer
  default from: "GumroCMS"

  def carrier_email(carriername, carrierpath)
    @carriername = carriername
    @carrierpath = carrierpath
    @subject = "Carrier Form - " + @carriername

    mail(to: 'anandu@gumroandassociates.com', subject: @subject)
  end

  def facility_email
    mail(to: 'info@gumroandassociates.com', subject: 'Facility Form Submitted')
  end

  def contact_email
    mail(to: 'info@gumroandassociates.com', subject: 'Contact Form Submitted')
  end
end
