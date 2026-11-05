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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_57 [[attribute(0)]];
    float4 m_30 [[attribute(2)]];
    float4 m_32 [[attribute(3)]];
    float4 m_45 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = in.m_32.w;
    float _79 = trunc(_75);
    int _82 = int(_79);
    float _84 = -_77;
    float _86 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _86;
    bool _90 = _82 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_82);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_37.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _775 = as_type<float>(_102);
        out.gl_Position.z = _775;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _106 = _77 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_77);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = float(_82);
    bool _118 = _86 >= _116;
    bool _120 = !_114;
    bool _122 = _118 || _120;
    if (_122)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _94;
    if (_122)
    {
        out.m_37.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _104 = as_type<int>(_126);
    }
    int _128 = _104;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _830 = as_type<float>(_128);
        out.gl_Position.z = _830;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_39.w;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _136 = _134 != 0;
    float _138 = in.m_41.x;
    float _140 = in.m_41.y;
    float _142 = in.m_41.z;
    int _144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _146 = _144 != 0;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _150 = _148 != 0;
    float _152 = in.m_43.y;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _156 = _154 != 0;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _162 = _160 != 0;
    float _164 = in.m_45.x;
    float _166 = in.m_45.y;
    float _168 = in.m_45.z;
    float _170 = 0.0;
    if (_136)
    {
        float _172 = in.m_39.x;
        _170 = _172;
    }
    float _174 = _170;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _180 = 0.0;
    if (!_146)
    {
        float _182 = in.m_39.y;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _188 = in.m_43.x;
    bool _190 = _130 > 0.5;
    float _192 = 0.0;
    if (_150)
    {
        float _194 = in.m_39.z;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _200 = _140 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _202 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _204 = -_152;
    float _206 = _204 + 1.0;
    out.m_47.y = _152;
    float _208 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _210 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _166);
    float _214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _164);
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _168);
    int _218 = _190 ? as_type<int>(_206) : as_type<int>(_152);
    float _220 = _208 * _212;
    bool _222 = false;
    float _224 = _198;
    int _226 = as_type<int>(_214);
    float _228 = _202;
    float _230 = _216;
    float _232 = _152;
    if (_136)
    {
        bool _234 = _174 > 0.5;
        _222 = _234;
    }
    bool _236 = _222;
    float _238 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _240 = _208;
    if (!_146)
    {
        float _242 = in.m_39.z;
        _240 = _242;
    }
    float _244 = _240;
    float _246 = _188;
    if (!_146)
    {
        _224 = _184;
    }
    float _248 = _224;
    float _250 = _132 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _252 = _238 * _214;
    float _254 = _156 ? as_type<float>(_218) : _152;
    if (_136)
    {
        float _256 = -_188;
        float _258 = _256 + 1.0;
        _226 = as_type<int>(_258);
    }
    int _260 = _226;
    if (!_136)
    {
        _228 = _188;
    }
    float _262 = _228;
    float _264 = _248;
    float _266 = _184;
    float _268 = _262;
    if (_146)
    {
        float _270 = in.m_39.x;
        float _272 = in.m_39.y;
        _264 = _270;
        _266 = _272;
    }
    float _274 = _264;
    float _276 = _266;
    float _278 = _210 * _216;
    bool _280 = _196 > 0.5;
    bool _282 = _280 && _150;
    float _284 = fma(_250, _254, -0.5);
    if (_136)
    {
        float _286 = _236 ? as_type<float>(_260) : _188;
        _268 = _286;
    }
    float _288 = _268;
    float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _292 = in.m_30.x;
    float _294 = in.m_30.y;
    float _296 = in.m_30.z;
    if (!_150)
    {
        _230 = _188;
    }
    float _298 = _230;
    out.m_47.x = _188;
    float _300 = _298;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_282)
    {
        float _304 = -_188;
        float _306 = _304 + 1.0;
        _246 = _306;
    }
    float _308 = _246;
    float _310 = _290 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_150)
    {
        _300 = _308;
    }
    float _312 = _300;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _316 = _244;
    if (!_146)
    {
        _302 = _244;
    }
    float _318 = _302;
    float _320 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[83].z, _176);
    float _322 = _318;
    if (_146)
    {
        _316 = _276;
    }
    float _324 = _316;
    float _326 = _274 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_146)
    {
        _322 = _276;
    }
    float _328 = _322;
    float _330 = fma(_310, _312, -0.5);
    float _332 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[83].w, _186);
    float _336 = -_314;
    float _338 = fma(_326, 2.0, _336);
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _342 = _328 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _344 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[82].z, _320);
    float _346 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _348 = -_86;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[81].x, _338);
    float _352 = fma(_342, -2.0, _340);
    float _354 = _220 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _356 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _346);
    bool _358 = _276 > 0.5;
    float _360 = fma(_344, _330, _350);
    float _362 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _332);
    float _364 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _356);
    float _366 = _220 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _368 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _354);
    float _370 = _296;
    float _372 = _292;
    if (_162)
    {
        float _374 = _358 ? _206 : _152;
        _232 = _374;
    }
    float _376 = _232;
    float _378 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _362);
    float _380 = _364 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _382 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _366);
    float _384 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].z, _368);
    float _386 = _378 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _388 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[82].w, _334);
    float _390 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].z, _382);
    float _392 = _380 + _384;
    float _394 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[81].y, _352);
    float _396 = _288 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _398 = _386 + _390;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _402 = _392 + _400;
    float _404 = -_394;
    float _406 = fma(_388, _284, _404);
    float _408 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _410 = _398 + _408;
    float _412 = _402 * _402;
    float _414 = _376 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _416 = fma(_410, _410, _412);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _422 = _396 * _158;
    float _424 = sqrt(_416);
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _428 = _414 * _178;
    float _430 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _360 + 0.5;
    float _438 = _406 + 0.5;
    float _440 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _442 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_49.x = _430;
    out.m_49.y = _432;
    out.m_49.z = _434;
    float _444 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _440);
    float _446 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _442);
    out.m_51.x = _422;
    out.m_51.y = _428;
    out.m_51.z = _436;
    out.m_51.w = _438;
    bool _448 = _424 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _450 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _452 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].z, _446);
    float _454 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _456 = _454 + _452;
    float _458 = _456;
    int _460 = as_type<int>(_410);
    if (!_448)
    {
        _370 = _398;
    }
    float _462 = _370;
    float _464 = _462;
    if (!_448)
    {
        _372 = _392;
    }
    float _466 = _372;
    bool _468 = !_448;
    float _470 = _466;
    if (!_468)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _476 = _424 + _474;
        float _478 = rsqrt(_416);
        float _480 = _476 * _472;
        float _482 = _456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _484 = _480 * 0.15915493667125701904296875;
        float _486 = _484 * 6.283185482025146484375;
        float _488 = cos(_486);
        float _490 = _484 * 6.283185482025146484375;
        float _492 = sin(_490);
        float _494 = _488 + (-1.0);
        float _496 = _494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _498 = fma(_492, _482, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _500 = fma(_456, _488, _496);
        float _502 = _478 * _498;
        float _504 = fma(_410, _502, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _506 = fma(_402, _502, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _458 = _500;
        _464 = _504;
        _470 = _506;
    }
    float _508 = _458;
    float _510 = _464;
    float _512 = _470;
    out.m_53.x = _386;
    out.m_53.y = _454;
    out.m_53.z = _380;
    bool _514 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _516 = isnan(0.5);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _522 = _518 || _520;
    float _524 = _508 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _526 = _508 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _528 = _508 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _530 = _508 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _532 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _524);
    float _534 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _526);
    float _536 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _528);
    float _538 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _530);
    float _540 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _532);
    float _542 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _534);
    float _544 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _536);
    float _546 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _538);
    float _548 = _512;
    if (_522)
    {
        _548 = 1.0;
    }
    float _550 = _548;
    float _552 = _550;
    if (!_522)
    {
        float _554 = as_type<float>(in.m_57.w);
        int _556 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _558 = _556 == 4;
        bool _560 = _556 == 8;
        bool _562 = _556 == 12;
        int _564 = as_type<int>(_554) << 16;
        int _566 = as_type<int>(_554) << 8;
        int _568 = as_type<int>(_554) << 24;
        int _570 = _564 >> 24;
        int _572 = _566 >> 24;
        int _574 = as_type<int>(_554) >> 24;
        int _576 = _568 >> 24;
        float _578 = float(_570);
        float _580 = float(_572);
        float _582 = float(_574);
        float _584 = _578 * 0.0078740157186985015869140625;
        float _586 = float(_576);
        float _588 = _580 * 0.0078740157186985015869140625;
        float _590 = _582 * 0.0078740157186985015869140625;
        float _592 = precise::min(_584, 1.0);
        float _594 = _586 * 0.0078740157186985015869140625;
        float _596 = precise::min(_588, 1.0);
        float _598 = precise::min(_590, 1.0);
        float _600 = precise::min(_594, 1.0);
        float _602 = precise::max(_592, -1.0);
        float _604 = precise::max(_596, -1.0);
        float _606 = precise::max(_598, -1.0);
        float _608 = precise::max(_600, -1.0);
        float _610 = _608;
        if (_558)
        {
            _610 = _602;
        }
        float _612 = _610;
        float _614 = _612;
        if (_560)
        {
            _614 = _604;
        }
        float _616 = _614;
        float _618 = _616;
        if (_562)
        {
            _618 = _606;
        }
        float _620 = _618;
        float _622 = abs(_620);
        float _624 = (-0.0) + _622;
        _552 = _624;
    }
    float _626 = _552;
    float _628 = _542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _630 = _540 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _632 = _626 != 0.0;
    bool _634 = isnan(_626);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    float _642 = _544 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _644 = _628 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _646 = _628 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _648 = _628 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _650 = _628 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _652 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _644);
    out.m_37.x = 1.0;
    float _654 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _646);
    float _656 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _650);
    float _658 = _546 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _660 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _662 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[4].z, _656);
    float _664 = _660;
    float _666 = _658;
    if (!_640)
    {
        _664 = 0.0;
    }
    float _668 = _664;
    float _670 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _648);
    float _672 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[6].z, _652);
    float _674 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[5].z, _654);
    float _676 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[4].w, _662);
    float _678 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[7].z, _670);
    float _680 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[6].w, _672);
    float _682 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[5].w, _674);
    float _684 = _668 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _686 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[7].w, _678);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _690 = _680 + _688;
    if (!_640)
    {
        _666 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _692 = _666;
    float _694 = _686 * 0.5;
    float _696 = _676 + _686;
    float _698 = _686 + _690;
    if (!_640)
    {
        float _700 = _692 * 5.0;
        _460 = as_type<int>(_700);
    }
    int _702 = _460;
    float _704 = fma(_682, -0.5, _694);
    float _706 = _696 * 0.5;
    float _708 = _698 * 0.5;
    out.gl_Position.x = _676;
    out.gl_Position.y = _682;
    out.gl_Position.z = _690;
    out.gl_Position.w = _686;
    out.m_59.w = _684;
    if (!_640)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1861 = as_type<float>(_702);
        out.gl_Position.z = _1861;
    }
    out.m_61.x = _706;
    out.m_61.y = _704;
    out.m_61.z = _708;
    out.m_61.w = _686;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = in.m_32.w;
    float _79 = trunc(_75);
    int _82 = int(_79);
    float _84 = -_77;
    float _86 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _86;
    bool _90 = _82 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_82);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_37.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _775 = as_type<float>(_102);
        out.gl_Position.z = _775;
    }
    if (!_90)
    {
        return out;
    }
    bool _106 = _77 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_77);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = float(_82);
    bool _118 = _86 >= _116;
    bool _120 = !_114;
    bool _122 = _118 || _120;
    if (_122)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _94;
    if (_122)
    {
        out.m_37.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _104 = as_type<int>(_126);
    }
    int _128 = _104;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _830 = as_type<float>(_128);
        out.gl_Position.z = _830;
    }
    if (_122)
    {
        return out;
    }
    float _130 = in.m_39.w;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _136 = _134 != 0;
    float _138 = in.m_41.x;
    float _140 = in.m_41.y;
    float _142 = in.m_41.z;
    int _144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _146 = _144 != 0;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _150 = _148 != 0;
    float _152 = in.m_43.y;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _156 = _154 != 0;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _162 = _160 != 0;
    float _164 = in.m_45.x;
    float _166 = in.m_45.y;
    float _168 = in.m_45.z;
    float _170 = 0.0;
    if (_136)
    {
        float _172 = in.m_39.x;
        _170 = _172;
    }
    float _174 = _170;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _180 = 0.0;
    if (!_146)
    {
        float _182 = in.m_39.y;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _188 = in.m_43.x;
    bool _190 = _130 > 0.5;
    float _192 = 0.0;
    if (_150)
    {
        float _194 = in.m_39.z;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _200 = _140 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _202 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _204 = -_152;
    float _206 = _204 + 1.0;
    out.m_47.y = _152;
    float _208 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _210 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _166);
    float _214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _164);
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _168);
    int _218 = _190 ? as_type<int>(_206) : as_type<int>(_152);
    float _220 = _208 * _212;
    bool _222 = false;
    float _224 = _198;
    int _226 = as_type<int>(_214);
    float _228 = _202;
    float _230 = _216;
    float _232 = _152;
    if (_136)
    {
        bool _234 = _174 > 0.5;
        _222 = _234;
    }
    bool _236 = _222;
    float _238 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _240 = _208;
    if (!_146)
    {
        float _242 = in.m_39.z;
        _240 = _242;
    }
    float _244 = _240;
    float _246 = _188;
    if (!_146)
    {
        _224 = _184;
    }
    float _248 = _224;
    float _250 = _132 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _252 = _238 * _214;
    float _254 = _156 ? as_type<float>(_218) : _152;
    if (_136)
    {
        float _256 = -_188;
        float _258 = _256 + 1.0;
        _226 = as_type<int>(_258);
    }
    int _260 = _226;
    if (!_136)
    {
        _228 = _188;
    }
    float _262 = _228;
    float _264 = _248;
    float _266 = _184;
    float _268 = _262;
    if (_146)
    {
        float _270 = in.m_39.x;
        float _272 = in.m_39.y;
        _264 = _270;
        _266 = _272;
    }
    float _274 = _264;
    float _276 = _266;
    float _278 = _210 * _216;
    bool _280 = _196 > 0.5;
    bool _282 = _280 && _150;
    float _284 = fma(_250, _254, -0.5);
    if (_136)
    {
        float _286 = _236 ? as_type<float>(_260) : _188;
        _268 = _286;
    }
    float _288 = _268;
    float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _292 = in.m_30.x;
    float _294 = in.m_30.y;
    float _296 = in.m_30.z;
    if (!_150)
    {
        _230 = _188;
    }
    float _298 = _230;
    out.m_47.x = _188;
    float _300 = _298;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_282)
    {
        float _304 = -_188;
        float _306 = _304 + 1.0;
        _246 = _306;
    }
    float _308 = _246;
    float _310 = _290 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_150)
    {
        _300 = _308;
    }
    float _312 = _300;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _316 = _244;
    if (!_146)
    {
        _302 = _244;
    }
    float _318 = _302;
    float _320 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[83].z, _176);
    float _322 = _318;
    if (_146)
    {
        _316 = _276;
    }
    float _324 = _316;
    float _326 = _274 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_146)
    {
        _322 = _276;
    }
    float _328 = _322;
    float _330 = fma(_310, _312, -0.5);
    float _332 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[83].w, _186);
    float _336 = -_314;
    float _338 = fma(_326, 2.0, _336);
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _342 = _328 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _344 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[82].z, _320);
    float _346 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _348 = -_86;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[81].x, _338);
    float _352 = fma(_342, -2.0, _340);
    float _354 = _220 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _356 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _346);
    bool _358 = _276 > 0.5;
    float _360 = fma(_344, _330, _350);
    float _362 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _332);
    float _364 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _356);
    float _366 = _220 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _368 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _354);
    float _370 = _296;
    float _372 = _292;
    if (_162)
    {
        float _374 = _358 ? _206 : _152;
        _232 = _374;
    }
    float _376 = _232;
    float _378 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _362);
    float _380 = _364 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _382 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _366);
    float _384 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].z, _368);
    float _386 = _378 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _388 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[82].w, _334);
    float _390 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].z, _382);
    float _392 = _380 + _384;
    float _394 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[81].y, _352);
    float _396 = _288 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _398 = _386 + _390;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _402 = _392 + _400;
    float _404 = -_394;
    float _406 = fma(_388, _284, _404);
    float _408 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _410 = _398 + _408;
    float _412 = _402 * _402;
    float _414 = _376 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _416 = fma(_410, _410, _412);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _422 = _396 * _158;
    float _424 = sqrt(_416);
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _428 = _414 * _178;
    float _430 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _360 + 0.5;
    float _438 = _406 + 0.5;
    float _440 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _442 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_49.x = _430;
    out.m_49.y = _432;
    out.m_49.z = _434;
    float _444 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _440);
    float _446 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _442);
    out.m_51.x = _422;
    out.m_51.y = _428;
    out.m_51.z = _436;
    out.m_51.w = _438;
    bool _448 = _424 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _450 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _452 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].z, _446);
    float _454 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _456 = _454 + _452;
    float _458 = _456;
    int _460 = as_type<int>(_410);
    if (!_448)
    {
        _370 = _398;
    }
    float _462 = _370;
    float _464 = _462;
    if (!_448)
    {
        _372 = _392;
    }
    float _466 = _372;
    bool _468 = !_448;
    float _470 = _466;
    if (!_468)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _476 = _424 + _474;
        float _478 = rsqrt(_416);
        float _480 = _476 * _472;
        float _482 = _456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _484 = _480 * 0.15915493667125701904296875;
        float _486 = _484 * 6.283185482025146484375;
        float _488 = cos(_486);
        float _490 = _484 * 6.283185482025146484375;
        float _492 = sin(_490);
        float _494 = _488 + (-1.0);
        float _496 = _494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _498 = fma(_492, _482, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _500 = fma(_456, _488, _496);
        float _502 = _478 * _498;
        float _504 = fma(_410, _502, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _506 = fma(_402, _502, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _458 = _500;
        _464 = _504;
        _470 = _506;
    }
    float _508 = _458;
    float _510 = _464;
    float _512 = _470;
    out.m_53.x = _386;
    out.m_53.y = _454;
    out.m_53.z = _380;
    bool _514 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _516 = isnan(0.5);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _522 = _518 || _520;
    float _524 = _508 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _526 = _508 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _528 = _508 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _530 = _508 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _532 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _524);
    float _534 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _526);
    float _536 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _528);
    float _538 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _530);
    float _540 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _532);
    float _542 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _534);
    float _544 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _536);
    float _546 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _538);
    float _548 = _512;
    if (_522)
    {
        _548 = 1.0;
    }
    float _550 = _548;
    float _552 = _550;
    if (!_522)
    {
        float _554 = as_type<float>(in.m_57.w);
        int _556 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _558 = _556 == 4;
        bool _560 = _556 == 8;
        bool _562 = _556 == 12;
        int _564 = as_type<int>(_554) << 16;
        int _566 = as_type<int>(_554) << 8;
        int _568 = as_type<int>(_554) << 24;
        int _570 = _564 >> 24;
        int _572 = _566 >> 24;
        int _574 = as_type<int>(_554) >> 24;
        int _576 = _568 >> 24;
        float _578 = float(_570);
        float _580 = float(_572);
        float _582 = float(_574);
        float _584 = _578 * 0.0078740157186985015869140625;
        float _586 = float(_576);
        float _588 = _580 * 0.0078740157186985015869140625;
        float _590 = _582 * 0.0078740157186985015869140625;
        float _592 = precise::min(_584, 1.0);
        float _594 = _586 * 0.0078740157186985015869140625;
        float _596 = precise::min(_588, 1.0);
        float _598 = precise::min(_590, 1.0);
        float _600 = precise::min(_594, 1.0);
        float _602 = precise::max(_592, -1.0);
        float _604 = precise::max(_596, -1.0);
        float _606 = precise::max(_598, -1.0);
        float _608 = precise::max(_600, -1.0);
        float _610 = _608;
        if (_558)
        {
            _610 = _602;
        }
        float _612 = _610;
        float _614 = _612;
        if (_560)
        {
            _614 = _604;
        }
        float _616 = _614;
        float _618 = _616;
        if (_562)
        {
            _618 = _606;
        }
        float _620 = _618;
        float _622 = abs(_620);
        float _624 = (-0.0) + _622;
        _552 = _624;
    }
    float _626 = _552;
    float _628 = _542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _630 = _540 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _632 = _626 != 0.0;
    bool _634 = isnan(_626);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    float _642 = _544 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _644 = _628 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _646 = _628 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _648 = _628 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _650 = _628 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _652 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _644);
    out.m_37.x = 1.0;
    float _654 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _646);
    float _656 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _650);
    float _658 = _546 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _660 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _662 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[4].z, _656);
    float _664 = _660;
    float _666 = _658;
    if (!_640)
    {
        _664 = 0.0;
    }
    float _668 = _664;
    float _670 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _648);
    float _672 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[6].z, _652);
    float _674 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[5].z, _654);
    float _676 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[4].w, _662);
    float _678 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[7].z, _670);
    float _680 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[6].w, _672);
    float _682 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[5].w, _674);
    float _684 = _668 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _686 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[7].w, _678);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _690 = _680 + _688;
    if (!_640)
    {
        _666 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _692 = _666;
    float _694 = _686 * 0.5;
    float _696 = _676 + _686;
    float _698 = _686 + _690;
    if (!_640)
    {
        float _700 = _692 * 5.0;
        _460 = as_type<int>(_700);
    }
    int _702 = _460;
    float _704 = fma(_682, -0.5, _694);
    float _706 = _696 * 0.5;
    float _708 = _698 * 0.5;
    out.gl_Position.x = _676;
    out.gl_Position.y = _682;
    out.gl_Position.z = _690;
    out.gl_Position.w = _686;
    out.m_59.w = _684;
    if (!_640)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1861 = as_type<float>(_702);
        out.gl_Position.z = _1861;
    }
    out.m_61.x = _706;
    out.m_61.y = _704;
    out.m_61.z = _708;
    out.m_61.w = _686;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = in.m_32.w;
    float _79 = trunc(_75);
    int _82 = int(_79);
    float _84 = -_77;
    float _86 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _86;
    bool _90 = _82 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_82);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_37.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _775 = as_type<float>(_102);
        out.gl_Position.z = _775;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _106 = _77 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_77);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = float(_82);
    bool _118 = _86 >= _116;
    bool _120 = !_114;
    bool _122 = _118 || _120;
    if (_122)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _94;
    if (_122)
    {
        out.m_37.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _104 = as_type<int>(_126);
    }
    int _128 = _104;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _830 = as_type<float>(_128);
        out.gl_Position.z = _830;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_39.w;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _136 = _134 != 0;
    float _138 = in.m_41.x;
    float _140 = in.m_41.y;
    float _142 = in.m_41.z;
    int _144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _146 = _144 != 0;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _150 = _148 != 0;
    float _152 = in.m_43.y;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _156 = _154 != 0;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _162 = _160 != 0;
    float _164 = in.m_45.x;
    float _166 = in.m_45.y;
    float _168 = in.m_45.z;
    float _170 = 0.0;
    if (_136)
    {
        float _172 = in.m_39.x;
        _170 = _172;
    }
    float _174 = _170;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _180 = 0.0;
    if (!_146)
    {
        float _182 = in.m_39.y;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _188 = in.m_43.x;
    bool _190 = _130 > 0.5;
    float _192 = 0.0;
    if (_150)
    {
        float _194 = in.m_39.z;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _200 = _140 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _202 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _204 = -_152;
    float _206 = _204 + 1.0;
    out.m_47.y = _152;
    float _208 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _210 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _166);
    float _214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _164);
    float _216 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _168);
    int _218 = _190 ? as_type<int>(_206) : as_type<int>(_152);
    float _220 = _208 * _212;
    bool _222 = false;
    float _224 = _198;
    int _226 = as_type<int>(_214);
    float _228 = _202;
    float _230 = _216;
    float _232 = _152;
    if (_136)
    {
        bool _234 = _174 > 0.5;
        _222 = _234;
    }
    bool _236 = _222;
    float _238 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _240 = _208;
    if (!_146)
    {
        float _242 = in.m_39.z;
        _240 = _242;
    }
    float _244 = _240;
    float _246 = _188;
    if (!_146)
    {
        _224 = _184;
    }
    float _248 = _224;
    float _250 = _132 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _252 = _238 * _214;
    float _254 = _156 ? as_type<float>(_218) : _152;
    if (_136)
    {
        float _256 = -_188;
        float _258 = _256 + 1.0;
        _226 = as_type<int>(_258);
    }
    int _260 = _226;
    if (!_136)
    {
        _228 = _188;
    }
    float _262 = _228;
    float _264 = _248;
    float _266 = _184;
    float _268 = _262;
    if (_146)
    {
        float _270 = in.m_39.x;
        float _272 = in.m_39.y;
        _264 = _270;
        _266 = _272;
    }
    float _274 = _264;
    float _276 = _266;
    float _278 = _210 * _216;
    bool _280 = _196 > 0.5;
    bool _282 = _280 && _150;
    float _284 = fma(_250, _254, -0.5);
    if (_136)
    {
        float _286 = _236 ? as_type<float>(_260) : _188;
        _268 = _286;
    }
    float _288 = _268;
    float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _292 = in.m_30.x;
    float _294 = in.m_30.y;
    float _296 = in.m_30.z;
    if (!_150)
    {
        _230 = _188;
    }
    float _298 = _230;
    out.m_47.x = _188;
    float _300 = _298;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_282)
    {
        float _304 = -_188;
        float _306 = _304 + 1.0;
        _246 = _306;
    }
    float _308 = _246;
    float _310 = _290 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_150)
    {
        _300 = _308;
    }
    float _312 = _300;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _316 = _244;
    if (!_146)
    {
        _302 = _244;
    }
    float _318 = _302;
    float _320 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[83].z, _176);
    float _322 = _318;
    if (_146)
    {
        _316 = _276;
    }
    float _324 = _316;
    float _326 = _274 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_146)
    {
        _322 = _276;
    }
    float _328 = _322;
    float _330 = fma(_310, _312, -0.5);
    float _332 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[83].w, _186);
    float _336 = -_314;
    float _338 = fma(_326, 2.0, _336);
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _342 = _328 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _344 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[82].z, _320);
    float _346 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _348 = -_86;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[81].x, _338);
    float _352 = fma(_342, -2.0, _340);
    float _354 = _220 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _356 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _346);
    bool _358 = _276 > 0.5;
    float _360 = fma(_344, _330, _350);
    float _362 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _332);
    float _364 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _356);
    float _366 = _220 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _368 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _354);
    float _370 = _296;
    float _372 = _292;
    if (_162)
    {
        float _374 = _358 ? _206 : _152;
        _232 = _374;
    }
    float _376 = _232;
    float _378 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _362);
    float _380 = _364 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _382 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _366);
    float _384 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[10].z, _368);
    float _386 = _378 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _388 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[82].w, _334);
    float _390 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[8].z, _382);
    float _392 = _380 + _384;
    float _394 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[81].y, _352);
    float _396 = _288 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _398 = _386 + _390;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _402 = _392 + _400;
    float _404 = -_394;
    float _406 = fma(_388, _284, _404);
    float _408 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _410 = _398 + _408;
    float _412 = _402 * _402;
    float _414 = _376 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _416 = fma(_410, _410, _412);
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _422 = _396 * _158;
    float _424 = sqrt(_416);
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _428 = _414 * _178;
    float _430 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _360 + 0.5;
    float _438 = _406 + 0.5;
    float _440 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _442 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_49.x = _430;
    out.m_49.y = _432;
    out.m_49.z = _434;
    float _444 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _440);
    float _446 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _442);
    out.m_51.x = _422;
    out.m_51.y = _428;
    out.m_51.z = _436;
    out.m_51.w = _438;
    bool _448 = _424 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _450 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _452 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[9].z, _446);
    float _454 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _456 = _454 + _452;
    float _458 = _456;
    int _460 = as_type<int>(_410);
    if (!_448)
    {
        _370 = _398;
    }
    float _462 = _370;
    float _464 = _462;
    if (!_448)
    {
        _372 = _392;
    }
    float _466 = _372;
    bool _468 = !_448;
    float _470 = _466;
    if (!_468)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _476 = _424 + _474;
        float _478 = rsqrt(_416);
        float _480 = _476 * _472;
        float _482 = _456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _484 = _480 * 0.15915493667125701904296875;
        float _486 = _484 * 6.283185482025146484375;
        float _488 = cos(_486);
        float _490 = _484 * 6.283185482025146484375;
        float _492 = sin(_490);
        float _494 = _488 + (-1.0);
        float _496 = _494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _498 = fma(_492, _482, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _500 = fma(_456, _488, _496);
        float _502 = _478 * _498;
        float _504 = fma(_410, _502, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _506 = fma(_402, _502, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _458 = _500;
        _464 = _504;
        _470 = _506;
    }
    float _508 = _458;
    float _510 = _464;
    float _512 = _470;
    out.m_53.x = _386;
    out.m_53.y = _454;
    out.m_53.z = _380;
    bool _514 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _516 = isnan(0.5);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _522 = _518 || _520;
    float _524 = _508 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _526 = _508 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _528 = _508 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _530 = _508 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _532 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _524);
    float _534 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _526);
    float _536 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _528);
    float _538 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _530);
    float _540 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _532);
    float _542 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _534);
    float _544 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _536);
    float _546 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _538);
    float _548 = _512;
    if (_522)
    {
        _548 = 1.0;
    }
    float _550 = _548;
    float _552 = _550;
    if (!_522)
    {
        float _554 = as_type<float>(in.m_57.w);
        int _556 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _558 = _556 == 4;
        bool _560 = _556 == 8;
        bool _562 = _556 == 12;
        int _564 = as_type<int>(_554) << 16;
        int _566 = as_type<int>(_554) << 8;
        int _568 = as_type<int>(_554) << 24;
        int _570 = _564 >> 24;
        int _572 = _566 >> 24;
        int _574 = as_type<int>(_554) >> 24;
        int _576 = _568 >> 24;
        float _578 = float(_570);
        float _580 = float(_572);
        float _582 = float(_574);
        float _584 = _578 * 0.0078740157186985015869140625;
        float _586 = float(_576);
        float _588 = _580 * 0.0078740157186985015869140625;
        float _590 = _582 * 0.0078740157186985015869140625;
        float _592 = precise::min(_584, 1.0);
        float _594 = _586 * 0.0078740157186985015869140625;
        float _596 = precise::min(_588, 1.0);
        float _598 = precise::min(_590, 1.0);
        float _600 = precise::min(_594, 1.0);
        float _602 = precise::max(_592, -1.0);
        float _604 = precise::max(_596, -1.0);
        float _606 = precise::max(_598, -1.0);
        float _608 = precise::max(_600, -1.0);
        float _610 = _608;
        if (_558)
        {
            _610 = _602;
        }
        float _612 = _610;
        float _614 = _612;
        if (_560)
        {
            _614 = _604;
        }
        float _616 = _614;
        float _618 = _616;
        if (_562)
        {
            _618 = _606;
        }
        float _620 = _618;
        float _622 = abs(_620);
        float _624 = (-0.0) + _622;
        _552 = _624;
    }
    float _626 = _552;
    float _628 = _542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _630 = _540 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _632 = _626 != 0.0;
    bool _634 = isnan(_626);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    float _642 = _544 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _644 = _628 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _646 = _628 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _648 = _628 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _650 = _628 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _652 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _644);
    out.m_37.x = 1.0;
    float _654 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _646);
    float _656 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _650);
    float _658 = _546 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _660 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _662 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[4].z, _656);
    float _664 = _660;
    float _666 = _658;
    if (!_640)
    {
        _664 = 0.0;
    }
    float _668 = _664;
    float _670 = fma(_630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _648);
    float _672 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[6].z, _652);
    float _674 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[5].z, _654);
    float _676 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[4].w, _662);
    float _678 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[7].z, _670);
    float _680 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[6].w, _672);
    float _682 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[5].w, _674);
    float _684 = _668 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _686 = fma(_658, (*spvDescriptorSet0.vp_c8)._m0[7].w, _678);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _690 = _680 + _688;
    if (!_640)
    {
        _666 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _692 = _666;
    float _694 = _686 * 0.5;
    float _696 = _676 + _686;
    float _698 = _686 + _690;
    if (!_640)
    {
        float _700 = _692 * 5.0;
        _460 = as_type<int>(_700);
    }
    int _702 = _460;
    float _704 = fma(_682, -0.5, _694);
    float _706 = _696 * 0.5;
    float _708 = _698 * 0.5;
    out.gl_Position.x = _676;
    out.gl_Position.y = _682;
    out.gl_Position.z = _690;
    out.gl_Position.w = _686;
    out.m_59.w = _684;
    if (!_640)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1861 = as_type<float>(_702);
        out.gl_Position.z = _1861;
    }
    out.m_61.x = _706;
    out.m_61.y = _704;
    out.m_61.z = _708;
    out.m_61.w = _686;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

