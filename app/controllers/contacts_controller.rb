class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    @contact = Contact.new
  end

  def new
    @contact = Contact.new
  end


  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_path(@contact)
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :first_name, :last_name, :email, :message)
  end
end
