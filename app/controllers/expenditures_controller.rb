class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: %i[show edit update destroy]

  # GET /expenditures or /expenditures.json
  def index
    @expenditures = Expenditure.where(group_id: params['group_id']).order(created_at: :desc)
  end

  # GET /expenditures/1 or /expenditures/1.json
  def show; end

  # GET /expenditures/new
  def new
    @expenditure = Expenditure.new
  end

  # GET /expenditures/1/edit
  def edit; end

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

  # PATCH/PUT /expenditures/1 or /expenditures/1.json
  def update
    respond_to do |format|
      @expenditure['group_id'] = params['group_id']
      @expenditure.author = current_user
      if @expenditure.update(expenditure_params)
        format.html do
          redirect_to "/groups/#{params['group_id']}/expenditures/#{@expenditure.id}",
                      notice: 'Expenditure was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @expenditure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenditures/1 or /expenditures/1.json
  def delete
    @expenditure = Expenditure.find(params['id'])
    @expenditure.destroy

    respond_to do |format|
      format.html do
        redirect_to "/groups/#{params['group_id']}/expenditures", notice: 'Expenditure was successfully destroyed.'
      end
      format.json { head :no_content }
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
