class ::CategoryHome::CategoryHomeController < ::ApplicationController

  def home_category
    respond_to_anon unless current_user

    render_json_dump(::CategoryHome::Library.home_category(user_id: current_user.id))
  end

  def respond_to_anon
    render json: { errors: I18n.t('category_home.errors.anon_user')}, status: :unprocessable_entity
  end

end
