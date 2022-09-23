import 'package:flutter/material.dart';

Widget myTextField(
    {String? hintText,
    TextInputType? keyBoardType,
    TextEditingController? controller,
    TextInputAction? textInputAction,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    dynamic validator,
      dynamic onSave,
      required bool secureText,
      Widget? suffixIcon,
    }) {
  return TextFormField(
    keyboardType: keyBoardType,
    controller: controller,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
        hintText: hintText, hintStyle: hintStyle, errorStyle: errorStyle),
    textInputAction: textInputAction,
    validator: validator,
    onSaved: onSave,
    obscureText: secureText,
  );
}
/*TextFormField(
onSaved: (val) {
myEmail = val!;
},
validator: (val) {
if (val!.isEmpty) {
return ' E-mail must be mot null';
}

return null;
},
decoration: InputDecoration(
errorStyle: TextStyle(
color: Colors.red.shade700,
fontWeight: FontWeight.bold,
fontSize: 17),
hintText: 'E-mail',
hintStyle: TextStyle(
color: Color.fromRGBO(117, 133, 156, 1),
fontSize: 16),
),
keyboardType: TextInputType.emailAddress,
textInputAction: TextInputAction.next,
),

 */

/*onSaved: (val) {
myEmail = val!;
},
validator: (val) {
if (val!.isEmpty) {
return ' E-mail must be mot null';
}

return null;
},

 */


/*
TextFormField(
onSaved: (val) {
myPassword = val!;
},
validator: (val) {
if (val!.isEmpty) {
return ' Password must be mot null';
}
return null;
},
obscureText: isPasswordHidden,
decoration: InputDecoration(
errorStyle: TextStyle(
color: Colors.red.shade700,
fontWeight: FontWeight.bold,
fontSize: 17),
hintText: 'Password',
hintStyle: TextStyle(
color: Color.fromRGBO(117, 133, 156, 1),
fontSize: 16),
suffixIcon: IconButton(
onPressed: () {
isPasswordHidden = !isPasswordHidden;
setState(() {});
},
icon: Icon(
isPasswordHidden
? Icons.visibility
    : Icons.visibility_off,
),
),
),
),*/
