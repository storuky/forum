groups = [
  {
    title: "Общие вопросы",
    themes: [
      {title: "Новости из мира ИТ"},
      {title: "Помощь студентов"},
      {title: "Вопросы по программированию"}
    ]
  },
  {
    title: "Работа для программистов",
    themes: [
      {title: "Работа на постоянной основе"},
      {title: "Фриланс"}
    ]
  },
  {
    title: "Разное",
    themes: [
      {title: "Свободное общение"},
      {title: "Реклама"}
    ]
  }
]

groups.each do |group|
  g = Group.create(title: group[:title])
  group[:themes].each do |theme|
    g.themes.create(title: theme[:title])
  end
end

Group.find_each &:save