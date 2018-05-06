require 'savon'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    bank = get_bank ? get_bank : 'unknown'
    @user.bank_name = bank

    respond_to do |format|
      if @user.save

        format.html { redirect_to @user, notice: 'User was successfully created. Your bank is ' + bank }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      bank = get_bank ? get_bank : 'unknown'
      @user.bank_name = bank
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated. Your bank is ' + bank}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :surname, :email, :password, :bank_code, :country, :currency, :country_code, :currency_code)
    end

    def get_bank
      client = Savon.client(wsdl: 'http://www.thomas-bayer.com/axis2/services/BLZService?wsdl')
      response = client.call(:get_bank, message: {blz: user_params[:bank_code]})
      bank = response.body[:get_bank_response][:details][:bezeichnung]

    end

end
