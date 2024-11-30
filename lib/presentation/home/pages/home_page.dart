import 'package:cred/presentation/home/cubit/home_cubit.dart';
import 'package:cred/presentation/home/widgets/first_view.dart';
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
      body: BlocProvider(
        create: (context) => HomeCubit()..getData(),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: FirstView()),
          ],
        ),
      ),
    );
  }
}
