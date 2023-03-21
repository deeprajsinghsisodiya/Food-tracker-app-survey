// import 'package:dating_app/widgets/background_curve_widget.dart';
// import 'package:dating_app/widgets/cards_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(
    // Enabled Riverpod for the entire application
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class Profile {
  const Profile({
    required this.name,
    required this.distance,
    required this.imageAsset,
  });
  final String name;
  final String distance;
  final String imageAsset;
}


class Counter extends Notifier<List<Profile>> {

  List<Profile> draggableItems = [
    const Profile(
        name: 'Rohini',
        distance: '11 miles away',
        imageAsset: 'assets/images/avatar_1.png'),
    const Profile(
        name: 'Rohini',
        distance: '12 miles away',
        imageAsset: 'assets/images/avatar_2.png'),
    const Profile(
        name: 'Rohini',
        distance: '13 miles away',
        imageAsset: 'assets/images/avatar_3.png'),
    const Profile(
        name: 'Rohini',
        distance: '14 miles away',
        imageAsset: 'assets/images/avatar_4.png'),
    const Profile(
        name: 'Rohini',
        distance: '15 miles away',
        imageAsset: 'assets/images/avatar_5.png'),
  ];


  void removefromthelist(){
    draggableItems.removeLast();
  }

  @override
  List<Profile> build() {
    return draggableItems;
    // TODO: implement build
    //throw UnimplementedError();
  }
}


final counterProvider = NotifierProvider <Counter, List<Profile>>(Counter.new);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            children: [
              // BackgroudCurveWidget(),

              Consumer(
                builder: (context, ref, child) {
                  // final value = ref.read(counterProvider);

                  // print('value from notifier $value'); // Hello world
                  // ref.read(counterProvider.notifier).removefromthelist();
                  // print('value from notifier $value'); // Hello world



                  return CardsStackWidget(red: ref);
                  // print('value from notifier $value'); // Hello world

                },
              ),

            ]
        ),
      ),
    );
  }
}

enum Swipe { left, right, none }



class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget(
      {Key? key, required this.onPressed, required this.icon})
      : super(key: key);
  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: IconButton(onPressed: onPressed, icon: icon),
      ),
    );
  }
}
int listupdate = 0;


class CardsStackWidget extends StatefulWidget {
  const CardsStackWidget({Key? key,required this.red}) : super(key: key);
  final WidgetRef red ;
  @override
  State<CardsStackWidget> createState() => _CardsStackWidgetState();
}

class _CardsStackWidgetState extends State<CardsStackWidget>
    with SingleTickerProviderStateMixin {


  // List<Profile> draggableItems = [
  //   const Profile(
  //       name: 'Rohini',
  //       distance: '11 miles away',
  //       imageAsset: 'assets/images/avatar_1.png'),
  //   const Profile(
  //       name: 'Rohini',
  //       distance: '12 miles away',
  //       imageAsset: 'assets/images/avatar_2.png'),
  //   const Profile(
  //       name: 'Rohini',
  //       distance: '12 miles away',
  //       imageAsset: 'assets/images/avatar_3.png'),
  //   const Profile(
  //       name: 'Rohini',
  //       distance: '14 miles away',
  //       imageAsset: 'assets/images/avatar_4.png'),
  //   const Profile(
  //       name: 'Rohini',
  //       distance: '15 miles away',
  //       imageAsset: 'assets/images/avatar_5.png'),
  // ];

  late List<Profile> draggableItemscopy = [];
  int listcount = 0;
  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;

  @override
  void initState() {

    super.initState();
    if(draggableItemscopy.isEmpty&&listcount==0){
      draggableItemscopy = widget.red.read(counterProvider);
      listcount = draggableItemscopy.length;
    }
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // widget.red.read(counterProvider.notifier).removefromthelist();
        draggableItemscopy.removeLast();
        // draggableItemscopy = widget.red.read(counterProvider);
        _animationController.reset();
        swipeNotifier.value = Swipe.none;
        // print('this execute for the firest time');
        // int listcount = draggableItemscopy.length;
        // print(draggableItemscopy);
        // draggableItemscopy = red.read(counterProvider);
        // swipeNotifier.value = listupdate=0;
      }
    });
  }

  @override

  Widget build(BuildContext context) {



    // print(draggableItemscopy);
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
            ValueListenableBuilder(
              valueListenable: swipeNotifier,
              builder: (context, swipe, _) =>
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: List.generate(draggableItemscopy.length, (index) {
                      // print ('list count $listcount');
                      print ('if$index');
                      if (index == draggableItemscopy.length - 1) {
                        print(' if $index');
                        return PositionedTransition(
                          rect: RelativeRectTween(
                            begin: RelativeRect.fromSize(
                                const Rect.fromLTWH(0, 0, 300, 300),
                                const Size(300, 300)),
                            end: RelativeRect.fromSize(
                                Rect.fromLTWH(-1000, 60, 300, 300),
                                const Size(300, 300)),
                          ).animate(CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.easeInOutSine,
                          )),
                          child: RotationTransition(
                            turns: Tween<double>(begin: 0, end: -0.1 * 0.3).animate(
                              CurvedAnimation(
                                parent: _animationController,
                                curve:
                                const Interval(0, 0.4, curve: Curves.easeInOut),
                              ),
                            ),
                            child: Center(
                              child: Container(
                                height: 600,
                                width: 300,
                                child: Stack(
                                  children: [

                                    Positioned.fill(
                                      bottom: 0,
                                      child: Container(
                                        height: 80,
                                        width: 340,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          shadows: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.05),
                                              blurRadius: 8,
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                draggableItemscopy[index].name,
                                                style: const TextStyle(
                                                  fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 21,
                                                ),
                                              ),
                                              Text(
                                                draggableItemscopy[index].distance,
                                                style: const TextStyle(
                                                  fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        print('else$index');
                        return Center(
                          child: Container(
                            height: 600,
                            width: 300,
                            child: Stack(
                              children: [

                                Positioned.fill(
                                  bottom: 0,
                                  child: Container(
                                    height: 80,
                                    width: 340,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      shadows: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            draggableItemscopy[index].name,
                                            style: const TextStyle(
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w800,
                                              fontSize: 21,
                                            ),
                                          ),
                                          Text(
                                            draggableItemscopy[index].distance,
                                            style: const TextStyle(
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
                  ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 46.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButtonWidget(
                    onPressed: () {
                      swipeNotifier.value = Swipe.left;
                      // setState(() {
                      //   listcount--;
                      // });

                      // widget.red.read(counterProvider.notifier).removefromthelist();
                      // print(widget.red.read(counterProvider).length);
                      _animationController.forward();


                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ActionButtonWidget(
                    onPressed: () {
                      // swipeNotifier.value = Swipe.right;
                      _animationController.forward();
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}
