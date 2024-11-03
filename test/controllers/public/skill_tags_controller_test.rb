require "test_helper"

class Public::SkillTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_skill_tags_index_url
    assert_response :success
  end
end
