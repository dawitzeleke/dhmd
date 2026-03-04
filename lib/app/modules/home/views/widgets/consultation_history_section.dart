import 'package:flutter/material.dart';

class ConsultationItem {
  final String name;
  final String specialty;
  final int rating;
  final String imagePath;
  final bool isOnline;
  final bool isFavorite;

  const ConsultationItem({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.imagePath,
    required this.isOnline,
    required this.isFavorite,
  });
}

class ConsultationHistorySection extends StatelessWidget {
  final List<ConsultationItem> items;

  const ConsultationHistorySection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Consultation History',
          style: TextStyle(
            color: Color(0xFF363A43),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _ConsultationCard(item: item),
          ),
        ),
      ],
    );
  }
}

class _ConsultationCard extends StatelessWidget {
  final ConsultationItem item;

  const _ConsultationCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item.imagePath,
                  width: 91,
                  height: 91,
                  fit: BoxFit.cover,
                ),
              ),
              if (item.isOnline)
                const Positioned(
                  top: 6,
                  left: 6,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Color(0xFF2DA66C),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF31343B),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.specialty,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF7781A1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: List.generate(5, (index) {
                      final isFilled = index < item.rating;
                      return Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Icon(
                          Icons.star,
                          size: 13,
                          color: isFilled
                              ? const Color(0xFFF3C849)
                              : const Color(0xFFE2E6EE),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          if (item.isFavorite)
            const Padding(
              padding: EdgeInsets.only(top: 8, left: 8),
              child: Icon(Icons.favorite, color: Color(0xFFFF1A1A), size: 21),
            ),
        ],
      ),
    );
  }
}
