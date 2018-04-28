require 'test_helper'

class LeagueCreateEditTestTest < ActionDispatch::IntegrationTest

  def setup
    @league = League.create!(name: "Sample League", year: 1)
  end

  test "uncussessful create" do
    get new_league_path
    assert_template 'leagues/new'
    post leagues_path, params: { league: { name: "", year: ""}}
    assert_template 'leagues/new'
    assert_not flash.empty?
  end

  test "successful create" do
    get new_league_path
    assert_template 'leagues/new'
    name = "Sample League"
    year = 1
    post leagues_path, params: { league: { name: name, year: year } }
    @league = League.last
    assert_not flash.empty?
    assert_redirected_to league_path(@league)
    assert_equal name, @league.name
    assert_equal year, @league.year
  end

  test 'unsuccessful edit' do
    get edit_league_url(@league)
    assert_template 'leagues/edit'
    patch league_path(@league), params: { league: { name: "", year: "" } }
    assert_not flash.empty?
    assert_template 'leagues/edit'
    @league.reload
    assert_equal "Sample League", @league.name
    assert_equal 1, @league.year
  end

  test 'successful edit' do
    get edit_league_path(@league)
    assert_template 'leagues/edit'
    name = "Example League"
    year = 2018
    patch league_path(@league), params: { league: { name: name, year: year } }
    assert_not flash.empty?
    assert_redirected_to @league
    @league.reload
    assert_equal name, @league.name
    assert_equal year, @league.year
  end

end
