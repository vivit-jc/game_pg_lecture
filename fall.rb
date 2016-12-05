require 'dxruby'

size = 32
x = 320 - size/2
y = 100 - size/2
image = Image.load('ball.png')
g = 2.0
v = 0.0


Window.loop do
  v += g
  y += v
  y = 480 - size if(y >= 480 - size)
  v = -v if y >= 480 - size
  Window.draw(x, y, image)
end