require("minitest/autorun")
require("../pub")
require("../drink")
require("../customer")

class TestPub < MiniTest::Test

  def setup()
    @customer_1 = Customer.new("Kishan", 100, 36, 0)
    @customer_2 = Customer.new("Bert", 1, 55, 30)
    @customer_3 = Customer.new("Finn", 1000, 17, 0)
    @drink_1 = Drink.new("CodeClan IPA", 2, 5)
    @drink_2 = Drink.new("CodeClan Pinotage", 3, 4)
    @drink_3 = Drink.new("CodeClan Single Malt", 4, 6)
    @drinks = [@drink_1, @drink_2, @drink_3]
    @pub = Pub.new("The CodeClan Tavern", 0, @drinks)
  end

  def test_pub_has_name()
    assert_equal("The CodeClan Tavern", @pub.name())
  end

  def test_pub_has_till()
    assert_equal(0, @pub.till())
  end

  def test_pub_has_drinks()
    assert_equal(@drinks, @pub.drinks())
  end

  def test_pub_receives_money()
    @pub.receive_money(@drink_1)
    assert_equal(2, @pub.till())
  end

  def test_customer_can_afford_drink__sufficient_funds()
    assert_equal(true, @pub.check_wallet(@drink_1, @customer_1))
  end

  def test_customer_can_afford_drink__insufficient_funds()
    assert_equal(false, @pub.check_wallet(@drink_1, @customer_2))
  end

  def test_drink_on_sale_available()
    assert_equal(true, @pub.check_drinks(@drink_1))
  end

  def test_drink_on_sale__unavailable()
    assert_equal(false, @pub.check_drinks(@drink_4))
  end

  def test_customer_can_buy_drink__of_age
    assert_equal(true, @pub.check_age(@customer_1))
  end

  def test_customer_can_buy_drink__underage
    assert_equal(false, @pub.check_age(@customer_3))
  end

  def test_customer_can_be_served__sober
    assert_equal(true, @pub.check_state(@customer_1))
  end

  def test_customer_can_be_served__drunk
    assert_equal(false, @pub.check_state(@customer_2))
  end

end
