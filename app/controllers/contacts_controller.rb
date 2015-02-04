class ContactsController < ApplicationController

  def create
    if params_valid?
      Contacts.contact_message(contact_params).deliver
      respond_to do |format|
        format.json  { render :json => {text: "Mensagem enviada com sucesso!", response: "success"} }
      end
    else
      respond_to do |format|
        format.json  { render :json => {text: "Error ao enviar a mensage, por favor outra hora!", response: "success"} }
      end
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :phone, :message)
  end
end
