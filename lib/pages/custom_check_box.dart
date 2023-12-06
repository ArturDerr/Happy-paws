
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomCheckbox({required this.value, this.onChanged});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(isChecked);
        }
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked ? Colors.blue : Colors.transparent,
          border: Border.all(
            color: isChecked ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}