//Developing EarthWorm Finance
import 'package:flutter/material.dart';

class EarthwormFinance extends StatefulWidget {
  const EarthwormFinance({Key? key}) : super(key: key);

  @override
  State<EarthwormFinance> createState() => _EarthwormFinanceState();
}

class _EarthwormFinanceState extends State<EarthwormFinance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earthworm Finance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: 1.10,
                children: [
                  _FeaturesInEarthworm(
                    image: "assets/images/donateimage.jpg", 
                    name: 'Donate Money',
                  ),
                  _FeaturesInEarthworm(
                    image: "assets/images/requestmoney.jpeg", 
                    name: 'Request Money',
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, 
    );
  }
}

class _FeaturesInEarthworm extends StatelessWidget {
  final String image;
  final String name;

  const _FeaturesInEarthworm({
    required this.image,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 80, 
            width: 80, 
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: EarthwormFinance(),
  ));
}
