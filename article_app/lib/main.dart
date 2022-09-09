import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyArticleApp(),
    );
  }
}

class MyArticleApp extends StatelessWidget {
  const MyArticleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("my article app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ArticleListTile(),
              SizedBox(
                height: 10,
              ),
              SearchTopic(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Today's Article",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_960_720.png'),
                    // fit: BoxFit.cover,
                  ),
                  // border: Border.all(
                  //   width: 8,
                  // ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text("Design"),
                    ),
                  ),
                ],
              ),
              const Text(
                "How to get Started as a mobile app designer and get your first client",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchTopic extends StatelessWidget {
  const SearchTopic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 7,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search for a Topic',
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Expanded(
            flex: 2,
            child: Center(
              child: Icon(
                Icons.search,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text("Hi John"),
      subtitle: Text(
        "Good Morning!",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
      ),
      trailing: CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_960_720.png'),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
