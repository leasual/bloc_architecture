import 'package:bloc_architecture/core/result.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/model/girl_photo_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'girl_bloc.dart';
import 'girl_event.dart';

class GirlPage extends StatefulWidget {
  @override
  _GirlPageState createState() => _GirlPageState();
}

class _GirlPageState extends State<GirlPage> {

  final String tag = "CounterPage";

  ScrollController _scrollController;
  int _currentPage = 1;
  int totalPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    BlocProvider.of<GirlBloc>(context).add(GirlLoadingEvent(_currentPage));
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        logger.d(tag, "currentPage= $_currentPage totalPage= $totalPage");
        if(_currentPage++ < totalPage) {
          BlocProvider.of<GirlBloc>(context).add(
              GirlLoadingEvent(_currentPage));
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget nextView;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          _currentPage = 1;
          BlocProvider.of<GirlBloc>(context).add(GirlLoadingEvent(_currentPage));
        },
        child: BlocBuilder<GirlBloc, Result>(
            builder: (context, state) {
              state.when(loading: () {
                nextView = Center(
                  child: CircularProgressIndicator(),
                );
              }, success: (model, totalPage, currentPage) {
                var data = (model as List<GirlPhotoModel>);
                this.totalPage =  totalPage;
                nextView = StaggeredGridView.countBuilder(
                    controller: _scrollController,
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    itemCount: data.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey[200], offset: Offset(3, 3), spreadRadius: 10, blurRadius: 10)
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            child: AspectRatio(
                              aspectRatio: index.isEven ? 0.95 : 0.85,
                              child: CachedNetworkImage(
                                imageUrl: data[index].url,
                                errorWidget: (context, url, error) => Icon(Icons.error),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 8, left: 16),
                            child: Text("${data[index].title}", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    SvgPicture.asset("assets/images/heart-outline.svg"),
                                    Text("${data[index].likeCounts}", style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  children: [
                                    SvgPicture.asset("assets/images/eye-outline.svg"),
                                    Text("${data[index].views}", style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    staggeredTileBuilder: (index) => StaggeredTile.count(2, index.isEven? 3.1 : 3.3));
              }, failure: (error) {
                nextView = Container(color: Colors.red,);
              }
              );
              return nextView;
            }
        ),
      ),
    );
  }
}
