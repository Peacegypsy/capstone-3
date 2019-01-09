class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def layout
    cards = Card.all
    @spread = []
    cards_drawn = 0
    until cards_drawn == 8
      card = cards.sample
      if !@spread.include? card
      @spread << card
      cards_drawn += 1
      end
    end
    @spread
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def card_params
    params.require(:card).permit(:name, :focus, :desire, :outside_influences, :inner_dialog, :challenges, :insight, :meditation, :resolution)
  end
end

# cards = {
#   Abundance: 1,
#   Appearance: 1,
#   Balance: 1,
#   Beginnings: 1,
#   Betrayal: 1,
#   Caution: 1,
#   Celebration: 1,
#   Choice: 1,
#   Completion: 1,
#   Conflict: 1,
#   Consequences: 1,
#   Destiny: 1,
#   Direction: 1,
#   Discovery: 1,
# }
