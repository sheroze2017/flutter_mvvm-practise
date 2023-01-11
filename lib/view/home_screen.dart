import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_flutter/data/response/status.dart';
import 'package:mvvm_flutter/model/store_model.dart';
import 'package:mvvm_flutter/resources/components/round_button.dart';
import 'package:mvvm_flutter/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchStoreApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('d'),
        ),
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => homeViewModel,
          child: Consumer<HomeViewModel>(
            builder: (context, value, child) {
              switch (value.storeList.status) {
                case Status.LOADING:
                  return CircularProgressIndicator();
                case Status.ERROR:
                  return Text(value.storeList.message.toString());
                case Status.COMPLETED:
                  return ListView.builder(
                      itemCount: 20,
                      // value.storeList.data!.entries.toString().length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: SizedBox(
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(value
                                          .storeList.data!.entries![index].aPI
                                          .toString()),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text('Description: ' +
                                          value.storeList.data!.entries![index]
                                              .description
                                              .toString()),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      RoundButton(
                                          title: 'Select', onPress: () {})
                                    ],
                                  ),
                                )));
                      });
              }
              return Container();
            },
          ),
        ));
  }
}
