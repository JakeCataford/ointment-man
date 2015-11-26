require 'marky_markov'
class Markov
  def initialize
    @markov = MarkyMarkov::Dictionary.new('/tmp/dictionary')
  end

  def sentence
    @markov.generate_n_sentences(1)
  end

  def learn(string)
    @markov.parse_string(string)
  end

  def save
    @markov.save_dictionary!
  end
end
