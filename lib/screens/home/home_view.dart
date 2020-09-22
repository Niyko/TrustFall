import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:trustfall/screens/home/home_controller.dart';
import 'package:trustfall/screens/home/widgets/home_bottom_nav_button.dart';
import 'package:trustfall/screens/home/widgets/home_card.dart';
import 'package:trustfall/screens/home/widgets/home_text_graph.dart';
import 'package:trustfall/theme.dart';

class HomeView {
  RefreshController refreshController = RefreshController(initialRefresh: false);

  Scaffold get(HomeState homeState, Key scaffoldKey){

    return new Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            SmartRefresher(
              enablePullDown: true,
              controller: refreshController,
              header: MaterialClassicHeader(
                backgroundColor: ThemeColors().grey,
                color: Colors.white,
              ),
              onRefresh: (){
                homeState.onSwipeToRefresh();
              },
              physics: BouncingScrollPhysics(),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: new BoxConstraints(
                    minHeight: MediaQuery.of(homeState.context).size.height,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: <Widget>[
                            if(homeState.userDetails!=null) Expanded(
                              child: Text(
                                homeState.userDetails.username,
                                style: TextStyle(
                                  color: ThemeColors().black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            if(homeState.userDetails==null) Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                                child: SizedBox(
                                  height: 20.0,
                                  child: Shimmer.fromColors(
                                    baseColor: Color(0xfff1f1f1),
                                    highlightColor: Colors.white,
                                    child: Container(
                                      height: 20,
                                      color: Color(0xfff1f1f1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox.fromSize(
                              size: Size(50, 50), // button width and height
                              child: ClipOval(
                                child: Material(
                                  color: Color(0xfff1f1f1), // button color
                                  child: InkWell(
                                    splashColor: Colors.black12, // splash color
                                    onTap: () => homeState.logout(), // button pressed
                                    child: Icon(
                                      OMIcons.noEncryption,
                                      color: ThemeColors().grey,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: <Widget>[
                            HomeTextGraph(
                              text: "falls detected",
                              value: (homeState.userDetails==null)?"":homeState.userDetails.falls_detected.toString(),
                            ),
                            HomeTextGraph(
                              text: "falls answered",
                              value: (homeState.userDetails==null)?"":homeState.userDetails.falls_answered.toString(),
                            ),
                            HomeTextGraph(
                              text: "falls accuracy",
                              value: "90%",
                            ),
                          ],
                        ),
                        //-------------------------------
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: HomeCard(
                                title: "Config",
                                description: "Calibrate the fall detection AI",
                                color: ThemeColors().light_yellow,
                                textColor: ThemeColors().black,
                                image: ExactAssetImage("assets/images/home_bolt.png"),
                                onClick: (){
                                  homeState.featureNotAvailable();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: HomeCard(
                                title: "Contacts",
                                description: "Change the emergency contacts",
                                color: ThemeColors().grey,
                                textColor: Colors.white,
                                splashColor: Colors.white.withOpacity(0.3),
                                image: ExactAssetImage("assets/images/home_phone.png"),
                                onClick: (){
                                  homeState.featureNotAvailable();
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: HomeCard(
                                title: "Config",
                                description: "Calibrate the fall detection AI",
                                color: ThemeColors().dark_yellow,
                                textColor: ThemeColors().black,
                                image: ExactAssetImage("assets/images/home_share.png"),
                                imageWidth: 60.0,
                                onClick: (){
                                  homeState.featureNotAvailable();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          height: 90,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(12.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff09090B).withOpacity(0.07),
                                                  blurRadius: 10.0,
                                                  spreadRadius: 4.0,
                                                ),
                                              ]
                                          ),
                                          child: SizedBox(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(12.0),
                                              child: Material(
                                                color: Colors.white,
                                                child: InkWell(
                                                  splashColor: Colors.grey.withOpacity(0.2), // splash color
                                                  onTap: (){
                                                    homeState.featureNotAvailable();
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Image(
                                                        image: ExactAssetImage("assets/images/home_settings.png"),
                                                        width: 40,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              width: MediaQuery.of(homeState.context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff09090B).withOpacity(0.07),
                        blurRadius: 10.0,
                        spreadRadius: 4.0,
                      ),
                    ]
                ),
                child: Row(
                  children: <Widget>[
                    HomeBottomNavButton(
                      title: "Home",
                      image: ExactAssetImage("assets/images/home_bottom_nav_home.png"),
                      onClick: (){
                        homeState.featureNotAvailable();
                      },
                    ),
                    HomeBottomNavButton(
                      title: "Inbox",
                      image: ExactAssetImage("assets/images/home_bottom_nav_inbox.png"),
                      onClick: (){
                        homeState.featureNotAvailable();
                      },
                    ),
                    HomeBottomNavButton(
                      title: "Find",
                      image: ExactAssetImage("assets/images/home_bottom_nav_find.png"),
                      onClick: (){
                        homeState.featureNotAvailable();
                      },
                    ),
                    HomeBottomNavButton(
                      title: "More",
                      image: ExactAssetImage("assets/images/home_bottom_nav_more.png"),
                      onClick: (){
                        homeState.featureNotAvailable();
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}