enum Rank {
  ace,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king
}

enum Suit { clubs, diamonds, hearts, spades }

class Card {
  Rank rank;
  Suit suit;

  Card({required this.rank, required this.suit});

  @override
  String toString() {
    return "Card: ${rank.name} of ${suit.name}";
  }
}

class Deck {
  List<Card> cards = [for (Suit suit in Suit.values) for (Rank rank in Rank.values) Card(rank: rank, suit: suit)];
  List<Card> out = [];

  void list() {
    cards.forEach((element) { print(element); });
  }

  void shuffle({bool reshuffle = false}) {
    if (reshuffle) cards.addAll(out);
    cards.shuffle();
  }

  List<Card> filter({required Suit suit}) {
    return cards.where((card) => card.suit == suit).toList();
  }

  List<Card> deal(int number) {
    return List.generate(number, (index) => _draw());
  }

  void remove(Suit suit, Rank rank) {
    cards.removeWhere((card) => card.suit == suit && card.rank == rank);
  }

  Card _draw() {
    Card card = cards.removeLast();
    out.add(card);
    return card;
  }

  @override
  String toString() => "Deck: ${cards.length} cards";
}

void main() {
  var deck = Deck();
  print(deck);
  deck.shuffle();
  deck.list();
}