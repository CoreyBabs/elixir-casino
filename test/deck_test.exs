defmodule DeckTest do
  use ExUnit.Case, async: true

  test "Create a new deck" do
    deck = Deck.new()
    cards = deck.cards
    assert length(cards) === 52

    hearts = Enum.filter(cards, fn c -> c.suit === :hearts end) 
    clubs = Enum.filter(cards, fn c -> c.suit === :clubs end) 
    spades = Enum.filter(cards, fn c -> c.suit === :spades end) 
    diamonds = Enum.filter(cards, fn c -> c.suit === :diamonds end) 

    assert length(hearts) === 13
    assert length(clubs) === 13
    assert length(spades) === 13
    assert length(diamonds) === 13
  end

  test "Draw a card from the deck" do
    deck = Deck.new()
    {:ok, first} = Enum.fetch(deck.cards, 0)

    {:ok, {drawn, deck}} = Deck.draw(deck)
    assert length(deck.cards) === 51
    assert drawn === first
  end

  test "Draw all cards from the deck" do
    deck = Deck.new()
    deck = draw_cards(deck, 52)
    
    assert length(deck.cards) === 0
    
    {result, _} = Deck.draw(deck)
    assert result === :error
  end

  defp draw_cards(deck, num_cards) do
    case num_cards do
      0 -> deck
      _ -> 
        {:ok, {_drawn, deck}} = Deck.draw(deck)
        draw_cards(deck, num_cards - 1)
    end
  end
end
