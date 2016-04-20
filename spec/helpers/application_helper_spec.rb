require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#greeting" do
    it "returns the user name" do
      user = create(:user)
byebug
      # allow(user).to receive(:authenticate_user!).and_return(true)
      expect(helper.greeting).to eq(user.name)
    end
  end

  describe "#label_favorite" do
    it "unfavorited yet" do
      user = create(:user)
      list = create(:list)

      # allow(user).to receive(:authenticate_user!).and_return(true)

      expect(helper.label_favorite(list)).to eq('Favorite')
    end

    it "favorited" do
      user = create(:user)
      list = create(:list)
      favorite = create(:favorite, user: user, list: list)

      # allow(user).to receive(:authenticate_user!).and_return(true)

      expect(helper.label_favorite(list)).to eq('Favorited')
    end
  end
end
