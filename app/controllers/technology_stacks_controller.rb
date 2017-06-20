class TechnologyStacksController < ApplicationController
  before_action :set_technology_stack, only: [:show, :edit, :update, :destroy]

  # GET /technology_stacks
  def index
    @technology_stacks = TechnologyStack.where(user: current_user)
  end

  # GET /technology_stacks/1
  def show
  end

  # GET /technology_stacks/new
  def new
    @technology_stack = TechnologyStack.new
  end

  # GET /technology_stacks/1/edit
  def edit
  end

  # POST /technology_stacks
  def create
    @technology_stack = TechnologyStack.new(technology_stack_params)

    if @technology_stack.save
      redirect_to @technology_stack, notice: 'Technology stack was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /technology_stacks/1
  def update
    if @technology_stack.update(technology_stack_params)
      redirect_to @technology_stack, notice: 'Technology stack was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /technology_stacks/1
  def destroy
    @technology_stack.destroy
    redirect_to technology_stacks_url, notice: 'Technology stack was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technology_stack
      @technology_stack = TechnologyStack.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def technology_stack_params
      params.require(:technology_stack).permit(:name, :description, :link)
            .merge(user: current_user)
    end
end
