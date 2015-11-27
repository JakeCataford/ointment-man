require 'marky_markov'
class Markov
  def initialize
    @markov = MarkyMarkov::Dictionary.new('/tmp/dictionary')
  end

  def sentence(that_starts_with: nil)
    @markov.generate_n_sentences(1, that_start_with: that_starts_with)
  end

  def learn(string)
    @markov.parse_string(string)
  end

  def save
    @markov.save_dictionary!
  end
end
