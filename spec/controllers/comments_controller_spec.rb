require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { User.create(email: 'b@b.com', password: '123') }
  let(:project) { Project.create(name: 'Project 1', status: 'New') }
  let(:comment) { FactoryBot.create(:comment, project: project, user: user) }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new comment" do
        expect {
          post :create, params: { project_id: project.id, comment: { content: 'Comment 1', user_id: user.id } }, session: { user_id: user.id }
        }.to change(Comment, :count).by(1)
      end
    end

    context "with invalid params" do
      it "does not create a new comment" do
        expect {
          post :create, params: { project_id: project.id, comment: { content: '' } }, session: { user_id: user.id }
        }.not_to change(Comment, :count)
      end
    end
  end
end