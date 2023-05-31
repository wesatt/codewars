# frozen_string_literal: true

require 'pry'

# Pagination Helper Class
class PaginationHelper
  # The constructor takes in an array of items and a integer indicating how many
  # items fit within a single page
  def initialize(collection, items_per_page)
    @collection = collection
    @items_per_page = items_per_page
    @items_on_page ||= items_on_page_helper
  end

  # returns the number of items within the entire collection
  def item_count
    @collection.count
  end

  # returns the number of pages
  def page_count
    @items_on_page.count
  end

  # returns the number of items on the current page. page_index is zero based.
  # this method should return -1 for page_index values that are out of range
  def page_item_count(page_index)
    if page_index >= page_count
      -1
    else
      @items_on_page[page_index].count
    end
  end

  # determines what page an item is on. Zero based indexes.
  # this method should return -1 for item_index values that are out of range
  def page_index(item_index)
    result = -1
    @items_on_page.each_with_index do |a, i|
      result = i if a.include?(item_index)
    end
    result
  end

  private

  def items_on_page_helper
    arr = []
    @collection.each_with_index do |_n, i|
      arr << i
    end
    arr.each_slice(@items_per_page).to_a
  end
end
