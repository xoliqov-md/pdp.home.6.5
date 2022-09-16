import 'package:flutter/material.dart';
import 'package:untitled3/ApiService/api_service.dart';
import 'package:untitled3/models/User.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String response = 'loading...';

  void _apiGetPosts(){
    ApiService.GET(ApiService.GET_API, ApiService.paramsEmpty()).then((value) => {
      setState((){
        response = value!;
      })
    });
  }

  void _apiPostPosts(){
    var post = Post(userId: 1,title: 'Azizbek', body: 'xoliqov');
      ApiService.POST(ApiService.GET_API, ApiService.paramsPost(post)).then((value) => {
        setState((){
          response = value!;
        })
      });
  }

  void _apiPutPosts(){
    var post = Post(userId: 1,title: 'Azizbek', body: 's');
      ApiService.POST(ApiService.GET_API, ApiService.paramsPost(post)).then((value) => {
        setState((){
          response = value!;
        })
      });
  }


  void _apiDelPosts(){
      ApiService.POST(ApiService.GET_API, ApiService.paramsEmpty()).then((value) => {
        setState((){
          response = value!;
        })
      });
  }

  @override
  void initState() {
      _apiGetPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () {
            return Future(() => {
              _apiGetPosts()
            });
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Text(
                  response,
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
