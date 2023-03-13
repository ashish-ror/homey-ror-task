class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.create(comment_params)
    redirect_to @project, notice: "Comment was successfully created."
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :project_id, :user_id)
    end
end
