class Coffee
  def brew
    raise 'must implement brew() method in subclass'
  end
end

class Espresso < Coffee
  def brew
    puts 'brew espresso coffee'
  end
end

class Macchiato < Coffee
  def brew
    puts 'brew macchiato coffee'
  end
end

class Capuccino < Coffee
  def brew
    puts 'brew capuccino coffee'
  end
end

class CoffeeFactory
  def get_coffee(type)
    case type
    when 'Espresso' then Espresso.new
    when 'Macchiato' then Macchiato.new
    when 'Capuccino' then Capuccino.new
    end
  end
end

if __FILE__ == $0
  coffee_factory = CoffeeFactory.new

  coffees = [
    coffee_factory.get_coffee('Espresso'),
    coffee_factory.get_coffee('Macchiato'),
    coffee_factory.get_coffee('Capuccino')
  ]

  coffees.each do |coffee|
    coffee.brew
  end
end