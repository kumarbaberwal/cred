import 'package:cred/presentation/home/cubit/home_cubit.dart';
import 'package:cred/presentation/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  int changeValue = 150000;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Container(
            padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Theme.of(context).cardColor,
            ),
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.dataEntity.items[0].openState!.body!.title.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.dataEntity.items[0].openState!.body!.subtitle
                        .toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                            size: 250,
                            startAngle: 275,
                            angleRange: 360,
                            customWidths: CustomSliderWidths(
                              progressBarWidth: 20,
                              trackWidth: 20,
                              handlerSize: 22,
                            ),
                            customColors: CustomSliderColors(
                              dotColor: Colors.black.withOpacity(0.8),
                              trackColor: Colors.orange.withOpacity(0.4),
                              progressBarColor: Colors.orange,
                            ),
                          ),
                          min: state.dataEntity.items[0].openState!.body!.card!
                              .minRange!
                              .toDouble(),
                          max: state.dataEntity.items[0].openState!.body!.card!
                              .maxRange!
                              .toDouble(),
                          initialValue: 150000,
                          onChange: (value) {
                            setState(() {
                              changeValue = value.toInt();
                            });
                          },
                          innerWidget: (percentage) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.dataEntity.items[0].openState!.body!
                                        .card!.header
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Text(
                                    "\$ $changeValue",
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    state.dataEntity.items[0].openState!.body!
                                        .card!.description
                                        .toString(),
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 120, 177, 122),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Text(state.dataEntity.items[0].openState!.body!.footer
                          .toString())
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  state.dataEntity.items[0].ctaText!.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ]),
          );
        }
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeError) {
          return Center(
            child: Text(state.error),
          );
        }
        return Container();
      },
    );
  }
}
