require("minitest/autorun")
require("../drink")

class TestDrink < MiniTest::Test

  def setup()
    @drink_1 = Drink.new("CodeClan IPA", 2, 5)
  end

  def test_drink_has_name()
    assert_equal("CodeClan IPA", @drink_1.name())
  end

  def test_drink_has_price()
    assert_equal(2, @drink_1.price())
  end

  def test_drink_has_alcohol_level()
    assert_equal(5, @drink_1.alcohol())
  end

end
