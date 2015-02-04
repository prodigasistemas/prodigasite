class Contacts < ActionMailer::Base
  default from: "no-reply@prodigasistemas.com.br"

  def contact_message(contact_params)
    @name = contact_params[:name]
    @email = contact_params[:email]
    @phone = contact_params[:phone]
    @message = contact_params[:message]

    mail to: "contato@prodigasistemas.com.br", subject: "Contato pelo Site"
  end

end
