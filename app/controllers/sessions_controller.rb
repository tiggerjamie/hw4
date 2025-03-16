class SessionsController < ApplicationController
  def new
  end

  def create
      #find the user by their email
     @user = User.find_by({ "email" => params["email"] })
      #verify password
     if @user != nil
      #successful login
       if BCrypt::Password.new(@user["password"]) == params["password"]
         session["user_id"] = @user["id"]
         flash["notice"] = "Welcome, #{@user["username"]}."
         redirect_to "/places"
       else
      #unsuccessful pw
         flash["notice"] = "Uh-uh honey. Not today."
         redirect_to "/login"
       end
     else
      #unsuccessful user email
       flash["notice"] = "Uh-uh honey. Not today."
       redirect_to "/login"
     end
   end
 
   def destroy
     # logout the user
     flash["notice"] = "Until next time, dear."
     session["user_id"] = nil
     redirect_to "/login"
  end

end
  