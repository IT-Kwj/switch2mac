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
    float4 m_51 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1457 = as_type<float>(_88);
        out.gl_Position.z = _1457;
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
        float _1528 = as_type<float>(_128);
        out.gl_Position.z = _1528;
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
    bool _384 = _380 >= 9.9999999747524270787835121154785e-07;
    bool _386 = isnan(_380);
    bool _388 = _384 || _386;
    bool _390 = isnan(9.9999999747524270787835121154785e-07);
    bool _392 = _388 || _390;
    float _394 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _376);
    float _396 = fma(_328, _350, _370);
    float _398 = fma(_322, _350, _372);
    float _400 = fma(_346, _350, _374);
    float _402 = _364;
    float _404 = _382;
    float _406 = _394;
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
    float _610 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _612 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _614 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _616 = in.m_37.x;
    float _618 = in.m_37.y;
    float _620 = in.m_37.z;
    float _622 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _610);
    float _624 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _612);
    float _626 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _614);
    float _628 = _572 * _572;
    float _630 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _622);
    float _632 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _624);
    float _634 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _626);
    float _636 = fma(_574, _574, _628);
    float _638 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _640 = _632 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _642 = _634 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _644 = fma(_576, _576, _636);
    float _646 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _648 = _638 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _652 = _640 + _650;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _656 = _642 + _654;
    float _658 = _648 * _648;
    float _660 = rsqrt(_644);
    float _662 = fma(_652, _652, _658);
    float _664 = in.m_39.y;
    float _666 = _616 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _668 = fma(_656, _656, _662);
    out.m_41.x = 1.0;
    out.m_41.y = 1.0;
    out.m_41.z = 1.0;
    float _670 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _672 = in.m_43.x;
    float _674 = in.m_43.y;
    float _676 = in.m_43.z;
    float _678 = rsqrt(_668);
    float _680 = _670 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _684 = _682 != 0;
    float _686 = _660 * _576;
    float _688 = _660 * _574;
    float _690 = _660 * _572;
    float _692 = _620 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _694 = _618 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _698 = _686 * _696;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _702 = _700 != 0;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _706 = _690 * _704;
    float _708 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _710 = -_698;
    float _712 = fma(_688, _708, _710);
    float _714 = _680 * _678;
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _718 = -_706;
    float _720 = fma(_686, _716, _718);
    bool _722 = _664 > 0.5;
    float _724 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _726 = _648 * _714;
    float _728 = _652 * _714;
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _672);
    float _732 = -_726;
    float _734 = _648 + _732;
    float _736 = -_728;
    float _738 = _652 + _736;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _676);
    float _742 = _734 * _734;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _674);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _750 = fma(_738, _738, _742);
    float _752 = _656 * _714;
    float _754 = _712 * _712;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _760 = 1.0 / _748;
    float _762 = -_752;
    float _764 = _656 + _762;
    float _766 = in.m_45.y;
    float _768 = fma(_720, _720, _754);
    float _770 = fma(_764, _764, _750);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _778 = _688 * _776;
    float _780 = 1.0 / _758;
    float _782 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _786 = -_778;
    float _788 = fma(_690, _784, _786);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _792 = 0.0;
    float _794 = _690;
    if (_684)
    {
        float _796 = in.m_39.x;
        _792 = _796;
    }
    float _798 = _792;
    float _800 = 1.0 / _774;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _804 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = sqrt(_770);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _812 = fma(_788, _788, _768);
    float _814 = -_766;
    float _816 = _814 + 1.0;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _822 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = rsqrt(_812);
    float _826 = _766;
    if (_702)
    {
        float _828 = _722 ? _816 : _766;
        _826 = _828;
    }
    float _830 = _826;
    out.m_47.x = _806;
    out.m_47.y = _822;
    out.m_47.z = _804;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _836;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _608 + _840;
    bool _844 = _798 > 0.5;
    bool _846 = _844 && _684;
    float _848 = _834 * _760;
    float _850 = _678 * _808;
    float _852 = _838 * _800;
    float _854 = _820 * _780;
    float _856 = fma(_848, _842, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _858 = _724 * _850;
    float _860 = _670 * _850;
    float _862 = _782 * _850;
    float _864 = -_726;
    float _866 = _638 + _864;
    float _868 = _788 * _824;
    float _870 = _858 * _744;
    float _872 = _860 * _730;
    float _874 = _712 * _824;
    float _876 = _690 * _868;
    float _878 = _720 * _824;
    float _880 = _870 * _688;
    float _882 = _862 * _740;
    float _884 = _688 * _874;
    float _886 = -_876;
    float _888 = fma(_686, _874, _886);
    float _890 = _870 * _686;
    float _892 = fma(_872, _878, _880);
    bool _894 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _896 = isnan(_608);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_884;
    float _908 = fma(_690, _878, _906);
    float _910 = fma(_872, _868, _890);
    float _912 = fma(_882, _888, _892);
    bool _914 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _916 = isnan(_608);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -_904;
    float _928 = _926 + 1.0;
    float _930 = fma(_882, _908, _910);
    bool _932 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _934 = isnan(_608);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = in.m_45.x;
    float _946 = _924 * _928;
    float _948 = -_924;
    float _950 = _948 + 1.0;
    float _952 = _642 + _930;
    float _954 = _640 + _912;
    float _956 = -_728;
    float _958 = _640 + _956;
    float _960 = _942 * _950;
    float _962 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _964 = _952 + _962;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _968 = _954 + _966;
    float _970 = _866 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _974 = _608 + _972;
    float _976 = _964 * _964;
    float _978 = -_752;
    float _980 = _642 + _978;
    bool _982 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _984 = isnan(_608);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = -_942;
    float _996 = _994 + 1.0;
    float _998 = fma(_968, _968, _976);
    float _1000 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].x, _970);
    float _1002 = fma(_854, _974, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1004 = _992 * _996;
    float _1006 = sqrt(_998);
    float _1008 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1000);
    float _1010 = _866 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1012 = _856 * _1004;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1016 = _608 + _1014;
    float _1018 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1020 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1010);
    float _1022 = -_992;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_852, _1016, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1028 = 1.0 / _1018;
    float _1030 = _686 * _878;
    float _1032 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1020);
    float _1034 = _870 * _690;
    float _1036 = _1034;
    float _1038 = _954;
    float _1040 = _952;
    if (_684)
    {
        _794 = _944;
    }
    float _1042 = _794;
    float _1044 = -_1030;
    float _1046 = fma(_688, _868, _1044);
    float _1048 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1050 = _1006 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = fma(_872, _874, _1034);
    float _1054 = _1042;
    if (_846)
    {
        float _1056 = -_1042;
        float _1058 = _1056 + 1.0;
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1048 + _1018;
    float _1064 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1012);
    float _1066 = fma(_882, _1046, _1052);
    if (!_684)
    {
        _1036 = _944;
    }
    float _1068 = _1036;
    float _1070 = _1062 * _1028;
    float _1072 = _1070 * 0.5;
    float _1074 = _1068;
    float _1076 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_684)
    {
        _1074 = _1060;
    }
    float _1078 = _1074;
    float _1080 = _638 + _1066;
    float _1082 = fma(_1002, _960, _1064);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1086 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1084);
    float _1088 = fma(_1026, _946, _1082);
    if (!_1050)
    {
        _1076 = _1080;
    }
    float _1090 = _1076;
    bool _1092 = !_1050;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1006 + _1098;
        float _1102 = _1080 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = rsqrt(_998);
        float _1106 = _1100 * _1096;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1122 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1124 = _1104 * _1120;
        float _1126 = fma(_1080, _1112, _1122);
        float _1128 = fma(_968, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_964, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1094 = _1126;
        _1038 = _1128;
        _1040 = _1130;
    }
    float _1132 = _1094;
    float _1134 = _1038;
    float _1136 = _1040;
    float _1138 = 1.0 / _1086;
    bool _1140 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1142 = isnan(0.5);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1148 = _1144 || _1146;
    float _1150 = -_726;
    float _1152 = _1150 + _1132;
    float _1154 = -_728;
    float _1156 = _1154 + _1134;
    float _1158 = -_752;
    float _1160 = _1158 + _1136;
    float _1162 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1088);
    float _1164 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1166 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1168 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1170 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1164);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1166);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1168);
    float _1178 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1170);
    float _1180 = _1164;
    float _1182 = _1152;
    if (_1148)
    {
        _1180 = 1.0;
    }
    float _1184 = _1180;
    float _1186 = _1184;
    if (_1148)
    {
        _1182 = 1.0;
    }
    float _1188 = _1182;
    float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1192 = _1138 * _1190;
    float _1194 = _1188;
    if (!_1148)
    {
        float _1196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1198 = _1196 * 0.15915493667125701904296875;
        float _1200 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1202 = _1198 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1200 * 0.15915493667125701904296875;
        float _1208 = _1198 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = 1.0 / _1204;
        float _1214 = _1206 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1210 * _1212;
        float _1220 = _1206 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1226 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1224;
        float _1228 = _1216 * _1218;
        float _1230 = 1.0 / _1226;
        float _1232 = 1.0 / _1228;
        float _1234 = _1222 * _1232;
        float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1238 = fma(_1192, _1234, _1236);
        float _1240 = _1238 * _1230;
        float _1242 = precise::clamp(_1240, 0.0, 1.0);
        _1186 = _1242;
    }
    float _1244 = _1186;
    if (!_1148)
    {
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1248 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1250 = _1246 * 0.15915493667125701904296875;
        float _1252 = _1248 * 0.15915493667125701904296875;
        float _1254 = _1250 * 6.283185482025146484375;
        float _1256 = cos(_1254);
        float _1258 = _1250 * 6.283185482025146484375;
        float _1260 = sin(_1258);
        float _1262 = 1.0 / _1256;
        float _1264 = _1252 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        float _1268 = _1260 * _1262;
        float _1270 = _1252 * 6.283185482025146484375;
        float _1272 = sin(_1270);
        float _1274 = _1266 * _1268;
        float _1276 = 1.0 / _1274;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1280 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1278;
        float _1282 = 1.0 / _1280;
        float _1284 = _1272 * _1276;
        float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1288 = fma(_1192, _1284, _1286);
        float _1290 = _1288 * _1282;
        float _1292 = precise::clamp(_1290, 0.0, 1.0);
        float _1294 = -_1292;
        float _1296 = _1294 + 1.0;
        _1194 = _1296;
    }
    float _1298 = _1194;
    bool _1300 = _1244 > 0.0;
    bool _1302 = isnan(_1244);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1174);
    float _1312 = _1244 * _1298;
    float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1316 = _1298 <= 0.0;
    bool _1318 = !_1308;
    bool _1320 = _1316 || _1318;
    float _1322 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1172);
    float _1324 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1176);
    float _1328 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1178);
    float _1330 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1332 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1342 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1344 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1332);
    float _1346 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1336);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1338);
    float _1350 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1340);
    float _1352 = _830 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1354 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1344);
    float _1356 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1346);
    float _1360 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1362 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1348);
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1350);
    float _1366 = _1352 * _1334;
    float _1368 = _1356 * _1314;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1372 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1374 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1362);
    float _1376 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1364);
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1382 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1386 = _1374 + _1376;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1392 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1354);
    float _1394 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1398 = _1386 * 0.5;
    out.m_49.x = _1368;
    out.m_49.y = _1366;
    out.m_51.x = _1388;
    out.m_51.y = _1382;
    out.m_51.z = _1390;
    out.m_51.w = _1394;
    out.m_33.x = _1396;
    out.gl_Position.x = _1372;
    out.gl_Position.y = _1392;
    out.gl_Position.z = _1374;
    out.gl_Position.w = _1376;
    out.m_53.z = _1398;
    out.m_53.w = _1376;
    if (!_1320)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1400;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1457 = as_type<float>(_88);
        out.gl_Position.z = _1457;
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
        float _1528 = as_type<float>(_128);
        out.gl_Position.z = _1528;
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
    bool _384 = _380 >= 9.9999999747524270787835121154785e-07;
    bool _386 = isnan(_380);
    bool _388 = _384 || _386;
    bool _390 = isnan(9.9999999747524270787835121154785e-07);
    bool _392 = _388 || _390;
    float _394 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _376);
    float _396 = fma(_328, _350, _370);
    float _398 = fma(_322, _350, _372);
    float _400 = fma(_346, _350, _374);
    float _402 = _364;
    float _404 = _382;
    float _406 = _394;
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
    float _610 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _612 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _614 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _616 = in.m_37.x;
    float _618 = in.m_37.y;
    float _620 = in.m_37.z;
    float _622 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _610);
    float _624 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _612);
    float _626 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _614);
    float _628 = _572 * _572;
    float _630 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _622);
    float _632 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _624);
    float _634 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _626);
    float _636 = fma(_574, _574, _628);
    float _638 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _640 = _632 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _642 = _634 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _644 = fma(_576, _576, _636);
    float _646 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _648 = _638 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _652 = _640 + _650;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _656 = _642 + _654;
    float _658 = _648 * _648;
    float _660 = rsqrt(_644);
    float _662 = fma(_652, _652, _658);
    float _664 = in.m_39.y;
    float _666 = _616 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _668 = fma(_656, _656, _662);
    out.m_41.x = 1.0;
    out.m_41.y = 1.0;
    out.m_41.z = 1.0;
    float _670 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _672 = in.m_43.x;
    float _674 = in.m_43.y;
    float _676 = in.m_43.z;
    float _678 = rsqrt(_668);
    float _680 = _670 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _684 = _682 != 0;
    float _686 = _660 * _576;
    float _688 = _660 * _574;
    float _690 = _660 * _572;
    float _692 = _620 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _694 = _618 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _698 = _686 * _696;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _702 = _700 != 0;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _706 = _690 * _704;
    float _708 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _710 = -_698;
    float _712 = fma(_688, _708, _710);
    float _714 = _680 * _678;
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _718 = -_706;
    float _720 = fma(_686, _716, _718);
    bool _722 = _664 > 0.5;
    float _724 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _726 = _648 * _714;
    float _728 = _652 * _714;
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _672);
    float _732 = -_726;
    float _734 = _648 + _732;
    float _736 = -_728;
    float _738 = _652 + _736;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _676);
    float _742 = _734 * _734;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _674);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _750 = fma(_738, _738, _742);
    float _752 = _656 * _714;
    float _754 = _712 * _712;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _760 = 1.0 / _748;
    float _762 = -_752;
    float _764 = _656 + _762;
    float _766 = in.m_45.y;
    float _768 = fma(_720, _720, _754);
    float _770 = fma(_764, _764, _750);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _778 = _688 * _776;
    float _780 = 1.0 / _758;
    float _782 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _786 = -_778;
    float _788 = fma(_690, _784, _786);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _792 = 0.0;
    float _794 = _690;
    if (_684)
    {
        float _796 = in.m_39.x;
        _792 = _796;
    }
    float _798 = _792;
    float _800 = 1.0 / _774;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _804 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = sqrt(_770);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _812 = fma(_788, _788, _768);
    float _814 = -_766;
    float _816 = _814 + 1.0;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _822 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = rsqrt(_812);
    float _826 = _766;
    if (_702)
    {
        float _828 = _722 ? _816 : _766;
        _826 = _828;
    }
    float _830 = _826;
    out.m_47.x = _806;
    out.m_47.y = _822;
    out.m_47.z = _804;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _836;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _608 + _840;
    bool _844 = _798 > 0.5;
    bool _846 = _844 && _684;
    float _848 = _834 * _760;
    float _850 = _678 * _808;
    float _852 = _838 * _800;
    float _854 = _820 * _780;
    float _856 = fma(_848, _842, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _858 = _724 * _850;
    float _860 = _670 * _850;
    float _862 = _782 * _850;
    float _864 = -_726;
    float _866 = _638 + _864;
    float _868 = _788 * _824;
    float _870 = _858 * _744;
    float _872 = _860 * _730;
    float _874 = _712 * _824;
    float _876 = _690 * _868;
    float _878 = _720 * _824;
    float _880 = _870 * _688;
    float _882 = _862 * _740;
    float _884 = _688 * _874;
    float _886 = -_876;
    float _888 = fma(_686, _874, _886);
    float _890 = _870 * _686;
    float _892 = fma(_872, _878, _880);
    bool _894 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _896 = isnan(_608);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_884;
    float _908 = fma(_690, _878, _906);
    float _910 = fma(_872, _868, _890);
    float _912 = fma(_882, _888, _892);
    bool _914 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _916 = isnan(_608);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -_904;
    float _928 = _926 + 1.0;
    float _930 = fma(_882, _908, _910);
    bool _932 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _934 = isnan(_608);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = in.m_45.x;
    float _946 = _924 * _928;
    float _948 = -_924;
    float _950 = _948 + 1.0;
    float _952 = _642 + _930;
    float _954 = _640 + _912;
    float _956 = -_728;
    float _958 = _640 + _956;
    float _960 = _942 * _950;
    float _962 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _964 = _952 + _962;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _968 = _954 + _966;
    float _970 = _866 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _974 = _608 + _972;
    float _976 = _964 * _964;
    float _978 = -_752;
    float _980 = _642 + _978;
    bool _982 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _984 = isnan(_608);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = -_942;
    float _996 = _994 + 1.0;
    float _998 = fma(_968, _968, _976);
    float _1000 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].x, _970);
    float _1002 = fma(_854, _974, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1004 = _992 * _996;
    float _1006 = sqrt(_998);
    float _1008 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1000);
    float _1010 = _866 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1012 = _856 * _1004;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1016 = _608 + _1014;
    float _1018 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1020 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1010);
    float _1022 = -_992;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_852, _1016, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1028 = 1.0 / _1018;
    float _1030 = _686 * _878;
    float _1032 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1020);
    float _1034 = _870 * _690;
    float _1036 = _1034;
    float _1038 = _954;
    float _1040 = _952;
    if (_684)
    {
        _794 = _944;
    }
    float _1042 = _794;
    float _1044 = -_1030;
    float _1046 = fma(_688, _868, _1044);
    float _1048 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1050 = _1006 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = fma(_872, _874, _1034);
    float _1054 = _1042;
    if (_846)
    {
        float _1056 = -_1042;
        float _1058 = _1056 + 1.0;
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1048 + _1018;
    float _1064 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1012);
    float _1066 = fma(_882, _1046, _1052);
    if (!_684)
    {
        _1036 = _944;
    }
    float _1068 = _1036;
    float _1070 = _1062 * _1028;
    float _1072 = _1070 * 0.5;
    float _1074 = _1068;
    float _1076 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_684)
    {
        _1074 = _1060;
    }
    float _1078 = _1074;
    float _1080 = _638 + _1066;
    float _1082 = fma(_1002, _960, _1064);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1086 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1084);
    float _1088 = fma(_1026, _946, _1082);
    if (!_1050)
    {
        _1076 = _1080;
    }
    float _1090 = _1076;
    bool _1092 = !_1050;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1006 + _1098;
        float _1102 = _1080 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = rsqrt(_998);
        float _1106 = _1100 * _1096;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1122 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1124 = _1104 * _1120;
        float _1126 = fma(_1080, _1112, _1122);
        float _1128 = fma(_968, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_964, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1094 = _1126;
        _1038 = _1128;
        _1040 = _1130;
    }
    float _1132 = _1094;
    float _1134 = _1038;
    float _1136 = _1040;
    float _1138 = 1.0 / _1086;
    bool _1140 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1142 = isnan(0.5);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1148 = _1144 || _1146;
    float _1150 = -_726;
    float _1152 = _1150 + _1132;
    float _1154 = -_728;
    float _1156 = _1154 + _1134;
    float _1158 = -_752;
    float _1160 = _1158 + _1136;
    float _1162 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1088);
    float _1164 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1166 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1168 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1170 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1164);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1166);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1168);
    float _1178 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1170);
    float _1180 = _1164;
    float _1182 = _1152;
    if (_1148)
    {
        _1180 = 1.0;
    }
    float _1184 = _1180;
    float _1186 = _1184;
    if (_1148)
    {
        _1182 = 1.0;
    }
    float _1188 = _1182;
    float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1192 = _1138 * _1190;
    float _1194 = _1188;
    if (!_1148)
    {
        float _1196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1198 = _1196 * 0.15915493667125701904296875;
        float _1200 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1202 = _1198 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1200 * 0.15915493667125701904296875;
        float _1208 = _1198 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = 1.0 / _1204;
        float _1214 = _1206 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1210 * _1212;
        float _1220 = _1206 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1226 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1224;
        float _1228 = _1216 * _1218;
        float _1230 = 1.0 / _1226;
        float _1232 = 1.0 / _1228;
        float _1234 = _1222 * _1232;
        float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1238 = fma(_1192, _1234, _1236);
        float _1240 = _1238 * _1230;
        float _1242 = precise::clamp(_1240, 0.0, 1.0);
        _1186 = _1242;
    }
    float _1244 = _1186;
    if (!_1148)
    {
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1248 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1250 = _1246 * 0.15915493667125701904296875;
        float _1252 = _1248 * 0.15915493667125701904296875;
        float _1254 = _1250 * 6.283185482025146484375;
        float _1256 = cos(_1254);
        float _1258 = _1250 * 6.283185482025146484375;
        float _1260 = sin(_1258);
        float _1262 = 1.0 / _1256;
        float _1264 = _1252 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        float _1268 = _1260 * _1262;
        float _1270 = _1252 * 6.283185482025146484375;
        float _1272 = sin(_1270);
        float _1274 = _1266 * _1268;
        float _1276 = 1.0 / _1274;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1280 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1278;
        float _1282 = 1.0 / _1280;
        float _1284 = _1272 * _1276;
        float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1288 = fma(_1192, _1284, _1286);
        float _1290 = _1288 * _1282;
        float _1292 = precise::clamp(_1290, 0.0, 1.0);
        float _1294 = -_1292;
        float _1296 = _1294 + 1.0;
        _1194 = _1296;
    }
    float _1298 = _1194;
    bool _1300 = _1244 > 0.0;
    bool _1302 = isnan(_1244);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1174);
    float _1312 = _1244 * _1298;
    float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1316 = _1298 <= 0.0;
    bool _1318 = !_1308;
    bool _1320 = _1316 || _1318;
    float _1322 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1172);
    float _1324 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1176);
    float _1328 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1178);
    float _1330 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1332 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1342 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1344 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1332);
    float _1346 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1336);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1338);
    float _1350 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1340);
    float _1352 = _830 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1354 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1344);
    float _1356 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1346);
    float _1360 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1362 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1348);
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1350);
    float _1366 = _1352 * _1334;
    float _1368 = _1356 * _1314;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1372 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1374 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1362);
    float _1376 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1364);
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1382 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1386 = _1374 + _1376;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1392 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1354);
    float _1394 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1398 = _1386 * 0.5;
    out.m_49.x = _1368;
    out.m_49.y = _1366;
    out.m_51.x = _1388;
    out.m_51.y = _1382;
    out.m_51.z = _1390;
    out.m_51.w = _1394;
    out.m_33.x = _1396;
    out.gl_Position.x = _1372;
    out.gl_Position.y = _1392;
    out.gl_Position.z = _1374;
    out.gl_Position.w = _1376;
    out.m_53.z = _1398;
    out.m_53.w = _1376;
    if (!_1320)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1400;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1457 = as_type<float>(_88);
        out.gl_Position.z = _1457;
    }
    if (!_76)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1528 = as_type<float>(_128);
        out.gl_Position.z = _1528;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _384 = _380 >= 9.9999999747524270787835121154785e-07;
    bool _386 = isnan(_380);
    bool _388 = _384 || _386;
    bool _390 = isnan(9.9999999747524270787835121154785e-07);
    bool _392 = _388 || _390;
    float _394 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _376);
    float _396 = fma(_328, _350, _370);
    float _398 = fma(_322, _350, _372);
    float _400 = fma(_346, _350, _374);
    float _402 = _364;
    float _404 = _382;
    float _406 = _394;
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
    float _610 = _398 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _612 = _398 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _614 = _398 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _616 = in.m_37.x;
    float _618 = in.m_37.y;
    float _620 = in.m_37.z;
    float _622 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _610);
    float _624 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _612);
    float _626 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _614);
    float _628 = _572 * _572;
    float _630 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _622);
    float _632 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _624);
    float _634 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _626);
    float _636 = fma(_574, _574, _628);
    float _638 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _640 = _632 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _642 = _634 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _644 = fma(_576, _576, _636);
    float _646 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _648 = _638 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _652 = _640 + _650;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _656 = _642 + _654;
    float _658 = _648 * _648;
    float _660 = rsqrt(_644);
    float _662 = fma(_652, _652, _658);
    float _664 = in.m_39.y;
    float _666 = _616 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _668 = fma(_656, _656, _662);
    out.m_41.x = 1.0;
    out.m_41.y = 1.0;
    out.m_41.z = 1.0;
    float _670 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _672 = in.m_43.x;
    float _674 = in.m_43.y;
    float _676 = in.m_43.z;
    float _678 = rsqrt(_668);
    float _680 = _670 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _684 = _682 != 0;
    float _686 = _660 * _576;
    float _688 = _660 * _574;
    float _690 = _660 * _572;
    float _692 = _620 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _694 = _618 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _698 = _686 * _696;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _702 = _700 != 0;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _706 = _690 * _704;
    float _708 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _710 = -_698;
    float _712 = fma(_688, _708, _710);
    float _714 = _680 * _678;
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _718 = -_706;
    float _720 = fma(_686, _716, _718);
    bool _722 = _664 > 0.5;
    float _724 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _726 = _648 * _714;
    float _728 = _652 * _714;
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _672);
    float _732 = -_726;
    float _734 = _648 + _732;
    float _736 = -_728;
    float _738 = _652 + _736;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _676);
    float _742 = _734 * _734;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _674);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _750 = fma(_738, _738, _742);
    float _752 = _656 * _714;
    float _754 = _712 * _712;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _760 = 1.0 / _748;
    float _762 = -_752;
    float _764 = _656 + _762;
    float _766 = in.m_45.y;
    float _768 = fma(_720, _720, _754);
    float _770 = fma(_764, _764, _750);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _778 = _688 * _776;
    float _780 = 1.0 / _758;
    float _782 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _786 = -_778;
    float _788 = fma(_690, _784, _786);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _792 = 0.0;
    float _794 = _690;
    if (_684)
    {
        float _796 = in.m_39.x;
        _792 = _796;
    }
    float _798 = _792;
    float _800 = 1.0 / _774;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _804 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = sqrt(_770);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _812 = fma(_788, _788, _768);
    float _814 = -_766;
    float _816 = _814 + 1.0;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _822 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = rsqrt(_812);
    float _826 = _766;
    if (_702)
    {
        float _828 = _722 ? _816 : _766;
        _826 = _828;
    }
    float _830 = _826;
    out.m_47.x = _806;
    out.m_47.y = _822;
    out.m_47.z = _804;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _836;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _608 + _840;
    bool _844 = _798 > 0.5;
    bool _846 = _844 && _684;
    float _848 = _834 * _760;
    float _850 = _678 * _808;
    float _852 = _838 * _800;
    float _854 = _820 * _780;
    float _856 = fma(_848, _842, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _858 = _724 * _850;
    float _860 = _670 * _850;
    float _862 = _782 * _850;
    float _864 = -_726;
    float _866 = _638 + _864;
    float _868 = _788 * _824;
    float _870 = _858 * _744;
    float _872 = _860 * _730;
    float _874 = _712 * _824;
    float _876 = _690 * _868;
    float _878 = _720 * _824;
    float _880 = _870 * _688;
    float _882 = _862 * _740;
    float _884 = _688 * _874;
    float _886 = -_876;
    float _888 = fma(_686, _874, _886);
    float _890 = _870 * _686;
    float _892 = fma(_872, _878, _880);
    bool _894 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _896 = isnan(_608);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_884;
    float _908 = fma(_690, _878, _906);
    float _910 = fma(_872, _868, _890);
    float _912 = fma(_882, _888, _892);
    bool _914 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _916 = isnan(_608);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -_904;
    float _928 = _926 + 1.0;
    float _930 = fma(_882, _908, _910);
    bool _932 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _934 = isnan(_608);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = in.m_45.x;
    float _946 = _924 * _928;
    float _948 = -_924;
    float _950 = _948 + 1.0;
    float _952 = _642 + _930;
    float _954 = _640 + _912;
    float _956 = -_728;
    float _958 = _640 + _956;
    float _960 = _942 * _950;
    float _962 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _964 = _952 + _962;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _968 = _954 + _966;
    float _970 = _866 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _974 = _608 + _972;
    float _976 = _964 * _964;
    float _978 = -_752;
    float _980 = _642 + _978;
    bool _982 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _984 = isnan(_608);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = -_942;
    float _996 = _994 + 1.0;
    float _998 = fma(_968, _968, _976);
    float _1000 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].x, _970);
    float _1002 = fma(_854, _974, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1004 = _992 * _996;
    float _1006 = sqrt(_998);
    float _1008 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1000);
    float _1010 = _866 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1012 = _856 * _1004;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1016 = _608 + _1014;
    float _1018 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1020 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1010);
    float _1022 = -_992;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_852, _1016, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1028 = 1.0 / _1018;
    float _1030 = _686 * _878;
    float _1032 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1020);
    float _1034 = _870 * _690;
    float _1036 = _1034;
    float _1038 = _954;
    float _1040 = _952;
    if (_684)
    {
        _794 = _944;
    }
    float _1042 = _794;
    float _1044 = -_1030;
    float _1046 = fma(_688, _868, _1044);
    float _1048 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1050 = _1006 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = fma(_872, _874, _1034);
    float _1054 = _1042;
    if (_846)
    {
        float _1056 = -_1042;
        float _1058 = _1056 + 1.0;
        _1054 = _1058;
    }
    float _1060 = _1054;
    float _1062 = _1048 + _1018;
    float _1064 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1012);
    float _1066 = fma(_882, _1046, _1052);
    if (!_684)
    {
        _1036 = _944;
    }
    float _1068 = _1036;
    float _1070 = _1062 * _1028;
    float _1072 = _1070 * 0.5;
    float _1074 = _1068;
    float _1076 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_684)
    {
        _1074 = _1060;
    }
    float _1078 = _1074;
    float _1080 = _638 + _1066;
    float _1082 = fma(_1002, _960, _1064);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1086 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1084);
    float _1088 = fma(_1026, _946, _1082);
    if (!_1050)
    {
        _1076 = _1080;
    }
    float _1090 = _1076;
    bool _1092 = !_1050;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1006 + _1098;
        float _1102 = _1080 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = rsqrt(_998);
        float _1106 = _1100 * _1096;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1122 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1124 = _1104 * _1120;
        float _1126 = fma(_1080, _1112, _1122);
        float _1128 = fma(_968, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_964, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1094 = _1126;
        _1038 = _1128;
        _1040 = _1130;
    }
    float _1132 = _1094;
    float _1134 = _1038;
    float _1136 = _1040;
    float _1138 = 1.0 / _1086;
    bool _1140 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1142 = isnan(0.5);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1148 = _1144 || _1146;
    float _1150 = -_726;
    float _1152 = _1150 + _1132;
    float _1154 = -_728;
    float _1156 = _1154 + _1134;
    float _1158 = -_752;
    float _1160 = _1158 + _1136;
    float _1162 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1088);
    float _1164 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1166 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1168 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1170 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1164);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1166);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1168);
    float _1178 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1170);
    float _1180 = _1164;
    float _1182 = _1152;
    if (_1148)
    {
        _1180 = 1.0;
    }
    float _1184 = _1180;
    float _1186 = _1184;
    if (_1148)
    {
        _1182 = 1.0;
    }
    float _1188 = _1182;
    float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1192 = _1138 * _1190;
    float _1194 = _1188;
    if (!_1148)
    {
        float _1196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1198 = _1196 * 0.15915493667125701904296875;
        float _1200 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1202 = _1198 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1200 * 0.15915493667125701904296875;
        float _1208 = _1198 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = 1.0 / _1204;
        float _1214 = _1206 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1210 * _1212;
        float _1220 = _1206 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1226 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1224;
        float _1228 = _1216 * _1218;
        float _1230 = 1.0 / _1226;
        float _1232 = 1.0 / _1228;
        float _1234 = _1222 * _1232;
        float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1238 = fma(_1192, _1234, _1236);
        float _1240 = _1238 * _1230;
        float _1242 = precise::clamp(_1240, 0.0, 1.0);
        _1186 = _1242;
    }
    float _1244 = _1186;
    if (!_1148)
    {
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1248 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1250 = _1246 * 0.15915493667125701904296875;
        float _1252 = _1248 * 0.15915493667125701904296875;
        float _1254 = _1250 * 6.283185482025146484375;
        float _1256 = cos(_1254);
        float _1258 = _1250 * 6.283185482025146484375;
        float _1260 = sin(_1258);
        float _1262 = 1.0 / _1256;
        float _1264 = _1252 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        float _1268 = _1260 * _1262;
        float _1270 = _1252 * 6.283185482025146484375;
        float _1272 = sin(_1270);
        float _1274 = _1266 * _1268;
        float _1276 = 1.0 / _1274;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1280 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1278;
        float _1282 = 1.0 / _1280;
        float _1284 = _1272 * _1276;
        float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1288 = fma(_1192, _1284, _1286);
        float _1290 = _1288 * _1282;
        float _1292 = precise::clamp(_1290, 0.0, 1.0);
        float _1294 = -_1292;
        float _1296 = _1294 + 1.0;
        _1194 = _1296;
    }
    float _1298 = _1194;
    bool _1300 = _1244 > 0.0;
    bool _1302 = isnan(_1244);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1174);
    float _1312 = _1244 * _1298;
    float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1316 = _1298 <= 0.0;
    bool _1318 = !_1308;
    bool _1320 = _1316 || _1318;
    float _1322 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1172);
    float _1324 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1176);
    float _1328 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1178);
    float _1330 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1332 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1342 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1344 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1332);
    float _1346 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1336);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1338);
    float _1350 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1340);
    float _1352 = _830 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1354 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1344);
    float _1356 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1346);
    float _1360 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1362 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1348);
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1350);
    float _1366 = _1352 * _1334;
    float _1368 = _1356 * _1314;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1372 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1374 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1362);
    float _1376 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1364);
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1382 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1386 = _1374 + _1376;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1392 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1354);
    float _1394 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1398 = _1386 * 0.5;
    out.m_49.x = _1368;
    out.m_49.y = _1366;
    out.m_51.x = _1388;
    out.m_51.y = _1382;
    out.m_51.z = _1390;
    out.m_51.w = _1394;
    out.m_33.x = _1396;
    out.gl_Position.x = _1372;
    out.gl_Position.y = _1392;
    out.gl_Position.z = _1374;
    out.gl_Position.w = _1376;
    out.m_53.z = _1398;
    out.m_53.w = _1376;
    if (!_1320)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1400;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

