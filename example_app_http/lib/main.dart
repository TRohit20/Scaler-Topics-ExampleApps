import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const NetworkingApp());
}

class NetworkingApp extends StatefulWidget {
  const NetworkingApp({super.key});

  @override
  _NetworkingAppState createState() => _NetworkingAppState();
}

class _NetworkingAppState extends State<NetworkingApp> {
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=a48e5344f6acaf1fc303d524164353b1'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body)['results'] as List<dynamic>;
      setState(() {
        _movies = jsonData.map((data) => Movie.fromJson(data)).toList();
      });
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  Future<void> uploadFile() async {
    final file = File(
        'path_to_file'); // Replace 'path_to_file' with the actual file path
    final url = Uri.parse('https://api.example.com/upload');
    final request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('file', file.path));
    final response = await request.send();
    if (response.statusCode == 200) {
      print('File uploaded successfully');
    } else {
      print('File upload failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Networking App'),
        ),
        body: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (context, index) {
            final movie = _movies[index];
            return ListTile(
              leading: Image.network(
                  'https://image.tmdb.org/t/p/w200${movie.posterPath}'),
              title: Text(movie.title),
              subtitle: Text(movie.overview),
            );
          },
        ),
      ),
    );
  }
}

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }
}
