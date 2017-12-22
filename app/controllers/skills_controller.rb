class SkillsController < ApplicationController

	def create 
		@skill = Skill.new({:name => params[:name]})
		if @skill.save
			redirect_to '/'
		else
			redirect_to 'new'
		end
	end

	private
	def skills_params
		params.require(@skill).permit(:name)
	end

end
