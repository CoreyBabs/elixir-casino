defmodule Deck.Card do
  @moduledoc """
  A module that provides a struct and basic information about
  a playing card.
  """
  alias Deck.Card
  @enforce_keys [:value, :suit]
  defstruct [:value, :suit]

  @doc """
  Creates a card with the give `value` and `suit`

  Returns a `Card` sturct
  """
  def new(value, suit) do
    %Card{value: value, suit: suit}
  end

  @doc """
  A helper function to include all possible values for a card.
  Does not include jokers.

  Returns 1..13
  """
  def get_card_values do
    1..13
  end

  @doc """
  A helper function to include all possible suits for a card.
  All suits are represented as atoms:
  `:hearts`, `:diamonds`, `:clubs`, and `:spades`

  Returns [:hearts, :diamonds, :clubs, :spades]
  """
  def get_card_suits do
    [:hearts, :diamonds, :clubs, :spades]
  end
end
