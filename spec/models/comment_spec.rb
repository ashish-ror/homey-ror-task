require 'rails_helper'

RSpec.describe Comment, type: :model do
	let(:user) { User.create(email: 'b@b.com', password: '123') }
	let(:project) { Project.create(name: 'Project 1', status: 'New') }
  let(:comment) { Comment.new() }

  it 'should have valid attributes' do
    comment.validate
    expect(comment.errors[:project]).to include("must exist")
    expect(comment.errors[:user]).to include("must exist")
    expect(comment.errors[:content]).to include("can't be blank")
    comment.project = project
    comment.user = user
    comment.content = 'Valid Comment'
    expect(comment).to be_valid
  end
end