defmodule GildedRose do

  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  def update_item(item) do
    updater = ItemUpdater.get(item.name)

    item
    |> updater.update_item
    |> standard_quality_operation
  end

  defp standard_quality_operation(%GildedRose.Item{name: name, sell_in: sell_in, quality: quality})
       when quality > 50 do
    %GildedRose.Item{name: name, sell_in: sell_in, quality: 50}
  end

  defp standard_quality_operation(%GildedRose.Item{name: name, sell_in: sell_in, quality: quality}) do
    %GildedRose.Item{name: name, sell_in: sell_in, quality: quality}
  end
end
