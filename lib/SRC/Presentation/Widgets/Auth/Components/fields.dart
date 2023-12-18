import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/validator.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailField extends StatefulWidget {
  final TextEditingController controller;
  String text;
  IconData icon;
  EmailField(
      {super.key,
      required this.controller,
      required this.text,
      required this.icon});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.06.sh,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: AppColors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: widget.text,
          labelStyle: Styles.smallPlusJakartaSans(
            context,
            color: AppColors.grey,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          if (!Validate().isEmailValid(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  bool isObscured;

  PasswordField(
      {super.key, required this.controller, required this.isObscured});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.06.sh,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock_outlined,
            color: AppColors.grey,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                widget.isObscured = !widget.isObscured;
              });
            },
            icon: Icon(
              widget.isObscured ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Password',
          labelStyle: Styles.smallPlusJakartaSans(
            context,
            color: AppColors.grey,
          ),
        ),
        obscureText: widget.isObscured,
        validator: (value) {
          return Validate.password(value ?? ''); // Handle null case
        },
      ),
    );
  }
}
