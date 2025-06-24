import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
final Color color1;
final Color color2;
final Color color3;
final Color buttonTextColor;
final double horizontal;
final double vertical;
final String buttonText;
final VoidCallback? onPressed; 
  const ButtonWidget({super.key, required this.color, required this.color1, required this.color2, required this.color3, required this.buttonTextColor, required this.horizontal, required this.vertical, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Align(

                  child: GestureDetector(
                    onTap: onPressed,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontal,
                        vertical: vertical
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            color,color1,color2,color3
                          ])
                      ),
                      child: Text(buttonText, 
                      style: GoogleFonts.poppins(
                        color: buttonTextColor, 
                        fontSize: 20
                      ),),
                    ),
                  ),
                );
  }
}