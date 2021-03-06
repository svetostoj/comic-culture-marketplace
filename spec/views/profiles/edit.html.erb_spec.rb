require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :first_name => "MyString",
      :last_name => "MyString",
      :image_data => "MyString",
      :short_bio => "MyText",
      :superpowers => "MyString",
      :favourites => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "input[name=?]", "profile[image_data]"

      assert_select "textarea[name=?]", "profile[short_bio]"

      assert_select "input[name=?]", "profile[superpowers]"

      assert_select "input[name=?]", "profile[favourites]"
    end
  end
end
