import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uneed/material/colors.dart';
import 'package:uneed/material/pages.dart';

class ForWeb extends StatefulWidget {
  const ForWeb({Key? key}) : super(key: key);

  @override
  State<ForWeb> createState() => _ForWebState();
}

class _ForWebState extends State<ForWeb> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {    
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mbColor,
        centerTitle: false,
        title: SvgPicture.asset(
          'assets/images/uneed_care.svg',
          color: primaryColor,
          height: 85,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home_outlined,
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
            onPressed: () => navigationTapped(0),
          ),
          IconButton(
            icon: Icon(
              Icons.people_outline,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
            onPressed: () => navigationTapped(1),
          ),
          IconButton(
            icon: Icon(
              Icons.person_search_outlined,
              color: _page == 2 ? primaryColor : secondaryColor,
            ),
            onPressed: () => navigationTapped(2),
          ),
          IconButton(
            icon: Icon(
              Icons.perm_identity_outlined,
              color: _page == 3 ? primaryColor : secondaryColor,
            ),
            onPressed: () => navigationTapped(3),
          ),
          IconButton(
            icon: Icon(
              Icons.file_upload_outlined,
              color: _page == 4 ? primaryColor : secondaryColor,
            ),
            onPressed: () => navigationTapped(4),
          ),                   
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
