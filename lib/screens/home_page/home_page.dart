import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade400,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Deliver to Bhubaneswar'),
            Row(
              children: const [
                Icon(Icons.location_on, size: 16),
                Text('751024'),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.notifications_none),
          SizedBox(width: 10),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search product',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/banner.png'),

            _sectionTitle('Categories', trailing: 'View More'),
            _horizontalIconsList(),

            _sectionTitle('Deal of the Day', trailing: 'View Details'),
            _dealOfTheDay(),

            _sectionTitle('Popular Products', trailing: 'View More'),
            _horizontalProductList(),

            _sectionTitle('Just For You'),
            _verticalProductList(),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('View More'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, {String? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          if (trailing != null) Text(trailing, style: const TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }

  Widget _horizontalIconsList() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(radius: 30, backgroundColor: Colors.grey.shade300),
        ),
      ),
    );
  }

  Widget _dealOfTheDay() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Icon(Icons.local_fire_department, color: Colors.orange),
          const SizedBox(width: 5),
          const Text('Ending in 03h 22m'),
        ],
      ),
    );
  }

  Widget _horizontalProductList() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) => _productCard(),
      ),
    );
  }

  Widget _verticalProductList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => _productCard(),
    );
  }

  Widget _productCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Product Title', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Description...', maxLines: 1, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 4),
                  Text('₹45', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
