module ::CategoryHome::Library
  def self.home_category (user_id:)

    primary_group = User.find_by(id: user_id).primary_group

    return CategoryGroup.where(group_id: primary_group).first.category_id
  end
end
