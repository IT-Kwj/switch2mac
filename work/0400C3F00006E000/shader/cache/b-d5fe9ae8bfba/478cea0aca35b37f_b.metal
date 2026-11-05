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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_45 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_47 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_32.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    float _96 = _94;
    if (!_88)
    {
        out.m_35.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_102);
        out.gl_Position.z = _1499;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_37.w;
    float _108 = in.m_39.x;
    float _110 = in.m_39.y;
    bool _112 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_106);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_106;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.x = _108;
    out.m_41.y = _110;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_84);
        _96 = _128;
    }
    float _130 = _96;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _92;
    if (_136)
    {
        out.m_35.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _104 = as_type<int>(_140);
    }
    int _142 = _104;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1576 = as_type<float>(_142);
        out.gl_Position.z = _1576;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_39.z;
    float _146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _148 = log2(_146);
    float _150 = _108 * 2.0;
    float _152 = _110 * 2.0;
    float _154 = in.m_39.w;
    bool _156 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _158 = isnan(0.0);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _164 = _160 || _162;
    float _166 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _176 = _172 || _174;
    float _178 = floor(_150);
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _182 = 1.0 + _180;
    float _184 = _148 * _124;
    float _186 = floor(_152);
    float _188 = _144 * 2.0;
    bool _190 = _178 >= 0.0;
    bool _192 = isnan(_178);
    bool _194 = _190 || _192;
    bool _196 = isnan(0.0);
    bool _198 = _194 || _196;
    float _200 = exp2(_184);
    bool _202 = _178 > 0.0;
    float _204 = floor(_188);
    bool _206 = _186 > 0.0;
    bool _208 = _186 >= 0.0;
    bool _210 = isnan(_186);
    bool _212 = _208 || _210;
    bool _214 = isnan(0.0);
    bool _216 = _212 || _214;
    float _218 = 1.0 / _182;
    float _220 = -_200;
    float _222 = _220 + 1.0;
    int _224 = _198 ? 0 : 1;
    bool _226 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    float _236 = _164 ? _222 : 0.0;
    bool _238 = _204 > 0.0;
    bool _240 = _204 >= 0.0;
    bool _242 = isnan(_204);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    int _250 = ~_224;
    int _252 = _250 + 1;
    int _254 = _252 + 1;
    int _256 = _254;
    float _258 = _166;
    if (!_202)
    {
        int _260 = ~_224;
        int _262 = _260 + 1;
        _256 = _262;
    }
    int _264 = _256;
    if (_176)
    {
        float _266 = _236 * _218;
        _126 = _266;
    }
    float _268 = _126;
    int _270 = _216 ? 0 : 1;
    float _272 = 0.0;
    if (!_234)
    {
        float _274 = _166 * _166;
        float _276 = _274 * 0.5;
        _272 = _276;
    }
    float _278 = _272;
    int _280 = _248 ? 0 : 1;
    float _282 = _278;
    if (!_234)
    {
        float _284 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _284;
    }
    float _286 = _282;
    int _288 = ~_270;
    int _290 = _288 + 1;
    int _292 = _290 + 1;
    int _294 = ~_280;
    int _296 = _294 + 1;
    int _298 = _296 + 1;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _314 = _312 != 0;
    int _316 = _292;
    int _318 = _298;
    float _320 = _286;
    if (!_206)
    {
        int _322 = ~_270;
        int _324 = _322 + 1;
        _316 = _324;
    }
    int _326 = _316;
    if (!_238)
    {
        int _328 = ~_280;
        int _330 = _328 + 1;
        _318 = _330;
    }
    int _332 = _318;
    bool _334 = !_234;
    if (!_334)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _166 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _166);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _364;
    }
    float _366 = _320;
    bool _368 = !_234;
    if (!_368)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = 1.0 / _376;
        float _380 = _166 * _372;
        float _382 = exp2(_380);
        float _384 = -_382;
        float _386 = _384 + 1.0;
        float _388 = _386 * _378;
        _258 = _388;
    }
    float _390 = _258;
    float _392 = _108 + _110;
    float _394 = in.m_37.x;
    float _396 = in.m_37.y;
    float _398 = in.m_37.z;
    float _400 = _392 + (-1.0);
    float _402 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _404 = _108 + _144;
    float _406 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _410 = _408 != 0;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _418 = _416 != 0;
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _402);
    float _422 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _424 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _426 = !_410;
    int _428 = _426 ? 0 : 1;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _422);
    bool _432 = _154 > 0.5;
    float _434 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _424);
    float _436 = in.m_32.x;
    float _438 = in.m_32.y;
    float _440 = in.m_32.z;
    float _442 = _404 + (-1.0);
    float _444 = in.m_43.x;
    float _446 = in.m_43.y;
    float _448 = in.m_43.z;
    float _450 = in.m_43.w;
    float _452 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _454 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _452);
    float _456 = _110 + _144;
    float _458 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _460 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _462 = _456 + (-1.0);
    float _464 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _458);
    float _466 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _460);
    float _468 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _470 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _472 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _474 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _476 = fma(_390, _394, _468);
    float _478 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _420);
    float _480 = fma(_390, _396, _472);
    float _482 = fma(_390, _398, _474);
    float _484 = fma(_476, _450, _436);
    float _486 = _444 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _488 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _490 = _448 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _492 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _494 = in.m_45.x;
    float _496 = in.m_45.y;
    float _498 = in.m_45.z;
    float _500 = fma(_480, _450, _438);
    float _502 = fma(_482, _450, _440);
    int _504 = abs(_428);
    float _506 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _508 = !_414;
    int _510 = _508 ? 0 : 1;
    float _512 = _500 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _514 = float(_332);
    float _516 = _500 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _518 = float(_504);
    float _520 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[5].x, _512);
    int _522 = abs(_510);
    float _524 = _500 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _526 = !_418;
    int _528 = _526 ? 0 : 1;
    float _530 = _518 * _514;
    float _532 = float(_264);
    float _534 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
    float _536 = _530 * (-2.0);
    int _538 = abs(_528);
    float _540 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[6].x, _516);
    float _542 = float(_522);
    float _544 = fma(_406, _536, _406);
    bool _546 = _418;
    if (_302)
    {
        bool _548 = _108 > 0.5;
        _546 = _548;
    }
    bool _550 = _546;
    float _552 = _108 + (-0.5);
    float _554 = fma(_536, _494, _494);
    float _556 = float(_326);
    float _558 = _542 * _532;
    float _560 = float(_538);
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    float _564 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
    float _566 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].z, _520);
    float _568 = in.m_47.x;
    float _570 = _560 * _556;
    float _572 = _558 * (-2.0);
    float _574 = fma(_544, _268, _562);
    float _576 = _566 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = in.m_49.x;
    float _580 = in.m_49.y;
    float _582 = in.m_49.z;
    float _584 = fma(_470, _572, _470);
    float _586 = fma(_572, _496, _496);
    float _588 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].z, _540);
    bool _590 = _110 > 0.5;
    float _592 = _110 + (-0.5);
    float _594 = _564 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _596 = -_576;
    float _598 = _596 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _588 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _602 = rsqrt(_478);
    float _604 = -_594;
    float _606 = _604 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _608 = _598 * _598;
    float _610 = -_600;
    float _612 = _610 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _614 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[196].y, _586);
    float _616 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _618 = _574 * 0.15915493667125701904296875;
    float _620 = fma(_584, _268, _614);
    float _622 = fma(_606, _606, _608);
    int _624 = as_type<int>(_614);
    float _626 = _622;
    float _628 = _568;
    if (_302)
    {
        float _630 = -_568;
        float _632 = _630 + 1.0;
        _624 = as_type<int>(_632);
    }
    int _634 = _624;
    float _636 = _570 * (-2.0);
    float _638 = _620 * 0.15915493667125701904296875;
    float _640 = fma(_612, _612, _622);
    if (!_302)
    {
        _626 = _568;
    }
    float _642 = _626;
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _578);
    float _646 = _642;
    float _648 = _578;
    if (_302)
    {
        float _650 = _550 ? as_type<float>(_634) : _568;
        _646 = _650;
    }
    float _652 = _646;
    float _654 = rsqrt(_640);
    bool _656 = _144 > 0.5;
    bool _658 = _656 && _306;
    float _660 = _506 * _644;
    float _662 = fma(_636, _498, _498);
    float _664 = _144 + (-0.5);
    float _666 = fma(_492, _636, _492);
    float _668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _580);
    float _670 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _672 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].z, _662);
    float _674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _582);
    float _676 = _618 * 6.283185482025146484375;
    float _678 = sin(_676);
    float _680 = _670 * _668;
    float _682 = fma(_666, _268, _672);
    float _684 = _616 * _674;
    out.m_51.x = _568;
    float _686 = _606 * _654;
    float _688 = _612 * _654;
    float _690 = _682 * 0.15915493667125701904296875;
    float _692 = _598 * _654;
    float _694 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _696 = _686 * _694;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _700 = _688 * _698;
    float _702 = _618 * 6.283185482025146484375;
    float _704 = cos(_702);
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _708 = _692 * _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _712 = -_696;
    float _714 = fma(_688, _710, _712);
    float _716 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _430);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_708;
    float _722 = fma(_686, _718, _720);
    float _724 = _714 * _714;
    float _726 = _638 * 6.283185482025146484375;
    float _728 = sin(_726);
    float _730 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _434);
    bool _732 = _580 != 0.0;
    bool _734 = isnan(_580);
    bool _736 = _732 || _734;
    bool _738 = isnan(0.0);
    bool _740 = _736 || _738;
    float _742 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _466);
    float _744 = _638 * 6.283185482025146484375;
    float _746 = cos(_744);
    bool _748 = _578 == 0.0;
    bool _750 = !_740;
    bool _752 = _748 && _750;
    bool _754 = _582 == 0.0;
    bool _756 = _754 && _752;
    float _758 = _690 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _764 = -_700;
    float _766 = fma(_692, _762, _764);
    float _768 = fma(_766, _766, _724);
    float _770 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _454);
    float _772 = _678 * _728;
    float _774 = _690 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(_722, _722, _768);
    float _780 = _704 * _746;
    float _782 = _678 * _746;
    float _784 = _704 * _728;
    float _786 = rsqrt(_778);
    float _788 = _746 * _760;
    float _790 = _704 * _760;
    float _792 = _678 * _760;
    float _794 = _728 * _760;
    float _796 = fma(_776, _780, _772);
    float _798 = fma(_776, _772, _780);
    float _800 = -_784;
    float _802 = fma(_776, _782, _800);
    float _804 = rsqrt(_716);
    float _806 = _790 * _680;
    float _808 = -_782;
    float _810 = fma(_776, _784, _808);
    float _812 = -_680;
    float _814 = _776 * _812;
    float _816 = _792 * _680;
    float _818 = _722 * _786;
    float _820 = _766 * _786;
    float _822 = _714 * _786;
    float _824 = rsqrt(_730);
    float _826 = fma(_796, _660, _806);
    float _828 = _686 * _818;
    float _830 = fma(_802, _660, _816);
    float _832 = _688 * _822;
    float _834 = fma(_788, _660, _814);
    float _836 = _692 * _820;
    float _838 = fma(_810, _684, _826);
    float _840 = -_828;
    float _842 = fma(_688, _820, _840);
    float _844 = -_832;
    float _846 = fma(_692, _818, _844);
    float _848 = -_836;
    float _850 = fma(_686, _822, _848);
    float _852 = fma(_794, _684, _834);
    float _854 = _842 * _838;
    float _856 = _602 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _858 = _846 * _838;
    float _860 = _850 * _838;
    float _862 = fma(_798, _684, _830);
    float _864 = _804 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _866 = fma(_822, _852, _854);
    float _868 = _824 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _870 = fma(_820, _852, _858);
    float _872 = fma(_818, _852, _860);
    float _874 = _856 * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _876 = _864 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _878 = fma(_692, _862, _866);
    float _880 = _868 * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _882 = fma(_686, _862, _870);
    float _884 = fma(_688, _862, _872);
    float _886 = _878 * _874;
    float _888 = _878 * _876;
    float _890 = _878 * _880;
    float _892 = in.m_47.y;
    float _894 = _856 * (*spvDescriptorSet0.vp_c10)._m0[18].x;
    float _896 = _864 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _898 = _868 * (*spvDescriptorSet0.vp_c10)._m0[20].x;
    float _900 = sqrt(_742);
    float _902 = fma(_882, _894, _886);
    float _904 = fma(_882, _896, _888);
    float _906 = _864 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _908 = fma(_882, _898, _890);
    float _910 = _856 * (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _912 = _868 * (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _914 = fma(_884, _906, _904);
    float _916 = sqrt(_770);
    float _918 = fma(_884, _910, _902);
    float _920 = fma(_884, _912, _908);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _926 = in.m_53.x;
    float _928 = in.m_53.y;
    float _930 = in.m_53.z;
    float _932 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[18].x, _922);
    float _934 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[18].z, _924);
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[192].y * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _938 = _790 * _842;
    float _940 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[20].x, _932);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[20].z, _934);
    float _944 = -_892;
    float _946 = _944 + 1.0;
    float _948 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _464);
    float _950 = _594 + _940;
    float _952 = _600 + _942;
    float _954 = _936 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = _936 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _958 = _432 ? as_type<int>(_946) : as_type<int>(_892);
    out.m_51.y = _892;
    float _960 = fma(_954, _916, _950);
    float _962 = fma(_956, _900, _952);
    float _964 = _310 ? as_type<float>(_958) : _892;
    float _966 = _790 * _846;
    float _968 = _790 * _850;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _962 + _970;
    float _974 = _796 * _846;
    float _976 = _892;
    float _978 = _688;
    float _980 = _686;
    float _982 = _960;
    if (_314)
    {
        float _984 = _590 ? _946 : _892;
        _976 = _984;
    }
    float _986 = _976;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _990 = _960 + _988;
    float _992 = _926;
    float _994 = _930;
    float _996 = _928;
    if (!_756)
    {
        float _998 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _926);
        _992 = _998;
    }
    float _1000 = _992;
    float _1002 = _972 * _972;
    float _1004 = _1002;
    if (!_306)
    {
        _648 = _568;
    }
    float _1006 = _648;
    float _1008 = _990 * _990;
    float _1010 = _1006;
    float _1012 = _1008;
    if (_658)
    {
        float _1014 = -_568;
        float _1016 = _1014 + 1.0;
        _628 = _1016;
    }
    float _1018 = _628;
    if (!_756)
    {
        float _1020 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[17].y, _930);
        _994 = _1020;
    }
    float _1022 = _994;
    float _1024 = _796 * _842;
    float _1026 = _1008 + _1002;
    float _1028 = _796 * _850;
    if (_306)
    {
        _1010 = _1018;
    }
    float _1030 = _1010;
    float _1032 = _810 * _846;
    float _1034 = sqrt(_1026);
    float _1036 = _810 * _842;
    float _1038 = _810 * _850;
    float _1040 = -_776;
    float _1042 = fma(_1040, _820, _966);
    float _1044 = -_776;
    float _1046 = fma(_1044, _822, _938);
    float _1048 = -_776;
    float _1050 = fma(_1048, _818, _968);
    float _1052 = fma(_788, _820, _974);
    float _1054 = fma(_788, _822, _1024);
    float _1056 = fma(_788, _818, _1028);
    float _1058 = _914 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1060 = sqrt(_948);
    if (!_756)
    {
        float _1062 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[17].y, _928);
        _996 = _1062;
    }
    float _1064 = _996;
    float _1066 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1068 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[18].y, _1058);
    float _1070 = fma(_794, _820, _1032);
    float _1072 = fma(_794, _822, _1036);
    bool _1074 = _1034 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1076 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[20].y, _1068);
    float _1078 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1080 = fma(_794, _818, _1038);
    float _1082 = fma(_792, _686, _1042);
    float _1084 = _576 + _1076;
    float _1086 = fma(_792, _692, _1046);
    float _1088 = fma(_792, _688, _1050);
    float _1090 = fma(_802, _692, _1054);
    float _1092 = fma(_802, _686, _1052);
    float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1096 = fma(_1066, _1060, _1084);
    float _1098 = fma(_798, _686, _1070);
    float _1100 = fma(_798, _692, _1072);
    float _1102 = fma(_802, _688, _1056);
    float _1104 = fma(_798, _688, _1080);
    if (!_1074)
    {
        _978 = _962;
    }
    float _1106 = _978;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1110 = _1106;
    if (!_1074)
    {
        _980 = _1096;
    }
    float _1112 = _980;
    bool _1114 = !_1074;
    float _1116 = _1112;
    if (!_1114)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1122 = _1034 + _1120;
        float _1124 = rsqrt(_1026);
        float _1126 = _1122 * _1118;
        float _1128 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1130 = _1126 * 0.15915493667125701904296875;
        float _1132 = _1130 * 6.283185482025146484375;
        float _1134 = sin(_1132);
        float _1136 = _1130 * 6.283185482025146484375;
        float _1138 = cos(_1136);
        float _1140 = fma(_1134, _1128, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1142 = _1124 * _1140;
        float _1144 = fma(_990, _1142, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1146 = _1138 + (-1.0);
        float _1148 = fma(_972, _1142, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _1144 + _1150;
        float _1154 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1158 = _1148 + _1156;
        float _1160 = _1152 * _1152;
        float _1162 = fma(_1096, _1138, _1154);
        float _1164 = _1158 * _1158;
        _1116 = _1162;
        _1012 = _1160;
        _1004 = _1164;
        _982 = _1144;
        _1110 = _1148;
    }
    float _1166 = _1116;
    float _1168 = _1012;
    float _1170 = _1004;
    float _1172 = _982;
    float _1174 = _1110;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1180 = _1166 + _1178;
    float _1182 = _1082 * _1064;
    float _1184 = _1086 * _1064;
    float _1186 = _1088 * _1064;
    float _1188 = fma(_1180, _1180, _1168);
    float _1190 = fma(_1092, _1000, _1182);
    float _1192 = fma(_1090, _1000, _1184);
    float _1194 = fma(_1102, _1000, _1186);
    float _1196 = _652 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1198 = _964 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1200 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1202 = _1188 + _1170;
    float _1204 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1206 = _1196 * _1078;
    float _1208 = _1198 * _1108;
    float _1210 = _1200 * _1094;
    float _1212 = fma(_1098, _1022, _1190);
    float _1214 = _1204 * _1176;
    float _1216 = sqrt(_1202);
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1230 = fma(_1100, _1022, _1192);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1234 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1238 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = fma(_1104, _1022, _1194);
    out.m_55.x = _1206;
    out.m_55.y = _1210;
    out.m_55.z = _1214;
    out.m_55.w = _1208;
    bool _1250 = _1216 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1252 = isnan(_1216);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1258 = _1254 || _1256;
    out.m_57.x = _1234;
    out.m_57.y = _1238;
    out.m_57.z = _1240;
    out.m_57.w = _1232;
    out.m_59.x = _1242;
    out.m_59.y = _1244;
    out.m_59.z = _1246;
    out.m_59.w = _1236;
    out.m_61.x = _1212;
    out.m_61.y = _1230;
    out.m_61.z = _1248;
    float _1260 = _1180;
    if (!_1258)
    {
        _1260 = 1.0;
    }
    float _1262 = _1260;
    bool _1264 = !_1258;
    float _1266 = _1262;
    if (!_1264)
    {
        bool _1268 = _1216 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1270 = isnan(_1216);
        bool _1272 = _1268 || _1270;
        bool _1274 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1276 = _1272 || _1274;
        if (!_1276)
        {
            float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1280 = _1216 + _1278;
            float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1284 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1282;
            float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1288 = _1286 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1290 = 1.0 / _1284;
            float _1292 = _1280 * _1290;
            float _1294 = fma(_1292, _1288, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1266 = _1294;
            _1296 = true;
        }
        else
        {
            bool _1298 = _1216 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1300 = isnan(_1216);
            bool _1302 = _1298 || _1300;
            bool _1304 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1306 = _1302 || _1304;
            if (!_1306)
            {
                float _1308 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1310 = _1216 + _1308;
                float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1314 = _1312 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1318 = _1316 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1320 = 1.0 / _1314;
                float _1322 = _1310 * _1320;
                float _1324 = fma(_1322, _1318, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1266 = _1324;
                _1296 = true;
            }
            else
            {
                _1266 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1296 = false;
    float _1326 = _1266;
    float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1330 = _1166 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1334 = _1172 + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1338 = _1174 + _1336;
    float _1340 = fma(_1330, _1326, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1342 = fma(_1334, _1326, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1344 = fma(_1338, _1326, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1348 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1354 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1346);
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1348);
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1350);
    float _1360 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1352);
    float _1362 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1364 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1356);
    float _1366 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1358);
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1360);
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1386 = _1340 + _1384;
    float _1388 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1378);
    float _1390 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1380);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1342 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1398 = _1344 + _1396;
    float _1400 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1388);
    float _1402 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1388);
    float _1404 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1390);
    float _1406 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1400);
    float _1408 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _1394;
    out.m_63.y = _1386;
    out.m_63.z = _1398;
    float _1410 = 1.0 / _1406;
    float _1412 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1408);
    float _1414 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1416 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1412);
    float _1418 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1414);
    float _1420 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1404);
    float _1422 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1416);
    float _1424 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1418);
    float _1426 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1428 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1424);
    float _1430 = _1422 * _1410;
    float _1432 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1402);
    out.m_35.x = _1426;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1436 = fma(_1432, _1430, _1434);
    float _1438 = _1432 + _1436;
    out.gl_Position.x = _1428;
    out.gl_Position.y = _1420;
    out.gl_Position.z = _1436;
    out.gl_Position.w = _1432;
    float _1440 = _1438 * 0.5;
    out.m_65.z = _1440;
    out.m_65.w = _1432;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_32.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    float _96 = _94;
    if (!_88)
    {
        out.m_35.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_102);
        out.gl_Position.z = _1499;
    }
    if (!_88)
    {
        return out;
    }
    float _106 = in.m_37.w;
    float _108 = in.m_39.x;
    float _110 = in.m_39.y;
    bool _112 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_106);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_106;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.x = _108;
    out.m_41.y = _110;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_84);
        _96 = _128;
    }
    float _130 = _96;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _92;
    if (_136)
    {
        out.m_35.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _104 = as_type<int>(_140);
    }
    int _142 = _104;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1576 = as_type<float>(_142);
        out.gl_Position.z = _1576;
    }
    if (_136)
    {
        return out;
    }
    float _144 = in.m_39.z;
    float _146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _148 = log2(_146);
    float _150 = _108 * 2.0;
    float _152 = _110 * 2.0;
    float _154 = in.m_39.w;
    bool _156 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _158 = isnan(0.0);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _164 = _160 || _162;
    float _166 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _176 = _172 || _174;
    float _178 = floor(_150);
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _182 = 1.0 + _180;
    float _184 = _148 * _124;
    float _186 = floor(_152);
    float _188 = _144 * 2.0;
    bool _190 = _178 >= 0.0;
    bool _192 = isnan(_178);
    bool _194 = _190 || _192;
    bool _196 = isnan(0.0);
    bool _198 = _194 || _196;
    float _200 = exp2(_184);
    bool _202 = _178 > 0.0;
    float _204 = floor(_188);
    bool _206 = _186 > 0.0;
    bool _208 = _186 >= 0.0;
    bool _210 = isnan(_186);
    bool _212 = _208 || _210;
    bool _214 = isnan(0.0);
    bool _216 = _212 || _214;
    float _218 = 1.0 / _182;
    float _220 = -_200;
    float _222 = _220 + 1.0;
    int _224 = _198 ? 0 : 1;
    bool _226 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    float _236 = _164 ? _222 : 0.0;
    bool _238 = _204 > 0.0;
    bool _240 = _204 >= 0.0;
    bool _242 = isnan(_204);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    int _250 = ~_224;
    int _252 = _250 + 1;
    int _254 = _252 + 1;
    int _256 = _254;
    float _258 = _166;
    if (!_202)
    {
        int _260 = ~_224;
        int _262 = _260 + 1;
        _256 = _262;
    }
    int _264 = _256;
    if (_176)
    {
        float _266 = _236 * _218;
        _126 = _266;
    }
    float _268 = _126;
    int _270 = _216 ? 0 : 1;
    float _272 = 0.0;
    if (!_234)
    {
        float _274 = _166 * _166;
        float _276 = _274 * 0.5;
        _272 = _276;
    }
    float _278 = _272;
    int _280 = _248 ? 0 : 1;
    float _282 = _278;
    if (!_234)
    {
        float _284 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _284;
    }
    float _286 = _282;
    int _288 = ~_270;
    int _290 = _288 + 1;
    int _292 = _290 + 1;
    int _294 = ~_280;
    int _296 = _294 + 1;
    int _298 = _296 + 1;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _314 = _312 != 0;
    int _316 = _292;
    int _318 = _298;
    float _320 = _286;
    if (!_206)
    {
        int _322 = ~_270;
        int _324 = _322 + 1;
        _316 = _324;
    }
    int _326 = _316;
    if (!_238)
    {
        int _328 = ~_280;
        int _330 = _328 + 1;
        _318 = _330;
    }
    int _332 = _318;
    bool _334 = !_234;
    if (!_334)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _166 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _166);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _364;
    }
    float _366 = _320;
    bool _368 = !_234;
    if (!_368)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = 1.0 / _376;
        float _380 = _166 * _372;
        float _382 = exp2(_380);
        float _384 = -_382;
        float _386 = _384 + 1.0;
        float _388 = _386 * _378;
        _258 = _388;
    }
    float _390 = _258;
    float _392 = _108 + _110;
    float _394 = in.m_37.x;
    float _396 = in.m_37.y;
    float _398 = in.m_37.z;
    float _400 = _392 + (-1.0);
    float _402 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _404 = _108 + _144;
    float _406 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _410 = _408 != 0;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _418 = _416 != 0;
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _402);
    float _422 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _424 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _426 = !_410;
    int _428 = _426 ? 0 : 1;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _422);
    bool _432 = _154 > 0.5;
    float _434 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _424);
    float _436 = in.m_32.x;
    float _438 = in.m_32.y;
    float _440 = in.m_32.z;
    float _442 = _404 + (-1.0);
    float _444 = in.m_43.x;
    float _446 = in.m_43.y;
    float _448 = in.m_43.z;
    float _450 = in.m_43.w;
    float _452 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _454 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _452);
    float _456 = _110 + _144;
    float _458 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _460 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _462 = _456 + (-1.0);
    float _464 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _458);
    float _466 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _460);
    float _468 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _470 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _472 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _474 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _476 = fma(_390, _394, _468);
    float _478 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _420);
    float _480 = fma(_390, _396, _472);
    float _482 = fma(_390, _398, _474);
    float _484 = fma(_476, _450, _436);
    float _486 = _444 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _488 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _490 = _448 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _492 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _494 = in.m_45.x;
    float _496 = in.m_45.y;
    float _498 = in.m_45.z;
    float _500 = fma(_480, _450, _438);
    float _502 = fma(_482, _450, _440);
    int _504 = abs(_428);
    float _506 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _508 = !_414;
    int _510 = _508 ? 0 : 1;
    float _512 = _500 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _514 = float(_332);
    float _516 = _500 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _518 = float(_504);
    float _520 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[5].x, _512);
    int _522 = abs(_510);
    float _524 = _500 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _526 = !_418;
    int _528 = _526 ? 0 : 1;
    float _530 = _518 * _514;
    float _532 = float(_264);
    float _534 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
    float _536 = _530 * (-2.0);
    int _538 = abs(_528);
    float _540 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[6].x, _516);
    float _542 = float(_522);
    float _544 = fma(_406, _536, _406);
    bool _546 = _418;
    if (_302)
    {
        bool _548 = _108 > 0.5;
        _546 = _548;
    }
    bool _550 = _546;
    float _552 = _108 + (-0.5);
    float _554 = fma(_536, _494, _494);
    float _556 = float(_326);
    float _558 = _542 * _532;
    float _560 = float(_538);
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    float _564 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
    float _566 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].z, _520);
    float _568 = in.m_47.x;
    float _570 = _560 * _556;
    float _572 = _558 * (-2.0);
    float _574 = fma(_544, _268, _562);
    float _576 = _566 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = in.m_49.x;
    float _580 = in.m_49.y;
    float _582 = in.m_49.z;
    float _584 = fma(_470, _572, _470);
    float _586 = fma(_572, _496, _496);
    float _588 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].z, _540);
    bool _590 = _110 > 0.5;
    float _592 = _110 + (-0.5);
    float _594 = _564 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _596 = -_576;
    float _598 = _596 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _588 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _602 = rsqrt(_478);
    float _604 = -_594;
    float _606 = _604 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _608 = _598 * _598;
    float _610 = -_600;
    float _612 = _610 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _614 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[196].y, _586);
    float _616 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _618 = _574 * 0.15915493667125701904296875;
    float _620 = fma(_584, _268, _614);
    float _622 = fma(_606, _606, _608);
    int _624 = as_type<int>(_614);
    float _626 = _622;
    float _628 = _568;
    if (_302)
    {
        float _630 = -_568;
        float _632 = _630 + 1.0;
        _624 = as_type<int>(_632);
    }
    int _634 = _624;
    float _636 = _570 * (-2.0);
    float _638 = _620 * 0.15915493667125701904296875;
    float _640 = fma(_612, _612, _622);
    if (!_302)
    {
        _626 = _568;
    }
    float _642 = _626;
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _578);
    float _646 = _642;
    float _648 = _578;
    if (_302)
    {
        float _650 = _550 ? as_type<float>(_634) : _568;
        _646 = _650;
    }
    float _652 = _646;
    float _654 = rsqrt(_640);
    bool _656 = _144 > 0.5;
    bool _658 = _656 && _306;
    float _660 = _506 * _644;
    float _662 = fma(_636, _498, _498);
    float _664 = _144 + (-0.5);
    float _666 = fma(_492, _636, _492);
    float _668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _580);
    float _670 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _672 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].z, _662);
    float _674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _582);
    float _676 = _618 * 6.283185482025146484375;
    float _678 = sin(_676);
    float _680 = _670 * _668;
    float _682 = fma(_666, _268, _672);
    float _684 = _616 * _674;
    out.m_51.x = _568;
    float _686 = _606 * _654;
    float _688 = _612 * _654;
    float _690 = _682 * 0.15915493667125701904296875;
    float _692 = _598 * _654;
    float _694 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _696 = _686 * _694;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _700 = _688 * _698;
    float _702 = _618 * 6.283185482025146484375;
    float _704 = cos(_702);
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _708 = _692 * _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _712 = -_696;
    float _714 = fma(_688, _710, _712);
    float _716 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _430);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_708;
    float _722 = fma(_686, _718, _720);
    float _724 = _714 * _714;
    float _726 = _638 * 6.283185482025146484375;
    float _728 = sin(_726);
    float _730 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _434);
    bool _732 = _580 != 0.0;
    bool _734 = isnan(_580);
    bool _736 = _732 || _734;
    bool _738 = isnan(0.0);
    bool _740 = _736 || _738;
    float _742 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _466);
    float _744 = _638 * 6.283185482025146484375;
    float _746 = cos(_744);
    bool _748 = _578 == 0.0;
    bool _750 = !_740;
    bool _752 = _748 && _750;
    bool _754 = _582 == 0.0;
    bool _756 = _754 && _752;
    float _758 = _690 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _764 = -_700;
    float _766 = fma(_692, _762, _764);
    float _768 = fma(_766, _766, _724);
    float _770 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _454);
    float _772 = _678 * _728;
    float _774 = _690 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(_722, _722, _768);
    float _780 = _704 * _746;
    float _782 = _678 * _746;
    float _784 = _704 * _728;
    float _786 = rsqrt(_778);
    float _788 = _746 * _760;
    float _790 = _704 * _760;
    float _792 = _678 * _760;
    float _794 = _728 * _760;
    float _796 = fma(_776, _780, _772);
    float _798 = fma(_776, _772, _780);
    float _800 = -_784;
    float _802 = fma(_776, _782, _800);
    float _804 = rsqrt(_716);
    float _806 = _790 * _680;
    float _808 = -_782;
    float _810 = fma(_776, _784, _808);
    float _812 = -_680;
    float _814 = _776 * _812;
    float _816 = _792 * _680;
    float _818 = _722 * _786;
    float _820 = _766 * _786;
    float _822 = _714 * _786;
    float _824 = rsqrt(_730);
    float _826 = fma(_796, _660, _806);
    float _828 = _686 * _818;
    float _830 = fma(_802, _660, _816);
    float _832 = _688 * _822;
    float _834 = fma(_788, _660, _814);
    float _836 = _692 * _820;
    float _838 = fma(_810, _684, _826);
    float _840 = -_828;
    float _842 = fma(_688, _820, _840);
    float _844 = -_832;
    float _846 = fma(_692, _818, _844);
    float _848 = -_836;
    float _850 = fma(_686, _822, _848);
    float _852 = fma(_794, _684, _834);
    float _854 = _842 * _838;
    float _856 = _602 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _858 = _846 * _838;
    float _860 = _850 * _838;
    float _862 = fma(_798, _684, _830);
    float _864 = _804 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _866 = fma(_822, _852, _854);
    float _868 = _824 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _870 = fma(_820, _852, _858);
    float _872 = fma(_818, _852, _860);
    float _874 = _856 * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _876 = _864 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _878 = fma(_692, _862, _866);
    float _880 = _868 * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _882 = fma(_686, _862, _870);
    float _884 = fma(_688, _862, _872);
    float _886 = _878 * _874;
    float _888 = _878 * _876;
    float _890 = _878 * _880;
    float _892 = in.m_47.y;
    float _894 = _856 * (*spvDescriptorSet0.vp_c10)._m0[18].x;
    float _896 = _864 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _898 = _868 * (*spvDescriptorSet0.vp_c10)._m0[20].x;
    float _900 = sqrt(_742);
    float _902 = fma(_882, _894, _886);
    float _904 = fma(_882, _896, _888);
    float _906 = _864 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _908 = fma(_882, _898, _890);
    float _910 = _856 * (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _912 = _868 * (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _914 = fma(_884, _906, _904);
    float _916 = sqrt(_770);
    float _918 = fma(_884, _910, _902);
    float _920 = fma(_884, _912, _908);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _926 = in.m_53.x;
    float _928 = in.m_53.y;
    float _930 = in.m_53.z;
    float _932 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[18].x, _922);
    float _934 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[18].z, _924);
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[192].y * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _938 = _790 * _842;
    float _940 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[20].x, _932);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[20].z, _934);
    float _944 = -_892;
    float _946 = _944 + 1.0;
    float _948 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _464);
    float _950 = _594 + _940;
    float _952 = _600 + _942;
    float _954 = _936 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = _936 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _958 = _432 ? as_type<int>(_946) : as_type<int>(_892);
    out.m_51.y = _892;
    float _960 = fma(_954, _916, _950);
    float _962 = fma(_956, _900, _952);
    float _964 = _310 ? as_type<float>(_958) : _892;
    float _966 = _790 * _846;
    float _968 = _790 * _850;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _962 + _970;
    float _974 = _796 * _846;
    float _976 = _892;
    float _978 = _688;
    float _980 = _686;
    float _982 = _960;
    if (_314)
    {
        float _984 = _590 ? _946 : _892;
        _976 = _984;
    }
    float _986 = _976;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _990 = _960 + _988;
    float _992 = _926;
    float _994 = _930;
    float _996 = _928;
    if (!_756)
    {
        float _998 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _926);
        _992 = _998;
    }
    float _1000 = _992;
    float _1002 = _972 * _972;
    float _1004 = _1002;
    if (!_306)
    {
        _648 = _568;
    }
    float _1006 = _648;
    float _1008 = _990 * _990;
    float _1010 = _1006;
    float _1012 = _1008;
    if (_658)
    {
        float _1014 = -_568;
        float _1016 = _1014 + 1.0;
        _628 = _1016;
    }
    float _1018 = _628;
    if (!_756)
    {
        float _1020 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[17].y, _930);
        _994 = _1020;
    }
    float _1022 = _994;
    float _1024 = _796 * _842;
    float _1026 = _1008 + _1002;
    float _1028 = _796 * _850;
    if (_306)
    {
        _1010 = _1018;
    }
    float _1030 = _1010;
    float _1032 = _810 * _846;
    float _1034 = sqrt(_1026);
    float _1036 = _810 * _842;
    float _1038 = _810 * _850;
    float _1040 = -_776;
    float _1042 = fma(_1040, _820, _966);
    float _1044 = -_776;
    float _1046 = fma(_1044, _822, _938);
    float _1048 = -_776;
    float _1050 = fma(_1048, _818, _968);
    float _1052 = fma(_788, _820, _974);
    float _1054 = fma(_788, _822, _1024);
    float _1056 = fma(_788, _818, _1028);
    float _1058 = _914 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1060 = sqrt(_948);
    if (!_756)
    {
        float _1062 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[17].y, _928);
        _996 = _1062;
    }
    float _1064 = _996;
    float _1066 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1068 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[18].y, _1058);
    float _1070 = fma(_794, _820, _1032);
    float _1072 = fma(_794, _822, _1036);
    bool _1074 = _1034 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1076 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[20].y, _1068);
    float _1078 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1080 = fma(_794, _818, _1038);
    float _1082 = fma(_792, _686, _1042);
    float _1084 = _576 + _1076;
    float _1086 = fma(_792, _692, _1046);
    float _1088 = fma(_792, _688, _1050);
    float _1090 = fma(_802, _692, _1054);
    float _1092 = fma(_802, _686, _1052);
    float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1096 = fma(_1066, _1060, _1084);
    float _1098 = fma(_798, _686, _1070);
    float _1100 = fma(_798, _692, _1072);
    float _1102 = fma(_802, _688, _1056);
    float _1104 = fma(_798, _688, _1080);
    if (!_1074)
    {
        _978 = _962;
    }
    float _1106 = _978;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1110 = _1106;
    if (!_1074)
    {
        _980 = _1096;
    }
    float _1112 = _980;
    bool _1114 = !_1074;
    float _1116 = _1112;
    if (!_1114)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1122 = _1034 + _1120;
        float _1124 = rsqrt(_1026);
        float _1126 = _1122 * _1118;
        float _1128 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1130 = _1126 * 0.15915493667125701904296875;
        float _1132 = _1130 * 6.283185482025146484375;
        float _1134 = sin(_1132);
        float _1136 = _1130 * 6.283185482025146484375;
        float _1138 = cos(_1136);
        float _1140 = fma(_1134, _1128, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1142 = _1124 * _1140;
        float _1144 = fma(_990, _1142, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1146 = _1138 + (-1.0);
        float _1148 = fma(_972, _1142, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _1144 + _1150;
        float _1154 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1158 = _1148 + _1156;
        float _1160 = _1152 * _1152;
        float _1162 = fma(_1096, _1138, _1154);
        float _1164 = _1158 * _1158;
        _1116 = _1162;
        _1012 = _1160;
        _1004 = _1164;
        _982 = _1144;
        _1110 = _1148;
    }
    float _1166 = _1116;
    float _1168 = _1012;
    float _1170 = _1004;
    float _1172 = _982;
    float _1174 = _1110;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1180 = _1166 + _1178;
    float _1182 = _1082 * _1064;
    float _1184 = _1086 * _1064;
    float _1186 = _1088 * _1064;
    float _1188 = fma(_1180, _1180, _1168);
    float _1190 = fma(_1092, _1000, _1182);
    float _1192 = fma(_1090, _1000, _1184);
    float _1194 = fma(_1102, _1000, _1186);
    float _1196 = _652 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1198 = _964 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1200 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1202 = _1188 + _1170;
    float _1204 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1206 = _1196 * _1078;
    float _1208 = _1198 * _1108;
    float _1210 = _1200 * _1094;
    float _1212 = fma(_1098, _1022, _1190);
    float _1214 = _1204 * _1176;
    float _1216 = sqrt(_1202);
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1230 = fma(_1100, _1022, _1192);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1234 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1238 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = fma(_1104, _1022, _1194);
    out.m_55.x = _1206;
    out.m_55.y = _1210;
    out.m_55.z = _1214;
    out.m_55.w = _1208;
    bool _1250 = _1216 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1252 = isnan(_1216);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1258 = _1254 || _1256;
    out.m_57.x = _1234;
    out.m_57.y = _1238;
    out.m_57.z = _1240;
    out.m_57.w = _1232;
    out.m_59.x = _1242;
    out.m_59.y = _1244;
    out.m_59.z = _1246;
    out.m_59.w = _1236;
    out.m_61.x = _1212;
    out.m_61.y = _1230;
    out.m_61.z = _1248;
    float _1260 = _1180;
    if (!_1258)
    {
        _1260 = 1.0;
    }
    float _1262 = _1260;
    bool _1264 = !_1258;
    float _1266 = _1262;
    if (!_1264)
    {
        bool _1268 = _1216 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1270 = isnan(_1216);
        bool _1272 = _1268 || _1270;
        bool _1274 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1276 = _1272 || _1274;
        if (!_1276)
        {
            float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1280 = _1216 + _1278;
            float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1284 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1282;
            float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1288 = _1286 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1290 = 1.0 / _1284;
            float _1292 = _1280 * _1290;
            float _1294 = fma(_1292, _1288, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1266 = _1294;
            _1296 = true;
        }
        else
        {
            bool _1298 = _1216 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1300 = isnan(_1216);
            bool _1302 = _1298 || _1300;
            bool _1304 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1306 = _1302 || _1304;
            if (!_1306)
            {
                float _1308 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1310 = _1216 + _1308;
                float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1314 = _1312 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1318 = _1316 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1320 = 1.0 / _1314;
                float _1322 = _1310 * _1320;
                float _1324 = fma(_1322, _1318, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1266 = _1324;
                _1296 = true;
            }
            else
            {
                _1266 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1296 = false;
    float _1326 = _1266;
    float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1330 = _1166 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1334 = _1172 + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1338 = _1174 + _1336;
    float _1340 = fma(_1330, _1326, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1342 = fma(_1334, _1326, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1344 = fma(_1338, _1326, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1348 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1354 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1346);
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1348);
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1350);
    float _1360 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1352);
    float _1362 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1364 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1356);
    float _1366 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1358);
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1360);
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1386 = _1340 + _1384;
    float _1388 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1378);
    float _1390 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1380);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1342 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1398 = _1344 + _1396;
    float _1400 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1388);
    float _1402 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1388);
    float _1404 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1390);
    float _1406 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1400);
    float _1408 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _1394;
    out.m_63.y = _1386;
    out.m_63.z = _1398;
    float _1410 = 1.0 / _1406;
    float _1412 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1408);
    float _1414 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1416 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1412);
    float _1418 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1414);
    float _1420 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1404);
    float _1422 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1416);
    float _1424 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1418);
    float _1426 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1428 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1424);
    float _1430 = _1422 * _1410;
    float _1432 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1402);
    out.m_35.x = _1426;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1436 = fma(_1432, _1430, _1434);
    float _1438 = _1432 + _1436;
    out.gl_Position.x = _1428;
    out.gl_Position.y = _1420;
    out.gl_Position.z = _1436;
    out.gl_Position.w = _1432;
    float _1440 = _1438 * 0.5;
    out.m_65.z = _1440;
    out.m_65.w = _1432;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_32.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    float _96 = _94;
    if (!_88)
    {
        out.m_35.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_102);
        out.gl_Position.z = _1499;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_37.w;
    float _108 = in.m_39.x;
    float _110 = in.m_39.y;
    bool _112 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_106);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_106;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.x = _108;
    out.m_41.y = _110;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_84);
        _96 = _128;
    }
    float _130 = _96;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _92;
    if (_136)
    {
        out.m_35.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _104 = as_type<int>(_140);
    }
    int _142 = _104;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1576 = as_type<float>(_142);
        out.gl_Position.z = _1576;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_39.z;
    float _146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _148 = log2(_146);
    float _150 = _108 * 2.0;
    float _152 = _110 * 2.0;
    float _154 = in.m_39.w;
    bool _156 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _158 = isnan(0.0);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _164 = _160 || _162;
    float _166 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _176 = _172 || _174;
    float _178 = floor(_150);
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _182 = 1.0 + _180;
    float _184 = _148 * _124;
    float _186 = floor(_152);
    float _188 = _144 * 2.0;
    bool _190 = _178 >= 0.0;
    bool _192 = isnan(_178);
    bool _194 = _190 || _192;
    bool _196 = isnan(0.0);
    bool _198 = _194 || _196;
    float _200 = exp2(_184);
    bool _202 = _178 > 0.0;
    float _204 = floor(_188);
    bool _206 = _186 > 0.0;
    bool _208 = _186 >= 0.0;
    bool _210 = isnan(_186);
    bool _212 = _208 || _210;
    bool _214 = isnan(0.0);
    bool _216 = _212 || _214;
    float _218 = 1.0 / _182;
    float _220 = -_200;
    float _222 = _220 + 1.0;
    int _224 = _198 ? 0 : 1;
    bool _226 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    float _236 = _164 ? _222 : 0.0;
    bool _238 = _204 > 0.0;
    bool _240 = _204 >= 0.0;
    bool _242 = isnan(_204);
    bool _244 = _240 || _242;
    bool _246 = isnan(0.0);
    bool _248 = _244 || _246;
    int _250 = ~_224;
    int _252 = _250 + 1;
    int _254 = _252 + 1;
    int _256 = _254;
    float _258 = _166;
    if (!_202)
    {
        int _260 = ~_224;
        int _262 = _260 + 1;
        _256 = _262;
    }
    int _264 = _256;
    if (_176)
    {
        float _266 = _236 * _218;
        _126 = _266;
    }
    float _268 = _126;
    int _270 = _216 ? 0 : 1;
    float _272 = 0.0;
    if (!_234)
    {
        float _274 = _166 * _166;
        float _276 = _274 * 0.5;
        _272 = _276;
    }
    float _278 = _272;
    int _280 = _248 ? 0 : 1;
    float _282 = _278;
    if (!_234)
    {
        float _284 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _284;
    }
    float _286 = _282;
    int _288 = ~_270;
    int _290 = _288 + 1;
    int _292 = _290 + 1;
    int _294 = ~_280;
    int _296 = _294 + 1;
    int _298 = _296 + 1;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _314 = _312 != 0;
    int _316 = _292;
    int _318 = _298;
    float _320 = _286;
    if (!_206)
    {
        int _322 = ~_270;
        int _324 = _322 + 1;
        _316 = _324;
    }
    int _326 = _316;
    if (!_238)
    {
        int _328 = ~_280;
        int _330 = _328 + 1;
        _318 = _330;
    }
    int _332 = _318;
    bool _334 = !_234;
    if (!_334)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _166 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _166);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _364;
    }
    float _366 = _320;
    bool _368 = !_234;
    if (!_368)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = 1.0 / _376;
        float _380 = _166 * _372;
        float _382 = exp2(_380);
        float _384 = -_382;
        float _386 = _384 + 1.0;
        float _388 = _386 * _378;
        _258 = _388;
    }
    float _390 = _258;
    float _392 = _108 + _110;
    float _394 = in.m_37.x;
    float _396 = in.m_37.y;
    float _398 = in.m_37.z;
    float _400 = _392 + (-1.0);
    float _402 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _404 = _108 + _144;
    float _406 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _410 = _408 != 0;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _418 = _416 != 0;
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _402);
    float _422 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _424 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _426 = !_410;
    int _428 = _426 ? 0 : 1;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _422);
    bool _432 = _154 > 0.5;
    float _434 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _424);
    float _436 = in.m_32.x;
    float _438 = in.m_32.y;
    float _440 = in.m_32.z;
    float _442 = _404 + (-1.0);
    float _444 = in.m_43.x;
    float _446 = in.m_43.y;
    float _448 = in.m_43.z;
    float _450 = in.m_43.w;
    float _452 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _454 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _452);
    float _456 = _110 + _144;
    float _458 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _460 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _462 = _456 + (-1.0);
    float _464 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _458);
    float _466 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _460);
    float _468 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _470 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _472 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _474 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _476 = fma(_390, _394, _468);
    float _478 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _420);
    float _480 = fma(_390, _396, _472);
    float _482 = fma(_390, _398, _474);
    float _484 = fma(_476, _450, _436);
    float _486 = _444 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _488 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _490 = _448 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _492 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _494 = in.m_45.x;
    float _496 = in.m_45.y;
    float _498 = in.m_45.z;
    float _500 = fma(_480, _450, _438);
    float _502 = fma(_482, _450, _440);
    int _504 = abs(_428);
    float _506 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _508 = !_414;
    int _510 = _508 ? 0 : 1;
    float _512 = _500 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _514 = float(_332);
    float _516 = _500 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _518 = float(_504);
    float _520 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[5].x, _512);
    int _522 = abs(_510);
    float _524 = _500 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _526 = !_418;
    int _528 = _526 ? 0 : 1;
    float _530 = _518 * _514;
    float _532 = float(_264);
    float _534 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[4].x, _524);
    float _536 = _530 * (-2.0);
    int _538 = abs(_528);
    float _540 = fma(_484, (*spvDescriptorSet0.vp_c10)._m0[6].x, _516);
    float _542 = float(_522);
    float _544 = fma(_406, _536, _406);
    bool _546 = _418;
    if (_302)
    {
        bool _548 = _108 > 0.5;
        _546 = _548;
    }
    bool _550 = _546;
    float _552 = _108 + (-0.5);
    float _554 = fma(_536, _494, _494);
    float _556 = float(_326);
    float _558 = _542 * _532;
    float _560 = float(_538);
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    float _564 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
    float _566 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].z, _520);
    float _568 = in.m_47.x;
    float _570 = _560 * _556;
    float _572 = _558 * (-2.0);
    float _574 = fma(_544, _268, _562);
    float _576 = _566 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = in.m_49.x;
    float _580 = in.m_49.y;
    float _582 = in.m_49.z;
    float _584 = fma(_470, _572, _470);
    float _586 = fma(_572, _496, _496);
    float _588 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].z, _540);
    bool _590 = _110 > 0.5;
    float _592 = _110 + (-0.5);
    float _594 = _564 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _596 = -_576;
    float _598 = _596 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _588 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _602 = rsqrt(_478);
    float _604 = -_594;
    float _606 = _604 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _608 = _598 * _598;
    float _610 = -_600;
    float _612 = _610 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _614 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[196].y, _586);
    float _616 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _618 = _574 * 0.15915493667125701904296875;
    float _620 = fma(_584, _268, _614);
    float _622 = fma(_606, _606, _608);
    int _624 = as_type<int>(_614);
    float _626 = _622;
    float _628 = _568;
    if (_302)
    {
        float _630 = -_568;
        float _632 = _630 + 1.0;
        _624 = as_type<int>(_632);
    }
    int _634 = _624;
    float _636 = _570 * (-2.0);
    float _638 = _620 * 0.15915493667125701904296875;
    float _640 = fma(_612, _612, _622);
    if (!_302)
    {
        _626 = _568;
    }
    float _642 = _626;
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _578);
    float _646 = _642;
    float _648 = _578;
    if (_302)
    {
        float _650 = _550 ? as_type<float>(_634) : _568;
        _646 = _650;
    }
    float _652 = _646;
    float _654 = rsqrt(_640);
    bool _656 = _144 > 0.5;
    bool _658 = _656 && _306;
    float _660 = _506 * _644;
    float _662 = fma(_636, _498, _498);
    float _664 = _144 + (-0.5);
    float _666 = fma(_492, _636, _492);
    float _668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _580);
    float _670 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _672 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].z, _662);
    float _674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _582);
    float _676 = _618 * 6.283185482025146484375;
    float _678 = sin(_676);
    float _680 = _670 * _668;
    float _682 = fma(_666, _268, _672);
    float _684 = _616 * _674;
    out.m_51.x = _568;
    float _686 = _606 * _654;
    float _688 = _612 * _654;
    float _690 = _682 * 0.15915493667125701904296875;
    float _692 = _598 * _654;
    float _694 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _696 = _686 * _694;
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _700 = _688 * _698;
    float _702 = _618 * 6.283185482025146484375;
    float _704 = cos(_702);
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _708 = _692 * _706;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _712 = -_696;
    float _714 = fma(_688, _710, _712);
    float _716 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _430);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_708;
    float _722 = fma(_686, _718, _720);
    float _724 = _714 * _714;
    float _726 = _638 * 6.283185482025146484375;
    float _728 = sin(_726);
    float _730 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _434);
    bool _732 = _580 != 0.0;
    bool _734 = isnan(_580);
    bool _736 = _732 || _734;
    bool _738 = isnan(0.0);
    bool _740 = _736 || _738;
    float _742 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _466);
    float _744 = _638 * 6.283185482025146484375;
    float _746 = cos(_744);
    bool _748 = _578 == 0.0;
    bool _750 = !_740;
    bool _752 = _748 && _750;
    bool _754 = _582 == 0.0;
    bool _756 = _754 && _752;
    float _758 = _690 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _764 = -_700;
    float _766 = fma(_692, _762, _764);
    float _768 = fma(_766, _766, _724);
    float _770 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _454);
    float _772 = _678 * _728;
    float _774 = _690 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(_722, _722, _768);
    float _780 = _704 * _746;
    float _782 = _678 * _746;
    float _784 = _704 * _728;
    float _786 = rsqrt(_778);
    float _788 = _746 * _760;
    float _790 = _704 * _760;
    float _792 = _678 * _760;
    float _794 = _728 * _760;
    float _796 = fma(_776, _780, _772);
    float _798 = fma(_776, _772, _780);
    float _800 = -_784;
    float _802 = fma(_776, _782, _800);
    float _804 = rsqrt(_716);
    float _806 = _790 * _680;
    float _808 = -_782;
    float _810 = fma(_776, _784, _808);
    float _812 = -_680;
    float _814 = _776 * _812;
    float _816 = _792 * _680;
    float _818 = _722 * _786;
    float _820 = _766 * _786;
    float _822 = _714 * _786;
    float _824 = rsqrt(_730);
    float _826 = fma(_796, _660, _806);
    float _828 = _686 * _818;
    float _830 = fma(_802, _660, _816);
    float _832 = _688 * _822;
    float _834 = fma(_788, _660, _814);
    float _836 = _692 * _820;
    float _838 = fma(_810, _684, _826);
    float _840 = -_828;
    float _842 = fma(_688, _820, _840);
    float _844 = -_832;
    float _846 = fma(_692, _818, _844);
    float _848 = -_836;
    float _850 = fma(_686, _822, _848);
    float _852 = fma(_794, _684, _834);
    float _854 = _842 * _838;
    float _856 = _602 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _858 = _846 * _838;
    float _860 = _850 * _838;
    float _862 = fma(_798, _684, _830);
    float _864 = _804 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _866 = fma(_822, _852, _854);
    float _868 = _824 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _870 = fma(_820, _852, _858);
    float _872 = fma(_818, _852, _860);
    float _874 = _856 * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _876 = _864 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _878 = fma(_692, _862, _866);
    float _880 = _868 * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _882 = fma(_686, _862, _870);
    float _884 = fma(_688, _862, _872);
    float _886 = _878 * _874;
    float _888 = _878 * _876;
    float _890 = _878 * _880;
    float _892 = in.m_47.y;
    float _894 = _856 * (*spvDescriptorSet0.vp_c10)._m0[18].x;
    float _896 = _864 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _898 = _868 * (*spvDescriptorSet0.vp_c10)._m0[20].x;
    float _900 = sqrt(_742);
    float _902 = fma(_882, _894, _886);
    float _904 = fma(_882, _896, _888);
    float _906 = _864 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _908 = fma(_882, _898, _890);
    float _910 = _856 * (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _912 = _868 * (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _914 = fma(_884, _906, _904);
    float _916 = sqrt(_770);
    float _918 = fma(_884, _910, _902);
    float _920 = fma(_884, _912, _908);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _926 = in.m_53.x;
    float _928 = in.m_53.y;
    float _930 = in.m_53.z;
    float _932 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[18].x, _922);
    float _934 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[18].z, _924);
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[192].y * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _938 = _790 * _842;
    float _940 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[20].x, _932);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[20].z, _934);
    float _944 = -_892;
    float _946 = _944 + 1.0;
    float _948 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _464);
    float _950 = _594 + _940;
    float _952 = _600 + _942;
    float _954 = _936 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = _936 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _958 = _432 ? as_type<int>(_946) : as_type<int>(_892);
    out.m_51.y = _892;
    float _960 = fma(_954, _916, _950);
    float _962 = fma(_956, _900, _952);
    float _964 = _310 ? as_type<float>(_958) : _892;
    float _966 = _790 * _846;
    float _968 = _790 * _850;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _962 + _970;
    float _974 = _796 * _846;
    float _976 = _892;
    float _978 = _688;
    float _980 = _686;
    float _982 = _960;
    if (_314)
    {
        float _984 = _590 ? _946 : _892;
        _976 = _984;
    }
    float _986 = _976;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _990 = _960 + _988;
    float _992 = _926;
    float _994 = _930;
    float _996 = _928;
    if (!_756)
    {
        float _998 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _926);
        _992 = _998;
    }
    float _1000 = _992;
    float _1002 = _972 * _972;
    float _1004 = _1002;
    if (!_306)
    {
        _648 = _568;
    }
    float _1006 = _648;
    float _1008 = _990 * _990;
    float _1010 = _1006;
    float _1012 = _1008;
    if (_658)
    {
        float _1014 = -_568;
        float _1016 = _1014 + 1.0;
        _628 = _1016;
    }
    float _1018 = _628;
    if (!_756)
    {
        float _1020 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[17].y, _930);
        _994 = _1020;
    }
    float _1022 = _994;
    float _1024 = _796 * _842;
    float _1026 = _1008 + _1002;
    float _1028 = _796 * _850;
    if (_306)
    {
        _1010 = _1018;
    }
    float _1030 = _1010;
    float _1032 = _810 * _846;
    float _1034 = sqrt(_1026);
    float _1036 = _810 * _842;
    float _1038 = _810 * _850;
    float _1040 = -_776;
    float _1042 = fma(_1040, _820, _966);
    float _1044 = -_776;
    float _1046 = fma(_1044, _822, _938);
    float _1048 = -_776;
    float _1050 = fma(_1048, _818, _968);
    float _1052 = fma(_788, _820, _974);
    float _1054 = fma(_788, _822, _1024);
    float _1056 = fma(_788, _818, _1028);
    float _1058 = _914 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1060 = sqrt(_948);
    if (!_756)
    {
        float _1062 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[17].y, _928);
        _996 = _1062;
    }
    float _1064 = _996;
    float _1066 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1068 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[18].y, _1058);
    float _1070 = fma(_794, _820, _1032);
    float _1072 = fma(_794, _822, _1036);
    bool _1074 = _1034 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1076 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[20].y, _1068);
    float _1078 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1080 = fma(_794, _818, _1038);
    float _1082 = fma(_792, _686, _1042);
    float _1084 = _576 + _1076;
    float _1086 = fma(_792, _692, _1046);
    float _1088 = fma(_792, _688, _1050);
    float _1090 = fma(_802, _692, _1054);
    float _1092 = fma(_802, _686, _1052);
    float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1096 = fma(_1066, _1060, _1084);
    float _1098 = fma(_798, _686, _1070);
    float _1100 = fma(_798, _692, _1072);
    float _1102 = fma(_802, _688, _1056);
    float _1104 = fma(_798, _688, _1080);
    if (!_1074)
    {
        _978 = _962;
    }
    float _1106 = _978;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1110 = _1106;
    if (!_1074)
    {
        _980 = _1096;
    }
    float _1112 = _980;
    bool _1114 = !_1074;
    float _1116 = _1112;
    if (!_1114)
    {
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1122 = _1034 + _1120;
        float _1124 = rsqrt(_1026);
        float _1126 = _1122 * _1118;
        float _1128 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1130 = _1126 * 0.15915493667125701904296875;
        float _1132 = _1130 * 6.283185482025146484375;
        float _1134 = sin(_1132);
        float _1136 = _1130 * 6.283185482025146484375;
        float _1138 = cos(_1136);
        float _1140 = fma(_1134, _1128, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1142 = _1124 * _1140;
        float _1144 = fma(_990, _1142, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1146 = _1138 + (-1.0);
        float _1148 = fma(_972, _1142, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _1144 + _1150;
        float _1154 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1158 = _1148 + _1156;
        float _1160 = _1152 * _1152;
        float _1162 = fma(_1096, _1138, _1154);
        float _1164 = _1158 * _1158;
        _1116 = _1162;
        _1012 = _1160;
        _1004 = _1164;
        _982 = _1144;
        _1110 = _1148;
    }
    float _1166 = _1116;
    float _1168 = _1012;
    float _1170 = _1004;
    float _1172 = _982;
    float _1174 = _1110;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1180 = _1166 + _1178;
    float _1182 = _1082 * _1064;
    float _1184 = _1086 * _1064;
    float _1186 = _1088 * _1064;
    float _1188 = fma(_1180, _1180, _1168);
    float _1190 = fma(_1092, _1000, _1182);
    float _1192 = fma(_1090, _1000, _1184);
    float _1194 = fma(_1102, _1000, _1186);
    float _1196 = _652 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1198 = _964 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1200 = _986 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1202 = _1188 + _1170;
    float _1204 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1206 = _1196 * _1078;
    float _1208 = _1198 * _1108;
    float _1210 = _1200 * _1094;
    float _1212 = fma(_1098, _1022, _1190);
    float _1214 = _1204 * _1176;
    float _1216 = sqrt(_1202);
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1230 = fma(_1100, _1022, _1192);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1234 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1238 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = fma(_1104, _1022, _1194);
    out.m_55.x = _1206;
    out.m_55.y = _1210;
    out.m_55.z = _1214;
    out.m_55.w = _1208;
    bool _1250 = _1216 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1252 = isnan(_1216);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1258 = _1254 || _1256;
    out.m_57.x = _1234;
    out.m_57.y = _1238;
    out.m_57.z = _1240;
    out.m_57.w = _1232;
    out.m_59.x = _1242;
    out.m_59.y = _1244;
    out.m_59.z = _1246;
    out.m_59.w = _1236;
    out.m_61.x = _1212;
    out.m_61.y = _1230;
    out.m_61.z = _1248;
    float _1260 = _1180;
    if (!_1258)
    {
        _1260 = 1.0;
    }
    float _1262 = _1260;
    bool _1264 = !_1258;
    float _1266 = _1262;
    if (!_1264)
    {
        bool _1268 = _1216 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1270 = isnan(_1216);
        bool _1272 = _1268 || _1270;
        bool _1274 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1276 = _1272 || _1274;
        if (!_1276)
        {
            float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1280 = _1216 + _1278;
            float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1284 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1282;
            float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1288 = _1286 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1290 = 1.0 / _1284;
            float _1292 = _1280 * _1290;
            float _1294 = fma(_1292, _1288, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1266 = _1294;
            _1296 = true;
        }
        else
        {
            bool _1298 = _1216 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1300 = isnan(_1216);
            bool _1302 = _1298 || _1300;
            bool _1304 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1306 = _1302 || _1304;
            if (!_1306)
            {
                float _1308 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1310 = _1216 + _1308;
                float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1314 = _1312 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1318 = _1316 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1320 = 1.0 / _1314;
                float _1322 = _1310 * _1320;
                float _1324 = fma(_1322, _1318, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1266 = _1324;
                _1296 = true;
            }
            else
            {
                _1266 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1296 = false;
    float _1326 = _1266;
    float _1328 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1330 = _1166 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1334 = _1172 + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1338 = _1174 + _1336;
    float _1340 = fma(_1330, _1326, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1342 = fma(_1334, _1326, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1344 = fma(_1338, _1326, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1348 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1354 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1346);
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1348);
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1350);
    float _1360 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1352);
    float _1362 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1364 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1356);
    float _1366 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1358);
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1360);
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1372 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1386 = _1340 + _1384;
    float _1388 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1378);
    float _1390 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1380);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1342 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1398 = _1344 + _1396;
    float _1400 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1388);
    float _1402 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1388);
    float _1404 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1390);
    float _1406 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1400);
    float _1408 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _1394;
    out.m_63.y = _1386;
    out.m_63.z = _1398;
    float _1410 = 1.0 / _1406;
    float _1412 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1408);
    float _1414 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1416 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1412);
    float _1418 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1414);
    float _1420 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1404);
    float _1422 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1416);
    float _1424 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1418);
    float _1426 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1428 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1424);
    float _1430 = _1422 * _1410;
    float _1432 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1402);
    out.m_35.x = _1426;
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1436 = fma(_1432, _1430, _1434);
    float _1438 = _1432 + _1436;
    out.gl_Position.x = _1428;
    out.gl_Position.y = _1420;
    out.gl_Position.z = _1436;
    out.gl_Position.w = _1432;
    float _1440 = _1438 * 0.5;
    out.m_65.z = _1440;
    out.m_65.w = _1432;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

