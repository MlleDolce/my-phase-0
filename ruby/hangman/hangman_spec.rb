require_relative 'hangman'

describe Hangman do
	let(:game) { Hangman.new("hippopotomus", ["h","p","o","i","t","m","u","s"]) }

	it "returns a hangman word rack to guess from" do
		expect(game.word_rack).to eq "_ _ _ _ _ _ _ _ _ _ _ _"
	end

	it "determines if the game is over" do
		expect(game.word_complete).to eq false
	end	

	it "returns the new number of each round that increases by one each time" do
		expect(game.run_game("h")).to eq 2
	end
end