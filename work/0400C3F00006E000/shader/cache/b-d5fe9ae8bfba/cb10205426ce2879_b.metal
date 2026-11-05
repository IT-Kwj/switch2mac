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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_41 [[attribute(5)]];
    float4 m_45 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_43 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _592 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_32.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    float _82 = as_type<float>(_74);
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _80;
    if (!_78)
    {
        out.m_35.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _764 = as_type<float>(_90);
        out.gl_Position.z = _764;
    }
    if (!_78)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _94 = in.m_37.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_104)
    {
        float _110 = float(_74);
        _82 = _110;
    }
    float _112 = _82;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_35.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _833 = as_type<float>(_126);
        out.gl_Position.z = _833;
    }
    if (_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_39.x;
    float _130 = in.m_39.y;
    float _132 = in.m_39.z;
    float _134 = in.m_41.x;
    float _136 = in.m_41.y;
    float _138 = in.m_41.z;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_39.w;
    float _152 = in.m_37.x;
    float _154 = in.m_37.y;
    float _156 = in.m_37.z;
    float _158 = in.m_32.x;
    float _160 = in.m_32.y;
    float _162 = in.m_32.z;
    float _164 = _128 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _166 = _130 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _168 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _132 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _134);
    float _176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _136);
    float _178 = _166 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _180 = _164;
    float _182 = _168;
    if (!_148)
    {
        float _184 = _168 * _168;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _138);
    float _192 = _172 * _174;
    float _194 = _178 * _176;
    float _196 = _188;
    float _198 = _194;
    if (!_148)
    {
        float _200 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _200;
    }
    float _202 = _196;
    bool _204 = !_148;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _168 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _168);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_148;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _168 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _182 = _260;
    }
    float _262 = _182;
    float _264 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _170 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _154, _264);
    float _274 = _266 * _190;
    float _276 = fma(_262, _152, _268);
    float _278 = fma(_262, _156, _270);
    float _280 = fma(_272, _150, _160);
    float _282 = _194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _284 = fma(_276, _150, _158);
    float _286 = _194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _288 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _290 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = fma(_278, _150, _162);
    float _294 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _282);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _288);
    float _298 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _286);
    float _300 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _304 = _302 != 0;
    float _306 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _294);
    float _308 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _298);
    float _312 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _300);
    float _314 = _306 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _316 = _308 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _318 = _310 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _320 = _312 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _322 = in.m_43.y;
    float _324 = _316 + _314;
    float _326 = _194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _328 = _320 + _318;
    float _330 = _286;
    float _332 = _322;
    float _334 = _324;
    if (_304)
    {
        float _336 = in.m_45.x;
        _330 = _336;
    }
    float _338 = _330;
    float _340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _342 = _324 + _340;
    float _344 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _326);
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _348 = _328 + _346;
    float _350 = in.m_45.y;
    float _352 = _342 * _342;
    float _354 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = _348 * _348;
    float _358 = in.m_43.x;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _362 = _360 != 0;
    float _364 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _366 = _352 + _356;
    float _368 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _344);
    float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _372 = sqrt(_366);
    bool _374 = _338 > 0.5;
    bool _376 = _374 && _304;
    float _378 = _368 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _380 = _350 > 0.5;
    float _382 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _386 = -_322;
    float _388 = _386 + 1.0;
    float _390 = _358;
    float _392 = _378;
    float _394 = _388;
    float _396 = _368;
    if (_304)
    {
        _198 = _358;
    }
    float _398 = _198;
    float _400 = _382 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _402 = _398;
    float _404 = _400;
    if (_362)
    {
        float _406 = _380 ? _388 : _322;
        _332 = _406;
    }
    float _408 = _332;
    if (_376)
    {
        float _410 = -_398;
        float _412 = _410 + 1.0;
        _402 = _412;
    }
    float _414 = _402;
    bool _416 = _372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _418 = _400 + _378;
    if (_304)
    {
        _390 = _414;
    }
    float _420 = _390;
    if (!_416)
    {
        _392 = _324;
    }
    float _422 = _392;
    float _424 = _422;
    if (!_416)
    {
        _404 = _356;
    }
    float _426 = _404;
    float _428 = _426;
    if (!_416)
    {
        _394 = _352;
    }
    float _430 = _394;
    float _432 = _430;
    if (!_416)
    {
        _396 = _328;
    }
    float _434 = _396;
    float _436 = _434;
    if (!_416)
    {
        _334 = _418;
    }
    float _438 = _334;
    bool _440 = !_416;
    float _442 = _438;
    if (!_440)
    {
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _448 = _372 + _446;
        float _450 = _418 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _452 = rsqrt(_366);
        float _454 = _448 * _444;
        float _456 = _454 * 0.15915493667125701904296875;
        float _458 = _456 * 6.283185482025146484375;
        float _460 = sin(_458);
        float _462 = _456 * 6.283185482025146484375;
        float _464 = cos(_462);
        float _466 = fma(_460, _450, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _468 = _452 * _466;
        float _470 = _464 + (-1.0);
        float _472 = fma(_342, _468, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _474 = fma(_348, _468, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _476 = _470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _478 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _480 = _472 + _478;
        float _482 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _484 = _474 + _482;
        float _486 = fma(_418, _464, _476);
        float _488 = _480 * _480;
        float _490 = _484 * _484;
        _442 = _486;
        _432 = _488;
        _428 = _490;
        _424 = _472;
        _436 = _474;
    }
    float _492 = _442;
    float _494 = _432;
    float _496 = _428;
    float _498 = _424;
    float _500 = _436;
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _504 = _492 + _502;
    float _506 = _420 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _508 = _408 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _510 = fma(_504, _504, _494);
    float _512 = _506 * _370;
    float _514 = _508 * _384;
    float _516 = _510 + _496;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _522 = sqrt(_516);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _532 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _538 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_47.x = _532;
    out.m_47.y = _534;
    out.m_47.z = _538;
    out.m_47.w = _536;
    bool _546 = _522 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _548 = isnan(_522);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _554 = _550 || _552;
    out.m_49.x = _540;
    out.m_49.y = _542;
    out.m_49.z = _544;
    out.m_51.x = _512;
    out.m_51.y = _514;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    float _556 = _526;
    if (!_554)
    {
        _556 = 1.0;
    }
    float _558 = _556;
    bool _560 = !_554;
    float _562 = _558;
    if (!_560)
    {
        bool _564 = _522 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _566 = isnan(_522);
        bool _568 = _564 || _566;
        bool _570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _572 = _568 || _570;
        if (!_572)
        {
            float _574 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _576 = _522 + _574;
            float _578 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _580 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _578;
            float _582 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _584 = _582 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _586 = 1.0 / _580;
            float _588 = _576 * _586;
            float _590 = fma(_588, _584, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _562 = _590;
            _592 = true;
        }
        else
        {
            bool _594 = _522 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _596 = isnan(_522);
            bool _598 = _594 || _596;
            bool _600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _602 = _598 || _600;
            if (!_602)
            {
                float _604 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _606 = _522 + _604;
                float _608 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _610 = _608 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _612 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _614 = _612 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _616 = 1.0 / _610;
                float _618 = _606 * _616;
                float _620 = fma(_618, _614, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _562 = _620;
                _592 = true;
            }
            else
            {
                _562 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _592 = false;
    float _622 = _562;
    float _624 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _626 = _492 + _624;
    float _628 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _630 = _498 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _634 = _500 + _632;
    out.m_35.x = 1.0;
    float _636 = fma(_626, _622, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _638 = fma(_630, _622, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _640 = fma(_634, _622, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _642 = _636 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _644 = _636 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _646 = _636 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _648 = _636 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _650 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[1].x, _642);
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[0].x, _644);
    float _654 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[2].x, _646);
    float _656 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[3].x, _648);
    float _658 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[1].z, _650);
    float _660 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[0].z, _652);
    float _662 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[2].z, _654);
    float _664 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[3].z, _656);
    float _666 = _658 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _668 = _660 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _670 = _662 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _672 = _664 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _674 = _666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _678 = _666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _680 = _666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[5].x, _674);
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[4].x, _676);
    float _686 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[6].x, _678);
    float _688 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[7].x, _680);
    float _690 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _682);
    float _692 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _694 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _686);
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _688);
    float _698 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _690);
    float _700 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _692);
    float _702 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _694);
    float _704 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _706 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _696);
    out.m_55.w = _704;
    out.gl_Position.x = _700;
    out.gl_Position.y = _698;
    out.gl_Position.z = _702;
    out.gl_Position.w = _706;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _592 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_32.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    float _82 = as_type<float>(_74);
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _80;
    if (!_78)
    {
        out.m_35.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _764 = as_type<float>(_90);
        out.gl_Position.z = _764;
    }
    if (!_78)
    {
        return out;
    }
    float _94 = in.m_37.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_104)
    {
        float _110 = float(_74);
        _82 = _110;
    }
    float _112 = _82;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_35.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _833 = as_type<float>(_126);
        out.gl_Position.z = _833;
    }
    if (_118)
    {
        return out;
    }
    float _128 = in.m_39.x;
    float _130 = in.m_39.y;
    float _132 = in.m_39.z;
    float _134 = in.m_41.x;
    float _136 = in.m_41.y;
    float _138 = in.m_41.z;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_39.w;
    float _152 = in.m_37.x;
    float _154 = in.m_37.y;
    float _156 = in.m_37.z;
    float _158 = in.m_32.x;
    float _160 = in.m_32.y;
    float _162 = in.m_32.z;
    float _164 = _128 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _166 = _130 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _168 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _132 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _134);
    float _176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _136);
    float _178 = _166 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _180 = _164;
    float _182 = _168;
    if (!_148)
    {
        float _184 = _168 * _168;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _138);
    float _192 = _172 * _174;
    float _194 = _178 * _176;
    float _196 = _188;
    float _198 = _194;
    if (!_148)
    {
        float _200 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _200;
    }
    float _202 = _196;
    bool _204 = !_148;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _168 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _168);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_148;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _168 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _182 = _260;
    }
    float _262 = _182;
    float _264 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _170 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _154, _264);
    float _274 = _266 * _190;
    float _276 = fma(_262, _152, _268);
    float _278 = fma(_262, _156, _270);
    float _280 = fma(_272, _150, _160);
    float _282 = _194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _284 = fma(_276, _150, _158);
    float _286 = _194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _288 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _290 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = fma(_278, _150, _162);
    float _294 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _282);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _288);
    float _298 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _286);
    float _300 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _304 = _302 != 0;
    float _306 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _294);
    float _308 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _298);
    float _312 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _300);
    float _314 = _306 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _316 = _308 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _318 = _310 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _320 = _312 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _322 = in.m_43.y;
    float _324 = _316 + _314;
    float _326 = _194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _328 = _320 + _318;
    float _330 = _286;
    float _332 = _322;
    float _334 = _324;
    if (_304)
    {
        float _336 = in.m_45.x;
        _330 = _336;
    }
    float _338 = _330;
    float _340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _342 = _324 + _340;
    float _344 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _326);
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _348 = _328 + _346;
    float _350 = in.m_45.y;
    float _352 = _342 * _342;
    float _354 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = _348 * _348;
    float _358 = in.m_43.x;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _362 = _360 != 0;
    float _364 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _366 = _352 + _356;
    float _368 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _344);
    float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _372 = sqrt(_366);
    bool _374 = _338 > 0.5;
    bool _376 = _374 && _304;
    float _378 = _368 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _380 = _350 > 0.5;
    float _382 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _386 = -_322;
    float _388 = _386 + 1.0;
    float _390 = _358;
    float _392 = _378;
    float _394 = _388;
    float _396 = _368;
    if (_304)
    {
        _198 = _358;
    }
    float _398 = _198;
    float _400 = _382 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _402 = _398;
    float _404 = _400;
    if (_362)
    {
        float _406 = _380 ? _388 : _322;
        _332 = _406;
    }
    float _408 = _332;
    if (_376)
    {
        float _410 = -_398;
        float _412 = _410 + 1.0;
        _402 = _412;
    }
    float _414 = _402;
    bool _416 = _372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _418 = _400 + _378;
    if (_304)
    {
        _390 = _414;
    }
    float _420 = _390;
    if (!_416)
    {
        _392 = _324;
    }
    float _422 = _392;
    float _424 = _422;
    if (!_416)
    {
        _404 = _356;
    }
    float _426 = _404;
    float _428 = _426;
    if (!_416)
    {
        _394 = _352;
    }
    float _430 = _394;
    float _432 = _430;
    if (!_416)
    {
        _396 = _328;
    }
    float _434 = _396;
    float _436 = _434;
    if (!_416)
    {
        _334 = _418;
    }
    float _438 = _334;
    bool _440 = !_416;
    float _442 = _438;
    if (!_440)
    {
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _448 = _372 + _446;
        float _450 = _418 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _452 = rsqrt(_366);
        float _454 = _448 * _444;
        float _456 = _454 * 0.15915493667125701904296875;
        float _458 = _456 * 6.283185482025146484375;
        float _460 = sin(_458);
        float _462 = _456 * 6.283185482025146484375;
        float _464 = cos(_462);
        float _466 = fma(_460, _450, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _468 = _452 * _466;
        float _470 = _464 + (-1.0);
        float _472 = fma(_342, _468, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _474 = fma(_348, _468, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _476 = _470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _478 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _480 = _472 + _478;
        float _482 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _484 = _474 + _482;
        float _486 = fma(_418, _464, _476);
        float _488 = _480 * _480;
        float _490 = _484 * _484;
        _442 = _486;
        _432 = _488;
        _428 = _490;
        _424 = _472;
        _436 = _474;
    }
    float _492 = _442;
    float _494 = _432;
    float _496 = _428;
    float _498 = _424;
    float _500 = _436;
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _504 = _492 + _502;
    float _506 = _420 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _508 = _408 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _510 = fma(_504, _504, _494);
    float _512 = _506 * _370;
    float _514 = _508 * _384;
    float _516 = _510 + _496;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _522 = sqrt(_516);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _532 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _538 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_47.x = _532;
    out.m_47.y = _534;
    out.m_47.z = _538;
    out.m_47.w = _536;
    bool _546 = _522 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _548 = isnan(_522);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _554 = _550 || _552;
    out.m_49.x = _540;
    out.m_49.y = _542;
    out.m_49.z = _544;
    out.m_51.x = _512;
    out.m_51.y = _514;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    float _556 = _526;
    if (!_554)
    {
        _556 = 1.0;
    }
    float _558 = _556;
    bool _560 = !_554;
    float _562 = _558;
    if (!_560)
    {
        bool _564 = _522 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _566 = isnan(_522);
        bool _568 = _564 || _566;
        bool _570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _572 = _568 || _570;
        if (!_572)
        {
            float _574 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _576 = _522 + _574;
            float _578 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _580 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _578;
            float _582 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _584 = _582 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _586 = 1.0 / _580;
            float _588 = _576 * _586;
            float _590 = fma(_588, _584, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _562 = _590;
            _592 = true;
        }
        else
        {
            bool _594 = _522 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _596 = isnan(_522);
            bool _598 = _594 || _596;
            bool _600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _602 = _598 || _600;
            if (!_602)
            {
                float _604 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _606 = _522 + _604;
                float _608 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _610 = _608 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _612 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _614 = _612 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _616 = 1.0 / _610;
                float _618 = _606 * _616;
                float _620 = fma(_618, _614, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _562 = _620;
                _592 = true;
            }
            else
            {
                _562 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _592 = false;
    float _622 = _562;
    float _624 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _626 = _492 + _624;
    float _628 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _630 = _498 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _634 = _500 + _632;
    out.m_35.x = 1.0;
    float _636 = fma(_626, _622, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _638 = fma(_630, _622, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _640 = fma(_634, _622, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _642 = _636 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _644 = _636 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _646 = _636 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _648 = _636 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _650 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[1].x, _642);
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[0].x, _644);
    float _654 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[2].x, _646);
    float _656 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[3].x, _648);
    float _658 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[1].z, _650);
    float _660 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[0].z, _652);
    float _662 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[2].z, _654);
    float _664 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[3].z, _656);
    float _666 = _658 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _668 = _660 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _670 = _662 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _672 = _664 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _674 = _666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _678 = _666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _680 = _666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[5].x, _674);
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[4].x, _676);
    float _686 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[6].x, _678);
    float _688 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[7].x, _680);
    float _690 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _682);
    float _692 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _694 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _686);
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _688);
    float _698 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _690);
    float _700 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _692);
    float _702 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _694);
    float _704 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _706 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _696);
    out.m_55.w = _704;
    out.gl_Position.x = _700;
    out.gl_Position.y = _698;
    out.gl_Position.z = _702;
    out.gl_Position.w = _706;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _592 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_32.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    float _82 = as_type<float>(_74);
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _80;
    if (!_78)
    {
        out.m_35.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _764 = as_type<float>(_90);
        out.gl_Position.z = _764;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _94 = in.m_37.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_104)
    {
        float _110 = float(_74);
        _82 = _110;
    }
    float _112 = _82;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_35.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _833 = as_type<float>(_126);
        out.gl_Position.z = _833;
    }
    if (_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_39.x;
    float _130 = in.m_39.y;
    float _132 = in.m_39.z;
    float _134 = in.m_41.x;
    float _136 = in.m_41.y;
    float _138 = in.m_41.z;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_39.w;
    float _152 = in.m_37.x;
    float _154 = in.m_37.y;
    float _156 = in.m_37.z;
    float _158 = in.m_32.x;
    float _160 = in.m_32.y;
    float _162 = in.m_32.z;
    float _164 = _128 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _166 = _130 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _168 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _132 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _172 = _164 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _134);
    float _176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _136);
    float _178 = _166 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _180 = _164;
    float _182 = _168;
    if (!_148)
    {
        float _184 = _168 * _168;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _138);
    float _192 = _172 * _174;
    float _194 = _178 * _176;
    float _196 = _188;
    float _198 = _194;
    if (!_148)
    {
        float _200 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _200;
    }
    float _202 = _196;
    bool _204 = !_148;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _168 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _168);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_148;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _168 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _182 = _260;
    }
    float _262 = _182;
    float _264 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _170 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _154, _264);
    float _274 = _266 * _190;
    float _276 = fma(_262, _152, _268);
    float _278 = fma(_262, _156, _270);
    float _280 = fma(_272, _150, _160);
    float _282 = _194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _284 = fma(_276, _150, _158);
    float _286 = _194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _288 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _290 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = fma(_278, _150, _162);
    float _294 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _282);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _288);
    float _298 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _286);
    float _300 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _304 = _302 != 0;
    float _306 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[24].z, _294);
    float _308 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[26].z, _298);
    float _312 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _300);
    float _314 = _306 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _316 = _308 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _318 = _310 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _320 = _312 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _322 = in.m_43.y;
    float _324 = _316 + _314;
    float _326 = _194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _328 = _320 + _318;
    float _330 = _286;
    float _332 = _322;
    float _334 = _324;
    if (_304)
    {
        float _336 = in.m_45.x;
        _330 = _336;
    }
    float _338 = _330;
    float _340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _342 = _324 + _340;
    float _344 = fma(_192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _326);
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _348 = _328 + _346;
    float _350 = in.m_45.y;
    float _352 = _342 * _342;
    float _354 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _356 = _348 * _348;
    float _358 = in.m_43.x;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _362 = _360 != 0;
    float _364 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _354);
    float _366 = _352 + _356;
    float _368 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[25].z, _344);
    float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _372 = sqrt(_366);
    bool _374 = _338 > 0.5;
    bool _376 = _374 && _304;
    float _378 = _368 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _380 = _350 > 0.5;
    float _382 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _386 = -_322;
    float _388 = _386 + 1.0;
    float _390 = _358;
    float _392 = _378;
    float _394 = _388;
    float _396 = _368;
    if (_304)
    {
        _198 = _358;
    }
    float _398 = _198;
    float _400 = _382 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _402 = _398;
    float _404 = _400;
    if (_362)
    {
        float _406 = _380 ? _388 : _322;
        _332 = _406;
    }
    float _408 = _332;
    if (_376)
    {
        float _410 = -_398;
        float _412 = _410 + 1.0;
        _402 = _412;
    }
    float _414 = _402;
    bool _416 = _372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _418 = _400 + _378;
    if (_304)
    {
        _390 = _414;
    }
    float _420 = _390;
    if (!_416)
    {
        _392 = _324;
    }
    float _422 = _392;
    float _424 = _422;
    if (!_416)
    {
        _404 = _356;
    }
    float _426 = _404;
    float _428 = _426;
    if (!_416)
    {
        _394 = _352;
    }
    float _430 = _394;
    float _432 = _430;
    if (!_416)
    {
        _396 = _328;
    }
    float _434 = _396;
    float _436 = _434;
    if (!_416)
    {
        _334 = _418;
    }
    float _438 = _334;
    bool _440 = !_416;
    float _442 = _438;
    if (!_440)
    {
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _448 = _372 + _446;
        float _450 = _418 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _452 = rsqrt(_366);
        float _454 = _448 * _444;
        float _456 = _454 * 0.15915493667125701904296875;
        float _458 = _456 * 6.283185482025146484375;
        float _460 = sin(_458);
        float _462 = _456 * 6.283185482025146484375;
        float _464 = cos(_462);
        float _466 = fma(_460, _450, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _468 = _452 * _466;
        float _470 = _464 + (-1.0);
        float _472 = fma(_342, _468, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _474 = fma(_348, _468, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _476 = _470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _478 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _480 = _472 + _478;
        float _482 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _484 = _474 + _482;
        float _486 = fma(_418, _464, _476);
        float _488 = _480 * _480;
        float _490 = _484 * _484;
        _442 = _486;
        _432 = _488;
        _428 = _490;
        _424 = _472;
        _436 = _474;
    }
    float _492 = _442;
    float _494 = _432;
    float _496 = _428;
    float _498 = _424;
    float _500 = _436;
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _504 = _492 + _502;
    float _506 = _420 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _508 = _408 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _510 = fma(_504, _504, _494);
    float _512 = _506 * _370;
    float _514 = _508 * _384;
    float _516 = _510 + _496;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _522 = sqrt(_516);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _532 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _538 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_47.x = _532;
    out.m_47.y = _534;
    out.m_47.z = _538;
    out.m_47.w = _536;
    bool _546 = _522 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _548 = isnan(_522);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _554 = _550 || _552;
    out.m_49.x = _540;
    out.m_49.y = _542;
    out.m_49.z = _544;
    out.m_51.x = _512;
    out.m_51.y = _514;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    float _556 = _526;
    if (!_554)
    {
        _556 = 1.0;
    }
    float _558 = _556;
    bool _560 = !_554;
    float _562 = _558;
    if (!_560)
    {
        bool _564 = _522 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _566 = isnan(_522);
        bool _568 = _564 || _566;
        bool _570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _572 = _568 || _570;
        if (!_572)
        {
            float _574 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _576 = _522 + _574;
            float _578 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _580 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _578;
            float _582 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _584 = _582 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _586 = 1.0 / _580;
            float _588 = _576 * _586;
            float _590 = fma(_588, _584, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _562 = _590;
            _592 = true;
        }
        else
        {
            bool _594 = _522 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _596 = isnan(_522);
            bool _598 = _594 || _596;
            bool _600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _602 = _598 || _600;
            if (!_602)
            {
                float _604 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _606 = _522 + _604;
                float _608 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _610 = _608 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _612 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _614 = _612 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _616 = 1.0 / _610;
                float _618 = _606 * _616;
                float _620 = fma(_618, _614, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _562 = _620;
                _592 = true;
            }
            else
            {
                _562 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _592 = false;
    float _622 = _562;
    float _624 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _626 = _492 + _624;
    float _628 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _630 = _498 + _628;
    float _632 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _634 = _500 + _632;
    out.m_35.x = 1.0;
    float _636 = fma(_626, _622, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _638 = fma(_630, _622, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _640 = fma(_634, _622, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _642 = _636 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _644 = _636 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _646 = _636 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _648 = _636 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _650 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[1].x, _642);
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[0].x, _644);
    float _654 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[2].x, _646);
    float _656 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[3].x, _648);
    float _658 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[1].z, _650);
    float _660 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[0].z, _652);
    float _662 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[2].z, _654);
    float _664 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[3].z, _656);
    float _666 = _658 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _668 = _660 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _670 = _662 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _672 = _664 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _674 = _666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _678 = _666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _680 = _666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[5].x, _674);
    float _684 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[4].x, _676);
    float _686 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[6].x, _678);
    float _688 = fma(_668, (*spvDescriptorSet0.vp_c8)._m0[7].x, _680);
    float _690 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _682);
    float _692 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _694 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _686);
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _688);
    float _698 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _690);
    float _700 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _692);
    float _702 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _694);
    float _704 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _706 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _696);
    out.m_55.w = _704;
    out.gl_Position.x = _700;
    out.gl_Position.y = _698;
    out.gl_Position.z = _702;
    out.gl_Position.w = _706;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

