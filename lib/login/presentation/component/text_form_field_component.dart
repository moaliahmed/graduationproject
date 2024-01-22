import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatefulWidget {
  const TextFormFieldComponent(
      {super.key,
      required this.textEditingController,
      required this.title,
      required this.icons,
      this.hide = false});

  final TextEditingController textEditingController;
  final String title;
  final IconData icons;
  final bool hide;

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = !widget.hide;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: widget.textEditingController,
        decoration: InputDecoration(
          suffixIcon: widget.hide
              ? IconButton(
                  onPressed: () {
                    setState(() => _passwordVisible = !_passwordVisible);
                  },
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,color:  Colors.blue,
                  ),
                )
              : const Text(''),
          prefixIcon: Icon(
            widget.icons,
            color: const Color(0xff0090ff),
          ),
          hintText: widget.title,
          hintStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        obscureText: !_passwordVisible,
      ),
    );
  }
}
