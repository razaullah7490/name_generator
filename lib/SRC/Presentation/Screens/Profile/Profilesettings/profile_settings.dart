import 'package:flutter/material.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_appbar.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_sliver_appbar.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileNotificationsState();
}

class _ProfileNotificationsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Profile Settings' , ),
      body: Center(child: Text('Profile Settings'),),
    );
  }
}
