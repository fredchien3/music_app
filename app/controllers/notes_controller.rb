class NotesController < ApplicationController
  before_action :require_user!

  def new
    @note = Note.new(note_params)
    @note.user = current_user
    flash.now[:errors] = @note.errors.full_messages unless @note.save!
    redirect_to track_url(@note.track)
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    if current_user.id == @note.user_id
      @note.destroy!
      redirect_to track_url(@note.track)
    else
      render text: 'only author can delete note', status: :forbidden
    end
  end

  private
  def note_params
    params.require(:note).permit(:user_id, :track_id, :text)
  end
end