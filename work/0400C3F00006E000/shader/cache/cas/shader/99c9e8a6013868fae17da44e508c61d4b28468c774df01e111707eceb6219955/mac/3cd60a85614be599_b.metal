#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
    constant _16* vp_c5 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
};

struct main0_out
{
    float4 m_32 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
    float4 m_36 [[user(locn2)]];
    float4 m_38 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_29 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = as_type<float>(int(gl_VertexIndex));
    float _54 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _56 = in.m_29.x;
    float _58 = in.m_29.y;
    float _60 = precise::max((*spvDescriptorSet0.vp_c5)._m0[0].w, 9.9999997473787516355514526367188e-05);
    float _62 = in.m_29.z;
    float _64 = 1.0 / _60;
    float _66 = _54 * (*spvDescriptorSet0.vp_c5)._m0[1].w;
    float _68 = abs(_66);
    float _70 = log2(_68);
    uint _73 = uint(int(uint(as_type<int>(_52)) >> uint(16)));
    int _76 = 61 ^ as_type<int>(_52);
    int _78 = int(_73) ^ _76;
    float _80 = _56 * 0.15915493667125701904296875;
    int _82 = _78 << 3;
    int _84 = _82 + _78;
    float _86 = _58 * 0.15915493667125701904296875;
    float _88 = _80 * 6.283185482025146484375;
    float _90 = sin(_88);
    uint _92 = uint(int(uint(_84) >> uint(4)));
    bool _96 = _62 >= (*spvDescriptorSet0.vp_c5)._m0[0].z;
    float _98 = _70 * (*spvDescriptorSet0.vp_c5)._m0[1].z;
    int _100 = _84 ^ int(_92);
    float _102 = _86 * 6.283185482025146484375;
    float _104 = cos(_102);
    int _106 = _100 * 668265261;
    uint _108 = uint(int(uint(_106) >> uint(15)));
    float _110 = exp2(_98);
    int _112 = _106 ^ int(_108);
    int _114 = _112 << 13;
    int _116 = _112 ^ _114;
    uint _118 = uint(int(uint(_116) >> uint(17)));
    int _120 = _116 ^ int(_118);
    int _122 = _120 << 5;
    int _124 = _120 ^ _122;
    int _126 = _124 << 13;
    float _128 = float(uint(_124));
    int _130 = _124 ^ _126;
    float _132 = _128 * 2.3283064365386962890625e-10;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    uint _136 = uint(int(uint(_130) >> uint(17)));
    float _138 = 1.0 / (*spvDescriptorSet0.vp_c5)._m0[0].y;
    int _140 = _130 ^ int(_136);
    float _142 = precise::max(_134, 9.9999997473787516355514526367188e-05);
    int _144 = _140 << 5;
    float _146 = log2(_142);
    int _148 = _140 ^ _144;
    float _150 = float(uint(_148));
    float _152 = _150 * 2.3283064365386962890625e-10;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = precise::max(_154, 9.9999997473787516355514526367188e-05);
    float _158 = _146 * (-1.38629436492919921875);
    float _160 = _80 * 6.283185482025146484375;
    float _162 = cos(_160);
    float _164 = _156 * 6.283185482025146484375;
    float _166 = _164 * 0.15915493667125701904296875;
    float _168 = sqrt(_158);
    float _170 = _166 * 6.283185482025146484375;
    float _172 = cos(_170);
    float _174 = _158;
    float _176 = _64;
    float _178 = _162;
    float _180 = _156;
    if (_96)
    {
        float _182 = 0.0 + _62;
        float _184 = precise::clamp(_182, 0.0, 1.0);
        _174 = _184;
    }
    float _186 = _174;
    float _188 = _86 * 6.283185482025146484375;
    float _190 = sin(_188);
    float _192 = _168 * _172;
    float _194 = fma(_192, (*spvDescriptorSet0.vp_c3)._m0[8].y, 0.5);
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _162 * _64;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _186;
    if (_96)
    {
        _176 = _186;
    }
    float _204 = _176;
    float _206 = abs(_196);
    float _208 = log2(_206);
    float _210 = abs(_200);
    float _212 = log2(_210);
    float _214 = _208 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    float _216 = exp2(_214);
    float _218 = _204;
    if (!_96)
    {
        int _220 = _148 << 13;
        int _222 = _148 ^ _220;
        uint _224 = uint(int(uint(_222) >> uint(17)));
        float _226 = (*spvDescriptorSet0.vp_c3)._m0[8].w * (-2.0);
        int _228 = _222 ^ int(_224);
        float _230 = log2(_156);
        int _232 = _228 << 5;
        int _234 = _228 ^ _232;
        float _236 = float(uint(_234));
        float _238 = _236 * 2.3283064365386962890625e-10;
        float _240 = precise::clamp(_238, 0.0, 1.0);
        float _242 = _230 * (-1.38629436492919921875);
        float _244 = precise::max(_240, 9.9999997473787516355514526367188e-05);
        float _246 = sqrt(_242);
        float _248 = _244 * 6.283185482025146484375;
        float _250 = _248 * 0.15915493667125701904296875;
        float _252 = _250 * 6.283185482025146484375;
        float _254 = cos(_252);
        float _256 = _246 * _254;
        float _258 = _168 * _254;
        float _260 = (*spvDescriptorSet0.vp_c3)._m0[8].z * (-2.0);
        float _262 = (*spvDescriptorSet0.vp_c3)._m0[8].z * 2.0;
        float _264 = _256 * (*spvDescriptorSet0.vp_c3)._m0[8].z;
        float _266 = _258 * (*spvDescriptorSet0.vp_c3)._m0[8].w;
        float _268 = precise::max(_264, _260);
        float _270 = (*spvDescriptorSet0.vp_c3)._m0[8].w * 2.0;
        float _272 = precise::max(_266, _226);
        float _274 = precise::min(_262, _268);
        float _276 = precise::min(_270, _272);
        float _278 = _274 + _62;
        float _280 = _276 + _62;
        float _282 = precise::max(0.0, _278);
        float _284 = precise::max(0.0, _280);
        float _286 = precise::min(_282, (*spvDescriptorSet0.vp_c5)._m0[0].z);
        float _288 = precise::min(_284, (*spvDescriptorSet0.vp_c5)._m0[0].z);
        _218 = _288;
        _202 = _286;
    }
    float _290 = _218;
    float _292 = _202;
    float _294 = abs(_290);
    float _296 = log2(_294);
    float _298 = _90 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _300 = fma(_216, 14200.0, 1800.0);
    float _302 = _104 * _298;
    float _304 = _190 * _298;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c5)._m0[2].w;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c5)._m0[2].w);
    bool _314 = _310 || _312;
    float _316 = _302 * _302;
    float _318 = 1.0 / _300;
    float _320 = _304 * _304;
    float _322 = _316 + _320;
    float _324 = _110 * _296;
    float _326 = sqrt(_322);
    float _328 = _318 * 29653.09375;
    float _330 = _318 * 38016.78515625;
    float _332 = _318 * 47608.17578125;
    float _334 = exp2(_324);
    bool _336 = _326 > (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _338 = exp2(_328);
    float _340 = exp2(_330);
    bool _342 = _334 > (*spvDescriptorSet0.vp_c5)._m0[3].x;
    bool _344 = _342 && _314;
    bool _346 = _334 < (*spvDescriptorSet0.vp_c5)._m0[3].y;
    bool _348 = _346 && _344;
    float _350 = exp2(_332);
    float _352 = fma(_338, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    bool _354 = _142 < (*spvDescriptorSet0.vp_c5)._m0[2].w;
    bool _356 = _354 && _348;
    float _358 = (*spvDescriptorSet0.vp_c4)._m0[0].y + (-220.0);
    float _360 = fma(_340, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _362 = 1.0 / _352;
    float _364 = precise::max(0.0, _358);
    float _366 = fma(_350, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _368 = 1.0 / _360;
    float _370 = -_364;
    float _372 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[0].w, _370);
    float _374 = (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _376 = _364;
    float _378 = _302;
    float _380 = _304;
    if (!_356)
    {
        _374 = _334;
    }
    float _382 = _374;
    float _384 = 1.0 / _366;
    bool _386 = !_356;
    float _388 = _382;
    if (!_386)
    {
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c5)._m0[2].y;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c5)._m0[2].x, _156);
        float _394 = _392 * 6.283185482025146484375;
        float _396 = _394 * 0.15915493667125701904296875;
        float _398 = _396 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c5)._m0[2].z, 1.0);
        float _404 = precise::max(0.0, _402);
        float _406 = _334 * _404;
        _178 = (*spvDescriptorSet0.vp_c5)._m0[2].z;
        _376 = _404;
        _180 = _396;
        _388 = _406;
    }
    float _408 = _178;
    float _410 = _376;
    float _412 = _180;
    float _414 = _388;
    float _416 = _412;
    float _418 = _408;
    float _420 = _410;
    if (!_336)
    {
        _416 = _320;
    }
    float _422 = _416;
    float _424 = _422;
    if (!_336)
    {
        _418 = _316;
    }
    float _426 = _418;
    float _428 = _426;
    if (!_336)
    {
        _420 = _372;
    }
    float _430 = _420;
    bool _432 = !_336;
    float _434 = _430;
    if (!_432)
    {
        float _436 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _438 = -(*spvDescriptorSet0.vp_c4)._m0[1].x;
        float _440 = _326 + _438;
        float _442 = _372 + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _444 = rsqrt(_322);
        float _446 = _440 * _436;
        float _448 = _446 * 0.15915493667125701904296875;
        float _450 = _448 * 6.283185482025146484375;
        float _452 = sin(_450);
        float _454 = _448 * 6.283185482025146484375;
        float _456 = cos(_454);
        float _458 = fma(_452, _442, (*spvDescriptorSet0.vp_c4)._m0[1].x);
        float _460 = _444 * _458;
        float _462 = _456 + (-1.0);
        float _464 = _302 * _460;
        float _466 = _304 * _460;
        float _468 = _462 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _470 = _466 * _466;
        float _472 = fma(_372, _456, _468);
        float _474 = _464 * _464;
        _434 = _472;
        _428 = _474;
        _424 = _470;
        _378 = _464;
        _380 = _466;
    }
    float _476 = _434;
    float _478 = _428;
    float _480 = _424;
    float _482 = _378;
    float _484 = _380;
    float _486 = fma(_476, _476, _478);
    float _488 = _212 * (*spvDescriptorSet0.vp_c5)._m0[1].x;
    float _490 = _368 * 4.9924825491034901066866337467265e-24;
    float _492 = _384 * 4.9924825491034901066866337467265e-24;
    float _494 = _486 + _480;
    int _496 = ~as_type<int>(_52);
    int _498 = _496 + as_type<int>((*spvDescriptorSet0.vp_c5)._m0[0].x);
    int _500 = _498 + 1;
    float _502 = _362 * 4.9924825491034901066866337467265e-24;
    float _504 = exp2(_488);
    float _506 = precise::max(_490, _492);
    float _508 = _292 * (*spvDescriptorSet0.vp_c3)._m0[7].z;
    int _510 = abs(_500);
    float _512 = precise::max(_502, _506);
    float _514 = float(_510);
    float _516 = rsqrt(_494);
    bool _518 = _512 != 0.0;
    bool _520 = isnan(_512);
    bool _522 = _518 || _520;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    float _528 = _514 * _138;
    float _530 = precise::clamp(_528, 0.0, 1.0);
    float _532 = _530 * _504;
    float _534 = -(*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_32.x = _532;
    float _538 = _384;
    if (_526)
    {
        float _540 = 1.0 / _512;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = fma(_536, _414, (*spvDescriptorSet0.vp_c3)._m0[7].x);
    float _546 = _516 * _476;
    float _548 = _516 * _482;
    float _550 = _516 * _484;
    float _552 = _546 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _554 = _546 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _556 = ceil(_508);
    float _558 = fma(_548, (*spvDescriptorSet0.vp_c3)._m0[3].x, _552);
    float _560 = _546 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c3)._m0[0].x, _554);
    float _564 = _546;
    float _566 = _554;
    float _568 = _558;
    if (!_526)
    {
        _564 = 1.0;
    }
    float _570 = _564;
    float _572 = fma(_550, (*spvDescriptorSet0.vp_c3)._m0[3].z, _558);
    float _574 = fma(_548, (*spvDescriptorSet0.vp_c3)._m0[1].x, _560);
    float _576 = _570;
    if (!_526)
    {
        _566 = 1.0;
    }
    float _578 = _566;
    float _580 = _578;
    if (_526)
    {
        float _582 = _502 * _542;
        _576 = _582;
    }
    float _584 = _576;
    float _586 = 1.0 / _572;
    if (!_526)
    {
        _568 = 1.0;
    }
    float _588 = _568;
    float _590 = _588;
    if (_526)
    {
        float _592 = _490 * _542;
        _580 = _592;
    }
    float _594 = _580;
    if (_526)
    {
        float _596 = _492 * _542;
        _590 = _596;
    }
    float _598 = _590;
    float _600 = fma(_550, (*spvDescriptorSet0.vp_c3)._m0[0].z, _562);
    bool _602 = _572 > 0.0;
    float _604 = fma(_550, (*spvDescriptorSet0.vp_c3)._m0[1].z, _574);
    float _606 = _544 * _598;
    float _608 = fma(_556, 0.5, 0.5);
    float _610 = _544 * _584;
    float _612 = _544 * _594;
    float _614 = _508 * 0.5;
    float _616 = _556 + 1.0;
    int _618 = _602 ? 1065353216 : (-1073741824);
    float _620 = _600 * _586;
    float _622 = _604 * _586;
    out.m_34.x = _614;
    out.gl_PointSize = _616;
    out.m_36.x = _608;
    out.m_38.x = _610;
    out.m_38.y = _612;
    out.m_38.z = _606;
    out.gl_Position.x = _620;
    out.gl_Position.y = _622;
    float _1466 = as_type<float>(_618);
    out.gl_Position.z = _1466;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = as_type<float>(int(gl_VertexIndex));
    float _54 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _56 = in.m_29.x;
    float _58 = in.m_29.y;
    float _60 = precise::max((*spvDescriptorSet0.vp_c5)._m0[0].w, 9.9999997473787516355514526367188e-05);
    float _62 = in.m_29.z;
    float _64 = 1.0 / _60;
    float _66 = _54 * (*spvDescriptorSet0.vp_c5)._m0[1].w;
    float _68 = abs(_66);
    float _70 = log2(_68);
    uint _73 = uint(int(uint(as_type<int>(_52)) >> uint(16)));
    int _76 = 61 ^ as_type<int>(_52);
    int _78 = int(_73) ^ _76;
    float _80 = _56 * 0.15915493667125701904296875;
    int _82 = _78 << 3;
    int _84 = _82 + _78;
    float _86 = _58 * 0.15915493667125701904296875;
    float _88 = _80 * 6.283185482025146484375;
    float _90 = sin(_88);
    uint _92 = uint(int(uint(_84) >> uint(4)));
    bool _96 = _62 >= (*spvDescriptorSet0.vp_c5)._m0[0].z;
    float _98 = _70 * (*spvDescriptorSet0.vp_c5)._m0[1].z;
    int _100 = _84 ^ int(_92);
    float _102 = _86 * 6.283185482025146484375;
    float _104 = cos(_102);
    int _106 = _100 * 668265261;
    uint _108 = uint(int(uint(_106) >> uint(15)));
    float _110 = exp2(_98);
    int _112 = _106 ^ int(_108);
    int _114 = _112 << 13;
    int _116 = _112 ^ _114;
    uint _118 = uint(int(uint(_116) >> uint(17)));
    int _120 = _116 ^ int(_118);
    int _122 = _120 << 5;
    int _124 = _120 ^ _122;
    int _126 = _124 << 13;
    float _128 = float(uint(_124));
    int _130 = _124 ^ _126;
    float _132 = _128 * 2.3283064365386962890625e-10;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    uint _136 = uint(int(uint(_130) >> uint(17)));
    float _138 = 1.0 / (*spvDescriptorSet0.vp_c5)._m0[0].y;
    int _140 = _130 ^ int(_136);
    float _142 = precise::max(_134, 9.9999997473787516355514526367188e-05);
    int _144 = _140 << 5;
    float _146 = log2(_142);
    int _148 = _140 ^ _144;
    float _150 = float(uint(_148));
    float _152 = _150 * 2.3283064365386962890625e-10;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = precise::max(_154, 9.9999997473787516355514526367188e-05);
    float _158 = _146 * (-1.38629436492919921875);
    float _160 = _80 * 6.283185482025146484375;
    float _162 = cos(_160);
    float _164 = _156 * 6.283185482025146484375;
    float _166 = _164 * 0.15915493667125701904296875;
    float _168 = sqrt(_158);
    float _170 = _166 * 6.283185482025146484375;
    float _172 = cos(_170);
    float _174 = _158;
    float _176 = _64;
    float _178 = _162;
    float _180 = _156;
    if (_96)
    {
        float _182 = 0.0 + _62;
        float _184 = precise::clamp(_182, 0.0, 1.0);
        _174 = _184;
    }
    float _186 = _174;
    float _188 = _86 * 6.283185482025146484375;
    float _190 = sin(_188);
    float _192 = _168 * _172;
    float _194 = fma(_192, (*spvDescriptorSet0.vp_c3)._m0[8].y, 0.5);
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _162 * _64;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _186;
    if (_96)
    {
        _176 = _186;
    }
    float _204 = _176;
    float _206 = abs(_196);
    float _208 = log2(_206);
    float _210 = abs(_200);
    float _212 = log2(_210);
    float _214 = _208 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    float _216 = exp2(_214);
    float _218 = _204;
    if (!_96)
    {
        int _220 = _148 << 13;
        int _222 = _148 ^ _220;
        uint _224 = uint(int(uint(_222) >> uint(17)));
        float _226 = (*spvDescriptorSet0.vp_c3)._m0[8].w * (-2.0);
        int _228 = _222 ^ int(_224);
        float _230 = log2(_156);
        int _232 = _228 << 5;
        int _234 = _228 ^ _232;
        float _236 = float(uint(_234));
        float _238 = _236 * 2.3283064365386962890625e-10;
        float _240 = precise::clamp(_238, 0.0, 1.0);
        float _242 = _230 * (-1.38629436492919921875);
        float _244 = precise::max(_240, 9.9999997473787516355514526367188e-05);
        float _246 = sqrt(_242);
        float _248 = _244 * 6.283185482025146484375;
        float _250 = _248 * 0.15915493667125701904296875;
        float _252 = _250 * 6.283185482025146484375;
        float _254 = cos(_252);
        float _256 = _246 * _254;
        float _258 = _168 * _254;
        float _260 = (*spvDescriptorSet0.vp_c3)._m0[8].z * (-2.0);
        float _262 = (*spvDescriptorSet0.vp_c3)._m0[8].z * 2.0;
        float _264 = _256 * (*spvDescriptorSet0.vp_c3)._m0[8].z;
        float _266 = _258 * (*spvDescriptorSet0.vp_c3)._m0[8].w;
        float _268 = precise::max(_264, _260);
        float _270 = (*spvDescriptorSet0.vp_c3)._m0[8].w * 2.0;
        float _272 = precise::max(_266, _226);
        float _274 = precise::min(_262, _268);
        float _276 = precise::min(_270, _272);
        float _278 = _274 + _62;
        float _280 = _276 + _62;
        float _282 = precise::max(0.0, _278);
        float _284 = precise::max(0.0, _280);
        float _286 = precise::min(_282, (*spvDescriptorSet0.vp_c5)._m0[0].z);
        float _288 = precise::min(_284, (*spvDescriptorSet0.vp_c5)._m0[0].z);
        _218 = _288;
        _202 = _286;
    }
    float _290 = _218;
    float _292 = _202;
    float _294 = abs(_290);
    float _296 = log2(_294);
    float _298 = _90 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _300 = fma(_216, 14200.0, 1800.0);
    float _302 = _104 * _298;
    float _304 = _190 * _298;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c5)._m0[2].w;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c5)._m0[2].w);
    bool _314 = _310 || _312;
    float _316 = _302 * _302;
    float _318 = 1.0 / _300;
    float _320 = _304 * _304;
    float _322 = _316 + _320;
    float _324 = _110 * _296;
    float _326 = sqrt(_322);
    float _328 = _318 * 29653.09375;
    float _330 = _318 * 38016.78515625;
    float _332 = _318 * 47608.17578125;
    float _334 = exp2(_324);
    bool _336 = _326 > (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _338 = exp2(_328);
    float _340 = exp2(_330);
    bool _342 = _334 > (*spvDescriptorSet0.vp_c5)._m0[3].x;
    bool _344 = _342 && _314;
    bool _346 = _334 < (*spvDescriptorSet0.vp_c5)._m0[3].y;
    bool _348 = _346 && _344;
    float _350 = exp2(_332);
    float _352 = fma(_338, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    bool _354 = _142 < (*spvDescriptorSet0.vp_c5)._m0[2].w;
    bool _356 = _354 && _348;
    float _358 = (*spvDescriptorSet0.vp_c4)._m0[0].y + (-220.0);
    float _360 = fma(_340, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _362 = 1.0 / _352;
    float _364 = precise::max(0.0, _358);
    float _366 = fma(_350, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _368 = 1.0 / _360;
    float _370 = -_364;
    float _372 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[0].w, _370);
    float _374 = (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _376 = _364;
    float _378 = _302;
    float _380 = _304;
    if (!_356)
    {
        _374 = _334;
    }
    float _382 = _374;
    float _384 = 1.0 / _366;
    bool _386 = !_356;
    float _388 = _382;
    if (!_386)
    {
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c5)._m0[2].y;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c5)._m0[2].x, _156);
        float _394 = _392 * 6.283185482025146484375;
        float _396 = _394 * 0.15915493667125701904296875;
        float _398 = _396 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c5)._m0[2].z, 1.0);
        float _404 = precise::max(0.0, _402);
        float _406 = _334 * _404;
        _178 = (*spvDescriptorSet0.vp_c5)._m0[2].z;
        _376 = _404;
        _180 = _396;
        _388 = _406;
    }
    float _408 = _178;
    float _410 = _376;
    float _412 = _180;
    float _414 = _388;
    float _416 = _412;
    float _418 = _408;
    float _420 = _410;
    if (!_336)
    {
        _416 = _320;
    }
    float _422 = _416;
    float _424 = _422;
    if (!_336)
    {
        _418 = _316;
    }
    float _426 = _418;
    float _428 = _426;
    if (!_336)
    {
        _420 = _372;
    }
    float _430 = _420;
    bool _432 = !_336;
    float _434 = _430;
    if (!_432)
    {
        float _436 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _438 = -(*spvDescriptorSet0.vp_c4)._m0[1].x;
        float _440 = _326 + _438;
        float _442 = _372 + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _444 = rsqrt(_322);
        float _446 = _440 * _436;
        float _448 = _446 * 0.15915493667125701904296875;
        float _450 = _448 * 6.283185482025146484375;
        float _452 = sin(_450);
        float _454 = _448 * 6.283185482025146484375;
        float _456 = cos(_454);
        float _458 = fma(_452, _442, (*spvDescriptorSet0.vp_c4)._m0[1].x);
        float _460 = _444 * _458;
        float _462 = _456 + (-1.0);
        float _464 = _302 * _460;
        float _466 = _304 * _460;
        float _468 = _462 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _470 = _466 * _466;
        float _472 = fma(_372, _456, _468);
        float _474 = _464 * _464;
        _434 = _472;
        _428 = _474;
        _424 = _470;
        _378 = _464;
        _380 = _466;
    }
    float _476 = _434;
    float _478 = _428;
    float _480 = _424;
    float _482 = _378;
    float _484 = _380;
    float _486 = fma(_476, _476, _478);
    float _488 = _212 * (*spvDescriptorSet0.vp_c5)._m0[1].x;
    float _490 = _368 * 4.9924825491034901066866337467265e-24;
    float _492 = _384 * 4.9924825491034901066866337467265e-24;
    float _494 = _486 + _480;
    int _496 = ~as_type<int>(_52);
    int _498 = _496 + as_type<int>((*spvDescriptorSet0.vp_c5)._m0[0].x);
    int _500 = _498 + 1;
    float _502 = _362 * 4.9924825491034901066866337467265e-24;
    float _504 = exp2(_488);
    float _506 = precise::max(_490, _492);
    float _508 = _292 * (*spvDescriptorSet0.vp_c3)._m0[7].z;
    int _510 = abs(_500);
    float _512 = precise::max(_502, _506);
    float _514 = float(_510);
    float _516 = rsqrt(_494);
    bool _518 = _512 != 0.0;
    bool _520 = isnan(_512);
    bool _522 = _518 || _520;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    float _528 = _514 * _138;
    float _530 = precise::clamp(_528, 0.0, 1.0);
    float _532 = _530 * _504;
    float _534 = -(*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_32.x = _532;
    float _538 = _384;
    if (_526)
    {
        float _540 = 1.0 / _512;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = fma(_536, _414, (*spvDescriptorSet0.vp_c3)._m0[7].x);
    float _546 = _516 * _476;
    float _548 = _516 * _482;
    float _550 = _516 * _484;
    float _552 = _546 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _554 = _546 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _556 = ceil(_508);
    float _558 = fma(_548, (*spvDescriptorSet0.vp_c3)._m0[3].x, _552);
    float _560 = _546 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c3)._m0[0].x, _554);
    float _564 = _546;
    float _566 = _554;
    float _568 = _558;
    if (!_526)
    {
        _564 = 1.0;
    }
    float _570 = _564;
    float _572 = fma(_550, (*spvDescriptorSet0.vp_c3)._m0[3].z, _558);
    float _574 = fma(_548, (*spvDescriptorSet0.vp_c3)._m0[1].x, _560);
    float _576 = _570;
    if (!_526)
    {
        _566 = 1.0;
    }
    float _578 = _566;
    float _580 = _578;
    if (_526)
    {
        float _582 = _502 * _542;
        _576 = _582;
    }
    float _584 = _576;
    float _586 = 1.0 / _572;
    if (!_526)
    {
        _568 = 1.0;
    }
    float _588 = _568;
    float _590 = _588;
    if (_526)
    {
        float _592 = _490 * _542;
        _580 = _592;
    }
    float _594 = _580;
    if (_526)
    {
        float _596 = _492 * _542;
        _590 = _596;
    }
    float _598 = _590;
    float _600 = fma(_550, (*spvDescriptorSet0.vp_c3)._m0[0].z, _562);
    bool _602 = _572 > 0.0;
    float _604 = fma(_550, (*spvDescriptorSet0.vp_c3)._m0[1].z, _574);
    float _606 = _544 * _598;
    float _608 = fma(_556, 0.5, 0.5);
    float _610 = _544 * _584;
    float _612 = _544 * _594;
    float _614 = _508 * 0.5;
    float _616 = _556 + 1.0;
    int _618 = _602 ? 1065353216 : (-1073741824);
    float _620 = _600 * _586;
    float _622 = _604 * _586;
    out.m_34.x = _614;
    out.gl_PointSize = _616;
    out.m_36.x = _608;
    out.m_38.x = _610;
    out.m_38.y = _612;
    out.m_38.z = _606;
    out.gl_Position.x = _620;
    out.gl_Position.y = _622;
    float _1466 = as_type<float>(_618);
    out.gl_Position.z = _1466;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = as_type<float>(int(gl_VertexIndex));
    float _54 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _56 = in.m_29.x;
    float _58 = in.m_29.y;
    float _60 = precise::max((*spvDescriptorSet0.vp_c5)._m0[0].w, 9.9999997473787516355514526367188e-05);
    float _62 = in.m_29.z;
    float _64 = 1.0 / _60;
    float _66 = _54 * (*spvDescriptorSet0.vp_c5)._m0[1].w;
    float _68 = abs(_66);
    float _70 = log2(_68);
    uint _73 = uint(int(uint(as_type<int>(_52)) >> uint(16)));
    int _76 = 61 ^ as_type<int>(_52);
    int _78 = int(_73) ^ _76;
    float _80 = _56 * 0.15915493667125701904296875;
    int _82 = _78 << 3;
    int _84 = _82 + _78;
    float _86 = _58 * 0.15915493667125701904296875;
    float _88 = _80 * 6.283185482025146484375;
    float _90 = sin(_88);
    uint _92 = uint(int(uint(_84) >> uint(4)));
    bool _96 = _62 >= (*spvDescriptorSet0.vp_c5)._m0[0].z;
    float _98 = _70 * (*spvDescriptorSet0.vp_c5)._m0[1].z;
    int _100 = _84 ^ int(_92);
    float _102 = _86 * 6.283185482025146484375;
    float _104 = cos(_102);
    int _106 = _100 * 668265261;
    uint _108 = uint(int(uint(_106) >> uint(15)));
    float _110 = exp2(_98);
    int _112 = _106 ^ int(_108);
    int _114 = _112 << 13;
    int _116 = _112 ^ _114;
    uint _118 = uint(int(uint(_116) >> uint(17)));
    int _120 = _116 ^ int(_118);
    int _122 = _120 << 5;
    int _124 = _120 ^ _122;
    int _126 = _124 << 13;
    float _128 = float(uint(_124));
    int _130 = _124 ^ _126;
    float _132 = _128 * 2.3283064365386962890625e-10;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    uint _136 = uint(int(uint(_130) >> uint(17)));
    float _138 = 1.0 / (*spvDescriptorSet0.vp_c5)._m0[0].y;
    int _140 = _130 ^ int(_136);
    float _142 = precise::max(_134, 9.9999997473787516355514526367188e-05);
    int _144 = _140 << 5;
    float _146 = log2(_142);
    int _148 = _140 ^ _144;
    float _150 = float(uint(_148));
    float _152 = _150 * 2.3283064365386962890625e-10;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = precise::max(_154, 9.9999997473787516355514526367188e-05);
    float _158 = _146 * (-1.38629436492919921875);
    float _160 = _80 * 6.283185482025146484375;
    float _162 = cos(_160);
    float _164 = _156 * 6.283185482025146484375;
    float _166 = _164 * 0.15915493667125701904296875;
    float _168 = sqrt(_158);
    float _170 = _166 * 6.283185482025146484375;
    float _172 = cos(_170);
    float _174 = _158;
    float _176 = _64;
    float _178 = _162;
    float _180 = _156;
    if (_96)
    {
        float _182 = 0.0 + _62;
        float _184 = precise::clamp(_182, 0.0, 1.0);
        _174 = _184;
    }
    float _186 = _174;
    float _188 = _86 * 6.283185482025146484375;
    float _190 = sin(_188);
    float _192 = _168 * _172;
    float _194 = fma(_192, (*spvDescriptorSet0.vp_c3)._m0[8].y, 0.5);
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _162 * _64;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _186;
    if (_96)
    {
        _176 = _186;
    }
    float _204 = _176;
    float _206 = abs(_196);
    float _208 = log2(_206);
    float _210 = abs(_200);
    float _212 = log2(_210);
    float _214 = _208 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    float _216 = exp2(_214);
    float _218 = _204;
    if (!_96)
    {
        int _220 = _148 << 13;
        int _222 = _148 ^ _220;
        uint _224 = uint(int(uint(_222) >> uint(17)));
        float _226 = (*spvDescriptorSet0.vp_c3)._m0[8].w * (-2.0);
        int _228 = _222 ^ int(_224);
        float _230 = log2(_156);
        int _232 = _228 << 5;
        int _234 = _228 ^ _232;
        float _236 = float(uint(_234));
        float _238 = _236 * 2.3283064365386962890625e-10;
        float _240 = precise::clamp(_238, 0.0, 1.0);
        float _242 = _230 * (-1.38629436492919921875);
        float _244 = precise::max(_240, 9.9999997473787516355514526367188e-05);
        float _246 = sqrt(_242);
        float _248 = _244 * 6.283185482025146484375;
        float _250 = _248 * 0.15915493667125701904296875;
        float _252 = _250 * 6.283185482025146484375;
        float _254 = cos(_252);
        float _256 = _246 * _254;
        float _258 = _168 * _254;
        float _260 = (*spvDescriptorSet0.vp_c3)._m0[8].z * (-2.0);
        float _262 = (*spvDescriptorSet0.vp_c3)._m0[8].z * 2.0;
        float _264 = _256 * (*spvDescriptorSet0.vp_c3)._m0[8].z;
        float _266 = _258 * (*spvDescriptorSet0.vp_c3)._m0[8].w;
        float _268 = precise::max(_264, _260);
        float _270 = (*spvDescriptorSet0.vp_c3)._m0[8].w * 2.0;
        float _272 = precise::max(_266, _226);
        float _274 = precise::min(_262, _268);
        float _276 = precise::min(_270, _272);
        float _278 = _274 + _62;
        float _280 = _276 + _62;
        float _282 = precise::max(0.0, _278);
        float _284 = precise::max(0.0, _280);
        float _286 = precise::min(_282, (*spvDescriptorSet0.vp_c5)._m0[0].z);
        float _288 = precise::min(_284, (*spvDescriptorSet0.vp_c5)._m0[0].z);
        _218 = _288;
        _202 = _286;
    }
    float _290 = _218;
    float _292 = _202;
    float _294 = abs(_290);
    float _296 = log2(_294);
    float _298 = _90 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _300 = fma(_216, 14200.0, 1800.0);
    float _302 = _104 * _298;
    float _304 = _190 * _298;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c5)._m0[2].w;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c5)._m0[2].w);
    bool _314 = _310 || _312;
    float _316 = _302 * _302;
    float _318 = 1.0 / _300;
    float _320 = _304 * _304;
    float _322 = _316 + _320;
    float _324 = _110 * _296;
    float _326 = sqrt(_322);
    float _328 = _318 * 29653.09375;
    float _330 = _318 * 38016.78515625;
    float _332 = _318 * 47608.17578125;
    float _334 = exp2(_324);
    bool _336 = _326 > (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _338 = exp2(_328);
    float _340 = exp2(_330);
    bool _342 = _334 > (*spvDescriptorSet0.vp_c5)._m0[3].x;
    bool _344 = _342 && _314;
    bool _346 = _334 < (*spvDescriptorSet0.vp_c5)._m0[3].y;
    bool _348 = _346 && _344;
    float _350 = exp2(_332);
    float _352 = fma(_338, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    bool _354 = _142 < (*spvDescriptorSet0.vp_c5)._m0[2].w;
    bool _356 = _354 && _348;
    float _358 = (*spvDescriptorSet0.vp_c4)._m0[0].y + (-220.0);
    float _360 = fma(_340, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _362 = 1.0 / _352;
    float _364 = precise::max(0.0, _358);
    float _366 = fma(_350, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _368 = 1.0 / _360;
    float _370 = -_364;
    float _372 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[0].w, _370);
    float _374 = (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _376 = _364;
    float _378 = _302;
    float _380 = _304;
    if (!_356)
    {
        _374 = _334;
    }
    float _382 = _374;
    float _384 = 1.0 / _366;
    bool _386 = !_356;
    float _388 = _382;
    if (!_386)
    {
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c5)._m0[2].y;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c5)._m0[2].x, _156);
        float _394 = _392 * 6.283185482025146484375;
        float _396 = _394 * 0.15915493667125701904296875;
        float _398 = _396 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c5)._m0[2].z, 1.0);
        float _404 = precise::max(0.0, _402);
        float _406 = _334 * _404;
        _178 = (*spvDescriptorSet0.vp_c5)._m0[2].z;
        _376 = _404;
        _180 = _396;
        _388 = _406;
    }
    float _408 = _178;
    float _410 = _376;
    float _412 = _180;
    float _414 = _388;
    float _416 = _412;
    float _418 = _408;
    float _420 = _410;
    if (!_336)
    {
        _416 = _320;
    }
    float _422 = _416;
    float _424 = _422;
    if (!_336)
    {
        _418 = _316;
    }
    float _426 = _418;
    float _428 = _426;
    if (!_336)
    {
        _420 = _372;
    }
    float _430 = _420;
    bool _432 = !_336;
    float _434 = _430;
    if (!_432)
    {
        float _436 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _438 = -(*spvDescriptorSet0.vp_c4)._m0[1].x;
        float _440 = _326 + _438;
        float _442 = _372 + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _444 = rsqrt(_322);
        float _446 = _440 * _436;
        float _448 = _446 * 0.15915493667125701904296875;
        float _450 = _448 * 6.283185482025146484375;
        float _452 = sin(_450);
        float _454 = _448 * 6.283185482025146484375;
        float _456 = cos(_454);
        float _458 = fma(_452, _442, (*spvDescriptorSet0.vp_c4)._m0[1].x);
        float _460 = _444 * _458;
        float _462 = _456 + (-1.0);
        float _464 = _302 * _460;
        float _466 = _304 * _460;
        float _468 = _462 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _470 = _466 * _466;
        float _472 = fma(_372, _456, _468);
        float _474 = _464 * _464;
        _434 = _472;
        _428 = _474;
        _424 = _470;
        _378 = _464;
        _380 = _466;
    }
    float _476 = _434;
    float _478 = _428;
    float _480 = _424;
    float _482 = _378;
    float _484 = _380;
    float _486 = fma(_476, _476, _478);
    float _488 = _212 * (*spvDescriptorSet0.vp_c5)._m0[1].x;
    float _490 = _368 * 4.9924825491034901066866337467265e-24;
    float _492 = _384 * 4.9924825491034901066866337467265e-24;
    float _494 = _486 + _480;
    int _496 = ~as_type<int>(_52);
    int _498 = _496 + as_type<int>((*spvDescriptorSet0.vp_c5)._m0[0].x);
    int _500 = _498 + 1;
    float _502 = _362 * 4.9924825491034901066866337467265e-24;
    float _504 = exp2(_488);
    float _506 = precise::max(_490, _492);
    float _508 = _292 * (*spvDescriptorSet0.vp_c3)._m0[7].z;
    int _510 = abs(_500);
    float _512 = precise::max(_502, _506);
    float _514 = float(_510);
    float _516 = rsqrt(_494);
    bool _518 = _512 != 0.0;
    bool _520 = isnan(_512);
    bool _522 = _518 || _520;
    bool _524 = isnan(0.0);
    bool _526 = _522 || _524;
    float _528 = _514 * _138;
    float _530 = precise::clamp(_528, 0.0, 1.0);
    float _532 = _530 * _504;
    float _534 = -(*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_32.x = _532;
    float _538 = _384;
    if (_526)
    {
        float _540 = 1.0 / _512;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = fma(_536, _414, (*spvDescriptorSet0.vp_c3)._m0[7].x);
    float _546 = _516 * _476;
    float _548 = _516 * _482;
    float _550 = _516 * _484;
    float _552 = _546 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _554 = _546 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _556 = ceil(_508);
    float _558 = fma(_548, (*spvDescriptorSet0.vp_c3)._m0[3].x, _552);
    float _560 = _546 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c3)._m0[0].x, _554);
    float _564 = _546;
    float _566 = _554;
    float _568 = _558;
    if (!_526)
    {
        _564 = 1.0;
    }
    float _570 = _564;
    float _572 = fma(_550, (*spvDescriptorSet0.vp_c3)._m0[3].z, _558);
    float _574 = fma(_548, (*spvDescriptorSet0.vp_c3)._m0[1].x, _560);
    float _576 = _570;
    if (!_526)
    {
        _566 = 1.0;
    }
    float _578 = _566;
    float _580 = _578;
    if (_526)
    {
        float _582 = _502 * _542;
        _576 = _582;
    }
    float _584 = _576;
    float _586 = 1.0 / _572;
    if (!_526)
    {
        _568 = 1.0;
    }
    float _588 = _568;
    float _590 = _588;
    if (_526)
    {
        float _592 = _490 * _542;
        _580 = _592;
    }
    float _594 = _580;
    if (_526)
    {
        float _596 = _492 * _542;
        _590 = _596;
    }
    float _598 = _590;
    float _600 = fma(_550, (*spvDescriptorSet0.vp_c3)._m0[0].z, _562);
    bool _602 = _572 > 0.0;
    float _604 = fma(_550, (*spvDescriptorSet0.vp_c3)._m0[1].z, _574);
    float _606 = _544 * _598;
    float _608 = fma(_556, 0.5, 0.5);
    float _610 = _544 * _584;
    float _612 = _544 * _594;
    float _614 = _508 * 0.5;
    float _616 = _556 + 1.0;
    int _618 = _602 ? 1065353216 : (-1073741824);
    float _620 = _600 * _586;
    float _622 = _604 * _586;
    out.m_34.x = _614;
    out.gl_PointSize = _616;
    out.m_36.x = _608;
    out.m_38.x = _610;
    out.m_38.y = _612;
    out.m_38.z = _606;
    out.gl_Position.x = _620;
    out.gl_Position.y = _622;
    float _1466 = as_type<float>(_618);
    out.gl_Position.z = _1466;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

