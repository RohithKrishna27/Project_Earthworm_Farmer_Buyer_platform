//OrderSummaryScreen is used to generate to Summary of the Crop Placed by a farmer
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderSummaryScreen extends StatelessWidget {
  final String cropName;
  final String quantity;
  final String cropType;
  final String shelfLife;
  final String place;
  final String phoneNumber;
  final String orderId;

  OrderSummaryScreen({
    required this.cropName,
    required this.quantity,
    required this.cropType,
    required this.shelfLife,
    required this.place,
    required this.phoneNumber,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('cropDetails')
            .orderBy('timestamp', descending: true)
            .limit(1)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No recent orders.'));
          } else {
            try {
              Map<String, dynamic> data =
                  snapshot.data!.docs.first.data() as Map<String, dynamic>;
              return _buildOrderSummary(context, data);
            } catch (e) {
              return Center(child: Text('Error parsing data: $e'));
            }
          }
        },
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context, Map<String, dynamic> data) {
    String cropNameFromFirestore = data['cropName'] ?? '';
    String cropTypeFromFirestore = data['cropType'] ?? '';
    String phoneNumberFromFirestore = data['phoneNumber'] ?? '';
    String placeFromFirestore = data['place'] ?? '';
    String quantityFromFirestore = data['quantity'] ?? '';
    String shelfLifeFromFirestore = data['shelfLife'] ?? '';

    Timestamp timestamp = data['timestamp'] as Timestamp;
    DateTime dateTime = timestamp.toDate();

    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            _buildParameterBox('Crop Name', cropNameFromFirestore),
            _buildParameterBox('Crop Type', cropTypeFromFirestore),
            _buildParameterBox('Phone Number', phoneNumberFromFirestore),
            _buildParameterBox('Place', placeFromFirestore),
            _buildParameterBox('Quantity', quantityFromFirestore),
            _buildParameterBox('Shelf Life', shelfLifeFromFirestore),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showOrderPlacedDialog(context);
                },
                child: Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParameterBox(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 218, 224, 218), // Light green background
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            value,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }

  void _showOrderPlacedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Placed'),
          content: Text('Your order has been successfully placed.'),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate to FarmerHomeScreen
                Navigator.pushReplacementNamed(context, '/farmerHome');
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
