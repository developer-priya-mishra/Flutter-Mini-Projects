import 'package:flutter/material.dart';
import 'package:learn_flutter/1.%20business_card.dart';
import 'package:learn_flutter/10.%20list_title.dart';
import 'package:learn_flutter/11.%20textfield/textfield_1.dart';
import 'package:learn_flutter/11.%20textfield/textfield_2.dart';
import 'package:learn_flutter/12.%20layouts/column.dart';
import 'package:learn_flutter/12.%20layouts/container.dart';
import 'package:learn_flutter/12.%20layouts/datatable.dart';
import 'package:learn_flutter/12.%20layouts/opacity_themedata_gradient_color_transform.dart';
import 'package:learn_flutter/12.%20layouts/row.dart';
import 'package:learn_flutter/13.%20load_local_json.dart';
import 'package:learn_flutter/14.%20list%20scrolling/1.%20listview.dart';
import 'package:learn_flutter/14.%20list%20scrolling/2.%20multiple_list_tile_with_column.dart';
import 'package:learn_flutter/14.%20list%20scrolling/3.%20multiple_list_tile_with_column_and_single_child_scroll_view.dart';
import 'package:learn_flutter/14.%20list%20scrolling/4.%20grid_view_data.dart';
import 'package:learn_flutter/15.%20stateful/1.%20edit_text.dart';
import 'package:learn_flutter/15.%20stateful/2.%20name_list.dart';
import 'package:learn_flutter/15.%20stateful/3.%20planet_x.dart';
import 'package:learn_flutter/16.%20stepper.dart';
import 'package:learn_flutter/17.%20checkbox_radio_slider_switch.dart';
import 'package:learn_flutter/18.%20datetime_picker.dart';
import 'package:learn_flutter/19.%20snackbar.dart';
import 'package:learn_flutter/2.%20text.dart';
import 'package:learn_flutter/20.%20bottomsheet.dart';
import 'package:learn_flutter/21.%20chip.dart';
import 'package:learn_flutter/22.%20popup_menu_btn.dart';
import 'package:learn_flutter/23.%20navigation/contact_us.dart';
import 'package:learn_flutter/23.%20navigation/home.dart';
import 'package:learn_flutter/24.%20tip_calculator.dart';
import 'package:learn_flutter/25.%20form_widget.dart';
import 'package:learn_flutter/26.%20future_events.dart';
import 'package:learn_flutter/27.%20navigation_drawer/account.dart';
import 'package:learn_flutter/27.%20navigation_drawer/navigation_drawer.dart';
import 'package:learn_flutter/27.%20navigation_drawer/settings.dart';
import 'package:learn_flutter/28.%20tabs/tabs.dart';
import 'package:learn_flutter/29.%20ui_design/bmi.dart';
import 'package:learn_flutter/3.%20scaffold_appbar_center.dart';
import 'package:learn_flutter/30.%20alertbox/alert_dialogue.dart';
import 'package:learn_flutter/30.%20alertbox/simple_dialogue.dart';
import 'package:learn_flutter/31.%20login/login_1.dart';
import 'package:learn_flutter/31.%20login/login_2.dart';
import 'package:learn_flutter/32.%20trainee_management/trainee_management.dart';
import 'package:learn_flutter/33.%20db_project/pages/collection_page.dart';
import 'package:learn_flutter/33.%20db_project/pages/home_page.dart';
import 'package:learn_flutter/33.%20db_project/pages/search_book_page.dart';
import 'package:learn_flutter/34.%20stream_events.dart';
import 'package:learn_flutter/35.%20rest_api_1/screens/login.dart';
import 'package:learn_flutter/36.%20rest_api_2_fruits/screens/fruit_list.dart';
import 'package:learn_flutter/4.%20floating_action_btn.dart';
import 'package:learn_flutter/5.%20styling_floating_action_btn_and_appbar.dart';
import 'package:learn_flutter/6.%20text_styling.dart';
import 'package:learn_flutter/7.%20image/asset_image.dart';
import 'package:learn_flutter/7.%20image/network_image.dart';
import 'package:learn_flutter/8.%20icon.dart';
import 'package:learn_flutter/9.%20button/elevated_btn.dart';
import 'package:learn_flutter/9.%20button/icon_btn.dart';
import 'package:learn_flutter/9.%20button/text_btn.dart';
import 'homescreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // onGenerateRoute: RouteGenerator.generateRoute,
      routes: {
        HomeScreen.path: (context) => HomeScreen(),
        BusinessCard.path: (context) => BusinessCard(),
        FlutterText.path: (context) => FlutterText(),
        ScaffoldAppBarCenter.path: (context) => ScaffoldAppBarCenter(),
        FloatingActionBtn.path: (context) => FloatingActionBtn(),
        StylingFloatingActionBtnAndAppBar.path: (context) => StylingFloatingActionBtnAndAppBar(),
        TextStyling.path: (context) => TextStyling(),
        FlutterNetworkImage.path: (context) => FlutterNetworkImage(),
        FlutterAssetImage.path: (context) => FlutterAssetImage(),
        FlutterIcon.path: (context) => FlutterIcon(),
        TextBtn.path: (context) => TextBtn(),
        ElevatedBtn.path: (context) => ElevatedBtn(),
        IconBtn.path: (context) => IconBtn(),
        FlutterListTile.path: (context) => FlutterListTile(),
        FlutterTextField1.path: (context) => FlutterTextField1(),
        FlutterTextField2.path: (context) => FlutterTextField2(),
        FlutterContainer.path: (context) => FlutterContainer(),
        OpacityThemeDataGradientColorTransform.path: (context) =>
            OpacityThemeDataGradientColorTransform(),
        FlutterColumn.path: (context) => FlutterColumn(),
        FlutterRow.path: (context) => FlutterRow(),
        FlutterDataTable.path: (context) => FlutterDataTable(),
        LoadLocalJson.path: (context) => LoadLocalJson(),
        FlutterListView.path: (context) => FlutterListView(),
        MultipleListTileWithColumn.path: (context) => MultipleListTileWithColumn(),
        MultipleListTileWithColumnAndSingleChildScrollView.path: (context) =>
            MultipleListTileWithColumnAndSingleChildScrollView(),
        GridViewData.path: (context) => GridViewData(),
        EditText.path: (context) => EditText(),
        NameList.path: (context) => NameList(),
        PlanetX.path: (context) => PlanetX(),
        FlutterStepper.path: (context) => FlutterStepper(),
        CheckboxRadioSliderSwitch.path: (context) => CheckboxRadioSliderSwitch(),
        FlutterDateTimePicker.path: (context) => FlutterDateTimePicker(),
        FlutterSnackBar.path: (context) => FlutterSnackBar(),
        FlutterBottomSheet.path: (context) => FlutterBottomSheet(),
        FlutterChip.path: (context) => FlutterChip(),
        PopupMenuBtn.path: (context) => PopupMenuBtn(),
        Home.path: (context) => Home(),
        ContactUs.path: (context) => ContactUs(),
        TipCalculator.path: (context) => TipCalculator(),
        FormWidget.path: (context) => FormWidget(),
        FutureEvents.path: (context) => FutureEvents(),
        AccountScreen.path: (context) => AccountScreen(),
        SettingsScreen.path: (context) => SettingsScreen(),
        FlutterNavigationDrawer.path: (context) => FlutterNavigationDrawer(),
        FlutterTabs.path: (context) => FlutterTabs(),
        Bmi.path: (context) => Bmi(),
        FlutterSimpleDialog.path: (context) => FlutterSimpleDialog(),
        FlutterAlertDialog.path: (context) => FlutterAlertDialog(),
        LoginScreen1.path: (context) => LoginScreen1(),
        LoginScreen2.path: (context) => LoginScreen2(),
        TraineeManagement.path: (context) => TraineeManagement(),
        HomePage.path: (context) => HomePage(),
        SearchBookPage.path: (context) => SearchBookPage(),
        CollectionPage.path: (context) => CollectionPage(),
        StreamEvents.path: (context) => StreamEvents(),
        LoginScreen.path: (context) => LoginScreen(),
        FruitList.path: (context) => FruitList(),
      },
    );
  }
}
