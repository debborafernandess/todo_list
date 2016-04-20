require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#greeting" do
    xit "returns the user name" do
      user = double('user')
        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
        allow(controller).to receive(:current_user).and_return(user)


      # user = create(:user)

      # allow(user).to receive(:authenticate_user!).and_return(true)
      expect(helper.greeting).to eq(user.name)
    end
  end
end
