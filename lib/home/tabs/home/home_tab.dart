import 'package:evently_app/home/tabs/home/widget/event_item.dart';
import 'package:evently_app/home/tabs/home/widget/event_tab_title.dart';
import 'package:evently_app/providers/event_list_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late EventListProvider eventListProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      eventListProvider.getAllEvent();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    eventListProvider = Provider.of<EventListProvider>(context);
    eventListProvider.getEventNameList(context);
    /*if(eventListProvider.evenList.isEmpty){
      eventListProvider.getAllEvent();
    }

     */

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome_back,
                  style: AppStyles.regular14White,
                ),
                Text('Route Academy', style: AppStyles.bold24White),
              ],
            ),
            Row(
              children: [
                Image.asset(AppAssets.iconTheme),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: widht * 0.02,
                    vertical: height * 0.01,
                  ),
                  margin: EdgeInsets.only(left: widht * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.whiteColor,
                  ),
                  child: Text('EN', style: AppStyles.bold14Primary),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.12,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widht * 0.04,
                vertical: height * 0.01,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.iconmap),
                      SizedBox(width: widht * 0.02),
                      Text('Cairo , Egypt', style: AppStyles.medium14White),
                    ],
                  ),
                  DefaultTabController(
                    length: eventListProvider.eventsNameList.length,
                    child: TabBar(
                      onTap: (index) {
                        eventListProvider.changeSelectedIndex(index);
                      },
                      isScrollable: true,
                      labelPadding: EdgeInsets.zero,
                      tabAlignment: TabAlignment.start,
                      dividerColor: AppColors.transparentColor,
                      indicatorColor: AppColors.transparentColor,
                      tabs: eventListProvider.eventsNameList
                          .map(
                            (eventName) => EventTabTitle(
                              boarderColor: Theme.of(context).focusColor,
                              selectedBgColor: Theme.of(context).focusColor,
                              selectedTextStyle: Theme.of(
                                context,
                              ).textTheme.headlineMedium!,
                              UnselectedTextStyle: AppStyles.medium16White,
                              isSelected:
                                  eventListProvider.selectedIndex ==
                                  eventListProvider.eventsNameList.indexOf(
                                    eventName,
                                  ),
                              eventName: eventName,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: eventListProvider.filterEvenList.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.add_event,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: widht * 0.04,
                      vertical: height * 0.02,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: widht * 0.04),
                        child: EventItem(
                          event: (eventListProvider.filterEvenList[index]),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height * 0.02);
                    },
                    itemCount: eventListProvider.filterEvenList.length,
                  ),
          ),

          /* itemBuilder: (context, index){
                return EventItem(event: eventListProvider.filterEvenList[index],);
              },
              */
        ],
      ),
    );
  }
}
