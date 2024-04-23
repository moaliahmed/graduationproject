import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatefulWidget {
   TextFormFieldComponent({
    super.key,
    required this.textEditingController,
    required this.title,
    required this.icons,
    required this.onChanged
  });

  final TextEditingController textEditingController;
  final String title;
  final IconData icons;
  void Function(String)? onChanged;
  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        onChanged:widget.onChanged ,
        keyboardType: TextInputType.number,
        controller: widget.textEditingController,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          enabledBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.5)),
          border:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2)),
          fillColor: Colors.grey,
          prefixIcon: Icon(
            widget.icons,
            color: const Color(0xff0090ff),
          ),
          hintText: widget.title,
          hintStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
