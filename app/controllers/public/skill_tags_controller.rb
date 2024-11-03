class Public::SkillTagsController < ApplicationController
  def index
    @skill_tags = SkillTag.all
  end
end
