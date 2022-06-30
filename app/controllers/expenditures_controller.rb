class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: %i[show edit update destroy]

  # GET /expenditures or /expenditures.json
  def index
    @expenditures = Expenditure.where(group_id: params['group_id']).order(created_at: :desc)
  end

  # GET /expenditures/new
  def new
    @expenditure = Expenditure.new
  end

  # POST /expenditures or /expenditures.json
  def create
    @expenditure = Expenditure.new(expenditure_params)
    @expenditure['group_id'] = params['group_id']
    @expenditure.author = current_user
    respond_to do |format|
      if @expenditure.save
        format.html do
          redirect_to "/groups/#{params['group_id']}/expenditures"
        end
        # format.json { render :show, status: :created, location: @expenditure }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expenditure
    @expenditure = Expenditure.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expenditure_params
    params.require(:expenditure).permit(:author_id, :group_id, :name, :amount)
  end
end
