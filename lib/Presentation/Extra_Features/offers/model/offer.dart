class Offer {
  final String title;
  final String? offer; // For discounts
  final String? price; // For activities, jobs, handy work
  final String? rating;
  final String? image;
  final String? description;

  Offer({
    required this.title,
    this.offer,
    this.price,
    this.rating,
    this.image,
    this.description,
  });

  factory Offer.fromJson(Map<String, dynamic> json, String category) {
    switch (category) {
      case 'discounts':
        return Offer(
          title: json['title'],
          offer: json['offer'],
          rating: json['rating'],
          image: json['image'],
          description: json['description'],
        );
      case 'activities':
        return Offer(
          title: json['title'],
          price: json['price'],
          image: json['image'],
          description: json['description'],
        );
      case 'jobs':
        return Offer(
          title: json['title'],
          price: json['pay'],
          rating: json['rating'],
          image: json['image'],
          description: json['description'],
        );
      case 'leisure_discounts':
        return Offer(
          title: json['title'],
          offer: json['offer'],
          rating: json['rating'],
          image: json['image'],
          description: json['description'],
        );
      case 'handy_work':
        return Offer(
          title: json['title'],
          price: json['rate'],
          image: json['image'],
          description: json['description'],
        );
      case 'news':
        return Offer(
          title: json['title'],
          image: json['image'],
          description: json['description'],
        );
      default:
        throw ArgumentError('Unknown category: $category');
    }
  }
}