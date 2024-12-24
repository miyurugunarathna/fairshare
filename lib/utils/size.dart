import 'dart:ui';

final screenHeight = (PlatformDispatcher.instance.views.first.physicalSize.height / PlatformDispatcher.instance.views.first.devicePixelRatio);

final screenWidth = (PlatformDispatcher.instance.views.first.physicalSize.width / PlatformDispatcher.instance.views.first.devicePixelRatio);

final isSmallScreen = screenHeight < 650;

final responsiveScaleFactor = screenHeight / 800;
