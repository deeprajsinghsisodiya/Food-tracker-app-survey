// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// /// [AnimationController]s can be created with `vsync: this` because of
// /// [TickerProviderStateMixin].
// class _MyStatefulWidgetState extends State<MyStatefulWidget>
//     with TickerProviderStateMixin {
//   bool _visible = true;
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(milliseconds:500),
//     vsync: this,
//   )..addStatusListener((status) {
//       if (status == AnimationStatus.forward) {
//         _visible = !_visible;
//       }
//     });
//   // ..forward();
//   late final AnimationController _controller1 = AnimationController(
//     duration: const Duration(milliseconds:500),
//     vsync: this,
//   )..addStatusListener((status) {
//       if (status == AnimationStatus.forward) {
//         _visible = !_visible;
//       }
//     });
//   late final AnimationController _controller2 = AnimationController(
//     duration: const Duration(milliseconds:500 ),
//     vsync: this,
//   )..addStatusListener((status) {
//     if (status == AnimationStatus.forward) {
//       _visible = !_visible;
//     }
//   });
//
//
//   late final Animation<double> _animation = CurvedAnimation(
//     parent: _controller,
//     curve: Curves.easeIn,
//   );
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const double smallLogo = 100;
//     const double bigLogo = 200;
//
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           final Size biggest = constraints.biggest;
//           return Center(
//             child: Stack(
//               children: <Widget>[
//                 PositionedTransition(
//                   rect: RelativeRectTween(
//                     begin: RelativeRect.fromSize(
//                         const Rect.fromLTWH(50, 50, smallLogo, smallLogo),
//                         Size(200, 200)),
//                     end: RelativeRect.fromSize(
//                         Rect.fromLTWH(-1000, 0, smallLogo, smallLogo),
//                         Size(200, 200)),
//                   ).animate(CurvedAnimation(
//                     parent: _controller2,
//                     curve: Curves.easeIn,
//                   )),
//                   child: GestureDetector(
//                     onTap: () {
//                       _controller2.forward();
//                       print('start the animation');
//                     },
//                     child: Center(
//                       child:
//                       Container(
//                         height: 600,
//                         width: 340,
//                         child: Stack(
//                           children: [
//                             Positioned.fill(
//                               bottom: 0,
//                               child: Container(
//                                 height: 600,
//                                 width: 340,
//                                 decoration: ShapeDecoration(
//                                   color: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   shadows: <BoxShadow>[
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.05),
//                                       blurRadius: 8,
//                                     ),
//                                   ],
//                                 ),
//                                 child: Stack(children: [
//                                   PositionedTransition(
//                                     rect: RelativeRectTween(
//                                       begin: RelativeRect.fromSize(
//                                           const Rect.fromLTWH(28, 1000, 150, 150),
//                                           Size(200, 200)),
//                                       end: RelativeRect.fromSize(
//                                           Rect.fromLTWH(28, 420, 150, 150),
//                                           Size(200, 200)),
//                                     ).animate(CurvedAnimation(
//                                       parent: _controller,
//                                       curve: Curves.easeIn,
//                                     )),
//                                     child: const Padding(
//                                         padding: EdgeInsets.all(8),
//                                         child: TextField(
//                                           cursorColor: Colors.pink,
//                                           decoration:
//                                           InputDecoration(border: OutlineInputBorder()),
//                                         )),
//                                   ),
//                                   PositionedTransition(
//                                     rect: RelativeRectTween(
//                                       begin: RelativeRect.fromSize(
//                                           const Rect.fromLTWH(28, 1000, 150, 150),
//                                           Size(200, 200)),
//                                       end: RelativeRect.fromSize(
//                                           Rect.fromLTWH(28, 500, 150, 150),
//                                           Size(200, 200)),
//                                     ).animate(CurvedAnimation(
//                                       parent: _controller,
//                                       curve: Curves.easeInBack,
//                                     )),
//                                     child: FadeTransition(
//                                       opacity: _animation,
//                                       child: const Padding(
//                                           padding: EdgeInsets.all(8),
//                                           child: TextField(
//                                             cursorColor: Colors.pink,
//                                             decoration:
//                                             InputDecoration(border: OutlineInputBorder()),
//                                           )),
//                                     ),
//                                   ),
//                                 ]),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 PositionedTransition(
//                   rect: RelativeRectTween(
//                     begin: RelativeRect.fromSize(
//                         const Rect.fromLTWH(50, 50, smallLogo, smallLogo),
//                         Size(200, 200)),
//                     end: RelativeRect.fromSize(
//                         Rect.fromLTWH(-1000, 0, smallLogo, smallLogo),
//                         Size(200, 200)),
//                   ).animate(CurvedAnimation(
//                     parent: _controller,
//                     curve: Curves.easeIn,
//                   )),
//                   child: GestureDetector(
//                     onTap: () {
//                       _controller.forward();
//                       print('start the animation');
//                     },
//                     child: Center(
//                       child:
//                       Container(
//                         height: 600,
//                         width: 340,
//                         child: Stack(
//                           children: [
//                             Positioned.fill(
//                               bottom: 0,
//                               child: Container(
//                                 height: 600,
//                                 width: 340,
//                                 decoration: ShapeDecoration(
//                                   color: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   shadows: <BoxShadow>[
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.05),
//                                       blurRadius: 8,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 PositionedTransition(
//                   rect: RelativeRectTween(
//                     begin: RelativeRect.fromSize(
//                         const Rect.fromLTWH(50, 50, smallLogo, smallLogo),
//                         Size(200, 200)),
//                     end: RelativeRect.fromSize(
//                         Rect.fromLTWH(-1000, 0, smallLogo, smallLogo),
//                         Size(200, 200)),
//                   ).animate(CurvedAnimation(
//                     parent: _controller1,
//                     curve: Curves.easeIn,
//                   )),
//                   child: GestureDetector(
//                     onTap: () {
//                       _controller1.forward();
//                       print('start the animation');
//                     },
//                     child: Center(
//                       child: Container(
//                         height: 600,
//                         width: 340,
//                         child: Stack(
//                           children: [
//                             Positioned.fill(
//                               bottom: 0,
//                               child: Container(
//                                 height: 600,
//                                 width: 340,
//                                 decoration: ShapeDecoration(
//                                   color: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   shadows: <BoxShadow>[
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.05),
//                                       blurRadius: 8,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//

