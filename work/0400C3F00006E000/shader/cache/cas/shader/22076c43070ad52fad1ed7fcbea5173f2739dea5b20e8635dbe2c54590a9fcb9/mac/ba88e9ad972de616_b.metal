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
    float4 m_35 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_43 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_45 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _688 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_32.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    float _80 = _78;
    if (!_72)
    {
        out.m_35.x = 0.0;
    }
    int _82 = 0;
    if (!_72)
    {
        float _84 = _78 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _873 = as_type<float>(_86);
        out.gl_Position.z = _873;
    }
    if (!_72)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _90 = in.m_37.w;
    bool _92 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = isnan(_90);
    bool _96 = _92 || _94;
    bool _98 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _100 = _96 || _98;
    float _102 = -_90;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_100)
    {
        float _106 = float(_68);
        _80 = _106;
    }
    float _108 = _80;
    bool _110 = _104 >= _108;
    bool _112 = !_100;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_35.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _88 = as_type<int>(_118);
    }
    int _120 = _88;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _941 = as_type<float>(_120);
        out.gl_Position.z = _941;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_37.x;
    float _124 = in.m_37.y;
    float _126 = in.m_37.z;
    float _128 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = in.m_32.x;
    float _142 = in.m_32.y;
    float _144 = in.m_32.z;
    float _146 = in.m_39.x;
    float _148 = in.m_39.y;
    float _150 = in.m_39.z;
    float _152 = in.m_39.w;
    float _154 = 0.0;
    float _156 = _128;
    if (!_138)
    {
        float _158 = _128 * _128;
        float _160 = _158 * 0.5;
        _154 = _160;
    }
    float _162 = _154;
    float _164 = _162;
    if (!_138)
    {
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    bool _170 = !_138;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _128 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _128);
        float _200 = _198 * _186;
        float _202 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _202;
    }
    float _204 = _172;
    bool _206 = !_138;
    if (!_206)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = 1.0 / _214;
        float _218 = _128 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    float _230 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _236 = in.m_41.x;
    float _238 = fma(_228, _124, _230);
    float _240 = fma(_228, _122, _232);
    float _242 = fma(_228, _126, _234);
    float _244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _246 = fma(_238, _152, _142);
    float _248 = fma(_240, _152, _140);
    float _250 = fma(_242, _152, _144);
    float _252 = _104 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _254 = _246 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _256 = _246 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _258 = _246 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _260 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _254);
    float _262 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _256);
    float _264 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _258);
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _272 = _270 != 0;
    float _274 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _260);
    float _276 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _262);
    float _278 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _264);
    float _280 = _252 * _244;
    float _282 = _274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _284 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _286 = _278 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _288 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[20].x, _280);
    float _290 = -_282;
    float _292 = _290 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _294 = -_284;
    float _296 = _294 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _298 = -_286;
    float _300 = _298 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _302 = floor(_288);
    float _304 = _292 * _292;
    bool _306 = !_268;
    int _308 = _306 ? 0 : 1;
    float _310 = fma(_296, _296, _304);
    int _312 = abs(_308);
    float _314 = fma(_300, _300, _310);
    float _316 = _288 * 6.283185482025146484375;
    int _318 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _320 = _318 != 0;
    float _322 = _316 * 0.15915493667125701904296875;
    float _324 = rsqrt(_314);
    float _326 = -_302;
    float _328 = _288 + _326;
    bool _330 = !_320;
    int _332 = _330 ? 0 : 1;
    float _334 = float(_312);
    float _336 = -_328;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _340 = abs(_332);
    float _342 = _322 * 6.283185482025146484375;
    float _344 = cos(_342);
    bool _346 = _328 < 0.5;
    float _348 = float(_346);
    float _350 = abs(_338);
    float _352 = _334 * _350;
    float _354 = float(_340);
    float _356 = in.m_43.x;
    float _358 = in.m_43.y;
    float _360 = in.m_43.z;
    float _362 = _296 * _324;
    float _364 = _292 * _324;
    float _366 = _300 * _324;
    float _368 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _370 = _362 * _368;
    float _372 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _374 = _364 * _372;
    float _376 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _378 = _366 * _376;
    float _380 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _382 = -_370;
    float _384 = fma(_366, _380, _382);
    float _386 = fma(_344, 0.5, 0.5);
    float _388 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _390 = -_378;
    float _392 = fma(_364, _388, _390);
    float _394 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _396 = -_374;
    float _398 = fma(_362, _394, _396);
    float _400 = _384 * _384;
    float _402 = -_386;
    float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _406 = !_272;
    int _408 = _406 ? 0 : 1;
    float _410 = fma(_392, _392, _400);
    float _412 = fma(_354, _404, _352);
    int _414 = abs(_408);
    float _416 = -_348;
    float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _420 = fma(_398, _398, _410);
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _356);
    float _424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _358);
    float _426 = rsqrt(_420);
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _360);
    float _430 = float(_414);
    float _432 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _436 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = abs(_418);
    float _440 = fma(_430, _438, _412);
    float _442 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _444 = _440 * _432;
    float _446 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _450 = _440 * _436;
    float _452 = _384 * _426;
    float _454 = _392 * _426;
    float _456 = _440 * _446;
    float _458 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _460 = _398 * _426;
    float _462 = _366 * _452;
    float _464 = _364 * _454;
    float _466 = _458 * _424;
    float _468 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _470 = -_462;
    float _472 = fma(_364, _460, _470);
    float _474 = sqrt(_448);
    float _476 = -_464;
    float _478 = fma(_362, _452, _476);
    float _480 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _482 = _468 * _422;
    float _484 = _466 * _472;
    float _486 = _466 * _478;
    float _488 = _480 * _428;
    float _490 = fma(_482, _454, _484);
    float _492 = fma(_482, _460, _486);
    float _494 = _362 * _460;
    float _496 = fma(_488, _362, _490);
    float _498 = fma(_488, _366, _492);
    float _500 = -_494;
    float _502 = fma(_366, _454, _500);
    float _504 = _474 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _506 = _284 + _496;
    float _508 = _286 + _498;
    float _510 = _466 * _502;
    float _512 = in.m_45.x;
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _506);
    float _516 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[10].z, _508);
    float _518 = fma(_482, _452, _510);
    float _520 = in.m_45.y;
    float _522 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _524 = _514 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _528 = _516 + _526;
    float _530 = fma(_488, _364, _518);
    float _532 = _524 * _524;
    float _534 = _528 * _528;
    float _536 = _282 + _530;
    float _538 = _532 + _534;
    float _540 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[9].z, _536);
    float _542 = sqrt(_538);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = _510;
    float _548 = _282;
    float _550 = _518;
    float _552 = _494;
    float _554 = _534;
    if (!_544)
    {
        _546 = _532;
    }
    float _556 = _546;
    float _558 = _556;
    if (!_544)
    {
        _548 = _514;
    }
    float _560 = _548;
    float _562 = _560;
    if (!_544)
    {
        _550 = _516;
    }
    float _564 = _550;
    float _566 = _564;
    if (!_544)
    {
        _552 = _540;
    }
    float _568 = _552;
    bool _570 = !_544;
    float _572 = _568;
    if (!_570)
    {
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _576 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _578 = _542 + _576;
        float _580 = _540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _582 = rsqrt(_538);
        float _584 = _578 * _574;
        float _586 = _584 * 0.15915493667125701904296875;
        float _588 = _586 * 6.283185482025146484375;
        float _590 = sin(_588);
        float _592 = _586 * 6.283185482025146484375;
        float _594 = cos(_592);
        float _596 = fma(_590, _580, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _598 = _582 * _596;
        float _600 = _594 + (-1.0);
        float _602 = fma(_524, _598, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _604 = fma(_528, _598, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _606 = _600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _610 = _602 + _608;
        float _612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _614 = _604 + _612;
        float _616 = fma(_540, _594, _606);
        float _618 = _610 * _610;
        float _620 = _614 * _614;
        _572 = _616;
        _558 = _618;
        _554 = _620;
        _562 = _602;
        _566 = _604;
    }
    float _622 = _572;
    float _624 = _558;
    float _626 = _554;
    float _628 = _562;
    float _630 = _566;
    float _632 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _634 = _622 + _632;
    out.m_47.x = _512;
    float _636 = fma(_634, _634, _624);
    out.m_47.y = _520;
    float _638 = _636 + _626;
    float _640 = sqrt(_638);
    bool _642 = _640 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _644 = isnan(_640);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _650 = _646 || _648;
    float _652 = _624;
    if (!_650)
    {
        _652 = 1.0;
    }
    float _654 = _652;
    bool _656 = !_650;
    float _658 = _654;
    if (!_656)
    {
        bool _660 = _640 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _662 = isnan(_640);
        bool _664 = _660 || _662;
        bool _666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _668 = _664 || _666;
        if (!_668)
        {
            float _670 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _672 = _640 + _670;
            float _674 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _676 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _674;
            float _678 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _680 = _678 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _682 = 1.0 / _676;
            float _684 = _672 * _682;
            float _686 = fma(_684, _680, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _658 = _686;
            _688 = true;
        }
        else
        {
            bool _690 = _640 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _692 = isnan(_640);
            bool _694 = _690 || _692;
            bool _696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _698 = _694 || _696;
            if (!_698)
            {
                float _700 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _702 = _640 + _700;
                float _704 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _706 = _704 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _708 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _710 = _708 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _712 = 1.0 / _706;
                float _714 = _702 * _712;
                float _716 = fma(_714, _710, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _658 = _716;
                _688 = true;
            }
            else
            {
                _658 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _688 = false;
    float _718 = _658;
    float _720 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _722 = _622 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _726 = _628 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _730 = _630 + _728;
    float _732 = fma(_722, _718, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _734 = fma(_726, _718, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _736 = fma(_730, _718, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _738 = _732 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _740 = _732 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _742 = _732 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _744 = _732 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _746 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _738);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _740);
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _742);
    float _752 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _744);
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _746);
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _748);
    float _758 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _750);
    float _760 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _752);
    float _762 = _754 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _764 = _756 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _766 = _758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _768 = _760 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _770 = _762 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _772 = _762 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _774 = _762 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _776 = _762 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[4].x, _770);
    float _780 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[5].x, _772);
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[7].x, _774);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[6].x, _776);
    float _786 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].z, _778);
    float _788 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].z, _780);
    float _790 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].z, _782);
    float _792 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].z, _784);
    float _794 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _786);
    float _796 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _788);
    float _798 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _790);
    float _800 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _792);
    float _802 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _804 = _794 + _798;
    float _806 = _800 + _798;
    float _808 = _798 * 0.5;
    float _810 = _804 * 0.5;
    float _812 = _806 * 0.5;
    float _814 = fma(_796, -0.5, _808);
    out.m_35.x = _802;
    out.gl_Position.x = _794;
    out.gl_Position.y = _796;
    out.gl_Position.z = _800;
    out.gl_Position.w = _798;
    out.m_49.x = _810;
    out.m_49.y = _814;
    out.m_49.z = _812;
    out.m_49.w = _798;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _688 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_32.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    float _80 = _78;
    if (!_72)
    {
        out.m_35.x = 0.0;
    }
    int _82 = 0;
    if (!_72)
    {
        float _84 = _78 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _873 = as_type<float>(_86);
        out.gl_Position.z = _873;
    }
    if (!_72)
    {
        return out;
    }
    float _90 = in.m_37.w;
    bool _92 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = isnan(_90);
    bool _96 = _92 || _94;
    bool _98 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _100 = _96 || _98;
    float _102 = -_90;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_100)
    {
        float _106 = float(_68);
        _80 = _106;
    }
    float _108 = _80;
    bool _110 = _104 >= _108;
    bool _112 = !_100;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_35.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _88 = as_type<int>(_118);
    }
    int _120 = _88;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _941 = as_type<float>(_120);
        out.gl_Position.z = _941;
    }
    if (_114)
    {
        return out;
    }
    float _122 = in.m_37.x;
    float _124 = in.m_37.y;
    float _126 = in.m_37.z;
    float _128 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = in.m_32.x;
    float _142 = in.m_32.y;
    float _144 = in.m_32.z;
    float _146 = in.m_39.x;
    float _148 = in.m_39.y;
    float _150 = in.m_39.z;
    float _152 = in.m_39.w;
    float _154 = 0.0;
    float _156 = _128;
    if (!_138)
    {
        float _158 = _128 * _128;
        float _160 = _158 * 0.5;
        _154 = _160;
    }
    float _162 = _154;
    float _164 = _162;
    if (!_138)
    {
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    bool _170 = !_138;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _128 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _128);
        float _200 = _198 * _186;
        float _202 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _202;
    }
    float _204 = _172;
    bool _206 = !_138;
    if (!_206)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = 1.0 / _214;
        float _218 = _128 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    float _230 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _236 = in.m_41.x;
    float _238 = fma(_228, _124, _230);
    float _240 = fma(_228, _122, _232);
    float _242 = fma(_228, _126, _234);
    float _244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _246 = fma(_238, _152, _142);
    float _248 = fma(_240, _152, _140);
    float _250 = fma(_242, _152, _144);
    float _252 = _104 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _254 = _246 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _256 = _246 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _258 = _246 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _260 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _254);
    float _262 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _256);
    float _264 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _258);
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _272 = _270 != 0;
    float _274 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _260);
    float _276 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _262);
    float _278 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _264);
    float _280 = _252 * _244;
    float _282 = _274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _284 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _286 = _278 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _288 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[20].x, _280);
    float _290 = -_282;
    float _292 = _290 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _294 = -_284;
    float _296 = _294 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _298 = -_286;
    float _300 = _298 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _302 = floor(_288);
    float _304 = _292 * _292;
    bool _306 = !_268;
    int _308 = _306 ? 0 : 1;
    float _310 = fma(_296, _296, _304);
    int _312 = abs(_308);
    float _314 = fma(_300, _300, _310);
    float _316 = _288 * 6.283185482025146484375;
    int _318 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _320 = _318 != 0;
    float _322 = _316 * 0.15915493667125701904296875;
    float _324 = rsqrt(_314);
    float _326 = -_302;
    float _328 = _288 + _326;
    bool _330 = !_320;
    int _332 = _330 ? 0 : 1;
    float _334 = float(_312);
    float _336 = -_328;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _340 = abs(_332);
    float _342 = _322 * 6.283185482025146484375;
    float _344 = cos(_342);
    bool _346 = _328 < 0.5;
    float _348 = float(_346);
    float _350 = abs(_338);
    float _352 = _334 * _350;
    float _354 = float(_340);
    float _356 = in.m_43.x;
    float _358 = in.m_43.y;
    float _360 = in.m_43.z;
    float _362 = _296 * _324;
    float _364 = _292 * _324;
    float _366 = _300 * _324;
    float _368 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _370 = _362 * _368;
    float _372 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _374 = _364 * _372;
    float _376 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _378 = _366 * _376;
    float _380 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _382 = -_370;
    float _384 = fma(_366, _380, _382);
    float _386 = fma(_344, 0.5, 0.5);
    float _388 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _390 = -_378;
    float _392 = fma(_364, _388, _390);
    float _394 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _396 = -_374;
    float _398 = fma(_362, _394, _396);
    float _400 = _384 * _384;
    float _402 = -_386;
    float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _406 = !_272;
    int _408 = _406 ? 0 : 1;
    float _410 = fma(_392, _392, _400);
    float _412 = fma(_354, _404, _352);
    int _414 = abs(_408);
    float _416 = -_348;
    float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _420 = fma(_398, _398, _410);
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _356);
    float _424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _358);
    float _426 = rsqrt(_420);
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _360);
    float _430 = float(_414);
    float _432 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _436 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = abs(_418);
    float _440 = fma(_430, _438, _412);
    float _442 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _444 = _440 * _432;
    float _446 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _450 = _440 * _436;
    float _452 = _384 * _426;
    float _454 = _392 * _426;
    float _456 = _440 * _446;
    float _458 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _460 = _398 * _426;
    float _462 = _366 * _452;
    float _464 = _364 * _454;
    float _466 = _458 * _424;
    float _468 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _470 = -_462;
    float _472 = fma(_364, _460, _470);
    float _474 = sqrt(_448);
    float _476 = -_464;
    float _478 = fma(_362, _452, _476);
    float _480 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _482 = _468 * _422;
    float _484 = _466 * _472;
    float _486 = _466 * _478;
    float _488 = _480 * _428;
    float _490 = fma(_482, _454, _484);
    float _492 = fma(_482, _460, _486);
    float _494 = _362 * _460;
    float _496 = fma(_488, _362, _490);
    float _498 = fma(_488, _366, _492);
    float _500 = -_494;
    float _502 = fma(_366, _454, _500);
    float _504 = _474 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _506 = _284 + _496;
    float _508 = _286 + _498;
    float _510 = _466 * _502;
    float _512 = in.m_45.x;
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _506);
    float _516 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[10].z, _508);
    float _518 = fma(_482, _452, _510);
    float _520 = in.m_45.y;
    float _522 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _524 = _514 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _528 = _516 + _526;
    float _530 = fma(_488, _364, _518);
    float _532 = _524 * _524;
    float _534 = _528 * _528;
    float _536 = _282 + _530;
    float _538 = _532 + _534;
    float _540 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[9].z, _536);
    float _542 = sqrt(_538);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = _510;
    float _548 = _282;
    float _550 = _518;
    float _552 = _494;
    float _554 = _534;
    if (!_544)
    {
        _546 = _532;
    }
    float _556 = _546;
    float _558 = _556;
    if (!_544)
    {
        _548 = _514;
    }
    float _560 = _548;
    float _562 = _560;
    if (!_544)
    {
        _550 = _516;
    }
    float _564 = _550;
    float _566 = _564;
    if (!_544)
    {
        _552 = _540;
    }
    float _568 = _552;
    bool _570 = !_544;
    float _572 = _568;
    if (!_570)
    {
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _576 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _578 = _542 + _576;
        float _580 = _540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _582 = rsqrt(_538);
        float _584 = _578 * _574;
        float _586 = _584 * 0.15915493667125701904296875;
        float _588 = _586 * 6.283185482025146484375;
        float _590 = sin(_588);
        float _592 = _586 * 6.283185482025146484375;
        float _594 = cos(_592);
        float _596 = fma(_590, _580, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _598 = _582 * _596;
        float _600 = _594 + (-1.0);
        float _602 = fma(_524, _598, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _604 = fma(_528, _598, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _606 = _600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _610 = _602 + _608;
        float _612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _614 = _604 + _612;
        float _616 = fma(_540, _594, _606);
        float _618 = _610 * _610;
        float _620 = _614 * _614;
        _572 = _616;
        _558 = _618;
        _554 = _620;
        _562 = _602;
        _566 = _604;
    }
    float _622 = _572;
    float _624 = _558;
    float _626 = _554;
    float _628 = _562;
    float _630 = _566;
    float _632 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _634 = _622 + _632;
    out.m_47.x = _512;
    float _636 = fma(_634, _634, _624);
    out.m_47.y = _520;
    float _638 = _636 + _626;
    float _640 = sqrt(_638);
    bool _642 = _640 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _644 = isnan(_640);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _650 = _646 || _648;
    float _652 = _624;
    if (!_650)
    {
        _652 = 1.0;
    }
    float _654 = _652;
    bool _656 = !_650;
    float _658 = _654;
    if (!_656)
    {
        bool _660 = _640 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _662 = isnan(_640);
        bool _664 = _660 || _662;
        bool _666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _668 = _664 || _666;
        if (!_668)
        {
            float _670 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _672 = _640 + _670;
            float _674 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _676 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _674;
            float _678 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _680 = _678 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _682 = 1.0 / _676;
            float _684 = _672 * _682;
            float _686 = fma(_684, _680, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _658 = _686;
            _688 = true;
        }
        else
        {
            bool _690 = _640 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _692 = isnan(_640);
            bool _694 = _690 || _692;
            bool _696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _698 = _694 || _696;
            if (!_698)
            {
                float _700 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _702 = _640 + _700;
                float _704 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _706 = _704 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _708 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _710 = _708 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _712 = 1.0 / _706;
                float _714 = _702 * _712;
                float _716 = fma(_714, _710, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _658 = _716;
                _688 = true;
            }
            else
            {
                _658 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _688 = false;
    float _718 = _658;
    float _720 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _722 = _622 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _726 = _628 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _730 = _630 + _728;
    float _732 = fma(_722, _718, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _734 = fma(_726, _718, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _736 = fma(_730, _718, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _738 = _732 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _740 = _732 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _742 = _732 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _744 = _732 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _746 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _738);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _740);
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _742);
    float _752 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _744);
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _746);
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _748);
    float _758 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _750);
    float _760 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _752);
    float _762 = _754 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _764 = _756 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _766 = _758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _768 = _760 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _770 = _762 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _772 = _762 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _774 = _762 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _776 = _762 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[4].x, _770);
    float _780 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[5].x, _772);
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[7].x, _774);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[6].x, _776);
    float _786 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].z, _778);
    float _788 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].z, _780);
    float _790 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].z, _782);
    float _792 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].z, _784);
    float _794 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _786);
    float _796 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _788);
    float _798 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _790);
    float _800 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _792);
    float _802 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _804 = _794 + _798;
    float _806 = _800 + _798;
    float _808 = _798 * 0.5;
    float _810 = _804 * 0.5;
    float _812 = _806 * 0.5;
    float _814 = fma(_796, -0.5, _808);
    out.m_35.x = _802;
    out.gl_Position.x = _794;
    out.gl_Position.y = _796;
    out.gl_Position.z = _800;
    out.gl_Position.w = _798;
    out.m_49.x = _810;
    out.m_49.y = _814;
    out.m_49.z = _812;
    out.m_49.w = _798;
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _688 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_32.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    float _80 = _78;
    if (!_72)
    {
        out.m_35.x = 0.0;
    }
    int _82 = 0;
    if (!_72)
    {
        float _84 = _78 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _873 = as_type<float>(_86);
        out.gl_Position.z = _873;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _90 = in.m_37.w;
    bool _92 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = isnan(_90);
    bool _96 = _92 || _94;
    bool _98 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _100 = _96 || _98;
    float _102 = -_90;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_100)
    {
        float _106 = float(_68);
        _80 = _106;
    }
    float _108 = _80;
    bool _110 = _104 >= _108;
    bool _112 = !_100;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_35.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _88 = as_type<int>(_118);
    }
    int _120 = _88;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _941 = as_type<float>(_120);
        out.gl_Position.z = _941;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_37.x;
    float _124 = in.m_37.y;
    float _126 = in.m_37.z;
    float _128 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = in.m_32.x;
    float _142 = in.m_32.y;
    float _144 = in.m_32.z;
    float _146 = in.m_39.x;
    float _148 = in.m_39.y;
    float _150 = in.m_39.z;
    float _152 = in.m_39.w;
    float _154 = 0.0;
    float _156 = _128;
    if (!_138)
    {
        float _158 = _128 * _128;
        float _160 = _158 * 0.5;
        _154 = _160;
    }
    float _162 = _154;
    float _164 = _162;
    if (!_138)
    {
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    bool _170 = !_138;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _128 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _128);
        float _200 = _198 * _186;
        float _202 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _202;
    }
    float _204 = _172;
    bool _206 = !_138;
    if (!_206)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = 1.0 / _214;
        float _218 = _128 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    float _230 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _236 = in.m_41.x;
    float _238 = fma(_228, _124, _230);
    float _240 = fma(_228, _122, _232);
    float _242 = fma(_228, _126, _234);
    float _244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _246 = fma(_238, _152, _142);
    float _248 = fma(_240, _152, _140);
    float _250 = fma(_242, _152, _144);
    float _252 = _104 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _254 = _246 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _256 = _246 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _258 = _246 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _260 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _254);
    float _262 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _256);
    float _264 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _258);
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _272 = _270 != 0;
    float _274 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _260);
    float _276 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _262);
    float _278 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _264);
    float _280 = _252 * _244;
    float _282 = _274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _284 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _286 = _278 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _288 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[20].x, _280);
    float _290 = -_282;
    float _292 = _290 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _294 = -_284;
    float _296 = _294 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _298 = -_286;
    float _300 = _298 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _302 = floor(_288);
    float _304 = _292 * _292;
    bool _306 = !_268;
    int _308 = _306 ? 0 : 1;
    float _310 = fma(_296, _296, _304);
    int _312 = abs(_308);
    float _314 = fma(_300, _300, _310);
    float _316 = _288 * 6.283185482025146484375;
    int _318 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _320 = _318 != 0;
    float _322 = _316 * 0.15915493667125701904296875;
    float _324 = rsqrt(_314);
    float _326 = -_302;
    float _328 = _288 + _326;
    bool _330 = !_320;
    int _332 = _330 ? 0 : 1;
    float _334 = float(_312);
    float _336 = -_328;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _340 = abs(_332);
    float _342 = _322 * 6.283185482025146484375;
    float _344 = cos(_342);
    bool _346 = _328 < 0.5;
    float _348 = float(_346);
    float _350 = abs(_338);
    float _352 = _334 * _350;
    float _354 = float(_340);
    float _356 = in.m_43.x;
    float _358 = in.m_43.y;
    float _360 = in.m_43.z;
    float _362 = _296 * _324;
    float _364 = _292 * _324;
    float _366 = _300 * _324;
    float _368 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _370 = _362 * _368;
    float _372 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _374 = _364 * _372;
    float _376 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _378 = _366 * _376;
    float _380 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _382 = -_370;
    float _384 = fma(_366, _380, _382);
    float _386 = fma(_344, 0.5, 0.5);
    float _388 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _390 = -_378;
    float _392 = fma(_364, _388, _390);
    float _394 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _396 = -_374;
    float _398 = fma(_362, _394, _396);
    float _400 = _384 * _384;
    float _402 = -_386;
    float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _406 = !_272;
    int _408 = _406 ? 0 : 1;
    float _410 = fma(_392, _392, _400);
    float _412 = fma(_354, _404, _352);
    int _414 = abs(_408);
    float _416 = -_348;
    float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _420 = fma(_398, _398, _410);
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _356);
    float _424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _358);
    float _426 = rsqrt(_420);
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _360);
    float _430 = float(_414);
    float _432 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _436 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = abs(_418);
    float _440 = fma(_430, _438, _412);
    float _442 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _444 = _440 * _432;
    float _446 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _450 = _440 * _436;
    float _452 = _384 * _426;
    float _454 = _392 * _426;
    float _456 = _440 * _446;
    float _458 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _460 = _398 * _426;
    float _462 = _366 * _452;
    float _464 = _364 * _454;
    float _466 = _458 * _424;
    float _468 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _470 = -_462;
    float _472 = fma(_364, _460, _470);
    float _474 = sqrt(_448);
    float _476 = -_464;
    float _478 = fma(_362, _452, _476);
    float _480 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _482 = _468 * _422;
    float _484 = _466 * _472;
    float _486 = _466 * _478;
    float _488 = _480 * _428;
    float _490 = fma(_482, _454, _484);
    float _492 = fma(_482, _460, _486);
    float _494 = _362 * _460;
    float _496 = fma(_488, _362, _490);
    float _498 = fma(_488, _366, _492);
    float _500 = -_494;
    float _502 = fma(_366, _454, _500);
    float _504 = _474 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _506 = _284 + _496;
    float _508 = _286 + _498;
    float _510 = _466 * _502;
    float _512 = in.m_45.x;
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[8].z, _506);
    float _516 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[10].z, _508);
    float _518 = fma(_482, _452, _510);
    float _520 = in.m_45.y;
    float _522 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _524 = _514 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _528 = _516 + _526;
    float _530 = fma(_488, _364, _518);
    float _532 = _524 * _524;
    float _534 = _528 * _528;
    float _536 = _282 + _530;
    float _538 = _532 + _534;
    float _540 = fma(_504, (*spvDescriptorSet0.vp_c10)._m0[9].z, _536);
    float _542 = sqrt(_538);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = _510;
    float _548 = _282;
    float _550 = _518;
    float _552 = _494;
    float _554 = _534;
    if (!_544)
    {
        _546 = _532;
    }
    float _556 = _546;
    float _558 = _556;
    if (!_544)
    {
        _548 = _514;
    }
    float _560 = _548;
    float _562 = _560;
    if (!_544)
    {
        _550 = _516;
    }
    float _564 = _550;
    float _566 = _564;
    if (!_544)
    {
        _552 = _540;
    }
    float _568 = _552;
    bool _570 = !_544;
    float _572 = _568;
    if (!_570)
    {
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _576 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _578 = _542 + _576;
        float _580 = _540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _582 = rsqrt(_538);
        float _584 = _578 * _574;
        float _586 = _584 * 0.15915493667125701904296875;
        float _588 = _586 * 6.283185482025146484375;
        float _590 = sin(_588);
        float _592 = _586 * 6.283185482025146484375;
        float _594 = cos(_592);
        float _596 = fma(_590, _580, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _598 = _582 * _596;
        float _600 = _594 + (-1.0);
        float _602 = fma(_524, _598, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _604 = fma(_528, _598, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _606 = _600 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _610 = _602 + _608;
        float _612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _614 = _604 + _612;
        float _616 = fma(_540, _594, _606);
        float _618 = _610 * _610;
        float _620 = _614 * _614;
        _572 = _616;
        _558 = _618;
        _554 = _620;
        _562 = _602;
        _566 = _604;
    }
    float _622 = _572;
    float _624 = _558;
    float _626 = _554;
    float _628 = _562;
    float _630 = _566;
    float _632 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _634 = _622 + _632;
    out.m_47.x = _512;
    float _636 = fma(_634, _634, _624);
    out.m_47.y = _520;
    float _638 = _636 + _626;
    float _640 = sqrt(_638);
    bool _642 = _640 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _644 = isnan(_640);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _650 = _646 || _648;
    float _652 = _624;
    if (!_650)
    {
        _652 = 1.0;
    }
    float _654 = _652;
    bool _656 = !_650;
    float _658 = _654;
    if (!_656)
    {
        bool _660 = _640 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _662 = isnan(_640);
        bool _664 = _660 || _662;
        bool _666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _668 = _664 || _666;
        if (!_668)
        {
            float _670 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _672 = _640 + _670;
            float _674 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _676 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _674;
            float _678 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _680 = _678 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _682 = 1.0 / _676;
            float _684 = _672 * _682;
            float _686 = fma(_684, _680, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _658 = _686;
            _688 = true;
        }
        else
        {
            bool _690 = _640 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _692 = isnan(_640);
            bool _694 = _690 || _692;
            bool _696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _698 = _694 || _696;
            if (!_698)
            {
                float _700 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _702 = _640 + _700;
                float _704 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _706 = _704 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _708 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _710 = _708 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _712 = 1.0 / _706;
                float _714 = _702 * _712;
                float _716 = fma(_714, _710, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _658 = _716;
                _688 = true;
            }
            else
            {
                _658 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _688 = false;
    float _718 = _658;
    float _720 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _722 = _622 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _726 = _628 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _730 = _630 + _728;
    float _732 = fma(_722, _718, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _734 = fma(_726, _718, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _736 = fma(_730, _718, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _738 = _732 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _740 = _732 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _742 = _732 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _744 = _732 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _746 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _738);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _740);
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _742);
    float _752 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _744);
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _746);
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _748);
    float _758 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _750);
    float _760 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _752);
    float _762 = _754 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _764 = _756 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _766 = _758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _768 = _760 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _770 = _762 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _772 = _762 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _774 = _762 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _776 = _762 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[4].x, _770);
    float _780 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[5].x, _772);
    float _782 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[7].x, _774);
    float _784 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[6].x, _776);
    float _786 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[4].z, _778);
    float _788 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[5].z, _780);
    float _790 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[7].z, _782);
    float _792 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[6].z, _784);
    float _794 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _786);
    float _796 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _788);
    float _798 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _790);
    float _800 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _792);
    float _802 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _804 = _794 + _798;
    float _806 = _800 + _798;
    float _808 = _798 * 0.5;
    float _810 = _804 * 0.5;
    float _812 = _806 * 0.5;
    float _814 = fma(_796, -0.5, _808);
    out.m_35.x = _802;
    out.gl_Position.x = _794;
    out.gl_Position.y = _796;
    out.gl_Position.z = _800;
    out.gl_Position.w = _798;
    out.m_49.x = _810;
    out.m_49.y = _814;
    out.m_49.z = _812;
    out.m_49.w = _798;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

