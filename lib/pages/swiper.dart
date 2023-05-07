import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperComponent extends StatefulWidget {
  const SwiperComponent({super.key});

  @override
  State<SwiperComponent> createState() => _SwiperComponentState();
}

class _SwiperComponentState extends State<SwiperComponent> {
  List<String> images = [
    'https://pbs.twimg.com/media/FvWbxJbXgAIXv-q?format=jpg&name=small',
    'https://pbs.twimg.com/media/FvJ8YOkXgAIC8O_?format=jpg&name=small',
    'https://pbs.twimg.com/media/Fu1Z7fVWcAIzUcm?format=jpg&name=small',
    'https://pbs.twimg.com/media/Furrs-eXoAAqolD?format=jpg&name=small',
    'https://pbs.twimg.com/media/Fub7kDlXoAUMMum?format=jpg&name=small'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(color: Color(0xff000005)),
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: 350.0,
                child: Swiper(
                  viewportFraction: 0.8,
                  scale: 0.9,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  itemCount: images.length,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(),
                ),
              ),
            ),
          ),
        ));
  }
}
