import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget homeScreen() {
  return ListView(
    shrinkWrap: true,
    children: [
      Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(color: Color(0xFF5855BD)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular((25.0)),
                    borderSide: BorderSide(color: Color(0xFF5855BD)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular((25.0)),
                    borderSide: BorderSide(color: Color(0xFF5855BD)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'you@example.com',
                    labelText: 'Email id',
                    labelStyle: TextStyle(color: Color(0xFF5855BD)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Color(0xFF5855BD)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(),
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Color(0xFF5855BD)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(color: Color(0xFF5855BD)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((25.0)),
                      borderSide: BorderSide(),
                    )),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
