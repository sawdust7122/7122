import 'package:flutter/material.dart';

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
                icon: const Icon(Icons.delete),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10),
                  child: IconButton(
                    onPressed: () {},
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
                  return Container(
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
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
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
