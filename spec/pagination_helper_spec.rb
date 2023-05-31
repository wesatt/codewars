# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'pry'
require 'rspec'
# Both of these `requires` below work. technically the rspec isn't required
# require './lib/pagination_helper'
require 'pagination_helper'

RSpec.describe PaginationHelper do
  # ['a', 'b', 'c', 'd', 'e', 'f'] == %w[a b c d e f] == ('a'..'f').to_a
  let(:helper) { PaginationHelper.new(%w[a b c d e f], 4) }
  let(:helper2) { PaginationHelper.new(('a'..'f').to_a, 7) }

  it 'exists' do
    expect(helper).to be_a PaginationHelper
    expect(helper2).to be_a PaginationHelper
  end

  it ' #item_count returns the number of items within the entire collection' do
    expect(helper.item_count).to eq(6)
    expect(helper2.item_count).to eq(6)
  end

  it '#page_count returns the number of pages' do
    expect(helper.page_count).to eq(2)
    expect(helper2.page_count).to eq(1)
  end

  it '#page_item_count(page_index) returns the number of items on the current page' do
    expect(helper.page_item_count(0)).to eq(4)
    expect(helper.page_item_count(1)).to eq(2)
    expect(helper2.page_item_count(0)).to eq(6)
    expect(helper2.page_item_count(1)).to eq(-1)
  end

  it '#page_index(item_index) determines what page an item is on' do
    expect(helper.page_index(0)).to eq(0)
    expect(helper.page_index(1)).to eq(0)
    expect(helper.page_index(2)).to eq(0)
    expect(helper.page_index(3)).to eq(0)
    expect(helper.page_index(4)).to eq(1)
    expect(helper.page_index(5)).to eq(1)
    expect(helper.page_index(6)).to eq(-1)

    expect(helper2.page_index(0)).to eq(0)
    expect(helper2.page_index(1)).to eq(0)
    expect(helper2.page_index(2)).to eq(0)
    expect(helper2.page_index(3)).to eq(0)
    expect(helper2.page_index(4)).to eq(0)
    expect(helper2.page_index(5)).to eq(0)
    expect(helper2.page_index(6)).to eq(-1)
  end
end

# rubocop:enable Metrics/BlockLength
