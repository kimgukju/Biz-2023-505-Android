// 위치기반 함수
String sayHello(String? name, int? age, String? nation) =>
    "안녕 $name 야, 당신의 나이는 $age 이고, 고향은 $nation 이야!!";

/// sayHelloNameParams("대한민국")
String sayHelloNameParams(String contry,
        {String? name, int? age, String? nation}) =>
    "안녕 $name 야, 당신의 나이는 $age 이고, 고향은 $nation 이야!!";

// 이름기반 함수
/// <Span name="홍길동", age=33, nation="대한민국" />
/// const Span =({name, age, nation}) => { return <></> }