import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.sizeOf(context);
    return SizedBox(
      width: mediaQuery.width,
      height: 60,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        semanticChildCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              width: 90,
              height: 60,
              margin: const EdgeInsets.only(top: 10, right: 10),
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/756808/pexels-photo-756808.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      fit: BoxFit.cover)),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                const Center(
                    child: Text(
                  'Cat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )),
              ]),
            ),
          );
        },
      ),
    );
  }
}
