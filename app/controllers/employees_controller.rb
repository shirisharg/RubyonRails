class EmployeesController < ApplicationController
	
	helper_method :format_string
	attr_accessor :skills

	def create
    	@employee = Employee.new(employee_params)
    	@employee.skills << params[:employee][:skills]
	    if @employee.save
    	  redirect_to '/'
	    else
    	  render 'new'
	    end
 	end

	def new
    	@employee = Employee.new
	end

	def index 
		@employee = Employee.all
	end

	def show
		@employee = Employee.find(params[:id])
		@project = Project.find(@employee.project_id)
	end

	def format_string(str)
		return str.upcase
	end

	def team_details
		@employee = Employee.select('employees.name, COUNT(*) as skill_count').where('employees.employee_id = ?', params[:id]).joins(:skills).group('employees_skills.employee_id').order('COUNT(*) DESC')
	end

	private
    def employee_params
    	skills_array = []
		params[:employee][:skills].map! do |sk|
    		skills_array << Skill.find(sk.to_i) if sk.to_i != 0
    	end
      params[:employee][:skills] = skills_array
	  params.require(:employee).permit(:name, :project_id, :employee_id, { :skills => [:id] })
    end
 
end
