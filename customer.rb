class Customer

  attr_reader(:name, :wallet, :age, :drunkenness)

  def initialize(name, wallet, age, drunkenness)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = drunkenness
  end

  def pay_drink(drink, pub)
    @wallet -= drink.price
  end

  def drink_alcohol(drink)
    @drunkenness += drink.alcohol
  end

  def buy_drink(drink, pub, customer)
    if pub.check_age(customer) == true
      if pub.check_drinks(drink) == true
        if pub.check_wallet(drink, customer) == true
          if pub.check_state(customer) == true
            pay_drink(drink,pub)
            pub.receive_money(drink)
            drink_alcohol(drink)
          end
        end
      end
    end
  end

end
