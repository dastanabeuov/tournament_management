#Весь интерфейс программы(Все путсы-мутсы)
class Interface

  def welcome
    massage_empty
  	puts "Добро пожаловать в игру!"
  end

  def quastion_auto_generate
    massage_empty
    puts "Желаете сгенерировать имя команды? да/нет"
  end

  def enter_name
  	puts "Введите имя команды"
  end

  def massage_game_group
    massage_empty
    puts "В каждой группе команды играют друг против друга."
    puts "Лучшие 4 команды из каждого дивизиона встречаются в плей-офф."
    massage_empty
    puts "Результаты игр в группах..."
  end

  def massage_playoff
    massage_empty
    puts "Лучшие 4 команды из каждого дивизиона встречаются в плей-офф."
    massage_empty
  end

  def massage_generate_team
    massage_empty
    puts "Автоматическая генерация команд"
    massage_empty
  end

  def error_massage
    massage_empty
  	puts "Что то пошло не так :-("
  end

  def massage_list_group
    massage_empty
    puts "Команды рандомна делятся на 2 подразделения - A и B (по 8 команд в каждой)."
  end

  def massage_empty
    puts " "
  end

  def list_group_a(group_a)
    massage_empty
    puts "ГРУППА - А"
    puts "----------"
    group_a.each { |team| puts "#{team.name} - #{team.point}" }
  end

  def list_group_b(group_b)
    massage_empty
    puts "ГРУППА - Б"
    puts "----------"
    group_b.each { |team| puts "#{team.name} - #{team.point}" }
  end

  def list_playo_off(group)
    massage_empty
    puts "Резулбтаты игр плей-офф"
    puts "----------"
    group.each { |team| puts "#{team.name} - #{team.point}" }
  end

  def massage_final
    massage_empty
    puts "ФИНАЛ"
    puts "----------"
  end

  def list_final_result(win)
    massage_empty
    puts "Результат игры в ФИНАЛЕ"
    puts "----------"
    win.each { |team| puts "ЧЕМПИОН КОМАНДА: *** #{team.name} - #{team.point} ***" }
  end

  def draw
    massage_empty
    puts "Draw!"
  end

end
