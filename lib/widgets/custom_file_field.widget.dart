import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/utils/colors.dart';

class CustomFileField extends StatefulWidget {
  final String title;
  final List<String> extensions;
  final void Function(String? val) onSaved;
  final String? Function(String? val) validator;

  const CustomFileField({
    Key? key,
    required this.title,
    required this.extensions,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);

  @override
  State<CustomFileField> createState() => _CustomFileFieldState();
}

class _CustomFileFieldState extends State<CustomFileField> {
  String? _file;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: FormField<String>(
        onSaved: (val) {
          widget.onSaved(_file);
        },
        validator: (val) {
          widget.validator(_file);
        },
        builder: (fieldState) => GestureDetector(
          onTap: () async {
            FilePickerResult? file = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowMultiple: true,
              allowedExtensions: widget.extensions,
            );
            if (file != null) {
              setState(() {
                _file = file.files.first.path!;
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: paletteIndigo, width: 2),
              color: _file != null ? paletteMagenta : Colors.transparent,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(color: _file == null ? paletteMagenta : paletteIndigo),
                ),
                Icon(
                  _file != null ? Icons.file_copy_rounded : Icons.file_upload_outlined,
                  color: _file == null ? paletteMagenta : paletteIndigo,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
