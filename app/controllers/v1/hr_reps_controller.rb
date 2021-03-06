class V1::HrRepsController < ApplicationController

  def create
    hr_rep = HrRep.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      phone_1: params[:phone_1],
      phone_2: params[:phone_2]

    )
    if hr_rep.save
      render json: {message: 'Hr Rep created successfully'}, status: :created
    else
      render json: {errors: hr_rep.errors.full_messages}, status: :bad_request
    end
  end

  def index
    hr_reps = HrRep.all
    render json: hr_reps.as_json
  end 

  def dashboard
   p "*****************"
    p current_hr_rep
    p "*****************"
    dashboard = current_hr_rep.business.jobs.first.matches.limit(5)

render :json => dashboard.to_json(:include =>  :job_seeker )

    # render json: hr_rep.as_json
    # render :json => dashboard.to_json(include: [:job, :business, :zip, :occupation, :experience, :work_value, :awesomeness, :file_upload ])
  end

  def update 
    the_id = params[:id]
    hr_rep = HrRep.find_by(id: the_id)
    hr_rep.update(
      title: params[:title],
      name: params[:name],
      phone_1: params[:phone_1],
      phone_2: params[:phone_2],
      email: params[:email], 
    )
    render json: hr_rep.as_json
  end 

  def destroy
    the_id = params[:id]
    hr_rep = HrRep.find_by(id: the_id)
    hr_rep.destroy
    render json: {message:"This hr_rep has been deleted"}
  end
end