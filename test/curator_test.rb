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

  def test_it_returns_all_photographs_by_a_given_artist
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
    photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
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
    artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
}
    curator = Curator.new
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    diane_arbus = curator.find_artist_by_id("3")
    assert_equal 2, curator.find_photographs_by_artist(diane_arbus).length
    assert_instance_of Photograph, curator.find_photographs_by_artist(diane_arbus).last
    assert_equal "3", curator.find_photographs_by_artist(diane_arbus).first.artist_id
  end

  def test_it_returns_artists_with_multiple_photographs
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
    photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
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
    artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
}
    curator = Curator.new
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    diane_arbus = curator.find_artist_by_id("3")
    assert_equal 1, curator.artists_with_multiple_photographs.length
    assert_equal diane_arbus, curator.artists_with_multiple_photographs.first
  end

  def test_it_returns_photos_by_photographers_from_given_country
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
    photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
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
    artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
}
    curator = Curator.new
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    diane_arbus = curator.find_artist_by_id("3")
    assert_equal 3, curator.photographs_taken_by_artists_from("United States").length
    assert_instance_of Photograph, curator.photographs_taken_by_artists_from("United States").first
    assert_equal 0, curator.photographs_taken_by_artists_from("Argentina").length
  end

end