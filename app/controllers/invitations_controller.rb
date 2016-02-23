class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:update, :destroy]
  before_filter :authenticate_user!, :except => [:update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @invitations = current_user.invitations.all
  end

  def show
  end

  def update
    if @invitation.updated_at == @invitation.created_at
      respond_to do |format|
        if @invitation.update(invitation_params)
          format.html { redirect_to root_path, notice: "Thanks #{@user.first_name}, you have accepted an invitation to #{@invitation.restaurant.title} restaurant." }
        else
          format.html { render :edit }
          format.json { render json: @invitation.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: "This invitation has been handled" }
      end
    end
  end

  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Invitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_invitation
    if current_user
      if params[:guest_id] && current_user.id == params[:guest_id].to_i
        @invitation = current_user.invitations.find(params[:id])
        @user = current_user
      else
        sign_out current_user
        @user = Guest.find(params[:guest_id])
        @invitation = @user.invitations.find(params[:id])
      end
    else
      @user = Guest.find(params[:guest_id])
      @invitation = @user.invitations.find(params[:id])
    end
  end

  def invitation_params
    params.require(:invitation).permit(:user_id, :confirmed)
  end

  def record_not_found
    render text: "404 Not Found", status: 404
  end

end
