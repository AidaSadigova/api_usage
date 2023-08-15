import 'package:flutter/material.dart';

import 'models/employees_fakestore.dart';
import 'services/fake_employee.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FakeUsers> employees = [];
  List<String> images = [
    'https://deadline.com/wp-content/uploads/2020/09/Gugu-Mbatha-Raw-e1610021013129.jpg',
    'https://img.freepik.com/premium-photo/beautiful-businesswoman-standing-with-laptop-outdoors-city-park-waiting-her-friend-go-work-cheerful-female-freelancer-office-work-outfit-young-elegant-businesswoman_129180-8785.jpg',
    'https://media.licdn.com/dms/image/D4E12AQHdxdSKMhAkpQ/article-cover_image-shrink_720_1280/0/1683794029107?e=2147483647&v=beta&t=GwcRFoB2xojUNlzx2oX8ZZvFJGHvqBRJ03gxHC2W6g8',
    'https://blog.hubspot.com/hs-fs/hubfs/employee-retention-rate.jpg?width=595&height=400&name=employee-retention-rate.jpg',
    'https://assets.website-files.com/611648b6262a801811180f6c/622a840a298a8bda4133dba2_Untitled%20design%20(7)%20(2).png',
    'https://content.gallup.com/origin/gallupinc/GallupSpaces/Production/Cms/SPEEDBUMPS/atlzuactgk6jsiacmpfh-w.jpg',
    'https://usveteransmagazine.com/wp-content/uploads/2017/10/Interview-Tips-1.jpg',
    'https://nextluxury.com/wp-content/uploads/Being-a-super-successful-businessman-is-NOT-for-every-man-Successful-businessman.jpg',
    'https://hearst-images.s3.amazonaws.com/getty/article/244/159/200488040-001_XS.jpg',
    'https://deadline.com/wp-content/uploads/2020/09/Gugu-Mbatha-Raw-e1610021013129.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Text(
            'Get contact with employees',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[50]),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.contact_emergency))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: employees.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.green[100],
                        shadowColor: Colors.blueGrey,
                        elevation: 10,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              backgroundImage: NetworkImage(images[index]),
                              radius: 25.0,
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                Text('Name: ${employees[index].name!}'),
                                Text('Email: ${employees[index].email!}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            ElevatedButton(
              onPressed: () async {
                employees = (await getFakeStoreEmployeesWithDio())!;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
              ),
              child: const Text('Get Data From Server'),
            ),
          ],
        ),
      ),
    );
  }
}
