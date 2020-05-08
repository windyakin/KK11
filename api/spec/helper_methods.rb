module HelperMethods
  def account_auth_headers(account)
    account.create_new_auth_token
  end
end
