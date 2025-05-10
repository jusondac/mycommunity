class FinancesController < ApplicationController
  before_action :set_finance, only: %i[ show edit update destroy ]

  # GET /finances
  def index
    @q = Finance.ransack(params[:q])
    @pagy, @finances = pagy(@q.result(distinct: true).order(created_at: :desc))
    @finance_form = Finance.new
  end

  # GET /finances/1
  def show
  end

  # GET /finances/new
  def new
    @finance = Finance.new
  end

  # GET /finances/1/edit
  def edit
  end

  # POST /finances
  def create
    @finance = Finance.new(finance_params)

    if @finance.save
      redirect_to finances_path, notice: "Finance was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /finances/1
  def update
    if @finance.update(finance_params)
      redirect_to finances_path, notice: "Finance was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /finances/1
  def destroy
    @finance.destroy!
    redirect_to finances_path, notice: "Finance was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finance
      @finance = Finance.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def finance_params
      params.expect(finance: [ :community_id, :description, :price, :period, :balance ])
    end
end
