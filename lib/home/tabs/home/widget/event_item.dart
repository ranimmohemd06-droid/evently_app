import 'package:evently_app/model/event.dart';
import 'package:evently_app/providers/event_list_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    var eventListProvider = Provider.of<EventListProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Container(
      height: height * 0.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryLight),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(event.eventImage),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widht * 0.04,
          vertical: height * 0.01,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: widht * 0.02,
                vertical: height * 0.005,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventDateTime.day.toString(),
                    style: AppStyles.bold20Primary,
                  ),
                  Text(
                    DateFormat('MMM').format(event.eventDateTime),
                    style: AppStyles.bold14Primary,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: widht * 0.02,
                vertical: height * 0.005,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(event.title, style: AppStyles.bold14Black),
                  ),
                  InkWell(
                    onTap: () {
                      eventListProvider.updateIsFavoriteEvent(
                          event, userProvider.currentUser!.id);
                    },
                    child: event.isFavorite == true ?
                    Image.asset(
                      AppAssets.iconFavoriteSelected,
                      color: AppColors.primaryLight,
                    )
                        :
                    Image.asset(
                      AppAssets.iconFavorite,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
