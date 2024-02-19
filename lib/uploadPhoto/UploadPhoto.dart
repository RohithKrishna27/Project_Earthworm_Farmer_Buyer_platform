//Uploading Crop Image Screen
import 'dart:convert';
import 'dart:io';
import 'package:earthworm/AIProcessing/AIProcessingScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UpLoadPhotoScreen extends StatefulWidget {
  final String cropName;
  final String quantity;
  final String cropType;
  final String shelfLife;
  final String place;
  final String phoneNumber;
  final String orderId;

  const UpLoadPhotoScreen({
    Key? key,
    required this.cropName,
    required this.quantity,
    required this.cropType,
    required this.shelfLife,
    required this.place,
    required this.phoneNumber,
    required this.orderId,
  }) : super(key: key);

  @override
  State<UpLoadPhotoScreen> createState() => _UpLoadPhotoScreenState();
}

class _UpLoadPhotoScreenState extends State<UpLoadPhotoScreen> {
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Photo'),
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo, size: 50),
                  SizedBox(height: 10),
                  Text(
                    'Step-2 -> Upload Photo',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Please Upload or Capture your live Crop photo for AI Analysis',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                //Collecting Image from the Gallery
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  print('${file?.path}');
                  if (file != null) {
                    setState(() {
                      _imageFile = file;
                    });
                  }
                },
                icon: Icon(Icons.photo_library),
                tooltip: 'Select from Gallery',
              ),
              SizedBox(width: 20),
              IconButton(
                //Collecting Image from the Camera
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  print('${file?.path}');
                  if (file != null) {
                    setState(() {
                      _imageFile = file;
                    });
                  }
                },
                icon: Icon(Icons.camera_alt),
                tooltip: 'Capture from Camera',
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _imageFile != null ? _uploadImage : null,
            child: Text('Upload Image'),
          ),
        ],
      ),
    );
  }

  Future<void> _uploadImage() async {
    //Saving the image in the Cloudinary
    final url = Uri.parse('https://api.cloudinary.com/v1_1/des6gx3es/image/upload');
    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'xy1q3pre' // Replace with your Cloudinary upload preset
      ..files.add(await http.MultipartFile.fromPath('file', _imageFile!.path));

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        final responseString = String.fromCharCodes(responseData);
        final jsonResponse = jsonDecode(responseString);

        // Extract the image URL from the Cloudinary response
        final imageUrl = jsonResponse['secure_url'];

        // Navigate to the AIProcessingScreen with parameters
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AIProcessingScreen(
              imageUrl: imageUrl,
              cropName: widget.cropName,
              quantity: widget.quantity,
              cropType: widget.cropType,
              shelfLife: widget.shelfLife,
              place: widget.place,
              phoneNumber: widget.phoneNumber,
              orderId: widget.orderId, 
            ),
          ),
        );
      } else {
        // Handle upload failure
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any exceptions that might occur during the upload process
      print('Error uploading image: $error');
    }
  }
}
