
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model_view/parent_screen_provider.dart';
import '../widget/bottom_navigation_bar.dart';

class ParentScreens extends StatelessWidget {
  const ParentScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Consumer<ParentScreensProvider>(
            builder: (context, parentScreenProvider, child) {
              return IndexedStack(
                index: parentScreenProvider.selectedIndex,
                children: parentScreenProvider.screens,
              );
            },
          ),
          Align(alignment: Alignment.bottomCenter, child: CustomBottomBar()),
        ],
      ),
    );
  }
}
