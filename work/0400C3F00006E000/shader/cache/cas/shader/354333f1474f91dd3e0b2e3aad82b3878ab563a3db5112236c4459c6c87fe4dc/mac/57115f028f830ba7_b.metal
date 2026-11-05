#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    constant _16* fp_c4 [[id(3)]];
};

struct main0_out
{
    float4 m_29 [[color(0)]];
    float4 m_31 [[color(1)]];
    float4 m_33 [[color(2)]];
    float4 m_35 [[color(3)]];
    float4 m_37 [[color(4)]];
    float4 m_39 [[color(5)]];
    float4 m_41 [[color(6)]];
    float4 m_43 [[color(7)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1166 = false;
    bool _1122 = false;
    bool _1120 = false;
    bool _1070 = false;
    bool _1068 = false;
    bool _1018 = false;
    bool _1016 = false;
    bool _966 = false;
    bool _964 = false;
    float _50 = gl_FragCoord.y;
    float _52 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _54 = _50 / _52;
    float _56 = gl_FragCoord.x;
    float _58 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _60 = _56 / _58;
    float _62 = abs((*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _64 = log2(_62);
    float _66 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _68 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _70 = abs((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _72 = log2(_70);
    float _74 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _76 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _78 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _80 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _82 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _84 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _86 = abs((*spvDescriptorSet0.fp_c4)._m0[1].x);
    float _88 = log2(_86);
    float _90 = abs((*spvDescriptorSet0.fp_c4)._m0[1].y);
    float _92 = log2(_90);
    float _94 = trunc(_54);
    int _97 = int(_94);
    float _99 = trunc(_60);
    int _101 = int(_99);
    int _103 = _97 << 2;
    float _105 = abs((*spvDescriptorSet0.fp_c4)._m0[1].z);
    float _107 = log2(_105);
    uint _110 = uint(int(uint(_97) >> uint(2)));
    int _112 = 12 & _103;
    int _114 = _101 << 2;
    int _116 = int(_110) << 4;
    int _118 = _116 + _112;
    uint _120 = uint(int(uint(_101) >> uint(2)));
    int _122 = 12 & _114;
    uint _124 = uint(int(uint(_118) >> uint(2)));
    uint _126 = uint(int(uint(int(_124)) >> uint(2)));
    int _128 = int(_124) & 3;
    float _130 = (*spvDescriptorSet0.fp_c5)._m0[int(_126)][_128];
    int _132 = int(_120) << 4;
    int _134 = _132 + _122;
    float _136 = abs((*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _138 = log2(_136);
    float _140 = (*spvDescriptorSet0.fp_c5)._m0[17].x + 0.5;
    uint _142 = uint(int(uint(_134) >> uint(2)));
    uint _144 = uint(int(uint(int(_142)) >> uint(2)));
    int _146 = int(_142) & 3;
    float _148 = (*spvDescriptorSet0.fp_c5)._m0[int(_144)][_146];
    float _150 = trunc(_140);
    int _152 = int(_150);
    float _154 = _130 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _156 = _130 * (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _158 = _130 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _160 = _130 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _162 = _130 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _164 = _130 * (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _166 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[9].z, _154);
    float _168 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[9].x, _156);
    float _170 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[9].x, _158);
    float _172 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[9].y, _160);
    float _174 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[9].y, _162);
    float _176 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[9].z, _164);
    int _178 = _152;
    int _180 = 0;
    int _182 = 0;
    int _184 = 0;
    int _186 = 0;
    int _188 = 0;
    int _190 = 0;
    int _192 = 0;
    int _194 = 0;
    int _196 = 0;
    int _198 = 0;
    int _200 = 0;
    int _202 = 0;
    int _204 = 0;
    int _206 = 0;
    int _208 = 0;
    int _210 = 0;
    int _212 = 0;
    int _214 = 0;
    int _216 = 0;
    int _218 = 0;
    int _220 = 0;
    int _222 = 0;
    int _224 = 0;
    int _226 = 0;
    int _228 = 0;
    int _230 = 0;
    int _232 = 0;
    int _234 = 0;
    int _236 = 0;
    int _238 = 0;
    int _240 = 0;
    int _242 = 0;
    int _244 = 0;
    bool _976;
    bool _986;
    int _988;
    int _990;
    int _992;
    int _994;
    int _996;
    int _998;
    int _1000;
    int _1002;
    bool _1028;
    bool _1038;
    int _1040;
    int _1042;
    int _1044;
    int _1046;
    int _1048;
    int _1050;
    int _1052;
    int _1054;
    bool _1080;
    bool _1090;
    int _1092;
    int _1094;
    int _1096;
    int _1098;
    int _1100;
    int _1102;
    int _1104;
    int _1106;
    bool _1132;
    bool _1142;
    int _1144;
    int _1146;
    int _1148;
    int _1150;
    int _1152;
    int _1154;
    int _1156;
    int _1158;
    do
    {
        int _246 = _178;
        int _248 = _180;
        int _250 = _182;
        int _252 = _184;
        int _254 = _186;
        int _256 = _188;
        int _258 = _190;
        int _260 = _192;
        int _262 = _194;
        int _264 = _196;
        int _266 = _198;
        int _268 = _200;
        int _270 = _202;
        int _272 = _204;
        int _274 = _206;
        int _276 = _208;
        int _278 = _210;
        int _280 = _212;
        int _282 = _214;
        int _284 = _216;
        int _286 = _218;
        int _288 = _220;
        int _290 = _222;
        int _292 = _224;
        int _294 = _226;
        int _296 = _228;
        int _298 = _230;
        int _300 = _232;
        int _302 = _234;
        int _304 = _236;
        int _306 = _238;
        int _308 = _240;
        int _310 = _242;
        int _312 = _244;
        int _314 = _246 << 2;
        bool _318 = _248 >= 4;
        uint _320 = uint(int(uint(_246) >> uint(2)));
        int _322 = 12 & _314;
        int _324 = int(_320) << 4;
        int _326 = _324 + _322;
        uint _328 = uint(int(uint(_326) >> uint(2)));
        uint _330 = uint(int(uint(int(_328)) >> uint(2)));
        int _332 = int(_328) & 3;
        float _334 = (*spvDescriptorSet0.fp_c5)._m0[int(_330)][_332];
        float _336 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[11].y, _172);
        float _338 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[11].x, _170);
        float _340 = _336 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _342 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[11].z, _166);
        float _344 = fma(_338, (*spvDescriptorSet0.fp_c3)._m0[0].x, _340);
        float _346 = fma(_342, (*spvDescriptorSet0.fp_c3)._m0[0].z, _344);
        float _348 = _346 * _346;
        float _350 = -_346;
        float _352 = _336 + _350;
        float _354 = -_346;
        float _356 = _338 + _354;
        float _358 = -_346;
        float _360 = _342 + _358;
        float _362 = 1.0 / _348;
        float _364 = precise::min(_362, 1.0);
        float _366 = _364 * _64;
        float _368 = _364 * _138;
        float _370 = _364 * _72;
        float _372 = exp2(_366);
        float _374 = exp2(_368);
        float _376 = exp2(_370);
        float _378 = fma(_352, _372, _346);
        float _380 = precise::max(0.0, _378);
        float _382 = fma(_356, _374, _346);
        float _384 = abs(_380);
        float _386 = log2(_384);
        float _388 = precise::max(0.0, _382);
        float _390 = fma(_360, _376, _346);
        float _392 = abs(_388);
        float _394 = log2(_392);
        float _396 = precise::max(0.0, _390);
        float _398 = abs(_396);
        float _400 = log2(_398);
        float _402 = _386 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _404 = _394 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _406 = exp2(_402);
        float _408 = _400 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
        float _410 = exp2(_404);
        float _412 = exp2(_408);
        float _414 = fma(_406, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[3].y);
        float _416 = precise::min(_414, 8000.0);
        float _418 = fma(_410, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[3].x);
        float _420 = _416 * (*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _422 = precise::min(_418, 8000.0);
        float _424 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[3].z);
        float _426 = _416 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _428 = precise::min(_424, 8000.0);
        float _430 = fma(_422, (*spvDescriptorSet0.fp_c3)._m0[12].y, _426);
        float _432 = _416 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
        float _434 = fma(_422, (*spvDescriptorSet0.fp_c3)._m0[12].x, _420);
        float _436 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[14].y, _430);
        float _438 = fma(_422, (*spvDescriptorSet0.fp_c3)._m0[12].z, _432);
        float _440 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[14].x, _434);
        float _442 = precise::max(0.0, _436);
        float _444 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[14].z, _438);
        float _446 = precise::max(0.0, _440);
        float _448 = _442 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
        float _450 = _442 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
        float _452 = precise::max(0.0, _444);
        float _454 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[15].x, _448);
        float _456 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[16].x, _450);
        float _458 = precise::max(_442, _452);
        float _460 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[15].z, _454);
        float _462 = precise::min(_442, _452);
        float _464 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[16].z, _456);
        float _466 = precise::max(_446, _458);
        float _468 = precise::min(_446, _462);
        float _470 = _460 + _464;
        float _472 = _460 + 1.0;
        float _474 = -_468;
        float _476 = _466 + _474;
        float _478 = precise::max(_470, _66);
        float _480 = _442 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
        float _482 = precise::max(_476, _68);
        float _484 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[18].x, _480);
        float _486 = 1.0 / _478;
        float _488 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[18].z, _484);
        float _490 = 1.0 / _482;
        float _492 = _486 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
        float _494 = _442 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
        float _496 = _488 * _492;
        float _498 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[17].x, _494);
        float _500 = _490 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
        float _502 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[17].z, _498);
        float _504 = _496 * _500;
        float _506 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[6].x, _472);
        float _508 = _464 + 1.0;
        float _510 = rsqrt(_506);
        float _512 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[6].y, _508);
        float _514 = _502 + 1.0;
        float _516 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[6].z, _514);
        float _518 = rsqrt(_512);
        float _520 = fma(_334, (*spvDescriptorSet0.fp_c4)._m0[11].y, _174);
        float _522 = rsqrt(_516);
        float _524 = _518 * (*spvDescriptorSet0.fp_c3)._m0[20].x;
        float _526 = _518 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
        float _528 = _518 * (*spvDescriptorSet0.fp_c3)._m0[20].z;
        float _530 = fma(_510, (*spvDescriptorSet0.fp_c3)._m0[19].x, _524);
        float _532 = fma(_510, (*spvDescriptorSet0.fp_c3)._m0[19].y, _526);
        float _534 = fma(_510, (*spvDescriptorSet0.fp_c3)._m0[19].z, _528);
        float _536 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[21].x, _530);
        float _538 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[21].y, _532);
        float _540 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[21].z, _534);
        float _542 = _520 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
        float _544 = fma(_334, (*spvDescriptorSet0.fp_c4)._m0[11].x, _168);
        float _546 = fma(_334, (*spvDescriptorSet0.fp_c4)._m0[11].z, _176);
        float _548 = fma(_504, _536, _446);
        float _550 = fma(_504, _538, _442);
        float _552 = fma(_544, (*spvDescriptorSet0.fp_c4)._m0[0].x, _542);
        float _554 = fma(_504, _540, _452);
        float _556 = precise::min(_130, _334);
        float _558 = -_148;
        float _560 = _548 + _558;
        float _562 = fma(_546, (*spvDescriptorSet0.fp_c4)._m0[0].z, _552);
        float _564 = precise::min(_556, _148);
        float _566 = _562 * _562;
        float _568 = -_562;
        float _570 = _544 + _568;
        float _572 = -_562;
        float _574 = _520 + _572;
        float _576 = -_562;
        float _578 = _546 + _576;
        float _580 = 1.0 / _566;
        float _582 = precise::min(_580, 1.0);
        float _584 = _582 * _92;
        float _586 = _582 * _88;
        float _588 = _582 * _107;
        float _590 = exp2(_584);
        float _592 = exp2(_586);
        float _594 = exp2(_588);
        float _596 = fma(_574, _590, _562);
        float _598 = precise::max(0.0, _596);
        float _600 = fma(_570, _592, _562);
        float _602 = precise::max(_130, _334);
        float _604 = abs(_598);
        float _606 = log2(_604);
        float _608 = precise::max(_602, _148);
        float _610 = precise::max(0.0, _600);
        float _612 = fma(_578, _594, _562);
        float _614 = precise::max(_608, _74);
        float _616 = -_564;
        float _618 = _608 + _616;
        float _620 = -_334;
        float _622 = _554 + _620;
        float _624 = abs(_610);
        float _626 = log2(_624);
        float _628 = precise::max(0.0, _612);
        float _630 = precise::max(_618, _76);
        float _632 = _606 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
        float _634 = abs(_628);
        float _636 = log2(_634);
        float _638 = 1.0 / _614;
        float _640 = _626 * (*spvDescriptorSet0.fp_c4)._m0[4].x;
        float _642 = 1.0 / _630;
        float _644 = _636 * (*spvDescriptorSet0.fp_c4)._m0[4].z;
        float _646 = exp2(_632);
        float _648 = _638 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _650 = exp2(_640);
        float _652 = _642 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _654 = _648 * _652;
        float _656 = exp2(_644);
        float _658 = fma(_646, (*spvDescriptorSet0.fp_c4)._m0[2].y, (*spvDescriptorSet0.fp_c4)._m0[3].y);
        float _660 = fma(_650, (*spvDescriptorSet0.fp_c4)._m0[2].x, (*spvDescriptorSet0.fp_c4)._m0[3].x);
        float _662 = precise::min(_658, 8000.0);
        float _664 = fma(_656, (*spvDescriptorSet0.fp_c4)._m0[2].z, (*spvDescriptorSet0.fp_c4)._m0[3].z);
        float _666 = precise::max(_608, _82);
        float _668 = _662 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
        float _670 = precise::min(_660, 8000.0);
        float _672 = _662 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
        float _674 = _662 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
        float _676 = precise::min(_664, 8000.0);
        float _678 = 1.0 / _666;
        float _680 = fma(_670, (*spvDescriptorSet0.fp_c4)._m0[12].x, _668);
        float _682 = fma(_670, (*spvDescriptorSet0.fp_c4)._m0[12].y, _672);
        float _684 = fma(_670, (*spvDescriptorSet0.fp_c4)._m0[12].z, _674);
        float _686 = precise::max(_618, _84);
        float _688 = fma(_676, (*spvDescriptorSet0.fp_c4)._m0[14].x, _680);
        float _690 = fma(_676, (*spvDescriptorSet0.fp_c4)._m0[14].y, _682);
        float _692 = fma(_676, (*spvDescriptorSet0.fp_c4)._m0[14].z, _684);
        float _694 = 1.0 / _686;
        float _696 = precise::max(0.0, _690);
        float _698 = precise::max(0.0, _688);
        float _700 = precise::max(0.0, _692);
        float _702 = _678 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
        float _704 = precise::max(_696, _700);
        float _706 = precise::min(_696, _700);
        float _708 = precise::max(_698, _704);
        float _710 = precise::min(_698, _706);
        float _712 = _694 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
        float _714 = _696 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
        float _716 = -_710;
        float _718 = _708 + _716;
        float _720 = fma(_698, (*spvDescriptorSet0.fp_c4)._m0[15].x, _714);
        float _722 = _696 * (*spvDescriptorSet0.fp_c4)._m0[16].y;
        float _724 = _696 * (*spvDescriptorSet0.fp_c4)._m0[18].y;
        float _726 = _702 * _712;
        float _728 = precise::max(_718, _80);
        float _730 = fma(_698, (*spvDescriptorSet0.fp_c4)._m0[16].x, _722);
        float _732 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[15].z, _720);
        float _734 = -_130;
        float _736 = _550 + _734;
        float _738 = fma(_654, _560, _148);
        float _740 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[16].z, _730);
        float _742 = 1.0 / _728;
        float _744 = fma(_654, _736, _130);
        float _746 = fma(_654, _622, _334);
        float _748 = _732 + _740;
        float _750 = fma(_698, (*spvDescriptorSet0.fp_c4)._m0[18].x, _724);
        float _752 = _744 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _754 = _738 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _756 = _746 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _758 = precise::max(_748, _78);
        float _760 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[18].z, _750);
        float _762 = 1.0 / _758;
        float _764 = _762 * (*spvDescriptorSet0.fp_c4)._m0[7].x;
        float _766 = _760 * _764;
        float _768 = _742 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
        float _770 = _766 * _768;
        float _772 = _732 + 1.0;
        float _774 = _696 * (*spvDescriptorSet0.fp_c4)._m0[17].y;
        float _776 = fma(_770, (*spvDescriptorSet0.fp_c4)._m0[6].x, _772);
        float _778 = fma(_698, (*spvDescriptorSet0.fp_c4)._m0[17].x, _774);
        float _780 = _740 + 1.0;
        float _782 = rsqrt(_776);
        float _784 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[17].z, _778);
        float _786 = fma(_770, (*spvDescriptorSet0.fp_c4)._m0[6].y, _780);
        float _788 = _784 + 1.0;
        float _790 = rsqrt(_786);
        float _792 = fma(_770, (*spvDescriptorSet0.fp_c4)._m0[6].z, _788);
        float _794 = rsqrt(_792);
        float _796 = _790 * (*spvDescriptorSet0.fp_c4)._m0[20].x;
        float _798 = _790 * (*spvDescriptorSet0.fp_c4)._m0[20].y;
        float _800 = _790 * (*spvDescriptorSet0.fp_c4)._m0[20].z;
        float _802 = fma(_782, (*spvDescriptorSet0.fp_c4)._m0[19].x, _796);
        float _804 = fma(_782, (*spvDescriptorSet0.fp_c4)._m0[19].y, _798);
        float _806 = fma(_782, (*spvDescriptorSet0.fp_c4)._m0[19].z, _800);
        float _808 = fma(_794, (*spvDescriptorSet0.fp_c4)._m0[21].x, _802);
        float _810 = fma(_794, (*spvDescriptorSet0.fp_c4)._m0[21].y, _804);
        float _812 = fma(_794, (*spvDescriptorSet0.fp_c4)._m0[21].z, _806);
        float _814 = fma(_770, _808, _698);
        float _816 = fma(_770, _810, _696);
        float _818 = fma(_770, _812, _700);
        float _820 = -_148;
        float _822 = _814 + _820;
        float _824 = -_130;
        float _826 = _816 + _824;
        float _828 = -_334;
        float _830 = _818 + _828;
        float _832 = fma(_726, _822, _148);
        float _834 = fma(_726, _826, _130);
        float _836 = fma(_726, _830, _334);
        float _838 = -_754;
        float _840 = fma(_832, (*spvDescriptorSet0.fp_c4)._m0[5].x, _838);
        float _842 = -_752;
        float _844 = fma(_834, (*spvDescriptorSet0.fp_c4)._m0[5].y, _842);
        float _846 = -_756;
        float _848 = fma(_836, (*spvDescriptorSet0.fp_c4)._m0[5].z, _846);
        float _850 = fma(_840, (*spvDescriptorSet0.fp_c5)._m0[17].y, _754);
        float _852 = fma(_844, (*spvDescriptorSet0.fp_c5)._m0[17].y, _752);
        float _854 = fma(_848, (*spvDescriptorSet0.fp_c5)._m0[17].y, _756);
        bool _856 = !_318;
        int _858 = _290;
        int _860 = _282;
        int _862 = _274;
        int _864 = _266;
        int _866 = _250;
        int _868 = _258;
        int _870 = _266;
        int _872 = _274;
        int _874 = _282;
        int _876 = _290;
        int _878 = _298;
        int _880 = _306;
        int _882 = _292;
        int _884 = _284;
        int _886 = _276;
        int _888 = _268;
        int _890 = _252;
        int _892 = _260;
        int _894 = _268;
        int _896 = _276;
        int _898 = _284;
        int _900 = _292;
        int _902 = _300;
        int _904 = _308;
        int _906 = _294;
        int _908 = _286;
        int _910 = _278;
        int _912 = _270;
        int _914 = _254;
        int _916 = _262;
        int _918 = _270;
        int _920 = _278;
        int _922 = _286;
        int _924 = _294;
        int _926 = _302;
        int _928 = _310;
        int _930 = _296;
        int _932 = _288;
        int _934 = _280;
        int _936 = _272;
        int _938 = _256;
        int _940 = _264;
        int _942 = _272;
        int _944 = _280;
        int _946 = _288;
        int _948 = _296;
        int _950 = _304;
        int _952 = _312;
        if (!_856)
        {
            bool _954 = _248 >= 6;
            bool _956 = !_954;
            if (!_956)
            {
                bool _958 = _248 >= 7;
                bool _960 = !_958;
                if (!_960)
                {
                    bool _962 = _248 != 7;
                    _964 = _962;
                    if (!_964)
                    {
                        _880 = as_type<int>(_850);
                        _966 = true;
                    }
                }
                else
                {
                    _878 = as_type<int>(_850);
                    _966 = true;
                }
            }
            else
            {
                bool _968 = _248 >= 5;
                if (_968)
                {
                    _858 = as_type<int>(_850);
                }
                int _970 = _858;
                _876 = _970;
                if (!_968)
                {
                    _860 = as_type<int>(_850);
                }
                int _972 = _860;
                _874 = _972;
                _966 = true;
            }
        }
        if ((!_966) || _964)
        {
            if (!_964)
            {
                bool _974 = _248 >= 2;
                _976 = !_974;
            }
            if ((!_976) && (!_964))
            {
                bool _978 = _248 >= 3;
                if (_978)
                {
                    _862 = as_type<int>(_850);
                }
                int _980 = _862;
                _872 = _980;
                if (!_978)
                {
                    _864 = as_type<int>(_850);
                }
                int _982 = _864;
                _870 = _982;
                _966 = true;
            }
            else
            {
                if (!_964)
                {
                    bool _984 = _248 != 1;
                    _986 = !_984;
                }
                if ((!_986) || _964)
                {
                    _964 = false;
                    _866 = as_type<int>(_850);
                    _966 = true;
                }
                else
                {
                    _868 = as_type<int>(_850);
                }
            }
        }
        _966 = false;
        _988 = _866;
        _990 = _868;
        _992 = _870;
        _994 = _872;
        _996 = _874;
        _998 = _876;
        _1000 = _878;
        _1002 = _880;
        bool _1004 = !_318;
        _182 = _988;
        _190 = _990;
        _198 = _992;
        _206 = _994;
        _214 = _996;
        _222 = _998;
        _230 = _1000;
        _238 = _1002;
        if (!_1004)
        {
            bool _1006 = _248 >= 6;
            bool _1008 = !_1006;
            if (!_1008)
            {
                bool _1010 = _248 >= 7;
                bool _1012 = !_1010;
                if (!_1012)
                {
                    bool _1014 = _248 != 7;
                    _1016 = _1014;
                    if (!_1016)
                    {
                        _904 = as_type<int>(_852);
                        _1018 = true;
                    }
                }
                else
                {
                    _902 = as_type<int>(_852);
                    _1018 = true;
                }
            }
            else
            {
                bool _1020 = _248 >= 5;
                if (_1020)
                {
                    _882 = as_type<int>(_852);
                }
                int _1022 = _882;
                _900 = _1022;
                if (!_1020)
                {
                    _884 = as_type<int>(_852);
                }
                int _1024 = _884;
                _898 = _1024;
                _1018 = true;
            }
        }
        if ((!_1018) || _1016)
        {
            if (!_1016)
            {
                bool _1026 = _248 >= 2;
                _1028 = !_1026;
            }
            if ((!_1028) && (!_1016))
            {
                bool _1030 = _248 >= 3;
                if (_1030)
                {
                    _886 = as_type<int>(_852);
                }
                int _1032 = _886;
                _896 = _1032;
                if (!_1030)
                {
                    _888 = as_type<int>(_852);
                }
                int _1034 = _888;
                _894 = _1034;
                _1018 = true;
            }
            else
            {
                if (!_1016)
                {
                    bool _1036 = _248 != 1;
                    _1038 = !_1036;
                }
                if ((!_1038) || _1016)
                {
                    _1016 = false;
                    _890 = as_type<int>(_852);
                    _1018 = true;
                }
                else
                {
                    _892 = as_type<int>(_852);
                }
            }
        }
        _1018 = false;
        _1040 = _890;
        _1042 = _892;
        _1044 = _894;
        _1046 = _896;
        _1048 = _898;
        _1050 = _900;
        _1052 = _902;
        _1054 = _904;
        bool _1056 = !_318;
        _184 = _1040;
        _192 = _1042;
        _200 = _1044;
        _208 = _1046;
        _216 = _1048;
        _224 = _1050;
        _232 = _1052;
        _240 = _1054;
        if (!_1056)
        {
            bool _1058 = _248 >= 6;
            bool _1060 = !_1058;
            if (!_1060)
            {
                bool _1062 = _248 >= 7;
                bool _1064 = !_1062;
                if (!_1064)
                {
                    bool _1066 = _248 != 7;
                    _1068 = _1066;
                    if (!_1068)
                    {
                        _928 = as_type<int>(_854);
                        _1070 = true;
                    }
                }
                else
                {
                    _926 = as_type<int>(_854);
                    _1070 = true;
                }
            }
            else
            {
                bool _1072 = _248 >= 5;
                if (_1072)
                {
                    _906 = as_type<int>(_854);
                }
                int _1074 = _906;
                _924 = _1074;
                if (!_1072)
                {
                    _908 = as_type<int>(_854);
                }
                int _1076 = _908;
                _922 = _1076;
                _1070 = true;
            }
        }
        if ((!_1070) || _1068)
        {
            if (!_1068)
            {
                bool _1078 = _248 >= 2;
                _1080 = !_1078;
            }
            if ((!_1080) && (!_1068))
            {
                bool _1082 = _248 >= 3;
                if (_1082)
                {
                    _910 = as_type<int>(_854);
                }
                int _1084 = _910;
                _920 = _1084;
                if (!_1082)
                {
                    _912 = as_type<int>(_854);
                }
                int _1086 = _912;
                _918 = _1086;
                _1070 = true;
            }
            else
            {
                if (!_1068)
                {
                    bool _1088 = _248 != 1;
                    _1090 = !_1088;
                }
                if ((!_1090) || _1068)
                {
                    _1068 = false;
                    _914 = as_type<int>(_854);
                    _1070 = true;
                }
                else
                {
                    _916 = as_type<int>(_854);
                }
            }
        }
        _1070 = false;
        _1092 = _914;
        _1094 = _916;
        _1096 = _918;
        _1098 = _920;
        _1100 = _922;
        _1102 = _924;
        _1104 = _926;
        _1106 = _928;
        bool _1108 = !_318;
        _186 = _1092;
        _194 = _1094;
        _202 = _1096;
        _210 = _1098;
        _218 = _1100;
        _226 = _1102;
        _234 = _1104;
        _242 = _1106;
        if (!_1108)
        {
            bool _1110 = _248 >= 6;
            bool _1112 = !_1110;
            if (!_1112)
            {
                bool _1114 = _248 >= 7;
                bool _1116 = !_1114;
                if (!_1116)
                {
                    bool _1118 = _248 != 7;
                    _1120 = _1118;
                    if (!_1120)
                    {
                        _952 = 1065353216;
                        _1122 = true;
                    }
                }
                else
                {
                    _950 = 1065353216;
                    _1122 = true;
                }
            }
            else
            {
                bool _1124 = _248 >= 5;
                if (_1124)
                {
                    _930 = 1065353216;
                }
                int _1126 = _930;
                _948 = _1126;
                if (!_1124)
                {
                    _932 = 1065353216;
                }
                int _1128 = _932;
                _946 = _1128;
                _1122 = true;
            }
        }
        if ((!_1122) || _1120)
        {
            if (!_1120)
            {
                bool _1130 = _248 >= 2;
                _1132 = !_1130;
            }
            if ((!_1132) && (!_1120))
            {
                bool _1134 = _248 >= 3;
                if (_1134)
                {
                    _934 = 1065353216;
                }
                int _1136 = _934;
                _944 = _1136;
                if (!_1134)
                {
                    _936 = 1065353216;
                }
                int _1138 = _936;
                _942 = _1138;
                _1122 = true;
            }
            else
            {
                if (!_1120)
                {
                    bool _1140 = _248 != 1;
                    _1142 = !_1140;
                }
                if ((!_1142) || _1120)
                {
                    _1120 = false;
                    _938 = 1065353216;
                    _1122 = true;
                }
                else
                {
                    _940 = 1065353216;
                }
            }
        }
        _1122 = false;
        _1144 = _938;
        _1146 = _940;
        _1148 = _942;
        _1150 = _944;
        _1152 = _946;
        _1154 = _948;
        _1156 = _950;
        _1158 = _952;
        int _1160 = _248 + 1;
        int _1162 = _246 + 1;
        bool _1164 = _1160 >= 8;
        _178 = _1162;
        _180 = _1160;
        _188 = _1144;
        _196 = _1146;
        _204 = _1148;
        _212 = _1150;
        _220 = _1152;
        _228 = _1154;
        _236 = _1156;
        _244 = _1158;
        if (_1164)
        {
            _1166 = true;
            if (_1166)
            {
                break;
            }
        }
    } while (true);
    _1166 = false;
    out.m_29.x = as_type<float>(_988);
    out.m_29.y = as_type<float>(_1040);
    out.m_29.z = as_type<float>(_1092);
    out.m_29.w = as_type<float>(_1144);
    out.m_31.x = as_type<float>(_990);
    out.m_31.y = as_type<float>(_1042);
    out.m_31.z = as_type<float>(_1094);
    out.m_31.w = as_type<float>(_1146);
    out.m_33.x = as_type<float>(_992);
    out.m_33.y = as_type<float>(_1044);
    out.m_33.z = as_type<float>(_1096);
    out.m_33.w = as_type<float>(_1148);
    out.m_35.x = as_type<float>(_994);
    out.m_35.y = as_type<float>(_1046);
    out.m_35.z = as_type<float>(_1098);
    out.m_35.w = as_type<float>(_1150);
    out.m_37.x = as_type<float>(_996);
    out.m_37.y = as_type<float>(_1048);
    out.m_37.z = as_type<float>(_1100);
    out.m_37.w = as_type<float>(_1152);
    out.m_39.x = as_type<float>(_998);
    out.m_39.y = as_type<float>(_1050);
    out.m_39.z = as_type<float>(_1102);
    out.m_39.w = as_type<float>(_1154);
    out.m_41.x = as_type<float>(_1000);
    out.m_41.y = as_type<float>(_1052);
    out.m_41.z = as_type<float>(_1104);
    out.m_41.w = as_type<float>(_1156);
    out.m_43.x = as_type<float>(_1002);
    out.m_43.y = as_type<float>(_1054);
    out.m_43.z = as_type<float>(_1106);
    out.m_43.w = as_type<float>(_1158);
    return out;
}


