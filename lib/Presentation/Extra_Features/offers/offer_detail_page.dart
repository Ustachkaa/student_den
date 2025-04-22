import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/utils/firestore_service.dart';
import 'model/offer.dart';

class OfferDetailPage extends StatefulWidget {
  final Offer offer;

  const OfferDetailPage({Key? key, required this.offer}) : super(key: key);

  @override
  State<OfferDetailPage> createState() => _OfferDetailPageState();
}

class _OfferDetailPageState extends State<OfferDetailPage> {
  late bool isLiked;
  late String userId;

  @override
  void initState() {
    super.initState();

    // Initialize user ID
    userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    isLiked = widget.offer.isLiked ?? false;
  }

  void toggleLike() async {
    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please log in to like this post.')),
      );
      return;
    }

    setState(() {
      isLiked = !isLiked;
    });

    await FirestoreService().toggleLike(userId, widget.offer.id, isLiked);
  }

  @override
  Widget build(BuildContext context) {
    final offer = widget.offer;

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
                  offer.image!,
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                GestureDetector(
                  onTap: toggleLike,
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                    size: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (offer.rating != null)
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    offer.rating!,
                    style: const TextStyle(fontSize: 18),
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