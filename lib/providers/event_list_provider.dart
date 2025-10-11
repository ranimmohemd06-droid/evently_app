import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../firebase_utils.dart';
import '../l10n/app_localizations.dart';
import '../model/event.dart';

class EventListProvider extends ChangeNotifier {
  List<Event> evenList = [];
  List<Event> filterEvenList = [];
  List<String> eventsNameList = [];
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

  void getAllEvent() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventsCollection().get();
    evenList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterEvenList = evenList;
    filterEvenList.sort((event1, event2) {
      return event1.eventDateTime.compareTo(event2.eventDateTime);
    });
    notifyListeners();
  }

  void getFilterEvent() async {
    QuerySnapshot<Event> quarySnapshot =
        await FirebaseUtils.getEventsCollection().get();
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

  void getFilterEventsFromFireStore() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventsCollection()
            .where('event_name', isEqualTo: eventsNameList[selectedIndex])
            .get();
    filterEvenList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  void changeSelectedIndex(int newSelectedIndex) {
    selectedIndex = newSelectedIndex;
    selectedIndex == 0 ? getAllEvent() : getFilterEventsFromFireStore();
  }
}
