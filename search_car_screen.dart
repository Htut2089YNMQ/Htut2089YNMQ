import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchCarScreen extends StatefulWidget {
  @override
  _SearchCarScreenState createState() => _SearchCarScreenState();
}

class _SearchCarScreenState extends State<SearchCarScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  List<QueryDocumentSnapshot> filteredCars = [];

  void searchCars() {
    setState(() {
      searchQuery = searchController.text.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Car'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchField(),
            SizedBox(height: 20),
            _buildCarList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search by model or category',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: searchCars,
        ),
      ),
    );
  }

  Widget _buildCarList() {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cars').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (searchQuery.isNotEmpty) {
            filteredCars = snapshot.data!.docs.where((car) {
              var carData = car.data() as Map<String, dynamic>;
              return carData['model'].toLowerCase().contains(searchQuery) ||
                     carData['category'].toLowerCase().contains(searchQuery);
            }).toList();
          } else {
            filteredCars = [];
          }

          if (filteredCars.isEmpty) {
            return Center(child: Text('No cars found'));
          }

          return ListView.builder(
            itemCount: filteredCars.length,
            itemBuilder: (context, index) {
              var car = filteredCars[index];
              var carData = car.data() as Map<String, dynamic>;
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  title: Text('${carData['model']} (${carData['year']})'),
                  subtitle: Text('${carData['sellingPrice']} MMK'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}



