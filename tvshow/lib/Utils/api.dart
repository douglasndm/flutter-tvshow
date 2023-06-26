
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tvshow/Models/show.dart';

Future<TVShow> fetchTVShow(String name) async {
  const String apiKey = "";

  final response = await http.get(
    Uri.parse('http://www.omdbapi.com/?apikey=$apiKey&t=$name')
  );

  if (response.statusCode == 200) {   
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return TVShow.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

