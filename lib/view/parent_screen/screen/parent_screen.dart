
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model_view/parent_screen_provider.dart';
import '../../../model_view/temp.dart';
import '../widget/bottom_navigation_bar.dart';

class ParentScreens extends StatefulWidget {
  const ParentScreens({super.key});

  @override
  State<ParentScreens> createState() => _ParentScreensState();
}

class _ParentScreensState extends State<ParentScreens> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final homeScreenProvider = context.read<HomeScreenProvider>();

      // await homeScreenProvider.fetchAllRegisteredBatteryInAnotherThread();
      // debugPrint("\nThis should print immedietly after battery registration fetch\n");
      // await Future.wait([
      //
      // homeScreenProvider.fetchBatteryList(),
      // context.read<NotificationProvider>().fetchNotification(),
      // ]);
    //  await homeScreenProvider.fetchAllRegisteredBattery();
    //  await homeScreenProvider.fetchBatteryList();
    //  await context.read<NotificationProvider>().fetchNotification();
      // context.read<HomeScreenProvider>().fetchAllRegisteredBattery();
      // context.read<HomeScreenProvider>().fetchBatteryList();
      // context.read<NotificationProvider>().fetchNotification();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Consumer<ParentScreensProvider>(
                builder: (context, parentScreenProvider, child) {
              return IndexedStack(
                index: parentScreenProvider.selectedIndex,
                children: parentScreenProvider.screens,
              );
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomBar(),
            )
          ],
        ),
      ),
    );
  }
}
