class ContactsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_contact, only: %i[show edit update destroy]
  before_action :all_contacts

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.search(params)
  end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:notice] = 'Contact was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    if @contact.update(contact_params)
      flash[:notice] = "Contact updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy
    flash[:notice] = "Contact removed"
    render turbo_stream: [
      turbo_stream.update("flash", partial: "shared/flash"),
      turbo_stream.remove(dom_id(@contact)),
      turbo_stream.update("contacts-count", partial: "contacts/count", locals: { contacts: @contacts })
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params.require(:id))
    end

    def contact_params
      params.require(:contact).permit(:name, :age, :email)
    end
    # def contact_params
    #   params.require(:contact).permit!
    # end

    def all_contacts
      @contacts = Contact.all
    end

end
