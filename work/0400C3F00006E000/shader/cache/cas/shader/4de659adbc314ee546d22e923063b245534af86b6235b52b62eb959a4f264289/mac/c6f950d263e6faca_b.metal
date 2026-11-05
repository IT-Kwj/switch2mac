#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
}

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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c13 [[id(2)]];
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    sampler fp_t_tcb_12Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
    float4 m_49 [[color(1)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_40 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_40.z;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_40.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_40.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / _56;
    float _78 = _76 * _62;
    float _80 = _76 * _68;
    float _82 = _76 * _74;
    float _84 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _86 = _78 + _84;
    float _88 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _90 = _80 + _88;
    float _92 = _86 * _86;
    float _94 = fma(_90, _90, _92);
    float _96 = sqrt(_94);
    bool _100 = _96 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _102 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _104 = _96 + _102;
    float _106 = 0.0;
    float _108 = _104;
    float _110 = _74;
    if (_100)
    {
        float _112 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _106 = _112;
    }
    float _114 = _106;
    float _116 = 0.0;
    if (_100)
    {
        float _118 = rsqrt(_94);
        _116 = _118;
    }
    float _120 = _116;
    float _122 = _114;
    float _124 = _120;
    if (_100)
    {
        float _126 = _104 * _114;
        _108 = _126;
    }
    float _128 = _108;
    if (_100)
    {
        float _130 = _82 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _122 = _130;
    }
    float _132 = _122;
    float _134 = 0.0;
    float _136 = _132;
    if (_100)
    {
        float _138 = _128 * 0.15915493667125701904296875;
        _134 = _138;
    }
    float _140 = _134;
    float _142 = 0.0;
    float _144 = _140;
    if (_100)
    {
        float _146 = _140 * 6.283185482025146484375;
        float _148 = cos(_146);
        _142 = _148;
    }
    float _150 = _142;
    float _152 = _128;
    if (_100)
    {
        float _154 = _140 * 6.283185482025146484375;
        float _156 = sin(_154);
        _152 = _156;
    }
    float _158 = _152;
    float _160 = 0.0;
    if (_100)
    {
        float _162 = _150 + (-1.0);
        _160 = _162;
    }
    float _164 = _160;
    float _166 = _164;
    if (_100)
    {
        float _168 = _164 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _110 = _168;
    }
    float _170 = _110;
    if (!_100)
    {
        _166 = _80;
    }
    float _172 = _166;
    float _174 = 0.0;
    float _176 = _158;
    float _178 = _172;
    if (_100)
    {
        float _180 = fma(_158, _132, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _174 = _180;
    }
    float _182 = _174;
    if (!_100)
    {
        _136 = _82;
    }
    float _184 = _136;
    float _186 = _184;
    if (_100)
    {
        float _188 = fma(_82, _150, _170);
        _186 = _188;
    }
    float _190 = _186;
    if (!_100)
    {
        _176 = _78;
    }
    float _192 = _176;
    float _194 = _192;
    if (_100)
    {
        float _196 = _120 * _182;
        _124 = _196;
    }
    float _198 = _124;
    float _200 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _202 = _82 + _200;
    if (_100)
    {
        float _204 = fma(_90, _198, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _178 = _204;
    }
    float _206 = _178;
    float _208 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _210 = _190 + _208;
    if (_100)
    {
        float _212 = fma(_86, _198, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _194 = _212;
    }
    float _214 = _194;
    float _216 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _218 = _80 + _216;
    float _220 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _222 = _206 + _220;
    float _224 = _210 * _210;
    float _226 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _228 = _214 + _226;
    float _230 = fma(_222, _222, _224);
    float _232 = fma(_228, _228, _230);
    float _234 = rsqrt(_232);
    float _236 = _234 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _238 = _222 * _236;
    float _240 = _228 * _236;
    float _242 = _238 * _238;
    float _244 = _240 * _240;
    float _246 = _242 + _244;
    float _248 = sqrt(_246);
    bool _250 = _248 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _252 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _254 = _248 + _252;
    float _256 = _222;
    float _258 = _224;
    float _260 = _254;
    if (_250)
    {
        float _262 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _256 = _262;
    }
    float _264 = _256;
    if (_250)
    {
        float _266 = rsqrt(_246);
        _258 = _266;
    }
    float _268 = _258;
    float _270 = _268;
    if (_250)
    {
        float _272 = _254 * _264;
        _260 = _272;
    }
    float _274 = _260;
    float _276 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _278 = _78 + _276;
    if (_250)
    {
        float _280 = _274 * 0.15915493667125701904296875;
        _144 = _280;
    }
    float _282 = _144;
    float _284 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _286 = (*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _288 = _282;
    if (_250)
    {
        float _290 = _282 * 6.283185482025146484375;
        float _292 = sin(_290);
        _286 = _292;
    }
    float _294 = _286;
    float _296 = precise::max(0.0, _284);
    float _298 = _234;
    float _300 = _296;
    if (_250)
    {
        float _302 = _282 * 6.283185482025146484375;
        float _304 = cos(_302);
        _298 = _304;
    }
    float _306 = _298;
    float _308 = -_236;
    float _310 = -_296;
    float _312 = fma(_210, _308, _310);
    float _314 = _202 * _202;
    if (_250)
    {
        float _316 = _312 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _300 = _316;
    }
    float _318 = _300;
    float _320 = fma(_218, _218, _314);
    float _322 = _294;
    float _324 = _318;
    float _326 = _320;
    if (_250)
    {
        float _328 = fma(_294, _318, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _322 = _328;
    }
    float _330 = _322;
    float _332 = 0.0;
    float _334 = _330;
    if (_250)
    {
        float _336 = _268 * _330;
        _332 = _336;
    }
    float _338 = _332;
    if (!_250)
    {
        _334 = _312;
    }
    float _340 = _334;
    float _342 = _340;
    if (_250)
    {
        float _344 = _306 + (-1.0);
        _324 = _344;
    }
    float _346 = _324;
    float _348 = _346;
    if (!_250)
    {
        _270 = _238;
    }
    float _350 = _270;
    float _352 = _350;
    if (_250)
    {
        float _354 = _238 * _338;
        _352 = _354;
    }
    float _356 = _352;
    if (_250)
    {
        float _358 = _346 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _288 = _358;
    }
    float _360 = _288;
    float _362 = _360;
    if (!_250)
    {
        _348 = _240;
    }
    float _364 = _348;
    float _366 = _364;
    if (_250)
    {
        float _368 = _240 * _338;
        _366 = _368;
    }
    float _370 = _366;
    if (_250)
    {
        float _372 = fma(_312, _306, _360);
        _342 = _372;
    }
    float _374 = _342;
    float _376 = fma(_278, _278, _320);
    if (!_250)
    {
        _362 = _242;
    }
    float _378 = _362;
    float _380 = _378;
    if (_250)
    {
        float _382 = _356 * _356;
        _380 = _382;
    }
    float _384 = _380;
    if (!_250)
    {
        _326 = _244;
    }
    float _386 = _326;
    float _388 = _386;
    if (_250)
    {
        float _390 = _370 * _370;
        _388 = _390;
    }
    float _392 = _388;
    float _394 = in.m_42.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = sqrt(_376);
    float _402 = fma(_374, _374, _384);
    float _404 = in.m_42.y;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = _402 + _392;
    float _412 = rsqrt(_410);
    float _414 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _416 = fma(_400, (*spvDescriptorSet0.fp_c9)._m0[63].x, _414);
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = -_418;
    float _422 = _420 + 1.0;
    float _424 = abs(_422);
    float _426 = log2(_424);
    float _428 = _412 * _356;
    float _430 = _412 * _374;
    float _432 = _412 * _370;
    float _434 = _428 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _436 = _76 * _408;
    float _438 = -_434;
    float _440 = fma(_430, (*spvDescriptorSet0.fp_c9)._m0[69].y, _438);
    float _442 = -_432;
    float _444 = fma(_442, (*spvDescriptorSet0.fp_c9)._m0[69].z, _440);
    float _446 = _426 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _448 = fma(_444, -0.5, 0.5);
    float _450 = fma(_444, 0.5, 0.5);
    float _452 = _430 + 1.0;
    float _454 = exp2(_446);
    float _456 = fma(_450, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _458 = fma(_450, _456, -0.212114393711090087890625);
    float _460 = sqrt(_448);
    float _462 = fma(_450, _458, 1.570728778839111328125);
    float _464 = _76 * _398;
    float _466 = -_430;
    float _468 = fma(_454, _452, _466);
    float _470 = fma(_468, 0.5, 0.5);
    float _472 = _460 * 0.636619746685028076171875;
    float _474 = -_462;
    float _476 = fma(_472, _474, 1.0);
    float2 _1451 = float2(_464, _436);
    float _478 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1451, float2(0.0), isnan(_1451))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1451, float2(0.0), isnan(_1451))).w;
    float2 _1461 = float2(_476, _470);
    float3 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1461, float2(0.0), isnan(_1461))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1461, float2(0.0), isnan(_1461))).xyz;
    float _484 = _482.x;
    float _486 = _482.y;
    float _488 = _482.z;
    float _490 = spvFAdd(_400, 9.9999997473787516355514526367188e-06);
    float _492 = _82 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _494 = in.m_44.w;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = abs(_202);
    bool _502 = _500 > 0.00999999977648258209228515625;
    float _504 = fma(_80, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _492);
    float _506 = 1.0 / _490;
    float _508 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _510 = _502 ? _202 : 0.00999999977648258209228515625;
    float _512 = fma(_78, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _504);
    float _514 = -_508;
    float _516 = exp2(_514);
    float _518 = _202 * _506;
    float _520 = _218 * _506;
    float _522 = _278 * _506;
    float _524 = _518 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _526 = _512 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _528 = _510 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _530 = fma(_520, (*spvDescriptorSet0.fp_c9)._m0[69].x, _524);
    float _532 = trunc(_526);
    int _535 = int(_532);
    float _537 = precise::max(_528, -127.0);
    float _539 = fma(_522, (*spvDescriptorSet0.fp_c9)._m0[69].z, _530);
    float _541 = _82 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _543 = _76 * _498;
    float _545 = fma(_539, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _547 = fma(_80, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _541);
    float _549 = -_537;
    float _551 = exp2(_549);
    float _553 = -_543;
    float _555 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _557 = _553 + _555;
    float _559 = fma(_545, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _561 = fma(_78, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _547);
    float _563 = _561 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _565 = abs(_559);
    float _567 = log2(_565);
    int _569 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _571 = _535 + _569;
    int _573 = _571 + 1;
    bool _575 = _573 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _577 = 1.0 / _537;
    float _579 = -_551;
    float _581 = _579 + 1.0;
    float _583 = _516 * _581;
    float _585 = _426 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _587 = trunc(_563);
    int _589 = int(_587);
    float _591 = _567 * 1.5;
    float _593 = _400 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _595 = exp2(_591);
    float _597 = _583 * _577;
    int _599 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _601 = _589 + _599;
    int _603 = _601 + 1;
    float _605 = _597 * _593;
    float _607 = exp2(_585);
    int _609 = _573 | _603;
    bool _611 = _609 < 0;
    bool _613 = _611 || _575;
    float _615 = _595 * 12.56637096405029296875;
    float _617 = -_605;
    float _619 = exp2(_617);
    bool _621 = _603 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _623 = _621 || _613;
    float _625 = 1.0 / _615;
    float _627 = _585;
    if (_623)
    {
        _627 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _629 = _627;
    float _631 = _629;
    if (!_623)
    {
        int _633 = _603 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _635 = _633 + _573;
        float _637 = floor(_563);
        int _639 = _635 << 2;
        int _641 = _635 >> 2;
        int _643 = 12 & _639;
        int _645 = _641 << 4;
        int _647 = _645 + _643;
        float _649 = floor(_526);
        int _651 = _647 + 16256;
        uint _654 = uint(int(uint(_651) >> uint(2)));
        uint _656 = uint(int(uint(int(_654)) >> uint(2)));
        int _658 = int(_654) & 3;
        float _660 = (*spvDescriptorSet0.fp_c9)._m0[int(_656)][_658];
        float _662 = -_637;
        float _664 = _563 + _662;
        float _666 = -_649;
        float _668 = _526 + _666;
        float _670 = rint(_660);
        float _672 = precise::max(_670, 0.0);
        uint _674 = uint(_672);
        uint _676 = clamp(_674, 0u, 65535u);
        float3 _1766 = float3(_668, _664, float(int(_676)));
        float3 _1770 = select(_1766, float3(0.0), isnan(_1766));
        float _678 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _1770.xy, uint(rint(_1770.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _1770.xy, uint(rint(_1770.z))).x;
        int _680 = _635 << 4;
        int _682 = _680 + 17904;
        int _684 = _647 + 24304;
        uint _686 = uint(int(uint(_684) >> uint(2)));
        uint _688 = uint(int(uint(int(_686)) >> uint(2)));
        int _690 = int(_686) & 3;
        float _692 = (*spvDescriptorSet0.fp_c9)._m0[int(_688)][_690];
        uint _694 = uint(int(uint(_682) >> uint(2)));
        uint _696 = uint(int(uint(int(_694)) >> uint(2)));
        int _698 = int(_694) & 3;
        float _700 = (*spvDescriptorSet0.fp_c9)._m0[int(_696)][_698];
        int _702 = int(_694) + 1;
        uint _704 = uint(int(uint(_702) >> uint(2)));
        int _706 = _702 & 3;
        float _708 = (*spvDescriptorSet0.fp_c9)._m0[int(_704)][_706];
        int _710 = _682 + 8;
        uint _712 = uint(int(uint(_710) >> uint(2)));
        uint _714 = uint(int(uint(int(_712)) >> uint(2)));
        int _716 = int(_712) & 3;
        float _718 = (*spvDescriptorSet0.fp_c9)._m0[int(_714)][_716];
        int _720 = int(_712) + 1;
        uint _722 = uint(int(uint(_720) >> uint(2)));
        int _724 = _720 & 3;
        float _726 = (*spvDescriptorSet0.fp_c9)._m0[int(_722)][_724];
        float _728 = 1.0 / _692;
        float _730 = _82 * _708;
        float _732 = fma(_80, _700, _730);
        float _734 = fma(_78, _718, _732);
        float _736 = _734 + _726;
        float _738 = precise::clamp(_736, 0.0, 1.0);
        float _740 = -_738;
        float _742 = _740 + _678;
        float _744 = _692 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _746 = fma(_728, (*spvDescriptorSet0.fp_c13)._m0[4].w, _742);
        float _748 = _744 * _746;
        float _750 = exp2(_748);
        float _752 = 0.0 + _750;
        float _754 = precise::clamp(_752, 0.0, 1.0);
        float _756 = precise::min(_754, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _631 = _756;
    }
    float _758 = _631;
    float _760 = _557 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _762 = precise::clamp(_760, 0.0, 1.0);
    float _764 = -_758;
    float _766 = _764 + 1.0;
    float _768 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _770 = fma(_768, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _772 = -_607;
    float _774 = _772 + 1.0;
    float _776 = fma(_762, _766, _758);
    float _778 = _770 * _625;
    float _780 = -_619;
    float _782 = _780 + 1.0;
    float _784 = _774 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _786 = precise::min(_776, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _788 = _782 * _778;
    float _790 = _784 * _619;
    float _792 = _786 * _788;
    float _794 = _792 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _796 = _792 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _798 = _792 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _800 = fma(_484, _790, _794);
    float _802 = fma(_486, _790, _796);
    float _804 = fma(_488, _790, _798);
    out.m_47.x = _800;
    out.m_47.y = _802;
    out.m_47.z = _804;
    out.m_47.w = _478;
    out.m_49.x = _800;
    out.m_49.y = _802;
    out.m_49.z = _804;
    out.m_49.w = _478;
    return out;
}

