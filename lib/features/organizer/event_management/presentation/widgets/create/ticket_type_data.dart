import 'package:flutter/material.dart';

class TicketTypeData {
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController quantityController;
  bool isActive;

  TicketTypeData({
    required String name,
    required String description,
    required double price,
    required int quantity,
    required this.isActive,
  })  : nameController = TextEditingController(text: name),
        descriptionController = TextEditingController(text: description),
        priceController = TextEditingController(text: price.toString()),
        quantityController = TextEditingController(text: quantity.toString());

  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }
}
