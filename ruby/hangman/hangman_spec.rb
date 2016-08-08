require_relative 'hangman'

describe Hangman do
	let(:game) { Hangman.new("hippopotomus") }

	it "establishes an array on initialization that contains the placeholder letters for hangman" do
		expect(game.letter_slots).to eq ["_","_","_","_","_","_","_","_","_","_","_","_"]
	end
end