class ApplicationController < ActionController::API
  private

  def paginate(classname)
    records = classname.page(paginate_params[:page])

    render json: {
      page: records.current_page,
      per_page: records.per_page,
      total: records.total_entries,
      total_pages: records.total_pages,
      data: UserBlueprint.render_as_json(records)
    }
  end

  def paginate_params
    params.permit(:page)
  end
end
