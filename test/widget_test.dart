
import 'package:flutter_test/flutter_test.dart';
import 'package:xml/xml.dart';

void main() {
  final xmlData = '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <response>
        <header>
            <resultCode>00</resultCode>
            <resultMsg>NORMAL SERVICE.</resultMsg>
        </header>
        <body>
            <items>
                <item>
                    <crcmrsghtngetcimageseq>http://www.forest.go.kr/swf/foreston/mountain/</crcmrsghtngetcimageseq>
                    <crcmrsghtnginfodscrt>&amp;amp;nbsp;</crcmrsghtnginfodscrt>
                    <crcmrsghtnginfoetcdscrt>&amp;amp;nbsp;</crcmrsghtnginfoetcdscrt>
                    <hkngpntdscrt> </hkngpntdscrt>
                    <hndfmsmtnmapimageseq>http://www.forest.go.kr/swf/foreston/mountain/</hndfmsmtnmapimageseq>
                    <hndfmsmtnslctnrson>&amp;amp;nbsp;</hndfmsmtnslctnrson>
                    <mntnattchimageseq>http://www.forest.go.kr/newkfsweb/cmm/fms/getImage.do?fileSn=1&amp;atchFileId=FILE_000000000423456</mntnattchimageseq>
                    <mntnid>20000001</mntnid>
                    <mntninfodscrt>&amp;amp;nbsp;</mntninfodscrt>
                    <mntninfodtlinfocont>경기 제 1봉인 화악산(1,468m)에서 동남쪽으로 뻗어 내린 능선상에 솟아 있는 가덕산은 몽덕산과 북배산의 능선 중간에 자리잡고 있다. 억새산이라고 할만큼 가을철에 억새가 볼만하다.&amp;lt;br /&amp;gt;&#xD;
    수백평의 억새밭인 가덕산 정상에 오르면 서북방향으로 화악산이 보이고, 남쪽으로는 목동평야와 북배산, 계관산 너머로 삼악산으로 이어지는 능선이 한눈에 들어 온다. 동쪽으로는 의암호와 춘천호, 그리고 호반의 도시, 춘천시가 보인다.&amp;lt;br /&amp;gt;&#xD;
    가덕산은 계관산, 북배산, 몽덕산과 더불어 네 개의 산을 연결하여 등산하는 유명한 종주코스이다. 이 능선에 구축된 등산길은 넓게 길이 잘 뚫려 있고 굴곡이 심하지 않아 겨울철 능선 종주산행지로 적격이다.</mntninfodtlinfocont>
                    <mntninfohght>858</mntninfohght>
                    <mntninfomangrtlno> </mntninfomangrtlno>
                    <mntninfomapdnldfilenm>http://www.forest.go.kr/swf/foreston/mountain/</mntninfomapdnldfilenm>
                    <mntninfomngmemnbdnm> </mntninfomngmemnbdnm>
                    <mntninfopoflc>경기도 가평군 북면, 강원도 춘천시 서면</mntninfopoflc>
                    <mntninfotrnspinfoimageseq>http://www.forest.go.kr/swf/foreston/mountain/</mntninfotrnspinfoimageseq>
                    <mntnnm>가덕산</mntnnm>
                    <mntnsbttlinfo>수백평의 억새밭을 거느린 산</mntnsbttlinfo>
                    <pbtrninfodscrt>&amp;amp;nbsp;</pbtrninfodscrt>
                    <ptmntrcmmncoursdscrt> </ptmntrcmmncoursdscrt>
                    <rcmmncoursimageseq>http://www.forest.go.kr/swf/foreston/mountain/</rcmmncoursimageseq>
                </item>
                <item>
                    <crcmrsghtngetcimageseq>http://www.forest.go.kr/swf/foreston/mountain/</crcmrsghtngetcimageseq>
                    <crcmrsghtnginfodscrt>&amp;amp;nbsp;</crcmrsghtnginfodscrt>
                    <crcmrsghtnginfoetcdscrt>&amp;amp;nbsp;</crcmrsghtnginfoetcdscrt>
                    <hkngpntdscrt> </hkngpntdscrt>
                    <hndfmsmtnmapimageseq>http://www.forest.go.kr/swf/foreston/mountain/</hndfmsmtnmapimageseq>
                    <hndfmsmtnslctnrson>&amp;amp;nbsp;</hndfmsmtnslctnrson>
                    <mntnattchimageseq>http://www.forest.go.kr/newkfsweb/cmm/fms/getImage.do?fileSn=1&amp;atchFileId=FILE_000000000423827</mntnattchimageseq>
                    <mntnid>20000828</mntnid>
                    <mntninfodscrt>&amp;amp;nbsp;</mntninfodscrt>
                    <mntninfodtlinfocont>제주도 다음으로 큰 섬인 거제도에는 해발 500m가 넘는 산이 7개가 있다. 그 중에서도 가라산은 도토리 키재기에서 1등을 차지해 `거제도 제1봉'이란 이름을 얻고 있는 산이다. 그래서인지 높이는 얼마 안되지만, 산행하기가 쉽지 않다. &amp;lt;br /&amp;gt;&#xD;
    &amp;lt;br /&amp;gt;&#xD;
    경상남도 남단 거제시의 최고봉으로 주봉은 가래봉이다. 산길에 서면 해안선이 가장 긴 한국 제2의 섬 거제도와 주변의 여러 섬은 물론 북쪽으로 진해시·마산시ㆍ고성군, 서쪽으로 통영시를 마주하고, 남·동쪽으로 남해를 굽어볼 수 있다. 부산 영도가 지척이고 갠 날은 쓰시마섬[對馬島]이 가물거릴 만큼 조망이 뛰어나다. &amp;lt;br /&amp;gt;&#xD;
    &amp;lt;br /&amp;gt;&#xD;
    가라산 곁에 계룡산(鷄龍山:566m)·노자산(老子山: 565m)·앵산(鶯山:507m)·산방산(山芳山:507m)·선자산(扇子山:507m)·옥녀봉(玉女 峰:555m) 등 500m대 비탈산이 많아 농지가 적지만 바다로 둘려 수산물이 풍부하다. 계룡산∼가라산 종주(약 25㎞)보다 노자산∼가라산 쪽이 인기다. 두 산은 1cm 사이라는 거제 유머가 있다.&amp;lt;br /&amp;gt;&#xD;
    &amp;lt;br /&amp;gt;&#xD;
    봄이면 고로쇠 약수 채취로 붐비고 해양성기후에 잘 자라는 아열대식물인 동백나무·팔손이나무·소철·종려나무 등 600여 종이 우거졌다. 노자산의 천연기념물인 학동의 동백림(233)은 세계적인 팔색조(八色鳥:204) 번식지이며, 서불의 불로초 신화에 얽힌 신선산의 산삼 또한 손꼽는다. 거제 해금강이 보 이는 학동고개에서 오르면 벼늘［露積］바위ㆍ선녀바위가 있는 주능선 삼거리에 닿고, 다도해의 수묵화가 펼쳐진다. &amp;lt;br /&amp;gt;&#xD;
    &amp;lt;br /&amp;gt;&#xD;
    거제 10대 명산의 수봉(首峰)까지는 젖봉바위·매바위 등에서 암벽등반도 즐기며 들맞이재와 안부를 지나면 잡목 울창한 정상 못미처 봉화대와 기우단이 있고 견암봉(見岩峰) 밑에 신라시대의 견암사지가 있다. 하산은 다대산성(多大山城)을 거치는 다대포구 쪽과 산정 밑 전망대바위-속가심바구 또는 원추리바위-에서 해금강 배타는 데로 가는 두 길이 있다.&amp;lt;br /&amp;gt;&#xD;
    &amp;lt;br /&amp;gt;&#xD;
    육로는 통영과 마산·진주·부산 등이 국도로 연결된 1일권으로 편리하다. 뱃길은 정기 여객선과 쾌속선이 옥포·고현·성포항에서 부산·통영·진해로 가며, 부산까지 40분으로 육상보다 낫다. 항공편은 수시로 헬리콥터가 김해와 연결된다. 근처의 명사·여차(몽돌)·덕원·함목·학동(몽돌)해수욕장 등도 가볼 만하다.</mntninfodtlinfocont>
                    <mntninfohght>580</mntninfohght>
                    <mntninfomangrtlno> </mntninfomangrtlno>
                    <mntninfomapdnldfilenm>http://www.forest.go.kr/swf/foreston/mountain/</mntninfomapdnldfilenm>
                    <mntninfomngmemnbdnm> </mntninfomngmemnbdnm>
                    <mntninfopoflc>경상남도 거제시 남부면 다대리</mntninfopoflc>
                    <mntninfotrnspinfoimageseq>http://www.forest.go.kr/swf/foreston/mountain/</mntninfotrnspinfoimageseq>
                    <mntnnm>가라산</mntnnm>
                    <mntnsbttlinfo>거제 제1봉의 이름 얻어</mntnsbttlinfo>
                    <pbtrninfodscrt>&amp;amp;nbsp;</pbtrninfodscrt>
                    <ptmntrcmmncoursdscrt> </ptmntrcmmncoursdscrt>
                    <rcmmncoursimageseq>http://www.forest.go.kr/swf/foreston/mountain/</rcmmncoursimageseq>
                </item>
                <item>
                    <crcmrsghtngetcimageseq>http://www.forest.go.kr/swf/foreston/mountain/</crcmrsghtngetcimageseq>
                    <crcmrsghtnginfodscrt>&amp;amp;nbsp;</crcmrsghtnginfodscrt>
                    <crcmrsghtnginfoetcdscrt>&amp;amp;nbsp;</crcmrsghtnginfoetcdscrt>
                    <hkngpntdscrt> </hkngpntdscrt>
                    <hndfmsmtnmapimageseq>http://www.forest.go.kr/swf/foreston/mountain/</hndfmsmtnmapimageseq>
                    <hndfmsmtnslctnrson>&amp;amp;nbsp;</hndfmsmtnslctnrson>
                    <mntnattchimageseq>http://www.forest.go.kr/newkfsweb/cmm/fms/getImage.do?fileSn=1&amp;atchFileId=</mntnattchimageseq>
                    <mntnid>40005577</mntnid>
                    <mntninfodscrt>&amp;amp;nbsp;</mntninfodscrt>
                    <mntninfodtlinfocont>경상남도&amp;amp;nbsp; 밀양시 단장면의 단장리서 가래봉(502.2m)으로 올라 안법리와 무릉리를 갈라놓은 능선을 타고 동남쪽으로 휘어지면서 무릉리와 감물리를 넘나드는 깨밭고개로 내려선다.&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;br /&amp;gt;&#xD;
    여기서 다시 지친 몸을 추스르고 남진하면서 천지봉(629.2m)을 경유하여 금오산(765.4m)과&amp;amp;nbsp;&amp;amp;nbsp;분기봉인 680m봉에선 서북방면의 지능선을 타고 감물저수지로 내려선다. &amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;br /&amp;gt;&#xD;
    도상12.5km에 달하는 이번 코스의 특징은 산행길 내내 짙은 송림 숲속을 거닐면서도 찾는이 없어서인지 원시상태 그대로의 야생숲이어서 산길 또한 투박하고 험난하다.&amp;amp;nbsp;</mntninfodtlinfocont>
                    <mntninfohght>502</mntninfohght>
                    <mntninfomangrtlno> </mntninfomangrtlno>
                    <mntninfomapdnldfilenm>http://www.forest.go.kr/swf/foreston/mountain/</mntninfomapdnldfilenm>
                    <mntninfomngmemnbdnm> </mntninfomngmemnbdnm>
                    <mntninfopoflc>경상남도 밀양시 단장면 단장리</mntninfopoflc>
                    <mntninfotrnspinfoimageseq>http://www.forest.go.kr/swf/foreston/mountain/</mntninfotrnspinfoimageseq>
                    <mntnnm>가래봉</mntnnm>
                    <mntnsbttlinfo> </mntnsbttlinfo>
                    <pbtrninfodscrt>밀양시외 버스 터미널에서 단장면 단장리에서 하차</pbtrninfodscrt>
                    <ptmntrcmmncoursdscrt> </ptmntrcmmncoursdscrt>
                    <rcmmncoursimageseq>http://www.forest.go.kr/swf/foreston/mountain/</rcmmncoursimageseq>
                </item>
                <item>
                    <crcmrsghtngetcimageseq>http://www.forest.go.kr/swf/foreston/mountain/</crcmrsghtngetcimageseq>
                    <crcmrsghtnginfodscrt>&amp;amp;nbsp;</crcmrsghtnginfodscrt>
                    <crcmrsghtnginfoetcdscrt>&amp;amp;nbsp;</crcmrsghtnginfoetcdscrt>
                    <hkngpntdscrt> </hkngpntdscrt>
                    <hndfmsmtnmapimageseq>http://www.forest.go.kr/swf/foreston/mountain/</hndfmsmtnmapimageseq>
                    <hndfmsmtnslctnrson>&amp;amp;nbsp;</hndfmsmtnslctnrson>
                    <mntnattchimageseq>http://www.forest.go.kr/newkfsweb/cmm/fms/getImage.do?fileSn=1&amp;atchFileId=FILE_000000000424223</mntnattchimageseq>
                    <mntnid>20000002</mntnid>
                    <mntninfodscrt>&amp;amp;nbsp;</mntninfodscrt>
                    <mntninfodtlinfocont>백악산(百岳山,858m)에서 북쪽으로 뻗어 내린 능선이 배골재를 지나 740m봉을 일으키고 북쪽은 산자락에 흐르는 화양계곡에 막혀 좌우로 부챗살처럼 능선을 늘어뜨리며, 오른쪽 동북쪽으로 가지를 친 능선에 솟아 있는 산이 가령 산이다.&amp;lt;br /&amp;gt;&#xD;
    왼쪽 서북쪽으로 이어진 능선에는 낙영산(681m)과 화양계곡으로 유명한 도명산(道明山,642m)이 서북쪽으로 갈미봉(560m)을 빚어 놓고 화양계곡입구인 화양리에서 꼬리를 내린다.&amp;lt;br /&amp;gt;&#xD;
    북쪽 산 아래로 흐르는 화양계곡에는 경관이 뛰어난 화양구곡이 줄지어 있다. 제1곡은 경천벽, 운영담(제2곡), 읍궁암(제3곡), 금사담(제4곡), 첨성대(제5곡), 능운대(제6곡), 와룡담(제7곡), 학소대(제8곡), 파천(제9곡)이 저마다 자태를 뽐내고 있다. &amp;lt;br /&amp;gt;&#xD;
    가령산은 등산로 곳곳에 시루바위, 거북바위 등 암봉이 널려있어 아기자기한 산행 재미를 느낄 수 있는 산이다.</mntninfodtlinfocont>
                    <mntninfohght>642</mntninfohght>
                    <mntninfomangrtlno> </mntninfomangrtlno>
                    <mntninfomapdnldfilenm>http://www.forest.go.kr/swf/foreston/mountain/</mntninfomapdnldfilenm>
                    <mntninfomngmemnbdnm> </mntninfomngmemnbdnm>
                    <mntninfopoflc>충청북도 괴산군</mntninfopoflc>
                    <mntninfotrnspinfoimageseq>http://www.forest.go.kr/swf/foreston/mountain/</mntninfotrnspinfoimageseq>
                    <mntnnm>가령산</mntnnm>
                    <mntnsbttlinfo>부채살속에 숨은 아홉 개 절경</mntnsbttlinfo>
                    <pbtrninfodscrt>&amp;amp;nbsp;</pbtrninfodscrt>
                    <ptmntrcmmncoursdscrt> </ptmntrcmmncoursdscrt>
                    <rcmmncoursimageseq>http://www.forest.go.kr/swf/foreston/mountain/</rcmmncoursimageseq>
                </item>
                <item>
                    <crcmrsghtngetcimageseq>http://www.forest.go.kr/swf/foreston/mountain/</crcmrsghtngetcimageseq>
                    <crcmrsghtnginfodscrt>&amp;amp;nbsp;</crcmrsghtnginfodscrt>
                    <crcmrsghtnginfoetcdscrt>&amp;amp;nbsp;</crcmrsghtnginfoetcdscrt>
                    <hkngpntdscrt> </hkngpntdscrt>
                    <hndfmsmtnmapimageseq>http://www.forest.go.kr/swf/foreston/mountain/</hndfmsmtnmapimageseq>
                    <hndfmsmtnslctnrson>&amp;amp;nbsp;</hndfmsmtnslctnrson>
                    <mntnattchimageseq>http://www.forest.go.kr/newkfsweb/cmm/fms/getImage.do?fileSn=1&amp;atchFileId=FILE_000000000424224</mntnattchimageseq>
                    <mntnid>20000003</mntnid>
                    <mntninfodscrt>&amp;amp;nbsp;</mntninfodscrt>
                    <mntninfodtlinfocont>가리봉은 설악산국립공원에 속하는 산으로 설악산 귀때기청봉(1,580m)과 대승령을 잇는 설악산 서북 주능선과 마주보고 있어 독립된 산처럼 보인다. 멀리서 보면 봉우리가 둥글둥글 완만해 보이지만 험준한 암봉들이 많은 산이다. &amp;lt;br /&amp;gt;&#xD;
    &amp;lt;br /&amp;gt;&#xD;
    산행 들머리는 옥녀탕앞이나 한계령에서 시작하는데 오르다 보면 산의 남서쪽에 이 산의 명물 팔례 약수가 있다. &amp;lt;br /&amp;gt;&#xD;
    &amp;lt;br /&amp;gt;&#xD;
    가리봉 주능선은 등산인들의 왕래가 거의 없는 관계로 등산로가 뚜렷하지 않으므로 산행시 주의해야 하는 곳이다.</mntninfodtlinfocont>
                    <mntninfohght>1519</mntninfohght>
                    <mntninfomangrtlno> </mntninfomangrtlno>
                    <mntninfomapdnldfilenm>http://www.forest.go.kr/swf/foreston/mountain/</mntninfomapdnldfilenm>
                    <mntninfomngmemnbdnm> </mntninfomngmemnbdnm>
                    <mntninfopoflc>강원도 인제군</mntninfopoflc>
                    <mntninfotrnspinfoimageseq>http://www.forest.go.kr/swf/foreston/mountain/</mntninfotrnspinfoimageseq>
                    <mntnnm>가리봉</mntnnm>
                    <mntnsbttlinfo>한계령 너머 한적한 산행을</mntnsbttlinfo>
                    <pbtrninfodscrt>&amp;amp;nbsp;</pbtrninfodscrt>
                    <ptmntrcmmncoursdscrt> </ptmntrcmmncoursdscrt>
                    <rcmmncoursimageseq>http://www.forest.go.kr/swf/foreston/mountain/</rcmmncoursimageseq>
                </item>
                <item>
                    <crcmrsghtngetcimageseq>http://www.forest.go.kr/swf/foreston/mountain/</crcmrsghtngetcimageseq>
                    <crcmrsghtnginfodscrt>● 숙식 및 기타정보&lt;br&gt;산행 들머리인 가리산자연휴양림(☎033-435-6034~5)을 이용하는 것이 편리하며 최대 수용인원은 1500여명이다. &lt;br&gt;그외 대명홍천스키장콘도 ☎033-434-8311, 대명비발디파크 유스호스텔 ☎033-434-2188?&lt;br&gt;&lt;br&gt;● 이용문의&lt;br&gt;홍천군 경제관광과 ☎033-430-2544, 홍천군 두촌면사무소 ☎033-435-3327, 가리산휴양림사무소 ☎033-435-6034</crcmrsghtnginfodscrt>
                    <crcmrsghtnginfoetcdscrt>① 가리산자연휴양림-삼거리-무쇠말재-정상-가삽고개-소양호 물로리 (총 4시간 30분)&lt;br&gt;② 가리산자연휴양림-가삽고개-정상-가리산교-철정리 (총 4시간 30분)</crcmrsghtnginfoetcdscrt>
                    <hkngpntdscrt> </hkngpntdscrt>
                    <hndfmsmtnmapimageseq>http://www.forest.go.kr/swf/foreston/mountain/</hndfmsmtnmapimageseq>
                    <hndfmsmtnslctnrson>강원도에서 진달래가 가장 많이 피는 산으로 알려져 있고, 참나무 중심의 울창한 산림과 부드러운 산줄기 등 우리나라 산의 전형적인 모습을 갖추고 있으며, 홍천강의 발원지 및 소양강의 수원(水源)을 이루고 있는 점 등을 고려하여 선정암봉이 솟아있는 정상에서 소양호를 조망할 수 있고, 야생화가 많이 서식하여 자연학습관찰에도 좋은 여건을 갖추고 있음. &quot;98년 강원도에서 자연휴양림으로 지정.</hndfmsmtnslctnrson>
                    <mntnattchimageseq>http://www.forest.go.kr/newkfsweb/cmm/fms/getImage.do?fileSn=1&amp;atchFileId=FILE_000000000424375</mntnattchimageseq>
                    <mntnid>20000004</mntnid>
                    <mntninfodscrt>&amp;lt;소양강 비경 담은 신비한 암봉&amp;gt;&lt;br&gt;가리산은 강원도 홍천군 두촌면과 화촌면, 춘천시 북산면, 동면에 걸쳐있는 해발 1050.9m의 산이다. 정상부를 이루는 산세가 마치 곡식을 차곡차곡 쌓아둔 ‘낟가리’와 닮았다고 하여 ‘가리산’이라 이름 붙여졌다고 전한다. 대체로 육산을 이루고 있는 산세이나 정상부는 거대한 3개의 바위봉우리로 이루어져 있다. 북서쪽에 자리잡은 소양호의 조망이 일품이며, 서쪽으로는 대룡산 어름이 보인다. 또 정상 아래의 바위 절벽에서 사시사철 솟는 석간수가 유명하다. 가리산은 홍천9경 중 2경으로 꼽힌다.</mntninfodscrt>
                    <mntninfodtlinfocont>강원도 춘천시와 홍천군의 경계를 이루는 산으로, 산 정상에 서면 탁 트인 시야와 발 아래로 펼쳐진 소양호의 풍경이 등산객들의 발걸음을 멈추게 하는 곳이다. 산자락을 감싸 흐르는 조그마한 폭포의 물소리가 사람들의 마음을 시원하게 해주는 가리산은 우거진 숲과 노송들이 어루러져 비경을 이루고 있다. 소양호 쪽으로 하산하여 물노리 선착장에서 유람선을 타고 소양댐 선착장까지 나올 수 있어, 산행도 하고 배를 타는 재미가 있다.&lt;br&gt;산이름인 가리는 '단으로 묶은 곡식이나 땔나무 따위를 차곡차곡 쌓아둔 큰 더미'를 뜻하는 순우리말로서, 산봉우리가 노적가리처럼 고깔 모양으로 생긴 데서 유래한다. 태백산맥 중 내지(內地) 산맥의 일부를 이룬다. 제1봉 남쪽에서 홍천강이 발원하여 북한강의 지류인 소양강의 수원(水源)을 이룬다.능선은 완만한 편이나, 정상 일대는 좁은 협곡을 사이에 둔 3개의 암봉으로 이루어져 있으며 강원 제1의 전망대라고 할 만큼 조망이 뛰어나, 소양호를 비롯하여 북쪽으로 향로봉에서 설악산을 거쳐 오대산으로 힘차게 뻗어나간 백두대간 등 강원 내륙의 고산준령이 한눈에 보인다. 정상 부근에서는 소양호로 갈 수 있는 가삽고개가 있는데, 그 형태가 계단식 분지형으로 이루어져 있다.&lt;br&gt;&lt;br&gt;북쪽 산록은 소양호에 미치고 동쪽 산록에 홍천광산이 있다. 산기슭에는 숲이 우거져 있고 갖가지 기암괴석이 즐비하며, 산 정상과 계곡에는 향토 수종인 참나무가 주종을 이루며 자라고 있다. 아래쪽에는 두릅나무·철쭉·싸리나무·산초나무 등 관목류와 약용으로 사용되는 피나물·애기똥풀·양지꽃 등 야생화가 서식하고 있다. 강원도에서 진달래가 가장 많이 피는 산으로도 유명하다. 1998년 가리산 자연휴영림으로 개장되어 통나무집·야영장·체육시설 등 편의시설이 있다. 휴양림 입구에는 높이 8m의 용소폭포가 있고, 주변에 스키장·온천·수타사·팔봉산 등의 관광지가 있다.</mntninfodtlinfocont>
                    <mntninfohght>1051</mntninfohght>
                    <mntninfomangrtlno> </mntninfomangrtlno>
                    <mntninfomapdnldfilenm>http://www.forest.go.kr/swf/foreston/mountain/</mntninfomapdnldfilenm>
                    <mntninfomngmemnbdnm> </mntninfomngmemnbdnm>
                    <mntninfopoflc>강원도 춘천시 북산면ㆍ동면, 홍천군 두촌면ㆍ화촌면</mntninfopoflc>
                    <mntninfotrnspinfoimageseq>http://www.forest.go.kr/swf/foreston/mountain/T_M0004.swf         </mntninfotrnspinfoimageseq>
                    <mntnnm>가리산</mntnnm>
                    <mntnsbttlinfo>소양호에서 폭포 따라 정상까지</mntnsbttlinfo>
                    <pbtrninfodscrt>홍천에서 역내리, 천현리행 버스를 이용해 가리산자연휴양림에서 내린다.&lt;br&gt;- 홍천→역내리 60분 간격 운행&lt;br&gt;- 홍천→천현리 1일 10회 운행</pbtrninfodscrt>
                    <ptmntrcmmncoursdscrt> </ptmntrcmmncoursdscrt>
                    <rcmmncoursimageseq>http://www.forest.go.kr/swf/foreston/mountain/</rcmmncoursimageseq>
                </item>
                <item>
                    <crcmrsghtngetcimageseq>http://www.forest.go.kr/swf/foreston/mountain/</crcmrsghtngetcimageseq>
                    <crcmrsghtnginfodscrt>&amp;amp;nbsp;</crcmrsghtnginfodscrt>
                    <crcmrsghtnginfoetcdscrt>&amp;amp;nbsp;</crcmrsghtnginfoetcdscrt>
                    <hkngpntdscrt> </hkngpntdscrt>
                    <hndfmsmtnmapimageseq>http://www.forest.go.kr/swf/foreston/mountain/</hndfmsmtnmapimageseq>
                    <hndfmsmtnslctnrson>&amp;amp;nbsp;</hndfmsmtnslctnrson>
                    <mntnattchimageseq>http://www.forest.go.kr/newkfsweb/cmm/fms/getImage.do?fileSn=1&amp;atchFileId=FILE_000000000423899</mntnattchimageseq>
                    <mntnid>20000005</mntnid>
                    <mntninfodscrt>&amp;amp;nbsp;</mntninfodscrt>
                    <mntninfodtlinfocont>백운산과 국망봉 사이에 위치한 신로봉에서 서쪽인 이동면 장암리 방면으로 뻗어내린 능선 상에 우뚝 솟은 가리산은 험준한 암릉으로 이루어진 산이다.&amp;lt;br /&amp;gt;&#xD;
    산 아래에서 볼 때 정산 주위는 두 개의 암봉으로 되어 있으며, 정상에서 서쪽과 북쪽 지역은 민간인 출입금지구역으로 주의를 요하는 곳이다.&amp;lt;br /&amp;gt;&#xD;
    &amp;lt;br /&amp;gt;&#xD;
    백운산과 국망봉 사이에 위치한 신로봉에서 서쪽인 이동면 장암리 방면으로 뻗어내린 능선 상에 우뚝 솟은 가리산(774.3m)은 험준한 암릉으로 이루어진 산이다. 산 아래에서 볼때 정상 주위는 두 개의 암봉으로 되어 있으며, 정상에서 서쪽과 북쪽 지역은 민간인 출입 금지구역으로 주의를 요하는 곳이다. &amp;lt;br /&amp;gt;&#xD;
    &amp;lt;br /&amp;gt;&#xD;
    정상에서의 사방 조망은 경기 제일의 고봉인 화악산, 명지산에 이어 세번째로 높은 국망봉(1,168m)과 신로봉으로 이어지는 능선이 파노라마를 이룬다. 도평교를 하산 지점으로 잡을 경우 하산길은 지루함을 느낄만큼 계곡길의 연속이다. &amp;lt;br /&amp;gt;&#xD;
    &amp;lt;br /&amp;gt;&#xD;
    가리산이란 명칭은 현재 폐광된 산 입구의 가리광산에서 유래됐다는 설이 전해진다. 가리란 바로 비료의 주성분 가운데 하나인 칼륨의 일본식 발음이다.</mntninfodtlinfocont>
                    <mntninfohght>774</mntninfohght>
                    <mntninfomangrtlno> </mntninfomangrtlno>
                    <mntninfomapdnldfilenm>http://www.forest.go.kr/swf/foreston/mountain/</mntninfomapdnldfilenm>
                    <mntninfomngmemnbdnm> </mntninfomngmemnbdnm>
                    <mntninfopoflc>경기도 포천시 이동면 장암리</mntninfopoflc>
                    <mntninfotrnspinfoimageseq>http://www.forest.go.kr/swf/foreston/mountain/</mntninfotrnspinfoimageseq>
                    <mntnnm>가리산</mntnnm>
                    <mntnsbttlinfo>울퉁불퉁, 험준한 암릉 산</mntnsbttlinfo>
                    <pbtrninfodscrt>&amp;amp;nbsp;</pbtrninfodscrt>
                    <ptmntrcmmncoursdscrt> </ptmntrcmmncoursdscrt>
                    <rcmmncoursimageseq>http://www.forest.go.kr/swf/foreston/mountain/</rcmmncoursimageseq>
                </item>
                <item>
                    <crcmrsghtngetcimageseq>http://www.forest.go.kr/swf/foreston/mountain/E_M0006.swf         </crcmrsghtngetcimageseq>
                    <crcmrsghtnginfodscrt>가리왕산자연휴양림 ☎033-562-5833&lt;BR&gt;가평허브찜질방 ☎033-332-2828&lt;BR&gt;천당골산장 ☎033-332-9943&lt;BR&gt;가리왕산관광농원 ☎033-563-6100~1&lt;BR&gt;&lt;BR&gt;&lt;BR&gt;&lt;BR&gt;이용문의 : 정선군청 관광문화과 ☎033-560-2569, 가리왕산자연휴양림 관리사무소 ☎033-562-5833</crcmrsghtnginfodscrt>
                    <crcmrsghtnginfoetcdscrt>가리왕산 자연휴양림-안부 전 갈림길-안부-상봉 정상 (총 2시간 10분)</crcmrsghtnginfoetcdscrt>
                    <hkngpntdscrt> </hkngpntdscrt>
                    <hndfmsmtnmapimageseq>http://www.forest.go.kr/swf/foreston/mountain/I_M0006.jpg         </hndfmsmtnmapimageseq>
                    <hndfmsmtnslctnrson>가리왕산 8경이 전해질 만큼 경관이 수려하고, 활엽수 극상림이 분포해 있으며, 전국적인 산나물 자생지로 유명. 특히 백두대간의 중심으로 주목군락지가 있어 산림유전자원보호림과 자연휴양림으로 지정되는 등 경관·생태적으로 가치가 큰 점에서 선정동강(東江)에 흘러드는 오대천과 조양강의 발원지이며 석회암 절리동굴인 얼음동굴이 유명. 산의 이름은 그 모습이 큰 가리(벼나 나무를 쌓은 더미)같다고 하여 유래</hndfmsmtnslctnrson>
                    <mntnattchimageseq>http://www.forest.go.kr/newkfsweb/cmm/fms/getImage.do?fileSn=1&amp;atchFileId=FILE_000000000424055</mntnattchimageseq>
                    <mntnid>20000006</mntnid>
                    <mntninfodscrt>정선아리랑 흐르는 정선의 지붕 &lt;BR&gt;강원도 평창군과 정선군은 이 고장 지붕 역할을 하고 있는 가리왕산을 중심으로 험난한 고산준령이 이루어진다고 해도 과언이 아니다. 정선의 주산 가리왕산은 갈왕(葛王)이 난을 피하여 숨어든 곳이라 하여 갈왕산(葛王山)이라 불리다가 일제시대를 거치면서 가리왕산(加里王山)으로 불리고 있다.&lt;BR&gt;&lt;BR&gt;가리왕산 상봉 서쪽의 중왕산(1381.4m)과 상봉 사이 안부인 마항치(馬項峙)에는 국내 유일의 ‘강릉부삼산봉표(江陵府蔘山封標)’라 새겨진 비가 세워져 있다. 이는 일반인들의 채삼을 금지하는 구역을 뜻하는 것으로 가리왕산이 조선시대 때 산삼의 주산지였음을 알 수 있는 대목이다. 상봉을 중심으로 남동쪽으로 중봉(1436m), 하봉(1381.7m)에 이르기까지 육중한 산세가 부드럽게 이어진다.</mntninfodscrt>
                    <mntninfodtlinfocont>가리왕산은 태백산의 지붕역활을 하고 있으며 경사도가 완만한 등산로로 유명하다. 산 능선에는 고산식물인 주목, 잣나무, 단풍나무등 각종 수목이 울창하며 산삼등 많은 산약초가 자라고 있다.&lt;BR&gt;&lt;BR&gt;회동리 입구에는 자연휴양림이 조성되어 각종 편의시설이 설치되어 있고 등산로 산행시간은 총 6시간 정도 소요된다. 군립공원으로 지정, 개발계획에 있으며 숙암방면 입구는 약 4km 구간에 철쭉이 밀집 자생하고 있다.</mntninfodtlinfocont>
                    <mntninfohght>1562</mntninfohght>
                    <mntninfomangrtlno> </mntninfomangrtlno>
                    <mntninfomapdnldfilenm>http://www.forest.go.kr/swf/foreston/mountain/M0006.zip           </mntninfomapdnldfilenm>
                    <mntninfomngmemnbdnm> </mntninfomngmemnbdnm>
                    <mntninfopoflc>강원도 정선군 정선읍 회동리ㆍ북평면, 평창군 진부면</mntninfopoflc>
                    <mntninfotrnspinfoimageseq>http://www.forest.go.kr/swf/foreston/mountain/T_M0006.swf         </mntninfotrnspinfoimageseq>
                    <mntnnm>가리왕산</mntnnm>
                    <mntnsbttlinfo>약초 많은 태백산의 지붕</mntnsbttlinfo>
                    <pbtrninfodscrt>장평(장평시외버스터미널 ☎033-332-4209)과 정선(정선터미널 ☎033-563-1094)이 기점이다. &lt;BR&gt;하안미 5리 백일동 버스종점에 가평매점(☎033-332-8622)이 있으니 출발 전에 문의하면 상세히 알 수 있다.&lt;BR&gt;- 장평→하안미리(가평행) 1일 5회 운행&lt;BR&gt;- 정선→회동 1일 8회 운행</pbtrninfodscrt>
                    <ptmntrcmmncoursdscrt> </ptmntrcmmncoursdscrt>
                    <rcmmncoursimageseq>http://www.forest.go.kr/swf/foreston/mountain/</rcmmncoursimageseq>
                </item>
                <item>
                    <crcmrsghtngetcimageseq>http://www.forest.go.kr/swf/foreston/mountain/</crcmrsghtngetcimageseq>
                    <crcmrsghtnginfodscrt>&amp;amp;nbsp;</crcmrsghtnginfodscrt>
                    <crcmrsghtnginfoetcdscrt>&amp;amp;nbsp;</crcmrsghtnginfoetcdscrt>
                    <hkngpntdscrt> </hkngpntdscrt>
                    <hndfmsmtnmapimageseq>http://www.forest.go.kr/swf/foreston/mountain/</hndfmsmtnmapimageseq>
                    <hndfmsmtnslctnrson>&amp;amp;nbsp;</hndfmsmtnslctnrson>
                    <mntnattchimageseq>http://www.forest.go.kr/newkfsweb/cmm/fms/getImage.do?fileSn=1&amp;atchFileId=FILE_000000000424491</mntnattchimageseq>
                    <mntnid>20000007</mntnid>
                    <mntninfodscrt>&amp;amp;nbsp;</mntninfodscrt>
                    <mntninfodtlinfocont>강원도 홍천군 내천면과 인제군 상남면의 경계에 걸쳐 있는 가마봉은 산을 즐겨 타는 등반객들에게도 잘 알려지지 않아 자연 그대로의 정경을 간직한 산이다.&amp;lt;br /&amp;gt;&#xD;
    산행기점인 김부리는 신라의 마지막 왕인 김부(金傅)에서 유래한 지명인데 세월이 흐르면서 현재 `金富'로 변했다고 한다.</mntninfodtlinfocont>
                    <mntninfohght>925</mntninfohght>
                    <mntninfomangrtlno> </mntninfomangrtlno>
                    <mntninfomapdnldfilenm>http://www.forest.go.kr/swf/foreston/mountain/</mntninfomapdnldfilenm>
                    <mntninfomngmemnbdnm> </mntninfomngmemnbdnm>
                    <mntninfopoflc>강원도 홍천군 내촌면, 인제군 남면</mntninfopoflc>
                    <mntninfotrnspinfoimageseq>http://www.forest.go.kr/swf/foreston/mountain/</mntninfotrnspinfoimageseq>
                    <mntnnm>가마봉</mntnnm>
                    <mntnsbttlinfo>등반객들의 발길이 닿지 않은 처녀림</mntnsbttlinfo>
                    <pbtrninfodscrt>&amp;amp;nbsp;</pbtrninfodscrt>
                    <ptmntrcmmncoursdscrt> </ptmntrcmmncoursdscrt>
                    <rcmmncoursimageseq>http://www.forest.go.kr/swf/foreston/mountain/</rcmmncoursimageseq>
                </item>
                <item>
                    <crcmrsghtngetcimageseq>http://www.forest.go.kr/swf/foreston/mountain/</crcmrsghtngetcimageseq>
                    <crcmrsghtnginfodscrt>&lt;p&gt;&amp;nbsp;&lt;/p&gt;</crcmrsghtnginfodscrt>
                    <crcmrsghtnginfoetcdscrt>&lt;p&gt;&amp;nbsp;&lt;/p&gt;</crcmrsghtnginfoetcdscrt>
                    <hkngpntdscrt> </hkngpntdscrt>
                    <hndfmsmtnmapimageseq>http://www.forest.go.kr/swf/foreston/mountain/</hndfmsmtnmapimageseq>
                    <hndfmsmtnslctnrson>&lt;p&gt;&amp;nbsp;&lt;/p&gt;</hndfmsmtnslctnrson>
                    <mntnattchimageseq>http://www.forest.go.kr/newkfsweb/cmm/fms/getImage.do?fileSn=1&amp;atchFileId=</mntnattchimageseq>
                    <mntnid>40006677</mntnid>
                    <mntninfodscrt>&lt;p&gt;&amp;nbsp;&lt;/p&gt;</mntninfodscrt>
                    <mntninfodtlinfocont>&lt;p&gt;공주시 반포면 상신리는 계룡산 자락이 감싸고 있는 마을로, 뒷산을 ‘솥봉’ 또는 ‘가마봉’이라 부르는데 지명에 얽힌 슬픈 전설이 전해진다. 아주 오랜 옛날 산 아랫마을에 석공 부부와 두 딸이 단란하게 살고 있었다. 어느 날 석공이 독이 있는 음식을 잘못 먹고 급사하게 되자, 그의 아내와 두 딸은 산속에서 나물을 캐고 나무를 해서 먹고 살아야 했다. 그러던 어느 날 석공의 아내가 산나물을 뜯고 있다가 마침 사냥을 나온 인근 고을의 원님과 마주치게 되었다.원님은 한눈에 이 여인에게 반하여 억지로 끌고 가서 자신의 시중을 들라고 명령하였다. 석공의 아내는 완강하게 거부하였고, 원님은 만약 끝까지 싫다고 한다면 가마솥의 끓는 물에 집어넣어 죽이겠노라고 협박하였다. 그래도 여인이 끝내 싫다 하니 원님은 처음 만났던 그 산속으로 여인을 다시 데리고 가 부하들로 하여금 가마솥을 걸게 하고 물을 끓인 후 사공의 아내를 빠뜨려 죽이고 말았다. 그 후 석공의 두 딸이 어머니의 처참한 시신을 발견하고, 통곡을 하며 복수를 다짐한 끝에 10여 년의 시간이 흐른 후 사냥 나온 원님을 향해 화살을 쏘아 죽였다.죽은 여인의 혼은 이승을 맴돌며 지금도 비오는 밤이나 안개가 낀 날에 큰 울음소리를 낸다고 한다. 산중턱에 솥을 걸었던 자리는 사람 형상의 바위가 생겨나 ‘사람바위’ 혹은 ‘아내바위’라 불렀고, 그 산은 솥봉 또는 가마봉이라 불리게 되었다고 한다.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;</mntninfodtlinfocont>
                    <mntninfohght>416</mntninfohght>
                    <mntninfomangrtlno> </mntninfomangrtlno>
                    <mntninfomapdnldfilenm>http://www.forest.go.kr/swf/foreston/mountain/</mntninfomapdnldfilenm>
                    <mntninfomngmemnbdnm> </mntninfomngmemnbdnm>
                    <mntninfopoflc>충청남도 공주시 반포면</mntninfopoflc>
                    <mntninfotrnspinfoimageseq>http://www.forest.go.kr/swf/foreston/mountain/</mntninfotrnspinfoimageseq>
                    <mntnnm>가마봉</mntnnm>
                    <mntnsbttlinfo>솥봉</mntnsbttlinfo>
                    <pbtrninfodscrt>&lt;p&gt;&amp;nbsp;&lt;/p&gt;</pbtrninfodscrt>
                    <ptmntrcmmncoursdscrt> </ptmntrcmmncoursdscrt>
                    <rcmmncoursimageseq>http://www.forest.go.kr/swf/foreston/mountain/</rcmmncoursimageseq>
                </item>
            </items>
            <numOfRows>10</numOfRows>
            <pageNo>1</pageNo>
            <totalCount>1338</totalCount>
        </body>
    </response>''';


}
