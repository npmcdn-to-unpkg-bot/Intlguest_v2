class StudentprofilesController < ApplicationController
	before_action :set_studentprofile

	def index
	end

	def new
		@studentprofile = Studentprofile.new
	end 

	def create
		@studentprofile = Studentprofile.new(studentprofile_params)
		if @studentprofile.save
			redirect_to root_path, notice: "New profile created"
		else
			flash[:alert] = "There was a problem."
			render :new
		end 
	end 

	def show
	end 

	private

	def set_studentprofile
		@studentprofile = Studentprofile.find(params[:id])
	end

	def studentprofile_params 
		params.require(:studentprofile).permit(:fname, :lname, :bio, :university, :zipcode, :planguage, :slanguage, :smoker, :allergies, :all_desc, :startduration, :endduration, :phone, :image).merge(student: current_student)
	end 
end
