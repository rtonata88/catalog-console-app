require_relative './item'

class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color, id = nil)
    @id = id || Random.rand(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def self.convert_to_json(data)
    labels = []
    data.each do |label|
      labels << { id: label.id, title: label.title, color: label.color }
    end
    labels
  end

  def self.convert_to_obj(data)
    labels = []
    data.each do |label|
      labels << Label.new(label['title'], label['color'])
    end
    labels
  end
end
