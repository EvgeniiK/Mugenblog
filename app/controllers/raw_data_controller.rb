class RawDataController < ApplicationController
  before_action :set_raw_datum, only: [:show, :edit, :update, :destroy]

  # GET /raw_data
  # GET /raw_data.json
  def index
    @raw_data = RawDatum.all
    new
  end

  # GET /raw_data/1
  # GET /raw_data/1.json
  def show
  end

  # GET /raw_data/new
  def new
    @raw_datum = RawDatum.new
  end

  # GET /raw_data/1/edit
  def edit
  end

  # POST /raw_data
  # POST /raw_data.json
  def create
    @raw_datum = RawDatum.new(raw_datum_params)

    respond_to do |format|
      if @raw_datum.save
        format.html { redirect_to raw_data_url,
                      notice: 'Raw datum was successfully created.' }
        format.json { render :show, status: :created, location: @raw_datum }
      else
        format.html { render :new }
        format.json { render json: @raw_datum.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_data/1
  # PATCH/PUT /raw_data/1.json
  def update
    respond_to do |format|
      if @raw_datum.update(raw_datum_params)
        format.html { redirect_to @raw_datum,
                      notice: 'Raw datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @raw_datum }
      else
        format.html { render :edit }
        format.json { render json: @raw_datum.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_data/1
  # DELETE /raw_data/1.json
  def destroy
    @raw_datum.destroy
    respond_to do |format|
      format.html { redirect_to raw_data_url,
                    notice: 'Raw datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_datum
      @raw_datum = RawDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_datum_params
      params.require(:raw_datum).permit(:theme, :command, :description, :link)
    end
end
