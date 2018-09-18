require './lib/photograph'

class Curator

  attr_reader :artists,
              :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(attributes)
    photograph = Photograph.new(attributes)
    @photographs << photograph
  end

end