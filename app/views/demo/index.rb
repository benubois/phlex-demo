class List < Phlex::HTML
  include Phlex::DeferredRender

  def initialize
    @items = []
  end

  def template
    ul do
      @items.each { render(_1) }
    end
  end

  def with_item(...)
    @items << Item.new(...)
  end

  class Item < Phlex::HTML
    def template(&)
      li(&)
    end
  end
end

module Views
  module Demo
    class Index < Phlex::HTML
      include Phlex::Rails::Helpers::FormWith
      def template
        form_with url: "/" do |f|
          render List.new do |list|
            list.with_item do
              f.label
            end
          end
        end
      end
    end
  end
end
