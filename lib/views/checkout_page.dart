import 'package:flutter/material.dart';
import 'package:intern_task/common.dart';
import 'package:intern_task/controller/firebase_controller.dart';
import 'package:intern_task/views/widgets/custom_button.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  FirebaseController firebaseController = FirebaseController();
  int total_item = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      total_item += itemsCount[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anything else to add?"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            var countAtIndex = itemsCount[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  CustomButton(
                    name: itemsName[index],
                    itemsCount: itemsCount,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 15,
                    child: Container(
                      height: 20,
                      width: 56,
                      padding: const EdgeInsets.only(left: 3, right: 3),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Text(
                        "$countAtIndex Items",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.shopping_bag_outlined,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "$total_item ITEMS ADDED",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ElevatedButton(
                onPressed: () {},
                child: GestureDetector(
                  onTap: () {
                    // Save Data To Firebase And navigate to HomePage
                    firebaseController.sendOrderToFirestore(
                      context: context,
                      itemsName: itemsName,
                      itemsCount: itemsCount,
                    );
                  },
                  child: const Text("Next"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
