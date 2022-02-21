module Public::ArticlesHelper
  # 投稿難易度アイコン表示用
  def level_icon(val)
    num = val.to_i
    image_tag "level-#{num}-icon.png", class: "level-icon"
  end

  # 投稿カテゴリアイコン表示用
  def category_icon(category)
    if category == "vegetable"
      image_tag "vegetable-icon.png", class: "category-icon"
    elsif category == "fruit"
      image_tag "fruit-icon.png", class: "category-icon"
    elsif category == "plant"
     image_tag "plant-icon.png", class: "category-icon"
    elsif category == "flower"
      image_tag "flower-icon.png", class: "category-icon"
    elsif category == "succulen"
      image_tag "succulent-icon.png", class: "category-icon"
    end
  end

  # いいねアイコン表示用
  def favorite_btn(val)
    if user_signed_in? && current_user != val.user
      tag.div(class: ["favorite-#{val.id}", "card-favorite"]) do
        if current_user.favorite?(val)
          link_to  article_favorites_path(val), method: :delete, remote: true do
            icon("fas", "heart", val.favorites.count)
          end
        else
          link_to article_favorites_path(val), method: :post, remote: true do
            icon("far", "heart", val.favorites.count)
          end
        end
      end
    end
  end

  # 投稿レベル表示用
  def level_content(article)
    arr = ["とても難しい", "難しい", "普通", "簡単", "とても簡単"]
    num = article.level.to_i - 1
    tag.p("#{arr[num]}")
  end

  # カテゴリ表示用
  def category_content(article)
    category = article.category
    if category == "vegetable"
      tag.p("野菜")
    elsif category == "fruit"
      tag.p("果実")
    elsif category == "plant"
      tag.p("草木")
    elsif category == "flower"
      tag.p("花")
    elsif category == "succulent"
      tag.p("多肉")
    end
  end

  # 投稿シーズン表示用
  def season_content(article)
    article.season_ids.sort.map { |season_id| Season.find(season_id).month }.join(', ')
  end

  # 投稿肥料の有無表示用
  def fertilizer_existence_content(article)
    f = article.fertilizer_existence
    if f == true
      tag.p("あり")
    else
      tag.p("なし")
    end
  end

  # 投稿場所表示用
  def place_content(article)
    place = article.place
    if place == "indoor"
      tag.p("屋内")
    elsif place == "outdoor"
      tag.p("屋外")
    elsif place == "veranda"
      tag.p("ベランダ")
    end
  end

  # 投稿条件表示用
  def condition_content(article)
    condition = article.condition
    if condition == "pot"
      tag.p("鉢")
    elsif condition == "ground"
      tag.p("地植え")
    elsif condition == "greenhouse"
      tag.p("ハウス")
    end
  end

  # 投稿開始時表示用
  def state_at_start_content(article)
    s = article.state_at_start
    if s == "seed"
      tag.p("種から")
    elsif s == "seedling"
      tag.p("苗から")
    elsif s == "bulb"
      tag.p("球根から")
    elsif s == "complete"
      tag.p("完成形から")
    end
  end

  # 都道府県/市区町村表示用
  def extract_article_prefecture_name(article)
    Prefecture.find(article.prefecture_id).name
  end

  def extract_article_municipality_name(article)
    Municipality.find(article.municipality_id).municipality_name
  end
end
