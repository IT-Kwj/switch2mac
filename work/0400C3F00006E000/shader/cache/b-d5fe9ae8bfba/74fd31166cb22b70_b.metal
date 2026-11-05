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
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_41 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_43 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_45 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1040 = false;
    bool _926 = false;
    bool _784 = false;
    bool _602 = false;
    bool _450 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    float _82 = _80;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _80 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1983 = as_type<float>(_88);
        out.gl_Position.z = _1983;
    }
    if (!_76)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _92 = in.m_35.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _108 = 0.0;
    float _110 = 0.0;
    if (_102)
    {
        float _112 = float(_72);
        _82 = _112;
    }
    float _114 = _82;
    bool _116 = _106 >= _114;
    bool _118 = !_102;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _90 = as_type<int>(_126);
    }
    int _128 = _90;
    float _130 = as_type<float>(_128);
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2054 = as_type<float>(_128);
        out.gl_Position.z = _2054;
    }
    if (_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_35.x;
    float _134 = in.m_35.y;
    float _136 = in.m_35.z;
    float _138 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = _138;
    if (!_148)
    {
        float _152 = _138 * _138;
        float _154 = _152 * 0.5;
        _130 = _154;
    }
    float _156 = _130;
    float _158 = 0.0;
    float _160 = _156;
    if (!_148)
    {
        float _162 = _106 * _106;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    if (!_148)
    {
        float _168 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _168;
    }
    float _170 = _160;
    bool _172 = !_148;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _138 * _178;
        float _188 = 1.0 / _182;
        float _190 = _184 * 0.693147182464599609375;
        float _192 = exp2(_186);
        float _194 = 1.0 / _190;
        float _196 = _192 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _194, _138);
        float _202 = _200 * _188;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _108 = _194;
        _174 = _204;
        _110 = _192;
    }
    float _206 = _108;
    float _208 = _174;
    float _210 = _110;
    bool _212 = !_148;
    float _214 = _206;
    float _216 = _210;
    if (!_212)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _138 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _214 = _230;
        _216 = _224;
        _150 = _236;
    }
    float _238 = _214;
    float _240 = _216;
    float _242 = _150;
    float _244 = _240;
    float _246 = _238;
    if (!_148)
    {
        _244 = _106;
    }
    float _248 = _244;
    float _250 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _248;
    if (!_148)
    {
        float _254 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _254;
    }
    float _256 = _246;
    bool _258 = !_148;
    float _260 = _256;
    if (!_258)
    {
        float _262 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = log2(_262);
        float _266 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _268 = _266 + 1.0;
        float _270 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = _106 * _264;
        float _274 = 1.0 / _268;
        float _276 = _270 * 0.693147182464599609375;
        float _278 = exp2(_272);
        float _280 = 1.0 / _276;
        float _282 = _278 + (-1.0);
        float _284 = -_282;
        float _286 = fma(_284, _280, _106);
        float _288 = _286 * _274;
        float _290 = _288 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _290;
    }
    float _292 = _260;
    bool _294 = !_148;
    if (!_294)
    {
        float _296 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = log2(_296);
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = 1.0 / _302;
        float _306 = _106 * _298;
        float _308 = exp2(_306);
        float _310 = -_308;
        float _312 = _310 + 1.0;
        float _314 = _312 * _304;
        _252 = _314;
    }
    float _316 = _252;
    float _318 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _320 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _322 = fma(_242, _134, _250);
    float _324 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _326 = fma(_316, _134, _318);
    float _328 = fma(_242, _132, _320);
    float _330 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = fma(_316, _132, _324);
    float _334 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = -_326;
    float _338 = _322 + _336;
    float _340 = fma(_316, _136, _330);
    float _342 = -_332;
    float _344 = _328 + _342;
    float _346 = fma(_242, _136, _334);
    float _348 = _338 * _338;
    float _350 = in.m_37.w;
    float _352 = _338 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _354 = -_340;
    float _356 = _346 + _354;
    float _358 = fma(_344, _344, _348);
    float _360 = _338 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = _338 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _364 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _352);
    float _366 = fma(_356, _356, _358);
    float _368 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _370 = in.m_30.x;
    float _372 = in.m_30.y;
    float _374 = in.m_30.z;
    float _376 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _362);
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    float _380 = sqrt(_366);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _384 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _376);
    bool _386 = _380 >= 9.9999999747524270787835121154785e-07;
    bool _388 = isnan(_380);
    bool _390 = _386 || _388;
    bool _392 = isnan(9.9999999747524270787835121154785e-07);
    bool _394 = _390 || _392;
    float _396 = fma(_328, _350, _370);
    float _398 = fma(_322, _350, _372);
    float _400 = fma(_346, _350, _374);
    float _402 = _322;
    float _404 = _382;
    float _406 = _384;
    if (_394)
    {
        _402 = _378;
    }
    float _408 = _402;
    float _410 = _408;
    if (!_394)
    {
        bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _414 = !_412;
        if (!_414)
        {
            float _416 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _418 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _420 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _422 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _416);
            float _424 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _418);
            float _426 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _420);
            float _428 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _422);
            float _430 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _424);
            float _432 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
            float _434 = _428 * _428;
            float _436 = fma(_430, _430, _434);
            float _438 = fma(_432, _432, _436);
            float _440 = rsqrt(_438);
            float _442 = _440 * 9.9999999747524270787835121154785e-07;
            float _444 = _430 * _442;
            float _446 = _428 * _442;
            float _448 = _432 * _442;
            _404 = _446;
            _410 = _444;
            _406 = _448;
            _450 = true;
        }
        else
        {
            float _452 = _134 * _134;
            float _454 = fma(_132, _132, _452);
            float _456 = fma(_136, _136, _454);
            float _458 = sqrt(_456);
            bool _460 = _458 >= 9.9999999747524270787835121154785e-07;
            bool _462 = isnan(_458);
            bool _464 = _460 || _462;
            bool _466 = isnan(9.9999999747524270787835121154785e-07);
            bool _468 = _464 || _466;
            if (!_468)
            {
                float _470 = _372 * _372;
                float _472 = fma(_370, _370, _470);
                float _474 = fma(_374, _374, _472);
                float _476 = sqrt(_474);
                bool _478 = _476 >= 9.9999999747524270787835121154785e-07;
                bool _480 = isnan(_476);
                bool _482 = _478 || _480;
                bool _484 = isnan(9.9999999747524270787835121154785e-07);
                bool _486 = _482 || _484;
                if (!_486)
                {
                    float _488 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _490 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _488);
                    float _492 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _490);
                    float _494 = rsqrt(_492);
                    float _496 = _494 * 9.9999999747524270787835121154785e-07;
                    float _498 = _496 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _500 = _496 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _502 = _496 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _404 = _500;
                    _410 = _498;
                    _406 = _502;
                    _450 = true;
                }
                else
                {
                    float _504 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _506 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _508 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _510 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].x, _504);
                    float _512 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].x, _506);
                    float _514 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].x, _508);
                    float _516 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _510);
                    float _518 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _512);
                    float _520 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _514);
                    float _522 = _516 * _516;
                    float _524 = fma(_518, _518, _522);
                    float _526 = fma(_520, _520, _524);
                    float _528 = rsqrt(_526);
                    float _530 = _528 * 9.9999999747524270787835121154785e-07;
                    float _532 = _518 * _530;
                    float _534 = _516 * _530;
                    float _536 = _520 * _530;
                    _404 = _534;
                    _410 = _532;
                    _406 = _536;
                    _450 = true;
                }
            }
            else
            {
                float _538 = _134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _540 = _134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _542 = _134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _544 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _538);
                float _546 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _540);
                float _548 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _542);
                float _550 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _544);
                float _552 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _546);
                float _554 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _548);
                float _556 = _550 * _550;
                float _558 = fma(_552, _552, _556);
                float _560 = fma(_554, _554, _558);
                float _562 = rsqrt(_560);
                float _564 = _562 * 9.9999999747524270787835121154785e-07;
                float _566 = _552 * _564;
                float _568 = _550 * _564;
                float _570 = _554 * _564;
                _404 = _568;
                _410 = _566;
                _406 = _570;
            }
        }
    }
    _450 = false;
    float _572 = _404;
    float _574 = _410;
    float _576 = _406;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _580 = !_578;
    float _582 = _574;
    float _600;
    if (!_580)
    {
        float _584 = in.m_39.x;
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _588 = _584 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _592 = _590 * _586;
        float _594 = floor(_592);
        float _596 = -_594;
        float _598 = _592 + _596;
        _600 = _598;
        _602 = true;
    }
    else
    {
        float _604 = float(_72);
        float _606 = 1.0 / _604;
        float _608 = _106 * _606;
        _600 = _608;
    }
    _602 = false;
    float _610 = _600;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _614 = _610 + _612;
    bool _616 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _618 = isnan(_610);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _630 = _610 + _628;
    bool _632 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _634 = isnan(_610);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _652 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _654 = isnan(_610);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -_626;
    float _666 = _664 + 1.0;
    float _668 = 1.0 / _650;
    float _670 = _662 * _666;
    float _672 = -_662;
    float _674 = _672 + 1.0;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _676;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _682 = 1.0 / _646;
    float _684 = _642 * _674;
    float _686 = -_642;
    float _688 = _686 + 1.0;
    float _690 = _630 * _668;
    float _692 = _614 * _682;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _698;
    float _702 = fma(_678, _692, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _704 = fma(_696, _692, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _706 = fma(_700, _692, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _708 = in.m_37.x;
    float _710 = in.m_37.y;
    float _712 = in.m_37.z;
    float _714 = _702 * _684;
    float _716 = _704 * _684;
    float _718 = _706 * _684;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].x, _714);
    float _734 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].y, _716);
    float _736 = fma(_722, _690, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _738 = fma(_726, _690, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _740 = fma(_730, _690, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _742 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].z, _718);
    float _744 = fma(_736, _670, _732);
    float _746 = fma(_738, _670, _734);
    float _748 = fma(_740, _670, _742);
    float _750 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[145].x, _744);
    float _752 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[145].y, _746);
    float _754 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[145].z, _748);
    float _756 = _750 * _708;
    float _758 = _752 * _710;
    float _760 = _754 * _712;
    bool _762 = !_680;
    float _764 = _760;
    float _782;
    if (!_762)
    {
        float _766 = in.m_39.x;
        float _768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _770 = _766 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _774 = _772 * _768;
        float _776 = floor(_774);
        float _778 = -_776;
        float _780 = _774 + _778;
        _782 = _780;
        _784 = true;
    }
    else
    {
        float _786 = float(_72);
        float _788 = 1.0 / _786;
        float _790 = _106 * _788;
        _782 = _790;
    }
    _784 = false;
    float _792 = _782;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _796 = _792 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _802 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _804 = isnan(_792);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _818 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _820 = isnan(_792);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _830;
    bool _834 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _836 = isnan(_792);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / _800;
    float _848 = -_812;
    float _850 = _848 + 1.0;
    bool _852 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _854 = 1.0 / _816;
    float _856 = _832 * _846;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _862 = fma(_856, _796, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _864 = _828 * _850;
    float _866 = -_844;
    float _868 = _866 + 1.0;
    float _870 = -_828;
    float _872 = _870 + 1.0;
    float _874 = _860 * _854;
    float _876 = _862 * _864;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = _792 + _878;
    float _882 = _812 * _868;
    float _884 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[115].x, _876);
    float _886 = fma(_874, _880, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _888 = fma(_886, _882, _884);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _896 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[117].x, _888);
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _896 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _898;
    out.m_41.y = _900;
    out.m_41.z = _902;
    out.m_41.w = _904;
    bool _906 = !_852;
    float _924;
    if (!_906)
    {
        float _908 = in.m_39.x;
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _912 = _908 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[11].z, _106);
        float _916 = _914 * _910;
        float _918 = floor(_916);
        float _920 = -_918;
        float _922 = _916 + _920;
        _924 = _922;
        _926 = true;
    }
    else
    {
        float _928 = float(_72);
        float _930 = 1.0 / _928;
        float _932 = _106 * _930;
        _924 = _932;
    }
    _926 = false;
    float _934 = _924;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _938 = _934 + _936;
    bool _940 = _934 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _942 = isnan(_934);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _952;
    bool _956 = _934 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _958 = isnan(_934);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = -_950;
    float _970 = _968 + 1.0;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _972;
    float _976 = 1.0 / _954;
    bool _978 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _980 = _966 * _970;
    float _982 = -_966;
    float _984 = _982 + 1.0;
    float _986 = _938 * _976;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _988;
    float _992 = fma(_974, _986, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _994;
    float _998 = fma(_990, _986, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1000 = fma(_996, _986, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1002 = _992 * _980;
    float _1004 = _1000 * _980;
    float _1006 = _998 * _980;
    float _1008 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1002);
    float _1010 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1004);
    float _1012 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1006);
    float _1014 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1008);
    float _1016 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1010);
    float _1018 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1012);
    bool _1020 = !_978;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_39.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        float _1042 = float(_72);
        float _1044 = 1.0 / _1042;
        float _1046 = _106 * _1044;
        _1038 = _1046;
    }
    _1040 = false;
    float _1048 = _1038;
    float _1050 = in.m_39.x;
    float _1052 = in.m_39.y;
    float _1054 = in.m_39.z;
    float _1056 = in.m_39.w;
    float _1058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1060 = in.m_43.x;
    float _1062 = in.m_43.y;
    float _1064 = in.m_43.z;
    float _1066 = in.m_45.y;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1072 = _1070 != 0;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _1074 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1078 = _1076 != 0;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1090 = _1088 != 0;
    bool _1092 = _1056 > 0.5;
    float _1094 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1096 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1098 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1074);
    float _1100 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1094);
    float _1102 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1096);
    float _1104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1062);
    float _1106 = _572 * _572;
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1060);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1064);
    float _1112 = fma(_574, _574, _1106);
    bool _1114 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.5);
    bool _1122 = _1118 || _1120;
    float _1124 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1126 = fma(_576, _576, _1112);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1130 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1136 = fma(_1124, -2.0, _1128);
    float _1138 = rsqrt(_1126);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1142 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1098);
    float _1144 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1100);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1150 = -_1140;
    float _1152 = fma(_1130, 2.0, _1150);
    float _1154 = 1.0 / _1134;
    float _1156 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1158 = 0.0;
    bool _1160 = _1090;
    bool _1162 = _1086;
    float _1164 = _1108;
    float _1166 = _1050;
    if (_1078)
    {
        float _1168 = in.m_39.z;
        _1158 = _1168;
    }
    float _1170 = _1158;
    float _1172 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1174;
    float _1178 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1102);
    float _1180 = _1172 * _1104;
    float _1182 = 1.0 / _1148;
    float _1184 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1186 = _1138 * _572;
    float _1188 = -_1066;
    float _1190 = _1188 + 1.0;
    float _1192 = 0.0;
    float _1194 = _1066;
    if (_1082)
    {
        float _1196 = in.m_39.x;
        _1192 = _1196;
    }
    float _1198 = _1192;
    float _1200 = _1184 * _1110;
    float _1202 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1208 = _1176 * _1154;
    float _1210 = _1138 * _574;
    float _1212 = _1138 * _576;
    int _1214 = _1092 ? as_type<int>(_1190) : as_type<int>(_1066);
    float _1216 = _1156 * _1108;
    float _1218 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1202);
    bool _1220 = _1052 > 0.5;
    float _1222 = in.m_45.x;
    float _1224 = _1206 * _1182;
    float _1226 = _1086 ? as_type<float>(_1214) : _1066;
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1218);
    float _1230 = _1228;
    float _1232 = _1182;
    float _1234 = _1224;
    if (_1090)
    {
        float _1236 = _1220 ? _1190 : _1066;
        _1194 = _1236;
    }
    float _1238 = _1194;
    float _1240 = _1180 * _1210;
    float _1242 = abs(_1228);
    bool _1244 = _1242 > 0.99989998340606689453125;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    if (_1078)
    {
        bool _1248 = _1170 > 0.5;
        _1160 = _1248;
    }
    bool _1250 = _1160;
    float _1252 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1246);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1256 = _1048 + _1254;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1260 = _1258;
    if (_1082)
    {
        bool _1262 = _1198 > 0.5;
        _1162 = _1262;
    }
    bool _1264 = _1162;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1268 = fma(_1208, _1256, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1270 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1258);
    float _1272 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1266);
    float _1274 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1270);
    float _1276 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_1244)
    {
        _1260 = 0.001000000047497451305389404296875;
    }
    float _1278 = _1260;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1072)
    {
        _582 = _1052;
    }
    float _1282 = _582;
    float _1284 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1272);
    float _1286 = _1282;
    if (_1072)
    {
        _1286 = _1050;
    }
    float _1288 = _1286;
    if (!_1072)
    {
        _764 = _1054;
    }
    float _1290 = _764;
    float _1292 = _1290;
    if (!_1072)
    {
        _1230 = _1054;
    }
    float _1294 = _1230;
    float _1296 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1280);
    float _1298 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1296);
    float _1300 = _1294;
    if (!_1072)
    {
        _1164 = _1052;
    }
    float _1302 = _1164;
    float _1304 = _1302;
    if (_1072)
    {
        _1292 = _1052;
    }
    float _1306 = _1292;
    if (_1072)
    {
        _1300 = _1052;
    }
    float _1308 = _1300;
    float _1310 = 0.0;
    if (!_1244)
    {
        _1310 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1312 = _1310;
    float _1314 = _1312;
    if (_1244)
    {
        float _1316 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1314 = _1316;
    }
    float _1318 = _1314;
    if (!_1244)
    {
        _1276 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1320 = _1276;
    float _1322 = _1320;
    if (_1244)
    {
        float _1324 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1322 = _1324;
    }
    float _1326 = _1322;
    if (!_1244)
    {
        _1232 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1328 = _1232;
    float _1330 = _1328;
    if (_1244)
    {
        float _1332 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1330 = _1332;
    }
    float _1334 = _1330;
    float _1336 = 0.0;
    if (!_1072)
    {
        _1336 = _1050;
    }
    float _1338 = _1336;
    float _1340 = -_1318;
    float _1342 = _1212 * _1340;
    float _1344 = _1338;
    if (_1072)
    {
        _1344 = _1054;
    }
    float _1346 = _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1350 = _1048 + _1348;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1354 = -_1326;
    float _1356 = _1186 * _1354;
    float _1358 = -_1334;
    float _1360 = _1210 * _1358;
    float _1362 = -_1326;
    float _1364 = -_1342;
    float _1366 = fma(_1210, _1362, _1364);
    float _1368 = fma(_1224, _1350, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1370 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1352);
    if (!_1082)
    {
        _1234 = _1222;
    }
    float _1372 = _1234;
    float _1374 = -_1318;
    float _1376 = -_1360;
    float _1378 = fma(_1186, _1374, _1376);
    float _1380 = -_1334;
    float _1382 = -_1356;
    float _1384 = fma(_1212, _1380, _1382);
    float _1386 = _1366 * _1366;
    float _1388 = _1372;
    int _1390 = as_type<int>(_1386);
    if (_1072)
    {
        _1304 = _1050;
    }
    float _1392 = _1304;
    float _1394 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1370);
    if (!_1082)
    {
        _1166 = _1372;
    }
    float _1396 = _1166;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1400 = _1396;
    if (_1082)
    {
        _1388 = _1222;
    }
    float _1402 = _1388;
    float _1404 = fma(_1384, _1384, _1386);
    bool _1406 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1408 = isnan(_1048);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1398);
    bool _1420 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1422 = isnan(_1048);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    float _1432 = fma(_1378, _1378, _1404);
    bool _1434 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1436 = isnan(_1048);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    if (_1078)
    {
        float _1446 = -_1402;
        float _1448 = _1446 + 1.0;
        _1390 = as_type<int>(_1448);
    }
    int _1450 = _1390;
    float _1452 = -_1430;
    float _1454 = _1452 + 1.0;
    float _1456 = rsqrt(_1432);
    float _1458 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1460 = _1444 * _1454;
    float _1462 = -_1444;
    float _1464 = _1462 + 1.0;
    float _1466 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1470 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1472 = _1416 * _1464;
    int _1474 = as_type<int>(_1464);
    float _1476 = _1466;
    if (_1082)
    {
        float _1478 = -_1402;
        float _1480 = _1478 + 1.0;
        _1474 = as_type<int>(_1480);
    }
    int _1482 = _1474;
    float _1484 = fma(_1466, _1238, -0.5);
    if (!_1078)
    {
        _1476 = _1402;
    }
    float _1486 = _1476;
    float _1488 = fma(_1226, _1470, -0.5);
    float _1490 = _1486;
    if (_1078)
    {
        float _1492 = _1250 ? as_type<float>(_1450) : _1402;
        _1490 = _1492;
    }
    float _1494 = _1490;
    float _1496 = _1268 * _1472;
    if (_1082)
    {
        float _1498 = _1264 ? as_type<float>(_1482) : _1402;
        _1400 = _1498;
    }
    float _1500 = _1400;
    float _1502 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1252);
    float _1504 = _1366 * _1456;
    float _1506 = _1378 * _1456;
    float _1508 = -_1468;
    float _1510 = fma(_1458, 2.0, _1508);
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1514 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1516 = _1502 * (-0.15915493667125701904296875);
    float _1518 = _1384 * _1456;
    float _1520 = _1210 * _1504;
    float _1522 = _1180 * _1212;
    float _1524 = _1186 * _1506;
    float _1526 = fma(_1514, -2.0, _1512);
    float _1528 = -_1520;
    float _1530 = fma(_1186, _1518, _1528);
    float _1532 = fma(_1216, _1506, _1522);
    float _1534 = fma(_1216, _1518, _1240);
    float _1536 = -_1524;
    float _1538 = fma(_1212, _1504, _1536);
    float _1540 = _1180 * _1186;
    float _1542 = _1142 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1544 = fma(_1200, _1530, _1532);
    float _1546 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1548 = fma(_1200, _1538, _1534);
    float _1550 = _1144 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1554 = _1546 + _1544;
    float _1556 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1558 = _1550 + _1548;
    float _1560 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1552);
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1564 = _1554 + _1562;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1568 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1556);
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1572 = _1558 + _1570;
    float _1574 = _1564 * _1564;
    float _1576 = -_106;
    float _1578 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1152);
    float _1580 = _1394 * (-0.15915493667125701904296875);
    float _1582 = -_1416;
    float _1584 = _1582 + 1.0;
    float _1586 = fma(_1572, _1572, _1574);
    float _1588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1590 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1560);
    float _1592 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1568);
    float _1594 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1496);
    float _1596 = -_106;
    float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1510);
    float _1600 = _1212 * _1518;
    float _1602 = fma(_1216, _1504, _1540);
    float _1604 = fma(_1368, _1460, _1594);
    float _1606 = _1516 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1612 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1614 = -_1600;
    float _1616 = fma(_1210, _1506, _1614);
    float _1618 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1604);
    float _1620 = fma(_1610, _1500, -0.5);
    float _1622 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1624 = fma(_1200, _1616, _1602);
    float _1626 = _1516 * 6.283185482025146484375;
    float _1628 = cos(_1626);
    float _1630 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1632 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1418);
    float _1634 = _1542 + _1624;
    float _1636 = _1622 + _1612;
    float _1638 = fma(_1630, _1494, -0.5);
    float _1640 = _1580 * 6.283185482025146484375;
    float _1642 = sin(_1640);
    float _1644 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1136);
    float _1646 = _1608 * _1484;
    float _1648 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1526);
    float _1650 = sqrt(_1586);
    float _1652 = _1628 * _1484;
    float _1654 = -_1646;
    float _1656 = fma(_1628, _1620, _1654);
    float _1658 = fma(_1608, _1620, _1652);
    float _1660 = fma(_1274, _1656, _1578);
    float _1662 = _1580 * 6.283185482025146484375;
    float _1664 = cos(_1662);
    float _1666 = _1642 * _1488;
    float _1668 = -_1644;
    float _1670 = fma(_1284, _1658, _1668);
    float _1672 = 1.0 / _1612;
    bool _1674 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1676 = _1664 * _1488;
    float _1678 = -_1666;
    float _1680 = fma(_1664, _1638, _1678);
    float _1682 = fma(_1642, _1638, _1676);
    float _1684 = fma(_1298, _1680, _1598);
    float _1686 = _1680;
    float _1688 = _1558;
    float _1690 = _1554;
    if (!_1674)
    {
        _1686 = _1634;
    }
    float _1692 = _1686;
    float _1694 = _1636 * _1672;
    float _1696 = _1694 * 0.5;
    float _1698 = -_1648;
    float _1700 = fma(_1632, _1682, _1698);
    bool _1702 = !_1674;
    float _1704 = _1692;
    if (!_1702)
    {
        float _1706 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1710 = _1650 + _1708;
        float _1712 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1714 = rsqrt(_1586);
        float _1716 = _1710 * _1706;
        float _1718 = _1716 * 0.15915493667125701904296875;
        float _1720 = _1718 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        float _1724 = _1718 * 6.283185482025146484375;
        float _1726 = sin(_1724);
        float _1728 = _1722 + (-1.0);
        float _1730 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1732 = fma(_1726, _1712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1734 = fma(_1634, _1722, _1730);
        float _1736 = _1714 * _1732;
        float _1738 = fma(_1572, _1736, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1740 = fma(_1564, _1736, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1704 = _1734;
        _1688 = _1738;
        _1690 = _1740;
    }
    float _1742 = _1704;
    float _1744 = _1688;
    float _1746 = _1690;
    float _1748 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1750 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1754 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1748);
    float _1758 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1750);
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1752);
    float _1762 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1754);
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1756);
    float _1766 = _1754;
    if (_1122)
    {
        _1766 = 1.0;
    }
    float _1768 = _1766;
    float _1770 = _1768;
    if (!_1122)
    {
        float _1772 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1776 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1774);
        float _1778 = _1772 * 0.15915493667125701904296875;
        float _1780 = _1778 * 6.283185482025146484375;
        float _1782 = cos(_1780);
        float _1784 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1786 = _1784 * 0.15915493667125701904296875;
        float _1788 = _1778 * 6.283185482025146484375;
        float _1790 = sin(_1788);
        float _1792 = 1.0 / _1782;
        float _1794 = _1786 * 6.283185482025146484375;
        float _1796 = cos(_1794);
        float _1798 = _1790 * _1792;
        float _1800 = 1.0 / _1776;
        float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1804 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1802;
        float _1806 = _1796 * _1798;
        float _1808 = _1786 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        float _1812 = 1.0 / _1806;
        float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1816 = _1800 * _1814;
        float _1818 = 1.0 / _1804;
        float _1820 = _1810 * _1812;
        float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1824 = fma(_1820, _1816, _1822);
        float _1826 = _1824 * _1818;
        float _1828 = precise::clamp(_1826, 0.0, 1.0);
        _1770 = _1828;
    }
    float _1830 = _1770;
    float _1832 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1758);
    float _1834 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1836 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1760);
    float _1838 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1762);
    float _1840 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1842 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1846 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1848 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1852 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1842);
    float _1854 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1844);
    float _1856 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1846);
    float _1858 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1848);
    float _1860 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1852);
    float _1862 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1854);
    float _1864 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1866 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1856);
    float _1868 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1858);
    bool _1870 = _1830 > 0.0;
    bool _1872 = isnan(_1830);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan(0.0);
    bool _1878 = _1874 || _1876;
    float _1880 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1862);
    float _1882 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1884 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1860);
    float _1886 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1888 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1890 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1892 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1894 = _1660 + 0.5;
    float _1896 = _1886 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1898 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1900 = _1882 + _1888;
    float _1902 = _1884 + _1888;
    float _1904 = _1888 * 0.5;
    float _1906 = _1618 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1908 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1912 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = _1670 + 0.5;
    float _1916 = _1684 + 0.5;
    float _1918 = _1700 + 0.5;
    float _1920 = _1900 * 0.5;
    float _1922 = _1902 * 0.5;
    float _1924 = fma(_1880, -0.5, _1904);
    out.m_49.x = _1908;
    out.m_49.y = _1910;
    out.m_49.z = _1912;
    out.m_49.w = _1906;
    out.m_51.x = _1894;
    out.m_51.y = _1914;
    out.m_51.z = _1916;
    out.m_51.w = _1918;
    out.m_33.x = _1896;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1880;
    out.gl_Position.z = _1884;
    out.gl_Position.w = _1888;
    out.m_53.x = _1920;
    out.m_53.y = _1924;
    out.m_53.z = _1922;
    out.m_53.w = _1888;
    if (_1878)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1926 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1926;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1040 = false;
    bool _926 = false;
    bool _784 = false;
    bool _602 = false;
    bool _450 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    float _82 = _80;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _80 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1983 = as_type<float>(_88);
        out.gl_Position.z = _1983;
    }
    if (!_76)
    {
        return out;
    }
    float _92 = in.m_35.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _108 = 0.0;
    float _110 = 0.0;
    if (_102)
    {
        float _112 = float(_72);
        _82 = _112;
    }
    float _114 = _82;
    bool _116 = _106 >= _114;
    bool _118 = !_102;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _90 = as_type<int>(_126);
    }
    int _128 = _90;
    float _130 = as_type<float>(_128);
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2054 = as_type<float>(_128);
        out.gl_Position.z = _2054;
    }
    if (_120)
    {
        return out;
    }
    float _132 = in.m_35.x;
    float _134 = in.m_35.y;
    float _136 = in.m_35.z;
    float _138 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = _138;
    if (!_148)
    {
        float _152 = _138 * _138;
        float _154 = _152 * 0.5;
        _130 = _154;
    }
    float _156 = _130;
    float _158 = 0.0;
    float _160 = _156;
    if (!_148)
    {
        float _162 = _106 * _106;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    if (!_148)
    {
        float _168 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _168;
    }
    float _170 = _160;
    bool _172 = !_148;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _138 * _178;
        float _188 = 1.0 / _182;
        float _190 = _184 * 0.693147182464599609375;
        float _192 = exp2(_186);
        float _194 = 1.0 / _190;
        float _196 = _192 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _194, _138);
        float _202 = _200 * _188;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _108 = _194;
        _174 = _204;
        _110 = _192;
    }
    float _206 = _108;
    float _208 = _174;
    float _210 = _110;
    bool _212 = !_148;
    float _214 = _206;
    float _216 = _210;
    if (!_212)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _138 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _214 = _230;
        _216 = _224;
        _150 = _236;
    }
    float _238 = _214;
    float _240 = _216;
    float _242 = _150;
    float _244 = _240;
    float _246 = _238;
    if (!_148)
    {
        _244 = _106;
    }
    float _248 = _244;
    float _250 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _248;
    if (!_148)
    {
        float _254 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _254;
    }
    float _256 = _246;
    bool _258 = !_148;
    float _260 = _256;
    if (!_258)
    {
        float _262 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = log2(_262);
        float _266 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _268 = _266 + 1.0;
        float _270 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = _106 * _264;
        float _274 = 1.0 / _268;
        float _276 = _270 * 0.693147182464599609375;
        float _278 = exp2(_272);
        float _280 = 1.0 / _276;
        float _282 = _278 + (-1.0);
        float _284 = -_282;
        float _286 = fma(_284, _280, _106);
        float _288 = _286 * _274;
        float _290 = _288 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _290;
    }
    float _292 = _260;
    bool _294 = !_148;
    if (!_294)
    {
        float _296 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = log2(_296);
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = 1.0 / _302;
        float _306 = _106 * _298;
        float _308 = exp2(_306);
        float _310 = -_308;
        float _312 = _310 + 1.0;
        float _314 = _312 * _304;
        _252 = _314;
    }
    float _316 = _252;
    float _318 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _320 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _322 = fma(_242, _134, _250);
    float _324 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _326 = fma(_316, _134, _318);
    float _328 = fma(_242, _132, _320);
    float _330 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = fma(_316, _132, _324);
    float _334 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = -_326;
    float _338 = _322 + _336;
    float _340 = fma(_316, _136, _330);
    float _342 = -_332;
    float _344 = _328 + _342;
    float _346 = fma(_242, _136, _334);
    float _348 = _338 * _338;
    float _350 = in.m_37.w;
    float _352 = _338 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _354 = -_340;
    float _356 = _346 + _354;
    float _358 = fma(_344, _344, _348);
    float _360 = _338 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = _338 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _364 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _352);
    float _366 = fma(_356, _356, _358);
    float _368 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _370 = in.m_30.x;
    float _372 = in.m_30.y;
    float _374 = in.m_30.z;
    float _376 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _362);
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    float _380 = sqrt(_366);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _384 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _376);
    bool _386 = _380 >= 9.9999999747524270787835121154785e-07;
    bool _388 = isnan(_380);
    bool _390 = _386 || _388;
    bool _392 = isnan(9.9999999747524270787835121154785e-07);
    bool _394 = _390 || _392;
    float _396 = fma(_328, _350, _370);
    float _398 = fma(_322, _350, _372);
    float _400 = fma(_346, _350, _374);
    float _402 = _322;
    float _404 = _382;
    float _406 = _384;
    if (_394)
    {
        _402 = _378;
    }
    float _408 = _402;
    float _410 = _408;
    if (!_394)
    {
        bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _414 = !_412;
        if (!_414)
        {
            float _416 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _418 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _420 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _422 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _416);
            float _424 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _418);
            float _426 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _420);
            float _428 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _422);
            float _430 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _424);
            float _432 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
            float _434 = _428 * _428;
            float _436 = fma(_430, _430, _434);
            float _438 = fma(_432, _432, _436);
            float _440 = rsqrt(_438);
            float _442 = _440 * 9.9999999747524270787835121154785e-07;
            float _444 = _430 * _442;
            float _446 = _428 * _442;
            float _448 = _432 * _442;
            _404 = _446;
            _410 = _444;
            _406 = _448;
            _450 = true;
        }
        else
        {
            float _452 = _134 * _134;
            float _454 = fma(_132, _132, _452);
            float _456 = fma(_136, _136, _454);
            float _458 = sqrt(_456);
            bool _460 = _458 >= 9.9999999747524270787835121154785e-07;
            bool _462 = isnan(_458);
            bool _464 = _460 || _462;
            bool _466 = isnan(9.9999999747524270787835121154785e-07);
            bool _468 = _464 || _466;
            if (!_468)
            {
                float _470 = _372 * _372;
                float _472 = fma(_370, _370, _470);
                float _474 = fma(_374, _374, _472);
                float _476 = sqrt(_474);
                bool _478 = _476 >= 9.9999999747524270787835121154785e-07;
                bool _480 = isnan(_476);
                bool _482 = _478 || _480;
                bool _484 = isnan(9.9999999747524270787835121154785e-07);
                bool _486 = _482 || _484;
                if (!_486)
                {
                    float _488 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _490 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _488);
                    float _492 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _490);
                    float _494 = rsqrt(_492);
                    float _496 = _494 * 9.9999999747524270787835121154785e-07;
                    float _498 = _496 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _500 = _496 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _502 = _496 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _404 = _500;
                    _410 = _498;
                    _406 = _502;
                    _450 = true;
                }
                else
                {
                    float _504 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _506 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _508 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _510 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].x, _504);
                    float _512 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].x, _506);
                    float _514 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].x, _508);
                    float _516 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _510);
                    float _518 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _512);
                    float _520 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _514);
                    float _522 = _516 * _516;
                    float _524 = fma(_518, _518, _522);
                    float _526 = fma(_520, _520, _524);
                    float _528 = rsqrt(_526);
                    float _530 = _528 * 9.9999999747524270787835121154785e-07;
                    float _532 = _518 * _530;
                    float _534 = _516 * _530;
                    float _536 = _520 * _530;
                    _404 = _534;
                    _410 = _532;
                    _406 = _536;
                    _450 = true;
                }
            }
            else
            {
                float _538 = _134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _540 = _134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _542 = _134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _544 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _538);
                float _546 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _540);
                float _548 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _542);
                float _550 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _544);
                float _552 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _546);
                float _554 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _548);
                float _556 = _550 * _550;
                float _558 = fma(_552, _552, _556);
                float _560 = fma(_554, _554, _558);
                float _562 = rsqrt(_560);
                float _564 = _562 * 9.9999999747524270787835121154785e-07;
                float _566 = _552 * _564;
                float _568 = _550 * _564;
                float _570 = _554 * _564;
                _404 = _568;
                _410 = _566;
                _406 = _570;
            }
        }
    }
    _450 = false;
    float _572 = _404;
    float _574 = _410;
    float _576 = _406;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _580 = !_578;
    float _582 = _574;
    float _600;
    if (!_580)
    {
        float _584 = in.m_39.x;
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _588 = _584 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _592 = _590 * _586;
        float _594 = floor(_592);
        float _596 = -_594;
        float _598 = _592 + _596;
        _600 = _598;
        _602 = true;
    }
    else
    {
        float _604 = float(_72);
        float _606 = 1.0 / _604;
        float _608 = _106 * _606;
        _600 = _608;
    }
    _602 = false;
    float _610 = _600;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _614 = _610 + _612;
    bool _616 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _618 = isnan(_610);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _630 = _610 + _628;
    bool _632 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _634 = isnan(_610);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _652 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _654 = isnan(_610);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -_626;
    float _666 = _664 + 1.0;
    float _668 = 1.0 / _650;
    float _670 = _662 * _666;
    float _672 = -_662;
    float _674 = _672 + 1.0;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _676;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _682 = 1.0 / _646;
    float _684 = _642 * _674;
    float _686 = -_642;
    float _688 = _686 + 1.0;
    float _690 = _630 * _668;
    float _692 = _614 * _682;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _698;
    float _702 = fma(_678, _692, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _704 = fma(_696, _692, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _706 = fma(_700, _692, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _708 = in.m_37.x;
    float _710 = in.m_37.y;
    float _712 = in.m_37.z;
    float _714 = _702 * _684;
    float _716 = _704 * _684;
    float _718 = _706 * _684;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].x, _714);
    float _734 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].y, _716);
    float _736 = fma(_722, _690, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _738 = fma(_726, _690, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _740 = fma(_730, _690, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _742 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].z, _718);
    float _744 = fma(_736, _670, _732);
    float _746 = fma(_738, _670, _734);
    float _748 = fma(_740, _670, _742);
    float _750 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[145].x, _744);
    float _752 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[145].y, _746);
    float _754 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[145].z, _748);
    float _756 = _750 * _708;
    float _758 = _752 * _710;
    float _760 = _754 * _712;
    bool _762 = !_680;
    float _764 = _760;
    float _782;
    if (!_762)
    {
        float _766 = in.m_39.x;
        float _768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _770 = _766 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _774 = _772 * _768;
        float _776 = floor(_774);
        float _778 = -_776;
        float _780 = _774 + _778;
        _782 = _780;
        _784 = true;
    }
    else
    {
        float _786 = float(_72);
        float _788 = 1.0 / _786;
        float _790 = _106 * _788;
        _782 = _790;
    }
    _784 = false;
    float _792 = _782;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _796 = _792 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _802 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _804 = isnan(_792);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _818 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _820 = isnan(_792);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _830;
    bool _834 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _836 = isnan(_792);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / _800;
    float _848 = -_812;
    float _850 = _848 + 1.0;
    bool _852 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _854 = 1.0 / _816;
    float _856 = _832 * _846;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _862 = fma(_856, _796, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _864 = _828 * _850;
    float _866 = -_844;
    float _868 = _866 + 1.0;
    float _870 = -_828;
    float _872 = _870 + 1.0;
    float _874 = _860 * _854;
    float _876 = _862 * _864;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = _792 + _878;
    float _882 = _812 * _868;
    float _884 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[115].x, _876);
    float _886 = fma(_874, _880, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _888 = fma(_886, _882, _884);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _896 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[117].x, _888);
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _896 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _898;
    out.m_41.y = _900;
    out.m_41.z = _902;
    out.m_41.w = _904;
    bool _906 = !_852;
    float _924;
    if (!_906)
    {
        float _908 = in.m_39.x;
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _912 = _908 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[11].z, _106);
        float _916 = _914 * _910;
        float _918 = floor(_916);
        float _920 = -_918;
        float _922 = _916 + _920;
        _924 = _922;
        _926 = true;
    }
    else
    {
        float _928 = float(_72);
        float _930 = 1.0 / _928;
        float _932 = _106 * _930;
        _924 = _932;
    }
    _926 = false;
    float _934 = _924;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _938 = _934 + _936;
    bool _940 = _934 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _942 = isnan(_934);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _952;
    bool _956 = _934 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _958 = isnan(_934);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = -_950;
    float _970 = _968 + 1.0;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _972;
    float _976 = 1.0 / _954;
    bool _978 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _980 = _966 * _970;
    float _982 = -_966;
    float _984 = _982 + 1.0;
    float _986 = _938 * _976;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _988;
    float _992 = fma(_974, _986, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _994;
    float _998 = fma(_990, _986, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1000 = fma(_996, _986, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1002 = _992 * _980;
    float _1004 = _1000 * _980;
    float _1006 = _998 * _980;
    float _1008 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1002);
    float _1010 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1004);
    float _1012 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1006);
    float _1014 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1008);
    float _1016 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1010);
    float _1018 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1012);
    bool _1020 = !_978;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_39.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        float _1042 = float(_72);
        float _1044 = 1.0 / _1042;
        float _1046 = _106 * _1044;
        _1038 = _1046;
    }
    _1040 = false;
    float _1048 = _1038;
    float _1050 = in.m_39.x;
    float _1052 = in.m_39.y;
    float _1054 = in.m_39.z;
    float _1056 = in.m_39.w;
    float _1058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1060 = in.m_43.x;
    float _1062 = in.m_43.y;
    float _1064 = in.m_43.z;
    float _1066 = in.m_45.y;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1072 = _1070 != 0;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _1074 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1078 = _1076 != 0;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1090 = _1088 != 0;
    bool _1092 = _1056 > 0.5;
    float _1094 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1096 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1098 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1074);
    float _1100 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1094);
    float _1102 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1096);
    float _1104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1062);
    float _1106 = _572 * _572;
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1060);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1064);
    float _1112 = fma(_574, _574, _1106);
    bool _1114 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.5);
    bool _1122 = _1118 || _1120;
    float _1124 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1126 = fma(_576, _576, _1112);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1130 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1136 = fma(_1124, -2.0, _1128);
    float _1138 = rsqrt(_1126);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1142 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1098);
    float _1144 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1100);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1150 = -_1140;
    float _1152 = fma(_1130, 2.0, _1150);
    float _1154 = 1.0 / _1134;
    float _1156 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1158 = 0.0;
    bool _1160 = _1090;
    bool _1162 = _1086;
    float _1164 = _1108;
    float _1166 = _1050;
    if (_1078)
    {
        float _1168 = in.m_39.z;
        _1158 = _1168;
    }
    float _1170 = _1158;
    float _1172 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1174;
    float _1178 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1102);
    float _1180 = _1172 * _1104;
    float _1182 = 1.0 / _1148;
    float _1184 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1186 = _1138 * _572;
    float _1188 = -_1066;
    float _1190 = _1188 + 1.0;
    float _1192 = 0.0;
    float _1194 = _1066;
    if (_1082)
    {
        float _1196 = in.m_39.x;
        _1192 = _1196;
    }
    float _1198 = _1192;
    float _1200 = _1184 * _1110;
    float _1202 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1208 = _1176 * _1154;
    float _1210 = _1138 * _574;
    float _1212 = _1138 * _576;
    int _1214 = _1092 ? as_type<int>(_1190) : as_type<int>(_1066);
    float _1216 = _1156 * _1108;
    float _1218 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1202);
    bool _1220 = _1052 > 0.5;
    float _1222 = in.m_45.x;
    float _1224 = _1206 * _1182;
    float _1226 = _1086 ? as_type<float>(_1214) : _1066;
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1218);
    float _1230 = _1228;
    float _1232 = _1182;
    float _1234 = _1224;
    if (_1090)
    {
        float _1236 = _1220 ? _1190 : _1066;
        _1194 = _1236;
    }
    float _1238 = _1194;
    float _1240 = _1180 * _1210;
    float _1242 = abs(_1228);
    bool _1244 = _1242 > 0.99989998340606689453125;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    if (_1078)
    {
        bool _1248 = _1170 > 0.5;
        _1160 = _1248;
    }
    bool _1250 = _1160;
    float _1252 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1246);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1256 = _1048 + _1254;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1260 = _1258;
    if (_1082)
    {
        bool _1262 = _1198 > 0.5;
        _1162 = _1262;
    }
    bool _1264 = _1162;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1268 = fma(_1208, _1256, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1270 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1258);
    float _1272 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1266);
    float _1274 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1270);
    float _1276 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_1244)
    {
        _1260 = 0.001000000047497451305389404296875;
    }
    float _1278 = _1260;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1072)
    {
        _582 = _1052;
    }
    float _1282 = _582;
    float _1284 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1272);
    float _1286 = _1282;
    if (_1072)
    {
        _1286 = _1050;
    }
    float _1288 = _1286;
    if (!_1072)
    {
        _764 = _1054;
    }
    float _1290 = _764;
    float _1292 = _1290;
    if (!_1072)
    {
        _1230 = _1054;
    }
    float _1294 = _1230;
    float _1296 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1280);
    float _1298 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1296);
    float _1300 = _1294;
    if (!_1072)
    {
        _1164 = _1052;
    }
    float _1302 = _1164;
    float _1304 = _1302;
    if (_1072)
    {
        _1292 = _1052;
    }
    float _1306 = _1292;
    if (_1072)
    {
        _1300 = _1052;
    }
    float _1308 = _1300;
    float _1310 = 0.0;
    if (!_1244)
    {
        _1310 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1312 = _1310;
    float _1314 = _1312;
    if (_1244)
    {
        float _1316 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1314 = _1316;
    }
    float _1318 = _1314;
    if (!_1244)
    {
        _1276 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1320 = _1276;
    float _1322 = _1320;
    if (_1244)
    {
        float _1324 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1322 = _1324;
    }
    float _1326 = _1322;
    if (!_1244)
    {
        _1232 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1328 = _1232;
    float _1330 = _1328;
    if (_1244)
    {
        float _1332 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1330 = _1332;
    }
    float _1334 = _1330;
    float _1336 = 0.0;
    if (!_1072)
    {
        _1336 = _1050;
    }
    float _1338 = _1336;
    float _1340 = -_1318;
    float _1342 = _1212 * _1340;
    float _1344 = _1338;
    if (_1072)
    {
        _1344 = _1054;
    }
    float _1346 = _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1350 = _1048 + _1348;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1354 = -_1326;
    float _1356 = _1186 * _1354;
    float _1358 = -_1334;
    float _1360 = _1210 * _1358;
    float _1362 = -_1326;
    float _1364 = -_1342;
    float _1366 = fma(_1210, _1362, _1364);
    float _1368 = fma(_1224, _1350, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1370 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1352);
    if (!_1082)
    {
        _1234 = _1222;
    }
    float _1372 = _1234;
    float _1374 = -_1318;
    float _1376 = -_1360;
    float _1378 = fma(_1186, _1374, _1376);
    float _1380 = -_1334;
    float _1382 = -_1356;
    float _1384 = fma(_1212, _1380, _1382);
    float _1386 = _1366 * _1366;
    float _1388 = _1372;
    int _1390 = as_type<int>(_1386);
    if (_1072)
    {
        _1304 = _1050;
    }
    float _1392 = _1304;
    float _1394 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1370);
    if (!_1082)
    {
        _1166 = _1372;
    }
    float _1396 = _1166;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1400 = _1396;
    if (_1082)
    {
        _1388 = _1222;
    }
    float _1402 = _1388;
    float _1404 = fma(_1384, _1384, _1386);
    bool _1406 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1408 = isnan(_1048);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1398);
    bool _1420 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1422 = isnan(_1048);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    float _1432 = fma(_1378, _1378, _1404);
    bool _1434 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1436 = isnan(_1048);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    if (_1078)
    {
        float _1446 = -_1402;
        float _1448 = _1446 + 1.0;
        _1390 = as_type<int>(_1448);
    }
    int _1450 = _1390;
    float _1452 = -_1430;
    float _1454 = _1452 + 1.0;
    float _1456 = rsqrt(_1432);
    float _1458 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1460 = _1444 * _1454;
    float _1462 = -_1444;
    float _1464 = _1462 + 1.0;
    float _1466 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1470 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1472 = _1416 * _1464;
    int _1474 = as_type<int>(_1464);
    float _1476 = _1466;
    if (_1082)
    {
        float _1478 = -_1402;
        float _1480 = _1478 + 1.0;
        _1474 = as_type<int>(_1480);
    }
    int _1482 = _1474;
    float _1484 = fma(_1466, _1238, -0.5);
    if (!_1078)
    {
        _1476 = _1402;
    }
    float _1486 = _1476;
    float _1488 = fma(_1226, _1470, -0.5);
    float _1490 = _1486;
    if (_1078)
    {
        float _1492 = _1250 ? as_type<float>(_1450) : _1402;
        _1490 = _1492;
    }
    float _1494 = _1490;
    float _1496 = _1268 * _1472;
    if (_1082)
    {
        float _1498 = _1264 ? as_type<float>(_1482) : _1402;
        _1400 = _1498;
    }
    float _1500 = _1400;
    float _1502 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1252);
    float _1504 = _1366 * _1456;
    float _1506 = _1378 * _1456;
    float _1508 = -_1468;
    float _1510 = fma(_1458, 2.0, _1508);
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1514 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1516 = _1502 * (-0.15915493667125701904296875);
    float _1518 = _1384 * _1456;
    float _1520 = _1210 * _1504;
    float _1522 = _1180 * _1212;
    float _1524 = _1186 * _1506;
    float _1526 = fma(_1514, -2.0, _1512);
    float _1528 = -_1520;
    float _1530 = fma(_1186, _1518, _1528);
    float _1532 = fma(_1216, _1506, _1522);
    float _1534 = fma(_1216, _1518, _1240);
    float _1536 = -_1524;
    float _1538 = fma(_1212, _1504, _1536);
    float _1540 = _1180 * _1186;
    float _1542 = _1142 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1544 = fma(_1200, _1530, _1532);
    float _1546 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1548 = fma(_1200, _1538, _1534);
    float _1550 = _1144 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1554 = _1546 + _1544;
    float _1556 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1558 = _1550 + _1548;
    float _1560 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1552);
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1564 = _1554 + _1562;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1568 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1556);
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1572 = _1558 + _1570;
    float _1574 = _1564 * _1564;
    float _1576 = -_106;
    float _1578 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1152);
    float _1580 = _1394 * (-0.15915493667125701904296875);
    float _1582 = -_1416;
    float _1584 = _1582 + 1.0;
    float _1586 = fma(_1572, _1572, _1574);
    float _1588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1590 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1560);
    float _1592 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1568);
    float _1594 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1496);
    float _1596 = -_106;
    float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1510);
    float _1600 = _1212 * _1518;
    float _1602 = fma(_1216, _1504, _1540);
    float _1604 = fma(_1368, _1460, _1594);
    float _1606 = _1516 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1612 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1614 = -_1600;
    float _1616 = fma(_1210, _1506, _1614);
    float _1618 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1604);
    float _1620 = fma(_1610, _1500, -0.5);
    float _1622 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1624 = fma(_1200, _1616, _1602);
    float _1626 = _1516 * 6.283185482025146484375;
    float _1628 = cos(_1626);
    float _1630 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1632 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1418);
    float _1634 = _1542 + _1624;
    float _1636 = _1622 + _1612;
    float _1638 = fma(_1630, _1494, -0.5);
    float _1640 = _1580 * 6.283185482025146484375;
    float _1642 = sin(_1640);
    float _1644 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1136);
    float _1646 = _1608 * _1484;
    float _1648 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1526);
    float _1650 = sqrt(_1586);
    float _1652 = _1628 * _1484;
    float _1654 = -_1646;
    float _1656 = fma(_1628, _1620, _1654);
    float _1658 = fma(_1608, _1620, _1652);
    float _1660 = fma(_1274, _1656, _1578);
    float _1662 = _1580 * 6.283185482025146484375;
    float _1664 = cos(_1662);
    float _1666 = _1642 * _1488;
    float _1668 = -_1644;
    float _1670 = fma(_1284, _1658, _1668);
    float _1672 = 1.0 / _1612;
    bool _1674 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1676 = _1664 * _1488;
    float _1678 = -_1666;
    float _1680 = fma(_1664, _1638, _1678);
    float _1682 = fma(_1642, _1638, _1676);
    float _1684 = fma(_1298, _1680, _1598);
    float _1686 = _1680;
    float _1688 = _1558;
    float _1690 = _1554;
    if (!_1674)
    {
        _1686 = _1634;
    }
    float _1692 = _1686;
    float _1694 = _1636 * _1672;
    float _1696 = _1694 * 0.5;
    float _1698 = -_1648;
    float _1700 = fma(_1632, _1682, _1698);
    bool _1702 = !_1674;
    float _1704 = _1692;
    if (!_1702)
    {
        float _1706 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1710 = _1650 + _1708;
        float _1712 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1714 = rsqrt(_1586);
        float _1716 = _1710 * _1706;
        float _1718 = _1716 * 0.15915493667125701904296875;
        float _1720 = _1718 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        float _1724 = _1718 * 6.283185482025146484375;
        float _1726 = sin(_1724);
        float _1728 = _1722 + (-1.0);
        float _1730 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1732 = fma(_1726, _1712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1734 = fma(_1634, _1722, _1730);
        float _1736 = _1714 * _1732;
        float _1738 = fma(_1572, _1736, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1740 = fma(_1564, _1736, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1704 = _1734;
        _1688 = _1738;
        _1690 = _1740;
    }
    float _1742 = _1704;
    float _1744 = _1688;
    float _1746 = _1690;
    float _1748 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1750 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1754 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1748);
    float _1758 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1750);
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1752);
    float _1762 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1754);
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1756);
    float _1766 = _1754;
    if (_1122)
    {
        _1766 = 1.0;
    }
    float _1768 = _1766;
    float _1770 = _1768;
    if (!_1122)
    {
        float _1772 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1776 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1774);
        float _1778 = _1772 * 0.15915493667125701904296875;
        float _1780 = _1778 * 6.283185482025146484375;
        float _1782 = cos(_1780);
        float _1784 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1786 = _1784 * 0.15915493667125701904296875;
        float _1788 = _1778 * 6.283185482025146484375;
        float _1790 = sin(_1788);
        float _1792 = 1.0 / _1782;
        float _1794 = _1786 * 6.283185482025146484375;
        float _1796 = cos(_1794);
        float _1798 = _1790 * _1792;
        float _1800 = 1.0 / _1776;
        float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1804 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1802;
        float _1806 = _1796 * _1798;
        float _1808 = _1786 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        float _1812 = 1.0 / _1806;
        float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1816 = _1800 * _1814;
        float _1818 = 1.0 / _1804;
        float _1820 = _1810 * _1812;
        float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1824 = fma(_1820, _1816, _1822);
        float _1826 = _1824 * _1818;
        float _1828 = precise::clamp(_1826, 0.0, 1.0);
        _1770 = _1828;
    }
    float _1830 = _1770;
    float _1832 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1758);
    float _1834 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1836 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1760);
    float _1838 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1762);
    float _1840 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1842 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1846 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1848 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1852 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1842);
    float _1854 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1844);
    float _1856 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1846);
    float _1858 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1848);
    float _1860 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1852);
    float _1862 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1854);
    float _1864 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1866 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1856);
    float _1868 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1858);
    bool _1870 = _1830 > 0.0;
    bool _1872 = isnan(_1830);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan(0.0);
    bool _1878 = _1874 || _1876;
    float _1880 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1862);
    float _1882 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1884 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1860);
    float _1886 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1888 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1890 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1892 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1894 = _1660 + 0.5;
    float _1896 = _1886 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1898 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1900 = _1882 + _1888;
    float _1902 = _1884 + _1888;
    float _1904 = _1888 * 0.5;
    float _1906 = _1618 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1908 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1912 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = _1670 + 0.5;
    float _1916 = _1684 + 0.5;
    float _1918 = _1700 + 0.5;
    float _1920 = _1900 * 0.5;
    float _1922 = _1902 * 0.5;
    float _1924 = fma(_1880, -0.5, _1904);
    out.m_49.x = _1908;
    out.m_49.y = _1910;
    out.m_49.z = _1912;
    out.m_49.w = _1906;
    out.m_51.x = _1894;
    out.m_51.y = _1914;
    out.m_51.z = _1916;
    out.m_51.w = _1918;
    out.m_33.x = _1896;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1880;
    out.gl_Position.z = _1884;
    out.gl_Position.w = _1888;
    out.m_53.x = _1920;
    out.m_53.y = _1924;
    out.m_53.z = _1922;
    out.m_53.w = _1888;
    if (_1878)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1926 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1926;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1040 = false;
    bool _926 = false;
    bool _784 = false;
    bool _602 = false;
    bool _450 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    float _82 = _80;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _80 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1983 = as_type<float>(_88);
        out.gl_Position.z = _1983;
    }
    if (!_76)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _92 = in.m_35.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _108 = 0.0;
    float _110 = 0.0;
    if (_102)
    {
        float _112 = float(_72);
        _82 = _112;
    }
    float _114 = _82;
    bool _116 = _106 >= _114;
    bool _118 = !_102;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _90 = as_type<int>(_126);
    }
    int _128 = _90;
    float _130 = as_type<float>(_128);
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2054 = as_type<float>(_128);
        out.gl_Position.z = _2054;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_35.x;
    float _134 = in.m_35.y;
    float _136 = in.m_35.z;
    float _138 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = _138;
    if (!_148)
    {
        float _152 = _138 * _138;
        float _154 = _152 * 0.5;
        _130 = _154;
    }
    float _156 = _130;
    float _158 = 0.0;
    float _160 = _156;
    if (!_148)
    {
        float _162 = _106 * _106;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    if (!_148)
    {
        float _168 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _168;
    }
    float _170 = _160;
    bool _172 = !_148;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _138 * _178;
        float _188 = 1.0 / _182;
        float _190 = _184 * 0.693147182464599609375;
        float _192 = exp2(_186);
        float _194 = 1.0 / _190;
        float _196 = _192 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _194, _138);
        float _202 = _200 * _188;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _108 = _194;
        _174 = _204;
        _110 = _192;
    }
    float _206 = _108;
    float _208 = _174;
    float _210 = _110;
    bool _212 = !_148;
    float _214 = _206;
    float _216 = _210;
    if (!_212)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _138 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _214 = _230;
        _216 = _224;
        _150 = _236;
    }
    float _238 = _214;
    float _240 = _216;
    float _242 = _150;
    float _244 = _240;
    float _246 = _238;
    if (!_148)
    {
        _244 = _106;
    }
    float _248 = _244;
    float _250 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _248;
    if (!_148)
    {
        float _254 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _254;
    }
    float _256 = _246;
    bool _258 = !_148;
    float _260 = _256;
    if (!_258)
    {
        float _262 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = log2(_262);
        float _266 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _268 = _266 + 1.0;
        float _270 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = _106 * _264;
        float _274 = 1.0 / _268;
        float _276 = _270 * 0.693147182464599609375;
        float _278 = exp2(_272);
        float _280 = 1.0 / _276;
        float _282 = _278 + (-1.0);
        float _284 = -_282;
        float _286 = fma(_284, _280, _106);
        float _288 = _286 * _274;
        float _290 = _288 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _290;
    }
    float _292 = _260;
    bool _294 = !_148;
    if (!_294)
    {
        float _296 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = log2(_296);
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = 1.0 / _302;
        float _306 = _106 * _298;
        float _308 = exp2(_306);
        float _310 = -_308;
        float _312 = _310 + 1.0;
        float _314 = _312 * _304;
        _252 = _314;
    }
    float _316 = _252;
    float _318 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _320 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _322 = fma(_242, _134, _250);
    float _324 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _326 = fma(_316, _134, _318);
    float _328 = fma(_242, _132, _320);
    float _330 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = fma(_316, _132, _324);
    float _334 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = -_326;
    float _338 = _322 + _336;
    float _340 = fma(_316, _136, _330);
    float _342 = -_332;
    float _344 = _328 + _342;
    float _346 = fma(_242, _136, _334);
    float _348 = _338 * _338;
    float _350 = in.m_37.w;
    float _352 = _338 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _354 = -_340;
    float _356 = _346 + _354;
    float _358 = fma(_344, _344, _348);
    float _360 = _338 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _362 = _338 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _364 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _352);
    float _366 = fma(_356, _356, _358);
    float _368 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _360);
    float _370 = in.m_30.x;
    float _372 = in.m_30.y;
    float _374 = in.m_30.z;
    float _376 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _362);
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    float _380 = sqrt(_366);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _384 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _376);
    bool _386 = _380 >= 9.9999999747524270787835121154785e-07;
    bool _388 = isnan(_380);
    bool _390 = _386 || _388;
    bool _392 = isnan(9.9999999747524270787835121154785e-07);
    bool _394 = _390 || _392;
    float _396 = fma(_328, _350, _370);
    float _398 = fma(_322, _350, _372);
    float _400 = fma(_346, _350, _374);
    float _402 = _322;
    float _404 = _382;
    float _406 = _384;
    if (_394)
    {
        _402 = _378;
    }
    float _408 = _402;
    float _410 = _408;
    if (!_394)
    {
        bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _414 = !_412;
        if (!_414)
        {
            float _416 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _418 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _420 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _422 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _416);
            float _424 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _418);
            float _426 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _420);
            float _428 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _422);
            float _430 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _424);
            float _432 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
            float _434 = _428 * _428;
            float _436 = fma(_430, _430, _434);
            float _438 = fma(_432, _432, _436);
            float _440 = rsqrt(_438);
            float _442 = _440 * 9.9999999747524270787835121154785e-07;
            float _444 = _430 * _442;
            float _446 = _428 * _442;
            float _448 = _432 * _442;
            _404 = _446;
            _410 = _444;
            _406 = _448;
            _450 = true;
        }
        else
        {
            float _452 = _134 * _134;
            float _454 = fma(_132, _132, _452);
            float _456 = fma(_136, _136, _454);
            float _458 = sqrt(_456);
            bool _460 = _458 >= 9.9999999747524270787835121154785e-07;
            bool _462 = isnan(_458);
            bool _464 = _460 || _462;
            bool _466 = isnan(9.9999999747524270787835121154785e-07);
            bool _468 = _464 || _466;
            if (!_468)
            {
                float _470 = _372 * _372;
                float _472 = fma(_370, _370, _470);
                float _474 = fma(_374, _374, _472);
                float _476 = sqrt(_474);
                bool _478 = _476 >= 9.9999999747524270787835121154785e-07;
                bool _480 = isnan(_476);
                bool _482 = _478 || _480;
                bool _484 = isnan(9.9999999747524270787835121154785e-07);
                bool _486 = _482 || _484;
                if (!_486)
                {
                    float _488 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _490 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _488);
                    float _492 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _490);
                    float _494 = rsqrt(_492);
                    float _496 = _494 * 9.9999999747524270787835121154785e-07;
                    float _498 = _496 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _500 = _496 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _502 = _496 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _404 = _500;
                    _410 = _498;
                    _406 = _502;
                    _450 = true;
                }
                else
                {
                    float _504 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _506 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _508 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _510 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].x, _504);
                    float _512 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].x, _506);
                    float _514 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].x, _508);
                    float _516 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _510);
                    float _518 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _512);
                    float _520 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _514);
                    float _522 = _516 * _516;
                    float _524 = fma(_518, _518, _522);
                    float _526 = fma(_520, _520, _524);
                    float _528 = rsqrt(_526);
                    float _530 = _528 * 9.9999999747524270787835121154785e-07;
                    float _532 = _518 * _530;
                    float _534 = _516 * _530;
                    float _536 = _520 * _530;
                    _404 = _534;
                    _410 = _532;
                    _406 = _536;
                    _450 = true;
                }
            }
            else
            {
                float _538 = _134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _540 = _134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _542 = _134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _544 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _538);
                float _546 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _540);
                float _548 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _542);
                float _550 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _544);
                float _552 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _546);
                float _554 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _548);
                float _556 = _550 * _550;
                float _558 = fma(_552, _552, _556);
                float _560 = fma(_554, _554, _558);
                float _562 = rsqrt(_560);
                float _564 = _562 * 9.9999999747524270787835121154785e-07;
                float _566 = _552 * _564;
                float _568 = _550 * _564;
                float _570 = _554 * _564;
                _404 = _568;
                _410 = _566;
                _406 = _570;
            }
        }
    }
    _450 = false;
    float _572 = _404;
    float _574 = _410;
    float _576 = _406;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _580 = !_578;
    float _582 = _574;
    float _600;
    if (!_580)
    {
        float _584 = in.m_39.x;
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _588 = _584 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _592 = _590 * _586;
        float _594 = floor(_592);
        float _596 = -_594;
        float _598 = _592 + _596;
        _600 = _598;
        _602 = true;
    }
    else
    {
        float _604 = float(_72);
        float _606 = 1.0 / _604;
        float _608 = _106 * _606;
        _600 = _608;
    }
    _602 = false;
    float _610 = _600;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _614 = _610 + _612;
    bool _616 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _618 = isnan(_610);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _630 = _610 + _628;
    bool _632 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _634 = isnan(_610);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _652 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _654 = isnan(_610);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -_626;
    float _666 = _664 + 1.0;
    float _668 = 1.0 / _650;
    float _670 = _662 * _666;
    float _672 = -_662;
    float _674 = _672 + 1.0;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _676;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _682 = 1.0 / _646;
    float _684 = _642 * _674;
    float _686 = -_642;
    float _688 = _686 + 1.0;
    float _690 = _630 * _668;
    float _692 = _614 * _682;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _698;
    float _702 = fma(_678, _692, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _704 = fma(_696, _692, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _706 = fma(_700, _692, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _708 = in.m_37.x;
    float _710 = in.m_37.y;
    float _712 = in.m_37.z;
    float _714 = _702 * _684;
    float _716 = _704 * _684;
    float _718 = _706 * _684;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].x, _714);
    float _734 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].y, _716);
    float _736 = fma(_722, _690, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _738 = fma(_726, _690, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _740 = fma(_730, _690, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _742 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].z, _718);
    float _744 = fma(_736, _670, _732);
    float _746 = fma(_738, _670, _734);
    float _748 = fma(_740, _670, _742);
    float _750 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[145].x, _744);
    float _752 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[145].y, _746);
    float _754 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[145].z, _748);
    float _756 = _750 * _708;
    float _758 = _752 * _710;
    float _760 = _754 * _712;
    bool _762 = !_680;
    float _764 = _760;
    float _782;
    if (!_762)
    {
        float _766 = in.m_39.x;
        float _768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _770 = _766 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _774 = _772 * _768;
        float _776 = floor(_774);
        float _778 = -_776;
        float _780 = _774 + _778;
        _782 = _780;
        _784 = true;
    }
    else
    {
        float _786 = float(_72);
        float _788 = 1.0 / _786;
        float _790 = _106 * _788;
        _782 = _790;
    }
    _784 = false;
    float _792 = _782;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _796 = _792 + _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _802 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _804 = isnan(_792);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _818 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _820 = isnan(_792);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _830;
    bool _834 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _836 = isnan(_792);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / _800;
    float _848 = -_812;
    float _850 = _848 + 1.0;
    bool _852 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _854 = 1.0 / _816;
    float _856 = _832 * _846;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _862 = fma(_856, _796, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _864 = _828 * _850;
    float _866 = -_844;
    float _868 = _866 + 1.0;
    float _870 = -_828;
    float _872 = _870 + 1.0;
    float _874 = _860 * _854;
    float _876 = _862 * _864;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = _792 + _878;
    float _882 = _812 * _868;
    float _884 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[115].x, _876);
    float _886 = fma(_874, _880, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _888 = fma(_886, _882, _884);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _896 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[117].x, _888);
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _904 = _896 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _898;
    out.m_41.y = _900;
    out.m_41.z = _902;
    out.m_41.w = _904;
    bool _906 = !_852;
    float _924;
    if (!_906)
    {
        float _908 = in.m_39.x;
        float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _912 = _908 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _914 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[11].z, _106);
        float _916 = _914 * _910;
        float _918 = floor(_916);
        float _920 = -_918;
        float _922 = _916 + _920;
        _924 = _922;
        _926 = true;
    }
    else
    {
        float _928 = float(_72);
        float _930 = 1.0 / _928;
        float _932 = _106 * _930;
        _924 = _932;
    }
    _926 = false;
    float _934 = _924;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _938 = _934 + _936;
    bool _940 = _934 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _942 = isnan(_934);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _952;
    bool _956 = _934 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _958 = isnan(_934);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = -_950;
    float _970 = _968 + 1.0;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _972;
    float _976 = 1.0 / _954;
    bool _978 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _980 = _966 * _970;
    float _982 = -_966;
    float _984 = _982 + 1.0;
    float _986 = _938 * _976;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _988;
    float _992 = fma(_974, _986, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _994;
    float _998 = fma(_990, _986, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1000 = fma(_996, _986, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1002 = _992 * _980;
    float _1004 = _1000 * _980;
    float _1006 = _998 * _980;
    float _1008 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1002);
    float _1010 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1004);
    float _1012 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1006);
    float _1014 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1008);
    float _1016 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1010);
    float _1018 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1012);
    bool _1020 = !_978;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_39.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        float _1042 = float(_72);
        float _1044 = 1.0 / _1042;
        float _1046 = _106 * _1044;
        _1038 = _1046;
    }
    _1040 = false;
    float _1048 = _1038;
    float _1050 = in.m_39.x;
    float _1052 = in.m_39.y;
    float _1054 = in.m_39.z;
    float _1056 = in.m_39.w;
    float _1058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1060 = in.m_43.x;
    float _1062 = in.m_43.y;
    float _1064 = in.m_43.z;
    float _1066 = in.m_45.y;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1072 = _1070 != 0;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _1074 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1078 = _1076 != 0;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1090 = _1088 != 0;
    bool _1092 = _1056 > 0.5;
    float _1094 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1096 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1098 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1074);
    float _1100 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1094);
    float _1102 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1096);
    float _1104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1062);
    float _1106 = _572 * _572;
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1060);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1064);
    float _1112 = fma(_574, _574, _1106);
    bool _1114 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.5);
    bool _1122 = _1118 || _1120;
    float _1124 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1126 = fma(_576, _576, _1112);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1130 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1136 = fma(_1124, -2.0, _1128);
    float _1138 = rsqrt(_1126);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1142 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1098);
    float _1144 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1100);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1150 = -_1140;
    float _1152 = fma(_1130, 2.0, _1150);
    float _1154 = 1.0 / _1134;
    float _1156 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1158 = 0.0;
    bool _1160 = _1090;
    bool _1162 = _1086;
    float _1164 = _1108;
    float _1166 = _1050;
    if (_1078)
    {
        float _1168 = in.m_39.z;
        _1158 = _1168;
    }
    float _1170 = _1158;
    float _1172 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1174;
    float _1178 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1102);
    float _1180 = _1172 * _1104;
    float _1182 = 1.0 / _1148;
    float _1184 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1186 = _1138 * _572;
    float _1188 = -_1066;
    float _1190 = _1188 + 1.0;
    float _1192 = 0.0;
    float _1194 = _1066;
    if (_1082)
    {
        float _1196 = in.m_39.x;
        _1192 = _1196;
    }
    float _1198 = _1192;
    float _1200 = _1184 * _1110;
    float _1202 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1208 = _1176 * _1154;
    float _1210 = _1138 * _574;
    float _1212 = _1138 * _576;
    int _1214 = _1092 ? as_type<int>(_1190) : as_type<int>(_1066);
    float _1216 = _1156 * _1108;
    float _1218 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1202);
    bool _1220 = _1052 > 0.5;
    float _1222 = in.m_45.x;
    float _1224 = _1206 * _1182;
    float _1226 = _1086 ? as_type<float>(_1214) : _1066;
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1218);
    float _1230 = _1228;
    float _1232 = _1182;
    float _1234 = _1224;
    if (_1090)
    {
        float _1236 = _1220 ? _1190 : _1066;
        _1194 = _1236;
    }
    float _1238 = _1194;
    float _1240 = _1180 * _1210;
    float _1242 = abs(_1228);
    bool _1244 = _1242 > 0.99989998340606689453125;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    if (_1078)
    {
        bool _1248 = _1170 > 0.5;
        _1160 = _1248;
    }
    bool _1250 = _1160;
    float _1252 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1246);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1256 = _1048 + _1254;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1260 = _1258;
    if (_1082)
    {
        bool _1262 = _1198 > 0.5;
        _1162 = _1262;
    }
    bool _1264 = _1162;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1268 = fma(_1208, _1256, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1270 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1258);
    float _1272 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1266);
    float _1274 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1270);
    float _1276 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_1244)
    {
        _1260 = 0.001000000047497451305389404296875;
    }
    float _1278 = _1260;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1072)
    {
        _582 = _1052;
    }
    float _1282 = _582;
    float _1284 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1272);
    float _1286 = _1282;
    if (_1072)
    {
        _1286 = _1050;
    }
    float _1288 = _1286;
    if (!_1072)
    {
        _764 = _1054;
    }
    float _1290 = _764;
    float _1292 = _1290;
    if (!_1072)
    {
        _1230 = _1054;
    }
    float _1294 = _1230;
    float _1296 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1280);
    float _1298 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1296);
    float _1300 = _1294;
    if (!_1072)
    {
        _1164 = _1052;
    }
    float _1302 = _1164;
    float _1304 = _1302;
    if (_1072)
    {
        _1292 = _1052;
    }
    float _1306 = _1292;
    if (_1072)
    {
        _1300 = _1052;
    }
    float _1308 = _1300;
    float _1310 = 0.0;
    if (!_1244)
    {
        _1310 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1312 = _1310;
    float _1314 = _1312;
    if (_1244)
    {
        float _1316 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1314 = _1316;
    }
    float _1318 = _1314;
    if (!_1244)
    {
        _1276 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1320 = _1276;
    float _1322 = _1320;
    if (_1244)
    {
        float _1324 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1322 = _1324;
    }
    float _1326 = _1322;
    if (!_1244)
    {
        _1232 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1328 = _1232;
    float _1330 = _1328;
    if (_1244)
    {
        float _1332 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1330 = _1332;
    }
    float _1334 = _1330;
    float _1336 = 0.0;
    if (!_1072)
    {
        _1336 = _1050;
    }
    float _1338 = _1336;
    float _1340 = -_1318;
    float _1342 = _1212 * _1340;
    float _1344 = _1338;
    if (_1072)
    {
        _1344 = _1054;
    }
    float _1346 = _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1350 = _1048 + _1348;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1354 = -_1326;
    float _1356 = _1186 * _1354;
    float _1358 = -_1334;
    float _1360 = _1210 * _1358;
    float _1362 = -_1326;
    float _1364 = -_1342;
    float _1366 = fma(_1210, _1362, _1364);
    float _1368 = fma(_1224, _1350, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1370 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1352);
    if (!_1082)
    {
        _1234 = _1222;
    }
    float _1372 = _1234;
    float _1374 = -_1318;
    float _1376 = -_1360;
    float _1378 = fma(_1186, _1374, _1376);
    float _1380 = -_1334;
    float _1382 = -_1356;
    float _1384 = fma(_1212, _1380, _1382);
    float _1386 = _1366 * _1366;
    float _1388 = _1372;
    int _1390 = as_type<int>(_1386);
    if (_1072)
    {
        _1304 = _1050;
    }
    float _1392 = _1304;
    float _1394 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1370);
    if (!_1082)
    {
        _1166 = _1372;
    }
    float _1396 = _1166;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1400 = _1396;
    if (_1082)
    {
        _1388 = _1222;
    }
    float _1402 = _1388;
    float _1404 = fma(_1384, _1384, _1386);
    bool _1406 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1408 = isnan(_1048);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1398);
    bool _1420 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1422 = isnan(_1048);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1428 = _1424 || _1426;
    float _1430 = float(_1428);
    float _1432 = fma(_1378, _1378, _1404);
    bool _1434 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1436 = isnan(_1048);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    if (_1078)
    {
        float _1446 = -_1402;
        float _1448 = _1446 + 1.0;
        _1390 = as_type<int>(_1448);
    }
    int _1450 = _1390;
    float _1452 = -_1430;
    float _1454 = _1452 + 1.0;
    float _1456 = rsqrt(_1432);
    float _1458 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1460 = _1444 * _1454;
    float _1462 = -_1444;
    float _1464 = _1462 + 1.0;
    float _1466 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1470 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1472 = _1416 * _1464;
    int _1474 = as_type<int>(_1464);
    float _1476 = _1466;
    if (_1082)
    {
        float _1478 = -_1402;
        float _1480 = _1478 + 1.0;
        _1474 = as_type<int>(_1480);
    }
    int _1482 = _1474;
    float _1484 = fma(_1466, _1238, -0.5);
    if (!_1078)
    {
        _1476 = _1402;
    }
    float _1486 = _1476;
    float _1488 = fma(_1226, _1470, -0.5);
    float _1490 = _1486;
    if (_1078)
    {
        float _1492 = _1250 ? as_type<float>(_1450) : _1402;
        _1490 = _1492;
    }
    float _1494 = _1490;
    float _1496 = _1268 * _1472;
    if (_1082)
    {
        float _1498 = _1264 ? as_type<float>(_1482) : _1402;
        _1400 = _1498;
    }
    float _1500 = _1400;
    float _1502 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1252);
    float _1504 = _1366 * _1456;
    float _1506 = _1378 * _1456;
    float _1508 = -_1468;
    float _1510 = fma(_1458, 2.0, _1508);
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1514 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1516 = _1502 * (-0.15915493667125701904296875);
    float _1518 = _1384 * _1456;
    float _1520 = _1210 * _1504;
    float _1522 = _1180 * _1212;
    float _1524 = _1186 * _1506;
    float _1526 = fma(_1514, -2.0, _1512);
    float _1528 = -_1520;
    float _1530 = fma(_1186, _1518, _1528);
    float _1532 = fma(_1216, _1506, _1522);
    float _1534 = fma(_1216, _1518, _1240);
    float _1536 = -_1524;
    float _1538 = fma(_1212, _1504, _1536);
    float _1540 = _1180 * _1186;
    float _1542 = _1142 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1544 = fma(_1200, _1530, _1532);
    float _1546 = _1178 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1548 = fma(_1200, _1538, _1534);
    float _1550 = _1144 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1554 = _1546 + _1544;
    float _1556 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1558 = _1550 + _1548;
    float _1560 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1552);
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1564 = _1554 + _1562;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1568 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1556);
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1572 = _1558 + _1570;
    float _1574 = _1564 * _1564;
    float _1576 = -_106;
    float _1578 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1152);
    float _1580 = _1394 * (-0.15915493667125701904296875);
    float _1582 = -_1416;
    float _1584 = _1582 + 1.0;
    float _1586 = fma(_1572, _1572, _1574);
    float _1588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1590 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1560);
    float _1592 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1568);
    float _1594 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1496);
    float _1596 = -_106;
    float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1510);
    float _1600 = _1212 * _1518;
    float _1602 = fma(_1216, _1504, _1540);
    float _1604 = fma(_1368, _1460, _1594);
    float _1606 = _1516 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1612 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1614 = -_1600;
    float _1616 = fma(_1210, _1506, _1614);
    float _1618 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1604);
    float _1620 = fma(_1610, _1500, -0.5);
    float _1622 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1624 = fma(_1200, _1616, _1602);
    float _1626 = _1516 * 6.283185482025146484375;
    float _1628 = cos(_1626);
    float _1630 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1632 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1418);
    float _1634 = _1542 + _1624;
    float _1636 = _1622 + _1612;
    float _1638 = fma(_1630, _1494, -0.5);
    float _1640 = _1580 * 6.283185482025146484375;
    float _1642 = sin(_1640);
    float _1644 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1136);
    float _1646 = _1608 * _1484;
    float _1648 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1526);
    float _1650 = sqrt(_1586);
    float _1652 = _1628 * _1484;
    float _1654 = -_1646;
    float _1656 = fma(_1628, _1620, _1654);
    float _1658 = fma(_1608, _1620, _1652);
    float _1660 = fma(_1274, _1656, _1578);
    float _1662 = _1580 * 6.283185482025146484375;
    float _1664 = cos(_1662);
    float _1666 = _1642 * _1488;
    float _1668 = -_1644;
    float _1670 = fma(_1284, _1658, _1668);
    float _1672 = 1.0 / _1612;
    bool _1674 = _1650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1676 = _1664 * _1488;
    float _1678 = -_1666;
    float _1680 = fma(_1664, _1638, _1678);
    float _1682 = fma(_1642, _1638, _1676);
    float _1684 = fma(_1298, _1680, _1598);
    float _1686 = _1680;
    float _1688 = _1558;
    float _1690 = _1554;
    if (!_1674)
    {
        _1686 = _1634;
    }
    float _1692 = _1686;
    float _1694 = _1636 * _1672;
    float _1696 = _1694 * 0.5;
    float _1698 = -_1648;
    float _1700 = fma(_1632, _1682, _1698);
    bool _1702 = !_1674;
    float _1704 = _1692;
    if (!_1702)
    {
        float _1706 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1710 = _1650 + _1708;
        float _1712 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1714 = rsqrt(_1586);
        float _1716 = _1710 * _1706;
        float _1718 = _1716 * 0.15915493667125701904296875;
        float _1720 = _1718 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        float _1724 = _1718 * 6.283185482025146484375;
        float _1726 = sin(_1724);
        float _1728 = _1722 + (-1.0);
        float _1730 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1732 = fma(_1726, _1712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1734 = fma(_1634, _1722, _1730);
        float _1736 = _1714 * _1732;
        float _1738 = fma(_1572, _1736, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1740 = fma(_1564, _1736, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1704 = _1734;
        _1688 = _1738;
        _1690 = _1740;
    }
    float _1742 = _1704;
    float _1744 = _1688;
    float _1746 = _1690;
    float _1748 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1750 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1754 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1748);
    float _1758 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1750);
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1752);
    float _1762 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1754);
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1756);
    float _1766 = _1754;
    if (_1122)
    {
        _1766 = 1.0;
    }
    float _1768 = _1766;
    float _1770 = _1768;
    if (!_1122)
    {
        float _1772 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1776 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1774);
        float _1778 = _1772 * 0.15915493667125701904296875;
        float _1780 = _1778 * 6.283185482025146484375;
        float _1782 = cos(_1780);
        float _1784 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1786 = _1784 * 0.15915493667125701904296875;
        float _1788 = _1778 * 6.283185482025146484375;
        float _1790 = sin(_1788);
        float _1792 = 1.0 / _1782;
        float _1794 = _1786 * 6.283185482025146484375;
        float _1796 = cos(_1794);
        float _1798 = _1790 * _1792;
        float _1800 = 1.0 / _1776;
        float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1804 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1802;
        float _1806 = _1796 * _1798;
        float _1808 = _1786 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        float _1812 = 1.0 / _1806;
        float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1816 = _1800 * _1814;
        float _1818 = 1.0 / _1804;
        float _1820 = _1810 * _1812;
        float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1824 = fma(_1820, _1816, _1822);
        float _1826 = _1824 * _1818;
        float _1828 = precise::clamp(_1826, 0.0, 1.0);
        _1770 = _1828;
    }
    float _1830 = _1770;
    float _1832 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1758);
    float _1834 = _1764 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1836 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1760);
    float _1838 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1762);
    float _1840 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1842 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1846 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1848 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1852 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1842);
    float _1854 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1844);
    float _1856 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1846);
    float _1858 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1848);
    float _1860 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1852);
    float _1862 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1854);
    float _1864 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1866 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1856);
    float _1868 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1858);
    bool _1870 = _1830 > 0.0;
    bool _1872 = isnan(_1830);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan(0.0);
    bool _1878 = _1874 || _1876;
    float _1880 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1862);
    float _1882 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1884 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1860);
    float _1886 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1888 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1890 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1892 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1894 = _1660 + 0.5;
    float _1896 = _1886 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1898 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1900 = _1882 + _1888;
    float _1902 = _1884 + _1888;
    float _1904 = _1888 * 0.5;
    float _1906 = _1618 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1908 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1912 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = _1670 + 0.5;
    float _1916 = _1684 + 0.5;
    float _1918 = _1700 + 0.5;
    float _1920 = _1900 * 0.5;
    float _1922 = _1902 * 0.5;
    float _1924 = fma(_1880, -0.5, _1904);
    out.m_49.x = _1908;
    out.m_49.y = _1910;
    out.m_49.z = _1912;
    out.m_49.w = _1906;
    out.m_51.x = _1894;
    out.m_51.y = _1914;
    out.m_51.z = _1916;
    out.m_51.w = _1918;
    out.m_33.x = _1896;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1880;
    out.gl_Position.z = _1884;
    out.gl_Position.w = _1888;
    out.m_53.x = _1920;
    out.m_53.y = _1924;
    out.m_53.z = _1922;
    out.m_53.w = _1888;
    if (_1878)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1926 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1926;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

