import 'package:coffee_management/features/home/screens/add_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(name: 'اسپرسو', price: '15000'),
      Product(name: 'کاپوچینو', price: '25000'),
      Product(name: 'شکلات', price: '12000'),
      Product(name: 'موکا', price: '2000'),
      Product(name: 'لته', price: '5000'),
      Product(name: 'کیک', price: '11000'),
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: AppBar(
              title: const Text('خانه'),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.clear),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return const AddMenu(); // استفاده از نمونه ایجاد شده از قبل
                        },
                      );
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: products.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    // Specify a key if the Slidable is dismissible.
                    key: const ValueKey(0),

                    // The start action pane is the one at the left or the top side.
                    startActionPane: ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: const ScrollMotion(),

                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (_) {},
                          backgroundColor: const Color(0xFFfffbfe),
                          foregroundColor: Colors.black54,
                          icon: const Icon(
                            Icons.delete_rounded,
                            color: Colors.black54,
                          ),
                          label: 'حذف',
                        ),
                        SlidableAction(
                          onPressed: (_) {},
                          backgroundColor: const Color(0xFFfffbfe),
                          foregroundColor: Colors.black54,
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.black54,
                          ),
                          label: 'ویرایش',
                        ),
                      ],
                    ),

                    // The child of the Slidable is what the user sees when the
                    // component is not dragged.
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      // color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(products[index].name),
                          Text(products[index].price),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.add_circle,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(products[index].count.toString()),
                              const SizedBox(width: 5),
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   shape: const CircleBorder(),
        //   child: const Icon(Icons.add),
        // ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: 75,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'پرداخت',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Row(
                children: [
                  Text(
                    'جمع کل:',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '50,000',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  int? id;
  String name;
  String price;
  int count = 0;

  Product({
    this.id,
    required this.name,
    required this.price,
  });
}
