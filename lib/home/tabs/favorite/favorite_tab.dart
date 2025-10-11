import 'package:evently_app/home/widget/custom_text_form_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import '../home/widget/event_item.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
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
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: widht * 0.04,
                vertical: height * 0.02,
              ),
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemBuilder: (context, index) {
                return Container();
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