// import 'package:dating_app/widgets/background_curve_widget.dart';
// import 'package:dating_app/widgets/cards_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() {
  runApp(
    // Enabled Riverpod for the entire application
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class Question {
  const Question({
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
  });

  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
}

class questionofquiz extends Notifier<List<Question>> {
  List<Question> draggableItems = [
    const Question(
      question: 'Do you know your BMI Index',
      option1: '18.5',
      option2: '18.5 - 20',
      option3: '20 - 25',
      option4: '25-30',
    ),
    const Question(
      question: 'How many times you eat a day',
      option1: '1',
      option2: '2',
      option3: '3',
      option4: '4',
    ),
    const Question(
      question: 'What meal you consider to be your main meal',
      option1: 'Breakfast',
      option2: 'Lunch',
      option3: 'Evening Snacks',
      option4: 'Dinner',
    ),
    const Question(
      question: 'Are you Allergic to Citrus Fruit',
      option1: 'Yes',
      option2: 'Dont know',
      option3: 'May be',
      option4: 'No',
    ),
    const Question(
      question: 'Preferred Grains',
      option1: 'Multi grain',
      option2: 'Wheat',
      option3: 'Rice',
      option4: 'Millet',
    ),
  ];

  void removefromthelist() {
    draggableItems.removeLast();
  }

  @override
  List<Question> build() {
    return draggableItems;
    // TODO: implement build
    //throw UnimplementedError();
  }
}

final questionProvider = NotifierProvider<questionofquiz, List<Question>>(questionofquiz.new);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          // BackgroudCurveWidget(),
          Container(
            color: Colors.black,
          ),

          Center(
            child: Consumer(
              builder: (context, ref, child) {
                return CardsStackWidget(red: ref);
              },
            ),
          ),
        ]),
      ),
    );
  }
}

