import 'package:flutter/material.dart';

class Errmsg extends StatelessWidget {
  const Errmsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        color: Color(0xff304463),
      ),
      child: Center(
        child: Container(
          padding:const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow:const [
               BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 5.0,
              ),
            ],
          ),
          child:const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 40.0,
              ),
              SizedBox(height: 10.0),
              Text(
                'Oops there was an error , try later',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
