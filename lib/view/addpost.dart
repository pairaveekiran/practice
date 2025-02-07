import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/controller/postcontroller.dart';
import 'package:practice/model/postmodel.dart';

class Addpost extends StatefulWidget {
  const Addpost({super.key});

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  late PostController postController;
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postController = PostController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(hintText: 'title'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(hintText: 'description'),
          ),
        ),
        Center(
            child: ElevatedButton(
                onPressed: () async {
                  Autogenerated newPost = Autogenerated(
                    userId: 1,
                    id: null,
                    title: title.text,
                    body: body.text,
                  );
                  await postController.createPost(newPost);
                  Navigator.pop(context);
                },
                child: const Text('post')))
      ],
    ));
  }
}
