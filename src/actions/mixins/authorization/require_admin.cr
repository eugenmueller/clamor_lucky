module Authorization::RequireAdmin
  private def require_admin
    if current_user.admin?
      continue
    else
      flash.info = "The page is not available or you have insufficient privileges."
      redirect to: Me::Show
    end
  end
end
