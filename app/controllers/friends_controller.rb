class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend, only: %i[ show edit update destroy ]

  # GET /friends or /friends.json
  def index
    @friends = Friend.all
  end

  # GET /dasboard/ or /dasboard.json
  def dashboard
    @friends = Friend.where("user_id = " + current_user.id.to_s )
    @totalFriends = @friends.length
    @totalMingguKemarin = @friends.where(created_at: 1.week.ago.all_week).length
    # @totalMingguKemarin = @friends.where(created_at: (1.hours.ago)..Time.now).length
    @totalMingguIni = @friends.where(created_at: Date.today.all_week).length
    @totalBulanKemarin = @friends.where(created_at: 1.month.ago.all_month).length
    @totalBulanIni = @friends.where(created_at: Date.today.all_month).length
    @totalTahunKemarin = @friends.where(created_at: 1.year.ago.all_year).length
    @totalTahunIni = @friends.where(created_at: Date.today.all_year).length
    def persentaseKenaikan(awal, akhir)
      return awal <= 0 ? 100.to_f : (((akhir - awal).to_f / awal) * 100).to_f
    end
    @persentaseMingguIni = persentaseKenaikan(@totalMingguKemarin, @totalMingguIni)
    @persentaseBulanIni = persentaseKenaikan(@totalBulanKemarin, @totalBulanIni)
    @persentaseTahunIni = persentaseKenaikan(@totalTahunKemarin, @totalTahunIni)
  end

  # GET /friends/1 or /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    # @friend = Friend.new
    @friend = current_user.friends.build
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
    # @friend = Friend.new(friend_params)
    @friend = current_user.friends.build(friend_params)
    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: I18n.t('friend.create') }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: I18n.t('friend.update') }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: I18n.t('friend.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:name, :email, :phone, :instagram, :user_id)
    end
end
