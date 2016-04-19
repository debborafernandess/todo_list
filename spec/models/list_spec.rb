require 'rails_helper'

RSpec.describe List, type: :model do
  before(:example) do
    @user        = create(:user)
    @second_user = create(:user)
    @list = build(:list, user: @user)
  end

  context "#owner?" do
    it { expect(@list.owner?(@user)).to be_truthy }
    it { expect(@list.owner?(@second_user)).to be_falsey }
  end

end
