module UsersHelper
    def has_access
        id = params[:user_id] || params[:id]
        current_user == User.find_by_id(id)
    end
end
