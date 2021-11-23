class UsersController < ApplicationController
  def index
    paginate(User)
  end

  def email_chars_count
    render json: CharStat.all
  end

  def similarities
  end
end
