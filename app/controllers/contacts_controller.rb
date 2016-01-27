class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:notice] = "Your information has been sent"
      redirect_to root_path
    else
      flash[:warning] = "There was a problem sending your information"
      redirect_to new_contact_path
    end
  end


  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])

    if @contact.destroy
      flash[:notice] = "Contact deleted"
      redirect_to contacts_path
    else
      flash[:alert] = "Contact did not delete"
      redirect_to contacts_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:email,:body)
  end
end
