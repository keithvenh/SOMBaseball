require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  def setup
    @league = League.new(name: "Sample League", year: 2018)
  end

  test "should be valid" do
    assert @league.valid?
  end

  test "name should be present" do
    @league.name = "   "
    assert_not @league.valid?
  end

  test "year should be present" do
    @league.year = "  "
    assert_not @league.valid?
  end

  
end
