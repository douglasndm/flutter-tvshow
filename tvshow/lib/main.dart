import 'package:flutter/cupertino.dart';

import 'Widgets/search_box.dart';
import 'Widgets/show_information.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  final TextEditingController controllerSearch = TextEditingController();

  String? title;
  String? description;
  int? totalSeasons;
  List<String> actors = List.empty();
  DateTime? startedAt;
  DateTime? endedAt;

  bool isLoading = false;

  void onResponse(String responseTitle, String responseDescription, int responseTotalSeason, List<String> rActors, DateTime rStartedAt, DateTime? rEndedAt) {
    setState(() {        
      title = responseTitle;
      description = responseDescription;
      totalSeasons = responseTotalSeason;
      actors = rActors;
      startedAt = rStartedAt;
      endedAt = rEndedAt;
    });
  }

  void onLoadChange(bool state) {
    setState(() {
      isLoading = state;
    });
  }

@override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoPageScaffold(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          navigationBar: const CupertinoNavigationBar(
            middle: Text(
              "TV Show tracker", 
              style: 
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Color(0xFFFFFFFF)
                ),
              ),
            backgroundColor: Color(0xFF1bbaf5),

        ),
          child: Column(children: [
            SearchBox(controllerSearch, onResponse, onLoadChange),
            isLoading ? 
              const CupertinoActivityIndicator(color: Color(0xFF1bbaf5), radius: 10) :
              TVShowInfo(title, description, totalSeasons, actors, startedAt, endedAt)
          ]),
      ),
    );
  }
}