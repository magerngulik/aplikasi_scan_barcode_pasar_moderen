import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget noServiceFount = Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Layanan ini belum tersedia silahkan kembali",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 300.0,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://i.ibb.co/gPQJ2mb/no-data.png",
                  ),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Kembali"),
              ),
            ),
          ],
        ),
      ),
    );

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        controller.view = this;

        var item = [
          {
            "image":
                "https://i.ibb.co/Tqfbr0G/Pink-Gradient-Illustration-Sign-In-Work-Effeciently-Desktop-Prototype-3.png",
            "title": "Data Anggota",
            "background": "",
            "color1": Colors.orange,
            "color2": Colors.pink,
            "ontap": const DashboardView()
          },
          {
            "image":
                "https://i.ibb.co/h8q1tbs/Pink-Gradient-Illustration-Sign-In-Work-Effeciently-Desktop-Prototype-2.png",
            "title": "Kegiatan Bantuan",
            "background": "",
            "color1": Colors.yellow,
            "color2": Colors.green,
            "ontap": noServiceFount
          },
          {
            "image":
                "https://i.ibb.co/jJ44PMJ/Pink-Gradient-Illustration-Sign-In-Work-Effeciently-Desktop-Prototype-1.png",
            "title": "Scan Data",
            "background": "",
            "color1": Colors.purple,
            "color2": Colors.blue,
            "ontap": const ScannerView()
          },
          {
            "image":
                "https://i.ibb.co/b2JQDXc/Pink-Gradient-Illustration-Sign-In-Work-Effeciently-Desktop-Prototype.png",
            "title": "Laporan",
            "background": "",
            "color1": Colors.pink,
            "color2": Colors.purple,
            "ontap": noServiceFount
          },
        ];

        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            "Selamat Datang",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/X5PQ9L4/image.png",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Aswandi",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: item.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var items = item[index];
                      return InkWell(
                        onTap: () {
                          Get.to(items['ontap']);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              color: Colors.red[100],
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  items['color1'] as Color,
                                  items['color2'] as Color,
                                ],
                              )),
                          child: Stack(
                            children: [
                              Container(
                                height: 150.0,
                                width: 140.0,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(
                                      32.0,
                                    ),
                                    topLeft: Radius.circular(12.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${items['title']}",
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 35,
                                child: Container(
                                  height: 100.0,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "${items['image']}",
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
