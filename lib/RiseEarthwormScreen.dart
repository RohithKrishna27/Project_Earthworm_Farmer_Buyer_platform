import 'package:earthworm/RiseProgramDemo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EarthwormRisePage(),
    );
  }
}

class EarthwormRisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earthworm RISE'),
        backgroundColor: Colors.green, 
      ),
      backgroundColor: Colors.white, 
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
   
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                "assets/images/Earthwormlogo.png",
                height: 100.0,
                
              ),
            ),
            // Earthworm RISE project description
            Text(
              'Earthworm RISE Project',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Empowering farmers and students through collaboration.\n\n'
              'The Earthworm RISE project is a transformative initiative aimed at uplifting farmers by assisting them in building a robust brand and establishing a direct-to-consumer (B2C) business model. College prefinal year or final year students, possessing expertise in branding, packaging, sales, marketing, and supply chain management, will work closely with farmers for an intensive 3-month program.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Key Features:\n'
              '• **Holistic Support: Comprehensive assistance in branding, packaging, sales, and marketing.\n'
              '• **Collaborative Teams: Direct collaboration with a team of 4 dedicated students per farmer.\n'
              '• **Duration: A 3-month intensive program tailored to address the unique needs of each farmer.\n'
              '• **Supply Chain Expertise: Inclusion of 4 students with specialized knowledge in optimizing the supply chain for enhanced efficiency.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Frequently Asked Questions:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            FAQSection(
              question: 'How can farmers benefit from Earthworm RISE?',
              answer:
                  'Farmers can benefit by receiving expert guidance and support in building their brand, improving packaging, optimizing sales and marketing strategies, and enhancing overall business efficiency through collaboration with trained college students.',
            ),
            FAQSection(
              question: 'Who are the students participating in the project?',
              answer:
                  'Students are prefinal or final year college students with expertise in branding, packaging, sales, marketing, and supply chain management. They are dedicated to working closely with farmers for 3 months to provide valuable insights and hands-on assistance.',
            ),
            FAQSection(
              question: 'How are farmers selected for the program?',
              answer:
                  'Farmers are selected based on their current conditions and needs. The enrollment process involves assessing the farmers\' requirements and matching them with a team of students who can best address those needs.',
            ),
            FAQSection(
              question: 'Is there a cost associated with enrolling in Earthworm RISE?',
              answer:
                  'No, enrollment in Earthworm RISE is completely free for farmers. The project aims to support and uplift farmers without any financial burden.',
            ),
            SizedBox(height: 16.0),
            Text(
              'Enrollment is now open!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EarthwormRiseDemoPage()),
                        );
              },
              child: Text('Enroll Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQSection extends StatelessWidget {
  final String question;
  final String answer;

  FAQSection({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          question,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          answer,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
