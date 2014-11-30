class SkillsController < ApplicationController

  def list
    @skills = ActsAsTaggableOn::Tag.where('name like ?', "%#{params[:q]}%")

    respond_to do |format|
      format.json { render json: @skills.map{|s| {id: s.name, text: s.name } } }
    end
  end

end
