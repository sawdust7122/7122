import 'package:flutter/material.dart';

class FormCreator extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;

  const FormCreator(
      {Key? key, required this.textController, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (String? value) {},
      // validator: (value) {
      //   // if (value == null || value.isEmpty) {
      //   //   return 'این فیلد نمی تواند خالی باشد!';
      //   // }
      //   // return null;
      // },
      style: const TextStyle(
        color: Color(0xff707070),
        fontSize: 18,
      ),
      controller: textController,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        isCollapsed: true,
        // isDense: true,
        suffixIconConstraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 27,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            textController.clear();
          },
          child: const Icon(
            Icons.delete_rounded,
            size: 17,
          ),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 14,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
