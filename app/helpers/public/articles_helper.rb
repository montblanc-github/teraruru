module Public::ArticlesHelper

# 投稿難易度アイコン表示用
  def level_icon(val)
    arr = ["激","難","並","易","甘"]
    num = val.to_i-1
    content_tag(:div, "#{arr[num]}", class: ["level-icon", "level#{num}-icon"])
  end


# 投稿カテゴリアイコン表示用
  def category_icon(val)
    content_tag(:div, class: ["category-icon", "category-#{val}-icon"]) do
      if val == "vegetable"
        icon("fas", "carrot")
      elsif val == "fruit"
        icon("fas", "apple-alt")
      elsif val == "plant"
        icon("fas", "tree" )
      elsif val == "flower"
        icon("fas", "hand-holding-heart")
      end
    end
  end

# 投稿シーズン表示用
  def season_content(article)
    article.season_ids.sort.map{|season_id| Season.find(season_id).month}.join(', ')
  end

# いいねアイコン表示用
  def favorite_btn(val)
    if user_signed_in? && current_user != val.user
      content_tag(:div, class: ["favorite-#{val.id}", "card-favorite"]) do
        if current_user.favorite?(val)
          link_to  article_favorites_path(val), method: :delete, remote: true do
            icon("fas", "heart", val.favorites.count )
          end
        else
          link_to article_favorites_path(val), method: :post, remote: true do
            icon("far", "heart", val.favorites.count )
          end
        end
      end
    end
  end

end
