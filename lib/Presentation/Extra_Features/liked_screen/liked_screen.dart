import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../Extra_Features/offers/model/offer.dart';
import '../../Extra_Features/offers/widgets/offer_card.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({Key? key}) : super(key: key);

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  List<Offer> likedOffers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLikedOffers();
  }

  Future<void> fetchLikedOffers() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    try {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      final likedPostIds = List<String>.from(userDoc.data()?['likedPosts'] ?? []);

      if (likedPostIds.isEmpty) {
        setState(() {
          likedOffers = [];
          isLoading = false;
        });
        return;
      }

      final postsCollection = await FirebaseFirestore.instance.collection('posts').get();

      final List<Offer> offers = postsCollection.docs
          .where((doc) => likedPostIds.contains(doc.id))
          .map((doc) {
        final data = doc.data();
        return Offer(
          id: doc.id,
          title: data['title'],
          description: data['description'],
          image: data['image'],
          price: data['price'],
          offer: data['offer'],
          rating: data['rating'],
          // We no longer use isLiked field here
        );
      })
          .toList();

      setState(() {
        likedOffers = offers;
        isLoading = false;
      });
    } catch (e) {
      print("🔥 Failed to fetch liked offers: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '❤ Liked Posts',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: appTheme.whiteA700,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: likedOffers.isEmpty
            ? const Center(child: Text("You haven’t liked anything yet."))
            : Wrap(
          spacing: 12,
          runSpacing: 12,
          children: likedOffers
              .map(
                (offer) => OfferCard(
              key: ValueKey(offer.id),
              offer: offer,
              onTap: () {
                // Optionally navigate to detail screen
              },
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}