class FormMailer < ApplicationMailer
  default from: "GumroCMS"

  def carrier_email(carriername, carrierpath)
    @carriername = carriername
    @carrierpath = carrierpath
    @subject = "New Carrier - " + @carriername

    mail(to: 'info@gumroandassociates.com', subject: @subject)
  end

  def facility_email(facilitycity, facilitypath)
    @facilitycity = facilitycity
    @facilitypath = facilitypath
    @subject = "New Facility - " + @facilitycity

    mail(to: 'info@gumroandassociates.com', subject: @subject)
  end

  def contact_email(contact)
    @contactname = contact.name
    @contactpath = contact.id
    @subject = "New Contact - " + @contactname

    mail(to: 'info@gumroandassociates.com', subject: @subject)
  end
end
