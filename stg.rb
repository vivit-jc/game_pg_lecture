require 'dxruby'
include Math

size = 32
r = 0
ORIGIN_X = 320
ORIGIN_Y = 40
BALL = Image.load('img/ball.png')
PLAYER = Image.load('img/player.png')
AIRPLANE = Image.load('img/airplane.png')
theta = 0
v = 0
balls = []
count = 0

plane = Sprite.new(320-size/2,400,AIRPLANE)

class Ball < Sprite
attr_reader :d
  def initialize(theta)
    self.x = ORIGIN_X - 16
    self.y = ORIGIN_Y
    @d = 0
    @theta = theta
    self.image = BALL
  end

  def move
    @d += 8
    self.x = @d*cos(@theta) + ORIGIN_X - 16
    self.y = @d*sin(@theta) + ORIGIN_Y
    self.draw
  end
end

Window.loop do
  Window.draw(ORIGIN_X-35, ORIGIN_Y, PLAYER)
  count += 1
  if count > 60*1 && balls.size < 15 && count%10 == 0
    theta = atan2(plane.y - ORIGIN_Y,plane.x - ORIGIN_X + size/2) - 2 * PI
    balls << Ball.new(theta)
    balls << Ball.new(theta + 30 * PI / 180.0)
    balls << Ball.new(theta - 30 * PI / 180.0)
  elsif balls.size < 15 && count%10 == 0
    balls << Ball.new(90 * PI / 180.0)
    balls << Ball.new(60 * PI / 180.0)
    balls << Ball.new(120 * PI / 180.0)
  end
  
  balls.each do |ball|
    ball.move
    balls.delete(ball) if(ball.d > 480)
  end
  plane.x += Input.x*3
  plane.y += Input.y*3
  plane.draw
  if plane === balls
    #ここに衝突したときの処理を書く
  end
end

