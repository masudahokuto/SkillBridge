skill_tags = [
  { name: 'ruby', image_path: Rails.root.join('app/assets/images/skill_logo/ruby.png') },
  { name: 'rails', image_path: Rails.root.join('app/assets/images/skill_logo/rails.png') }
]

# SkillTagを作成または取得
skill_tags.each do |skill|
  skill_tag = SkillTag.find_or_create_by(name: skill[:name]) do |tag|
    # 新しく作成する場合、画像をアタッチ
    tag.skill_tag_image.attach(
      io: File.open(skill[:image_path]),
      filename: "#{skill[:name]}.png",
      content_type: 'image/png'
    )
  end

  # 既存のSkillTagに画像が未添付の場合、画像をアタッチ
  if skill_tag.skill_tag_image.blank?
    skill_tag.skill_tag_image.attach(
      io: File.open(skill[:image_path]),
      filename: "#{skill[:name]}.png",
      content_type: 'image/png'
    )
  end
end
