class FormMailer < ApplicationMailer
  default from: "GumroCMS"

  def carrier_email
    mail(to: 'anandu@gumroandassociates.com', subject: 'Carrier Form Submitted')
  end
end
