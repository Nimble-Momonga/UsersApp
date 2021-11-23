class CharStatsController < ApplicationController
  def index
    render json: CharStatBlueprint.render_as_json(CharStat.where.not(value: 0).order(value: :desc, key: :asc))
  end
end
