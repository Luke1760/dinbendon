class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticyty_token
  skip_before_action :check_login
  def favorite
    render json: {name: 'aaa', age: 18}
  end
end
