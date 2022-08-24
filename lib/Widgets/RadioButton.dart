import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 66,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [

            _customRadioButton,
            SizedBox(width: 12),
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff022179) : null,
        borderRadius: BorderRadius.circular(80),

        border: Border.all(
          color: isSelected ? Color(0xff064acb) : Colors.white,
          width: 2,
        ),
      ),
      child: Text(
        leading,
        style: GoogleFonts.poppins(

          fontWeight: FontWeight.w300,
          fontSize: 14,
          color:Colors.white,

        )
      ),
    );
  }
}