module Authorization::RequireAdmin
  macro included
    before require_admin
  end

  private def require_admin
    if current_user? && current_user.admin?
      continue
    else
      flash.info = "The page is not available or you have insufficient privileges."
      redirect to: Me::Show
    end
  end

  private def current_user : User
    current_user?.not_nil!
  end
end
