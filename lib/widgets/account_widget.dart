import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  final TextEditingController _textFieldController = TextEditingController();
  bool _obscurePassword = true;
  File? _uploadedImage;

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      if (_textFieldController.text.trim() == "ciao") {
        debugPrint("Ho scritto ciao!");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _uploadedImage == null
                          ? const SizedBox()
                          : Image.file(_uploadedImage!),
                      Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: _uploadImage,
                              icon: const Icon(Icons.upload),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: _cropImage,
                              icon: const Icon(Icons.crop),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () => _uploadImage(crop: true),
                              icon: const Icon(Icons.upload_file_rounded),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextField(
                      controller: _textFieldController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword),
                        ),
                        hintText: "Inserisci qui la tua password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                  label: const Text("Salva"),
                ),
              ],
            ),
          ),
        ),
      );

  void _cropImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: _uploadedImage!.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Croppa immagine",
          showCropGrid: false,
        ),
        IOSUiSettings(),
      ],
    );
    if (croppedFile != null) {
      setState(() => _uploadedImage = File(croppedFile.path));
    } else {
      //Annulla
    }
  }

  void _uploadImage({bool crop = false}) async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      debugPrint(image.path);
      setState(() => _uploadedImage = File(image.path));
      //Upload sul server. Dal server ricevo l'url dell'immagine
      if (crop) _cropImage();
    } else {
      //Annulla
    }
  }
}
