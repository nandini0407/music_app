class NotesController < ApplicationController
  before_action :require_user

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @not.save
    flash[:errors] = @note.errors.full_messages
    render
  end

  def destroy
    @note = Note.find_by_id(params[:id])
    unless note.user_id == current_user.id
      render text: "Can only destroy your own notes"
    else
      track = @note.track
      @note.destroy
      redirect_to track_url(track)
    end
  end

  private

  def note_params
    params.require(:note).permit(:user_id, :track_id, :user_notes)
  end
end
