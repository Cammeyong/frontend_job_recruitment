import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomImageFormField extends StatelessWidget {
  CustomImageFormField({
    Key? key,
    required this.validator,
    required this.onChanged,
  }) : super(key: key);
  final String? Function(File?) validator;
  final Function(File) onChanged;
  File? _pickedFile;

  @override
  Widget build(BuildContext context) {
    return FormField<File>(
        validator: validator,
        builder: (formFieldState) {
          return Column(
            children: [
              GestureDetector(
                onTap: () async {
                  FilePickerResult? file = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowMultiple: true,
                    allowedExtensions: ['jpg', 'png'],
                  );
                  if (file != null) {
                    _pickedFile = File(file.files.first.path!);
                    onChanged.call(_pickedFile!);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.greenAccent),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.upload_file),
                      Text('Upload Logo')
                    ],
                  )),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  FilePickerResult? file = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowMultiple: true,
                    allowedExtensions: ['jpg', 'png', 'pdf', 'doc'],
                  );
                  if (file != null) {
                    _pickedFile = File(file.files.first.path!);
                    onChanged.call(_pickedFile!);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.blueAccent),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.upload_file),
                      Text('Upload Certificate')
                    ],
                  )),
                ),
              ),
              if (formFieldState.hasError)
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 10),
                  child: Text(
                    formFieldState.errorText!,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 13,
                        color: Colors.red[700],
                        height: 0.5),
                  ),
                )
            ],
          );
        });
  }
}
