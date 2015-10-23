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

  def contact_email(contactname, contactpath)
    @contactname = contactname
    @contactpath = contactpath
    @subject = "New Contact - " + @contactname

    mail(to: 'info@gumroandassociates.com', subject: @subject)
  end
end
