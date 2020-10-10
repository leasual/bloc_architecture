import 'package:bloc_architecture/core/result.dart';
import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/model/gank_model.dart';
import 'package:bloc_architecture/ui/component/comment_widget.dart';
import 'package:bloc_architecture/ui/component/filter_menu.dart';
import 'package:bloc_architecture/ui/home/home_page_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_page_event.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String tag = "HomePage";

  ScrollController _scrollController;
  int _currentPage = 1;
  int totalPage = 1;
  List<GankModel> dataList = List();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    BlocProvider.of<HomePageBloc>(context).add(HomePageLoadingGoodsEvent(_currentPage));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        logger.d(tag, "currentPage= $_currentPage totalPage= $totalPage");

        if(_currentPage < totalPage) {
          BlocProvider.of<HomePageBloc>(context)
              .add(HomePageLoadingGoodsEvent(_currentPage));
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
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        actions: [
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            highlightElevation: 0,
            onPressed: () {

            },
            child: SvgPicture.asset("assets/images/funnel-outline.svg"),
          )
        ],
        title: Text(
          "干货",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Stack(
        alignment: Alignment.center,
        children: [
          RefreshIndicator(
            onRefresh: () async {
              _currentPage = 1;
              BlocProvider.of<HomePageBloc>(context)
                  .add(HomePageLoadingGoodsEvent(_currentPage));
            },
            child: BlocConsumer<HomePageBloc, Result>(
                listener: (context, state) {
                  state.when(
                      loading: () {},
                      success: (model, totalPage, currentPage) {},
                      failure: (error) {
                        logger.d(tag, "network error= $error");
                        Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,
                          content: Text("网络请求失败，请稍后重试"),));
                      });
                },
                builder: (context, state) {
                  state.when(loading: () {
                    nextView = Center(
                      child: CircularProgressIndicator(),
                    );
                  }, success: (model, totalPage, currentPage) {
                    var data = (model as List<GankModel>);
                    this.totalPage = totalPage;
                    if(_currentPage < totalPage) {
                      _currentPage++;
                    }
                    dataList.clear();
                    dataList.addAll(data);
                    nextView = buildListView(data);
                  }, failure: (error) {
                    if(dataList.length > 0) {
                      nextView = buildListView(dataList);
                    } else {
                      nextView = Container(
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<HomePageBloc>(context)
                                  .add(HomePageLoadingGoodsEvent(_currentPage));
                            },
                            child: Text(
                              '请求失败，请重试',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    }
                  });
                  return nextView;
                }),
          ),
          FilterMenu(),
        ],
      ),
    );
  }

  Widget buildListView(List<GankModel> data) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      padding: EdgeInsets.only(top: 20),
      itemBuilder: (context, index) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.8,
              child: CachedNetworkImage(
                imageUrl: data[index].images[0],
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(data[index].title, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(data[index].desc, style: TextStyle(color: Colors.black, fontSize: 14),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("作者：${data[index].author}", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(data[index].createdAt.split(" ")[0], style: TextStyle(color: Colors.grey[600], fontSize: 14),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: CommentWidget(model: data[index],),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Divider(height: 1, color: Colors.grey[300],),
            ),
          ],
        ),
      ),
    );
  }
}
