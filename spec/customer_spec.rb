require("minitest/autorun")
require("../customer")
require("../pub")
require("../drink")

class TestCustomer < MiniTest::Test

  def setup()
    @customer_1 = Customer.new("Kishan", 100, 36, 0)
    @customer_2 = Customer.new("Bert", 1, 55, 0)
    @customer_3 = Customer.new("Finn", 1000, 17, 0)
    @customer_4 = Customer.new("Darren", 10, 30, 30)
    @drink_1 = Drink.new("CodeClan IPA", 2, 5)
    @drink_2 = Drink.new("CodeClan Pinotage", 3, 4)
    @drink_3 = Drink.new("CodeClan Single Malt", 4, 6)
    @drinks = [@drink_1, @drink_2, @drink_3]
    @pub = Pub.new("The CodeClan Tavern", 0, @drinks)
  end

  def test_customer_has_name()
    assert_equal("Kishan", @customer_1.name())
  end

  def test_customer_has_wallet()
    assert_equal(100, @customer_1.wallet())
  end

  def test_customer_has_age()
    assert_equal(36, @customer_1.age())
  end

  def test_customer_has_drunkenness()
    assert_equal(0, @customer_1.drunkenness)
  end

  def test_customer_pays_for_drink()
    @customer_1.pay_drink(@drink_1, @pub)
    assert_equal(98, @customer_1.wallet())
  end

  def test_customer_gets_more_drunk()
    @customer_1.drink_alcohol(@drink_1)
    assert_equal(5, @customer_1.drunkenness())
  end

  # integration test

  def test_customer_buys_drink()
    @customer_1.buy_drink(@drink_1, @pub, @customer_1)
    assert_equal(98, @customer_1.wallet())
    assert_equal(2, @pub.till())
    assert_equal(5, @customer_1.drunkenness())
  end

  def test_customer_buys_drink__underage()
    @customer_3.buy_drink(@drink_1, @pub, @customer_3)
    assert_equal(1000, @customer_3.wallet())
    assert_equal(0, @pub.till())
    assert_equal(0, @customer_3.drunkenness())
  end

  def test_customer_buys_drink()
    @customer_1.buy_drink(@drink_4, @pub, @customer_1)
    assert_equal(100, @customer_1.wallet())
    assert_equal(0, @pub.till())
    assert_equal(0, @customer_1.drunkenness())
  end

  def test_customer_buys_drink__insufficient_funds()
    @customer_2.buy_drink(@drink_1, @pub, @customer_2)
    assert_equal(1, @customer_2.wallet())
    assert_equal(0, @pub.till())
    assert_equal(0, @customer_2.drunkenness())
  end

  def test_customer_buys_drink__drunk()
    @customer_4.buy_drink(@drink_1, @pub, @customer_4)
    assert_equal(10, @customer_4.wallet())
    assert_equal(0, @pub.till())
    assert_equal(30, @customer_4.drunkenness())
  end

end
