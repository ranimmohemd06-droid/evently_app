import 'package:evently_app/home/widget/custom_text_form_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/event_list_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_provider.dart';
import '../home/widget/event_item.dart';

class FavoriteTab extends StatefulWidget {
  FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  TextEditingController searchController = TextEditingController();
  late EventListProvider eventListProvider;
  late UserProvider userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      eventListProvider.getAllFavoriteEvents(userProvider.currentUser!.id);
    });
  }

  @@override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    eventListProvider = Provider.of<EventListProvider>(context);
    userProvider = Provider.of<UserProvider>(context);

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widht * 0.04,
              vertical: height * 0.02,
            ),
            child: CustomTextFormField(
              borderSideColor: AppColors.primaryLight,
              hintText: AppLocalizations.of(context)?.search_for_event,
              hintStyle: AppStyles.bold14Primary,
              controller: searchController,
              prifixIcon: Image.asset(AppAssets.iconSearch),
            ),
          ),
          Expanded(
            child: eventListProvider.favoriteList.isEmpty ?
            Center(
              child: Text(AppLocalizations.of(context)!.no_favorite_event_found,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge,)
              ,) :
            ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: widht * 0.04,
                vertical: height * 0.02,
              ),
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemBuilder: (context, index) {
                return EventItem(event: eventListProvider.favoriteList[index]);
              },
              itemCount: eventListProvider.favoriteList.length,
            ),
          ),
        ],
      ),
    );
  }
}
