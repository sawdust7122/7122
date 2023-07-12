import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/form_creator.dart';

class ChooseProductIngredients extends StatefulWidget {

  const ChooseProductIngredients({Key? key})
      : super(key: key);

  @override
  State<ChooseProductIngredients> createState() =>
      _ChooseProductIngredientsState();
}

class _ChooseProductIngredientsState extends State<ChooseProductIngredients> {
  List<TextEditingController> controllers = [];
  List<Widget> forms = [];

  void createControllers(int number) {
    for (int i = 0; i < number; i++) {
      TextEditingController controller = TextEditingController();
      controllers.add(controller);
    }
  }

  createForms(List<TextEditingController> controllers) {
    for (int i = 0; i < controllers.length; i++) {
      forms.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: FormCreator(
              textController: controllers[i], labelText: 'شماره ${i}'),
        ),
      );
    }
  }

  @override
  void initState() {
    // ابتدا به تعداد محصولاتی که در انبار هست کنترلر می سازیم که اینجا فرضا سه به عنوان تعداد دادیم
    createControllers(3);
    // سپس به تعداد لازم فرم باید بسازیم
    createForms(controllers);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                children: forms,
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
