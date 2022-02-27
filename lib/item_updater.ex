defmodule ItemUpdater do
  def get("Sulfuras"), do: GildedRose.Item.Sulfuras
  def get("Aged Brie"), do: GildedRose.Item.AgedBrie
  def get("Backstage passes"), do: GildedRose.Item.BackstagePasses
  def get("Conjured"), do: GildedRose.Item.Conjured
  def get(_name), do: GildedRose.Item.Standard
end
