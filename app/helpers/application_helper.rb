module ApplicationHelper
  def greeting
    current_user.name || current_user.login || current_user.email
  end

  def label_favorite(list)
    current_user.favorites.map(&:list).include?(list) ? 'Favorited' : 'Favorite'
  end
end
