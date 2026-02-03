import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  static const List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Chicken Biryani',
      'price': 180,
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/3/3b/Chicken_Biryani.jpg',
    },
    {
      'name': 'Mutton Biryani',
      'price': 260,
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/4/45/Mutton_Biryani.jpg',
    },
    {
      'name': 'Alfam Chicken',
      'price': 220,
      'image':
          'https://images.unsplash.com/photo-1600891964599-f61ba0e24092',
    },
    {
      'name': 'Grilled Chicken',
      'price': 240,
      'image':
          'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b',
    },
    {
      'name': 'Paneer Butter Masala',
      'price': 190,
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/1/1c/Paneer_Butter_Masala.jpg',
    },
    {
      'name': 'Dal Makhani',
      'price': 160,
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/4/4f/Dal_Makhani.jpg',
    },
    {
      'name': 'Butter Naan',
      'price': 40,
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/6/60/Butter_Naan.jpg',
    },
    {
      'name': 'Gulab Jamun',
      'price': 90,
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/5/5e/Gulab_jamun_%28Gibraltar%29.jpg',
    },
    {
      'name': 'Fresh Lime Soda',
      'price': 70,
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/6/63/Lime_soda.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: menuItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) {
        final item = menuItems[index];

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IMAGE
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    item['image'],
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 40,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 6),

              /// NAME
              Text(
                item['name'],
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 2),

              /// PRICE
              Text(
                '₹${item['price']}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 6),

              /// ADD BUTTON
              SizedBox(
                height: 32,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
