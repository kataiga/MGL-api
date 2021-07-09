class GameSerializer < ActiveModel::Serializer
  attributes :id, :game_name, :description, :release, :editor, :devloper, :platforms, :themes, :genres

  def editor
    object&.editor&.company_name
  end

  def devloper
    object&.devloper&.devloper_name
  end

  def platforms
    object&.platforms.map{|p| p[:platform_name]}
  end

  def themes
    object&.themes.map{|t| t[:theme_name]}
  end

  def genres
    object&.genres.map{|g| g[:genre_name]}
  end
  
end
