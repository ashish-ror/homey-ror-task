require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { Project.new() }

  it 'should have valid attributes' do
    project.validate
    expect(project.errors[:name]).to include("can't be blank")
    expect(project.errors[:status]).to include("can't be blank")
    project.name = 'Project 1'
    project.status = 'New'
    expect(project).to be_valid
  end
end