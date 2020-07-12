import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_controller.dart';

class MovieDetailsPage extends StatefulWidget {
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState
    extends ModularState<MovieDetailsPage, HomeController> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 414, height: 896, allowFontScaling: false);

    return Scaffold(body: Observer(builder: (_) {
      return this.controller.movie != null
          ? Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                this.controller.movie.posterUrl.toString()),
                            fit: BoxFit.fitWidth),
                        borderRadius: BorderRadius.circular(0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.4),
                        ],
                      ),
                      height: ScreenUtil().setHeight(300),
                      width: ScreenUtil().setWidth(414),
                      margin: EdgeInsets.fromLTRB(
                          ScreenUtil().setWidth(0),
                          ScreenUtil().setHeight(0),
                          ScreenUtil().setHeight(0),
                          ScreenUtil().setHeight(10)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          ScreenUtil().setWidth(0),
                          ScreenUtil().setHeight(260),
                          ScreenUtil().setHeight(0),
                          ScreenUtil().setHeight(0)),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.4),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: ScreenUtil().setHeight(80),
                      width: ScreenUtil().setWidth(414),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.fromLTRB(
                                      ScreenUtil().setWidth(0),
                                      ScreenUtil().setHeight(0),
                                      ScreenUtil().setHeight(0),
                                      ScreenUtil().setHeight(0)),
                                  child: Icon(
                                    Icons.star,
                                    size: ScreenUtil().setHeight(35),
                                    color: Colors.amberAccent,
                                  )),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    ScreenUtil().setWidth(0),
                                    ScreenUtil().setHeight(0),
                                    ScreenUtil().setHeight(0),
                                    ScreenUtil().setHeight(0)),
                                child: Text(
                                    '${this.controller.movie.imdbRating.toString()}/10'),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    ScreenUtil().setWidth(0),
                                    ScreenUtil().setHeight(0),
                                    ScreenUtil().setHeight(0),
                                    ScreenUtil().setHeight(0)),
                                child: Icon(Icons.airline_seat_recline_normal),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    ScreenUtil().setWidth(0),
                                    ScreenUtil().setHeight(0),
                                    ScreenUtil().setHeight(0),
                                    ScreenUtil().setHeight(0)),
                                child: Text(
                                    this.controller.movie.director.toString()),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(27),
                            ScreenUtil().setHeight(0),
                            ScreenUtil().setHeight(27),
                            ScreenUtil().setHeight(0)),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          this.controller.movie.title.toString(),
                          style: TextStyle(
                            fontSize: ScreenUtil()
                                .setSp(24, allowFontScalingSelf: false),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                ScreenUtil().setWidth(27),
                                ScreenUtil().setHeight(10),
                                ScreenUtil().setHeight(0),
                                ScreenUtil().setHeight(0)),
                            child: Text(
                              this.controller.movie.production.toString(),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                ScreenUtil().setWidth(27),
                                ScreenUtil().setHeight(10),
                                ScreenUtil().setHeight(0),
                                ScreenUtil().setHeight(0)),
                            child: Text(
                              this.controller.movie.released.toString(),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                ScreenUtil().setWidth(27),
                                ScreenUtil().setHeight(10),
                                ScreenUtil().setHeight(0),
                                ScreenUtil().setHeight(0)),
                            child: Text(
                              this.controller.movie.runtime.toString(),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                ScreenUtil().setWidth(27),
                                ScreenUtil().setHeight(15),
                                ScreenUtil().setHeight(0),
                                ScreenUtil().setHeight(0)),
                            padding: EdgeInsets.fromLTRB(
                                ScreenUtil().setWidth(8),
                                ScreenUtil().setHeight(4),
                                ScreenUtil().setHeight(8),
                                ScreenUtil().setHeight(0)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            height: ScreenUtil().setHeight(35),
                            child: Text(
                              this
                                  .controller
                                  .movie
                                  .genre
                                  .split(', ')
                                  .elementAt(0)
                                  .toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                ScreenUtil().setWidth(8),
                                ScreenUtil().setHeight(15),
                                ScreenUtil().setHeight(0),
                                ScreenUtil().setHeight(0)),
                            padding: EdgeInsets.fromLTRB(
                                ScreenUtil().setWidth(8),
                                ScreenUtil().setHeight(4),
                                ScreenUtil().setHeight(8),
                                ScreenUtil().setHeight(0)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            height: ScreenUtil().setHeight(35),
                            child: Text(
                              this
                                  .controller
                                  .movie
                                  .genre
                                  .split(', ')
                                  .elementAt(1)
                                  .toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                ScreenUtil().setWidth(8),
                                ScreenUtil().setHeight(15),
                                ScreenUtil().setHeight(0),
                                ScreenUtil().setHeight(0)),
                            padding: EdgeInsets.fromLTRB(
                                ScreenUtil().setWidth(8),
                                ScreenUtil().setHeight(4),
                                ScreenUtil().setHeight(8),
                                ScreenUtil().setHeight(0)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            height: ScreenUtil().setHeight(35),
                            child: Text(
                              this
                                  .controller
                                  .movie
                                  .genre
                                  .split(', ')
                                  .elementAt(2)
                                  .toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(27),
                            ScreenUtil().setHeight(25),
                            ScreenUtil().setHeight(0),
                            ScreenUtil().setHeight(0)),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Synopsis',
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(22, allowFontScalingSelf: false),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(27),
                            ScreenUtil().setHeight(15),
                            ScreenUtil().setHeight(27),
                            ScreenUtil().setHeight(0)),
                        child: Text(
                          this.controller.movie.plot.toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(27),
                            ScreenUtil().setHeight(15),
                            ScreenUtil().setHeight(27),
                            ScreenUtil().setHeight(0)),
                        child: Text(
                          this.controller.movie.plot.toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(27),
                            ScreenUtil().setHeight(15),
                            ScreenUtil().setHeight(27),
                            ScreenUtil().setHeight(0)),
                        child: Text('Cast', style:TextStyle(
                            fontSize: ScreenUtil()
                                .setSp(22, allowFontScalingSelf: false),
                            fontWeight: FontWeight.w400),),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(27),
                            ScreenUtil().setHeight(15),
                            ScreenUtil().setHeight(0),
                            ScreenUtil().setHeight(0)),
                        child: Text(this.controller.movie.actors.split(', ').elementAt(0).toString()),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(27),
                            ScreenUtil().setHeight(15),
                            ScreenUtil().setHeight(0),
                            ScreenUtil().setHeight(0)),
                        child: Text(this.controller.movie.actors.split(', ').elementAt(1).toString()),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(27),
                            ScreenUtil().setHeight(15),
                            ScreenUtil().setHeight(0),
                            ScreenUtil().setHeight(0)),
                        child: Text(this.controller.movie.actors.split(', ').elementAt(2).toString()),
                      )
                    ],
                  ),
                )
              ],
            )
          : Center(child: CircularProgressIndicator());
    }));
  }
}
