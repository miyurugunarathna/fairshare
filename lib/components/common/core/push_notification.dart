import 'package:flutter/material.dart';
import 'package:fairshare/constants/keys.dart';
import 'package:fairshare/utils/utils.dart';

class PushNotificationSnackBar {
  Future<void> show({
    required String title,
    required String description,
    double verticalMargin = 64,
    double horizontalMargin = 32,
    int durationInSecond = 15,
    IconData icon = Icons.close,
  }) async {
    BuildContext context = GlobalKeys.navigatorKey.currentState!.context;

    final double snackBarTopPosition = screenHeight * 0.78;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        duration: Duration(seconds: durationInSecond),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: snackBarTopPosition,
          left: 10,
          right: 10,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: Colors.white,
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  child: Icon(
                    icon,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
