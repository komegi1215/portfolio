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
      # ContactMailer.contact_mail(@contact).deliver
      redirect_to contacts_path, notice: 'Your message has been sent'
    else
      render 'index', status: :unprocessable_entity
    end
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end

  def done
    @contact = Contact.new(contact_params)
    if params[:back]
      render :action => 'index'
    else
      ContactMailer.send_mail(@contact).deliver_now
      render :action => 'done'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :first_name, :last_name, :email, :message)
  end
end
