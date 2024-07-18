import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/car.dart';
import '../widgets/custom_text_field.dart';

class AddCarScreen extends StatelessWidget {
  final TextEditingController modelController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  final double exchangeRate = 2100.0;
  final double profitMargin = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Car')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(controller: modelController, labelText: 'Model'),
              SizedBox(height: 10),
              CustomTextField(controller: nameController, labelText: 'Name'),
              SizedBox(height: 10),
              CustomTextField(
                  controller: purchasePriceController,
                  labelText: 'Purchase Price',
                  keyboardType: TextInputType.number),
              SizedBox(height: 10),
              CustomTextField(controller: categoryController, labelText: 'Category'),
              SizedBox(height: 10),
              CustomTextField(
                  controller: yearController,
                  labelText: 'Year of Manufacture',
                  keyboardType: TextInputType.number),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _addCar(context),
                child: Text('Add Car'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addCar(BuildContext context) async {
    double purchasePrice = double.parse(purchasePriceController.text);
    double sellingPrice = (purchasePrice * exchangeRate) * (1 + profitMargin);
    Car car = Car(
      model: modelController.text,
      name: nameController.text,
      purchasePrice: purchasePrice,
      sellingPrice: sellingPrice,
      category: categoryController.text,
      year: int.parse(yearController.text),
    );
    await FirebaseFirestore.instance.collection('cars').add(car.toMap());
    Navigator.pop(context);
  }
}