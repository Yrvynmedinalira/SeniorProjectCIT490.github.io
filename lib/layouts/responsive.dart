import 'package:flutter/material.dart';
import 'package:uneed/get/provider.dart';
import 'package:uneed/material/pages.dart';
import 'package:provider/provider.dart';

class TheResponse extends StatefulWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const TheResponse({
    Key? key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  }) : super(key: key);

  @override
  State<TheResponse> createState() => _TheResponseState();
}

class _TheResponseState extends State<TheResponse> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {        
        return widget.webScreenLayout;
      }
      return widget.mobileScreenLayout;
    });
  }
}
