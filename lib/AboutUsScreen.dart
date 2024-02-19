//About our Project and Aim of Earthworm

import 'package:flutter/material.dart';

class AboutEarthworm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Container(
        color: Colors.white, 
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Earthwormlogo.png', 
                  height: 200, 
                  width: 200, 
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to Project Earthworm!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                '"Earthworm, the best friend of the farmer ~ Project Earthworm"',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Project Overview:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Project Earthworm aims to bridge the gap between farmers and agricultural product buyers, eliminating the influence of middlemen in the supply chain. The primary goal is to empower farmers and ensure fair pricing for their produce.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Challenges Faced by Farmers:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Farmers often face challenges such as low prices offered by middlemen, misinformation, and lack of proper market access. Project Earthworm addresses these issues by providing a direct connection between farmers and buyers.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'How Earthworm Works:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Farmers can post pictures of their agricultural products on Earthworm. AI technology verifies the product quality, and the product is then delivered to the buyer. The business model is B2B, facilitating transactions between farmers and buyers.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Our Mission:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'To achieve social welfare for farmers by providing a user-friendly platform, customized chatbot, verified agricultural produce listings, and financial assistance.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Features of Earthworm:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FeatureItem(
                    title: 'User-friendly Interface',
                    description:
                        'Earthworm provides a simple and intuitive interface for farmers and buyers to navigate and interact easily.',
                  ),
                  _FeatureItem(
                    title: 'Customized Earthworm Chatbot',
                    description:
                        'Our chatbot is tailored to assist users with various tasks, providing personalized and efficient support.',
                  ),
                  _FeatureItem(
                    title: 'Verified Agricultural Produce Listings',
                    description:
                        'Buyers can confidently explore and purchase high-quality, verified agricultural products directly from farmers.',
                  ),
                  _FeatureItem(
                    title: 'Lending of Small Finance',
                    description:
                        'Farmers have the option to receive small financial assistance, fostering economic stability and growth.',
                  ),
                  _FeatureItem(
                    title: 'Healthy Customer Services',
                    description:
                        'Earthworm prioritizes customer satisfaction, ensuring prompt and helpful services for both farmers and buyers.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String title;
  final String description;

  const _FeatureItem({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutEarthworm(),
  ));
}
