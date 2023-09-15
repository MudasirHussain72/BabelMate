import 'package:babel_mate/res/fonts/fonts.dart';
import 'package:babel_mate/view/view_barrel_file.dart';

class TextFormFieldWidget extends StatelessWidget {
  String hintText;
  IconData prefixIcon;
  TextEditingController controller;
  FocusNode focusNode;
  final FormFieldSetter onFiledSubmittedValue;
  TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.focusNode,
    required this.onFiledSubmittedValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFiledSubmittedValue,
      decoration: InputDecoration(
        fillColor: AppColors.textfieldFilledColor,
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.primaryIconColor,
        ),
        hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: AppFonts.pangramSansCompactRegular,
            color: AppColors.secondaryTextColor,
            fontWeight: FontWeight.w700,
            height: 0),
        contentPadding: EdgeInsets.all(12),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(
                color: AppColors.textFieldDefaultBorderColor, width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(
                color: AppColors.textFieldDefaultBorderColor, width: 1.5)),
      ),
    );
  }
}