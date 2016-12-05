require 'dxruby'

x = 0
y = 0
image = Image.load("airplane.png")

Window.loop do
  x = x + Input.x
  y = y + Input.y
  Window.draw(x, y, image)
end