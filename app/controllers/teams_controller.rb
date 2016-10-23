class TeamsController < ApplicationController
  def show
    @team = Team.find_by_domain!(params[:id])

    if @team.user_reactions.count >= 100
      @decks = RankingDeck::EMOJI_LIST.keys.shuffle.map do |deck|
        RankingDeck.new(deck, team: @team)
      end.reject do |deck|
        deck.cards.empty?
      end
    else
      render 'loading'
    end
  end
end
