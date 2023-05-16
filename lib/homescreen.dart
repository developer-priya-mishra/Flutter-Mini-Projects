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
import 'package:learn_flutter/23.%20navigation/home.dart';
import 'package:learn_flutter/24.%20tip_calculator.dart';
import 'package:learn_flutter/25.%20form_widget.dart';
import 'package:learn_flutter/26.%20future_events.dart';
import 'package:learn_flutter/27.%20navigation_drawer/navigation_drawer.dart';
import 'package:learn_flutter/28.%20tabs/tabs.dart';
import 'package:learn_flutter/29.%20ui_design/bmi.dart';
import 'package:learn_flutter/3.%20scaffold_appbar_center.dart';
import 'package:learn_flutter/30.%20alertbox/alert_dialogue.dart';
import 'package:learn_flutter/30.%20alertbox/simple_dialogue.dart';
import 'package:learn_flutter/31.%20login/login_1.dart';
import 'package:learn_flutter/31.%20login/login_2.dart';
import 'package:learn_flutter/32.%20trainee_management/trainee_management.dart';
import 'package:learn_flutter/33.%20db_project/pages/home_page.dart';
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

class Screen {
  final String title;
  final String path;

  Screen({required this.title, required this.path});
}

class HomeScreen extends StatefulWidget {
  static const String path = "/";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();

  List<Screen> screens = [
    Screen(
      title: 'Business Card',
      path: BusinessCard.path,
    ),
    Screen(
      title: 'Text',
      path: FlutterText.path,
    ),
    Screen(
      title: 'Scaffold, AppBar, Center',
      path: ScaffoldAppBarCenter.path,
    ),
    Screen(
      title: 'Floating Action Button',
      path: FloatingActionBtn.path,
    ),
    Screen(
      title: 'Styling Floating Action Button and AppBar',
      path: StylingFloatingActionBtnAndAppBar.path,
    ),
    Screen(
      title: 'Text Styling',
      path: TextStyling.path,
    ),
    Screen(
      title: 'Network Image',
      path: FlutterNetworkImage.path,
    ),
    Screen(
      title: 'Asset Image',
      path: FlutterAssetImage.path,
    ),
    Screen(
      title: 'Icon',
      path: FlutterIcon.path,
    ),
    Screen(
      title: 'Text Button',
      path: TextBtn.path,
    ),
    Screen(
      title: 'Elevated Button',
      path: ElevatedBtn.path,
    ),
    Screen(
      title: 'Icon Button',
      path: IconBtn.path,
    ),
    Screen(
      title: 'Container',
      path: FlutterContainer.path,
    ),
    Screen(
      title: 'Opacity, ThemeData, Gradient Color, Transform',
      path: OpacityThemeDataGradientColorTransform.path,
    ),
    Screen(
      title: 'Column',
      path: FlutterColumn.path,
    ),
    Screen(
      title: 'Row',
      path: FlutterRow.path,
    ),
    Screen(
      title: 'DataTable',
      path: FlutterDataTable.path,
    ),
    Screen(
      title: 'ListTile',
      path: FlutterListTile.path,
    ),
    Screen(
      title: 'ListView',
      path: FlutterListView.path,
    ),
    Screen(
      title: 'Multiple ListTile With Column',
      path: MultipleListTileWithColumn.path,
    ),
    Screen(
      title: 'Multiple ListTile With Column And SingleChildScrollView',
      path: MultipleListTileWithColumnAndSingleChildScrollView.path,
    ),
    Screen(
      title: 'GridView Data',
      path: GridViewData.path,
    ),
    Screen(
      title: 'Load Local Json',
      path: LoadLocalJson.path,
    ),
    Screen(
      title: 'Text Field 1',
      path: FlutterTextField1.path,
    ),
    Screen(
      title: 'TextField 2',
      path: FlutterTextField2.path,
    ),
    Screen(
      title: 'Edit Text',
      path: EditText.path,
    ),
    Screen(
      title: 'Name List',
      path: NameList.path,
    ),
    Screen(
      title: 'PlanetX',
      path: PlanetX.path,
    ),
    Screen(
      title: 'Stepper',
      path: FlutterStepper.path,
    ),
    Screen(
      title: 'Checkbox Radio Slider Switch',
      path: CheckboxRadioSliderSwitch.path,
    ),
    Screen(
      title: 'DateTime Picker',
      path: FlutterDateTimePicker.path,
    ),
    Screen(
      title: 'SnackBar',
      path: FlutterSnackBar.path,
    ),
    Screen(
      title: 'BottomSheet',
      path: FlutterBottomSheet.path,
    ),
    Screen(
      title: 'Chip',
      path: FlutterChip.path,
    ),
    Screen(
      title: 'Popup Menu Button',
      path: PopupMenuBtn.path,
    ),
    Screen(
      title: 'Simple Dialog',
      path: FlutterSimpleDialog.path,
    ),
    Screen(
      title: 'Alert Dialog',
      path: FlutterAlertDialog.path,
    ),
    Screen(
      title: 'Passing data between pages',
      path: Home.path,
    ),
    Screen(
      title: 'Navigation Drawer',
      path: FlutterNavigationDrawer.path,
    ),
    Screen(
      title: 'Tabs',
      path: FlutterTabs.path,
    ),
    Screen(
      title: 'Tip Calculator',
      path: TipCalculator.path,
    ),
    Screen(
      title: 'BMI',
      path: Bmi.path,
    ),
    Screen(
      title: 'Login Screen 1',
      path: LoginScreen1.path,
    ),
    Screen(
      title: 'Login Screen 2',
      path: LoginScreen2.path,
    ),
    Screen(
      title: 'Trainee Management',
      path: TraineeManagement.path,
    ),
    Screen(
      title: 'DB Project',
      path: HomePage.path,
    ),
    Screen(
      title: 'Form Widget',
      path: FormWidget.path,
    ),
    Screen(
      title: 'Future Events',
      path: FutureEvents.path,
    ),
    Screen(
      title: 'Stream Events',
      path: StreamEvents.path,
    ),
    Screen(
      title: 'Rest Api 1',
      path: LoginScreen.path,
    ),
    Screen(
      title: "Fruit List",
      path: FruitList.path,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Flutter'),
      ),
      body: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            int reversedIndex = screens.length - 1 - index;

            return ListTile(
              title: Text("${reversedIndex + 1}. ${screens[reversedIndex].title}"),
              subtitle: Text("Tap to view"),
              onTap: () {
                Navigator.of(context).pushNamed(screens[reversedIndex].path);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: screens.length,
        ),
      ),
    );
  }
}
