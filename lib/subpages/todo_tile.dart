import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
      child: SizedBox(
        height: 70,
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
                borderRadius: BorderRadius.circular(12),
              )
            ],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 35),
            decoration: BoxDecoration(
              color: const Color.fromARGB(156, 180, 136, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
               

                Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white, fontSize: 17,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),

                 Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                ),
               
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
