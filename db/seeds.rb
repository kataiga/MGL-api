# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

editors = []
editors << Editor.where(company_name: 'Softworks').first_or_create
editors << Editor.where(company_name: 'Square Enix').first_or_create
devlopers = []
devlopers << Devloper.where(devloper_name: 'Bethesda Studio').first_or_create
devlopers << Devloper.where(devloper_name: 'Square Enix').first_or_create

games = []
games << Game.where(game_name: 'Final Fantasy XV', description: "Noctis quitte Insomnia avec ses amis Gladiolus, Ignis et Prompto pour Altissia, capitale d'Accordo, où le mariage du prince avec Lunafreya doit être célébré. Alors qu'ils se préparent à embarquer sur un navire qui les mènera sur l’autre continent, ils apprennent l'attaque d'Insomnia, le vol du Cristal par l'Empire de Niflheim et la mort du roi Regis.", release: Date.parse("2016/11/29"), 
  editor: editors.last, devloper: devlopers.last).first_or_create
games << Game.where(game_name: 'The Elder Scrolls V: Skyrim', description: "Les événements de Skyrim se déroulent en l'an 201 de la Quatrième Ère (4E 201), soit 200 ans après ceux d'Oblivion, dans un contexte de guerre civile : après l'assassinat du haut-roi de Bordeciel par le chef rebelle Ulfric Sombrage, des conflits éclatent entre les nordiques indépendantistes, les Sombrages, et ceux qui soutiennent encore l'Empire, lui-même sur le déclin et sous la domination d'une faction elfique, les Thalmors. C'est également le moment que choisit le seigneur dragon Alduin pour réapparaître et asservir les habitants de Bordeciel. Le joueur, qui incarne un prisonnier anonyme comme dans les précédents volets de la série, découvrira au cours du jeu qu'il est le seul en mesure de s'opposer à Alduin et aux dragons : il est le Dovahkiin (« l'Enfant de dragon » en langue draconique).", release: Date.parse("2011/11/11"), 
    editor: editors.first, devloper: devlopers.first).first_or_create

genres = []
genres << Genre.where(genre_name: 'RPG').first_or_create
genres << Genre.where(genre_name: 'Aventure').first_or_create
platforms = []
platforms << Platform.where(platform_name: 'PC').first_or_create
platforms << Platform.where(platform_name: 'PS4').first_or_create
themes = []
themes << Theme.where(theme_name: 'Fantasy').first_or_create
themes << Theme.where(theme_name: 'Medieval').first_or_create

games.each do |g|
  g.genres = genres
  g.platforms = platforms
end
games.first.themes << themes.first
games.last.themes << themes.first