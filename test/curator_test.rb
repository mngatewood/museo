require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require './lib/photograph'
require 'pry'

class CuratorTest < Minitest::Test

  def test_it_exists
    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_it_starts_with_no_artists
    curator = Curator.new
    assert_equal [], curator.artists
  end

  def test_it_starts_with_no_photographs
    curator = Curator.new
    assert_equal [], curator.photographs
  end

  def test_it_adds_photographs
    curator = Curator.new
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    assert_equal 2, curator.photographs.length
    assert_instance_of Photograph, curator.photographs.last
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first.name
  end

end