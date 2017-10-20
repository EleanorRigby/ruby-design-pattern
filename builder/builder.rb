class CPU
  # ...
end

class Motherboard
  attr_accessor :cpu, :memory_size

  def initialize(cpu = CPU.new, memory_size = 32000000)
    @cpu = cpu
    @memory_size = memory_size
  end
end

class Drive
  attr_reader :type, :size, :writable

  def initialize(type, size, writable)
    @type = type
    @size = size
    @writable = writable
  end
end

class Computer
  attr_accessor :display, :motherboard, :drives

  def initialize(display = :crt, motherboard = Motherboard.new, drives = [])
    @display = display
    @motherboard = motherboard
    @drives = drives
  end
end

class ComputerBuilder
  attr_reader :computer

  def initialize
    @computer = Computer.new
  end

  def display(display)
    @computer.display = display
  end

  def memory_size(size)
    @computer.motherboard.memory_size = size
  end

  def add_cd(writer=false)
    @computer.drives << Drive.new(:cd, 760, writer)
  end

  def add_dvd(writer=false)
    @computer.drives << Drive.new(:dvd, 4000, writer)
  end

  def add_hard_disk(size)
    @computer.drives << Drive.new(:hard_disk, size, true)
  end
end

if __FILE__ == $0
  builder = ComputerBuilder.new
  builder.display(:lcd)
  builder.add_cd
  builder.add_dvd
  builder.add_hard_disk(1000)

  computers = []
  10.times { computers << builder.computer.clone }
  computers.each do |computer|
    p computer
  end
end