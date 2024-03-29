class UsersController < ApplicationController
    def index
        @users = User.all
        if params[:query]
            filtered_users = @users.where(<<-SQL, params[:query])
                users.username LIKE ?
            SQL
            render json: filtered_users
        else 
            render 'users/all'
        end
    end
    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id])
        if user 
            render json: user
        else
            render json: "{}"
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user 
            user.destroy
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        user = User.find_by(id: params[:id])
        if user
            user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end