struct main0_out_u
{
    uint4 m_29 [[color(0)]];
    uint4 m_31 [[color(1)]];
    uint4 m_33 [[color(2)]];
    uint4 m_35 [[color(3)]];
    uint4 m_37 [[color(4)]];
    uint4 m_39 [[color(5)]];
    uint4 m_41 [[color(6)]];
    uint4 m_43 [[color(7)]];
};

fragment main0_out_u main0_u(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1166 = false;
    bool _1122 = false;
    bool _1120 = false;
    bool _1070 = false;
    bool _1068 = false;
    bool _1018 = false;
    bool _1016 = false;
    bool _966 = false;
    bool _964 = false;
    float _50 = gl_FragCoord.y;
    float _52 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _54 = _50 / _52;
    float _56 = gl_FragCoord.x;
    float _58 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _60 = _56 / _58;
    float _62 = abs((*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _64 = log2(_62);
    float _66 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _68 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _70 = abs((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _72 = log2(_70);
    float _74 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _76 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _78 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _80 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _82 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _84 = 9.9999997473787516355514526367188e-05 + (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _86 = abs((*spvDescriptorSet0.fp_c4)._m0[1].x);
    float _88 = log2(_86);
    float _90 = abs((*spvDescriptorSet0.fp_c4)._m0[1].y);
    float _92 = log2(_90);
    float _94 = trunc(_54);
    int _97 = int(_94);
    float _99 = trunc(_60);
    int _101 = int(_99);
    int _103 = _97 << 2;
    float _105 = abs((*spvDescriptorSet0.fp_c4)._m0[1].z);
    float _107 = log2(_105);
    uint _110 = uint(int(uint(_97) >> uint(2)));
    int _112 = 12 & _103;
    int _114 = _101 << 2;
    int _116 = int(_110) << 4;
    int _118 = _116 + _112;
    uint _120 = uint(int(uint(_101) >> uint(2)));
    int _122 = 12 & _114;
    uint _124 = uint(int(uint(_118) >> uint(2)));
    uint _126 = uint(int(uint(int(_124)) >> uint(2)));
    int _128 = int(_124) & 3;
    float _130 = (*spvDescriptorSet0.fp_c5)._m0[int(_126)][_128];
    int _132 = int(_120) << 4;
    int _134 = _132 + _122;
    float _136 = abs((*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _138 = log2(_136);
    float _140 = (*spvDescriptorSet0.fp_c5)._m0[17].x + 0.5;
    uint _142 = uint(int(uint(_134) >> uint(2)));
    uint _144 = uint(int(uint(int(_142)) >> uint(2)));
    int _146 = int(_142) & 3;
    float _148 = (*spvDescriptorSet0.fp_c5)._m0[int(_144)][_146];
    float _150 = trunc(_140);
    int _152 = int(_150);
    float _154 = _130 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _156 = _130 * (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _158 = _130 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _160 = _130 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _162 = _130 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _164 = _130 * (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _166 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[9].z, _154);
    float _168 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[9].x, _156);
    float _170 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[9].x, _158);
    float _172 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[9].y, _160);
    float _174 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[9].y, _162);
    float _176 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[9].z, _164);
    int _178 = _152;
    int _180 = 0;
    int _182 = 0;
    int _184 = 0;
    int _186 = 0;
    int _188 = 0;
    int _190 = 0;
    int _192 = 0;
    int _194 = 0;
    int _196 = 0;
    int _198 = 0;
    int _200 = 0;
    int _202 = 0;
    int _204 = 0;
    int _206 = 0;
    int _208 = 0;
    int _210 = 0;
    int _212 = 0;
    int _214 = 0;
    int _216 = 0;
    int _218 = 0;
    int _220 = 0;
    int _222 = 0;
    int _224 = 0;
    int _226 = 0;
    int _228 = 0;
    int _230 = 0;
    int _232 = 0;
    int _234 = 0;
    int _236 = 0;
    int _238 = 0;
    int _240 = 0;
    int _242 = 0;
    int _244 = 0;
    bool _976;
    bool _986;
    int _988;
    int _990;
    int _992;
    int _994;
    int _996;
    int _998;
    int _1000;
    int _1002;
    bool _1028;
    bool _1038;
    int _1040;
    int _1042;
    int _1044;
    int _1046;
    int _1048;
    int _1050;
    int _1052;
    int _1054;
    bool _1080;
    bool _1090;
    int _1092;
    int _1094;
    int _1096;
    int _1098;
    int _1100;
    int _1102;
    int _1104;
    int _1106;
    bool _1132;
    bool _1142;
    int _1144;
    int _1146;
    int _1148;
    int _1150;
    int _1152;
    int _1154;
    int _1156;
    int _1158;
    do
    {
        int _246 = _178;
        int _248 = _180;
        int _250 = _182;
        int _252 = _184;
        int _254 = _186;
        int _256 = _188;
        int _258 = _190;
        int _260 = _192;
        int _262 = _194;
        int _264 = _196;
        int _266 = _198;
        int _268 = _200;
        int _270 = _202;
        int _272 = _204;
        int _274 = _206;
        int _276 = _208;
        int _278 = _210;
        int _280 = _212;
        int _282 = _214;
        int _284 = _216;
        int _286 = _218;
        int _288 = _220;
        int _290 = _222;
        int _292 = _224;
        int _294 = _226;
        int _296 = _228;
        int _298 = _230;
        int _300 = _232;
        int _302 = _234;
        int _304 = _236;
        int _306 = _238;
        int _308 = _240;
        int _310 = _242;
        int _312 = _244;
        int _314 = _246 << 2;
        bool _318 = _248 >= 4;
        uint _320 = uint(int(uint(_246) >> uint(2)));
        int _322 = 12 & _314;
        int _324 = int(_320) << 4;
        int _326 = _324 + _322;
        uint _328 = uint(int(uint(_326) >> uint(2)));
        uint _330 = uint(int(uint(int(_328)) >> uint(2)));
        int _332 = int(_328) & 3;
        float _334 = (*spvDescriptorSet0.fp_c5)._m0[int(_330)][_332];
        float _336 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[11].y, _172);
        float _338 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[11].x, _170);
        float _340 = _336 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _342 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[11].z, _166);
        float _344 = fma(_338, (*spvDescriptorSet0.fp_c3)._m0[0].x, _340);
        float _346 = fma(_342, (*spvDescriptorSet0.fp_c3)._m0[0].z, _344);
        float _348 = _346 * _346;
        float _350 = -_346;
        float _352 = _336 + _350;
        float _354 = -_346;
        float _356 = _338 + _354;
        float _358 = -_346;
        float _360 = _342 + _358;
        float _362 = 1.0 / _348;
        float _364 = precise::min(_362, 1.0);
        float _366 = _364 * _64;
        float _368 = _364 * _138;
        float _370 = _364 * _72;
        float _372 = exp2(_366);
        float _374 = exp2(_368);
        float _376 = exp2(_370);
        float _378 = fma(_352, _372, _346);
        float _380 = precise::max(0.0, _378);
        float _382 = fma(_356, _374, _346);
        float _384 = abs(_380);
        float _386 = log2(_384);
        float _388 = precise::max(0.0, _382);
        float _390 = fma(_360, _376, _346);
        float _392 = abs(_388);
        float _394 = log2(_392);
        float _396 = precise::max(0.0, _390);
        float _398 = abs(_396);
        float _400 = log2(_398);
        float _402 = _386 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _404 = _394 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _406 = exp2(_402);
        float _408 = _400 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
        float _410 = exp2(_404);
        float _412 = exp2(_408);
        float _414 = fma(_406, (*spvDescriptorSet0.fp_c3)._m0[2].y, (*spvDescriptorSet0.fp_c3)._m0[3].y);
        float _416 = precise::min(_414, 8000.0);
        float _418 = fma(_410, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[3].x);
        float _420 = _416 * (*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _422 = precise::min(_418, 8000.0);
        float _424 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[3].z);
        float _426 = _416 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _428 = precise::min(_424, 8000.0);
        float _430 = fma(_422, (*spvDescriptorSet0.fp_c3)._m0[12].y, _426);
        float _432 = _416 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
        float _434 = fma(_422, (*spvDescriptorSet0.fp_c3)._m0[12].x, _420);
        float _436 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[14].y, _430);
        float _438 = fma(_422, (*spvDescriptorSet0.fp_c3)._m0[12].z, _432);
        float _440 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[14].x, _434);
        float _442 = precise::max(0.0, _436);
        float _444 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[14].z, _438);
        float _446 = precise::max(0.0, _440);
        float _448 = _442 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
        float _450 = _442 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
        float _452 = precise::max(0.0, _444);
        float _454 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[15].x, _448);
        float _456 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[16].x, _450);
        float _458 = precise::max(_442, _452);
        float _460 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[15].z, _454);
        float _462 = precise::min(_442, _452);
        float _464 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[16].z, _456);
        float _466 = precise::max(_446, _458);
        float _468 = precise::min(_446, _462);
        float _470 = _460 + _464;
        float _472 = _460 + 1.0;
        float _474 = -_468;
        float _476 = _466 + _474;
        float _478 = precise::max(_470, _66);
        float _480 = _442 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
        float _482 = precise::max(_476, _68);
        float _484 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[18].x, _480);
        float _486 = 1.0 / _478;
        float _488 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[18].z, _484);
        float _490 = 1.0 / _482;
        float _492 = _486 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
        float _494 = _442 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
        float _496 = _488 * _492;
        float _498 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[17].x, _494);
        float _500 = _490 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
        float _502 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[17].z, _498);
        float _504 = _496 * _500;
        float _506 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[6].x, _472);
        float _508 = _464 + 1.0;
        float _510 = rsqrt(_506);
        float _512 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[6].y, _508);
        float _514 = _502 + 1.0;
        float _516 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[6].z, _514);
        float _518 = rsqrt(_512);
        float _520 = fma(_334, (*spvDescriptorSet0.fp_c4)._m0[11].y, _174);
        float _522 = rsqrt(_516);
        float _524 = _518 * (*spvDescriptorSet0.fp_c3)._m0[20].x;
        float _526 = _518 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
        float _528 = _518 * (*spvDescriptorSet0.fp_c3)._m0[20].z;
        float _530 = fma(_510, (*spvDescriptorSet0.fp_c3)._m0[19].x, _524);
        float _532 = fma(_510, (*spvDescriptorSet0.fp_c3)._m0[19].y, _526);
        float _534 = fma(_510, (*spvDescriptorSet0.fp_c3)._m0[19].z, _528);
        float _536 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[21].x, _530);
        float _538 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[21].y, _532);
        float _540 = fma(_522, (*spvDescriptorSet0.fp_c3)._m0[21].z, _534);
        float _542 = _520 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
        float _544 = fma(_334, (*spvDescriptorSet0.fp_c4)._m0[11].x, _168);
        float _546 = fma(_334, (*spvDescriptorSet0.fp_c4)._m0[11].z, _176);
        float _548 = fma(_504, _536, _446);
        float _550 = fma(_504, _538, _442);
        float _552 = fma(_544, (*spvDescriptorSet0.fp_c4)._m0[0].x, _542);
        float _554 = fma(_504, _540, _452);
        float _556 = precise::min(_130, _334);
        float _558 = -_148;
        float _560 = _548 + _558;
        float _562 = fma(_546, (*spvDescriptorSet0.fp_c4)._m0[0].z, _552);
        float _564 = precise::min(_556, _148);
        float _566 = _562 * _562;
        float _568 = -_562;
        float _570 = _544 + _568;
        float _572 = -_562;
        float _574 = _520 + _572;
        float _576 = -_562;
        float _578 = _546 + _576;
        float _580 = 1.0 / _566;
        float _582 = precise::min(_580, 1.0);
        float _584 = _582 * _92;
        float _586 = _582 * _88;
        float _588 = _582 * _107;
        float _590 = exp2(_584);
        float _592 = exp2(_586);
        float _594 = exp2(_588);
        float _596 = fma(_574, _590, _562);
        float _598 = precise::max(0.0, _596);
        float _600 = fma(_570, _592, _562);
        float _602 = precise::max(_130, _334);
        float _604 = abs(_598);
        float _606 = log2(_604);
        float _608 = precise::max(_602, _148);
        float _610 = precise::max(0.0, _600);
        float _612 = fma(_578, _594, _562);
        float _614 = precise::max(_608, _74);
        float _616 = -_564;
        float _618 = _608 + _616;
        float _620 = -_334;
        float _622 = _554 + _620;
        float _624 = abs(_610);
        float _626 = log2(_624);
        float _628 = precise::max(0.0, _612);
        float _630 = precise::max(_618, _76);
        float _632 = _606 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
        float _634 = abs(_628);
        float _636 = log2(_634);
        float _638 = 1.0 / _614;
        float _640 = _626 * (*spvDescriptorSet0.fp_c4)._m0[4].x;
        float _642 = 1.0 / _630;
        float _644 = _636 * (*spvDescriptorSet0.fp_c4)._m0[4].z;
        float _646 = exp2(_632);
        float _648 = _638 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _650 = exp2(_640);
        float _652 = _642 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _654 = _648 * _652;
        float _656 = exp2(_644);
        float _658 = fma(_646, (*spvDescriptorSet0.fp_c4)._m0[2].y, (*spvDescriptorSet0.fp_c4)._m0[3].y);
        float _660 = fma(_650, (*spvDescriptorSet0.fp_c4)._m0[2].x, (*spvDescriptorSet0.fp_c4)._m0[3].x);
        float _662 = precise::min(_658, 8000.0);
        float _664 = fma(_656, (*spvDescriptorSet0.fp_c4)._m0[2].z, (*spvDescriptorSet0.fp_c4)._m0[3].z);
        float _666 = precise::max(_608, _82);
        float _668 = _662 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
        float _670 = precise::min(_660, 8000.0);
        float _672 = _662 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
        float _674 = _662 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
        float _676 = precise::min(_664, 8000.0);
        float _678 = 1.0 / _666;
        float _680 = fma(_670, (*spvDescriptorSet0.fp_c4)._m0[12].x, _668);
        float _682 = fma(_670, (*spvDescriptorSet0.fp_c4)._m0[12].y, _672);
        float _684 = fma(_670, (*spvDescriptorSet0.fp_c4)._m0[12].z, _674);
        float _686 = precise::max(_618, _84);
        float _688 = fma(_676, (*spvDescriptorSet0.fp_c4)._m0[14].x, _680);
        float _690 = fma(_676, (*spvDescriptorSet0.fp_c4)._m0[14].y, _682);
        float _692 = fma(_676, (*spvDescriptorSet0.fp_c4)._m0[14].z, _684);
        float _694 = 1.0 / _686;
        float _696 = precise::max(0.0, _690);
        float _698 = precise::max(0.0, _688);
        float _700 = precise::max(0.0, _692);
        float _702 = _678 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
        float _704 = precise::max(_696, _700);
        float _706 = precise::min(_696, _700);
        float _708 = precise::max(_698, _704);
        float _710 = precise::min(_698, _706);
        float _712 = _694 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
        float _714 = _696 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
        float _716 = -_710;
        float _718 = _708 + _716;
        float _720 = fma(_698, (*spvDescriptorSet0.fp_c4)._m0[15].x, _714);
        float _722 = _696 * (*spvDescriptorSet0.fp_c4)._m0[16].y;
        float _724 = _696 * (*spvDescriptorSet0.fp_c4)._m0[18].y;
        float _726 = _702 * _712;
        float _728 = precise::max(_718, _80);
        float _730 = fma(_698, (*spvDescriptorSet0.fp_c4)._m0[16].x, _722);
        float _732 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[15].z, _720);
        float _734 = -_130;
        float _736 = _550 + _734;
        float _738 = fma(_654, _560, _148);
        float _740 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[16].z, _730);
        float _742 = 1.0 / _728;
        float _744 = fma(_654, _736, _130);
        float _746 = fma(_654, _622, _334);
        float _748 = _732 + _740;
        float _750 = fma(_698, (*spvDescriptorSet0.fp_c4)._m0[18].x, _724);
        float _752 = _744 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _754 = _738 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _756 = _746 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _758 = precise::max(_748, _78);
        float _760 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[18].z, _750);
        float _762 = 1.0 / _758;
        float _764 = _762 * (*spvDescriptorSet0.fp_c4)._m0[7].x;
        float _766 = _760 * _764;
        float _768 = _742 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
        float _770 = _766 * _768;
        float _772 = _732 + 1.0;
        float _774 = _696 * (*spvDescriptorSet0.fp_c4)._m0[17].y;
        float _776 = fma(_770, (*spvDescriptorSet0.fp_c4)._m0[6].x, _772);
        float _778 = fma(_698, (*spvDescriptorSet0.fp_c4)._m0[17].x, _774);
        float _780 = _740 + 1.0;
        float _782 = rsqrt(_776);
        float _784 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[17].z, _778);
        float _786 = fma(_770, (*spvDescriptorSet0.fp_c4)._m0[6].y, _780);
        float _788 = _784 + 1.0;
        float _790 = rsqrt(_786);
        float _792 = fma(_770, (*spvDescriptorSet0.fp_c4)._m0[6].z, _788);
        float _794 = rsqrt(_792);
        float _796 = _790 * (*spvDescriptorSet0.fp_c4)._m0[20].x;
        float _798 = _790 * (*spvDescriptorSet0.fp_c4)._m0[20].y;
        float _800 = _790 * (*spvDescriptorSet0.fp_c4)._m0[20].z;
        float _802 = fma(_782, (*spvDescriptorSet0.fp_c4)._m0[19].x, _796);
        float _804 = fma(_782, (*spvDescriptorSet0.fp_c4)._m0[19].y, _798);
        float _806 = fma(_782, (*spvDescriptorSet0.fp_c4)._m0[19].z, _800);
        float _808 = fma(_794, (*spvDescriptorSet0.fp_c4)._m0[21].x, _802);
        float _810 = fma(_794, (*spvDescriptorSet0.fp_c4)._m0[21].y, _804);
        float _812 = fma(_794, (*spvDescriptorSet0.fp_c4)._m0[21].z, _806);
        float _814 = fma(_770, _808, _698);
        float _816 = fma(_770, _810, _696);
        float _818 = fma(_770, _812, _700);
        float _820 = -_148;
        float _822 = _814 + _820;
        float _824 = -_130;
        float _826 = _816 + _824;
        float _828 = -_334;
        float _830 = _818 + _828;
        float _832 = fma(_726, _822, _148);
        float _834 = fma(_726, _826, _130);
        float _836 = fma(_726, _830, _334);
        float _838 = -_754;
        float _840 = fma(_832, (*spvDescriptorSet0.fp_c4)._m0[5].x, _838);
        float _842 = -_752;
        float _844 = fma(_834, (*spvDescriptorSet0.fp_c4)._m0[5].y, _842);
        float _846 = -_756;
        float _848 = fma(_836, (*spvDescriptorSet0.fp_c4)._m0[5].z, _846);
        float _850 = fma(_840, (*spvDescriptorSet0.fp_c5)._m0[17].y, _754);
        float _852 = fma(_844, (*spvDescriptorSet0.fp_c5)._m0[17].y, _752);
        float _854 = fma(_848, (*spvDescriptorSet0.fp_c5)._m0[17].y, _756);
        bool _856 = !_318;
        int _858 = _290;
        int _860 = _282;
        int _862 = _274;
        int _864 = _266;
        int _866 = _250;
        int _868 = _258;
        int _870 = _266;
        int _872 = _274;
        int _874 = _282;
        int _876 = _290;
        int _878 = _298;
        int _880 = _306;
        int _882 = _292;
        int _884 = _284;
        int _886 = _276;
        int _888 = _268;
        int _890 = _252;
        int _892 = _260;
        int _894 = _268;
        int _896 = _276;
        int _898 = _284;
        int _900 = _292;
        int _902 = _300;
        int _904 = _308;
        int _906 = _294;
        int _908 = _286;
        int _910 = _278;
        int _912 = _270;
        int _914 = _254;
        int _916 = _262;
        int _918 = _270;
        int _920 = _278;
        int _922 = _286;
        int _924 = _294;
        int _926 = _302;
        int _928 = _310;
        int _930 = _296;
        int _932 = _288;
        int _934 = _280;
        int _936 = _272;
        int _938 = _256;
        int _940 = _264;
        int _942 = _272;
        int _944 = _280;
        int _946 = _288;
        int _948 = _296;
        int _950 = _304;
        int _952 = _312;
        if (!_856)
        {
            bool _954 = _248 >= 6;
            bool _956 = !_954;
            if (!_956)
            {
                bool _958 = _248 >= 7;
                bool _960 = !_958;
                if (!_960)
                {
                    bool _962 = _248 != 7;
                    _964 = _962;
                    if (!_964)
                    {
                        _880 = as_type<int>(_850);
                        _966 = true;
                    }
                }
                else
                {
                    _878 = as_type<int>(_850);
                    _966 = true;
                }
            }
            else
            {
                bool _968 = _248 >= 5;
                if (_968)
                {
                    _858 = as_type<int>(_850);
                }
                int _970 = _858;
                _876 = _970;
                if (!_968)
                {
                    _860 = as_type<int>(_850);
                }
                int _972 = _860;
                _874 = _972;
                _966 = true;
            }
        }
        if ((!_966) || _964)
        {
            if (!_964)
            {
                bool _974 = _248 >= 2;
                _976 = !_974;
            }
            if ((!_976) && (!_964))
            {
                bool _978 = _248 >= 3;
                if (_978)
                {
                    _862 = as_type<int>(_850);
                }
                int _980 = _862;
                _872 = _980;
                if (!_978)
                {
                    _864 = as_type<int>(_850);
                }
                int _982 = _864;
                _870 = _982;
                _966 = true;
            }
            else
            {
                if (!_964)
                {
                    bool _984 = _248 != 1;
                    _986 = !_984;
                }
                if ((!_986) || _964)
                {
                    _964 = false;
                    _866 = as_type<int>(_850);
                    _966 = true;
                }
                else
                {
                    _868 = as_type<int>(_850);
                }
            }
        }
        _966 = false;
        _988 = _866;
        _990 = _868;
        _992 = _870;
        _994 = _872;
        _996 = _874;
        _998 = _876;
        _1000 = _878;
        _1002 = _880;
        bool _1004 = !_318;
        _182 = _988;
        _190 = _990;
        _198 = _992;
        _206 = _994;
        _214 = _996;
        _222 = _998;
        _230 = _1000;
        _238 = _1002;
        if (!_1004)
        {
            bool _1006 = _248 >= 6;
            bool _1008 = !_1006;
            if (!_1008)
            {
                bool _1010 = _248 >= 7;
                bool _1012 = !_1010;
                if (!_1012)
                {
                    bool _1014 = _248 != 7;
                    _1016 = _1014;
                    if (!_1016)
                    {
                        _904 = as_type<int>(_852);
                        _1018 = true;
                    }
                }
                else
                {
                    _902 = as_type<int>(_852);
                    _1018 = true;
                }
            }
            else
            {
                bool _1020 = _248 >= 5;
                if (_1020)
                {
                    _882 = as_type<int>(_852);
                }
                int _1022 = _882;
                _900 = _1022;
                if (!_1020)
                {
                    _884 = as_type<int>(_852);
                }
                int _1024 = _884;
                _898 = _1024;
                _1018 = true;
            }
        }
        if ((!_1018) || _1016)
        {
            if (!_1016)
            {
                bool _1026 = _248 >= 2;
                _1028 = !_1026;
            }
            if ((!_1028) && (!_1016))
            {
                bool _1030 = _248 >= 3;
                if (_1030)
                {
                    _886 = as_type<int>(_852);
                }
                int _1032 = _886;
                _896 = _1032;
                if (!_1030)
                {
                    _888 = as_type<int>(_852);
                }
                int _1034 = _888;
                _894 = _1034;
                _1018 = true;
            }
            else
            {
                if (!_1016)
                {
                    bool _1036 = _248 != 1;
                    _1038 = !_1036;
                }
                if ((!_1038) || _1016)
                {
                    _1016 = false;
                    _890 = as_type<int>(_852);
                    _1018 = true;
                }
                else
                {
                    _892 = as_type<int>(_852);
                }
            }
        }
        _1018 = false;
        _1040 = _890;
        _1042 = _892;
        _1044 = _894;
        _1046 = _896;
        _1048 = _898;
        _1050 = _900;
        _1052 = _902;
        _1054 = _904;
        bool _1056 = !_318;
        _184 = _1040;
        _192 = _1042;
        _200 = _1044;
        _208 = _1046;
        _216 = _1048;
        _224 = _1050;
        _232 = _1052;
        _240 = _1054;
        if (!_1056)
        {
            bool _1058 = _248 >= 6;
            bool _1060 = !_1058;
            if (!_1060)
            {
                bool _1062 = _248 >= 7;
                bool _1064 = !_1062;
                if (!_1064)
                {
                    bool _1066 = _248 != 7;
                    _1068 = _1066;
                    if (!_1068)
                    {
                        _928 = as_type<int>(_854);
                        _1070 = true;
                    }
                }
                else
                {
                    _926 = as_type<int>(_854);
                    _1070 = true;
                }
            }
            else
            {
                bool _1072 = _248 >= 5;
                if (_1072)
                {
                    _906 = as_type<int>(_854);
                }
                int _1074 = _906;
                _924 = _1074;
                if (!_1072)
                {
                    _908 = as_type<int>(_854);
                }
                int _1076 = _908;
                _922 = _1076;
                _1070 = true;
            }
        }
        if ((!_1070) || _1068)
        {
            if (!_1068)
            {
                bool _1078 = _248 >= 2;
                _1080 = !_1078;
            }
            if ((!_1080) && (!_1068))
            {
                bool _1082 = _248 >= 3;
                if (_1082)
                {
                    _910 = as_type<int>(_854);
                }
                int _1084 = _910;
                _920 = _1084;
                if (!_1082)
                {
                    _912 = as_type<int>(_854);
                }
                int _1086 = _912;
                _918 = _1086;
                _1070 = true;
            }
            else
            {
                if (!_1068)
                {
                    bool _1088 = _248 != 1;
                    _1090 = !_1088;
                }
                if ((!_1090) || _1068)
                {
                    _1068 = false;
                    _914 = as_type<int>(_854);
                    _1070 = true;
                }
                else
                {
                    _916 = as_type<int>(_854);
                }
            }
        }
        _1070 = false;
        _1092 = _914;
        _1094 = _916;
        _1096 = _918;
        _1098 = _920;
        _1100 = _922;
        _1102 = _924;
        _1104 = _926;
        _1106 = _928;
        bool _1108 = !_318;
        _186 = _1092;
        _194 = _1094;
        _202 = _1096;
        _210 = _1098;
        _218 = _1100;
        _226 = _1102;
        _234 = _1104;
        _242 = _1106;
        if (!_1108)
        {
            bool _1110 = _248 >= 6;
            bool _1112 = !_1110;
            if (!_1112)
            {
                bool _1114 = _248 >= 7;
                bool _1116 = !_1114;
                if (!_1116)
                {
                    bool _1118 = _248 != 7;
                    _1120 = _1118;
                    if (!_1120)
                    {
                        _952 = 1065353216;
                        _1122 = true;
                    }
                }
                else
                {
                    _950 = 1065353216;
                    _1122 = true;
                }
            }
            else
            {
                bool _1124 = _248 >= 5;
                if (_1124)
                {
                    _930 = 1065353216;
                }
                int _1126 = _930;
                _948 = _1126;
                if (!_1124)
                {
                    _932 = 1065353216;
                }
                int _1128 = _932;
                _946 = _1128;
                _1122 = true;
            }
        }
        if ((!_1122) || _1120)
        {
            if (!_1120)
            {
                bool _1130 = _248 >= 2;
                _1132 = !_1130;
            }
            if ((!_1132) && (!_1120))
            {
                bool _1134 = _248 >= 3;
                if (_1134)
                {
                    _934 = 1065353216;
                }
                int _1136 = _934;
                _944 = _1136;
                if (!_1134)
                {
                    _936 = 1065353216;
                }
                int _1138 = _936;
                _942 = _1138;
                _1122 = true;
            }
            else
            {
                if (!_1120)
                {
                    bool _1140 = _248 != 1;
                    _1142 = !_1140;
                }
                if ((!_1142) || _1120)
                {
                    _1120 = false;
                    _938 = 1065353216;
                    _1122 = true;
                }
                else
                {
                    _940 = 1065353216;
                }
            }
        }
        _1122 = false;
        _1144 = _938;
        _1146 = _940;
        _1148 = _942;
        _1150 = _944;
        _1152 = _946;
        _1154 = _948;
        _1156 = _950;
        _1158 = _952;
        int _1160 = _248 + 1;
        int _1162 = _246 + 1;
        bool _1164 = _1160 >= 8;
        _178 = _1162;
        _180 = _1160;
        _188 = _1144;
        _196 = _1146;
        _204 = _1148;
        _212 = _1150;
        _220 = _1152;
        _228 = _1154;
        _236 = _1156;
        _244 = _1158;
        if (_1164)
        {
            _1166 = true;
            if (_1166)
            {
                break;
            }
        }
    } while (true);
    _1166 = false;
    out.m_29.x = as_type<float>(_988);
    out.m_29.y = as_type<float>(_1040);
    out.m_29.z = as_type<float>(_1092);
    out.m_29.w = as_type<float>(_1144);
    out.m_31.x = as_type<float>(_990);
    out.m_31.y = as_type<float>(_1042);
    out.m_31.z = as_type<float>(_1094);
    out.m_31.w = as_type<float>(_1146);
    out.m_33.x = as_type<float>(_992);
    out.m_33.y = as_type<float>(_1044);
    out.m_33.z = as_type<float>(_1096);
    out.m_33.w = as_type<float>(_1148);
    out.m_35.x = as_type<float>(_994);
    out.m_35.y = as_type<float>(_1046);
    out.m_35.z = as_type<float>(_1098);
    out.m_35.w = as_type<float>(_1150);
    out.m_37.x = as_type<float>(_996);
    out.m_37.y = as_type<float>(_1048);
    out.m_37.z = as_type<float>(_1100);
    out.m_37.w = as_type<float>(_1152);
    out.m_39.x = as_type<float>(_998);
    out.m_39.y = as_type<float>(_1050);
    out.m_39.z = as_type<float>(_1102);
    out.m_39.w = as_type<float>(_1154);
    out.m_41.x = as_type<float>(_1000);
    out.m_41.y = as_type<float>(_1052);
    out.m_41.z = as_type<float>(_1104);
    out.m_41.w = as_type<float>(_1156);
    out.m_43.x = as_type<float>(_1002);
    out.m_43.y = as_type<float>(_1054);
    out.m_43.z = as_type<float>(_1106);
    out.m_43.w = as_type<float>(_1158);
    return main0_out_u{as_type<uint4>(out.m_29), as_type<uint4>(out.m_31), as_type<uint4>(out.m_33), as_type<uint4>(out.m_35), as_type<uint4>(out.m_37), as_type<uint4>(out.m_39), as_type<uint4>(out.m_41), as_type<uint4>(out.m_43)};
}

