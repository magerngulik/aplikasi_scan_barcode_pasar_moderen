import 'package:flutter/material.dart';

class BasicTabBar extends StatefulWidget {
  // final String value;
  // final Function(String value) onChanged;
  // final String? label;
  final List item;

  const BasicTabBar({
    Key? key,
    // required this.value,
    // required this.onChanged,
    // this.label,
    required this.item,
  }) : super(key: key);

  @override
  State<BasicTabBar> createState() => _BasicTabBarState();
}

class _BasicTabBarState extends State<BasicTabBar> {
  @override
  Widget build(BuildContext context) {
    var selected = "";
    return SizedBox(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: widget.item.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var items = widget.item[index];
          return InkWell(
            onTap: () {
              selected = items['name'];
              print(selected);
              print(items['name']);
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "${items['name']}",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: (selected != items['name'].toString())
                            ? Colors.red
                            : Colors.blue),
                  ),
                  (selected != items['name'].toString())
                      ? const CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.red,
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
