class Computer
  def initialize(display, mouse, keyboard)
    @display = display
    @mouse = mouse
    @keyboard = keyboard
  end
end

class ComputerBuilder
  attr_accessor :display, :mouse, :keyboard

  def add_display(size="1920x1080")
    @display = Display.new(size)
  end

  def add_mouse(name="Logitech")
    @mouse = Mouse.new(name)
  end

  def build
    Computer.new(display, mouse, keyboard)
  end
end

builder = ComputerBuilder.new
builder.add_display
builder.add_mouse
builder.build