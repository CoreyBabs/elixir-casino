defmodule Deck do
  @moduledoc """
  A module to represent a deck of playing cards.
  """
  alias Deck.Card, as: Card

  @enforce_keys [:cards]
  defstruct [:cards]

  @doc """
  Creates a Deck struct which contains a list of cards.
  This creates a standard playing card deck with cards
  2-10, A, J, Q, and K and one for each suit. Aces and
  face cards are represented as numbers. The list of
  cards is NOT shuffled.

  Returns a `Deck` with a non shuffled list of `Card`
  """
  def new() do
    values = Card.get_card_values()
    suits = Card.get_card_suits()
      
    cards = Enum.map(values,
      fn v -> Enum.map(suits,
        fn s -> %Card{value: v, suit: s} end)
      end)
    
    cards = List.flatten(cards)
    %Deck{cards: cards}
  end

  @doc """
  Shuffles the give deck of cards.

  Returns the shuffled deck.
  """
  def shuffle(deck) do
    %{deck | cards: Enum.shuffle(deck.cards)}
  end

  @doc """
  Draws a card from the top of the deck.

  Returns {:ok, {drawn, deck}} if `length(deck) > 0`
  where drawn is the card on top of the deck and deck is
  the deck without the card that was just drawn.

  Returns {:error, msg} if `length(deck) === 0`
  """
  def draw(deck) when length(deck.cards) > 0 do
    [head | tail] = deck.cards
    {:ok, {head, %{deck | cards: tail}}}
  end

  def draw(_deck) do
    {:error, "tried to draw from empty deck."}
  end
end
