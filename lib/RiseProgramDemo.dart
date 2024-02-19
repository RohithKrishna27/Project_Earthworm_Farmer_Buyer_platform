import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Farmer {
  final String name;
  final String brandName;
  final String cropsGrown;
  final List<String> studentsAllotted;
  final String photo;

  Farmer({
    required this.name,
    required this.brandName,
    required this.cropsGrown,
    required this.studentsAllotted,
    required this.photo,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EarthwormRiseDemoPage(),
    );
  }
}

class EarthwormRiseDemoPage extends StatelessWidget {
  final List<Farmer> farmers = [
    Farmer(
      name: 'Sunil Gowda',
      brandName: 'Green Harvest',
      cropsGrown: 'Ragi, Wheat, Soybeans',
      studentsAllotted: ['From AMC College','Raju (Supply Chain)', 'Niraj(Branding)', 'Sumesh(Markeking)', 'Tarun(Sales)'],
      photo: 'assets/images/farmer1.jpeg',
    ),
    Farmer(
      name: 'Asha Singh',
      brandName: 'Golden Fields',
      cropsGrown: 'Rice, Barley, Sunflower',
      studentsAllotted: ['From BMSMC College','Suraj(Supply Chain)', 'Aniket(Branding)', 'Sujai(Markeking)', 'Vipul(Sales)'],
      photo: 'assets/images/farmer2.jpeg',
    ),
    Farmer(
      name: 'Natraj',
      brandName: 'Natures Bounty',
      cropsGrown: 'Dairy Products, Peppers, Carrots',
      studentsAllotted: ['From MIT College',' Varun(Supply Chain)', 'Ajay(Branding)', 'Micheal(Markeking)', 'Satya(Sales)'],
      photo: 'assets/images/farmer3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earthworm RISE '),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: farmers.length,
        itemBuilder: (context, index) {
          return FarmerCard(farmer: farmers[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEnrollmentDialog(context);
        },
        child: Icon(Icons.how_to_reg),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showEnrollmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thank You for Enrolling!'),
          content: Text('Our Earthworm team will contact you soon.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class FarmerCard extends StatelessWidget {
  final Farmer farmer;

  FarmerCard({required this.farmer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage(farmer.photo),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Farmer Name: ${farmer.name}'),
                  Text('Brand Name: ${farmer.brandName}'),
                  Text('Crops Grown: ${farmer.cropsGrown}'),
                  Text('Students Allotted: ${farmer.studentsAllotted.join(', ')}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
