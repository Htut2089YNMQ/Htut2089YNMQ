import 'package:flutter/material.dart';
import 'add_car_screen.dart';
import 'car_list_screen.dart';
import 'search_car_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Car Inventory',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                context: context,
                label: 'Add Car',
                icon: Icons.add,
                screen: AddCarScreen(),
              ),
              SizedBox(height: 10),
              _buildButton(
                context: context,
                label: 'View Cars',
                icon: Icons.view_list,
                screen: CarListScreen(),
              ),
              SizedBox(height: 10),
              _buildButton(
                context: context,
                label: 'Search Car',
                icon: Icons.search,
                screen: SearchCarScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Widget screen,
  }) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}


