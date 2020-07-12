import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    this.controller.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 414, height: 896, allowFontScaling: false);

    print(
        '${this.controller.listMovies.movies.elementAt(0).title.toString()}------------------------------------------------');
    // print('${this.controller.list.}------------------------------------------------');

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(45),
                  ScreenUtil().setHeight(60),
                  ScreenUtil().setHeight(27),
                  ScreenUtil().setHeight(160)),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Procure seu filme favorito',
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            Observer(builder: (_) {
              return Expanded(
                child: (this.controller.listMovies != null)
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: this.controller.listMovies.movies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(this
                                            .controller
                                            .listMovies
                                            .movies
                                            .elementAt(index)
                                            .posterUrl
                                            .toString()),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 10.0,
                                          spreadRadius: 0.4),
                                    ],
                                  ),
                                  height: ScreenUtil().setHeight(400),
                                  width: ScreenUtil().setWidth(250),
                                  margin: EdgeInsets.fromLTRB(
                                      ScreenUtil().setWidth(43),
                                      ScreenUtil().setHeight(0),
                                      ScreenUtil().setHeight(0),
                                      ScreenUtil().setHeight(10)),
                                ),
                                onTap: (){
                                  this.controller.getMovie(idFilme: this.controller.listMovies.movies.elementAt(index).imdbID.toString());
                                  Navigator.pushNamed(context, '/moviedetails');
                                },
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    ScreenUtil().setWidth(20),
                                    ScreenUtil().setHeight(10),
                                    ScreenUtil().setHeight(0),
                                    ScreenUtil().setHeight(10)),
                                width: ScreenUtil().setWidth(250),
                                child: Text(
                                  this
                                      .controller
                                      .listMovies
                                      .movies
                                      .elementAt(index)
                                      .title
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(24, allowFontScalingSelf: false),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                alignment: Alignment.center,
                              ),
                            ],
                          );
                        })
                    : Center(child: CircularProgressIndicator()),
              );
            }),
          ],
        ));
  }
}
