import 'package:flutter/cupertino.dart';

import '../Models/show.dart';
import '../Utils/api.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController _textEditingController;

  final Function onResponse;
  final Function onLoadChange;
  
  const SearchBox(this._textEditingController, this.onResponse, this.onLoadChange, {super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {

  @override
  Widget build(BuildContext context) {    
    return Column(
            children: [
              Padding(padding:const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 0), 
              child: CupertinoSearchTextField(
                  autocorrect: true,
                  autofocus: true,
                  placeholder: "Enter the TV Show name",
                  controller: widget._textEditingController,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              )),
              Padding(
                padding: const EdgeInsets.all(15), 
                child: CupertinoButton.filled(
                  onPressed: () async {
                    try {
                      widget.onLoadChange(true);
                      String query = widget._textEditingController.text.trim();

                      if(query.isEmpty) return;

                      TVShow response = await fetchTVShow(query);

                      if(response.type != 'series') {
                        // for movies or whetever
                        return;
                      }

                      widget.onResponse(response.title, response.description, response.totalSeasons, response.actors, response.startedAt, response.endedAt);
                    }
                    finally {
                      widget.onLoadChange(false);
                    }
                  },
                  child: const Text("Search", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))), 
              ))
            ],
          );
  }
}