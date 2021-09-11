import 'package:flutter/material.dart';
import 'package:flutter_basics/demos/alert_dialog/alert_dialog_demo.dart';
import 'package:flutter_basics/demos/animated_container/animated_container_demo.dart';
import 'package:flutter_basics/demos/animated_cross_fade/animated_cross_fade_demo.dart';
import 'package:flutter_basics/demos/animated_padding/animated_padding_demo.dart';
import 'package:flutter_basics/demos/bottom_navigation_bar/bottom_navigation_bar_demo.dart';
import 'package:flutter_basics/demos/connectivity_check/connectivity_check_demo.dart';
import 'package:flutter_basics/demos/custom_clipper/custom_clipper_demo.dart';
import 'package:flutter_basics/demos/dismissible_with_list_view/dismissible_with_list_view.dart';
import 'package:flutter_basics/demos/drawer/drawer_demo.dart';
import 'package:flutter_basics/demos/floating_app_bar/floating_app_bar_demo.dart';

import 'demos/forms_and_validation/main.dart';
import 'demos/grid_view/grid_view_demo.dart';
import 'demos/indexed_stack/indexed_stack_demo.dart';
import 'demos/list_view/list_view_demo.dart';
import 'demos/list_wheel_scroll_view/list_wheel_scroll_view_demo.dart';
import 'demos/multi_value_listenable_builder/multi_value_listenable_builder_demo.dart';
import 'demos/notification_listener/notification_listener_demo.dart';
import 'demos/page_view/lib/page_view_demo.dart';
import 'demos/radio/radio_demo.dart';
import 'demos/refresh_indicator/refresh_indicator_demo.dart';
import 'demos/search_delegate/search_delegate_demo.dart';
import 'demos/shared_preference/shared_preferences_demo.dart';
import 'demos/shimmer/shimmer_demo.dart';
import 'demos/slider/slider_demo.dart';
import 'demos/smooth_star_rating/smooth_star_rating_demo.dart';
import 'demos/snackbar/snackbar_demo.dart';
import 'demos/splash_screen/splash_screen_demo.dart';
import 'demos/stream_builder_cloud_firestore/stream_builder_cloud_firestore_demo.dart';
import 'demos/tab_bar/tab_bar_demo.dart';
import 'demos/typing_text_animation/typing_text_animation_demo.dart';
import 'demos/value_listenable_builder/value_listenable_builder_demo.dart';

class DemoSelectionPage extends StatefulWidget {
  DemoSelectionPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DemoSelectionPageState createState() => _DemoSelectionPageState();
}

class _DemoSelectionPageState extends State<DemoSelectionPage> {
  static final _demoBuilderMap = {
    Demos.AlertDialog: () => AlertDialogDemo(),
    Demos.AnimatedContainer: () => AnimatedContainerDemo(),
    Demos.AnimatedCrossFade: () => AnimatedCrossFadeDemo(),
    Demos.AnimatedPadding: () => AnimatedPaddingDemo(),
    Demos.BottomNavigationBar: () => BottomNavigationBarDemo(),
    Demos.ConnectivityCheck: () => ConnectivityCheckDemo(),
    Demos.CustomClipper: () => CustomClipperDemo(),
    Demos.DismissibleListView: () => DismissibleListViewDemo(),
    Demos.Drawer: () => DrawerDemo(),
    Demos.FloatingAppBar: () => FloatingAppBarDemo(),
    Demos.FormsAndValidation: () => FormsAndValidationDemo(),
    Demos.GridView: () => GridViewDemo(),
    Demos.IndexedStack: () => IndexedStackDemo(),
    Demos.ListView: () => ListViewDemo(),
    Demos.ListWheelScrollView: () => ListWheelScrollViewDemo(),
    Demos.MultiValueListenableBuilder: () => MultiValueListenableBuilderDemo(),
    Demos.NotificationListener: () => NotificationListenerDemo(),
    Demos.PageView: () => PageViewDemo(),
    Demos.Radio: () => RadioDemo(),
    Demos.RefreshIndicator: () => RefreshIndicatorDemo(),
    Demos.SearchDelegate: () => SearchDelegateDemo(),
    Demos.SharedPreference: () => SharedPreferenceDemo(),
    Demos.Shimmer: () => ShimmerDemo(),
    Demos.Slider: () => SliderDemo(),
    Demos.SmoothStarRating: () => SmoothStarRatingDemo(),
    Demos.SnackBar: () => SnackBarDemo(),
    Demos.SplashScreen: () => SplashScreenDemo(),
    Demos.StreamBuilderCloudFirestore: () => StreamBuilderCloudFirestoreDemo(),
    Demos.TabBar: () => TabBarDemo(),
    Demos.TypingTextAnimation: () => TypingTextAnimationDemo(),
    Demos.ValueListenableBuilder: () => ValueListenableBuilderDemo(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: Demos.values.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${Demos.values.elementAt(index).toString().split('.')[1]}',
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      _demoBuilderMap[Demos.values.elementAt(index)]!.call(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

enum Demos {
  AlertDialog,
  AnimatedContainer,
  AnimatedCrossFade,
  AnimatedPadding,
  BottomNavigationBar,
  ConnectivityCheck,
  CustomClipper,
  DismissibleListView,
  Drawer,
  FloatingAppBar,
  FormsAndValidation,
  GridView,
  IndexedStack,
  ListView,
  ListWheelScrollView,
  MultiValueListenableBuilder,
  NotificationListener,
  PageView,
  Radio,
  RefreshIndicator,
  SearchDelegate,
  SharedPreference,
  Shimmer,
  Slider,
  SmoothStarRating,
  SnackBar,
  SplashScreen,
  StreamBuilderCloudFirestore,
  TabBar,
  TypingTextAnimation,
  ValueListenableBuilder,
}
