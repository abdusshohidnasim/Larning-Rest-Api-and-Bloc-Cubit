import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiPhotoPage(),
    );
  }
}

class ApiPhotoPage extends StatefulWidget {
  const ApiPhotoPage({super.key});

  @override
  State<ApiPhotoPage> createState() => _ApiPhotoPageState();
}

class _ApiPhotoPageState extends State<ApiPhotoPage> {

  // ✅ Fetch data from API with User-Agent header
  Future<List<Photo>> fetchPhotos() async {
    const String baseUrl = "https://jsonplaceholder.typicode.com/photos";

    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          "User-Agent": "Mozilla/5.0", // Important for Linux/Desktop
          "Accept": "application/json",
        },
      );

      print("Status Code: ${response.statusCode}");
      print("Response length: ${response.body.length}");

      if (response.statusCode == 200) {
        return photoFromJson(response.body);
      } else {
        print("Error: status code ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Network Error: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos API Example"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          // Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error state
          if (snapshot.hasError) {
            return Center(
                child: Text(
                  "Something went wrong!\n${snapshot.error}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ));
          }

          // No data state
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No data found",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          // Success state
          var photos = snapshot.data!;

          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: CircleAvatar(

                    child: Image.network(
                      photos[index].url,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    photos[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("ID: ${photos[index].id}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ----------------------
// JSON Parsing Functions
// ----------------------

List<Photo> photoFromJson(String str) =>
    List<Photo>.from(json.decode(str).map((x) => Photo.fromJson(x)));

String photoToJson(List<Photo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
