class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = 'お問い合わせを受け付けました'
      redirect_to root_path
    else
    	flash[:notice]="error"
      render :new
    end
	end

	private

  def contact_params
    params.require(:contact).permit(:name, :email, :title, :body)
  end

end
