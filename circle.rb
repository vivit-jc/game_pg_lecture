require 'dxruby'
include Math

size = 32
r = 100 - size/2
x_center = 320-16
y_center = 200
image = Image.load('ball.png')
theta = 90
v = 0

Window.loop do
  if(Input.x == 1 || (Input.x == 0 && v < 0.0))
    v += 0.001
  elsif(Input.x == -1 || (Input.x == 0 && v > 0.0))
    v -= 0.001
  end
  theta += v
  Window.draw(r*cos(theta)+x_center, r*sin(theta)+y_center, image)
  Window.draw(r*cos(theta)+x_center, 400, image)
end