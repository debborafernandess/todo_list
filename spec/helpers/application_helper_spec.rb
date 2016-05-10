require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#greeting" do
    it "returns the user name" do
      user = create(:user)
      sign_in user
      expect(helper.greeting).to eq(user.name)
    end
  end

  describe "#label_favorite" do
    it "unfavorited yet" do
      user = create(:user)
      list = create(:list)
      sign_in user

      expect(helper.label_favorite(list)).to eq('Favorite')
    end

    it "favorited" do
      user = create(:user)
      list = create(:list)
      create(:favorite, user: user, list: list)
      sign_in user

      expect(helper.label_favorite(list)).to eq('Favorited')
    end
  end
end
