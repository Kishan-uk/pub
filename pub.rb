class Pub

  attr_reader(:name, :till, :drinks)

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def receive_money(drink)
    @till += drink.price
  end

  def check_wallet(drink, customer)
    if customer.wallet >= drink.price
      return true
    else
      return false
    end
  end

  def check_drinks(drink)
    if @drinks.include?(drink)
      return true
    else
      return false
    end
  end

  def check_age(customer)
    if customer.age >= 18
      return true
    else
      return false
    end
  end

  def check_state(customer)
    if customer.drunkenness < 25
      return true
    else
      return false
    end
  end

end
