import 'package:cred/presentation/home/cubit/home_cubit.dart';
import 'package:cred/presentation/home/cubit/home_state.dart';
import 'package:cred/presentation/home/cubit/view_cubit.dart';
import 'package:cred/presentation/home/cubit/view_state.dart';
import 'package:cred/presentation/home/widgets/first_view.dart';
import 'package:cred/presentation/home/widgets/second_view.dart';
import 'package:cred/presentation/home/widgets/third_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                ),
                child: const Icon(
                  Icons.question_mark_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            final items = state.dataEntity.items;
            final openState = items[0].openState!;
            final body = openState.body!;
            final card = body.card!;
            final bodyItems = items[1].openState!.body!.items;
            return BlocBuilder<ViewCubit, ViewState>(
              builder: (context, state) {
                if (state is FirstViewState) {
                  return Column(
                    children: [
                      Expanded(
                          child: BlocProvider(
                        create: (context) => HomeCubit()..getData(),
                        child: const FirstView(),
                      )),
                    ],
                  );
                }
                if (state is SecondViewState) {
                  return Column(
                    children: [
                      Container(
                        height: 120,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  card.header.toString(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "₹ 1,50,000",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  context.read<ViewCubit>().showFirstView();
                                },
                                icon: const Icon(CupertinoIcons.down_arrow))
                          ],
                        ),
                      ),
                      Expanded(
                          child: BlocProvider(
                        create: (context) => HomeCubit()..getData(),
                        child: const SecondView(),
                      )),
                    ],
                  );
                }
                if (state is ThirdViewState) {
                  return Column(
                    children: [
                      Container(
                        height: 120,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  card.header.toString(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "₹ 1,50,000",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  context.read<ViewCubit>().showFirstView();
                                },
                                icon: const Icon(CupertinoIcons.down_arrow))
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          color: Color.fromARGB(255, 2, 23, 40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "EMI",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  bodyItems[0].emi.toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "duration",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  bodyItems[0].duration.toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  context.read<ViewCubit>().showSecondView();
                                },
                                icon: const Icon(CupertinoIcons.down_arrow))
                          ],
                        ),
                      ),
                      Expanded(
                          child: BlocProvider(
                        create: (context) => HomeCubit()..getData(),
                        child: const ThirdView(),
                      )),
                    ],
                  );
                }

                return Container();
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
