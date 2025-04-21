import 'package:flutter/material.dart';
import 'model/offer.dart'; // Import your Offer model

class OfferDetailPage extends StatelessWidget {
  final Offer offer;

  const OfferDetailPage({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(offer.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (offer.image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  offer.image!, // Replace with NetworkImage if needed
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Center(child: Icon(Icons.broken_image)),
                    );
                  },
                ),
              ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    offer.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                if (offer.rating != null)
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        offer.rating!,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (offer.offer != null)
              Text(
                offer.offer!,
                style: TextStyle(
                  color: Colors.green[600],
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            if (offer.price != null)
              Text(
                offer.price!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            const SizedBox(height: 16),
            if (offer.description != null)
              Text(
                offer.description!,
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}