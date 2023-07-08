import 'package:coffee_management/core/widgets/form_creator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseProductIngredients extends StatelessWidget {
  const ChooseProductIngredients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
                    'مواد انبار',
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
            // body
            Container(
              padding: const EdgeInsets.all(12),
              height: 150,
              child: Column(
                children: [
                  FormCreator(
                      textController: controller, labelText: 'قهوه'),
                  const SizedBox(height: 10),
                  FormCreator(
                      textController: controller, labelText: 'کیک'),
                  const SizedBox(height: 10),
                  FormCreator(
                      textController: controller, labelText: 'آرد'),
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
}
