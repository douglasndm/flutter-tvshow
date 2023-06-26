import 'package:flutter/cupertino.dart';

class TVShowInfo extends StatefulWidget {
  final String? title;
  final String? description;

  final int? totalSeasons;
  final List<String>? actors;
  final DateTime? startedAt;
  final DateTime? endedAt;

  const TVShowInfo(
    this.title, 
    this.description, 
    this.totalSeasons, 
    this.actors,
    this.startedAt,
    this.endedAt,
    { super.key }
  );
  
  @override
  State<StatefulWidget> createState() {
    return TVShowInfoState();
  }
}

class TVShowInfoState extends State<TVShowInfo> {
  String status = "";

  @override
  Widget build(BuildContext context) {

    if(widget.endedAt != null) {
      DateTime end = widget.endedAt!;
  
      if(end.isAfter(DateTime.now())) {
        setState(() {
          status = "Status: Is ending";
        });
      }
      else if(widget.endedAt!.isBefore(DateTime.now())) {
        setState(() {
          status = "Status: Ended";
        });
      }
    } else {
      setState(() {
          status = "Status: On production";
        });
    }

    return widget.title != null ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10), 
        child: Column(
          children: [
            Text(widget.title ?? 'TV Show name', 
              style: const TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 28
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(widget.description ?? ''),
            ),
            Text("Seasons: ${widget.totalSeasons}"),
            Text(status),
          ],
        )
    ) : Container();
  }
}