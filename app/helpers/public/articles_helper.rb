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

# 投稿レベル表示用
  def level_content(article)
    arr = ["とても難しい", "難しい", "普通", "簡単", "とても簡単"]
    num = article.level.to_i-1
    content_tag(:p, "#{arr[num]}")
  end

# カテゴリ表示用
  def category_content(article)
    category = article.category
    if category == "vegetable"
      content_tag(:p, "野菜")
    elsif category == "fruit"
      content_tag(:p, "果実")
    elsif category == "plant"
      content_tag(:p, "草木")
    elsif category == "flower"
      content_tag(:p, "花")
    elsif category == "succulent"
      content_tag(:p, "多肉")
    end
  end

# 投稿シーズン表示用
  def season_content(article)
    article.season_ids.sort.map{|season_id| Season.find(season_id).month}.join(', ')
  end

# 投稿肥料の有無表示用
  def fertilizer_existence_content(article)
    f = article.fertilizer_existence
    if f == true
      content_tag(:p, "あり")
    else
      content_tag(:p, "なし")
    end
  end

# 投稿場所表示用
  def place_content(article)
    place = article.place
    if place == "indoor"
      content_tag(:p, "屋内")
    elsif place == "outdoor"
      content_tag(:p, "屋外")
    elsif place == "veranda"
      content_tag(:p, "ベランダ")
    end
  end

# 投稿条件表示用
  def condition_content(article)
    condition = article.condition
    if condition == "pot"
      content_tag(:p, "鉢")
    elsif condition == "ground"
      content_tag(:p, "地植え")
    elsif condition == "greenhouse"
      content_tag(:p, "ハウス")
    end
  end

# 投稿開始時表示用
  def state_at_start_content(article)
    s = article.state_at_start
    if s == "seed"
      content_tag(:p, "種から")
    elsif s == "seedling"
      content_tag(:p, "苗から")
    elsif s == "bulb"
      content_tag(:p, "球根から")
    elsif s == "complete"
      content_tag(:p, "完成形から")
    end
  end

end
