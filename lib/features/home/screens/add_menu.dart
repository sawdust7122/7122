import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMenu extends StatelessWidget {
  const AddMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 50, vertical: 120),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'اضافه کردن منو',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(CupertinoIcons.clear_circled),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  formCreator(_titleController, 'عنوان محصول'),
                  const SizedBox(height: 10),
                  formCreator(_titleController, 'قیمت'),
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.5),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 55),
                  child: Text(
                    'افزودن',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField formCreator(TextEditingController textController, String labelText) {
    return TextFormField(
      onChanged: (String? value) {},
      validator: (value) {
        // if (value == null || value.isEmpty) {
        //   return 'این فیلد نمی تواند خالی باشد!';
        // }
        // return null;
      },
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
        suffixIcon: const Icon(
          Icons.clear,
          size: 17,
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
