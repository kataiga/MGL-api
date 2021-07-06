class GameSerializer < ActiveModel::Serializer
  attributes :id, :game_name, :description, :release, :editor, :devloper, :platforms

  has_many :themes
  has_many :genres

  def editor
    object&.editor&.company_name
  end

  def devloper
    object&.devloper&.devloper_name
  end

  def platforms
    object&.platforms.map{|p| p[:platform_name]}
  end
  
end
