class ProjectsController < ApplicationController
	def create
		@project = Project.new({:name => params[:name]})
		if @project.save
			redirect_to '/'
		else
			render 'new'
		end
	end

	private
	def project_params
		params.require(@project).permit(:name)
	end
end
