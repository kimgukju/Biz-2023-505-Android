import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<String> orderList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    orderList.add(
      "품목 단가 수량 금액",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("주문서"),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: orderList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            child: Text(orderList[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                FilledButton(onPressed: () {}, child: const Text("결제하기"))
              ],
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                ElevatedButton(
                    onPressed: () {
                      orderList.add("1000원김밥 1000원 1 1000");
                    },
                    child: const Text("1000원 김밥")),
                ElevatedButton(onPressed: () {}, child: const Text("2000원 김밥")),
                ElevatedButton(onPressed: () {}, child: const Text("3000원 김밥")),
                ElevatedButton(onPressed: () {}, child: const Text("참치 김밥")),
                ElevatedButton(onPressed: () {}, child: const Text("김치 김밥")),
                ElevatedButton(onPressed: () {}, child: const Text("먹자 순대")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
