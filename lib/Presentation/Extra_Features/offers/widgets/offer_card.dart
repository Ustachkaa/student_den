import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/utils/firestore_service.dart';
import '../model/offer.dart';

class OfferCard extends StatefulWidget {
  final Offer offer;
  final VoidCallback onTap;

  const OfferCard({
    Key? key,
    required this.offer,
    required this.onTap,
  }) : super(key: key);

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  bool isLiked = false;
  bool isLoading = true;
  late String userId;

  @override
  void initState() {
    super.initState();
    _loadLikeStatus();
  }

  Future<void> _loadLikeStatus() async {
    userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    if (userId.isEmpty) {
      setState(() {
        isLiked = false;
        isLoading = false;
      });
      return;
    }

    final likedPosts = await FirestoreService().getLikedPosts(userId);
    setState(() {
      isLiked = likedPosts.contains(widget.offer.id);
      isLoading = false;
    });
  }

  Future<void> _toggleLike() async {
    if (userId.isEmpty) return;

    final newStatus = !isLiked;

    setState(() {
      isLiked = newStatus;
    });

    await FirestoreService().toggleLike(userId, widget.offer.id, newStatus);
    // Optional: re-load to confirm from Firestore (redundant unless you expect inconsistencies)
    // await _loadLikeStatus();
  }

  @override
  Widget build(BuildContext context) {
    final offer = widget.offer;

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (offer.image != null)
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      offer.image!,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const SizedBox(
                        height: 100,
                        child: Center(child: Icon(Icons.broken_image)),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (offer.offer != null)
                        Text(
                          offer.offer!,
                          style: TextStyle(
                            color: Colors.green[600],
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (offer.price != null)
                        Text(
                          offer.price!,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 4),
                      if (offer.rating != null)
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(offer.rating!),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: GestureDetector(
                onTap: _toggleLike,
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}