class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups or /groups.json
  def index
    @groups = Group.where(user_id: current_user.id).order(created_at: :desc)
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
    @group.user = current_user
    respond_to do |format|
      if @group.save
        format.html { redirect_to "/groups/#{@group.id}/expenditures", notice: 'Group was successfully created.' }
        # format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :user_id, :icon)
  end
end
