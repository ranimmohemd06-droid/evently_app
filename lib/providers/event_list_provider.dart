import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../firebase_utils.dart';
import '../l10n/app_localizations.dart';
import '../model/event.dart';
import '../utils/app_colors.dart';
import '../utils/toast_utils.dart';

class EventListProvider extends ChangeNotifier {
  List<Event> evenList = [];
  List<Event> filterEvenList = [];
  List<String> eventsNameList = [];
  List<Event> favoriteList = [];

  int selectedIndex = 0;

  List<String> getEventNameList(BuildContext context) {
    return eventsNameList = [
      AppLocalizations.of(context)!.all,
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
  }

  void getAllEvent(String uId) async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventsCollection(uId).get();
    evenList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterEvenList = evenList;
    filterEvenList.sort((event1, event2) {
      return event1.eventDateTime.compareTo(event2.eventDateTime);
    });
    notifyListeners();
  }

  void getFilterEvent(String uId) async {
    QuerySnapshot<Event> quarySnapshot =
        await FirebaseUtils.getEventsCollection(uId).get();
    evenList = quarySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterEvenList = evenList.where((event) {
      return event.eventName == eventsNameList[selectedIndex];
    }).toList();
    filterEvenList.sort((event1, event2) {
      return event1.eventDateTime.compareTo(event2.eventDateTime);
    });
    notifyListeners();
  }

  Future<void> getAllEventFromFireStore(String uId) async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventsCollection(
          uId,
        ).orderBy('event_date_time').get();
    evenList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterEvenList = evenList;
    notifyListeners();
  }

  void getFilterEventsFromFireStore(String uId) async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventsCollection(uId)
            .orderBy('event_date_time')
            .where('event_name', isEqualTo: eventsNameList[selectedIndex])
            .get();
    filterEvenList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  void updateIsFavoriteEvent(Event event, String uId) {
    FirebaseUtils.getEventsCollection(uId)
        .doc(event.id)
        .update({'is_favorite': !event.isFavorite})
        .then((value) {
          ToastUtils.showToastMsg(
            message: 'Event updated successfully',
            backgroundColor: AppColors.primaryLight,
            textColor: AppColors.whiteColor,
          );
        })
        .timeout(
          Duration(milliseconds: 500),
          onTimeout: () {
            ToastUtils.showToastMsg(
              message: 'Event updated successfully',
              backgroundColor: AppColors.primaryLight,
              textColor: AppColors.whiteColor,
            );
          },
        );
    selectedIndex == 0 ? getAllEvent(uId) : getFilterEvent(uId);
    getAllFavoriteEvents(uId);
    notifyListeners();
  }

  void getAllFavoriteEvents(String uId) async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventsCollection(uId).get();
    querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    favoriteList = evenList.where((event) {
      return event.isFavorite == true;
    }).toList();
    favoriteList.sort((event1, event2) {
      return event1.eventDateTime.compareTo(event2.eventDateTime);
    });
    notifyListeners();
  }

  void changeSelectedIndex(int newSelectedIndex, String uId) {
    selectedIndex = newSelectedIndex;
    selectedIndex == 0 ? getAllEvent(uId) : getFilterEventsFromFireStore(uId);
  }
}
