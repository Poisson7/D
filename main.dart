import 'package:flutter/material.dart';
void main() =>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',theme: ThemeData(primaryColor: Colors.green),
      home: LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget{
    @override
    _LoginPageState createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  var User = {
    'email':'mima'
  };
  TextEditingController UserNameController = new TextEditingController();
  TextEditingController PwdController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login or Register'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              TextField(
                  controller: UserNameController,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '用户名或邮箱',
                  ),
                ),
              TextField(
                    controller: PwdController,
                    decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '登陆密码',
                    ),
                    obscureText: true,
                  ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                RaisedButton(
                  child: Text('登陆',style: TextStyle(color: Colors.white),),
                  onPressed:_login,
                ),
                RaisedButton(
                    child: Text('注册',style: TextStyle(color: Colors.white),),
                    onPressed: _register,
                ),

              ],
              ),
                ],)
          ),
    );
  }
  void _login(){
      if(User[UserNameController.text]!=PwdController.text){
        showDialog(
          context:context,
          builder: (context)=> AlertDialog(title: Text('登陆失败'),)
        );
      }
      else {
        showDialog(
            context:context,
            builder: (context)=> AlertDialog(title: Text('登陆成功'),)
        );
        Navigator.push(context, MaterialPageRoute(builder: (context)=>new ObjectPage(products: List.generate(20, (i)=>Product('商品$i','价格$i')),)),);

      }
  }
  void _register(){
      if(User.containsKey(UserNameController.text)){
        showDialog(
            context:context,
            builder: (context)=> AlertDialog(title: Text('用户名重复'),)
        );
      }
      else {
        User.putIfAbsent(UserNameController.text, ()=>PwdController.text);
        showDialog(
            context:context,
            builder: (context)=> AlertDialog(title: Text('注册成功'),)
        );
      }
  }
}
class ObjectPage extends StatelessWidget{
  final List<Product> products;
  ObjectPage({Key key,@required this.products}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表')),
        body: ListView.builder(
            itemBuilder: (context,index)=>ListTile(title:Text(products[index].ProductName),),
        itemCount: products.length,
        ),
    );
  }
}
class Product{
  final String ProductName;
  final String Productprice;
  Product(this.ProductName,this.Productprice);
}
