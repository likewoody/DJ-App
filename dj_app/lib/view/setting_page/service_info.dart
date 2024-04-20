import 'package:flutter/material.dart';

class ServiceInfo extends StatelessWidget {
  const ServiceInfo({super.key});

  Widget _bodyView() {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              '여러분을 환영합니다.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Text(
            "당진 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 당진 서비스의 이용과 관련하여 당진 서비스를 제공하는 당진 주식회사(이하 ‘당진')와 이를 이용하는 당진 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 당진 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.\n\n"
            "당진 서비스를 이용하시거나 당진 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다\n\n",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
      
      
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              '다양한 당진 서비스를 즐겨보세요.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Text(
            "당진은 응용프로그램(어플리케이션, 앱)을 통해 당뇨병 진단 테스트, 건강생활, 약 정보 관리 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다. 여러분은 휴대폰 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 당진 서비스를 자유롭게 이용하실 수 있으며, 개별 진단 테스트는 AI(인공지능) 모델을 사용하여 도출된 결과이므로 참고용으로 사용하시길 바립니다.\n\n"
            "당진 서비스에는 기본적으로 본 약관이 적용됩니다만 네이버가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우가 있습니다. 그리고 당진 계열사가 제공하는 특정 서비스의 경우에도 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.\n\n",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
      
      
      
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              '여러분의 개인정보를 소중히 보호합니다.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Text(
            "당진은 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집.이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 당진 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.\n\n"
            "당진은 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.\n\n",
            style: TextStyle(
              fontSize: 17,
            ),
          ),


          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              '언제든지 당진 서비스 이용계약을 해지하실 수 있습니다.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Text(
            "당진에게는 참 안타까운 일입니다만, 회원은 언제든지 당진 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 당진은 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다.\n\n"
            "당진 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 당진이 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 다만, 이 경우에도 다른 회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글 등의 게시물은 삭제되지 않으므로 반드시 해지 신청 이전에 삭제하신 후 탈퇴하시기 바랍니다.\n\n",
            style: TextStyle(
              fontSize: 17,
            ),
          ),


          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              '주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Text(
            "당진은 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다. 회원에게 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며, 다만 회원 전체에 대한 통지가 필요할 경우엔 7일 이상 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱) 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다.\n\n"
            "당진은 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 당진은 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다.\n\n",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
      
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('서비스 이용약관'),
      ),
      body: _bodyView(),
    );
  }
}