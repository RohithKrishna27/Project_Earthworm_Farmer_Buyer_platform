//This Screen Help the Farmer to Fill the Crop Details
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earthworm/OrderSummaryScreen.dart';
import 'package:earthworm/uploadPhoto/UploadPhoto.dart';

class CropSellScreen extends StatefulWidget {
  const CropSellScreen({Key? key}) : super(key: key);

  @override
  _CropSellScreenState createState() => _CropSellScreenState();
}

class _CropSellScreenState extends State<CropSellScreen> {
  late String orderId;
  final _textController = TextEditingController();
  final _quantityController = TextEditingController();
  final _typeController = TextEditingController();
  final _shelfLifeController = TextEditingController();
  final _placeController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Details'),
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
        color: Colors.blue[400],
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 12.0),
              Center(
                child: Text(
                  'Step 1: Crop Details',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Center(
                child: Image.asset(
                  'assets/images/Earthwormlogo.png',
                  height: 100,
                  width: 200,
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(height: 16.0),
              _buildTextField('Crop Name', _textController),
              _buildTextField('Quantity Available in KG', _quantityController),
              _buildTextField('Method of Farming', _typeController),
              _buildTextField('Expected Shelf Life', _shelfLifeController),
              _buildTextField('Pickup Location', _placeController),
              _buildTextField('Phone Number', _phoneNumberController),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  await _saveCropDetails();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpLoadPhotoScreen(
                        orderId: orderId,
                        cropName: _textController.text,
                        quantity: _quantityController.text,
                        cropType: _typeController.text,
                        shelfLife: _shelfLifeController.text,
                        place: _placeController.text,
                        phoneNumber: _phoneNumberController.text,
                      ),
                    ),
                  );
                },
                child: Text('Save Crop Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Future<void> _saveCropDetails() async {
    try {
      final CollectionReference _cropDetails =
          FirebaseFirestore.instance.collection('cropDetails');

      // Save crop details to Firestore
      final DocumentReference documentReference = await _cropDetails.add({
        'cropName': _textController.text,
        'quantity': _quantityController.text,
        'cropType': _typeController.text,
        'shelfLife': _shelfLifeController.text,
        'place': _placeController.text,
        'phoneNumber': _phoneNumberController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Extract orderId from the document reference
      orderId = documentReference.id;

      _textController.clear();
      _quantityController.clear();
      _typeController.clear();
      _shelfLifeController.clear();
      _placeController.clear();
      _phoneNumberController.clear();

      print('Crop details saved to Firestore with orderId: $orderId');
    } catch (error) {
      print('Error saving crop details: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving crop details: $error'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _quantityController.dispose();
    _typeController.dispose();
    _shelfLifeController.dispose();
    _placeController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
