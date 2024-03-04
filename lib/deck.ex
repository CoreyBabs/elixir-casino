defmodule Deck do
  alias Deck.Card, as: Card

  @enforce_keys [:cards]
  defstruct [:cards]

  def new() do
    values = Card.get_card_values()
    suits = Card.get_card_suits()
      
    cards = Enum.map(values,
      fn v -> Enum.map(suits,
        fn s -> %Card{value: v, suit: s} end)
      end)
    
    List.flatten(cards)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def draw(deck) when length(deck) > 0 do
    [head | tail] = deck
    {:ok, {head, tail}}
  end

  def draw(_deck) do
    {:error, "tried to draw from empty deck."}
  end
end
