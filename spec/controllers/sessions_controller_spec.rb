require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { User.create(email: 'b@b.com', password: '123') }

  describe "POST #create" do
    context "with valid login credentials" do
      before do
        post :create, params: { email: user.email, password: user.password }
      end

      it "logs in the user" do
        expect(session[:user_id]).to eq(user.id)
      end
    end

    context "with invalid login credentials" do
      before do
        post :create, params: { email: user.email, password: "invalid_password" }
      end

      it "does not log in the user" do
        expect(session[:user_id]).to be_nil
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      session[:user_id] = user.id
      delete :destroy
    end

    it "logs out the user" do
      expect(session[:user_id]).to be_nil
    end

  end
end
