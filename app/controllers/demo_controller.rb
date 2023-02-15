class DemoController < ActionController::Base
  def index
    render Views::Demo::Index.new
  end
end