enum Swipe { left, right, none }

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({Key? key, required this.onPressed, required this.icon}) : super(key: key);
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

class CardsStackWidget extends StatefulWidget {
  const CardsStackWidget({Key? key, required this.red}) : super(key: key);
  final WidgetRef red;

  @override
  State<CardsStackWidget> createState() => _CardsStackWidgetState();
}

class _CardsStackWidgetState extends State<CardsStackWidget> with TickerProviderStateMixin {
  int i = 1;
  String name = 'Get Started';
  @override
  late final AnimationController _controller5 = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final AnimationController _controller6 = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  bool _visible = true;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _visible = !_visible;
      }
    });

  // ..forward();
  late final AnimationController _controller1 = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _visible = !_visible;
      }
    });
  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _visible = !_visible;
      }
    });

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  late final Animation<double> _animation5 = CurvedAnimation(
    parent: _controller5,
    curve: Curves.easeIn,
  );

  late List<Question> draggableItemscopy = [];
  int listcount = 0;
  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;
  List<int> answers = [];

  @override
  void initState() {
    super.initState();
    if (draggableItemscopy.isEmpty && listcount == 0) {
      draggableItemscopy = widget.red.read(questionProvider);
      listcount = draggableItemscopy.length;
    }
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        draggableItemscopy.removeLast();
        _animationController.reset();
        swipeNotifier.value = Swipe.none;
      }
    });
  }

  bool bottondissapper = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  Color myColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Center(
                child: ValueListenableBuilder(
                  valueListenable: swipeNotifier,
                  builder: (context, swipe, _) => Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: List.generate(draggableItemscopy.length, (index) {
                      if (index == draggableItemscopy.length - 1) {
                        return PositionedTransition(
                            rect: RelativeRectTween(
                              begin: RelativeRect.fromSize(const Rect.fromLTWH(0, 0, 340, 600), const Size(340, 600)),
                              end: RelativeRect.fromSize(Rect.fromLTWH(-1000, 60, 340, 600), const Size(340, 600)),
                            ).animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOutSine,
                            )),
                            child: RotationTransition(
                                turns: Tween<double>(begin: 0, end: -0.1 * 0.3).animate(
                                  CurvedAnimation(
                                    parent: _animationController,
                                    curve: const Interval(0, 0.4, curve: Curves.easeInOut),
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 600,
                                    width: 340,
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          bottom: 0,
                                          child: Container(
                                            height: 600,
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
                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      color: myColor = Colors.white,
                                                    ),
                                                    child: Text(
                                                      draggableItemscopy[index].question,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: 'Nunito',
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: 31,
                                                        color: Colors.deepPurple[900],
                                                      ),
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                        color: isChecked1 ? Colors.deepPurple[300] : myColor = Colors.white,
                                                        border: isChecked1
                                                            ? Border.all(
                                                                color: Colors.deepPurple,
                                                                width: 3,
                                                                style: BorderStyle.solid,
                                                                strokeAlign: BorderSide.strokeAlignInside)
                                                            : Border.all(
                                                                color: Colors.black,
                                                                width: 1,
                                                                style: BorderStyle.solid,
                                                                strokeAlign: BorderSide.strokeAlignInside)),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Checkbox(
                                                          value: isChecked1,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              isChecked1 = newValue!;
                                                              isChecked2 = !newValue;
                                                              isChecked3 = !newValue;
                                                              isChecked4 = !newValue;
                                                            });
                                                          },
                                                          shape: CircleBorder(),
                                                          side: BorderSide(style: BorderStyle.solid),
                                                          checkColor: Colors.white,
                                                          activeColor: Colors.deepPurple,
                                                        ),
                                                        Text(
                                                          draggableItemscopy[index].option1,
                                                          style: TextStyle(
                                                            fontFamily: 'Nunito',
                                                            fontWeight: FontWeight.w800,
                                                            fontSize: 21,
                                                            color: Colors.deepPurple[900],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                        color: isChecked2 ? Colors.deepPurple[300] : myColor = Colors.white,
                                                        border: isChecked2
                                                            ? Border.all(
                                                                color: Colors.deepPurple,
                                                                width: 3,
                                                                style: BorderStyle.solid,
                                                                strokeAlign: BorderSide.strokeAlignInside)
                                                            : Border.all(
                                                                color: Colors.black,
                                                                width: 1,
                                                                style: BorderStyle.solid,
                                                                strokeAlign: BorderSide.strokeAlignInside)),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Checkbox(
                                                          value: isChecked2,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              isChecked2 = newValue!;
                                                              isChecked1 = !newValue;
                                                              isChecked3 = !newValue;
                                                              isChecked4 = !newValue;
                                                            });
                                                          },
                                                          shape: CircleBorder(),
                                                          side: BorderSide(style: BorderStyle.solid),
                                                          checkColor: Colors.white,
                                                          activeColor: Colors.deepPurple,
                                                        ),
                                                        Text(
                                                          draggableItemscopy[index].option2,
                                                          style: TextStyle(
                                                            fontFamily: 'Nunito',
                                                            fontWeight: FontWeight.w800,
                                                            fontSize: 21,
                                                            color: Colors.deepPurple[900],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                        color: isChecked3 ? Colors.deepPurple[300] : myColor = Colors.white,
                                                        border: isChecked3
                                                            ? Border.all(
                                                                color: Colors.deepPurple,
                                                                width: 3,
                                                                style: BorderStyle.solid,
                                                                strokeAlign: BorderSide.strokeAlignInside)
                                                            : Border.all(
                                                                color: Colors.black,
                                                                width: 1,
                                                                style: BorderStyle.solid,
                                                                strokeAlign: BorderSide.strokeAlignInside)),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Checkbox(
                                                          value: isChecked3,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              isChecked3 = newValue!;
                                                              isChecked2 = !newValue;
                                                              isChecked1 = !newValue;
                                                              isChecked4 = !newValue;
                                                            });
                                                          },
                                                          shape: CircleBorder(),
                                                          side: BorderSide(style: BorderStyle.solid),
                                                          checkColor: Colors.white,
                                                          activeColor: Colors.deepPurple,
                                                        ),
                                                        Text(
                                                          draggableItemscopy[index].option3,
                                                          style: TextStyle(
                                                            fontFamily: 'Nunito',
                                                            fontWeight: FontWeight.w800,
                                                            fontSize: 21,
                                                            color: Colors.deepPurple[900],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                        color: isChecked4 ? Colors.deepPurple[300] : myColor = Colors.white,
                                                        border: isChecked4
                                                            ? Border.all(
                                                                color: Colors.deepPurple,
                                                                width: 3,
                                                                style: BorderStyle.solid,
                                                                strokeAlign: BorderSide.strokeAlignInside)
                                                            : Border.all(
                                                                color: Colors.black,
                                                                width: 1,
                                                                style: BorderStyle.solid,
                                                                strokeAlign: BorderSide.strokeAlignInside)),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Checkbox(
                                                          value: isChecked4,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              isChecked4 = newValue!;
                                                              isChecked3 = !newValue;
                                                              isChecked2 = !newValue;
                                                              isChecked1 = !newValue;
                                                            });
                                                          },
                                                          shape: CircleBorder(),
                                                          side: BorderSide(style: BorderStyle.solid),
                                                          checkColor: Colors.white,
                                                          activeColor: Colors.deepPurple,
                                                        ),
                                                        Text(
                                                          draggableItemscopy[index].option4,
                                                          style: TextStyle(
                                                            fontFamily: 'Nunito',
                                                            fontWeight: FontWeight.w800,
                                                            fontSize: 21,
                                                            color: Colors.deepPurple[900],
                                                          ),
                                                        ),
                                                      ],
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
                                )));
                      } else {
                        // print('else$index');
                        return Container(
                          height: 600,
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
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    color: myColor = Colors.white,
                                  ),
                                  child: Text(
                                    draggableItemscopy[index].question,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 31,
                                      color: Colors.deepPurple[900],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      color: isChecked1 ? Colors.yellowAccent : myColor = Colors.white,
                                      border: isChecked1
                                          ? Border.all(
                                              color: Colors.deepPurple, width: 3, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside)
                                          : Border.all(
                                              color: Colors.black, width: 1, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside)),
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: isChecked1,
                                        onChanged: (newValue) {
                                          setState(() {
                                            isChecked1 = newValue!;
                                            isChecked2 = !newValue;
                                            isChecked3 = !newValue;
                                            isChecked4 = !newValue;
                                          });
                                        },
                                        shape: CircleBorder(),
                                        side: BorderSide(style: BorderStyle.solid),
                                        checkColor: Colors.white,
                                        activeColor: Colors.deepPurple,
                                      ),
                                      Text(
                                        draggableItemscopy[index].option1,
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 21,
                                          color: Colors.deepPurple[900],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      color: isChecked2 ? Colors.yellowAccent : myColor = Colors.white,
                                      border: isChecked2
                                          ? Border.all(
                                              color: Colors.deepPurple, width: 3, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside)
                                          : Border.all(
                                              color: Colors.black, width: 1, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside)),
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: isChecked2,
                                        onChanged: (newValue) {
                                          setState(() {
                                            isChecked2 = newValue!;
                                            isChecked1 = !newValue;
                                            isChecked3 = !newValue;
                                            isChecked4 = !newValue;
                                          });
                                        },
                                        shape: CircleBorder(),
                                        side: BorderSide(style: BorderStyle.solid),
                                        checkColor: Colors.white,
                                        activeColor: Colors.deepPurple,
                                      ),
                                      Text(
                                        draggableItemscopy[index].option2,
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 21,
                                          color: Colors.deepPurple[900],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      color: isChecked3 ? Colors.yellowAccent : myColor = Colors.white,
                                      border: isChecked3
                                          ? Border.all(
                                              color: Colors.deepPurple, width: 3, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside)
                                          : Border.all(
                                              color: Colors.black, width: 1, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside)),
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: isChecked3,
                                        onChanged: (newValue) {
                                          setState(() {
                                            isChecked3 = newValue!;
                                            isChecked2 = !newValue;
                                            isChecked1 = !newValue;
                                            isChecked4 = !newValue;
                                          });
                                        },
                                        shape: CircleBorder(),
                                        side: BorderSide(style: BorderStyle.solid),
                                        checkColor: Colors.white,
                                        activeColor: Colors.deepPurple,
                                      ),
                                      Text(
                                        draggableItemscopy[index].option3,
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 21,
                                          color: Colors.deepPurple[900],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      color: isChecked4 ? Colors.yellowAccent : myColor = Colors.white,
                                      border: isChecked4
                                          ? Border.all(
                                              color: Colors.deepPurple, width: 3, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside)
                                          : Border.all(
                                              color: Colors.black, width: 1, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside)),
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: isChecked4,
                                        onChanged: (newValue) {
                                          setState(() {
                                            isChecked4 = newValue!;
                                            isChecked3 = !newValue;
                                            isChecked2 = !newValue;
                                            isChecked1 = !newValue;
                                          });
                                        },
                                        shape: CircleBorder(),
                                        side: BorderSide(style: BorderStyle.solid),
                                        checkColor: Colors.white,
                                        activeColor: Colors.deepPurple,
                                      ),
                                      Text(
                                        draggableItemscopy[index].option4,
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 21,
                                          color: Colors.deepPurple[900],
                                        ),
                                      ),
                                    ],
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
              bottondissapper
                  ? Container(
                      color: Colors.black26,
                      child: Center(
                        child: Container(
                          height: 600,
                          width: 340,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                bottom: 0,
                                child: Container(
                                  height: 600,
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
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Thank You For Your Answers',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 30,
                                              color: Colors.deepPurple[900],
                                            ),
                                          ),
                                          Text(
                                            'We have analyzed your answers and selected appropriate diet program',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: Colors.deepPurple[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Positioned(
                      bottom: 150,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ActionButtonWidget(
                              onPressed: () {
                                swipeNotifier.value = Swipe.left;
                                // int i;
                                if (isChecked1 == true) {
                                  answers.add(1);
                                } else if (isChecked2 == true) {
                                  answers.add(2);
                                } else if (isChecked3 == true) {
                                  answers.add(3);
                                } else if (isChecked4 == true) {
                                  answers.add(4);
                                }
                                isChecked1 = false;
                                isChecked2 = false;
                                isChecked3 = false;
                                isChecked4 = false;
                                print(answers);
                                // setState(() {
                                //   listcount--;
                                // });
                                if (draggableItemscopy.length == 1) {
                                  setState(() {
                                    // listcount--;

                                    print(draggableItemscopy.length);
                                    bottondissapper = !bottondissapper;
                                    print(bottondissapper);
                                  });
                                }
                                _animationController.forward();
                              },
                              icon: const Icon(
                                Icons.navigate_next,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(const Rect.fromLTWH(25.3, 113, 340, 600), Size(392, 825)),
                  end: RelativeRect.fromSize(Rect.fromLTWH(-1000, 0, 340, 600), Size(392, 825)),
                ).animate(CurvedAnimation(
                  parent: _controller6,
                  curve: Curves.easeIn,
                )),
                child: RotationTransition(
                  turns: Tween<double>(begin: 0, end: -0.1 * 0.3).animate(
                    CurvedAnimation(
                      parent: _controller6,
                      curve: const Interval(0, 0.4, curve: Curves.easeInOut),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _controller6.forward();
                      print('start the animation');
                    },
                    child: Center(
                      child: Container(
                        height: 600,
                        width: 340,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              bottom: 0,
                              child: Container(
                                height: 600,
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
                                child: Stack(children: [
                                  PositionedTransition(
                                    rect: RelativeRectTween(
                                      begin: RelativeRect.fromSize(const Rect.fromLTWH(130, 50, 0, 0), Size(340, 600)),
                                      end: RelativeRect.fromSize(Rect.fromLTWH(130, 50, 100, 50), Size(300, 600)),
                                    ).animate(CurvedAnimation(
                                      parent: _controller5,
                                      curve: Curves.easeInBack,
                                    )),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        'Log in',
                                        style: const TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                  ),
                                  PositionedTransition(
                                    rect: RelativeRectTween(
                                      begin: RelativeRect.fromSize(const Rect.fromLTWH(-1000, 100, 290, 150), Size(340, 600)),
                                      end: RelativeRect.fromSize(Rect.fromLTWH(25, 100, 290, 150), Size(340, 600)),
                                    ).animate(CurvedAnimation(
                                      parent: _controller5,
                                      curve: Curves.easeIn,
                                    )),
                                    child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: TextField(
                                          cursorColor: Colors.pink,
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(color: Colors.black45),
                                            hintText: "EMAIL ID",
                                            // border: OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight:Radius.circular(8) ,topLeft: Radius.circular(8),topRight:Radius.circular(8) ))
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.deepPurple.shade900, width: 3.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.deepPurple.shade300, width: 3.0),
                                            ),
                                          ),
                                        )),
                                  ),
                                  PositionedTransition(
                                    rect: RelativeRectTween(
                                      begin: RelativeRect.fromSize(const Rect.fromLTWH(-1000, 170, 150, 150), Size(200, 200)),
                                      end: RelativeRect.fromSize(Rect.fromLTWH(25, 170, 150, 150), Size(200, 200)),
                                    ).animate(CurvedAnimation(
                                      parent: _controller5,
                                      curve: Curves.easeInBack,
                                    )),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: TextField(
                                        obscureText: true,
                                        cursorColor: Colors.pink,
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(color: Colors.black45),
                                          hintText: "PASSWORD",
                                          // border: OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight:Radius.circular(8) ,topLeft: Radius.circular(8),topRight:Radius.circular(8) ))),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.deepPurple.shade900, width: 3.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.deepPurple.shade300, width: 3.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  PositionedTransition(
                                    rect: RelativeRectTween(
                                      begin: RelativeRect.fromSize(const Rect.fromLTWH(-1000, 240, 150, 150), Size(340, 600)),
                                      end: RelativeRect.fromSize(Rect.fromLTWH(95, 240, 150, 150), Size(340, 600)),
                                    ).animate(CurvedAnimation(
                                      parent: _controller5,
                                      curve: Curves.easeInBack,
                                    )),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          '  User SignUp   ',
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.deepPurple[900],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  PositionedTransition(
                                    rect: RelativeRectTween(
                                      begin: RelativeRect.fromSize(const Rect.fromLTWH(70, 1000, 200, 40), Size(340, 600)),
                                      end: RelativeRect.fromSize(Rect.fromLTWH(70, 350, 200, 40), Size(340, 600)),
                                    ).animate(
                                      CurvedAnimation(
                                        parent: _controller5,
                                        curve: Curves.easeInBack,
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: SignInButton(
                                            Buttons.GoogleDark,
                                            onPressed: () {
                                              // _showButtonPressDialog(context, 'Google (dark)');
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  PositionedTransition(
                                    rect: RelativeRectTween(
                                      begin: RelativeRect.fromSize(const Rect.fromLTWH(70, 1000, 200, 40), Size(340, 600)),
                                      end: RelativeRect.fromSize(Rect.fromLTWH(70, 420, 200, 40), Size(340, 600)),
                                    ).animate(
                                      CurvedAnimation(
                                        parent: _controller5,
                                        curve: Curves.easeInBack,
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: SignInButton(
                                            Buttons.Twitter,
                                            onPressed: () {
                                              // _showButtonPressDialog(context, 'Google (dark)');
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  PositionedTransition(
                                    rect: RelativeRectTween(
                                      begin: RelativeRect.fromSize(const Rect.fromLTWH(30, 300, 150, 150), Size(200, 200)),
                                      end: RelativeRect.fromSize(Rect.fromLTWH(30, -1000, 150, 150), Size(200, 200)),
                                    ).animate(CurvedAnimation(
                                      parent: _controller5,
                                      curve: Curves.easeInBack,
                                    )),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        '   YOUR BEST FOOD TRACKER!   '
                                        'Tell us your food preference and we will tell you delicious recipes ideas ',
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.deepPurple[900],
                                        ),
                                      ),
                                    ),
                                  ),
                                  PositionedTransition(
                                    rect: RelativeRectTween(
                                      begin: RelativeRect.fromSize(const Rect.fromLTWH(77, 420, 200, 60), Size(340, 600)),
                                      end: RelativeRect.fromSize(Rect.fromLTWH(120, 250, 100, 50), Size(340, 600)),
                                    ).animate(CurvedAnimation(
                                      parent: _controller5,
                                      curve: Curves.easeInBack,
                                    )),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (i == 1) {
                                            _controller5.forward();
                                            i++;
                                            setState(() {
                                              name = 'LOGIN';
                                            });
                                          } else {
                                            print('Pressed');
                                            _controller6.forward();
                                          }
                                        },
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.deepPurpleAccent)),
                                          foregroundColor: Colors.deepPurple[900],
                                          backgroundColor: Colors.deepPurple[900],
                                        ),
                                      ),
                                    ),
                                  ),
                                  PositionedTransition(
                                    rect: RelativeRectTween(
                                      begin: RelativeRect.fromSize(const Rect.fromLTWH(23, 0, 300, 300), Size(340, 600)),
                                      end: RelativeRect.fromSize(Rect.fromLTWH(23, -1000, 300, 300), Size(340, 600)),
                                    ).animate(CurvedAnimation(
                                      parent: _controller5,
                                      curve: Curves.easeInBack,
                                    )),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 300,
                                      child: Lottie.asset("assets/36895-healthy-or-junk-food.json"),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ), //Intro & Login
            ],
          )
        ],
      ),
    );
  }
}
