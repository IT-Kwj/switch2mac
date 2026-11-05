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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_51 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_41 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_43 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _600 = false;
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
        float _1458 = as_type<float>(_88);
        out.gl_Position.z = _1458;
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
        float _1529 = as_type<float>(_128);
        out.gl_Position.z = _1529;
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
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _376);
    bool _384 = _380 >= 9.9999999747524270787835121154785e-07;
    bool _386 = isnan(_380);
    bool _388 = _384 || _386;
    bool _390 = isnan(9.9999999747524270787835121154785e-07);
    bool _392 = _388 || _390;
    float _394 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _396 = fma(_328, _350, _370);
    float _398 = fma(_322, _350, _372);
    float _400 = fma(_346, _350, _374);
    float _402 = _364;
    float _404 = _394;
    float _406 = _382;
    if (_392)
    {
        _402 = _378;
    }
    float _408 = _402;
    float _410 = _408;
    if (!_392)
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
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _580 = !_578;
    float _598;
    if (!_580)
    {
        float _582 = in.m_39.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_72);
        float _604 = 1.0 / _602;
        float _606 = _106 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_39.y;
    float _612 = _572 * _572;
    float _614 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = in.m_41.x;
    float _618 = in.m_41.y;
    float _620 = in.m_41.z;
    float _622 = fma(_574, _574, _612);
    float _624 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _626 = in.m_37.x;
    float _628 = in.m_37.y;
    float _630 = in.m_37.z;
    float _632 = fma(_576, _576, _622);
    float _634 = in.m_43.y;
    float _636 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _638 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _642 = _640 != 0;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _646 = _644 != 0;
    float _648 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _638);
    float _650 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _636);
    float _652 = in.m_39.x;
    bool _654 = _610 > 0.5;
    float _656 = rsqrt(_632);
    bool _658 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _660 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.5);
    bool _666 = _662 || _664;
    float _668 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _618);
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _616);
    float _674 = _630 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _620);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _682 = _626 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _684 = _628 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _686 = _656 * _572;
    float _688 = _656 * _574;
    float _690 = _656 * _576;
    float _692 = _686 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _694 = 1.0 / _680;
    float _696 = _668 * _652;
    bool _698 = _652 > 0.5;
    bool _700 = _698 && _642;
    float _702 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].y, _692);
    float _704 = -_634;
    float _706 = _704 + 1.0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _712 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[10].y, _702);
    float _714 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _650);
    float _716 = _634;
    float _718 = _648;
    float _720 = _710;
    float _722 = _688;
    if (_646)
    {
        float _724 = _654 ? _706 : _634;
        _716 = _724;
    }
    float _726 = _716;
    float _728 = 1.0 / _710;
    float _730 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _624);
    float _732 = abs(_712);
    bool _734 = _732 > 0.99989998340606689453125;
    float _736 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _746 = trunc(_696);
    int _748 = int(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _754 = _740 * _694;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _758 = _740;
    if (_734)
    {
        _718 = 0.001000000047497451305389404296875;
    }
    float _760 = _718;
    float _762 = _744 * _728;
    if (!_734)
    {
        _756 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _764 = _756;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _766;
    float _770 = _764;
    if (!_734)
    {
        _758 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _772 = _758;
    float _774 = _772;
    if (_734)
    {
        float _776 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _770 = _776;
    }
    float _778 = _770;
    if (_734)
    {
        float _780 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _774 = _780;
    }
    float _782 = _774;
    if (!_734)
    {
        _720 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _784 = _720;
    float _786 = _784;
    if (_734)
    {
        float _788 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _786 = _788;
    }
    float _790 = _786;
    float _792 = -_778;
    float _794 = _690 * _792;
    float _796 = -_782;
    float _798 = _686 * _796;
    float _800 = 1.0 / _752;
    float _802 = -_790;
    float _804 = _688 * _802;
    float _806 = -_782;
    float _808 = -_794;
    float _810 = fma(_688, _806, _808);
    float _812 = -_790;
    float _814 = -_798;
    float _816 = fma(_690, _812, _814);
    float _818 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _820 = -_778;
    float _822 = -_804;
    float _824 = fma(_686, _820, _822);
    float _826 = _810 * _810;
    float _828 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _830 = _818 * _676;
    bool _832 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _834 = isnan(_608);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = fma(_816, _816, _826);
    float _846 = _828 * _672;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _850 = _608 + _848;
    int _852 = _748 << 4;
    int _854 = _852 + 1968;
    float _856 = fma(_824, _824, _844);
    bool _858 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = isnan(_608);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = _768 * _800;
    float _872 = fma(_754, _850, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = rsqrt(_856);
    float _876 = -_842;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _608 + _880;
    float _884 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _886 = _854 + 8;
    uint _889 = uint(int(uint(_886) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[int(_891)][_893];
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _899 = _608 + _897;
    bool _901 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _903 = isnan(_608);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _868 * _878;
    float _915 = fma(_762, _882, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _917 = -_868;
    float _919 = _917 + 1.0;
    float _921 = fma(_870, _899, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _923 = _884 * _670;
    bool _925 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _927 = isnan(_608);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    uint _937 = uint(int(uint(_854) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[int(_947)][_949];
    float _953 = _911 * _919;
    float _955 = -_911;
    float _957 = _955 + 1.0;
    float _959 = _810 * _874;
    float _961 = _816 * _874;
    float _963 = _824 * _874;
    float _965 = _923 * _690;
    float _967 = _688 * _959;
    float _969 = _935 * _957;
    float _971 = _923 * _688;
    float _973 = _686 * _963;
    float _975 = fma(_846, _963, _965);
    float _977 = -_967;
    float _979 = fma(_686, _961, _977);
    float _981 = fma(_846, _961, _971);
    float _983 = _872 * _969;
    float _985 = -_973;
    float _987 = fma(_690, _959, _985);
    float _989 = fma(_830, _979, _975);
    float _991 = _736 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _993 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = fma(_830, _987, _981);
    float _997 = _714 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _999 = _991 + _989;
    float _1001 = in.m_43.x;
    float _1003 = _993 + _995;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1009 = _999 + _1007;
    float _1011 = -_935;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _1003 + _1015;
    float _1019 = _997 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1021 = _1009 * _1009;
    float _1023 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1005);
    float _1025 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[115].x, _983);
    float _1027 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1019);
    float _1029 = fma(_1017, _1017, _1021);
    float _1031 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1023);
    float _1033 = fma(_915, _953, _1025);
    float _1035 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1027);
    float _1037 = sqrt(_1029);
    float _1039 = _923 * _686;
    float _1041 = _895 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1043 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1045 = fma(_921, _913, _1033);
    float _1047 = _690 * _961;
    float _1049 = fma(_846, _959, _1039);
    float _1051 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1053 = 1.0 / _1043;
    float _1055 = _913;
    float _1057 = _1003;
    float _1059 = _999;
    if (_642)
    {
        _1055 = _1001;
    }
    float _1061 = _1055;
    float _1063 = -_1047;
    float _1065 = fma(_688, _963, _1063);
    float _1067 = _943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1069 = _951 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1071 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1073 = _1061;
    float _1075 = _1071;
    if (_700)
    {
        float _1077 = -_1061;
        float _1079 = _1077 + 1.0;
        _1073 = _1079;
    }
    float _1081 = _1073;
    float _1083 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1085 = _1037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1089 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = fma(_830, _1065, _1049);
    float _1093 = _1051 + _1043;
    float _1095 = _1083;
    if (!_642)
    {
        _722 = _1001;
    }
    float _1097 = _722;
    float _1099 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1045);
    out.m_47.x = _1083;
    out.m_47.y = _1089;
    out.m_47.z = _1071;
    float _1101 = _1097;
    if (_642)
    {
        _1101 = _1081;
    }
    float _1103 = _1101;
    float _1105 = _997 + _1091;
    float _1107 = _1093 * _1053;
    float _1109 = _1107 * 0.5;
    if (!_1085)
    {
        _1095 = _1105;
    }
    float _1111 = _1095;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1115 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1113);
    bool _1117 = !_1085;
    float _1119 = _1111;
    if (!_1117)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1125 = _1037 + _1123;
        float _1127 = _1105 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = rsqrt(_1029);
        float _1131 = _1125 * _1121;
        float _1133 = _1131 * 0.15915493667125701904296875;
        float _1135 = _1133 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1133 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1137 + (-1.0);
        float _1145 = fma(_1141, _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1147 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1129 * _1145;
        float _1151 = fma(_1105, _1137, _1147);
        float _1153 = fma(_1017, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1155 = fma(_1009, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1119 = _1151;
        _1057 = _1153;
        _1059 = _1155;
        _1075 = _1127;
    }
    float _1157 = _1119;
    float _1159 = _1057;
    float _1161 = _1059;
    float _1163 = _1075;
    float _1165 = 1.0 / _1115;
    float _1167 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1171 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1173 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1175 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1167);
    float _1177 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1169);
    float _1179 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1171);
    float _1181 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1173);
    float _1183 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1175);
    float _1185 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1177);
    float _1187 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1179);
    float _1189 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1181);
    float _1191 = _1175;
    float _1193 = _1163;
    if (_666)
    {
        _1191 = 1.0;
    }
    float _1195 = _1191;
    float _1197 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1199 = _1195;
    if (_666)
    {
        _1193 = 1.0;
    }
    float _1201 = _1193;
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1205 = _1165 * _1203;
    float _1207 = _1201;
    if (!_666)
    {
        float _1209 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = _1211 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1219 = _1217 * 0.15915493667125701904296875;
        float _1221 = _1211 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = 1.0 / _1215;
        float _1227 = _1219 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = _1223 * _1225;
        float _1233 = _1219 * 6.283185482025146484375;
        float _1235 = sin(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = 1.0 / _1237;
        float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1243 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1241;
        float _1245 = 1.0 / _1243;
        float _1247 = _1235 * _1239;
        float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1251 = fma(_1205, _1247, _1249);
        float _1253 = _1251 * _1245;
        float _1255 = precise::clamp(_1253, 0.0, 1.0);
        _1199 = _1255;
    }
    float _1257 = _1199;
    if (!_666)
    {
        float _1259 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1261 = _1259 * 0.15915493667125701904296875;
        float _1263 = _1261 * 6.283185482025146484375;
        float _1265 = cos(_1263);
        float _1267 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1269 = _1267 * 0.15915493667125701904296875;
        float _1271 = _1261 * 6.283185482025146484375;
        float _1273 = sin(_1271);
        float _1275 = 1.0 / _1265;
        float _1277 = _1269 * 6.283185482025146484375;
        float _1279 = cos(_1277);
        float _1281 = _1273 * _1275;
        float _1283 = _1269 * 6.283185482025146484375;
        float _1285 = sin(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = 1.0 / _1287;
        float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1293 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1291;
        float _1295 = 1.0 / _1293;
        float _1297 = _1285 * _1289;
        float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1301 = fma(_1205, _1297, _1299);
        float _1303 = _1301 * _1295;
        float _1305 = precise::clamp(_1303, 0.0, 1.0);
        float _1307 = -_1305;
        float _1309 = _1307 + 1.0;
        _1207 = _1309;
    }
    float _1311 = _1207;
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1315 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1317 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1319 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1321 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1323 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1325 = _1257 > 0.0;
    bool _1327 = isnan(_1257);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan(0.0);
    bool _1333 = _1329 || _1331;
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1317);
    float _1337 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1319);
    float _1339 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1321);
    float _1341 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1343 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1323);
    float _1345 = _1257 * _1311;
    bool _1347 = _1311 <= 0.0;
    bool _1349 = !_1333;
    bool _1351 = _1347 || _1349;
    float _1353 = _726 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1355 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1339);
    float _1357 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1335);
    float _1359 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1337);
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1343);
    float _1363 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1365 = _1353 * _1313;
    float _1367 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1369 = _1363 * _1087;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1375 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1357);
    float _1377 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1359);
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1355);
    float _1381 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1361);
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1387 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1391 = _1379 + _1381;
    float _1393 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1395 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1397 = _1389 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1399 = _1391 * 0.5;
    out.m_49.x = _1369;
    out.m_49.y = _1365;
    out.m_51.x = _1383;
    out.m_51.y = _1387;
    out.m_51.z = _1395;
    out.m_51.w = _1393;
    out.m_33.x = _1397;
    out.gl_Position.x = _1375;
    out.gl_Position.y = _1377;
    out.gl_Position.z = _1379;
    out.gl_Position.w = _1381;
    out.m_53.z = _1399;
    out.m_53.w = _1381;
    if (!_1351)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1401 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1401;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _600 = false;
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
        float _1458 = as_type<float>(_88);
        out.gl_Position.z = _1458;
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
        float _1529 = as_type<float>(_128);
        out.gl_Position.z = _1529;
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
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _376);
    bool _384 = _380 >= 9.9999999747524270787835121154785e-07;
    bool _386 = isnan(_380);
    bool _388 = _384 || _386;
    bool _390 = isnan(9.9999999747524270787835121154785e-07);
    bool _392 = _388 || _390;
    float _394 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _396 = fma(_328, _350, _370);
    float _398 = fma(_322, _350, _372);
    float _400 = fma(_346, _350, _374);
    float _402 = _364;
    float _404 = _394;
    float _406 = _382;
    if (_392)
    {
        _402 = _378;
    }
    float _408 = _402;
    float _410 = _408;
    if (!_392)
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
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _580 = !_578;
    float _598;
    if (!_580)
    {
        float _582 = in.m_39.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_72);
        float _604 = 1.0 / _602;
        float _606 = _106 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_39.y;
    float _612 = _572 * _572;
    float _614 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = in.m_41.x;
    float _618 = in.m_41.y;
    float _620 = in.m_41.z;
    float _622 = fma(_574, _574, _612);
    float _624 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _626 = in.m_37.x;
    float _628 = in.m_37.y;
    float _630 = in.m_37.z;
    float _632 = fma(_576, _576, _622);
    float _634 = in.m_43.y;
    float _636 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _638 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _642 = _640 != 0;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _646 = _644 != 0;
    float _648 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _638);
    float _650 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _636);
    float _652 = in.m_39.x;
    bool _654 = _610 > 0.5;
    float _656 = rsqrt(_632);
    bool _658 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _660 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.5);
    bool _666 = _662 || _664;
    float _668 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _618);
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _616);
    float _674 = _630 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _620);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _682 = _626 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _684 = _628 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _686 = _656 * _572;
    float _688 = _656 * _574;
    float _690 = _656 * _576;
    float _692 = _686 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _694 = 1.0 / _680;
    float _696 = _668 * _652;
    bool _698 = _652 > 0.5;
    bool _700 = _698 && _642;
    float _702 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].y, _692);
    float _704 = -_634;
    float _706 = _704 + 1.0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _712 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[10].y, _702);
    float _714 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _650);
    float _716 = _634;
    float _718 = _648;
    float _720 = _710;
    float _722 = _688;
    if (_646)
    {
        float _724 = _654 ? _706 : _634;
        _716 = _724;
    }
    float _726 = _716;
    float _728 = 1.0 / _710;
    float _730 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _624);
    float _732 = abs(_712);
    bool _734 = _732 > 0.99989998340606689453125;
    float _736 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _746 = trunc(_696);
    int _748 = int(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _754 = _740 * _694;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _758 = _740;
    if (_734)
    {
        _718 = 0.001000000047497451305389404296875;
    }
    float _760 = _718;
    float _762 = _744 * _728;
    if (!_734)
    {
        _756 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _764 = _756;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _766;
    float _770 = _764;
    if (!_734)
    {
        _758 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _772 = _758;
    float _774 = _772;
    if (_734)
    {
        float _776 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _770 = _776;
    }
    float _778 = _770;
    if (_734)
    {
        float _780 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _774 = _780;
    }
    float _782 = _774;
    if (!_734)
    {
        _720 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _784 = _720;
    float _786 = _784;
    if (_734)
    {
        float _788 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _786 = _788;
    }
    float _790 = _786;
    float _792 = -_778;
    float _794 = _690 * _792;
    float _796 = -_782;
    float _798 = _686 * _796;
    float _800 = 1.0 / _752;
    float _802 = -_790;
    float _804 = _688 * _802;
    float _806 = -_782;
    float _808 = -_794;
    float _810 = fma(_688, _806, _808);
    float _812 = -_790;
    float _814 = -_798;
    float _816 = fma(_690, _812, _814);
    float _818 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _820 = -_778;
    float _822 = -_804;
    float _824 = fma(_686, _820, _822);
    float _826 = _810 * _810;
    float _828 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _830 = _818 * _676;
    bool _832 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _834 = isnan(_608);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = fma(_816, _816, _826);
    float _846 = _828 * _672;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _850 = _608 + _848;
    int _852 = _748 << 4;
    int _854 = _852 + 1968;
    float _856 = fma(_824, _824, _844);
    bool _858 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = isnan(_608);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = _768 * _800;
    float _872 = fma(_754, _850, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = rsqrt(_856);
    float _876 = -_842;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _608 + _880;
    float _884 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _886 = _854 + 8;
    uint _889 = uint(int(uint(_886) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[int(_891)][_893];
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _899 = _608 + _897;
    bool _901 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _903 = isnan(_608);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _868 * _878;
    float _915 = fma(_762, _882, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _917 = -_868;
    float _919 = _917 + 1.0;
    float _921 = fma(_870, _899, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _923 = _884 * _670;
    bool _925 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _927 = isnan(_608);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    uint _937 = uint(int(uint(_854) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[int(_947)][_949];
    float _953 = _911 * _919;
    float _955 = -_911;
    float _957 = _955 + 1.0;
    float _959 = _810 * _874;
    float _961 = _816 * _874;
    float _963 = _824 * _874;
    float _965 = _923 * _690;
    float _967 = _688 * _959;
    float _969 = _935 * _957;
    float _971 = _923 * _688;
    float _973 = _686 * _963;
    float _975 = fma(_846, _963, _965);
    float _977 = -_967;
    float _979 = fma(_686, _961, _977);
    float _981 = fma(_846, _961, _971);
    float _983 = _872 * _969;
    float _985 = -_973;
    float _987 = fma(_690, _959, _985);
    float _989 = fma(_830, _979, _975);
    float _991 = _736 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _993 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = fma(_830, _987, _981);
    float _997 = _714 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _999 = _991 + _989;
    float _1001 = in.m_43.x;
    float _1003 = _993 + _995;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1009 = _999 + _1007;
    float _1011 = -_935;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _1003 + _1015;
    float _1019 = _997 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1021 = _1009 * _1009;
    float _1023 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1005);
    float _1025 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[115].x, _983);
    float _1027 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1019);
    float _1029 = fma(_1017, _1017, _1021);
    float _1031 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1023);
    float _1033 = fma(_915, _953, _1025);
    float _1035 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1027);
    float _1037 = sqrt(_1029);
    float _1039 = _923 * _686;
    float _1041 = _895 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1043 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1045 = fma(_921, _913, _1033);
    float _1047 = _690 * _961;
    float _1049 = fma(_846, _959, _1039);
    float _1051 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1053 = 1.0 / _1043;
    float _1055 = _913;
    float _1057 = _1003;
    float _1059 = _999;
    if (_642)
    {
        _1055 = _1001;
    }
    float _1061 = _1055;
    float _1063 = -_1047;
    float _1065 = fma(_688, _963, _1063);
    float _1067 = _943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1069 = _951 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1071 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1073 = _1061;
    float _1075 = _1071;
    if (_700)
    {
        float _1077 = -_1061;
        float _1079 = _1077 + 1.0;
        _1073 = _1079;
    }
    float _1081 = _1073;
    float _1083 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1085 = _1037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1089 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = fma(_830, _1065, _1049);
    float _1093 = _1051 + _1043;
    float _1095 = _1083;
    if (!_642)
    {
        _722 = _1001;
    }
    float _1097 = _722;
    float _1099 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1045);
    out.m_47.x = _1083;
    out.m_47.y = _1089;
    out.m_47.z = _1071;
    float _1101 = _1097;
    if (_642)
    {
        _1101 = _1081;
    }
    float _1103 = _1101;
    float _1105 = _997 + _1091;
    float _1107 = _1093 * _1053;
    float _1109 = _1107 * 0.5;
    if (!_1085)
    {
        _1095 = _1105;
    }
    float _1111 = _1095;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1115 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1113);
    bool _1117 = !_1085;
    float _1119 = _1111;
    if (!_1117)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1125 = _1037 + _1123;
        float _1127 = _1105 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = rsqrt(_1029);
        float _1131 = _1125 * _1121;
        float _1133 = _1131 * 0.15915493667125701904296875;
        float _1135 = _1133 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1133 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1137 + (-1.0);
        float _1145 = fma(_1141, _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1147 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1129 * _1145;
        float _1151 = fma(_1105, _1137, _1147);
        float _1153 = fma(_1017, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1155 = fma(_1009, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1119 = _1151;
        _1057 = _1153;
        _1059 = _1155;
        _1075 = _1127;
    }
    float _1157 = _1119;
    float _1159 = _1057;
    float _1161 = _1059;
    float _1163 = _1075;
    float _1165 = 1.0 / _1115;
    float _1167 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1171 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1173 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1175 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1167);
    float _1177 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1169);
    float _1179 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1171);
    float _1181 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1173);
    float _1183 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1175);
    float _1185 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1177);
    float _1187 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1179);
    float _1189 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1181);
    float _1191 = _1175;
    float _1193 = _1163;
    if (_666)
    {
        _1191 = 1.0;
    }
    float _1195 = _1191;
    float _1197 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1199 = _1195;
    if (_666)
    {
        _1193 = 1.0;
    }
    float _1201 = _1193;
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1205 = _1165 * _1203;
    float _1207 = _1201;
    if (!_666)
    {
        float _1209 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = _1211 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1219 = _1217 * 0.15915493667125701904296875;
        float _1221 = _1211 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = 1.0 / _1215;
        float _1227 = _1219 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = _1223 * _1225;
        float _1233 = _1219 * 6.283185482025146484375;
        float _1235 = sin(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = 1.0 / _1237;
        float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1243 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1241;
        float _1245 = 1.0 / _1243;
        float _1247 = _1235 * _1239;
        float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1251 = fma(_1205, _1247, _1249);
        float _1253 = _1251 * _1245;
        float _1255 = precise::clamp(_1253, 0.0, 1.0);
        _1199 = _1255;
    }
    float _1257 = _1199;
    if (!_666)
    {
        float _1259 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1261 = _1259 * 0.15915493667125701904296875;
        float _1263 = _1261 * 6.283185482025146484375;
        float _1265 = cos(_1263);
        float _1267 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1269 = _1267 * 0.15915493667125701904296875;
        float _1271 = _1261 * 6.283185482025146484375;
        float _1273 = sin(_1271);
        float _1275 = 1.0 / _1265;
        float _1277 = _1269 * 6.283185482025146484375;
        float _1279 = cos(_1277);
        float _1281 = _1273 * _1275;
        float _1283 = _1269 * 6.283185482025146484375;
        float _1285 = sin(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = 1.0 / _1287;
        float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1293 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1291;
        float _1295 = 1.0 / _1293;
        float _1297 = _1285 * _1289;
        float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1301 = fma(_1205, _1297, _1299);
        float _1303 = _1301 * _1295;
        float _1305 = precise::clamp(_1303, 0.0, 1.0);
        float _1307 = -_1305;
        float _1309 = _1307 + 1.0;
        _1207 = _1309;
    }
    float _1311 = _1207;
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1315 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1317 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1319 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1321 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1323 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1325 = _1257 > 0.0;
    bool _1327 = isnan(_1257);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan(0.0);
    bool _1333 = _1329 || _1331;
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1317);
    float _1337 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1319);
    float _1339 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1321);
    float _1341 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1343 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1323);
    float _1345 = _1257 * _1311;
    bool _1347 = _1311 <= 0.0;
    bool _1349 = !_1333;
    bool _1351 = _1347 || _1349;
    float _1353 = _726 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1355 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1339);
    float _1357 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1335);
    float _1359 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1337);
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1343);
    float _1363 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1365 = _1353 * _1313;
    float _1367 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1369 = _1363 * _1087;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1375 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1357);
    float _1377 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1359);
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1355);
    float _1381 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1361);
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1387 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1391 = _1379 + _1381;
    float _1393 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1395 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1397 = _1389 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1399 = _1391 * 0.5;
    out.m_49.x = _1369;
    out.m_49.y = _1365;
    out.m_51.x = _1383;
    out.m_51.y = _1387;
    out.m_51.z = _1395;
    out.m_51.w = _1393;
    out.m_33.x = _1397;
    out.gl_Position.x = _1375;
    out.gl_Position.y = _1377;
    out.gl_Position.z = _1379;
    out.gl_Position.w = _1381;
    out.m_53.z = _1399;
    out.m_53.w = _1381;
    if (!_1351)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1401 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1401;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _600 = false;
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
        float _1458 = as_type<float>(_88);
        out.gl_Position.z = _1458;
    }
    if (!_76)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1529 = as_type<float>(_128);
        out.gl_Position.z = _1529;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _376);
    bool _384 = _380 >= 9.9999999747524270787835121154785e-07;
    bool _386 = isnan(_380);
    bool _388 = _384 || _386;
    bool _390 = isnan(9.9999999747524270787835121154785e-07);
    bool _392 = _388 || _390;
    float _394 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _396 = fma(_328, _350, _370);
    float _398 = fma(_322, _350, _372);
    float _400 = fma(_346, _350, _374);
    float _402 = _364;
    float _404 = _394;
    float _406 = _382;
    if (_392)
    {
        _402 = _378;
    }
    float _408 = _402;
    float _410 = _408;
    if (!_392)
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
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _580 = !_578;
    float _598;
    if (!_580)
    {
        float _582 = in.m_39.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_72);
        float _604 = 1.0 / _602;
        float _606 = _106 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_39.y;
    float _612 = _572 * _572;
    float _614 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _616 = in.m_41.x;
    float _618 = in.m_41.y;
    float _620 = in.m_41.z;
    float _622 = fma(_574, _574, _612);
    float _624 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _614);
    float _626 = in.m_37.x;
    float _628 = in.m_37.y;
    float _630 = in.m_37.z;
    float _632 = fma(_576, _576, _622);
    float _634 = in.m_43.y;
    float _636 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _638 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _642 = _640 != 0;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _646 = _644 != 0;
    float _648 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _638);
    float _650 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _636);
    float _652 = in.m_39.x;
    bool _654 = _610 > 0.5;
    float _656 = rsqrt(_632);
    bool _658 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _660 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.5);
    bool _666 = _662 || _664;
    float _668 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _618);
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _616);
    float _674 = _630 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _620);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _682 = _626 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _684 = _628 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _686 = _656 * _572;
    float _688 = _656 * _574;
    float _690 = _656 * _576;
    float _692 = _686 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _694 = 1.0 / _680;
    float _696 = _668 * _652;
    bool _698 = _652 > 0.5;
    bool _700 = _698 && _642;
    float _702 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].y, _692);
    float _704 = -_634;
    float _706 = _704 + 1.0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _712 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[10].y, _702);
    float _714 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _650);
    float _716 = _634;
    float _718 = _648;
    float _720 = _710;
    float _722 = _688;
    if (_646)
    {
        float _724 = _654 ? _706 : _634;
        _716 = _724;
    }
    float _726 = _716;
    float _728 = 1.0 / _710;
    float _730 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _624);
    float _732 = abs(_712);
    bool _734 = _732 > 0.99989998340606689453125;
    float _736 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _746 = trunc(_696);
    int _748 = int(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _754 = _740 * _694;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _758 = _740;
    if (_734)
    {
        _718 = 0.001000000047497451305389404296875;
    }
    float _760 = _718;
    float _762 = _744 * _728;
    if (!_734)
    {
        _756 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _764 = _756;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _766;
    float _770 = _764;
    if (!_734)
    {
        _758 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _772 = _758;
    float _774 = _772;
    if (_734)
    {
        float _776 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _770 = _776;
    }
    float _778 = _770;
    if (_734)
    {
        float _780 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _774 = _780;
    }
    float _782 = _774;
    if (!_734)
    {
        _720 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _784 = _720;
    float _786 = _784;
    if (_734)
    {
        float _788 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _786 = _788;
    }
    float _790 = _786;
    float _792 = -_778;
    float _794 = _690 * _792;
    float _796 = -_782;
    float _798 = _686 * _796;
    float _800 = 1.0 / _752;
    float _802 = -_790;
    float _804 = _688 * _802;
    float _806 = -_782;
    float _808 = -_794;
    float _810 = fma(_688, _806, _808);
    float _812 = -_790;
    float _814 = -_798;
    float _816 = fma(_690, _812, _814);
    float _818 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _820 = -_778;
    float _822 = -_804;
    float _824 = fma(_686, _820, _822);
    float _826 = _810 * _810;
    float _828 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _830 = _818 * _676;
    bool _832 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _834 = isnan(_608);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = fma(_816, _816, _826);
    float _846 = _828 * _672;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _850 = _608 + _848;
    int _852 = _748 << 4;
    int _854 = _852 + 1968;
    float _856 = fma(_824, _824, _844);
    bool _858 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = isnan(_608);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = _768 * _800;
    float _872 = fma(_754, _850, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = rsqrt(_856);
    float _876 = -_842;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _608 + _880;
    float _884 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _886 = _854 + 8;
    uint _889 = uint(int(uint(_886) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[int(_891)][_893];
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _899 = _608 + _897;
    bool _901 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _903 = isnan(_608);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = _868 * _878;
    float _915 = fma(_762, _882, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _917 = -_868;
    float _919 = _917 + 1.0;
    float _921 = fma(_870, _899, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _923 = _884 * _670;
    bool _925 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _927 = isnan(_608);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    uint _937 = uint(int(uint(_854) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[int(_947)][_949];
    float _953 = _911 * _919;
    float _955 = -_911;
    float _957 = _955 + 1.0;
    float _959 = _810 * _874;
    float _961 = _816 * _874;
    float _963 = _824 * _874;
    float _965 = _923 * _690;
    float _967 = _688 * _959;
    float _969 = _935 * _957;
    float _971 = _923 * _688;
    float _973 = _686 * _963;
    float _975 = fma(_846, _963, _965);
    float _977 = -_967;
    float _979 = fma(_686, _961, _977);
    float _981 = fma(_846, _961, _971);
    float _983 = _872 * _969;
    float _985 = -_973;
    float _987 = fma(_690, _959, _985);
    float _989 = fma(_830, _979, _975);
    float _991 = _736 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _993 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = fma(_830, _987, _981);
    float _997 = _714 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _999 = _991 + _989;
    float _1001 = in.m_43.x;
    float _1003 = _993 + _995;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1009 = _999 + _1007;
    float _1011 = -_935;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1017 = _1003 + _1015;
    float _1019 = _997 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1021 = _1009 * _1009;
    float _1023 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1005);
    float _1025 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[115].x, _983);
    float _1027 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1019);
    float _1029 = fma(_1017, _1017, _1021);
    float _1031 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1023);
    float _1033 = fma(_915, _953, _1025);
    float _1035 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1027);
    float _1037 = sqrt(_1029);
    float _1039 = _923 * _686;
    float _1041 = _895 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1043 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1045 = fma(_921, _913, _1033);
    float _1047 = _690 * _961;
    float _1049 = fma(_846, _959, _1039);
    float _1051 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1053 = 1.0 / _1043;
    float _1055 = _913;
    float _1057 = _1003;
    float _1059 = _999;
    if (_642)
    {
        _1055 = _1001;
    }
    float _1061 = _1055;
    float _1063 = -_1047;
    float _1065 = fma(_688, _963, _1063);
    float _1067 = _943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1069 = _951 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1071 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1073 = _1061;
    float _1075 = _1071;
    if (_700)
    {
        float _1077 = -_1061;
        float _1079 = _1077 + 1.0;
        _1073 = _1079;
    }
    float _1081 = _1073;
    float _1083 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1085 = _1037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1089 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = fma(_830, _1065, _1049);
    float _1093 = _1051 + _1043;
    float _1095 = _1083;
    if (!_642)
    {
        _722 = _1001;
    }
    float _1097 = _722;
    float _1099 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1045);
    out.m_47.x = _1083;
    out.m_47.y = _1089;
    out.m_47.z = _1071;
    float _1101 = _1097;
    if (_642)
    {
        _1101 = _1081;
    }
    float _1103 = _1101;
    float _1105 = _997 + _1091;
    float _1107 = _1093 * _1053;
    float _1109 = _1107 * 0.5;
    if (!_1085)
    {
        _1095 = _1105;
    }
    float _1111 = _1095;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1115 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1113);
    bool _1117 = !_1085;
    float _1119 = _1111;
    if (!_1117)
    {
        float _1121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1125 = _1037 + _1123;
        float _1127 = _1105 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = rsqrt(_1029);
        float _1131 = _1125 * _1121;
        float _1133 = _1131 * 0.15915493667125701904296875;
        float _1135 = _1133 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1133 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1137 + (-1.0);
        float _1145 = fma(_1141, _1127, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1147 = _1143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1129 * _1145;
        float _1151 = fma(_1105, _1137, _1147);
        float _1153 = fma(_1017, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1155 = fma(_1009, _1149, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1119 = _1151;
        _1057 = _1153;
        _1059 = _1155;
        _1075 = _1127;
    }
    float _1157 = _1119;
    float _1159 = _1057;
    float _1161 = _1059;
    float _1163 = _1075;
    float _1165 = 1.0 / _1115;
    float _1167 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1171 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1173 = _1157 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1175 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1167);
    float _1177 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1169);
    float _1179 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1171);
    float _1181 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1173);
    float _1183 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1175);
    float _1185 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1177);
    float _1187 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1179);
    float _1189 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1181);
    float _1191 = _1175;
    float _1193 = _1163;
    if (_666)
    {
        _1191 = 1.0;
    }
    float _1195 = _1191;
    float _1197 = _1183 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1199 = _1195;
    if (_666)
    {
        _1193 = 1.0;
    }
    float _1201 = _1193;
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1205 = _1165 * _1203;
    float _1207 = _1201;
    if (!_666)
    {
        float _1209 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1211 = _1209 * 0.15915493667125701904296875;
        float _1213 = _1211 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1219 = _1217 * 0.15915493667125701904296875;
        float _1221 = _1211 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        float _1225 = 1.0 / _1215;
        float _1227 = _1219 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = _1223 * _1225;
        float _1233 = _1219 * 6.283185482025146484375;
        float _1235 = sin(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = 1.0 / _1237;
        float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1243 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1241;
        float _1245 = 1.0 / _1243;
        float _1247 = _1235 * _1239;
        float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1251 = fma(_1205, _1247, _1249);
        float _1253 = _1251 * _1245;
        float _1255 = precise::clamp(_1253, 0.0, 1.0);
        _1199 = _1255;
    }
    float _1257 = _1199;
    if (!_666)
    {
        float _1259 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1261 = _1259 * 0.15915493667125701904296875;
        float _1263 = _1261 * 6.283185482025146484375;
        float _1265 = cos(_1263);
        float _1267 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1269 = _1267 * 0.15915493667125701904296875;
        float _1271 = _1261 * 6.283185482025146484375;
        float _1273 = sin(_1271);
        float _1275 = 1.0 / _1265;
        float _1277 = _1269 * 6.283185482025146484375;
        float _1279 = cos(_1277);
        float _1281 = _1273 * _1275;
        float _1283 = _1269 * 6.283185482025146484375;
        float _1285 = sin(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = 1.0 / _1287;
        float _1291 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1293 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1291;
        float _1295 = 1.0 / _1293;
        float _1297 = _1285 * _1289;
        float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1301 = fma(_1205, _1297, _1299);
        float _1303 = _1301 * _1295;
        float _1305 = precise::clamp(_1303, 0.0, 1.0);
        float _1307 = -_1305;
        float _1309 = _1307 + 1.0;
        _1207 = _1309;
    }
    float _1311 = _1207;
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1315 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1317 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1319 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1321 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1323 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1325 = _1257 > 0.0;
    bool _1327 = isnan(_1257);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan(0.0);
    bool _1333 = _1329 || _1331;
    float _1335 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1317);
    float _1337 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1319);
    float _1339 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1321);
    float _1341 = _1187 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1343 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1323);
    float _1345 = _1257 * _1311;
    bool _1347 = _1311 <= 0.0;
    bool _1349 = !_1333;
    bool _1351 = _1347 || _1349;
    float _1353 = _726 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1355 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1339);
    float _1357 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1335);
    float _1359 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1337);
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1343);
    float _1363 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1365 = _1353 * _1313;
    float _1367 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1369 = _1363 * _1087;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1375 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1357);
    float _1377 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1359);
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1355);
    float _1381 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1361);
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1387 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1391 = _1379 + _1381;
    float _1393 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1395 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1397 = _1389 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1399 = _1391 * 0.5;
    out.m_49.x = _1369;
    out.m_49.y = _1365;
    out.m_51.x = _1383;
    out.m_51.y = _1387;
    out.m_51.z = _1395;
    out.m_51.w = _1393;
    out.m_33.x = _1397;
    out.gl_Position.x = _1375;
    out.gl_Position.y = _1377;
    out.gl_Position.z = _1379;
    out.gl_Position.w = _1381;
    out.m_53.z = _1399;
    out.m_53.w = _1381;
    if (!_1351)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1401 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1401;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

