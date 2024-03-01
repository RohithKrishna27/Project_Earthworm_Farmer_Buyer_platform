import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earthworm/AIProcessing/AIQualityChart.dart';
import 'package:earthworm/OrderSummaryScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIProcessingScreen extends StatelessWidget {
  final String imageUrl;
  final String cropName;
  final String quantity;
  final String cropType;
  final String shelfLife;
  final String place;
  final String phoneNumber;
  final String orderId;

  const AIProcessingScreen({
    Key? key,
    required this.imageUrl,
    required this.cropName,
    required this.quantity,
    required this.cropType,
    required this.shelfLife,
    required this.place,
    required this.phoneNumber,
    required this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 3: AI Result'),
        backgroundColor: Colors.blue[400],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: analyzeImage(imageUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final qualityScore = calculateQualityScore(snapshot.data!);

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Crop Quality: ${qualityScore.toStringAsFixed(2)}/10',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AIQualityScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'View Quality Details',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        // Save data to Firestore
                        await FirebaseFirestore.instance
                            .collection('processedData')
                            .add({
                          'imageUrl': imageUrl,
                          'cropQuality': qualityScore,
                          'timestamp': FieldValue.serverTimestamp(),
                        });

                        // Navigate to OrderSummaryScreen with processed data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderSummaryScreen(
                              cropName: cropName,
                              quantity: quantity,
                              cropType: cropType,
                              shelfLife: shelfLife,
                              place: place,
                              phoneNumber: phoneNumber,
                              orderId: orderId,
                            ),
                          ),
                        );
                      } catch (e) {
                        // Handle error if data cannot be saved to Firestore
                        print('Error saving data to Firestore: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error saving data to Firestore: $e'),
                          ),
                        );
                      }
                    },
                    child: Text('Accept and Continue'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Cloud Vision API for AI Quality Analysis with Label Detection
  Future<Map<String, dynamic>> analyzeImage(String imageUrl) async {
    final apiKey = '${dotenv.env["apikey"]}';
    final apiUrl = 'https://vision.googleapis.com/v1/images:annotate';

    final requestBody = {
      'requests': [
        {
          'image': {
            'source': {'imageUri': imageUrl}
          },
          'features': [
            {'type': 'LABEL_DETECTION'}
          ],
        },
      ],
    };

    final response = await http.post(
      Uri.parse('$apiUrl?key=$apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception(
          'Failed to analyze image. Status code: ${response.statusCode}');
    }
  }

  // Calculating AI Score based on Label Detection results
  double calculateQualityScore(Map<String, dynamic> responseData) {
    try {
      final labelAnnotations = responseData['responses'][0]['labelAnnotations'];

      if (labelAnnotations != null && labelAnnotations.isNotEmpty) {
        // For simplicity, let's assume the first label annotation represents the crop
        final cropLabel = labelAnnotations[0]['description'];
        final score = labelAnnotations[0]['score'];

        // Customize your quality score calculation based on the crop label and score
        double qualityScore = 0.0;

        // You can add your own logic to calculate the quality score based on the crop label and score
        // Example: Assign a score based on specific crop labels or conditions
        if (cropLabel == 'Healthy Crop' && score > 0.8) {
          qualityScore = 10.0;
        } else if (cropLabel == 'Moderate Crop' && score > 0.6) {
          qualityScore = 7.0;
        } else {
          // Default score if conditions are not met
          qualityScore = 5.0;
        }

        return qualityScore;
      } else {
        // Default score if label annotations are not available
        return 0.0;
      }
    } catch (e) {
      print('Error calculating quality score: $e');
      return 0.0;
    }
  }
}
