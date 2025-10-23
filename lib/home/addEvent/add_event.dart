import 'package:evently_app/firebase_utils.dart';
import 'package:evently_app/home/addEvent/widget/date_or_time_widget.dart';
import 'package:evently_app/home/tabs/home/widget/event_tab_title.dart';
import 'package:evently_app/home/widget/custom_elevated_bottom.dart';
import 'package:evently_app/home/widget/custom_text_form_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/model/event.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/toast_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart'; 
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../providers/event_list_provider.dart';
import 'package:evently_app/utils/toast_utils.dart';

class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  String selectedEventImage = '';
  String selectedEventName = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController describtionController = TextEditingController();
  DateTime? selectedDate;
  String formatDate = '';
  TimeOfDay? selectedTime;
  String formatTime = '';
  late EventListProvider eventListProvider;
  late UserProvider userProvider;


  var formKey = GlobalKey<FormState>();

  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    eventListProvider = Provider.of<EventListProvider>(context);
    userProvider = Provider.of<UserProvider>(context);


    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    List<String> eventImageList = [
      AppAssets.sportImage,
      AppAssets.birthdayImage,
      AppAssets.meetingImage,
      AppAssets.gamingImage,
      AppAssets.workShopImage,
      AppAssets.eventBg,
      AppAssets.exhibitionImage,
      AppAssets.holidayImage,
      AppAssets.eatingImage,
    ];
    selectedEventImage = eventImageList[selectedindex];
    selectedEventName = eventsNameList[selectedindex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        title: Text(
          AppLocalizations.of(context)!.create_account,
          style: AppStyles.medium20primary,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(eventImageList[selectedindex]),
                ),
                SizedBox(
                  height: height * 0.07,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selectedindex = index;
                          setState(() {});
                        },
                        child: EventTabTitle(
                          boarderColor: AppColors.primaryLight,
                          selectedTextStyle: Theme
                              .of(
                            context,
                          )
                              .textTheme
                              .titleMedium!,
                          UnselectedTextStyle: AppStyles.bold16Primary,
                          selectedBgColor: AppColors.primaryLight,
                          isSelected: selectedindex == index,
                          eventName: eventsNameList[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: width * 0.02);
                    },
                    itemCount: eventsNameList.length,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                ),
                SizedBox(height: height * 0.02),
                CustomTextFormField(
                  controller: titleController,
                  prifixIcon: Image.asset(
                    AppAssets.iconEdit,
                    color: Theme
                        .of(context)
                        .indicatorColor,
                  ),
                  hintText: AppLocalizations.of(context)!.event_title,
                  hintStyle: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge,
                  borderSideColor: Theme
                      .of(context)
                      .splashColor,
                  validator: (text) {
                    if (text == null || text
                        .trim()
                        .isEmpty) {
                      return 'please enter title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                Text(
                  AppLocalizations.of(context)!.description,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                ),
                SizedBox(height: height * 0.02),
                CustomTextFormField(
                  controller: describtionController,
                  hintText: AppLocalizations.of(context)!.event_description,
                  hintStyle: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge,
                  borderSideColor: Theme
                      .of(context)
                      .splashColor,
                  maxLines: 4,
                  validator: (text) {
                    if (text == null || text
                        .trim()
                        .isEmpty) {
                      return 'please enter description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.01),
                DateOrTimeWidget(
                  iconName: AppAssets.iconDate,
                  eventDateOrTime: AppLocalizations.of(context)!.event_date,
                  OnChooseEventOrDate: chooseDate,
                  ChooseDateOrTime: selectedDate == null
                      ? AppLocalizations.of(context)!.choose_date
                      : '${selectedDate!.day}/${selectedDate!
                      .month}/${selectedDate!.year}',
                ),
                SizedBox(height: height * 0.01),
                DateOrTimeWidget(
                  iconName: AppAssets.iconTime,
                  eventDateOrTime: AppLocalizations.of(context)!.event_time,
                  OnChooseEventOrDate: chooseTime,
                  ChooseDateOrTime: selectedTime == null
                      ? AppLocalizations.of(context)!.choose_time
                      : formatTime,
                ),
                SizedBox(height: height * 0.01),
                Text(
                  AppLocalizations.of(context)!.location,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                ),
                SizedBox(height: height * 0.01),
                CustomElevatedBottom(
                  onPressed: () {},
                  backgroundColor: AppColors.transparentColor,
                  borderColor: AppColors.primaryLight,
                  hasIcon: true,
                  ChildIconWidget: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.02,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryLight,
                        ),
                        child: Image.asset(
                          AppAssets.iconLocation,
                          color: Theme
                              .of(context)
                              .dividerColor,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.choose_event_location,
                        style: AppStyles.medium16primary,
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: width * 0.02),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.primaryLight,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.01),
                SizedBox(
                  width: double.infinity,

                  child: CustomElevatedBottom(
                    onPressed: addEvent,
                    text: AppLocalizations.of(context)!.add_event,
                  ),
                ),
                SizedBox(height: height * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    selectedDate = chooseDate;
    setState(() {});
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime = chooseTime;
    if (selectedTime != null) {
      formatTime = selectedTime!.format(context);
    }
    setState(() {});
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      Event event = Event(
        title: titleController.text,
        description: describtionController.text,
        eventName: selectedEventName,
        eventDateTime: selectedDate!,
        eventImage: selectedEventImage,
        eventTime: formatTime,
      );
      FirebaseUtils.addEventToFireStore(event, userProvider.currentUser!.id)
          .then((value) {
        ToastUtils.showToastMsg(message: 'Event added successfully',
            backgroundColor: AppColors.primaryLight,
            textColor: AppColors.whiteColor
        );
        Navigator.pop(context);
      },)
          .timeout(
        Duration(seconds: 1),
        onTimeout: () {

        },
      );
    }
  }
    @override
    void dispose() {
      super.dispose();
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      eventListProvider.getAllEvent(userProvider.currentUser!.id);
    }
  }

