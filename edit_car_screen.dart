import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/custom_text_field.dart';

class EditCarScreen extends StatelessWidget {
  final DocumentSnapshot car;
  final TextEditingController modelController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController sellingPriceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  EditCarScreen({required this.car}) {
    var carData = car.data() as Map<String, dynamic>;
    modelController.text = carData['model'] ?? '';
    nameController.text = carData['name'] ?? '';
    purchasePriceController.text = carData['purchasePrice']?.toString() ?? '';
    sellingPriceController.text = carData['sellingPrice']?.toString() ?? '';
    categoryController.text = carData['category'] ?? '';
    yearController.text = carData['year']?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Car')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            CustomTextField(
                controller: sellingPriceController,
                labelText: 'Selling Price',
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
              onPressed: () => _updateCar(context),
              child: Text('Update Car'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateCar(BuildContext context) async {
    await FirebaseFirestore.instance.collection('cars').doc(car.id).update({
      'model': modelController.text,
      'name': nameController.text,
      'purchasePrice': double.parse(purchasePriceController.text),
      'sellingPrice': double.parse(sellingPriceController.text),
      'category': categoryController.text,
      'year': int.parse(yearController.text),
    });
    Navigator.pop(context);
  }
}
