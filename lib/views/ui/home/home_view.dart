import 'package:flutter/material.dart';
import 'package:homefort_test/core/response_model/photo_model.dart';
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.initState(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Photos',
                ),
                centerTitle: true,
              ),
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: model.isBusy
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : model.hasError
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Error loading page"),
                                const SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    model.getPhotos();
                                  },
                                  child: const Text('Try Again'),
                                ),
                              ],
                            ),
                          )
                        : model.photo.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Center(
                                    child: Text('List is empty'),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      model.getPhotos();
                                    },
                                    child: const Text('Reload'),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: model.photo.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10),
                                    child: Container(
                                      height: 230,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(
                                            model.photo[index].url),
                                      )),
                                    ),
                                  );
                                },
                              ),
              ),
            ));
  }
}
