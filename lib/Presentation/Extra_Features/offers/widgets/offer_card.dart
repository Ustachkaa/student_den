import 'package:flutter/material.dart';
import '../model/offer.dart';

class OfferCard extends StatefulWidget {
  final Offer offer;
  final VoidCallback onTap;
  final Function(bool) onLikeToggle;

  const OfferCard({
    Key? key,
    required this.offer,
    required this.onTap,
    required this.onLikeToggle,
  }) : super(key: key);

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.offer.isLiked ?? false;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    widget.onLikeToggle(isLiked); // Notify parent to update the model or storage
  }

  @override
  Widget build(BuildContext context) {
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
                if (widget.offer.image != null)
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      widget.offer.image!,
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
                        widget.offer.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (widget.offer.offer != null)
                        Text(
                          widget.offer.offer!,
                          style: TextStyle(
                            color: Colors.green[600],
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (widget.offer.price != null)
                        Text(
                          widget.offer.price!,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 4),
                      if (widget.offer.rating != null)
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(widget.offer.rating!),
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
                onTap: toggleLike,
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