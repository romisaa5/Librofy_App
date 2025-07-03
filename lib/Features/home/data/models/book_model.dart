class BookModel {
  final String title;
  final String image;
  final double rating;
  final String genre;
  final String summary;

  BookModel(
    this.genre,
    this.summary, {
    required this.title,
    required this.image,
    required this.rating,
  });

  static List<BookModel> bookList = [
    // --- Fantasy ---
    BookModel(
      'Fantasy',
      'A thrilling tale of magic, dragons, and destiny.',
      title: 'The Dragon’s Heir',
      image: 'assets/images/book.jpg',
      rating: 4.5,
    ),
    BookModel(
      'Fantasy',
      'A young sorcerer fights to restore balance to his realm.',
      title: 'Mage’s Legacy',
      image: 'assets/images/book.jpg',
      rating: 4.4,
    ),

    // --- Romance ---
    BookModel(
      'Romance',
      'A heartfelt story about love, loss, and new beginnings.',
      title: 'Whispers of the Heart',
      image: 'assets/images/book.jpg',
      rating: 4.2,
    ),
    BookModel(
      'Romance',
      'Two strangers meet on a rainy day and change each other’s lives.',
      title: 'Rainy Day Love',
      image: 'assets/images/book.jpg',
      rating: 4.1,
    ),

    // --- Self-help ---
    BookModel(
      'Self-help',
      'A practical guide to personal growth and success.',
      title: 'Unlock Your Potential',
      image: 'assets/images/book.jpg',
      rating: 4.0,
    ),
    BookModel(
      'Self-help',
      'Simple habits that lead to long-term happiness.',
      title: 'The Power of Small Steps',
      image: 'assets/images/book.jpg',
      rating: 4.3,
    ),

    // --- Science Fiction ---
    BookModel(
      'Science Fiction',
      'Explore the galaxy in this interstellar adventure.',
      title: 'Beyond the Stars',
      image: 'assets/images/book.jpg',
      rating: 4.7,
    ),
    BookModel(
      'Science Fiction',
      'An AI rebellion threatens the fate of humanity.',
      title: 'Rise of the Machines',
      image: 'assets/images/book.jpg',
      rating: 4.6,
    ),

    // --- Mystery ---
    BookModel(
      'Mystery',
      'A detective races against time to solve a dark murder.',
      title: 'The Silent Witness',
      image: 'assets/images/book.jpg',
      rating: 4.3,
    ),
    BookModel(
      'Mystery',
      'Secrets buried in a small town come to light.',
      title: 'Shadows in the Fog',
      image: 'assets/images/book.jpg',
      rating: 4.4,
    ),
  ];
}
