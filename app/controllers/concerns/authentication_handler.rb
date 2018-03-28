module AuthenticationHandler
  def is_admin?
    @current_user = User.find_by(id: payload[0]['user_id'])
    return json_response({ users: [] }, :unauthorised) unless @current_user.role.title === 'admin'
  end

  def eligible?
    @current_user = User.find_by(id: payload[0]['user_id'])
    return nil unless @current_user.role.title === 'admin'
  end
end