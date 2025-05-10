class FinancialsController < ApplicationController
  before_action :set_financial, only: %i[ show edit update destroy ]

  # GET /financials
  def index
    @q = Financial.ransack(params[:q])
    @pagy, @financials = pagy(@q.result(distinct: true).order(created_at: :desc))
    @financial_form = Financial.new
  end

  # GET /financials/1
  def show
  end

  # GET /financials/new
  def new
    @financial = Financial.new
  end

  # GET /financials/1/edit
  def edit
  end

  # POST /financials
  def create
    @financial = Financial.new(financial_params)

    if @financial.save
      redirect_to financials_path, notice: "Financial was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /financials/1
  def update
    if @financial.update(financial_params)
      redirect_to financials_path, notice: "Financial was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /financials/1
  def destroy
    @financial.destroy!
    redirect_to financials_path, notice: "Financial was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial
      @financial = Financial.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def financial_params
      params.expect(financial: [ :community_id, :description, :price, :period ])
    end
end
