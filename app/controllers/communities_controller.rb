class CommunitiesController < ApplicationController
  before_action :set_community, only: %i[ show edit update destroy ]

  # GET /communities
  def index
    @q = Community.ransack(params[:q]) if Current.user.admin?
    @q = Community.my_community.ransack(params[:q]) if Current.user.admin?.eql?("Member")
    @pagy, @communities = pagy(@q.result(distinct: true).order(created_at: :desc))
    @community_form = Community.new
  end

  # GET /communities/1
  def show
  end

  # GET /communities/new
  def new
    @community = Community.new
  end

  # GET /communities/1/edit
  def edit
  end

  # POST /communities
  def create
    @community = Community.new(community_params)

    if @community.save
      redirect_to communities_path, notice: "Community was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /communities/1
  def update
    if @community.update(community_params)
      redirect_to communities_path, notice: "Community was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /communities/1
  def destroy
    @community.destroy!
    redirect_to communities_path, notice: "Community was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def community_params
      params.expect(community: [ :name, :descriptions ])
    end
end
