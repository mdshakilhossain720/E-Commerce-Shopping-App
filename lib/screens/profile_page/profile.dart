import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: "John Doe");
    TextEditingController phoneController = TextEditingController(text: "+123456789");
    TextEditingController emailController = TextEditingController(text: "john@example.com");
    TextEditingController countryController = TextEditingController(text: "United States");
    TextEditingController phoneCodeController = TextEditingController(text: "+1");

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SizedBox(
          height: 50.h,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Update Profile"),
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: ClipPath(
              clipper: CustomShape(),
              child: Container(
                color: Colors.grey[300],
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: CachedNetworkImageProvider(
                              'https://media.istockphoto.com/id/1336647287/photo/portrait-of-handsome-indian-businessman-with-mustache-wearing-hat-against-plain-wall.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.photo_camera, color: Colors.white, size: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Gap(8.h),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              color: Colors.grey[100],
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    Gap(20.h),
                    TextField(
                      controller: countryController,
                      decoration: const InputDecoration(
                        labelText: 'Country',
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                      ),
                      readOnly: true,
                    ),
                    Gap(20.h),
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                          child: TextField(
                            controller: phoneCodeController,
                            readOnly: true,
                            decoration: const InputDecoration(labelText: '+Code'),
                          ),
                        ),
                        Gap(10.w),
                        Expanded(
                          child: TextField(
                            controller: phoneController,
                            decoration: const InputDecoration(labelText: 'Phone Number'),
                          ),
                        ),
                      ],
                    ),
                    Gap(20.h),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 25);
    path.quadraticBezierTo(width / 2, height, width, height - 25);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
