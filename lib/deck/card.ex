defmodule Deck.Card do
  alias Deck.Card
  @enforce_keys [:value, :suit]
  defstruct [:value, :suit]

  def new(value, suit) do
    %Card{value: value, suit: suit}
  end

  def get_card_values do
    1..13
  end

  def get_card_suits do
    [:hearts, :diamonds, :clubs, :spades]
  end
end
