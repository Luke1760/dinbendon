class Cart
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add_item(item_id)
    found_item = items.find { |item| item.item_id == item_id }

    if found_item
      found_item.increment!   # 增加數量
    else
      items << CartItem.new(item_id)
    end
  end

  def empty?
    items.empty?
  end

  def total
    result = items.sum { |item| item.total }

    # 4/1 全館打 1 折
    if Time.now.month == 4 and Time.now.day == 1
      result = result * 0.1
    end

    return result
  end

  def self.from_hash(hash = nil)
    if hash && hash["items"]
      items = hash["items"].map { |item|
        CartItem.new(item["item_id"], item["quantity"])
      }

      new(items)
    else
      new
    end
  end

  def to_hash
    items = @items.map { |item|  
      { "item_id" => item.item_id, "quantity" => item.quantity } 
    }

    return { "items" => items }
  end
end

