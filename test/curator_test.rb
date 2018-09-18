require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
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

  def test_it_adds_artists
    curator = Curator.new
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    }      
    artist_2 = {
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    }     
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    assert_equal 2, curator.artists.length
    assert_instance_of Artist, curator.artists.last
    assert_equal "Henri Cartier-Bresson", curator.artists.first.name
  end

  def test_it_returns_artist_by_id
    curator = Curator.new
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    }      
    artist_2 = {
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    }     
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    assert_equal "Henri Cartier-Bresson", curator.find_artist_by_id("1").name
    assert_instance_of Artist, curator.find_artist_by_id("1")
  end

  def test_it_returns_photograph_by_id
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
    assert_equal "Moonrise, Hernandez", curator.find_photograph_by_id("2").name
    assert_instance_of Photograph, curator.find_photograph_by_id("2")
  end

end