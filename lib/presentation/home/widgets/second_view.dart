import 'package:cred/presentation/home/cubit/home_cubit.dart';
import 'package:cred/presentation/home/cubit/home_state.dart';
import 'package:cred/presentation/home/cubit/view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is HomeLoaded) {
        final items = state.dataEntity.items;

        final openState = items[1].openState!;
        final body = openState.body!;
        final bodyItems = body.items;

        return Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  color: Color.fromARGB(255, 2, 23, 40),
                ),
                child: Column(
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
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: bodyItems.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 15,
                        ),
                        itemBuilder: (context, index) {
                          final colors = [
                            Colors.brown.withOpacity(0.5),
                            const Color.fromARGB(255, 108, 95, 117),
                            const Color.fromARGB(255, 79, 120, 153)
                          ];
                          final containerColor = colors[index % colors.length];
                          return Container(
                            width: 150,
                            height: 150,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: containerColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.circle_outlined,
                                    size: 40,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  bodyItems[index].title.toString(),
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    bodyItems[index].subtitle.toString(),
                                    style:
                                        TextStyle(color: Colors.grey.shade500),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 2, 23, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.grey,
                            )),
                      ),
                      child: Text(
                        body.footer.toString(),
                        style: const TextStyle(color: Colors.white),
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
                    context.read<ViewCubit>().showThirdView();
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
                    items[1].ctaText.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
          ],
        );
      }
      if (state is HomeError) {
        return Center(
          child: Text(state.error),
        );
      }
      return Container();
    });
  }
}
