class LoansController < ApplicationController
  def index
    return redirect_to :new_user_session unless current_user

    @loans = current_user.loans
  end

end
