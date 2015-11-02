class ApplicantsController < ApplicationController

  respond_to :html, :json

  before_action :find_applicant, only: [:edit, :index, :update, :destroy]

  def index
    @applicants = Applicant.order("LOWER(last_name), LOWER(first_name)")
  end

  def edit
  end

  def update
    @applicant = Applicant.find(params[:id]) if params[:id]
    @applicant.update(applicant_params)
    redirect_to applicants_path
  end

  def destroy
      @applicant.destroy
      respond_to do |format|
        format.html { redirect_to applicants_path,
                      notice: "Your action completed successfully." }
        format.json { head :no_content }
      end
  end

  private
  def find_applicant
    @applicant = Applicant.find(params[:id]) if params[:id]
  end


  def applicant_params
    params.require(:applicant).permit(:address_1,
                                      :address_2,
                                      :city,
                                      :email_address,
                                      :first_name,
                                      :home_telephone_number,
                                      :last_name,
                                      :mobile_telephone_number,
                                      :state,
                                      :under_18,
                                      :work_telephone_number,
                                      :zip_code,
    )
  end
end
