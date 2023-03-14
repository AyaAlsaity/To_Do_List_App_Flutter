import 'package:flutter/material.dart';

import '../module/database.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.detailTask,
  });
  // final ToDoDataBase detailTask;
  final List detailTask;
  // final int index;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  ToDoDataBase db1 = ToDoDataBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade100,
        title: Text(
          widget.detailTask[0],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 27),
            child: Icon(Icons.person),
          ),
        ],
      ),
      // drawer: Drawer(
      //    child:DrawerMenu(),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.detailTask[0]),
            const SizedBox(
              height: 20,
            ),
            widget.detailTask[1]
                ? const Icon(
                    Icons.check_circle_outline,
                    size: 80,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.block_sharp,
                    size: 80,
                    color: Colors.red,
                  ),
          ],
        ),
      ),
    );
  }
}
