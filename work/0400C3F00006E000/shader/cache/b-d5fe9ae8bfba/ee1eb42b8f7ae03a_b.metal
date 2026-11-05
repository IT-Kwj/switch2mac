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
    float4 m_53 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_47 [[attribute(1)]];
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _690 = false;
    bool _454 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_30.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_33.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2128 = as_type<float>(_90);
        out.gl_Position.z = _2128;
    }
    if (!_78)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _94 = in.m_35.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = 0.0;
    float _112 = 0.0;
    float _114 = _108;
    if (_104)
    {
        float _116 = float(_74);
        _110 = _116;
    }
    float _118 = _110;
    bool _120 = _108 >= _118;
    bool _122 = !_104;
    bool _124 = _120 || _122;
    if (_124)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _84;
    if (_124)
    {
        out.m_33.x = 0.0;
    }
    if (_124)
    {
        float _128 = _126 * 5.0;
        _92 = as_type<int>(_128);
    }
    int _130 = _92;
    float _132 = as_type<float>(_130);
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2199 = as_type<float>(_130);
        out.gl_Position.z = _2199;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_35.x;
    float _136 = in.m_35.y;
    float _138 = in.m_35.z;
    float _140 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = _140;
    if (!_150)
    {
        float _154 = _140 * _140;
        float _156 = _154 * 0.5;
        _132 = _156;
    }
    float _158 = _132;
    float _160 = 0.0;
    float _162 = _158;
    if (!_150)
    {
        float _164 = _108 * _108;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    if (!_150)
    {
        float _170 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _170;
    }
    float _172 = _162;
    bool _174 = !_150;
    float _176 = _172;
    float _178 = 0.0;
    if (!_174)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _140 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _140);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _112 = _196;
        _176 = _208;
        _178 = _198;
    }
    float _210 = _112;
    float _212 = _176;
    float _214 = _178;
    bool _216 = !_150;
    float _218 = _210;
    float _220 = _214;
    if (!_216)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _140 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _218 = _234;
        _220 = _228;
        _152 = _240;
    }
    float _242 = _218;
    float _244 = _220;
    float _246 = _152;
    float _248 = _244;
    float _250 = _242;
    if (!_150)
    {
        _248 = _108;
    }
    float _252 = _248;
    float _254 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _252;
    if (!_150)
    {
        float _258 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _258;
    }
    float _260 = _250;
    bool _262 = !_150;
    float _264 = _260;
    if (!_262)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = _108 * _268;
        float _278 = 1.0 / _272;
        float _280 = _274 * 0.693147182464599609375;
        float _282 = exp2(_276);
        float _284 = 1.0 / _280;
        float _286 = _282 + (-1.0);
        float _288 = -_286;
        float _290 = fma(_288, _284, _108);
        float _292 = _290 * _278;
        float _294 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _294;
    }
    float _296 = _264;
    bool _298 = !_150;
    if (!_298)
    {
        float _300 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = log2(_300);
        float _304 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _306 = _304 + 1.0;
        float _308 = 1.0 / _306;
        float _310 = _108 * _302;
        float _312 = exp2(_310);
        float _314 = -_312;
        float _316 = _314 + 1.0;
        float _318 = _316 * _308;
        _256 = _318;
    }
    float _320 = _256;
    float _322 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _324 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _326 = fma(_246, _136, _254);
    float _328 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _330 = fma(_320, _136, _322);
    float _332 = fma(_246, _134, _324);
    float _334 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = fma(_320, _134, _328);
    float _338 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _340 = -_330;
    float _342 = _326 + _340;
    float _344 = fma(_320, _138, _334);
    float _346 = -_336;
    float _348 = _332 + _346;
    float _350 = fma(_246, _138, _338);
    float _352 = _342 * _342;
    float _354 = in.m_37.w;
    float _356 = _342 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _358 = -_344;
    float _360 = _350 + _358;
    float _362 = fma(_348, _348, _352);
    float _364 = _342 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _366 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _356);
    float _368 = _342 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _370 = fma(_360, _360, _362);
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _364);
    float _374 = in.m_30.x;
    float _376 = in.m_30.y;
    float _378 = in.m_30.z;
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _366);
    float _382 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _368);
    float _384 = sqrt(_370);
    float _386 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _372);
    float _388 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    bool _390 = _384 >= 9.9999999747524270787835121154785e-07;
    bool _392 = isnan(_384);
    bool _394 = _390 || _392;
    bool _396 = isnan(9.9999999747524270787835121154785e-07);
    bool _398 = _394 || _396;
    float _400 = fma(_332, _354, _374);
    float _402 = fma(_350, _354, _378);
    float _404 = fma(_326, _354, _376);
    float _406 = _350;
    float _408 = _386;
    float _410 = _388;
    if (_398)
    {
        _406 = _380;
    }
    float _412 = _406;
    float _414 = _412;
    if (!_398)
    {
        bool _416 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _418 = !_416;
        if (!_418)
        {
            float _420 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _422 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _424 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _426 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _420);
            float _428 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _422);
            float _430 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _424);
            float _432 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _426);
            float _434 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _428);
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _430);
            float _438 = _432 * _432;
            float _440 = fma(_434, _434, _438);
            float _442 = fma(_436, _436, _440);
            float _444 = rsqrt(_442);
            float _446 = _444 * 9.9999999747524270787835121154785e-07;
            float _448 = _434 * _446;
            float _450 = _432 * _446;
            float _452 = _436 * _446;
            _408 = _450;
            _414 = _448;
            _410 = _452;
            _454 = true;
        }
        else
        {
            float _456 = _136 * _136;
            float _458 = fma(_134, _134, _456);
            float _460 = fma(_138, _138, _458);
            float _462 = sqrt(_460);
            bool _464 = _462 >= 9.9999999747524270787835121154785e-07;
            bool _466 = isnan(_462);
            bool _468 = _464 || _466;
            bool _470 = isnan(9.9999999747524270787835121154785e-07);
            bool _472 = _468 || _470;
            if (!_472)
            {
                float _474 = _376 * _376;
                float _476 = fma(_374, _374, _474);
                float _478 = fma(_378, _378, _476);
                float _480 = sqrt(_478);
                bool _482 = _480 >= 9.9999999747524270787835121154785e-07;
                bool _484 = isnan(_480);
                bool _486 = _482 || _484;
                bool _488 = isnan(9.9999999747524270787835121154785e-07);
                bool _490 = _486 || _488;
                if (!_490)
                {
                    float _492 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _494 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _492);
                    float _496 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _494);
                    float _498 = rsqrt(_496);
                    float _500 = _498 * 9.9999999747524270787835121154785e-07;
                    float _502 = _500 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _504 = _500 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _506 = _500 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _408 = _504;
                    _414 = _502;
                    _410 = _506;
                    _454 = true;
                }
                else
                {
                    float _508 = _376 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _510 = _376 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _512 = _376 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _514 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].x, _508);
                    float _516 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
                    float _518 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].x, _512);
                    float _520 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _514);
                    float _522 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _516);
                    float _524 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _518);
                    float _526 = _520 * _520;
                    float _528 = fma(_522, _522, _526);
                    float _530 = fma(_524, _524, _528);
                    float _532 = rsqrt(_530);
                    float _534 = _532 * 9.9999999747524270787835121154785e-07;
                    float _536 = _522 * _534;
                    float _538 = _520 * _534;
                    float _540 = _524 * _534;
                    _408 = _538;
                    _414 = _536;
                    _410 = _540;
                    _454 = true;
                }
            }
            else
            {
                float _542 = _136 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _544 = _136 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _546 = _136 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _548 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[5].x, _542);
                float _550 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[4].x, _544);
                float _552 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[6].x, _546);
                float _554 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[5].z, _548);
                float _556 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
                float _558 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
                float _560 = _554 * _554;
                float _562 = fma(_556, _556, _560);
                float _564 = fma(_558, _558, _562);
                float _566 = rsqrt(_564);
                float _568 = _566 * 9.9999999747524270787835121154785e-07;
                float _570 = _556 * _568;
                float _572 = _554 * _568;
                float _574 = _558 * _568;
                _408 = _572;
                _414 = _570;
                _410 = _574;
            }
        }
    }
    _454 = false;
    float _576 = _408;
    float _578 = _414;
    float _580 = _410;
    float _582 = in.m_39.x;
    float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _586 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _594 = _592 != 0;
    int _596 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _598 = _596 != 0;
    float _600 = _586 * _584;
    float _602 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[20].x, _600);
    float _604 = _602 * 6.283185482025146484375;
    float _606 = floor(_602);
    float _608 = _604 * 0.15915493667125701904296875;
    bool _610 = !_590;
    int _612 = _610 ? 0 : 1;
    int _614 = abs(_612);
    float _616 = _608 * 6.283185482025146484375;
    float _618 = cos(_616);
    bool _620 = !_598;
    int _622 = _620 ? 0 : 1;
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _626 = abs(_622);
    float _628 = -_606;
    float _630 = _602 + _628;
    bool _632 = !_594;
    int _634 = _632 ? 0 : 1;
    float _636 = float(_614);
    int _638 = abs(_634);
    float _640 = -_630;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _644 = fma(_618, 0.5, 0.5);
    float _646 = abs(_642);
    float _648 = _636 * _646;
    bool _650 = _630 < 0.5;
    float _652 = float(_650);
    float _654 = float(_626);
    float _656 = -_644;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _660 = float(_638);
    float _662 = -_652;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _666 = fma(_654, _658, _648);
    float _668 = abs(_664);
    float _670 = fma(_660, _668, _666);
    bool _672 = !_624;
    float _688;
    if (!_672)
    {
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _676 = _582 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        float _692 = float(_74);
        float _694 = 1.0 / _692;
        float _696 = _108 * _694;
        _688 = _696;
    }
    _690 = false;
    float _698 = _688;
    float _700 = in.m_39.z;
    float _702 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _704 = log2(_702);
    float _706 = _582 * 2.0;
    float _708 = in.m_41.x;
    float _710 = in.m_41.y;
    float _712 = in.m_41.z;
    float _714 = _404 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _716 = in.m_43.y;
    float _718 = floor(_706);
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = in.m_39.y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _728 = _726 != 0;
    float _730 = _404 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _732 = _704 * _108;
    float _734 = _404 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _736 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _738 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _740 = _736 || _738;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _748 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _750 = isnan(1.0);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _756 = _752 || _754;
    float _758 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _734);
    float _760 = _700 * 2.0;
    float _762 = exp2(_732);
    float _764 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _730);
    float _766 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _714);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _770 = 1.0 + _768;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _708);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _710);
    float _776 = -_716;
    float _778 = _776 + 1.0;
    float _780 = floor(_760);
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    bool _784 = _724 > 0.5;
    float _786 = in.m_37.x;
    float _788 = in.m_37.y;
    float _790 = in.m_37.z;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _796 = _716;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (_728)
    {
        float _800 = _784 ? _778 : _716;
        _796 = _800;
    }
    float _802 = _796;
    float _804 = 1.0 / _770;
    float _806 = -_762;
    float _808 = _806 + 1.0;
    bool _810 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _818 = _814 || _816;
    float _820 = _818 ? _808 : 0.0;
    bool _822 = _780 > 0.0;
    float _824 = 1.0 / _794;
    bool _826 = _780 >= 0.0;
    bool _828 = isnan(_780);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _840 = _718 >= 0.0;
    bool _842 = isnan(_718);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    int _850 = _834 ? 0 : 1;
    if (_756)
    {
        float _852 = _820 * _804;
        _114 = _852;
    }
    float _854 = _114;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _860 = _576 * _576;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _872 = _870 != 0;
    float _874 = 1.0 / _838;
    float _876 = _790 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _878 = fma(_578, _578, _860);
    int _880 = ~_850;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = _786 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _888 = !_868;
    int _890 = _888 ? 0 : 1;
    float _892 = fma(_580, _580, _878);
    bool _894 = _718 > 0.0;
    float _896 = 1.0 / _858;
    float _898 = _724 * 2.0;
    int _900 = _884;
    float _902 = _886;
    if (!_822)
    {
        int _904 = ~_850;
        int _906 = _904 + 1;
        _900 = _906;
    }
    int _908 = _900;
    float _910 = _788 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _912 = _848 ? 0 : 1;
    bool _914 = !_864;
    int _916 = _914 ? 0 : 1;
    float _918 = floor(_898);
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _930 = _928 != 0;
    int _932 = ~_912;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = _936;
    if (!_894)
    {
        int _940 = ~_912;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    float _946 = rsqrt(_892);
    bool _948 = !_872;
    int _950 = _948 ? 0 : 1;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _952;
    bool _956 = !_930;
    int _958 = _956 ? 0 : 1;
    float _960 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[5].z, _764);
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _964 = _962 != 0;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _972 = _970 != 0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _978 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[4].z, _758);
    float _980 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[6].z, _766);
    float _982 = _954 * _824;
    bool _984 = !_964;
    int _986 = _984 ? 0 : 1;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _988;
    bool _992 = _918 >= 0.0;
    bool _994 = isnan(_918);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    float _1002 = _976 * _874;
    float _1004 = _724 + _700;
    float _1006 = _946 * _576;
    float _1008 = _990 * _896;
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _1012 = _1000 ? 0 : 1;
    float _1014 = _946 * _578;
    bool _1016 = _918 > 0.0;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1020 = _946 * _580;
    float _1022 = _1004 + (-1.0);
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1018);
    float _1026 = _854 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _1028 = ~_1012;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1036 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1024);
    float _1038 = _582 + _724;
    float _1040 = _724 + (-0.5);
    int _1042 = _1032;
    float _1044 = _1006;
    if (!_1016)
    {
        int _1046 = ~_1012;
        int _1048 = _1046 + 1;
        _1042 = _1048;
    }
    int _1050 = _1042;
    float _1052 = _1026 * _1010;
    float _1054 = abs(_1036);
    bool _1056 = _1054 > 0.99989998340606689453125;
    float _1058 = _582 + _700;
    float _1060 = _1038 + (-1.0);
    float _1062 = _854 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _1064 = _1058 + (-1.0);
    float _1066 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1052);
    float _1068 = _1062 * _746;
    float _1070 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1072 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1074 = _886 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1076 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1068);
    if (_1056)
    {
        _902 = 0.001000000047497451305389404296875;
    }
    float _1078 = _902;
    float _1080 = floor(_1066);
    float _1082 = 0.0;
    if (!_1056)
    {
        _1082 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1084 = _1082;
    float _1086 = _1074 * _772;
    float _1088 = _1084;
    if (!_1056)
    {
        _798 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1090 = _798;
    float _1092 = _1090;
    if (_1056)
    {
        float _1094 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1088 = _1094;
    }
    float _1096 = _1088;
    bool _1098 = !_968;
    int _1100 = _1098 ? 0 : 1;
    if (_1056)
    {
        float _1102 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1092 = _1102;
    }
    float _1104 = _1092;
    float _1106 = 0.0;
    if (!_1056)
    {
        _1106 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1108 = _1106;
    float _1110 = floor(_1076);
    float _1112 = _1108;
    if (_1056)
    {
        float _1114 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = _1076 + 0.25;
    float _1120 = in.m_47.x;
    float _1122 = in.m_47.y;
    float _1124 = in.m_47.z;
    bool _1126 = !_972;
    int _1128 = _1126 ? 0 : 1;
    float _1130 = _1066 + 0.25;
    int _1132 = abs(_1100);
    float _1134 = _700 + (-0.5);
    float _1136 = floor(_1118);
    int _1138 = abs(_1128);
    float _1140 = -_1080;
    float _1142 = _1066 + _1140;
    float _1144 = float(_908);
    float _1146 = _1066 * 6.283185482025146484375;
    float _1148 = _960 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1150 = floor(_1130);
    float _1152 = float(_944);
    float _1154 = -_1110;
    float _1156 = _1076 + _1154;
    float _1158 = float(_1132);
    float _1160 = _1146 * 0.15915493667125701904296875;
    float _1162 = float(_1050);
    float _1164 = _1076 * 6.283185482025146484375;
    float _1166 = float(_1138);
    float _1168 = _1158 * _1152;
    bool _1170 = _1156 >= 0.5;
    bool _1172 = isnan(_1156);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.5);
    bool _1178 = _1174 || _1176;
    float _1180 = -_1116;
    float _1182 = _1006 * _1180;
    bool _1184 = _1142 >= 0.5;
    bool _1186 = isnan(_1142);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan(0.5);
    bool _1192 = _1188 || _1190;
    float _1194 = _1166 * _1162;
    float _1196 = -_1136;
    float _1198 = _1118 + _1196;
    float _1200 = _1168 * (-2.0);
    float _1202 = -_1096;
    float _1204 = _1014 * _1202;
    float _1206 = -_1150;
    float _1208 = _1130 + _1206;
    float _1210 = -_1104;
    float _1212 = _1020 * _1210;
    float _1214 = fma(_1034, _1200, _1034);
    float _1216 = fma(_1200, _1122, _1122);
    float _1218 = -_1096;
    float _1220 = -_1182;
    float _1222 = fma(_1020, _1218, _1220);
    int _1224 = abs(_890);
    float _1226 = -_1104;
    float _1228 = -_1204;
    float _1230 = fma(_1006, _1226, _1228);
    bool _1232 = !_926;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = _1160 * 6.283185482025146484375;
    float _1238 = sin(_1236);
    bool _1240 = !_1192;
    float _1242 = _1240 ? 0.5 : (-0.5);
    float _1244 = -_1116;
    float _1246 = -_1212;
    float _1248 = fma(_1014, _1244, _1246);
    bool _1250 = _1208 > 0.5;
    float _1252 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1216);
    int _1254 = abs(_1234);
    float _1256 = _1164 * 0.15915493667125701904296875;
    float _1258 = float(_1224);
    float _1260 = fma(_1214, _854, _1252);
    bool _1262 = !_1178;
    float _1264 = _1262 ? 0.5 : (-0.5);
    float _1266 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1268 = _1266 * 2.0;
    float _1270 = float(_1254);
    float _1272 = _1256 * 6.283185482025146484375;
    float _1274 = sin(_1272);
    int _1276 = abs(_986);
    float _1278 = _1258 * _1268;
    int _1280 = abs(_916);
    float _1282 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1284 = _1282 * 2.0;
    bool _1286 = !_922;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = _1208;
    float _1292 = _1198;
    if (_1250)
    {
        float _1294 = -_1208;
        float _1296 = _1294 + 1.0;
        _1290 = _1296;
    }
    float _1298 = _1290;
    bool _1300 = _1198 > 0.5;
    float _1302 = _1270 * _1284;
    int _1304 = abs(_950);
    float _1306 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1308 = float(_1280);
    float _1310 = fma(_1298, 4.0, -1.0);
    float _1312 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1314 = _1260 * 0.15915493667125701904296875;
    int _1316 = abs(_1288);
    float _1318 = fma(_1308, _1306, _1278);
    float _1320 = _1312 * _582;
    float _1322 = float(_1276);
    float _1324 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1326 = float(_1304);
    if (_1300)
    {
        float _1328 = -_1198;
        float _1330 = _1328 + 1.0;
        _1292 = _1330;
    }
    float _1332 = _1292;
    float _1334 = _1322 * _1144;
    float _1336 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1338 = fma(_1326, _1324, _1318);
    float _1340 = fma(_1332, 4.0, -1.0);
    float _1342 = _1334 * (-2.0);
    int _1344 = abs(_958);
    float _1346 = fma(_1338, 3.1415927410125732421875, _1120);
    float _1348 = float(_1316);
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1352 = _1248 * _1248;
    float _1354 = fma(_1346, _1342, _1346);
    float _1356 = fma(_1348, _1336, _1302);
    float _1358 = _582 + (-0.5);
    float _1360 = fma(_1072, _1342, _1072);
    float _1362 = float(_1344);
    float _1364 = fma(_1222, _1222, _1352);
    float _1366 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1354);
    float _1368 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1370 = _1194 * (-2.0);
    float _1372 = fma(_1362, _1350, _1356);
    float _1374 = fma(_1360, _854, _1366);
    float _1376 = _1368 * _774;
    float _1378 = _876 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1380 = fma(_1372, 3.1415927410125732421875, _1124);
    bool _1382 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1384 = isnan(_698);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = trunc(_1320);
    int _1396 = int(_1394);
    float _1398 = _1378 * _782;
    float _1400 = fma(_1380, _1370, _1380);
    float _1402 = fma(_1070, _1370, _1070);
    bool _1404 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1406 = isnan(_698);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = -_1392;
    float _1418 = _1416 + 1.0;
    float _1420 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1400);
    float _1422 = _1374 * 0.15915493667125701904296875;
    bool _1424 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1426 = isnan(_698);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = fma(_1230, _1230, _1364);
    float _1438 = fma(_1402, _854, _1420);
    float _1440 = _1414 * _1418;
    float _1442 = -_1414;
    float _1444 = _1442 + 1.0;
    bool _1446 = _582 > 0.5;
    bool _1448 = _1446 && _722;
    float _1450 = _1438 * 0.15915493667125701904296875;
    float _1452 = rsqrt(_1436);
    float _1454 = _1434 * _1444;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1458 = _698 + _1456;
    float _1460 = -_1434;
    float _1462 = _1460 + 1.0;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1466 = _698 + _1464;
    bool _1468 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1470 = isnan(_698);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1482 = _698 + _1480;
    float _1484 = fma(_1002, _1458, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1486 = _1314 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    int _1490 = _1396 << 4;
    int _1492 = _1490 + 1968;
    float _1494 = fma(_982, _1466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1496 = _1478 * _1462;
    float _1498 = fma(_1008, _1482, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1500 = _1492 + 8;
    uint _1503 = uint(int(uint(_1500) >> uint(2)));
    uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
    int _1507 = int(_1503) & 3;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[int(_1505)][_1507];
    float _1511 = _1494 * _1496;
    float _1513 = _1314 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = _1230 * _1452;
    float _1519 = _1222 * _1452;
    float _1521 = _1248 * _1452;
    uint _1523 = uint(int(uint(_1492) >> uint(2)));
    uint _1525 = uint(int(uint(int(_1523)) >> uint(2)));
    int _1527 = int(_1523) & 3;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[int(_1525)][_1527];
    int _1531 = int(_1523) + 1;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    int _1535 = _1531 & 3;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[int(_1533)][_1535];
    float _1539 = _1014 * _1521;
    float _1541 = _1422 * 6.283185482025146484375;
    float _1543 = sin(_1541);
    float _1545 = -_1539;
    float _1547 = fma(_1006, _1519, _1545);
    float _1549 = _1422 * 6.283185482025146484375;
    float _1551 = cos(_1549);
    float _1553 = _1450 * 6.283185482025146484375;
    float _1555 = cos(_1553);
    float _1557 = _1543 * _1488;
    float _1559 = _1543 * _1515;
    float _1561 = _1450 * 6.283185482025146484375;
    float _1563 = sin(_1561);
    float _1565 = _1551 * _1515;
    float _1567 = _1551 * _1488;
    float _1569 = _1543 * _1555;
    float _1571 = _1515 * _1555;
    float _1573 = _1551 * _1555;
    float _1575 = _1488 * _1555;
    float _1577 = _1573 * _1020;
    float _1579 = fma(_1563, _1565, _1557);
    float _1581 = fma(_1563, _1557, _1565);
    float _1583 = -_1567;
    float _1585 = fma(_1563, _1559, _1583);
    float _1587 = -_1559;
    float _1589 = fma(_1563, _1567, _1587);
    float _1591 = _1006 * _1517;
    float _1593 = _1573 * _1014;
    float _1595 = _1579 * _1014;
    float _1597 = _1589 * _1014;
    float _1599 = -_1591;
    float _1601 = fma(_1020, _1521, _1599);
    float _1603 = -_1563;
    float _1605 = fma(_1603, _1519, _1593);
    float _1607 = _1579 * _1020;
    float _1609 = fma(_1571, _1519, _1595);
    float _1611 = fma(_1575, _1519, _1597);
    float _1613 = -_1563;
    float _1615 = fma(_1613, _1517, _1577);
    float _1617 = fma(_1569, _1601, _1605);
    float _1619 = fma(_1571, _1517, _1607);
    float _1621 = fma(_1585, _1601, _1609);
    float _1623 = fma(_1581, _1601, _1611);
    float _1625 = _1589 * _1020;
    float _1627 = fma(_1569, _1547, _1615);
    float _1629 = _1376 * _1617;
    float _1631 = fma(_1585, _1547, _1619);
    float _1633 = fma(_1575, _1517, _1625);
    float _1635 = _1376 * _1627;
    float _1637 = fma(_1086, _1621, _1629);
    float _1639 = _978 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1641 = fma(_1581, _1547, _1633);
    float _1643 = fma(_1086, _1631, _1635);
    float _1645 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1647 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1649 = fma(_1398, _1623, _1637);
    float _1651 = fma(_1398, _1641, _1643);
    float _1653 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1645);
    float _1655 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1647);
    float _1657 = _1639 + _1649;
    float _1659 = _980 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1661 = -_1478;
    float _1663 = _1661 + 1.0;
    float _1665 = _1509 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1669 = _1657 + _1667;
    float _1671 = _1659 + _1651;
    float _1673 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1511);
    float _1675 = in.m_43.x;
    float _1677 = _1020 * _1519;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1681 = _1671 + _1679;
    float _1683 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1685 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1687 = fma(_1484, _1454, _1673);
    float _1689 = _1681 * _1681;
    float _1691 = _1573 * _1006;
    float _1693 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1655);
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = fma(_1669, _1669, _1689);
    float _1699 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1701 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = -_1677;
    float _1705 = fma(_1014, _1517, _1703);
    float _1707 = sqrt(_1697);
    float _1709 = _1579 * _1006;
    float _1711 = -_1563;
    float _1713 = fma(_1711, _1521, _1691);
    float _1715 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_49.x = _1695;
    out.m_49.y = _1699;
    out.m_49.z = _1701;
    float _1717 = _1589 * _1006;
    float _1719 = fma(_1571, _1521, _1709);
    float _1721 = fma(_1569, _1705, _1713);
    float _1723 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1653);
    float _1725 = fma(_1575, _1521, _1717);
    float _1727 = fma(_1585, _1705, _1719);
    float _1729 = _1376 * _1721;
    float _1731 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1733 = fma(_1581, _1705, _1725);
    float _1735 = _1675;
    float _1737 = _1657;
    float _1739 = _1671;
    if (_722)
    {
        _1044 = _1675;
    }
    float _1741 = _1044;
    float _1743 = fma(_1086, _1727, _1729);
    float _1745 = 1.0 / _1715;
    bool _1747 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1749 = _1731 + _1715;
    float _1751 = fma(_1398, _1733, _1743);
    float _1753 = _1741;
    if (_1448)
    {
        float _1755 = -_1741;
        float _1757 = _1755 + 1.0;
        _1753 = _1757;
    }
    float _1759 = _1753;
    float _1761 = fma(_1498, _1440, _1687);
    float _1763 = _1148 + _1751;
    float _1765 = _1759;
    if (_722)
    {
        _1735 = _1759;
    }
    float _1767 = _1735;
    float _1769 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1761);
    if (!_1747)
    {
        _1765 = _1763;
    }
    float _1771 = _1765;
    float _1773 = _1749 * _1745;
    float _1775 = _1773 * 0.5;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1779 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1777);
    bool _1781 = !_1747;
    float _1783 = _1771;
    float _1785 = _1745;
    if (!_1781)
    {
        float _1787 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1791 = _1707 + _1789;
        float _1793 = _1763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1795 = rsqrt(_1697);
        float _1797 = _1791 * _1787;
        float _1799 = _1797 * 0.15915493667125701904296875;
        float _1801 = _1799 * 6.283185482025146484375;
        float _1803 = sin(_1801);
        float _1805 = _1799 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        float _1809 = fma(_1803, _1793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1811 = _1795 * _1809;
        float _1813 = _1807 + (-1.0);
        float _1815 = fma(_1669, _1811, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1817 = fma(_1681, _1811, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1819 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1821 = fma(_1763, _1807, _1819);
        _1783 = _1821;
        _1737 = _1815;
        _1739 = _1817;
        _1785 = _1819;
    }
    float _1823 = _1783;
    float _1825 = _1737;
    float _1827 = _1739;
    float _1829 = _1785;
    float _1831 = 1.0 / _1779;
    float _1833 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1837 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1839 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1841 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1833);
    float _1843 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1835);
    float _1845 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1837);
    float _1847 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1839);
    float _1849 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1841);
    float _1851 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1843);
    float _1853 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1845);
    float _1855 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1847);
    float _1857 = _1843;
    float _1859 = _1829;
    if (_744)
    {
        _1857 = 1.0;
    }
    float _1861 = _1857;
    float _1863 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1865 = _1861;
    if (_744)
    {
        _1859 = 1.0;
    }
    float _1867 = _1859;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1871 = _1831 * _1869;
    float _1873 = _1867;
    if (!_744)
    {
        float _1875 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1877 = _1875 * 0.15915493667125701904296875;
        float _1879 = _1877 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        float _1883 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1885 = _1883 * 0.15915493667125701904296875;
        float _1887 = _1877 * 6.283185482025146484375;
        float _1889 = sin(_1887);
        float _1891 = 1.0 / _1881;
        float _1893 = _1885 * 6.283185482025146484375;
        float _1895 = cos(_1893);
        float _1897 = _1889 * _1891;
        float _1899 = _1885 * 6.283185482025146484375;
        float _1901 = sin(_1899);
        float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1903;
        float _1907 = _1895 * _1897;
        float _1909 = 1.0 / _1905;
        float _1911 = 1.0 / _1907;
        float _1913 = _1901 * _1911;
        float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1917 = fma(_1871, _1913, _1915);
        float _1919 = _1917 * _1909;
        float _1921 = precise::clamp(_1919, 0.0, 1.0);
        _1865 = _1921;
    }
    float _1923 = _1865;
    if (!_744)
    {
        float _1925 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1927 = _1925 * 0.15915493667125701904296875;
        float _1929 = _1927 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = _1927 * 6.283185482025146484375;
        float _1939 = sin(_1937);
        float _1941 = 1.0 / _1931;
        float _1943 = _1935 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1939 * _1941;
        float _1949 = _1935 * 6.283185482025146484375;
        float _1951 = sin(_1949);
        float _1953 = _1945 * _1947;
        float _1955 = 1.0 / _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1959 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1957;
        float _1961 = 1.0 / _1959;
        float _1963 = _1951 * _1955;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1967 = fma(_1871, _1963, _1965);
        float _1969 = _1967 * _1961;
        float _1971 = precise::clamp(_1969, 0.0, 1.0);
        float _1973 = -_1971;
        float _1975 = _1973 + 1.0;
        _1873 = _1975;
    }
    float _1977 = _1873;
    bool _1979 = _1923 > 0.0;
    bool _1981 = isnan(_1923);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan(0.0);
    bool _1987 = _1983 || _1985;
    float _1989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1991 = _1923 * _1977;
    float _1993 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1995 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1997 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1999 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2001 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2003 = _1977 <= 0.0;
    bool _2005 = !_1987;
    bool _2007 = _2003 || _2005;
    float _2009 = _1991 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2011 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1999);
    float _2013 = _1853 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2015 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1995);
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1997);
    float _2019 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2001);
    float _2021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2023 = _670 * _2009;
    float _2025 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2011);
    float _2027 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2029 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2015);
    float _2031 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2017);
    float _2033 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2019);
    float _2035 = _802 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2037 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2025);
    float _2039 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2033);
    float _2041 = _2035 * _1989;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2047 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2029);
    float _2049 = _1769 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2051 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2055 = _2037 + _2039;
    float _2057 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2031);
    float _2059 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2061 = _2051 * _2021;
    float _2063 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2065 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2067 = _2023 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2069 = _2055 * 0.5;
    out.m_51.x = _2061;
    out.m_51.y = _2041;
    out.m_53.x = _2059;
    out.m_53.y = _2063;
    out.m_53.z = _2065;
    out.m_53.w = _2049;
    out.m_33.x = _2067;
    out.gl_Position.x = _2047;
    out.gl_Position.y = _2057;
    out.gl_Position.z = _2037;
    out.gl_Position.w = _2039;
    out.m_55.z = _2069;
    out.m_55.w = _2039;
    if (!_2007)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _2071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2071;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _690 = false;
    bool _454 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_30.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_33.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2128 = as_type<float>(_90);
        out.gl_Position.z = _2128;
    }
    if (!_78)
    {
        return out;
    }
    float _94 = in.m_35.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = 0.0;
    float _112 = 0.0;
    float _114 = _108;
    if (_104)
    {
        float _116 = float(_74);
        _110 = _116;
    }
    float _118 = _110;
    bool _120 = _108 >= _118;
    bool _122 = !_104;
    bool _124 = _120 || _122;
    if (_124)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _84;
    if (_124)
    {
        out.m_33.x = 0.0;
    }
    if (_124)
    {
        float _128 = _126 * 5.0;
        _92 = as_type<int>(_128);
    }
    int _130 = _92;
    float _132 = as_type<float>(_130);
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2199 = as_type<float>(_130);
        out.gl_Position.z = _2199;
    }
    if (_124)
    {
        return out;
    }
    float _134 = in.m_35.x;
    float _136 = in.m_35.y;
    float _138 = in.m_35.z;
    float _140 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = _140;
    if (!_150)
    {
        float _154 = _140 * _140;
        float _156 = _154 * 0.5;
        _132 = _156;
    }
    float _158 = _132;
    float _160 = 0.0;
    float _162 = _158;
    if (!_150)
    {
        float _164 = _108 * _108;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    if (!_150)
    {
        float _170 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _170;
    }
    float _172 = _162;
    bool _174 = !_150;
    float _176 = _172;
    float _178 = 0.0;
    if (!_174)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _140 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _140);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _112 = _196;
        _176 = _208;
        _178 = _198;
    }
    float _210 = _112;
    float _212 = _176;
    float _214 = _178;
    bool _216 = !_150;
    float _218 = _210;
    float _220 = _214;
    if (!_216)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _140 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _218 = _234;
        _220 = _228;
        _152 = _240;
    }
    float _242 = _218;
    float _244 = _220;
    float _246 = _152;
    float _248 = _244;
    float _250 = _242;
    if (!_150)
    {
        _248 = _108;
    }
    float _252 = _248;
    float _254 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _252;
    if (!_150)
    {
        float _258 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _258;
    }
    float _260 = _250;
    bool _262 = !_150;
    float _264 = _260;
    if (!_262)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = _108 * _268;
        float _278 = 1.0 / _272;
        float _280 = _274 * 0.693147182464599609375;
        float _282 = exp2(_276);
        float _284 = 1.0 / _280;
        float _286 = _282 + (-1.0);
        float _288 = -_286;
        float _290 = fma(_288, _284, _108);
        float _292 = _290 * _278;
        float _294 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _294;
    }
    float _296 = _264;
    bool _298 = !_150;
    if (!_298)
    {
        float _300 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = log2(_300);
        float _304 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _306 = _304 + 1.0;
        float _308 = 1.0 / _306;
        float _310 = _108 * _302;
        float _312 = exp2(_310);
        float _314 = -_312;
        float _316 = _314 + 1.0;
        float _318 = _316 * _308;
        _256 = _318;
    }
    float _320 = _256;
    float _322 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _324 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _326 = fma(_246, _136, _254);
    float _328 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _330 = fma(_320, _136, _322);
    float _332 = fma(_246, _134, _324);
    float _334 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = fma(_320, _134, _328);
    float _338 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _340 = -_330;
    float _342 = _326 + _340;
    float _344 = fma(_320, _138, _334);
    float _346 = -_336;
    float _348 = _332 + _346;
    float _350 = fma(_246, _138, _338);
    float _352 = _342 * _342;
    float _354 = in.m_37.w;
    float _356 = _342 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _358 = -_344;
    float _360 = _350 + _358;
    float _362 = fma(_348, _348, _352);
    float _364 = _342 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _366 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _356);
    float _368 = _342 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _370 = fma(_360, _360, _362);
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _364);
    float _374 = in.m_30.x;
    float _376 = in.m_30.y;
    float _378 = in.m_30.z;
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _366);
    float _382 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _368);
    float _384 = sqrt(_370);
    float _386 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _372);
    float _388 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    bool _390 = _384 >= 9.9999999747524270787835121154785e-07;
    bool _392 = isnan(_384);
    bool _394 = _390 || _392;
    bool _396 = isnan(9.9999999747524270787835121154785e-07);
    bool _398 = _394 || _396;
    float _400 = fma(_332, _354, _374);
    float _402 = fma(_350, _354, _378);
    float _404 = fma(_326, _354, _376);
    float _406 = _350;
    float _408 = _386;
    float _410 = _388;
    if (_398)
    {
        _406 = _380;
    }
    float _412 = _406;
    float _414 = _412;
    if (!_398)
    {
        bool _416 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _418 = !_416;
        if (!_418)
        {
            float _420 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _422 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _424 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _426 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _420);
            float _428 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _422);
            float _430 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _424);
            float _432 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _426);
            float _434 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _428);
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _430);
            float _438 = _432 * _432;
            float _440 = fma(_434, _434, _438);
            float _442 = fma(_436, _436, _440);
            float _444 = rsqrt(_442);
            float _446 = _444 * 9.9999999747524270787835121154785e-07;
            float _448 = _434 * _446;
            float _450 = _432 * _446;
            float _452 = _436 * _446;
            _408 = _450;
            _414 = _448;
            _410 = _452;
            _454 = true;
        }
        else
        {
            float _456 = _136 * _136;
            float _458 = fma(_134, _134, _456);
            float _460 = fma(_138, _138, _458);
            float _462 = sqrt(_460);
            bool _464 = _462 >= 9.9999999747524270787835121154785e-07;
            bool _466 = isnan(_462);
            bool _468 = _464 || _466;
            bool _470 = isnan(9.9999999747524270787835121154785e-07);
            bool _472 = _468 || _470;
            if (!_472)
            {
                float _474 = _376 * _376;
                float _476 = fma(_374, _374, _474);
                float _478 = fma(_378, _378, _476);
                float _480 = sqrt(_478);
                bool _482 = _480 >= 9.9999999747524270787835121154785e-07;
                bool _484 = isnan(_480);
                bool _486 = _482 || _484;
                bool _488 = isnan(9.9999999747524270787835121154785e-07);
                bool _490 = _486 || _488;
                if (!_490)
                {
                    float _492 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _494 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _492);
                    float _496 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _494);
                    float _498 = rsqrt(_496);
                    float _500 = _498 * 9.9999999747524270787835121154785e-07;
                    float _502 = _500 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _504 = _500 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _506 = _500 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _408 = _504;
                    _414 = _502;
                    _410 = _506;
                    _454 = true;
                }
                else
                {
                    float _508 = _376 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _510 = _376 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _512 = _376 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _514 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].x, _508);
                    float _516 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
                    float _518 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].x, _512);
                    float _520 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _514);
                    float _522 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _516);
                    float _524 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _518);
                    float _526 = _520 * _520;
                    float _528 = fma(_522, _522, _526);
                    float _530 = fma(_524, _524, _528);
                    float _532 = rsqrt(_530);
                    float _534 = _532 * 9.9999999747524270787835121154785e-07;
                    float _536 = _522 * _534;
                    float _538 = _520 * _534;
                    float _540 = _524 * _534;
                    _408 = _538;
                    _414 = _536;
                    _410 = _540;
                    _454 = true;
                }
            }
            else
            {
                float _542 = _136 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _544 = _136 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _546 = _136 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _548 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[5].x, _542);
                float _550 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[4].x, _544);
                float _552 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[6].x, _546);
                float _554 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[5].z, _548);
                float _556 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
                float _558 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
                float _560 = _554 * _554;
                float _562 = fma(_556, _556, _560);
                float _564 = fma(_558, _558, _562);
                float _566 = rsqrt(_564);
                float _568 = _566 * 9.9999999747524270787835121154785e-07;
                float _570 = _556 * _568;
                float _572 = _554 * _568;
                float _574 = _558 * _568;
                _408 = _572;
                _414 = _570;
                _410 = _574;
            }
        }
    }
    _454 = false;
    float _576 = _408;
    float _578 = _414;
    float _580 = _410;
    float _582 = in.m_39.x;
    float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _586 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _594 = _592 != 0;
    int _596 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _598 = _596 != 0;
    float _600 = _586 * _584;
    float _602 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[20].x, _600);
    float _604 = _602 * 6.283185482025146484375;
    float _606 = floor(_602);
    float _608 = _604 * 0.15915493667125701904296875;
    bool _610 = !_590;
    int _612 = _610 ? 0 : 1;
    int _614 = abs(_612);
    float _616 = _608 * 6.283185482025146484375;
    float _618 = cos(_616);
    bool _620 = !_598;
    int _622 = _620 ? 0 : 1;
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _626 = abs(_622);
    float _628 = -_606;
    float _630 = _602 + _628;
    bool _632 = !_594;
    int _634 = _632 ? 0 : 1;
    float _636 = float(_614);
    int _638 = abs(_634);
    float _640 = -_630;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _644 = fma(_618, 0.5, 0.5);
    float _646 = abs(_642);
    float _648 = _636 * _646;
    bool _650 = _630 < 0.5;
    float _652 = float(_650);
    float _654 = float(_626);
    float _656 = -_644;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _660 = float(_638);
    float _662 = -_652;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _666 = fma(_654, _658, _648);
    float _668 = abs(_664);
    float _670 = fma(_660, _668, _666);
    bool _672 = !_624;
    float _688;
    if (!_672)
    {
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _676 = _582 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        float _692 = float(_74);
        float _694 = 1.0 / _692;
        float _696 = _108 * _694;
        _688 = _696;
    }
    _690 = false;
    float _698 = _688;
    float _700 = in.m_39.z;
    float _702 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _704 = log2(_702);
    float _706 = _582 * 2.0;
    float _708 = in.m_41.x;
    float _710 = in.m_41.y;
    float _712 = in.m_41.z;
    float _714 = _404 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _716 = in.m_43.y;
    float _718 = floor(_706);
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = in.m_39.y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _728 = _726 != 0;
    float _730 = _404 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _732 = _704 * _108;
    float _734 = _404 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _736 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _738 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _740 = _736 || _738;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _748 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _750 = isnan(1.0);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _756 = _752 || _754;
    float _758 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _734);
    float _760 = _700 * 2.0;
    float _762 = exp2(_732);
    float _764 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _730);
    float _766 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _714);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _770 = 1.0 + _768;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _708);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _710);
    float _776 = -_716;
    float _778 = _776 + 1.0;
    float _780 = floor(_760);
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    bool _784 = _724 > 0.5;
    float _786 = in.m_37.x;
    float _788 = in.m_37.y;
    float _790 = in.m_37.z;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _796 = _716;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (_728)
    {
        float _800 = _784 ? _778 : _716;
        _796 = _800;
    }
    float _802 = _796;
    float _804 = 1.0 / _770;
    float _806 = -_762;
    float _808 = _806 + 1.0;
    bool _810 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _818 = _814 || _816;
    float _820 = _818 ? _808 : 0.0;
    bool _822 = _780 > 0.0;
    float _824 = 1.0 / _794;
    bool _826 = _780 >= 0.0;
    bool _828 = isnan(_780);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _840 = _718 >= 0.0;
    bool _842 = isnan(_718);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    int _850 = _834 ? 0 : 1;
    if (_756)
    {
        float _852 = _820 * _804;
        _114 = _852;
    }
    float _854 = _114;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _860 = _576 * _576;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _872 = _870 != 0;
    float _874 = 1.0 / _838;
    float _876 = _790 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _878 = fma(_578, _578, _860);
    int _880 = ~_850;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = _786 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _888 = !_868;
    int _890 = _888 ? 0 : 1;
    float _892 = fma(_580, _580, _878);
    bool _894 = _718 > 0.0;
    float _896 = 1.0 / _858;
    float _898 = _724 * 2.0;
    int _900 = _884;
    float _902 = _886;
    if (!_822)
    {
        int _904 = ~_850;
        int _906 = _904 + 1;
        _900 = _906;
    }
    int _908 = _900;
    float _910 = _788 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _912 = _848 ? 0 : 1;
    bool _914 = !_864;
    int _916 = _914 ? 0 : 1;
    float _918 = floor(_898);
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _930 = _928 != 0;
    int _932 = ~_912;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = _936;
    if (!_894)
    {
        int _940 = ~_912;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    float _946 = rsqrt(_892);
    bool _948 = !_872;
    int _950 = _948 ? 0 : 1;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _952;
    bool _956 = !_930;
    int _958 = _956 ? 0 : 1;
    float _960 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[5].z, _764);
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _964 = _962 != 0;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _972 = _970 != 0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _978 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[4].z, _758);
    float _980 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[6].z, _766);
    float _982 = _954 * _824;
    bool _984 = !_964;
    int _986 = _984 ? 0 : 1;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _988;
    bool _992 = _918 >= 0.0;
    bool _994 = isnan(_918);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    float _1002 = _976 * _874;
    float _1004 = _724 + _700;
    float _1006 = _946 * _576;
    float _1008 = _990 * _896;
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _1012 = _1000 ? 0 : 1;
    float _1014 = _946 * _578;
    bool _1016 = _918 > 0.0;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1020 = _946 * _580;
    float _1022 = _1004 + (-1.0);
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1018);
    float _1026 = _854 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _1028 = ~_1012;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1036 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1024);
    float _1038 = _582 + _724;
    float _1040 = _724 + (-0.5);
    int _1042 = _1032;
    float _1044 = _1006;
    if (!_1016)
    {
        int _1046 = ~_1012;
        int _1048 = _1046 + 1;
        _1042 = _1048;
    }
    int _1050 = _1042;
    float _1052 = _1026 * _1010;
    float _1054 = abs(_1036);
    bool _1056 = _1054 > 0.99989998340606689453125;
    float _1058 = _582 + _700;
    float _1060 = _1038 + (-1.0);
    float _1062 = _854 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _1064 = _1058 + (-1.0);
    float _1066 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1052);
    float _1068 = _1062 * _746;
    float _1070 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1072 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1074 = _886 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1076 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1068);
    if (_1056)
    {
        _902 = 0.001000000047497451305389404296875;
    }
    float _1078 = _902;
    float _1080 = floor(_1066);
    float _1082 = 0.0;
    if (!_1056)
    {
        _1082 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1084 = _1082;
    float _1086 = _1074 * _772;
    float _1088 = _1084;
    if (!_1056)
    {
        _798 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1090 = _798;
    float _1092 = _1090;
    if (_1056)
    {
        float _1094 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1088 = _1094;
    }
    float _1096 = _1088;
    bool _1098 = !_968;
    int _1100 = _1098 ? 0 : 1;
    if (_1056)
    {
        float _1102 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1092 = _1102;
    }
    float _1104 = _1092;
    float _1106 = 0.0;
    if (!_1056)
    {
        _1106 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1108 = _1106;
    float _1110 = floor(_1076);
    float _1112 = _1108;
    if (_1056)
    {
        float _1114 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = _1076 + 0.25;
    float _1120 = in.m_47.x;
    float _1122 = in.m_47.y;
    float _1124 = in.m_47.z;
    bool _1126 = !_972;
    int _1128 = _1126 ? 0 : 1;
    float _1130 = _1066 + 0.25;
    int _1132 = abs(_1100);
    float _1134 = _700 + (-0.5);
    float _1136 = floor(_1118);
    int _1138 = abs(_1128);
    float _1140 = -_1080;
    float _1142 = _1066 + _1140;
    float _1144 = float(_908);
    float _1146 = _1066 * 6.283185482025146484375;
    float _1148 = _960 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1150 = floor(_1130);
    float _1152 = float(_944);
    float _1154 = -_1110;
    float _1156 = _1076 + _1154;
    float _1158 = float(_1132);
    float _1160 = _1146 * 0.15915493667125701904296875;
    float _1162 = float(_1050);
    float _1164 = _1076 * 6.283185482025146484375;
    float _1166 = float(_1138);
    float _1168 = _1158 * _1152;
    bool _1170 = _1156 >= 0.5;
    bool _1172 = isnan(_1156);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.5);
    bool _1178 = _1174 || _1176;
    float _1180 = -_1116;
    float _1182 = _1006 * _1180;
    bool _1184 = _1142 >= 0.5;
    bool _1186 = isnan(_1142);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan(0.5);
    bool _1192 = _1188 || _1190;
    float _1194 = _1166 * _1162;
    float _1196 = -_1136;
    float _1198 = _1118 + _1196;
    float _1200 = _1168 * (-2.0);
    float _1202 = -_1096;
    float _1204 = _1014 * _1202;
    float _1206 = -_1150;
    float _1208 = _1130 + _1206;
    float _1210 = -_1104;
    float _1212 = _1020 * _1210;
    float _1214 = fma(_1034, _1200, _1034);
    float _1216 = fma(_1200, _1122, _1122);
    float _1218 = -_1096;
    float _1220 = -_1182;
    float _1222 = fma(_1020, _1218, _1220);
    int _1224 = abs(_890);
    float _1226 = -_1104;
    float _1228 = -_1204;
    float _1230 = fma(_1006, _1226, _1228);
    bool _1232 = !_926;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = _1160 * 6.283185482025146484375;
    float _1238 = sin(_1236);
    bool _1240 = !_1192;
    float _1242 = _1240 ? 0.5 : (-0.5);
    float _1244 = -_1116;
    float _1246 = -_1212;
    float _1248 = fma(_1014, _1244, _1246);
    bool _1250 = _1208 > 0.5;
    float _1252 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1216);
    int _1254 = abs(_1234);
    float _1256 = _1164 * 0.15915493667125701904296875;
    float _1258 = float(_1224);
    float _1260 = fma(_1214, _854, _1252);
    bool _1262 = !_1178;
    float _1264 = _1262 ? 0.5 : (-0.5);
    float _1266 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1268 = _1266 * 2.0;
    float _1270 = float(_1254);
    float _1272 = _1256 * 6.283185482025146484375;
    float _1274 = sin(_1272);
    int _1276 = abs(_986);
    float _1278 = _1258 * _1268;
    int _1280 = abs(_916);
    float _1282 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1284 = _1282 * 2.0;
    bool _1286 = !_922;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = _1208;
    float _1292 = _1198;
    if (_1250)
    {
        float _1294 = -_1208;
        float _1296 = _1294 + 1.0;
        _1290 = _1296;
    }
    float _1298 = _1290;
    bool _1300 = _1198 > 0.5;
    float _1302 = _1270 * _1284;
    int _1304 = abs(_950);
    float _1306 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1308 = float(_1280);
    float _1310 = fma(_1298, 4.0, -1.0);
    float _1312 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1314 = _1260 * 0.15915493667125701904296875;
    int _1316 = abs(_1288);
    float _1318 = fma(_1308, _1306, _1278);
    float _1320 = _1312 * _582;
    float _1322 = float(_1276);
    float _1324 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1326 = float(_1304);
    if (_1300)
    {
        float _1328 = -_1198;
        float _1330 = _1328 + 1.0;
        _1292 = _1330;
    }
    float _1332 = _1292;
    float _1334 = _1322 * _1144;
    float _1336 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1338 = fma(_1326, _1324, _1318);
    float _1340 = fma(_1332, 4.0, -1.0);
    float _1342 = _1334 * (-2.0);
    int _1344 = abs(_958);
    float _1346 = fma(_1338, 3.1415927410125732421875, _1120);
    float _1348 = float(_1316);
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1352 = _1248 * _1248;
    float _1354 = fma(_1346, _1342, _1346);
    float _1356 = fma(_1348, _1336, _1302);
    float _1358 = _582 + (-0.5);
    float _1360 = fma(_1072, _1342, _1072);
    float _1362 = float(_1344);
    float _1364 = fma(_1222, _1222, _1352);
    float _1366 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1354);
    float _1368 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1370 = _1194 * (-2.0);
    float _1372 = fma(_1362, _1350, _1356);
    float _1374 = fma(_1360, _854, _1366);
    float _1376 = _1368 * _774;
    float _1378 = _876 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1380 = fma(_1372, 3.1415927410125732421875, _1124);
    bool _1382 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1384 = isnan(_698);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = trunc(_1320);
    int _1396 = int(_1394);
    float _1398 = _1378 * _782;
    float _1400 = fma(_1380, _1370, _1380);
    float _1402 = fma(_1070, _1370, _1070);
    bool _1404 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1406 = isnan(_698);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = -_1392;
    float _1418 = _1416 + 1.0;
    float _1420 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1400);
    float _1422 = _1374 * 0.15915493667125701904296875;
    bool _1424 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1426 = isnan(_698);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = fma(_1230, _1230, _1364);
    float _1438 = fma(_1402, _854, _1420);
    float _1440 = _1414 * _1418;
    float _1442 = -_1414;
    float _1444 = _1442 + 1.0;
    bool _1446 = _582 > 0.5;
    bool _1448 = _1446 && _722;
    float _1450 = _1438 * 0.15915493667125701904296875;
    float _1452 = rsqrt(_1436);
    float _1454 = _1434 * _1444;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1458 = _698 + _1456;
    float _1460 = -_1434;
    float _1462 = _1460 + 1.0;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1466 = _698 + _1464;
    bool _1468 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1470 = isnan(_698);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1482 = _698 + _1480;
    float _1484 = fma(_1002, _1458, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1486 = _1314 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    int _1490 = _1396 << 4;
    int _1492 = _1490 + 1968;
    float _1494 = fma(_982, _1466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1496 = _1478 * _1462;
    float _1498 = fma(_1008, _1482, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1500 = _1492 + 8;
    uint _1503 = uint(int(uint(_1500) >> uint(2)));
    uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
    int _1507 = int(_1503) & 3;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[int(_1505)][_1507];
    float _1511 = _1494 * _1496;
    float _1513 = _1314 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = _1230 * _1452;
    float _1519 = _1222 * _1452;
    float _1521 = _1248 * _1452;
    uint _1523 = uint(int(uint(_1492) >> uint(2)));
    uint _1525 = uint(int(uint(int(_1523)) >> uint(2)));
    int _1527 = int(_1523) & 3;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[int(_1525)][_1527];
    int _1531 = int(_1523) + 1;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    int _1535 = _1531 & 3;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[int(_1533)][_1535];
    float _1539 = _1014 * _1521;
    float _1541 = _1422 * 6.283185482025146484375;
    float _1543 = sin(_1541);
    float _1545 = -_1539;
    float _1547 = fma(_1006, _1519, _1545);
    float _1549 = _1422 * 6.283185482025146484375;
    float _1551 = cos(_1549);
    float _1553 = _1450 * 6.283185482025146484375;
    float _1555 = cos(_1553);
    float _1557 = _1543 * _1488;
    float _1559 = _1543 * _1515;
    float _1561 = _1450 * 6.283185482025146484375;
    float _1563 = sin(_1561);
    float _1565 = _1551 * _1515;
    float _1567 = _1551 * _1488;
    float _1569 = _1543 * _1555;
    float _1571 = _1515 * _1555;
    float _1573 = _1551 * _1555;
    float _1575 = _1488 * _1555;
    float _1577 = _1573 * _1020;
    float _1579 = fma(_1563, _1565, _1557);
    float _1581 = fma(_1563, _1557, _1565);
    float _1583 = -_1567;
    float _1585 = fma(_1563, _1559, _1583);
    float _1587 = -_1559;
    float _1589 = fma(_1563, _1567, _1587);
    float _1591 = _1006 * _1517;
    float _1593 = _1573 * _1014;
    float _1595 = _1579 * _1014;
    float _1597 = _1589 * _1014;
    float _1599 = -_1591;
    float _1601 = fma(_1020, _1521, _1599);
    float _1603 = -_1563;
    float _1605 = fma(_1603, _1519, _1593);
    float _1607 = _1579 * _1020;
    float _1609 = fma(_1571, _1519, _1595);
    float _1611 = fma(_1575, _1519, _1597);
    float _1613 = -_1563;
    float _1615 = fma(_1613, _1517, _1577);
    float _1617 = fma(_1569, _1601, _1605);
    float _1619 = fma(_1571, _1517, _1607);
    float _1621 = fma(_1585, _1601, _1609);
    float _1623 = fma(_1581, _1601, _1611);
    float _1625 = _1589 * _1020;
    float _1627 = fma(_1569, _1547, _1615);
    float _1629 = _1376 * _1617;
    float _1631 = fma(_1585, _1547, _1619);
    float _1633 = fma(_1575, _1517, _1625);
    float _1635 = _1376 * _1627;
    float _1637 = fma(_1086, _1621, _1629);
    float _1639 = _978 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1641 = fma(_1581, _1547, _1633);
    float _1643 = fma(_1086, _1631, _1635);
    float _1645 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1647 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1649 = fma(_1398, _1623, _1637);
    float _1651 = fma(_1398, _1641, _1643);
    float _1653 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1645);
    float _1655 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1647);
    float _1657 = _1639 + _1649;
    float _1659 = _980 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1661 = -_1478;
    float _1663 = _1661 + 1.0;
    float _1665 = _1509 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1669 = _1657 + _1667;
    float _1671 = _1659 + _1651;
    float _1673 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1511);
    float _1675 = in.m_43.x;
    float _1677 = _1020 * _1519;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1681 = _1671 + _1679;
    float _1683 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1685 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1687 = fma(_1484, _1454, _1673);
    float _1689 = _1681 * _1681;
    float _1691 = _1573 * _1006;
    float _1693 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1655);
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = fma(_1669, _1669, _1689);
    float _1699 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1701 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = -_1677;
    float _1705 = fma(_1014, _1517, _1703);
    float _1707 = sqrt(_1697);
    float _1709 = _1579 * _1006;
    float _1711 = -_1563;
    float _1713 = fma(_1711, _1521, _1691);
    float _1715 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_49.x = _1695;
    out.m_49.y = _1699;
    out.m_49.z = _1701;
    float _1717 = _1589 * _1006;
    float _1719 = fma(_1571, _1521, _1709);
    float _1721 = fma(_1569, _1705, _1713);
    float _1723 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1653);
    float _1725 = fma(_1575, _1521, _1717);
    float _1727 = fma(_1585, _1705, _1719);
    float _1729 = _1376 * _1721;
    float _1731 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1733 = fma(_1581, _1705, _1725);
    float _1735 = _1675;
    float _1737 = _1657;
    float _1739 = _1671;
    if (_722)
    {
        _1044 = _1675;
    }
    float _1741 = _1044;
    float _1743 = fma(_1086, _1727, _1729);
    float _1745 = 1.0 / _1715;
    bool _1747 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1749 = _1731 + _1715;
    float _1751 = fma(_1398, _1733, _1743);
    float _1753 = _1741;
    if (_1448)
    {
        float _1755 = -_1741;
        float _1757 = _1755 + 1.0;
        _1753 = _1757;
    }
    float _1759 = _1753;
    float _1761 = fma(_1498, _1440, _1687);
    float _1763 = _1148 + _1751;
    float _1765 = _1759;
    if (_722)
    {
        _1735 = _1759;
    }
    float _1767 = _1735;
    float _1769 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1761);
    if (!_1747)
    {
        _1765 = _1763;
    }
    float _1771 = _1765;
    float _1773 = _1749 * _1745;
    float _1775 = _1773 * 0.5;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1779 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1777);
    bool _1781 = !_1747;
    float _1783 = _1771;
    float _1785 = _1745;
    if (!_1781)
    {
        float _1787 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1791 = _1707 + _1789;
        float _1793 = _1763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1795 = rsqrt(_1697);
        float _1797 = _1791 * _1787;
        float _1799 = _1797 * 0.15915493667125701904296875;
        float _1801 = _1799 * 6.283185482025146484375;
        float _1803 = sin(_1801);
        float _1805 = _1799 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        float _1809 = fma(_1803, _1793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1811 = _1795 * _1809;
        float _1813 = _1807 + (-1.0);
        float _1815 = fma(_1669, _1811, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1817 = fma(_1681, _1811, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1819 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1821 = fma(_1763, _1807, _1819);
        _1783 = _1821;
        _1737 = _1815;
        _1739 = _1817;
        _1785 = _1819;
    }
    float _1823 = _1783;
    float _1825 = _1737;
    float _1827 = _1739;
    float _1829 = _1785;
    float _1831 = 1.0 / _1779;
    float _1833 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1837 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1839 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1841 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1833);
    float _1843 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1835);
    float _1845 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1837);
    float _1847 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1839);
    float _1849 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1841);
    float _1851 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1843);
    float _1853 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1845);
    float _1855 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1847);
    float _1857 = _1843;
    float _1859 = _1829;
    if (_744)
    {
        _1857 = 1.0;
    }
    float _1861 = _1857;
    float _1863 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1865 = _1861;
    if (_744)
    {
        _1859 = 1.0;
    }
    float _1867 = _1859;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1871 = _1831 * _1869;
    float _1873 = _1867;
    if (!_744)
    {
        float _1875 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1877 = _1875 * 0.15915493667125701904296875;
        float _1879 = _1877 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        float _1883 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1885 = _1883 * 0.15915493667125701904296875;
        float _1887 = _1877 * 6.283185482025146484375;
        float _1889 = sin(_1887);
        float _1891 = 1.0 / _1881;
        float _1893 = _1885 * 6.283185482025146484375;
        float _1895 = cos(_1893);
        float _1897 = _1889 * _1891;
        float _1899 = _1885 * 6.283185482025146484375;
        float _1901 = sin(_1899);
        float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1903;
        float _1907 = _1895 * _1897;
        float _1909 = 1.0 / _1905;
        float _1911 = 1.0 / _1907;
        float _1913 = _1901 * _1911;
        float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1917 = fma(_1871, _1913, _1915);
        float _1919 = _1917 * _1909;
        float _1921 = precise::clamp(_1919, 0.0, 1.0);
        _1865 = _1921;
    }
    float _1923 = _1865;
    if (!_744)
    {
        float _1925 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1927 = _1925 * 0.15915493667125701904296875;
        float _1929 = _1927 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = _1927 * 6.283185482025146484375;
        float _1939 = sin(_1937);
        float _1941 = 1.0 / _1931;
        float _1943 = _1935 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1939 * _1941;
        float _1949 = _1935 * 6.283185482025146484375;
        float _1951 = sin(_1949);
        float _1953 = _1945 * _1947;
        float _1955 = 1.0 / _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1959 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1957;
        float _1961 = 1.0 / _1959;
        float _1963 = _1951 * _1955;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1967 = fma(_1871, _1963, _1965);
        float _1969 = _1967 * _1961;
        float _1971 = precise::clamp(_1969, 0.0, 1.0);
        float _1973 = -_1971;
        float _1975 = _1973 + 1.0;
        _1873 = _1975;
    }
    float _1977 = _1873;
    bool _1979 = _1923 > 0.0;
    bool _1981 = isnan(_1923);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan(0.0);
    bool _1987 = _1983 || _1985;
    float _1989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1991 = _1923 * _1977;
    float _1993 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1995 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1997 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1999 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2001 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2003 = _1977 <= 0.0;
    bool _2005 = !_1987;
    bool _2007 = _2003 || _2005;
    float _2009 = _1991 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2011 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1999);
    float _2013 = _1853 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2015 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1995);
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1997);
    float _2019 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2001);
    float _2021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2023 = _670 * _2009;
    float _2025 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2011);
    float _2027 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2029 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2015);
    float _2031 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2017);
    float _2033 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2019);
    float _2035 = _802 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2037 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2025);
    float _2039 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2033);
    float _2041 = _2035 * _1989;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2047 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2029);
    float _2049 = _1769 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2051 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2055 = _2037 + _2039;
    float _2057 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2031);
    float _2059 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2061 = _2051 * _2021;
    float _2063 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2065 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2067 = _2023 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2069 = _2055 * 0.5;
    out.m_51.x = _2061;
    out.m_51.y = _2041;
    out.m_53.x = _2059;
    out.m_53.y = _2063;
    out.m_53.z = _2065;
    out.m_53.w = _2049;
    out.m_33.x = _2067;
    out.gl_Position.x = _2047;
    out.gl_Position.y = _2057;
    out.gl_Position.z = _2037;
    out.gl_Position.w = _2039;
    out.m_55.z = _2069;
    out.m_55.w = _2039;
    if (!_2007)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _2071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2071;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _690 = false;
    bool _454 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_30.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_33.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2128 = as_type<float>(_90);
        out.gl_Position.z = _2128;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _94 = in.m_35.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = 0.0;
    float _112 = 0.0;
    float _114 = _108;
    if (_104)
    {
        float _116 = float(_74);
        _110 = _116;
    }
    float _118 = _110;
    bool _120 = _108 >= _118;
    bool _122 = !_104;
    bool _124 = _120 || _122;
    if (_124)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _84;
    if (_124)
    {
        out.m_33.x = 0.0;
    }
    if (_124)
    {
        float _128 = _126 * 5.0;
        _92 = as_type<int>(_128);
    }
    int _130 = _92;
    float _132 = as_type<float>(_130);
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2199 = as_type<float>(_130);
        out.gl_Position.z = _2199;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_35.x;
    float _136 = in.m_35.y;
    float _138 = in.m_35.z;
    float _140 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = _140;
    if (!_150)
    {
        float _154 = _140 * _140;
        float _156 = _154 * 0.5;
        _132 = _156;
    }
    float _158 = _132;
    float _160 = 0.0;
    float _162 = _158;
    if (!_150)
    {
        float _164 = _108 * _108;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    if (!_150)
    {
        float _170 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _170;
    }
    float _172 = _162;
    bool _174 = !_150;
    float _176 = _172;
    float _178 = 0.0;
    if (!_174)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _140 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _140);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _112 = _196;
        _176 = _208;
        _178 = _198;
    }
    float _210 = _112;
    float _212 = _176;
    float _214 = _178;
    bool _216 = !_150;
    float _218 = _210;
    float _220 = _214;
    if (!_216)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _140 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _218 = _234;
        _220 = _228;
        _152 = _240;
    }
    float _242 = _218;
    float _244 = _220;
    float _246 = _152;
    float _248 = _244;
    float _250 = _242;
    if (!_150)
    {
        _248 = _108;
    }
    float _252 = _248;
    float _254 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _252;
    if (!_150)
    {
        float _258 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _258;
    }
    float _260 = _250;
    bool _262 = !_150;
    float _264 = _260;
    if (!_262)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = _108 * _268;
        float _278 = 1.0 / _272;
        float _280 = _274 * 0.693147182464599609375;
        float _282 = exp2(_276);
        float _284 = 1.0 / _280;
        float _286 = _282 + (-1.0);
        float _288 = -_286;
        float _290 = fma(_288, _284, _108);
        float _292 = _290 * _278;
        float _294 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _294;
    }
    float _296 = _264;
    bool _298 = !_150;
    if (!_298)
    {
        float _300 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = log2(_300);
        float _304 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _306 = _304 + 1.0;
        float _308 = 1.0 / _306;
        float _310 = _108 * _302;
        float _312 = exp2(_310);
        float _314 = -_312;
        float _316 = _314 + 1.0;
        float _318 = _316 * _308;
        _256 = _318;
    }
    float _320 = _256;
    float _322 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _324 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _326 = fma(_246, _136, _254);
    float _328 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _330 = fma(_320, _136, _322);
    float _332 = fma(_246, _134, _324);
    float _334 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = fma(_320, _134, _328);
    float _338 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _340 = -_330;
    float _342 = _326 + _340;
    float _344 = fma(_320, _138, _334);
    float _346 = -_336;
    float _348 = _332 + _346;
    float _350 = fma(_246, _138, _338);
    float _352 = _342 * _342;
    float _354 = in.m_37.w;
    float _356 = _342 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _358 = -_344;
    float _360 = _350 + _358;
    float _362 = fma(_348, _348, _352);
    float _364 = _342 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _366 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _356);
    float _368 = _342 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _370 = fma(_360, _360, _362);
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _364);
    float _374 = in.m_30.x;
    float _376 = in.m_30.y;
    float _378 = in.m_30.z;
    float _380 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _366);
    float _382 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _368);
    float _384 = sqrt(_370);
    float _386 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _372);
    float _388 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    bool _390 = _384 >= 9.9999999747524270787835121154785e-07;
    bool _392 = isnan(_384);
    bool _394 = _390 || _392;
    bool _396 = isnan(9.9999999747524270787835121154785e-07);
    bool _398 = _394 || _396;
    float _400 = fma(_332, _354, _374);
    float _402 = fma(_350, _354, _378);
    float _404 = fma(_326, _354, _376);
    float _406 = _350;
    float _408 = _386;
    float _410 = _388;
    if (_398)
    {
        _406 = _380;
    }
    float _412 = _406;
    float _414 = _412;
    if (!_398)
    {
        bool _416 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _418 = !_416;
        if (!_418)
        {
            float _420 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _422 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _424 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _426 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _420);
            float _428 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _422);
            float _430 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _424);
            float _432 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _426);
            float _434 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _428);
            float _436 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _430);
            float _438 = _432 * _432;
            float _440 = fma(_434, _434, _438);
            float _442 = fma(_436, _436, _440);
            float _444 = rsqrt(_442);
            float _446 = _444 * 9.9999999747524270787835121154785e-07;
            float _448 = _434 * _446;
            float _450 = _432 * _446;
            float _452 = _436 * _446;
            _408 = _450;
            _414 = _448;
            _410 = _452;
            _454 = true;
        }
        else
        {
            float _456 = _136 * _136;
            float _458 = fma(_134, _134, _456);
            float _460 = fma(_138, _138, _458);
            float _462 = sqrt(_460);
            bool _464 = _462 >= 9.9999999747524270787835121154785e-07;
            bool _466 = isnan(_462);
            bool _468 = _464 || _466;
            bool _470 = isnan(9.9999999747524270787835121154785e-07);
            bool _472 = _468 || _470;
            if (!_472)
            {
                float _474 = _376 * _376;
                float _476 = fma(_374, _374, _474);
                float _478 = fma(_378, _378, _476);
                float _480 = sqrt(_478);
                bool _482 = _480 >= 9.9999999747524270787835121154785e-07;
                bool _484 = isnan(_480);
                bool _486 = _482 || _484;
                bool _488 = isnan(9.9999999747524270787835121154785e-07);
                bool _490 = _486 || _488;
                if (!_490)
                {
                    float _492 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _494 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _492);
                    float _496 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _494);
                    float _498 = rsqrt(_496);
                    float _500 = _498 * 9.9999999747524270787835121154785e-07;
                    float _502 = _500 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _504 = _500 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _506 = _500 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _408 = _504;
                    _414 = _502;
                    _410 = _506;
                    _454 = true;
                }
                else
                {
                    float _508 = _376 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _510 = _376 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _512 = _376 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _514 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].x, _508);
                    float _516 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
                    float _518 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].x, _512);
                    float _520 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].z, _514);
                    float _522 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].z, _516);
                    float _524 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].z, _518);
                    float _526 = _520 * _520;
                    float _528 = fma(_522, _522, _526);
                    float _530 = fma(_524, _524, _528);
                    float _532 = rsqrt(_530);
                    float _534 = _532 * 9.9999999747524270787835121154785e-07;
                    float _536 = _522 * _534;
                    float _538 = _520 * _534;
                    float _540 = _524 * _534;
                    _408 = _538;
                    _414 = _536;
                    _410 = _540;
                    _454 = true;
                }
            }
            else
            {
                float _542 = _136 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _544 = _136 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _546 = _136 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _548 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[5].x, _542);
                float _550 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[4].x, _544);
                float _552 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[6].x, _546);
                float _554 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[5].z, _548);
                float _556 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
                float _558 = fma(_138, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
                float _560 = _554 * _554;
                float _562 = fma(_556, _556, _560);
                float _564 = fma(_558, _558, _562);
                float _566 = rsqrt(_564);
                float _568 = _566 * 9.9999999747524270787835121154785e-07;
                float _570 = _556 * _568;
                float _572 = _554 * _568;
                float _574 = _558 * _568;
                _408 = _572;
                _414 = _570;
                _410 = _574;
            }
        }
    }
    _454 = false;
    float _576 = _408;
    float _578 = _414;
    float _580 = _410;
    float _582 = in.m_39.x;
    float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _586 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _594 = _592 != 0;
    int _596 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _598 = _596 != 0;
    float _600 = _586 * _584;
    float _602 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[20].x, _600);
    float _604 = _602 * 6.283185482025146484375;
    float _606 = floor(_602);
    float _608 = _604 * 0.15915493667125701904296875;
    bool _610 = !_590;
    int _612 = _610 ? 0 : 1;
    int _614 = abs(_612);
    float _616 = _608 * 6.283185482025146484375;
    float _618 = cos(_616);
    bool _620 = !_598;
    int _622 = _620 ? 0 : 1;
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _626 = abs(_622);
    float _628 = -_606;
    float _630 = _602 + _628;
    bool _632 = !_594;
    int _634 = _632 ? 0 : 1;
    float _636 = float(_614);
    int _638 = abs(_634);
    float _640 = -_630;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _644 = fma(_618, 0.5, 0.5);
    float _646 = abs(_642);
    float _648 = _636 * _646;
    bool _650 = _630 < 0.5;
    float _652 = float(_650);
    float _654 = float(_626);
    float _656 = -_644;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _660 = float(_638);
    float _662 = -_652;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _666 = fma(_654, _658, _648);
    float _668 = abs(_664);
    float _670 = fma(_660, _668, _666);
    bool _672 = !_624;
    float _688;
    if (!_672)
    {
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _676 = _582 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        float _692 = float(_74);
        float _694 = 1.0 / _692;
        float _696 = _108 * _694;
        _688 = _696;
    }
    _690 = false;
    float _698 = _688;
    float _700 = in.m_39.z;
    float _702 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _704 = log2(_702);
    float _706 = _582 * 2.0;
    float _708 = in.m_41.x;
    float _710 = in.m_41.y;
    float _712 = in.m_41.z;
    float _714 = _404 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _716 = in.m_43.y;
    float _718 = floor(_706);
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = in.m_39.y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _728 = _726 != 0;
    float _730 = _404 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _732 = _704 * _108;
    float _734 = _404 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _736 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _738 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _740 = _736 || _738;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _748 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _750 = isnan(1.0);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _756 = _752 || _754;
    float _758 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _734);
    float _760 = _700 * 2.0;
    float _762 = exp2(_732);
    float _764 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _730);
    float _766 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _714);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _770 = 1.0 + _768;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _708);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _710);
    float _776 = -_716;
    float _778 = _776 + 1.0;
    float _780 = floor(_760);
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    bool _784 = _724 > 0.5;
    float _786 = in.m_37.x;
    float _788 = in.m_37.y;
    float _790 = in.m_37.z;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _796 = _716;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (_728)
    {
        float _800 = _784 ? _778 : _716;
        _796 = _800;
    }
    float _802 = _796;
    float _804 = 1.0 / _770;
    float _806 = -_762;
    float _808 = _806 + 1.0;
    bool _810 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _818 = _814 || _816;
    float _820 = _818 ? _808 : 0.0;
    bool _822 = _780 > 0.0;
    float _824 = 1.0 / _794;
    bool _826 = _780 >= 0.0;
    bool _828 = isnan(_780);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _840 = _718 >= 0.0;
    bool _842 = isnan(_718);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.0);
    bool _848 = _844 || _846;
    int _850 = _834 ? 0 : 1;
    if (_756)
    {
        float _852 = _820 * _804;
        _114 = _852;
    }
    float _854 = _114;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _860 = _576 * _576;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _872 = _870 != 0;
    float _874 = 1.0 / _838;
    float _876 = _790 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _878 = fma(_578, _578, _860);
    int _880 = ~_850;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = _786 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _888 = !_868;
    int _890 = _888 ? 0 : 1;
    float _892 = fma(_580, _580, _878);
    bool _894 = _718 > 0.0;
    float _896 = 1.0 / _858;
    float _898 = _724 * 2.0;
    int _900 = _884;
    float _902 = _886;
    if (!_822)
    {
        int _904 = ~_850;
        int _906 = _904 + 1;
        _900 = _906;
    }
    int _908 = _900;
    float _910 = _788 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _912 = _848 ? 0 : 1;
    bool _914 = !_864;
    int _916 = _914 ? 0 : 1;
    float _918 = floor(_898);
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _930 = _928 != 0;
    int _932 = ~_912;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = _936;
    if (!_894)
    {
        int _940 = ~_912;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    float _946 = rsqrt(_892);
    bool _948 = !_872;
    int _950 = _948 ? 0 : 1;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _952;
    bool _956 = !_930;
    int _958 = _956 ? 0 : 1;
    float _960 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[5].z, _764);
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _964 = _962 != 0;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _972 = _970 != 0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _978 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[4].z, _758);
    float _980 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[6].z, _766);
    float _982 = _954 * _824;
    bool _984 = !_964;
    int _986 = _984 ? 0 : 1;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _988;
    bool _992 = _918 >= 0.0;
    bool _994 = isnan(_918);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    float _1002 = _976 * _874;
    float _1004 = _724 + _700;
    float _1006 = _946 * _576;
    float _1008 = _990 * _896;
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _1012 = _1000 ? 0 : 1;
    float _1014 = _946 * _578;
    bool _1016 = _918 > 0.0;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1020 = _946 * _580;
    float _1022 = _1004 + (-1.0);
    float _1024 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1018);
    float _1026 = _854 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _1028 = ~_1012;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1036 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1024);
    float _1038 = _582 + _724;
    float _1040 = _724 + (-0.5);
    int _1042 = _1032;
    float _1044 = _1006;
    if (!_1016)
    {
        int _1046 = ~_1012;
        int _1048 = _1046 + 1;
        _1042 = _1048;
    }
    int _1050 = _1042;
    float _1052 = _1026 * _1010;
    float _1054 = abs(_1036);
    bool _1056 = _1054 > 0.99989998340606689453125;
    float _1058 = _582 + _700;
    float _1060 = _1038 + (-1.0);
    float _1062 = _854 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _1064 = _1058 + (-1.0);
    float _1066 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1052);
    float _1068 = _1062 * _746;
    float _1070 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1072 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1074 = _886 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1076 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1068);
    if (_1056)
    {
        _902 = 0.001000000047497451305389404296875;
    }
    float _1078 = _902;
    float _1080 = floor(_1066);
    float _1082 = 0.0;
    if (!_1056)
    {
        _1082 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1084 = _1082;
    float _1086 = _1074 * _772;
    float _1088 = _1084;
    if (!_1056)
    {
        _798 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1090 = _798;
    float _1092 = _1090;
    if (_1056)
    {
        float _1094 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1088 = _1094;
    }
    float _1096 = _1088;
    bool _1098 = !_968;
    int _1100 = _1098 ? 0 : 1;
    if (_1056)
    {
        float _1102 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1092 = _1102;
    }
    float _1104 = _1092;
    float _1106 = 0.0;
    if (!_1056)
    {
        _1106 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1108 = _1106;
    float _1110 = floor(_1076);
    float _1112 = _1108;
    if (_1056)
    {
        float _1114 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = _1076 + 0.25;
    float _1120 = in.m_47.x;
    float _1122 = in.m_47.y;
    float _1124 = in.m_47.z;
    bool _1126 = !_972;
    int _1128 = _1126 ? 0 : 1;
    float _1130 = _1066 + 0.25;
    int _1132 = abs(_1100);
    float _1134 = _700 + (-0.5);
    float _1136 = floor(_1118);
    int _1138 = abs(_1128);
    float _1140 = -_1080;
    float _1142 = _1066 + _1140;
    float _1144 = float(_908);
    float _1146 = _1066 * 6.283185482025146484375;
    float _1148 = _960 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1150 = floor(_1130);
    float _1152 = float(_944);
    float _1154 = -_1110;
    float _1156 = _1076 + _1154;
    float _1158 = float(_1132);
    float _1160 = _1146 * 0.15915493667125701904296875;
    float _1162 = float(_1050);
    float _1164 = _1076 * 6.283185482025146484375;
    float _1166 = float(_1138);
    float _1168 = _1158 * _1152;
    bool _1170 = _1156 >= 0.5;
    bool _1172 = isnan(_1156);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.5);
    bool _1178 = _1174 || _1176;
    float _1180 = -_1116;
    float _1182 = _1006 * _1180;
    bool _1184 = _1142 >= 0.5;
    bool _1186 = isnan(_1142);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan(0.5);
    bool _1192 = _1188 || _1190;
    float _1194 = _1166 * _1162;
    float _1196 = -_1136;
    float _1198 = _1118 + _1196;
    float _1200 = _1168 * (-2.0);
    float _1202 = -_1096;
    float _1204 = _1014 * _1202;
    float _1206 = -_1150;
    float _1208 = _1130 + _1206;
    float _1210 = -_1104;
    float _1212 = _1020 * _1210;
    float _1214 = fma(_1034, _1200, _1034);
    float _1216 = fma(_1200, _1122, _1122);
    float _1218 = -_1096;
    float _1220 = -_1182;
    float _1222 = fma(_1020, _1218, _1220);
    int _1224 = abs(_890);
    float _1226 = -_1104;
    float _1228 = -_1204;
    float _1230 = fma(_1006, _1226, _1228);
    bool _1232 = !_926;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = _1160 * 6.283185482025146484375;
    float _1238 = sin(_1236);
    bool _1240 = !_1192;
    float _1242 = _1240 ? 0.5 : (-0.5);
    float _1244 = -_1116;
    float _1246 = -_1212;
    float _1248 = fma(_1014, _1244, _1246);
    bool _1250 = _1208 > 0.5;
    float _1252 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1216);
    int _1254 = abs(_1234);
    float _1256 = _1164 * 0.15915493667125701904296875;
    float _1258 = float(_1224);
    float _1260 = fma(_1214, _854, _1252);
    bool _1262 = !_1178;
    float _1264 = _1262 ? 0.5 : (-0.5);
    float _1266 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1268 = _1266 * 2.0;
    float _1270 = float(_1254);
    float _1272 = _1256 * 6.283185482025146484375;
    float _1274 = sin(_1272);
    int _1276 = abs(_986);
    float _1278 = _1258 * _1268;
    int _1280 = abs(_916);
    float _1282 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1284 = _1282 * 2.0;
    bool _1286 = !_922;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = _1208;
    float _1292 = _1198;
    if (_1250)
    {
        float _1294 = -_1208;
        float _1296 = _1294 + 1.0;
        _1290 = _1296;
    }
    float _1298 = _1290;
    bool _1300 = _1198 > 0.5;
    float _1302 = _1270 * _1284;
    int _1304 = abs(_950);
    float _1306 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1308 = float(_1280);
    float _1310 = fma(_1298, 4.0, -1.0);
    float _1312 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1314 = _1260 * 0.15915493667125701904296875;
    int _1316 = abs(_1288);
    float _1318 = fma(_1308, _1306, _1278);
    float _1320 = _1312 * _582;
    float _1322 = float(_1276);
    float _1324 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1326 = float(_1304);
    if (_1300)
    {
        float _1328 = -_1198;
        float _1330 = _1328 + 1.0;
        _1292 = _1330;
    }
    float _1332 = _1292;
    float _1334 = _1322 * _1144;
    float _1336 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1338 = fma(_1326, _1324, _1318);
    float _1340 = fma(_1332, 4.0, -1.0);
    float _1342 = _1334 * (-2.0);
    int _1344 = abs(_958);
    float _1346 = fma(_1338, 3.1415927410125732421875, _1120);
    float _1348 = float(_1316);
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1352 = _1248 * _1248;
    float _1354 = fma(_1346, _1342, _1346);
    float _1356 = fma(_1348, _1336, _1302);
    float _1358 = _582 + (-0.5);
    float _1360 = fma(_1072, _1342, _1072);
    float _1362 = float(_1344);
    float _1364 = fma(_1222, _1222, _1352);
    float _1366 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1354);
    float _1368 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1370 = _1194 * (-2.0);
    float _1372 = fma(_1362, _1350, _1356);
    float _1374 = fma(_1360, _854, _1366);
    float _1376 = _1368 * _774;
    float _1378 = _876 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1380 = fma(_1372, 3.1415927410125732421875, _1124);
    bool _1382 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1384 = isnan(_698);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = trunc(_1320);
    int _1396 = int(_1394);
    float _1398 = _1378 * _782;
    float _1400 = fma(_1380, _1370, _1380);
    float _1402 = fma(_1070, _1370, _1070);
    bool _1404 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1406 = isnan(_698);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = -_1392;
    float _1418 = _1416 + 1.0;
    float _1420 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1400);
    float _1422 = _1374 * 0.15915493667125701904296875;
    bool _1424 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1426 = isnan(_698);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = fma(_1230, _1230, _1364);
    float _1438 = fma(_1402, _854, _1420);
    float _1440 = _1414 * _1418;
    float _1442 = -_1414;
    float _1444 = _1442 + 1.0;
    bool _1446 = _582 > 0.5;
    bool _1448 = _1446 && _722;
    float _1450 = _1438 * 0.15915493667125701904296875;
    float _1452 = rsqrt(_1436);
    float _1454 = _1434 * _1444;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1458 = _698 + _1456;
    float _1460 = -_1434;
    float _1462 = _1460 + 1.0;
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1466 = _698 + _1464;
    bool _1468 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1470 = isnan(_698);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1482 = _698 + _1480;
    float _1484 = fma(_1002, _1458, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1486 = _1314 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    int _1490 = _1396 << 4;
    int _1492 = _1490 + 1968;
    float _1494 = fma(_982, _1466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1496 = _1478 * _1462;
    float _1498 = fma(_1008, _1482, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1500 = _1492 + 8;
    uint _1503 = uint(int(uint(_1500) >> uint(2)));
    uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
    int _1507 = int(_1503) & 3;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[int(_1505)][_1507];
    float _1511 = _1494 * _1496;
    float _1513 = _1314 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = _1230 * _1452;
    float _1519 = _1222 * _1452;
    float _1521 = _1248 * _1452;
    uint _1523 = uint(int(uint(_1492) >> uint(2)));
    uint _1525 = uint(int(uint(int(_1523)) >> uint(2)));
    int _1527 = int(_1523) & 3;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[int(_1525)][_1527];
    int _1531 = int(_1523) + 1;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    int _1535 = _1531 & 3;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[int(_1533)][_1535];
    float _1539 = _1014 * _1521;
    float _1541 = _1422 * 6.283185482025146484375;
    float _1543 = sin(_1541);
    float _1545 = -_1539;
    float _1547 = fma(_1006, _1519, _1545);
    float _1549 = _1422 * 6.283185482025146484375;
    float _1551 = cos(_1549);
    float _1553 = _1450 * 6.283185482025146484375;
    float _1555 = cos(_1553);
    float _1557 = _1543 * _1488;
    float _1559 = _1543 * _1515;
    float _1561 = _1450 * 6.283185482025146484375;
    float _1563 = sin(_1561);
    float _1565 = _1551 * _1515;
    float _1567 = _1551 * _1488;
    float _1569 = _1543 * _1555;
    float _1571 = _1515 * _1555;
    float _1573 = _1551 * _1555;
    float _1575 = _1488 * _1555;
    float _1577 = _1573 * _1020;
    float _1579 = fma(_1563, _1565, _1557);
    float _1581 = fma(_1563, _1557, _1565);
    float _1583 = -_1567;
    float _1585 = fma(_1563, _1559, _1583);
    float _1587 = -_1559;
    float _1589 = fma(_1563, _1567, _1587);
    float _1591 = _1006 * _1517;
    float _1593 = _1573 * _1014;
    float _1595 = _1579 * _1014;
    float _1597 = _1589 * _1014;
    float _1599 = -_1591;
    float _1601 = fma(_1020, _1521, _1599);
    float _1603 = -_1563;
    float _1605 = fma(_1603, _1519, _1593);
    float _1607 = _1579 * _1020;
    float _1609 = fma(_1571, _1519, _1595);
    float _1611 = fma(_1575, _1519, _1597);
    float _1613 = -_1563;
    float _1615 = fma(_1613, _1517, _1577);
    float _1617 = fma(_1569, _1601, _1605);
    float _1619 = fma(_1571, _1517, _1607);
    float _1621 = fma(_1585, _1601, _1609);
    float _1623 = fma(_1581, _1601, _1611);
    float _1625 = _1589 * _1020;
    float _1627 = fma(_1569, _1547, _1615);
    float _1629 = _1376 * _1617;
    float _1631 = fma(_1585, _1547, _1619);
    float _1633 = fma(_1575, _1517, _1625);
    float _1635 = _1376 * _1627;
    float _1637 = fma(_1086, _1621, _1629);
    float _1639 = _978 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1641 = fma(_1581, _1547, _1633);
    float _1643 = fma(_1086, _1631, _1635);
    float _1645 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1647 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1649 = fma(_1398, _1623, _1637);
    float _1651 = fma(_1398, _1641, _1643);
    float _1653 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1645);
    float _1655 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1647);
    float _1657 = _1639 + _1649;
    float _1659 = _980 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1661 = -_1478;
    float _1663 = _1661 + 1.0;
    float _1665 = _1509 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1669 = _1657 + _1667;
    float _1671 = _1659 + _1651;
    float _1673 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1511);
    float _1675 = in.m_43.x;
    float _1677 = _1020 * _1519;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1681 = _1671 + _1679;
    float _1683 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1685 = _1537 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1687 = fma(_1484, _1454, _1673);
    float _1689 = _1681 * _1681;
    float _1691 = _1573 * _1006;
    float _1693 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1655);
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = fma(_1669, _1669, _1689);
    float _1699 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1701 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = -_1677;
    float _1705 = fma(_1014, _1517, _1703);
    float _1707 = sqrt(_1697);
    float _1709 = _1579 * _1006;
    float _1711 = -_1563;
    float _1713 = fma(_1711, _1521, _1691);
    float _1715 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_49.x = _1695;
    out.m_49.y = _1699;
    out.m_49.z = _1701;
    float _1717 = _1589 * _1006;
    float _1719 = fma(_1571, _1521, _1709);
    float _1721 = fma(_1569, _1705, _1713);
    float _1723 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1653);
    float _1725 = fma(_1575, _1521, _1717);
    float _1727 = fma(_1585, _1705, _1719);
    float _1729 = _1376 * _1721;
    float _1731 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1733 = fma(_1581, _1705, _1725);
    float _1735 = _1675;
    float _1737 = _1657;
    float _1739 = _1671;
    if (_722)
    {
        _1044 = _1675;
    }
    float _1741 = _1044;
    float _1743 = fma(_1086, _1727, _1729);
    float _1745 = 1.0 / _1715;
    bool _1747 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1749 = _1731 + _1715;
    float _1751 = fma(_1398, _1733, _1743);
    float _1753 = _1741;
    if (_1448)
    {
        float _1755 = -_1741;
        float _1757 = _1755 + 1.0;
        _1753 = _1757;
    }
    float _1759 = _1753;
    float _1761 = fma(_1498, _1440, _1687);
    float _1763 = _1148 + _1751;
    float _1765 = _1759;
    if (_722)
    {
        _1735 = _1759;
    }
    float _1767 = _1735;
    float _1769 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1761);
    if (!_1747)
    {
        _1765 = _1763;
    }
    float _1771 = _1765;
    float _1773 = _1749 * _1745;
    float _1775 = _1773 * 0.5;
    float _1777 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1779 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1777);
    bool _1781 = !_1747;
    float _1783 = _1771;
    float _1785 = _1745;
    if (!_1781)
    {
        float _1787 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1791 = _1707 + _1789;
        float _1793 = _1763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1795 = rsqrt(_1697);
        float _1797 = _1791 * _1787;
        float _1799 = _1797 * 0.15915493667125701904296875;
        float _1801 = _1799 * 6.283185482025146484375;
        float _1803 = sin(_1801);
        float _1805 = _1799 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        float _1809 = fma(_1803, _1793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1811 = _1795 * _1809;
        float _1813 = _1807 + (-1.0);
        float _1815 = fma(_1669, _1811, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1817 = fma(_1681, _1811, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1819 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1821 = fma(_1763, _1807, _1819);
        _1783 = _1821;
        _1737 = _1815;
        _1739 = _1817;
        _1785 = _1819;
    }
    float _1823 = _1783;
    float _1825 = _1737;
    float _1827 = _1739;
    float _1829 = _1785;
    float _1831 = 1.0 / _1779;
    float _1833 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1837 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1839 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1841 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1833);
    float _1843 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1835);
    float _1845 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1837);
    float _1847 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1839);
    float _1849 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1841);
    float _1851 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1843);
    float _1853 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1845);
    float _1855 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1847);
    float _1857 = _1843;
    float _1859 = _1829;
    if (_744)
    {
        _1857 = 1.0;
    }
    float _1861 = _1857;
    float _1863 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1865 = _1861;
    if (_744)
    {
        _1859 = 1.0;
    }
    float _1867 = _1859;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1871 = _1831 * _1869;
    float _1873 = _1867;
    if (!_744)
    {
        float _1875 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1877 = _1875 * 0.15915493667125701904296875;
        float _1879 = _1877 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        float _1883 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1885 = _1883 * 0.15915493667125701904296875;
        float _1887 = _1877 * 6.283185482025146484375;
        float _1889 = sin(_1887);
        float _1891 = 1.0 / _1881;
        float _1893 = _1885 * 6.283185482025146484375;
        float _1895 = cos(_1893);
        float _1897 = _1889 * _1891;
        float _1899 = _1885 * 6.283185482025146484375;
        float _1901 = sin(_1899);
        float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1905 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1903;
        float _1907 = _1895 * _1897;
        float _1909 = 1.0 / _1905;
        float _1911 = 1.0 / _1907;
        float _1913 = _1901 * _1911;
        float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1917 = fma(_1871, _1913, _1915);
        float _1919 = _1917 * _1909;
        float _1921 = precise::clamp(_1919, 0.0, 1.0);
        _1865 = _1921;
    }
    float _1923 = _1865;
    if (!_744)
    {
        float _1925 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1927 = _1925 * 0.15915493667125701904296875;
        float _1929 = _1927 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        float _1933 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1935 = _1933 * 0.15915493667125701904296875;
        float _1937 = _1927 * 6.283185482025146484375;
        float _1939 = sin(_1937);
        float _1941 = 1.0 / _1931;
        float _1943 = _1935 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = _1939 * _1941;
        float _1949 = _1935 * 6.283185482025146484375;
        float _1951 = sin(_1949);
        float _1953 = _1945 * _1947;
        float _1955 = 1.0 / _1953;
        float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1959 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1957;
        float _1961 = 1.0 / _1959;
        float _1963 = _1951 * _1955;
        float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1967 = fma(_1871, _1963, _1965);
        float _1969 = _1967 * _1961;
        float _1971 = precise::clamp(_1969, 0.0, 1.0);
        float _1973 = -_1971;
        float _1975 = _1973 + 1.0;
        _1873 = _1975;
    }
    float _1977 = _1873;
    bool _1979 = _1923 > 0.0;
    bool _1981 = isnan(_1923);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan(0.0);
    bool _1987 = _1983 || _1985;
    float _1989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1991 = _1923 * _1977;
    float _1993 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1995 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1997 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1999 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2001 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2003 = _1977 <= 0.0;
    bool _2005 = !_1987;
    bool _2007 = _2003 || _2005;
    float _2009 = _1991 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2011 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1999);
    float _2013 = _1853 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2015 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1995);
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1997);
    float _2019 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2001);
    float _2021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2023 = _670 * _2009;
    float _2025 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2011);
    float _2027 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2029 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2015);
    float _2031 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2017);
    float _2033 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2019);
    float _2035 = _802 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2037 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2025);
    float _2039 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2033);
    float _2041 = _2035 * _1989;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2047 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2029);
    float _2049 = _1769 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2051 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2055 = _2037 + _2039;
    float _2057 = fma(_2027, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2031);
    float _2059 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2061 = _2051 * _2021;
    float _2063 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2065 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2067 = _2023 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2069 = _2055 * 0.5;
    out.m_51.x = _2061;
    out.m_51.y = _2041;
    out.m_53.x = _2059;
    out.m_53.y = _2063;
    out.m_53.z = _2065;
    out.m_53.w = _2049;
    out.m_33.x = _2067;
    out.gl_Position.x = _2047;
    out.gl_Position.y = _2057;
    out.gl_Position.z = _2037;
    out.gl_Position.w = _2039;
    out.m_55.z = _2069;
    out.m_55.w = _2039;
    if (!_2007)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _2071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2071;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

