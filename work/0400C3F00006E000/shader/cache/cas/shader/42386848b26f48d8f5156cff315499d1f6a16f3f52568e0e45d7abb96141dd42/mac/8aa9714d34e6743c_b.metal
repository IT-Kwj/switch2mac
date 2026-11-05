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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _29* vp_s0 [[id(4)]];
};

struct main0_out
{
    float4 m_52 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_58 [[user(locn6)]];
    float4 m_60 [[user(locn7)]];
    float4 m_64 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(0)]];
    float4 m_41 [[attribute(1)]];
    float4 m_43 [[attribute(2)]];
    float4 m_45 [[attribute(5)]];
    uint4 m_36 [[attribute(7)]];
    float4 m_47 [[attribute(8)]];
    float4 m_49 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _332 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = as_type<float>(in.m_36.x);
    float _84 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _86 = in.m_39.x;
    float _88 = in.m_39.y;
    float _90 = in.m_39.z;
    float _92 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _94 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _92;
    float _96 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _98 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _96;
    float _100 = in.m_41.x;
    float _102 = in.m_41.y;
    float _104 = in.m_41.z;
    float _106 = _94 * _94;
    float _108 = in.m_43.x;
    float _110 = in.m_43.y;
    float _112 = in.m_43.z;
    float _114 = in.m_45.x;
    int _117 = as_type<int>(_84) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _119 = _117 + as_type<int>(_82);
    int _121 = _119 * 48;
    int _123 = _121 + 16;
    int _125 = _121 + 32;
    int _127 = _121 + 48;
    uint _130 = uint(int(uint(_123) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_130)];
    float _132 = as_type<float>(_dmw0.x);
    int _134 = _123 + 4;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw0.y);
    int _140 = _123 + 8;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw0.z);
    int _146 = _123 + 12;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw0.w);
    uint _152 = uint(int(uint(_125) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_152)];
    float _154 = as_type<float>(_dmw1.x);
    int _156 = _125 + 4;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw1.y);
    int _162 = _125 + 8;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>(_dmw1.z);
    int _168 = _125 + 12;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>(_dmw1.w);
    uint _174 = uint(int(uint(_127) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_174)];
    float _176 = as_type<float>(_dmw2.x);
    int _178 = _127 + 4;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>(_dmw2.y);
    int _184 = _127 + 8;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>(_dmw2.z);
    int _190 = _127 + 12;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    float _194 = as_type<float>(_dmw2.w);
    float _196 = fma(_98, _98, _106);
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _200 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _198;
    float _202 = fma(_200, _200, _196);
    float _204 = sqrt(_202);
    bool _208 = _204 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _210 = isnan(_204);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _216 = _212 || _214;
    float _218 = _138 * _88;
    float _220 = _138 * _102;
    float _222 = _138 * _110;
    float _224 = _160 * _88;
    float _226 = _160 * _102;
    float _228 = _160 * _110;
    float _230 = fma(_132, _86, _218);
    float _232 = _182 * _88;
    float _234 = _182 * _102;
    float _236 = _182 * _110;
    float _238 = fma(_154, _86, _224);
    float _240 = fma(_176, _86, _232);
    float _242 = fma(_154, _100, _226);
    float _244 = fma(_176, _100, _234);
    float _246 = fma(_154, _108, _228);
    float _248 = fma(_176, _108, _236);
    float _250 = fma(_144, _90, _230);
    float _252 = fma(_166, _90, _238);
    float _254 = fma(_132, _100, _220);
    float _256 = fma(_132, _108, _222);
    float _258 = fma(_188, _90, _240);
    float _260 = fma(_166, _112, _246);
    float _262 = _150 + _250;
    float _264 = fma(_144, _104, _254);
    float _266 = fma(_144, _112, _256);
    float _268 = fma(_166, _104, _242);
    float _270 = fma(_188, _104, _244);
    float _272 = fma(_188, _112, _248);
    float _274 = _172 + _252;
    float _276 = _194 + _258;
    float _278 = _260 * _114;
    float _280 = _262 * _114;
    float _282 = _264 * _114;
    float _284 = _268 * _114;
    float _286 = _270 * _114;
    float _288 = _266 * _114;
    float _290 = _272 * _114;
    float _292 = _274 * _114;
    float _294 = _276 * _114;
    float _296 = _262;
    if (!_216)
    {
        _296 = 1.0;
    }
    float _298 = _296;
    bool _300 = !_216;
    float _302 = _298;
    if (!_300)
    {
        bool _304 = _204 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _306 = isnan(_204);
        bool _308 = _304 || _306;
        bool _310 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _312 = _308 || _310;
        if (!_312)
        {
            float _314 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _316 = _204 + _314;
            float _318 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _320 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _318;
            float _322 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _324 = _322 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _326 = 1.0 / _320;
            float _328 = _316 * _326;
            float _330 = fma(_328, _324, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _302 = _330;
            _332 = true;
        }
        else
        {
            bool _334 = _204 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _336 = isnan(_204);
            bool _338 = _334 || _336;
            bool _340 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _342 = _338 || _340;
            if (!_342)
            {
                float _344 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _346 = _204 + _344;
                float _348 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _350 = _348 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _352 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _354 = _352 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _356 = 1.0 / _350;
                float _358 = _346 * _356;
                float _360 = fma(_358, _354, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _302 = _360;
                _332 = true;
            }
            else
            {
                _302 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _332 = false;
    float _362 = _302;
    float _364 = _362 + (-1.0);
    float _366 = _278 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _368 = _278 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _370 = _284 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _372 = _364 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _374 = _364 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _376 = _364 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _378 = _284 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _380 = fma(_292, _362, _372);
    float _382 = fma(_280, _362, _374);
    float _384 = fma(_294, _362, _376);
    float _386 = _278 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _388 = _380 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _390 = _380 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _392 = _284 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _394 = fma(_282, (*spvDescriptorSet0.vp_c7)._m0[0].x, _370);
    float _396 = fma(_382, (*spvDescriptorSet0.vp_c7)._m0[2].x, _388);
    float _398 = fma(_382, (*spvDescriptorSet0.vp_c7)._m0[0].x, _390);
    float _400 = fma(_282, (*spvDescriptorSet0.vp_c7)._m0[1].x, _378);
    float _402 = fma(_282, (*spvDescriptorSet0.vp_c7)._m0[2].x, _392);
    float _404 = fma(_384, (*spvDescriptorSet0.vp_c7)._m0[2].z, _396);
    float _406 = fma(_384, (*spvDescriptorSet0.vp_c7)._m0[0].z, _398);
    float _408 = in.m_47.y;
    float _410 = fma(_288, (*spvDescriptorSet0.vp_c7)._m0[0].x, _386);
    float _412 = _404 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _414 = _406 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _416 = in.m_49.x;
    float _418 = fma(_286, (*spvDescriptorSet0.vp_c7)._m0[1].z, _400);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _422 = _412 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _426 = _414 + _424;
    float _428 = in.m_49.y;
    float _430 = fma(_288, (*spvDescriptorSet0.vp_c7)._m0[1].x, _366);
    float _432 = _422 * _422;
    float _434 = _380 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _436 = in.m_43.w;
    float _438 = fma(_290, (*spvDescriptorSet0.vp_c7)._m0[1].z, _430);
    float _440 = fma(_426, _426, _432);
    float _442 = fma(_286, (*spvDescriptorSet0.vp_c7)._m0[0].z, _394);
    float _444 = _418 * _418;
    float _446 = fma(_288, (*spvDescriptorSet0.vp_c7)._m0[2].x, _368);
    float _448 = sqrt(_440);
    float _450 = fma(_286, (*spvDescriptorSet0.vp_c7)._m0[2].z, _402);
    float _452 = fma(_290, (*spvDescriptorSet0.vp_c7)._m0[0].z, _410);
    float _454 = _438 * _438;
    float _456 = fma(_382, (*spvDescriptorSet0.vp_c7)._m0[1].x, _434);
    float _458 = fma(_442, _442, _444);
    float _460 = fma(_290, (*spvDescriptorSet0.vp_c7)._m0[2].z, _446);
    float _462 = in.m_47.x;
    float _464 = fma(_452, _452, _454);
    float _466 = fma(_384, (*spvDescriptorSet0.vp_c7)._m0[1].z, _456);
    float _468 = fma(_450, _450, _458);
    out.m_52.y = _408;
    float _470 = fma(_460, _460, _464);
    float _472 = _466 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    out.m_54.z = _416;
    float _474 = rsqrt(_468);
    float _476 = _472 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _478 = _448 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    out.m_54.w = _428;
    float _480 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[2].x, _476);
    out.m_56.w = _436;
    float _482 = rsqrt(_470);
    float _484 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[2].z, _480);
    float _486 = _484 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_52.x = _462;
    float _488 = _442 * _474;
    float _490 = _418 * _474;
    float _492 = _450 * _474;
    float _494 = _450;
    float _496 = _432;
    float _498 = _462;
    if (!_478)
    {
        _494 = _472;
    }
    float _500 = _494;
    float _502 = _500;
    if (!_478)
    {
        _496 = _412;
    }
    float _504 = _496;
    float _506 = _504;
    if (!_478)
    {
        _498 = _414;
    }
    float _508 = _498;
    float _510 = _452 * _482;
    float _512 = _438 * _482;
    float _514 = _460 * _482;
    float _516 = _482;
    float _518 = _508;
    if (!_478)
    {
        _516 = _486;
    }
    float _520 = _516;
    bool _522 = !_478;
    float _524 = _520;
    if (!_522)
    {
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _528 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _530 = _448 + _528;
        float _532 = _472 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _534 = rsqrt(_440);
        float _536 = _530 * _526;
        float _538 = _536 * 0.15915493667125701904296875;
        float _540 = _538 * 6.283185482025146484375;
        float _542 = cos(_540);
        float _544 = _538 * 6.283185482025146484375;
        float _546 = sin(_544);
        float _548 = _542 + (-1.0);
        float _550 = fma(_546, _532, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _554 = _534 * _550;
        float _556 = fma(_472, _542, _552);
        float _558 = fma(_426, _554, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _560 = _556 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _562 = fma(_422, _554, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _564 = fma(_558, (*spvDescriptorSet0.vp_c4)._m0[2].x, _560);
        float _566 = fma(_562, (*spvDescriptorSet0.vp_c4)._m0[2].z, _564);
        float _568 = _566 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _502 = _556;
        _518 = _558;
        _506 = _562;
        _524 = _568;
    }
    float _570 = _502;
    float _572 = _518;
    float _574 = _506;
    float _576 = _524;
    float _578 = _570 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _580 = _570 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_58.x = _488;
    out.m_58.y = _490;
    out.m_58.z = _492;
    float _582 = _472 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _584 = fma(_572, (*spvDescriptorSet0.vp_c4)._m0[0].x, _578);
    float _586 = fma(_572, (*spvDescriptorSet0.vp_c4)._m0[1].x, _580);
    out.m_56.x = _510;
    out.m_56.y = _512;
    out.m_56.z = _514;
    float _588 = _472 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _590 = _472 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _592 = _472 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _594 = fma(_574, (*spvDescriptorSet0.vp_c4)._m0[1].z, _586);
    out.m_60.x = _414;
    out.m_60.y = _472;
    out.m_60.z = _412;
    float _596 = _472 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _598 = _472 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _600 = _472 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _602 = _472 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _604 = _472 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _606 = _472 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _608 = _472 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _610 = _472 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _612 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[42].x, _582);
    float _614 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[43].x, _588);
    float _616 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[44].x, _590);
    float _618 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[45].x, _592);
    float _620 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[48].x, _600);
    float _622 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[49].x, _608);
    float _624 = fma(_574, (*spvDescriptorSet0.vp_c4)._m0[0].z, _584);
    float _626 = _594 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _628 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[42].z, _612);
    float _630 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[46].x, _596);
    float _632 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[47].x, _598);
    float _634 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[50].x, _602);
    float _636 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[51].x, _604);
    float _638 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[52].x, _606);
    float _640 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[53].x, _610);
    float _642 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[43].z, _614);
    float _644 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[44].z, _616);
    float _646 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[45].z, _618);
    float _648 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[48].z, _620);
    float _650 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[49].z, _622);
    float _652 = _624 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _654 = _626 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _656 = _626 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _658 = _626 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _660 = _626 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _662 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[46].z, _630);
    float _664 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[47].z, _632);
    float _666 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[50].z, _634);
    float _668 = _628 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _670 = _642 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _672 = _644 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _674 = _646 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _676 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[51].z, _636);
    float _678 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[52].z, _638);
    float _680 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[53].z, _640);
    float _682 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[7].x, _654);
    float _684 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[8].x, _656);
    float _686 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[9].x, _658);
    float _688 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[10].x, _660);
    out.m_62.x = _668;
    out.m_62.y = _670;
    out.m_62.z = _672;
    out.m_62.w = _674;
    float _690 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[7].z, _682);
    float _692 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[8].z, _684);
    float _694 = -_486;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _698 = _694 + _696;
    float _700 = _664 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _702 = _648 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _704 = _676 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _706 = _678 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _708 = _680 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_64.w = _486;
    float _712 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[9].z, _686);
    float _714 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[10].z, _688);
    float _716 = _662 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _718 = _650 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _720 = _666 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _722 = _690 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _724 = _692 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _726 = _712 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _728 = _714 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_66.x = _716;
    out.m_66.y = _700;
    out.m_66.z = _702;
    out.m_66.w = _718;
    out.m_68.x = _720;
    out.m_68.y = _704;
    out.m_68.z = _706;
    out.m_68.w = _708;
    out.m_58.w = _710;
    out.gl_Position.x = _722;
    out.gl_Position.y = _724;
    out.gl_Position.z = _726;
    out.gl_Position.w = _728;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _332 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = as_type<float>(in.m_36.x);
    float _84 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _86 = in.m_39.x;
    float _88 = in.m_39.y;
    float _90 = in.m_39.z;
    float _92 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _94 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _92;
    float _96 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _98 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _96;
    float _100 = in.m_41.x;
    float _102 = in.m_41.y;
    float _104 = in.m_41.z;
    float _106 = _94 * _94;
    float _108 = in.m_43.x;
    float _110 = in.m_43.y;
    float _112 = in.m_43.z;
    float _114 = in.m_45.x;
    int _117 = as_type<int>(_84) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _119 = _117 + as_type<int>(_82);
    int _121 = _119 * 48;
    int _123 = _121 + 16;
    int _125 = _121 + 32;
    int _127 = _121 + 48;
    uint _130 = uint(int(uint(_123) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_130)];
    float _132 = as_type<float>(_dmw0.x);
    int _134 = _123 + 4;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw0.y);
    int _140 = _123 + 8;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw0.z);
    int _146 = _123 + 12;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw0.w);
    uint _152 = uint(int(uint(_125) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_152)];
    float _154 = as_type<float>(_dmw1.x);
    int _156 = _125 + 4;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw1.y);
    int _162 = _125 + 8;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>(_dmw1.z);
    int _168 = _125 + 12;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>(_dmw1.w);
    uint _174 = uint(int(uint(_127) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_174)];
    float _176 = as_type<float>(_dmw2.x);
    int _178 = _127 + 4;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>(_dmw2.y);
    int _184 = _127 + 8;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>(_dmw2.z);
    int _190 = _127 + 12;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    float _194 = as_type<float>(_dmw2.w);
    float _196 = fma(_98, _98, _106);
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _200 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _198;
    float _202 = fma(_200, _200, _196);
    float _204 = sqrt(_202);
    bool _208 = _204 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _210 = isnan(_204);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _216 = _212 || _214;
    float _218 = _138 * _88;
    float _220 = _138 * _102;
    float _222 = _138 * _110;
    float _224 = _160 * _88;
    float _226 = _160 * _102;
    float _228 = _160 * _110;
    float _230 = fma(_132, _86, _218);
    float _232 = _182 * _88;
    float _234 = _182 * _102;
    float _236 = _182 * _110;
    float _238 = fma(_154, _86, _224);
    float _240 = fma(_176, _86, _232);
    float _242 = fma(_154, _100, _226);
    float _244 = fma(_176, _100, _234);
    float _246 = fma(_154, _108, _228);
    float _248 = fma(_176, _108, _236);
    float _250 = fma(_144, _90, _230);
    float _252 = fma(_166, _90, _238);
    float _254 = fma(_132, _100, _220);
    float _256 = fma(_132, _108, _222);
    float _258 = fma(_188, _90, _240);
    float _260 = fma(_166, _112, _246);
    float _262 = _150 + _250;
    float _264 = fma(_144, _104, _254);
    float _266 = fma(_144, _112, _256);
    float _268 = fma(_166, _104, _242);
    float _270 = fma(_188, _104, _244);
    float _272 = fma(_188, _112, _248);
    float _274 = _172 + _252;
    float _276 = _194 + _258;
    float _278 = _260 * _114;
    float _280 = _262 * _114;
    float _282 = _264 * _114;
    float _284 = _268 * _114;
    float _286 = _270 * _114;
    float _288 = _266 * _114;
    float _290 = _272 * _114;
    float _292 = _274 * _114;
    float _294 = _276 * _114;
    float _296 = _262;
    if (!_216)
    {
        _296 = 1.0;
    }
    float _298 = _296;
    bool _300 = !_216;
    float _302 = _298;
    if (!_300)
    {
        bool _304 = _204 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _306 = isnan(_204);
        bool _308 = _304 || _306;
        bool _310 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _312 = _308 || _310;
        if (!_312)
        {
            float _314 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _316 = _204 + _314;
            float _318 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _320 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _318;
            float _322 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _324 = _322 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _326 = 1.0 / _320;
            float _328 = _316 * _326;
            float _330 = fma(_328, _324, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _302 = _330;
            _332 = true;
        }
        else
        {
            bool _334 = _204 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _336 = isnan(_204);
            bool _338 = _334 || _336;
            bool _340 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _342 = _338 || _340;
            if (!_342)
            {
                float _344 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _346 = _204 + _344;
                float _348 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _350 = _348 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _352 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _354 = _352 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _356 = 1.0 / _350;
                float _358 = _346 * _356;
                float _360 = fma(_358, _354, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _302 = _360;
                _332 = true;
            }
            else
            {
                _302 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _332 = false;
    float _362 = _302;
    float _364 = _362 + (-1.0);
    float _366 = _278 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _368 = _278 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _370 = _284 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _372 = _364 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _374 = _364 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _376 = _364 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _378 = _284 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _380 = fma(_292, _362, _372);
    float _382 = fma(_280, _362, _374);
    float _384 = fma(_294, _362, _376);
    float _386 = _278 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _388 = _380 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _390 = _380 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _392 = _284 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _394 = fma(_282, (*spvDescriptorSet0.vp_c7)._m0[0].x, _370);
    float _396 = fma(_382, (*spvDescriptorSet0.vp_c7)._m0[2].x, _388);
    float _398 = fma(_382, (*spvDescriptorSet0.vp_c7)._m0[0].x, _390);
    float _400 = fma(_282, (*spvDescriptorSet0.vp_c7)._m0[1].x, _378);
    float _402 = fma(_282, (*spvDescriptorSet0.vp_c7)._m0[2].x, _392);
    float _404 = fma(_384, (*spvDescriptorSet0.vp_c7)._m0[2].z, _396);
    float _406 = fma(_384, (*spvDescriptorSet0.vp_c7)._m0[0].z, _398);
    float _408 = in.m_47.y;
    float _410 = fma(_288, (*spvDescriptorSet0.vp_c7)._m0[0].x, _386);
    float _412 = _404 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _414 = _406 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _416 = in.m_49.x;
    float _418 = fma(_286, (*spvDescriptorSet0.vp_c7)._m0[1].z, _400);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _422 = _412 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _426 = _414 + _424;
    float _428 = in.m_49.y;
    float _430 = fma(_288, (*spvDescriptorSet0.vp_c7)._m0[1].x, _366);
    float _432 = _422 * _422;
    float _434 = _380 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _436 = in.m_43.w;
    float _438 = fma(_290, (*spvDescriptorSet0.vp_c7)._m0[1].z, _430);
    float _440 = fma(_426, _426, _432);
    float _442 = fma(_286, (*spvDescriptorSet0.vp_c7)._m0[0].z, _394);
    float _444 = _418 * _418;
    float _446 = fma(_288, (*spvDescriptorSet0.vp_c7)._m0[2].x, _368);
    float _448 = sqrt(_440);
    float _450 = fma(_286, (*spvDescriptorSet0.vp_c7)._m0[2].z, _402);
    float _452 = fma(_290, (*spvDescriptorSet0.vp_c7)._m0[0].z, _410);
    float _454 = _438 * _438;
    float _456 = fma(_382, (*spvDescriptorSet0.vp_c7)._m0[1].x, _434);
    float _458 = fma(_442, _442, _444);
    float _460 = fma(_290, (*spvDescriptorSet0.vp_c7)._m0[2].z, _446);
    float _462 = in.m_47.x;
    float _464 = fma(_452, _452, _454);
    float _466 = fma(_384, (*spvDescriptorSet0.vp_c7)._m0[1].z, _456);
    float _468 = fma(_450, _450, _458);
    out.m_52.y = _408;
    float _470 = fma(_460, _460, _464);
    float _472 = _466 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    out.m_54.z = _416;
    float _474 = rsqrt(_468);
    float _476 = _472 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _478 = _448 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    out.m_54.w = _428;
    float _480 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[2].x, _476);
    out.m_56.w = _436;
    float _482 = rsqrt(_470);
    float _484 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[2].z, _480);
    float _486 = _484 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_52.x = _462;
    float _488 = _442 * _474;
    float _490 = _418 * _474;
    float _492 = _450 * _474;
    float _494 = _450;
    float _496 = _432;
    float _498 = _462;
    if (!_478)
    {
        _494 = _472;
    }
    float _500 = _494;
    float _502 = _500;
    if (!_478)
    {
        _496 = _412;
    }
    float _504 = _496;
    float _506 = _504;
    if (!_478)
    {
        _498 = _414;
    }
    float _508 = _498;
    float _510 = _452 * _482;
    float _512 = _438 * _482;
    float _514 = _460 * _482;
    float _516 = _482;
    float _518 = _508;
    if (!_478)
    {
        _516 = _486;
    }
    float _520 = _516;
    bool _522 = !_478;
    float _524 = _520;
    if (!_522)
    {
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _528 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _530 = _448 + _528;
        float _532 = _472 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _534 = rsqrt(_440);
        float _536 = _530 * _526;
        float _538 = _536 * 0.15915493667125701904296875;
        float _540 = _538 * 6.283185482025146484375;
        float _542 = cos(_540);
        float _544 = _538 * 6.283185482025146484375;
        float _546 = sin(_544);
        float _548 = _542 + (-1.0);
        float _550 = fma(_546, _532, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _554 = _534 * _550;
        float _556 = fma(_472, _542, _552);
        float _558 = fma(_426, _554, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _560 = _556 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _562 = fma(_422, _554, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _564 = fma(_558, (*spvDescriptorSet0.vp_c4)._m0[2].x, _560);
        float _566 = fma(_562, (*spvDescriptorSet0.vp_c4)._m0[2].z, _564);
        float _568 = _566 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _502 = _556;
        _518 = _558;
        _506 = _562;
        _524 = _568;
    }
    float _570 = _502;
    float _572 = _518;
    float _574 = _506;
    float _576 = _524;
    float _578 = _570 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _580 = _570 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_58.x = _488;
    out.m_58.y = _490;
    out.m_58.z = _492;
    float _582 = _472 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _584 = fma(_572, (*spvDescriptorSet0.vp_c4)._m0[0].x, _578);
    float _586 = fma(_572, (*spvDescriptorSet0.vp_c4)._m0[1].x, _580);
    out.m_56.x = _510;
    out.m_56.y = _512;
    out.m_56.z = _514;
    float _588 = _472 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _590 = _472 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _592 = _472 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _594 = fma(_574, (*spvDescriptorSet0.vp_c4)._m0[1].z, _586);
    out.m_60.x = _414;
    out.m_60.y = _472;
    out.m_60.z = _412;
    float _596 = _472 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _598 = _472 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _600 = _472 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _602 = _472 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _604 = _472 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _606 = _472 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _608 = _472 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _610 = _472 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _612 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[42].x, _582);
    float _614 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[43].x, _588);
    float _616 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[44].x, _590);
    float _618 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[45].x, _592);
    float _620 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[48].x, _600);
    float _622 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[49].x, _608);
    float _624 = fma(_574, (*spvDescriptorSet0.vp_c4)._m0[0].z, _584);
    float _626 = _594 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _628 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[42].z, _612);
    float _630 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[46].x, _596);
    float _632 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[47].x, _598);
    float _634 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[50].x, _602);
    float _636 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[51].x, _604);
    float _638 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[52].x, _606);
    float _640 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[53].x, _610);
    float _642 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[43].z, _614);
    float _644 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[44].z, _616);
    float _646 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[45].z, _618);
    float _648 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[48].z, _620);
    float _650 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[49].z, _622);
    float _652 = _624 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _654 = _626 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _656 = _626 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _658 = _626 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _660 = _626 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _662 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[46].z, _630);
    float _664 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[47].z, _632);
    float _666 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[50].z, _634);
    float _668 = _628 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _670 = _642 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _672 = _644 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _674 = _646 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _676 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[51].z, _636);
    float _678 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[52].z, _638);
    float _680 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[53].z, _640);
    float _682 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[7].x, _654);
    float _684 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[8].x, _656);
    float _686 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[9].x, _658);
    float _688 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[10].x, _660);
    out.m_62.x = _668;
    out.m_62.y = _670;
    out.m_62.z = _672;
    out.m_62.w = _674;
    float _690 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[7].z, _682);
    float _692 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[8].z, _684);
    float _694 = -_486;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _698 = _694 + _696;
    float _700 = _664 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _702 = _648 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _704 = _676 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _706 = _678 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _708 = _680 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_64.w = _486;
    float _712 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[9].z, _686);
    float _714 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[10].z, _688);
    float _716 = _662 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _718 = _650 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _720 = _666 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _722 = _690 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _724 = _692 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _726 = _712 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _728 = _714 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_66.x = _716;
    out.m_66.y = _700;
    out.m_66.z = _702;
    out.m_66.w = _718;
    out.m_68.x = _720;
    out.m_68.y = _704;
    out.m_68.z = _706;
    out.m_68.w = _708;
    out.m_58.w = _710;
    out.gl_Position.x = _722;
    out.gl_Position.y = _724;
    out.gl_Position.z = _726;
    out.gl_Position.w = _728;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _332 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = as_type<float>(in.m_36.x);
    float _84 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _86 = in.m_39.x;
    float _88 = in.m_39.y;
    float _90 = in.m_39.z;
    float _92 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _94 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _92;
    float _96 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _98 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _96;
    float _100 = in.m_41.x;
    float _102 = in.m_41.y;
    float _104 = in.m_41.z;
    float _106 = _94 * _94;
    float _108 = in.m_43.x;
    float _110 = in.m_43.y;
    float _112 = in.m_43.z;
    float _114 = in.m_45.x;
    int _117 = as_type<int>(_84) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _119 = _117 + as_type<int>(_82);
    int _121 = _119 * 48;
    int _123 = _121 + 16;
    int _125 = _121 + 32;
    int _127 = _121 + 48;
    uint _130 = uint(int(uint(_123) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_130)];
    float _132 = as_type<float>(_dmw0.x);
    int _134 = _123 + 4;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw0.y);
    int _140 = _123 + 8;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw0.z);
    int _146 = _123 + 12;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw0.w);
    uint _152 = uint(int(uint(_125) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_152)];
    float _154 = as_type<float>(_dmw1.x);
    int _156 = _125 + 4;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_dmw1.y);
    int _162 = _125 + 8;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>(_dmw1.z);
    int _168 = _125 + 12;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>(_dmw1.w);
    uint _174 = uint(int(uint(_127) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_174)];
    float _176 = as_type<float>(_dmw2.x);
    int _178 = _127 + 4;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>(_dmw2.y);
    int _184 = _127 + 8;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>(_dmw2.z);
    int _190 = _127 + 12;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    float _194 = as_type<float>(_dmw2.w);
    float _196 = fma(_98, _98, _106);
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _200 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _198;
    float _202 = fma(_200, _200, _196);
    float _204 = sqrt(_202);
    bool _208 = _204 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _210 = isnan(_204);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _216 = _212 || _214;
    float _218 = _138 * _88;
    float _220 = _138 * _102;
    float _222 = _138 * _110;
    float _224 = _160 * _88;
    float _226 = _160 * _102;
    float _228 = _160 * _110;
    float _230 = fma(_132, _86, _218);
    float _232 = _182 * _88;
    float _234 = _182 * _102;
    float _236 = _182 * _110;
    float _238 = fma(_154, _86, _224);
    float _240 = fma(_176, _86, _232);
    float _242 = fma(_154, _100, _226);
    float _244 = fma(_176, _100, _234);
    float _246 = fma(_154, _108, _228);
    float _248 = fma(_176, _108, _236);
    float _250 = fma(_144, _90, _230);
    float _252 = fma(_166, _90, _238);
    float _254 = fma(_132, _100, _220);
    float _256 = fma(_132, _108, _222);
    float _258 = fma(_188, _90, _240);
    float _260 = fma(_166, _112, _246);
    float _262 = _150 + _250;
    float _264 = fma(_144, _104, _254);
    float _266 = fma(_144, _112, _256);
    float _268 = fma(_166, _104, _242);
    float _270 = fma(_188, _104, _244);
    float _272 = fma(_188, _112, _248);
    float _274 = _172 + _252;
    float _276 = _194 + _258;
    float _278 = _260 * _114;
    float _280 = _262 * _114;
    float _282 = _264 * _114;
    float _284 = _268 * _114;
    float _286 = _270 * _114;
    float _288 = _266 * _114;
    float _290 = _272 * _114;
    float _292 = _274 * _114;
    float _294 = _276 * _114;
    float _296 = _262;
    if (!_216)
    {
        _296 = 1.0;
    }
    float _298 = _296;
    bool _300 = !_216;
    float _302 = _298;
    if (!_300)
    {
        bool _304 = _204 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _306 = isnan(_204);
        bool _308 = _304 || _306;
        bool _310 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _312 = _308 || _310;
        if (!_312)
        {
            float _314 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _316 = _204 + _314;
            float _318 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _320 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _318;
            float _322 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _324 = _322 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _326 = 1.0 / _320;
            float _328 = _316 * _326;
            float _330 = fma(_328, _324, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _302 = _330;
            _332 = true;
        }
        else
        {
            bool _334 = _204 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _336 = isnan(_204);
            bool _338 = _334 || _336;
            bool _340 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _342 = _338 || _340;
            if (!_342)
            {
                float _344 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _346 = _204 + _344;
                float _348 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _350 = _348 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _352 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _354 = _352 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _356 = 1.0 / _350;
                float _358 = _346 * _356;
                float _360 = fma(_358, _354, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _302 = _360;
                _332 = true;
            }
            else
            {
                _302 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _332 = false;
    float _362 = _302;
    float _364 = _362 + (-1.0);
    float _366 = _278 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _368 = _278 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _370 = _284 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _372 = _364 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _374 = _364 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _376 = _364 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _378 = _284 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _380 = fma(_292, _362, _372);
    float _382 = fma(_280, _362, _374);
    float _384 = fma(_294, _362, _376);
    float _386 = _278 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _388 = _380 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _390 = _380 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _392 = _284 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _394 = fma(_282, (*spvDescriptorSet0.vp_c7)._m0[0].x, _370);
    float _396 = fma(_382, (*spvDescriptorSet0.vp_c7)._m0[2].x, _388);
    float _398 = fma(_382, (*spvDescriptorSet0.vp_c7)._m0[0].x, _390);
    float _400 = fma(_282, (*spvDescriptorSet0.vp_c7)._m0[1].x, _378);
    float _402 = fma(_282, (*spvDescriptorSet0.vp_c7)._m0[2].x, _392);
    float _404 = fma(_384, (*spvDescriptorSet0.vp_c7)._m0[2].z, _396);
    float _406 = fma(_384, (*spvDescriptorSet0.vp_c7)._m0[0].z, _398);
    float _408 = in.m_47.y;
    float _410 = fma(_288, (*spvDescriptorSet0.vp_c7)._m0[0].x, _386);
    float _412 = _404 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _414 = _406 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _416 = in.m_49.x;
    float _418 = fma(_286, (*spvDescriptorSet0.vp_c7)._m0[1].z, _400);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _422 = _412 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _426 = _414 + _424;
    float _428 = in.m_49.y;
    float _430 = fma(_288, (*spvDescriptorSet0.vp_c7)._m0[1].x, _366);
    float _432 = _422 * _422;
    float _434 = _380 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _436 = in.m_43.w;
    float _438 = fma(_290, (*spvDescriptorSet0.vp_c7)._m0[1].z, _430);
    float _440 = fma(_426, _426, _432);
    float _442 = fma(_286, (*spvDescriptorSet0.vp_c7)._m0[0].z, _394);
    float _444 = _418 * _418;
    float _446 = fma(_288, (*spvDescriptorSet0.vp_c7)._m0[2].x, _368);
    float _448 = sqrt(_440);
    float _450 = fma(_286, (*spvDescriptorSet0.vp_c7)._m0[2].z, _402);
    float _452 = fma(_290, (*spvDescriptorSet0.vp_c7)._m0[0].z, _410);
    float _454 = _438 * _438;
    float _456 = fma(_382, (*spvDescriptorSet0.vp_c7)._m0[1].x, _434);
    float _458 = fma(_442, _442, _444);
    float _460 = fma(_290, (*spvDescriptorSet0.vp_c7)._m0[2].z, _446);
    float _462 = in.m_47.x;
    float _464 = fma(_452, _452, _454);
    float _466 = fma(_384, (*spvDescriptorSet0.vp_c7)._m0[1].z, _456);
    float _468 = fma(_450, _450, _458);
    out.m_52.y = _408;
    float _470 = fma(_460, _460, _464);
    float _472 = _466 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    out.m_54.z = _416;
    float _474 = rsqrt(_468);
    float _476 = _472 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _478 = _448 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    out.m_54.w = _428;
    float _480 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[2].x, _476);
    out.m_56.w = _436;
    float _482 = rsqrt(_470);
    float _484 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[2].z, _480);
    float _486 = _484 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_52.x = _462;
    float _488 = _442 * _474;
    float _490 = _418 * _474;
    float _492 = _450 * _474;
    float _494 = _450;
    float _496 = _432;
    float _498 = _462;
    if (!_478)
    {
        _494 = _472;
    }
    float _500 = _494;
    float _502 = _500;
    if (!_478)
    {
        _496 = _412;
    }
    float _504 = _496;
    float _506 = _504;
    if (!_478)
    {
        _498 = _414;
    }
    float _508 = _498;
    float _510 = _452 * _482;
    float _512 = _438 * _482;
    float _514 = _460 * _482;
    float _516 = _482;
    float _518 = _508;
    if (!_478)
    {
        _516 = _486;
    }
    float _520 = _516;
    bool _522 = !_478;
    float _524 = _520;
    if (!_522)
    {
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _528 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _530 = _448 + _528;
        float _532 = _472 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _534 = rsqrt(_440);
        float _536 = _530 * _526;
        float _538 = _536 * 0.15915493667125701904296875;
        float _540 = _538 * 6.283185482025146484375;
        float _542 = cos(_540);
        float _544 = _538 * 6.283185482025146484375;
        float _546 = sin(_544);
        float _548 = _542 + (-1.0);
        float _550 = fma(_546, _532, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _554 = _534 * _550;
        float _556 = fma(_472, _542, _552);
        float _558 = fma(_426, _554, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _560 = _556 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _562 = fma(_422, _554, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _564 = fma(_558, (*spvDescriptorSet0.vp_c4)._m0[2].x, _560);
        float _566 = fma(_562, (*spvDescriptorSet0.vp_c4)._m0[2].z, _564);
        float _568 = _566 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _502 = _556;
        _518 = _558;
        _506 = _562;
        _524 = _568;
    }
    float _570 = _502;
    float _572 = _518;
    float _574 = _506;
    float _576 = _524;
    float _578 = _570 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _580 = _570 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_58.x = _488;
    out.m_58.y = _490;
    out.m_58.z = _492;
    float _582 = _472 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _584 = fma(_572, (*spvDescriptorSet0.vp_c4)._m0[0].x, _578);
    float _586 = fma(_572, (*spvDescriptorSet0.vp_c4)._m0[1].x, _580);
    out.m_56.x = _510;
    out.m_56.y = _512;
    out.m_56.z = _514;
    float _588 = _472 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _590 = _472 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _592 = _472 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _594 = fma(_574, (*spvDescriptorSet0.vp_c4)._m0[1].z, _586);
    out.m_60.x = _414;
    out.m_60.y = _472;
    out.m_60.z = _412;
    float _596 = _472 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _598 = _472 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _600 = _472 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _602 = _472 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _604 = _472 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _606 = _472 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _608 = _472 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _610 = _472 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _612 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[42].x, _582);
    float _614 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[43].x, _588);
    float _616 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[44].x, _590);
    float _618 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[45].x, _592);
    float _620 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[48].x, _600);
    float _622 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[49].x, _608);
    float _624 = fma(_574, (*spvDescriptorSet0.vp_c4)._m0[0].z, _584);
    float _626 = _594 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _628 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[42].z, _612);
    float _630 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[46].x, _596);
    float _632 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[47].x, _598);
    float _634 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[50].x, _602);
    float _636 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[51].x, _604);
    float _638 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[52].x, _606);
    float _640 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[53].x, _610);
    float _642 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[43].z, _614);
    float _644 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[44].z, _616);
    float _646 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[45].z, _618);
    float _648 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[48].z, _620);
    float _650 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[49].z, _622);
    float _652 = _624 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _654 = _626 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _656 = _626 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _658 = _626 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _660 = _626 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _662 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[46].z, _630);
    float _664 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[47].z, _632);
    float _666 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[50].z, _634);
    float _668 = _628 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _670 = _642 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _672 = _644 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _674 = _646 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _676 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[51].z, _636);
    float _678 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[52].z, _638);
    float _680 = fma(_412, (*spvDescriptorSet0.vp_c4)._m0[53].z, _640);
    float _682 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[7].x, _654);
    float _684 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[8].x, _656);
    float _686 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[9].x, _658);
    float _688 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[10].x, _660);
    out.m_62.x = _668;
    out.m_62.y = _670;
    out.m_62.z = _672;
    out.m_62.w = _674;
    float _690 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[7].z, _682);
    float _692 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[8].z, _684);
    float _694 = -_486;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _698 = _694 + _696;
    float _700 = _664 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _702 = _648 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _704 = _676 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _706 = _678 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _708 = _680 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_64.w = _486;
    float _712 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[9].z, _686);
    float _714 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[10].z, _688);
    float _716 = _662 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _718 = _650 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _720 = _666 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _722 = _690 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _724 = _692 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _726 = _712 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _728 = _714 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_66.x = _716;
    out.m_66.y = _700;
    out.m_66.z = _702;
    out.m_66.w = _718;
    out.m_68.x = _720;
    out.m_68.y = _704;
    out.m_68.z = _706;
    out.m_68.w = _708;
    out.m_58.w = _710;
    out.gl_Position.x = _722;
    out.gl_Position.y = _724;
    out.gl_Position.z = _726;
    out.gl_Position.w = _728;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

