class CommunitiesController < ApplicationController
  before_action :set_community, only: %i[ show edit update destroy ]

  # GET /communities
  def index
    @q = Current.user.admin? ? Community.ransack(params[:q]) : Community.my_community.ransack(params[:q])
    @pagy, @communities = pagy(@q.result(distinct: true).order(created_at: :desc))
    @community_form = Community.new
  end

  # GET /communities/1
  def show
    @q = @community.events.ransack(params[:q])
    @pagy_all, @all_events = pagy(@q.result(distinct: true).order(created_at: :desc), limit: 5)
    @pagy_upcoming, @upcoming_events = pagy(@q.result(distinct: true).where(status: "upcoming").order(created_at: :desc), limit: 5)
    @pagy_ongoing, @ongoing_events = pagy(@q.result(distinct: true).where(status: "ongoing").order(created_at: :desc), limit: 5)
    @pagy_completed, @completed_events = pagy(@q.result(distinct: true).where(status: "completed").order(created_at: :desc), limit: 5)
    @pagy_members, @members = pagy(@community.members.ransack(params[:q]).result(distinct: true).order(created_at: :desc), limit: 5)
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
