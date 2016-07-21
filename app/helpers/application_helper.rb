module ApplicationHelper
  def admin_user_signed_in?
    user_signed_in? && current_user.role == "admin"
  end

  def current_owner_writer?
    @writer = Writer.find(params[:writer_id] || params[:id])
    @writer.user_id == current_user.id
  end
end
