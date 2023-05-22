class VotesController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    @link.upvote
    redirect_to root_path
  end

  def destroy
    @link = Link.find(params[:link_id])
    @link.downvote
    redirect_to root_path
  end
end
