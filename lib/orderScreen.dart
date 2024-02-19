//OrderScreen help the Buyer to View the order that are Available by farmer

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderScreen(),
    );
  }
}

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Let Us Buy the Crop - Help the Farmer'),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('cropDetails').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          var orders = snapshot.data!.docs;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              var order = orders[index].data() as Map<String, dynamic>;
              return OrderCard(order: order);
            },
          );
        },
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      color: Colors.white, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (order['imageUrl'] != null && order['imageUrl'] != '')
            Padding(
              padding: const EdgeInsets.all(16),
              child: CachedNetworkImage(
                imageUrl: order['imageUrl'],
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order['cropName'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('AI Score: ${order['cropQuality']}'),
                Text('Contact Details: ${order['phoneNumber']}'),
                SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _showDetailsDialog(context, order);
                        },
                        child: Text('Details'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _chatWithFarmer(context, order);
                        },
                        child: Text('Chat With Farmer'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _bookDemo(context, order);
                        },
                        child: Text('Book Demo'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailsDialog(BuildContext context, Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Details for Order',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (order['imageUrl'] != null && order['imageUrl'] != '')
                CachedNetworkImage(
                  imageUrl: order['imageUrl'],
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              SizedBox(height: 16),
              Text(
                'Crop Name: ${order['cropName']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Quality: ${order['quantity']}'),
              Text('AI Score: ${order['cropQuality']}'),
              Text('Farming Method: ${order['cropType']}'),
              Text('Contact Details: ${order['phoneNumber']}'),
              Text('Shelf Life: ${order['shelfLife']}'),
              Text('Pick Up: ${order['place']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _chatWithFarmer(BuildContext context, Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Chat Feature Under Development"),
          content: Text(
              "We are currently working on implementing the chat feature. It will be available soon."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _bookDemo(BuildContext context, Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Book Demo"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Please pay the token amount of ₹5000 for the demo."),
              SizedBox(height: 10),
              Text("Payment details and instructions will be provided."),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement the logic to initiate the payment process
                  // This is where you can integrate with a payment gateway
                  // Once payment is successful, proceed with the booking
                  _processPayment(5000.0);
                },
                child: Text("Make Payment"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // TODO: Implement the logic to cancel the booking
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _processPayment(double amount) {
    // TODO: Implement the logic to process the payment
    // Integrate with a payment gateway or any other payment service
    // Once payment is successful, proceed with the booking
    print("Processing payment of ₹$amount");
    // Add your payment processing logic here
  }
}
