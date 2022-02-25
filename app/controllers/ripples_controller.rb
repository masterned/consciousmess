class RipplesController < ApplicationController
  before_action :set_ripple, only: %i[ show edit update destroy ]

  # GET /ripples or /ripples.json
  def index
    session[:frame_offset] ||= 0
    @ripples = Ripple.order(created_at: :desc).slice(session[:frame_offset] * 10, 10)
  end

  # GET /ripples/1 or /ripples/1.json
  def show
  end

  # GET /ripples/new
  def new
    @ripple = Ripple.new
  end

  # POST /ripples or /ripples.json
  def create
    @ripple = Ripple.new(ripple_params)

    respond_to do |format|
      if @ripple.save
        format.html { redirect_to ripples_index_url, notice: "Ripple was successfully created." }
        format.json { render :show, status: :created, location: @ripple }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ripple.errors, status: :unprocessable_entity }
      end
    end
  end

  def newest
    session[:frame_offset] = 0

    respond_to do |format|
      format.html { redirect_to ripples_index_url}
    end
  end

  def previous_10
    session[:frame_offset] -= 1 unless first_frame_offset?
    
    respond_to do |format|
      format.html { redirect_to ripples_index_url}
    end
  end

  def next_10
    session[:frame_offset] += 1 unless last_frame_offset?
    
    respond_to do |format|
      format.html { redirect_to ripples_index_url}
    end
  end

  def oldest
    session[:frame_offset] = number_of_frame_offsets

    respond_to do |format|
      format.html { redirect_to ripples_index_url}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ripple
      @ripple = Ripple.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ripple_params
      params.require(:ripple).permit(:name, :url, :message)
    end

    def number_of_frame_offsets
      (Ripple.order(created_at: :desc).length / 10).ceil
    end

    def first_frame_offset?
      session[:frame_offset] <= 0
    end

    def last_frame_offset?
      session[:frame_offset] >= number_of_frame_offsets
    end
end
