class UsersController < ApplicationController
  
  def index
  end

  def create
    @users = User.new
  end

  def destroy
  end
end
