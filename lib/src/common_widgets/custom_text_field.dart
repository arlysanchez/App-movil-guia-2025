  import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget{
 final String label;
 final bool isPassword;

 const CustomTextField({super.key,required this.label, this.isPassword = false});

  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField>{
  late bool _obscureText;

 @override
  void initState(){
    super.initState();
    _obscureText = widget.isPassword;

  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        suffixIcon: widget.isPassword?
        IconButton(
          icon:Icon(_obscureText ? Icons.visibility_off:Icons.visibility),

          onPressed:() {
            setState(() {
              _obscureText = !_obscureText;
              
            });
          }
          )
        :null
      ),

    );
  }

}

 