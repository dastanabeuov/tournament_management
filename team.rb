#Файл создает объект кдасса User с атрибутами name && point
class Team
  attr_reader :name
  attr_accessor :point

  def initialize(name)
  	@name = name
  	@point = 0
  end
end
