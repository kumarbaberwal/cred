import 'package:cred/presentation/home/cubit/home_cubit.dart';
import 'package:cred/presentation/home/cubit/home_state.dart';
import 'package:cred/presentation/home/cubit/view_cubit.dart';
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
          final items = state.dataEntity.items;

          final openState = items[0].openState!;
          final body = openState.body!;
          final card = body.card!;
          return Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            body.title.toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            body.subtitle.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 65),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Stack(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
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
                                      hideShadow: true,
                                      dotColor: Colors.black.withOpacity(0.8),
                                      trackColor:
                                          Colors.orange.withOpacity(0.4),
                                      progressBarColor: Colors.orange,
                                    ),
                                  ),
                                  min: card.minRange!.toDouble(),
                                  max: card.maxRange!.toDouble(),
                                  initialValue: 150000,
                                  onChange: (value) {
                                    setState(() {
                                      changeValue = value.toInt();
                                    });
                                  },
                                  innerWidget: (percentage) {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            card.header.toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                          Text(
                                            "₹ $changeValue".splitMapJoin(
                                              RegExp(
                                                  r'\B(?=(\d{3})+(?!\d))'), // Inserts commas for Indian numbering
                                              onMatch: (match) => ',',
                                              onNonMatch: (nonMatch) =>
                                                  nonMatch,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            card.description.toString(),
                                            style: const TextStyle(
                                              color: Color(0xFF78B17A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 20,
                                  ),
                                  child: Text(
                                    body.footer.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: BlocProvider(
                  create: (context) => ViewCubit(),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ViewCubit>().showSecondView();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                    ),
                    child: Text(
                      items[0].ctaText.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ],
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
