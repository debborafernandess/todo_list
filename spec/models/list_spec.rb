require 'rails_helper'

RSpec.describe List, type: :model do
  it { should validate_presence_of :name }

  before do
    @user        = create(:user)
    @second_user = create(:user)
  end

  context "#owner?" do
    before do
      @list = build(:list, :public, user: @user)
    end

    it { expect(@list.owner?(@user)).to be_truthy }
    it { expect(@list.owner?(@second_user)).to be_falsey }
  end

  context ".publics" do
    context "when found public and private lists" do
      it 'returns only public lists' do
        public_list = create(:list, :public)
        private_list = create(:list, :private)

        expect(described_class.publics).to include(public_list)
        expect(described_class.publics).not_to include(private_list)
      end
    end
  end

  context ".publics_and_owned(@user)" do
    context 'when user has no lists' do
      it 'returns only public lists' do
        public_list = create(:list, :public)
        private_list = create(:list, :private)

        expect(described_class.publics_and_owned(@user)).to include(public_list)
        expect(described_class.publics_and_owned(@user)).not_to include(private_list)
      end
    end

    context 'when user has lists' do
      it 'returns public and owned lists' do
        public_list = create(:list, :public)
        private_list = create(:list, :private, user: @user)

        expect(described_class.publics_and_owned(@user)).to include(public_list)
        expect(described_class.publics_and_owned(@user)).to include(private_list)
      end
    end

    context 'when there is only private lists' do
      it 'returns only owned lists' do
        not_owned_list = create(:list, :private)
        private_list = create(:list, :private, user: @user)

        expect(described_class.publics_and_owned(@user)).to include(private_list)
        expect(described_class.publics_and_owned(@user)).not_to include(not_owned_list)
      end
    end
  end
end
