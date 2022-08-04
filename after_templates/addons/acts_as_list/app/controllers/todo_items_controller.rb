class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: %i[
    show
    edit
    update
    destroy
    insert_at
    move_lower
    move_higher
    move_to_bottom
    move_to_top
    remove_from_list
  ]

  before_action :set_todo_items, only: %i[
    index
    insert_at
    move_lower
    move_higher
    move_to_bottom
    move_to_top
    remove_from_list
  ]

  # GET /todo_items or /todo_items.json
  def index
  end

  # GET /todo_items/1 or /todo_items/1.json
  def show
  end

  def insert_at
    @todo_item.insert_at(2)
    render :index, params
  end

  def move_lower
    @todo_item.move_lower
    render :index, params
  end

  def move_higher
    @todo_item.move_higher
    render :index, params
  end

  def move_to_bottom
    @todo_item.move_to_bottom
    render :index, params
  end

  def move_to_top
    @todo_item.move_to_top
    render :index, params
  end

  def remove_from_list
    @todo_item.remove_from_list
    render :index, params
  end

  # GET /todo_items/new
  def new
    @todo_item = TodoItem.new
  end

  # GET /todo_items/1/edit
  def edit
  end

  # POST /todo_items or /todo_items.json
  def create
    @todo_item = TodoItem.new(todo_item_params)

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to todo_item_url(@todo_item), notice: "Todo item was successfully created." }
        format.json { render :show, status: :created, location: @todo_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_items/1 or /todo_items/1.json
  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to todo_item_url(@todo_item), notice: "Todo item was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_items/1 or /todo_items/1.json
  def destroy
    @todo_item.destroy

    respond_to do |format|
      format.html { redirect_to todo_items_url, notice: "Todo item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def query_params
    params.permit(:todo_list_id)
  end
  helper_method :query_params

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
    end

    def set_todo_items
      todo_list_id = params[:todo_list_id]

      @todo_items = todo_list_id.nil? ? TodoItem.all : TodoItem.where(todo_list_id: todo_list_id)
      @todo_items = @todo_items.order(:todo_list_id, :position)
    end

    # Only allow a list of trusted parameters through.
    def todo_item_params
      params.require(:todo_item).permit(:task, :position, :todo_list_id)
    end
end
