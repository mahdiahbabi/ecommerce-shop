

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class InkWellItem extends StatefulWidget {
  final IconData iconData;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const InkWellItem({
    Key? key,
    required this.iconData,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  _InkWellItemState createState() => _InkWellItemState();
}

class _InkWellItemState extends State<InkWellItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onTap: widget.onTap,
      child: Column(
        children: [
          Icon(
            widget.iconData,
            color: widget.isSelected ? Colors.blueAccent : Colors.black,
          ),
          SizedBox(height: 5),
          Text(
            widget.label,
            style: TextStyle(
              color: widget.isSelected ? Colors.blueAccent : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
