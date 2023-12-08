import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileNotificationsState();
}

class _ProfileNotificationsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('profile Settings')),);
  }
}