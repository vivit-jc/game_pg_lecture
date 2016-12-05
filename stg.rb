require 'dxruby'
include Math

size = 32
r = 0
ORIGIN_X = 320
ORIGIN_Y = 40
x = 320 - size/2
y = 400
BALL = Image.load('ball.png')
PLAYER = Image.load('player.png')
AIRPLANE = Image.load('airplane.png')
theta = 0
v = 0
balls = []
count = 0

class Ball
attr_reader :d
  def initialize(theta)
    @x = ORIGIN_X - 16
    @y = ORIGIN_Y
    @d = 0
    @theta = theta * PI / 180.0
  end

  def move
    @d += 8
    Window.draw(@d*cos(@theta)+@x, @d*sin(@theta)+@y, BALL)
  end
end

Window.loop do
  count += 1
  if balls.size < 15 && count%10 == 0
    balls << Ball.new(90)
    balls << Ball.new(60)
    balls << Ball.new(120)
  end
  balls.each do |ball|
    ball.move
    balls.delete(ball) if(ball.d > 480)
  end
  x += Input.x*3
  y += Input.y*3
  Window.draw(x, y, AIRPLANE)
  Window.draw(ORIGIN_X-35, ORIGIN_Y, PLAYER)
end

