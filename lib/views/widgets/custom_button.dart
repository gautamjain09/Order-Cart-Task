import 'package:flutter/material.dart';
import 'package:intern_task/common.dart';
import 'package:intern_task/views/checkout_page.dart';

class CustomButton extends StatefulWidget {
  String name;
  List<int>? itemsCount;
  CustomButton({
    super.key,
    required this.name,
    required this.itemsCount,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  List<int> _itemsCount = itemsCount;
  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            width: MediaQuery.of(context).size.width * 0.80,
            height: 50,
            color: primaryColor,
            child: const Center(
              child: Text(
                "Pick your items",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.50,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(itemsName[index]),
                      trailing: (_itemsCount[index] != 0)
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.remove, size: 16),
                                  color: primaryColor,
                                  onPressed: () {
                                    setState(() {
                                      if (_itemsCount[index] > 0) {
                                        _itemsCount[index]--;
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  _itemsCount[index].toString(),
                                  style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add, size: 16),
                                  color: primaryColor,
                                  onPressed: () {
                                    setState(() {
                                      _itemsCount[index]++;
                                    });
                                  },
                                ),
                              ],
                            )
                          : Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  color: whiteColor,
                                  width: 1,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _itemsCount[index]++;
                                    });
                                  },
                                  child: const Text(
                                    "ADD",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    const Divider(thickness: 1),
                  ],
                );
              },
            ),
          ),
          actions: [
            Center(
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: whiteColor,
                    width: 2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      widget.itemsCount = _itemsCount;
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const CheckOutPage();
                        },
                      ));
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showAlertDialog(context);
      },
      child: Container(
        height: 100,
        width: size.width,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: whiteColor,
            width: 5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.name,
            style: const TextStyle(
              color: whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
