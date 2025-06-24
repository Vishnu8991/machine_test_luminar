import 'package:flutter/material.dart';

class TextContainer extends StatefulWidget {
  final IconData icon;
  final String labelText;
  final String text;
  final TextEditingController data;
  final Function(String)? onTextChanged; 
   final bool isPassword; 

  TextContainer({
    super.key,
    required this.icon,
    required this.labelText,
    required this.text,
    required this.data,
    this.onTextChanged,
    this.isPassword = false, 
  });

  @override
  State<TextContainer> createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(style: TextStyle(color: Colors.white),
              controller: widget.data,
              obscureText: widget.isPassword ? !_isPasswordVisible : false,
               onChanged: (value) {
                if (widget.onTextChanged != null) {
                  widget.onTextChanged!(value);
                }
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: widget.labelText,
                labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white60),
                prefixIcon: Icon(widget.icon, color: Colors.white),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white38,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      )
                    : null, 
              ),
            ),
          )
        ],
      ),
    );
  }
}
