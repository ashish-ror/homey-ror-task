require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { User.create(email: 'b@b.com', password: '123') }
  let(:project) { Project.create(name: 'Project 1', status: 'New') }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: project.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new project" do
        expect {
          post :create, params: { project:  { name: 'Project 1', status: 'New' } }
        }.to change(Project, :count).by(1)
      end
    end

    context "with invalid params" do
      it "does not create a new project" do
        expect {
          post :create, params: { project: { name: '' } }
        }.not_to change(Project, :count)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      it "updates the project" do
        patch :update, params: { id: project.id, project: { name: 'New Name' } }
        project.reload
        expect(project.name).to eq 'New Name'
      end
    end

    context "with invalid params" do
      it "does not update the project" do
        patch :update, params: { id: project.id, project: { name: '' } }
        project.reload
        expect(project.name).not_to eq ''
      end
    end
  end
end