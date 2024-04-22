import 'package:flutter/material.dart';


class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  Widget _bodyView() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
        
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '1. 개인정보의 처리 목적',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              "당진에서 수집한 이용자 개인정보는 회원관리, 서비스 제공·개선, 신규 서비스 개발 등 당진 서비스 제공을 위해 필요한 목적으로만 이용합니다."
              "개인정보 수집 시 반드시 이용자에게 처리 목적을 고지하여 동의를 받고 있습니다.\n\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
        
        
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '2. 개인정보 파기',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              "수집 및 이용목적이 달성된 경우 수집한 개인정보는 지체없이 파기하며, 절차 및 방법은 아래와 같습니다.\n\n",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "수집 및 이용 목적의 달성 또는 회원 탈퇴 등 파기 사유가 발생한 경우 개인정보의 형태를 고려하여 파기방법을 정합니다. 전자적 파일 형태인 경우 복구 및 재생되지 않도록 안전하게 삭제하고, 그 밖에 기록물, 인쇄물, 서면 등의 경우 분쇄하거나 소각하여 파기합니다.\n"
              "내부 방침에 따라 일정 기간 보관 후 파기하는 정보는 아래와 같습니다.\n"
              "1)아래 정보는 탈퇴일부터 최대 1년간 보관 후 파기합니다.\n"
              "안내메일 발송 및 CS문의 대응을 위해 당진계정 탈퇴안내 이메일 주소를 암호화하여 보관\n"
              "서비스 부정이용 기록\n"
              "2)권리침해 신고 및 유해정보 신고 이력은 5년간 보관 후 파기합니다.\n"
              "3)카카오톡: 이용자 보호조치 완화 적용 시 수집한 개인정보는 1년간 보관 후 파기합니다.\n"
              "암호화된 이용자 확인값(CI)\n"
              "또한, 당진은 운영정책에 따라 1년간 서비스를 이용하지 않은 이용자의 개인정보를 별도로 분리 보관 또는 삭제하고 있으며, 분리 보관된 개인정보는 4년간 보관 후 지체없이 파기합니다.\n"
              "이 외에 법령에 따라 일정기간 보관해야 하는 개인정보는 아래 표와 같습니다.\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
              ),
              child: const Text("관계 법령에 따른 개인정보 자세히 보기     >")
            ),
        
        
        
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '\n\n3. 개인위치정보의 처리',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              "당진은 위치정보의 보호 및 이용 등에 관한 법률(이하 ‘위치정보법’)에 따라 아래와 같이 개인위치정보를 처리합니다.\n\n",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "개인위치정보의 수집 및 이용목적이 달성되면 지체없이 파기합니다.\n"
              "수집 및 이용 목적의 달성 또는 회원 탈퇴 등 개인위치정보 처리목적이 달성된 경우, 개인위치정보를 복구 및 재생되지 않도록 안전하게 삭제합니다.\n"
              "다만, 다른 법령에 따라 보관해야 하는 등 정당한 사유가 있는 경우에는 그에 따릅니다.\n"
              "또한, 위치정보법 제16조2항에 따라 이용자의 위치정보의 이용ㆍ제공사실 확인자료를 위치정보시스템에 6개월간 보관합니다.\n"
              "이용자의 사전 동의 없이 개인위치정보를 제3자에게 제공하지 않습니다.\n"
              "카카오는 이용자의 동의 없이 개인위치정보를 제3자에게 제공하지 않으며, 제3자에게 제공하는 경우에는 제공받는 자 및 제공목적을 사전에 이용자에게 고지하고 동의를 받습니다.\n"
              "이용자의 동의를 거쳐 개인위치정보를 제3자에게 제공하는 경우, 이용자에게 매회 이용자에게 제공받는 자, 제공일시 및 제공목적을 즉시 통지합니다.\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
              ),
              child: const Text("위치정보 제공 현황 자세히 보기     >")
            ),
            const Text(
              "\n8세 이하의 아동 등의 보호를 위해 필요한 경우 보호의무자의 권리는 아래와 같습니다.\n\n",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "위치정보법 제26조제1항에 따라 '8세 이하의 아동', '피성년후견인', '장애인복지법에 따른 장애인에 해당하는 이용자'의 생명 또는 신체 보호를 위하여 보호의무자가 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다."
              "위 권리를 행사하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 하며, 이 경우 보호의무자는 위치정보 이용약관에 따른 이용자의 권리를 모두 가집니다.\n\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
        
        
        
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '4. 이용자 및 법정대리인의 권리와 행사 방법\n',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              "이용자는 자신의 개인정보 처리에 관하여 아래와 같은 권리를 가질 수 있습니다.\n",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "ㆍ개인정보 열람(조회)을 요구할 권리\n"
              "ㆍ개인정보 정정을 요구할 권리\n"
              "ㆍ개인정보 처리정지를 요구할 권리\n"
              "ㆍ개인정보 삭제요구 및 동의철회/탈퇴를 요구할 권리\n",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54
              ),
            ),
            const Text(
              "이용자는 서비스 내 다음과 같은 기능을 통해 언제든지 개인정보 열람(조회) 등의 권리를 직접 행사하거나 또는 고객센터(문의하기)를 통해 요청할 수 있습니다.\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            const Text(
              "- 당진계정 정보 열람(조회) 및 수정\n"
              "- 당진계정과 연결된 서비스 관리\n"
              "- 당진 서비스 이용을 위한 개인정보 수집, 이용, 제3자 제공 현황 확인\n",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54
              ),
            ),
            const Text(
              "당진은 이용자의 요청을 받은 경우 이를 지체없이 처리하며, 이용자가 개인정보의 오류에 대한 정정을 요청한 경우 정정을 완료하기 전까지 해당 개인정보를 이용 또는 제공하지 않습니다.\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            const Text(
              "14세 미만 아동의 개인정보를 처리할 경우에는 법정대리인의 동의를 받아야 합니다. 법정대리인은 아동의 개인정보를 조회하거나 수정 및 삭제, 처리정지 및 동의 철회 등의 권리를 행사할 수 있습니다.\n",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "법정대리인 동의를 받기 위하여 아동에게 법정대리인의 성명, 연락처와 같이 최소한의 정보를 요구할 수 있으며, 아래 방법으로 법정대리인의 동의를 확인합니다.\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            const Text(
              "ㆍ법정대리인의 휴대전화 본인인증을 통해 본인여부를 확인하는 방법\n"
              "ㆍ법정대리인에게 동의내용이 적힌 서면을 제공하여 서명날인 후 제출하게 하는 방법\n"
              "ㆍ그 밖에 위와 준하는 방법으로 법정대리인에게 동의내용을 알리고 동의의 의사표시를 확인하는 방법\n\n",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54
              ),
            ),
        
        
        
        
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '5. 개인정보의 안전성 확보 조치에 관한 사항',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              "당진은 이용자의 개인정보 보호를 위해 아래의 노력을 합니다.\n",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "당진은 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다. 회원에게 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며, 다만 회원 전체에 대한 통지가 필요할 경우엔 7일 이상 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱) 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다.\n\n"
              "ㆍ이용자의 개인정보를 암호화하고 있습니다.\n"
              "이용자의 개인정보를 암호화된 통신구간을 이용하여 전송하고, 비밀번호 등 중요정보는 암호화하여 보관하고 있습니다.\n\n"
              "ㆍ해킹이나 컴퓨터 바이러스로부터 보호하기 위하여 노력하고 있습니다.\n"
              "해킹이나 컴퓨터 바이러스 등에 의해 이용자의 개인정보가 유출되거나 훼손되는 것을 막기 위해 외부로부터 접근이 통제된 구역에 시스템을 설치하고 있습니다. 해커 등의 침입을 탐지하고 차단할 수 있는 시스템을 설치하여 24시간 감시하고 있으며, 백신 프로그램을 설치하여 시스템이 최신 악성코드나 바이러스에 감염되지 않도록 노력하고 있습니다. 또한 새로운 해킹/보안 기술에 대해 지속적으로 연구하여 서비스에 적용하고 있습니다.\n\n"
              "ㆍ개인정보에 접근할 수 있는 사람을 최소화하고 있습니다.\n"
              "개인정보를 처리하는 임직원을 최소한으로 제한하고 있습니다. 또한 개인정보처리 시스템에 대한 비밀번호의 생성과 변경, 그리고 접근할 수 있는 권한에 대한 체계적인 기준을 마련하고 지속적인 감사를 실시하고 있습니다.\n\n"
              "ㆍ개인정보취급자에게 이용자의 개인정보 보호에 대해 정기적인 교육을 실시하고 있습니다.\n"
              "개인정보를 처리하는 모든 개인정보취급자 대상으로 개인정보보호 의무와 보안에 대한 정기적인 교육과 캠페인을 실시하고 있습니다.\n\n"
              "ㆍ이용자 정보의 보호 활동 및 체계에 대해 국내 및 국제 인증 규격을 충족하고 있습니다.\n"
              "정보보호 및 개인정보보호 관리 체계에 대해 국내 및 국제 인증 심사 규격 대비 충족 여부를 매년 독립된 심사 기관으로부터 검증을 받고 개선의 기회를 마련하고 있습니다.\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '6. 개인정보 보호책임자 및 고충처리 부서',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              "개인정보 보호책임자 및 고충처리 부서\n",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),
            ),
            const Text(
              "ㆍ책임자: 홍길동 (개인정보 보호책임자/DPO/위치정보관리책임자)\n"
              "ㆍ소속: 개인정보보호부서\n"
              "ㆍ문의\n"
              "    - 당진 고객센터 (바로가기) : 1234-5678 (유료)\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            const Text(
              "개인정보보호 관련 문의, 불만 등 의견이 있는 경우 위 연락처로 접수해 주시면, 신속하게 검토하여 답변 드리겠습니다.\n"
              "또한 개인정보 관련 신고나 상담이 필요한 경우에는 아래 기관을 통하여 도움 받을 수 있습니다.\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),


            const Text(
              "개인정보침해 신고센터\n",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            const Text(
              "(국번없이)118\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            const Text(
              "경찰청 사이버수사국\n",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            const Text(
              "(국번없이)182\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            const Text(
              "대검찰청 사이버수사과\n",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            const Text(
              "(국번없이)1301\n",
              style: TextStyle(
                fontSize: 17,
              ),
            ),

        
          ],
        ),
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