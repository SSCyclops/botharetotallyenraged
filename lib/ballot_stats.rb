class BallotStats
  class NoPriorVotes < BallotStats
    def had_prior_votes?
      false
    end
  end

  class PriorVotes < BallotStats
    attr_accessor :user_picked, :percent_agreed, :percent_disagreed

    def initialize(users_pick, wins, losses)
      @user_picked = users_pick
      
      previous_wins = wins - 1
      previous_losses = losses
      previous_ballots = previous_wins + previous_losses
      
      @percent_agreed = previous_wins / previous_ballots.to_f * 100
      @percent_disagreed = previous_losses / previous_ballots.to_f * 100
    end
    
    def had_prior_votes?
      return true
    end
  end
end




