import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_jd/common/model/category_goods_list_model.dart';
import 'package:flutter_jd/common/provide/category_goods_list_provide.dart';
import 'package:flutter_jd/common/service/service_method.dart';
import 'dart:convert';

import 'package:provide/provide.dart';
/**
 * 商品列表
 * 上啦加载
 */

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (BuildContext context,child,data){
        return Expanded(
          child: Container(
            width: ScreenUtil().setWidth(550),
            // height: ScreenUtil().setHeight(1000),
            child: ListView.builder(
              itemCount: data.goodsList.length,
              itemBuilder: (BuildContext context,int index){
                return _goodsInkWell(data.goodsList,index);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _goodsInkWell(List goodsList, int index){
    return InkWell(
      onTap: (){
        print(index);
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            )
          )
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(goodsList,index),
            Column(
              children: <Widget>[
                _goodsName(goodsList,index),
                _goodsPrice(goodsList,index),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _goodsImage(List goodsList,int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(
        goodsList[index].image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _goodsName(List goodsList,int index) {
    return Container(
        padding: EdgeInsets.all(5.0),
        width: ScreenUtil().setWidth(350),
        child: Text(goodsList[index].goodsName,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontSize: ScreenUtil().setSp(28.0))));
  }

  Widget _goodsPrice(List goodsList,int index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '价格：￥${goodsList[index].presentPrice}',
            style: TextStyle(
              color: Colors.pink,
              fontSize: ScreenUtil().setSp(30),
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(20.0),),
          Text(
            '￥${goodsList[index].oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            ),
          ),
        ],
      ),
    );
  }

  
}
