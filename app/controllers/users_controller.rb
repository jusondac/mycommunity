class UsersController < ApplicationController
  before_action :set_role, only: %i[ show edit update destroy ]

  # GET /users
  def index
    @q = User.ransack(params[:q])
    @pagy, @users = pagy(@q.result(distinct: true).order(created_at: :desc))
    @user_form = User.new
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(role_params)

    if @user.save
      redirect_to roles_path, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(role_params)
      redirect_to roles_path, notice: "User was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
    redirect_to roles_path, notice: "User was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def role_params
      params.expect(role: [ :name ])
    end
end
