class Public::SkillTagsController < ApplicationController
  def index
    @skill_tags = SkillTag.all
  end

  def create
    @skill_tag = SkillTag.new(skill_tag_params)
    if @skill_tag.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def skill_tag_params
    params.require(:skill_tag).permit(:name, :skill_tag_image)
  end
end
