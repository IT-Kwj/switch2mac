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
    constant _16* fp_c11 [[id(3)]];
    constant _16* fp_c7 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
    float4 m_53 [[color(1)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_44 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _60 = gl_FragCoord.w;
    float _62 = in.m_44.z;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_44.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_44.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_46.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _60;
    float _88 = _86 * _66;
    float _90 = _86 * _72;
    float _92 = _86 * _78;
    float _94 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _96 = _88 + _94;
    float _98 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _100 = _90 + _98;
    float _102 = _96 * _96;
    float _104 = fma(_100, _100, _102);
    float _106 = sqrt(_104);
    bool _110 = _106 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _112 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _114 = _106 + _112;
    float _116 = _102;
    float _118 = _114;
    float _120 = _78;
    if (_110)
    {
        float _122 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _116 = _122;
    }
    float _124 = _116;
    float _126 = 0.0;
    if (_110)
    {
        float _128 = rsqrt(_104);
        _126 = _128;
    }
    float _130 = _126;
    float _132 = _124;
    float _134 = _130;
    if (_110)
    {
        float _136 = _114 * _124;
        _118 = _136;
    }
    float _138 = _118;
    if (_110)
    {
        float _140 = _92 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _132 = _140;
    }
    float _142 = _132;
    float _144 = 0.0;
    float _146 = _142;
    if (_110)
    {
        float _148 = _138 * 0.15915493667125701904296875;
        _144 = _148;
    }
    float _150 = _144;
    float _152 = 0.0;
    if (_110)
    {
        float _154 = _150 * 6.283185482025146484375;
        float _156 = cos(_154);
        _152 = _156;
    }
    float _158 = _152;
    float _160 = _138;
    if (_110)
    {
        float _162 = _150 * 6.283185482025146484375;
        float _164 = sin(_162);
        _160 = _164;
    }
    float _166 = _160;
    if (_110)
    {
        float _168 = _158 + (-1.0);
        _120 = _168;
    }
    float _170 = _120;
    float _172 = 0.0;
    float _174 = _170;
    if (_110)
    {
        float _176 = _170 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _172 = _176;
    }
    float _178 = _172;
    if (!_110)
    {
        _174 = _90;
    }
    float _180 = _174;
    float _182 = 0.0;
    float _184 = _166;
    float _186 = _180;
    if (_110)
    {
        float _188 = fma(_166, _142, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _182 = _188;
    }
    float _190 = _182;
    if (!_110)
    {
        _146 = _92;
    }
    float _192 = _146;
    float _194 = _192;
    if (_110)
    {
        float _196 = fma(_92, _158, _178);
        _194 = _196;
    }
    float _198 = _194;
    if (!_110)
    {
        _184 = _88;
    }
    float _200 = _184;
    float _202 = _200;
    if (_110)
    {
        float _204 = _130 * _190;
        _134 = _204;
    }
    float _206 = _134;
    float _208 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _210 = _92 + _208;
    float _212 = _206;
    if (_110)
    {
        float _214 = fma(_100, _206, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _186 = _214;
    }
    float _216 = _186;
    float _218 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _220 = _198 + _218;
    float _222 = _220;
    if (_110)
    {
        float _224 = fma(_96, _206, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _202 = _224;
    }
    float _226 = _202;
    float _228 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _230 = _216 + _228;
    float _232 = _220 * _220;
    float _234 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _236 = _226 + _234;
    float _238 = fma(_230, _230, _232);
    float _240 = fma(_236, _236, _238);
    float _242 = rsqrt(_240);
    float _244 = _242 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _246 = _230 * _244;
    float _248 = _236 * _244;
    float _250 = _246 * _246;
    float _252 = _248 * _248;
    float _254 = _250 + _252;
    float _256 = sqrt(_254);
    bool _258 = _256 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _260 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _262 = _256 + _260;
    float _264 = _230;
    float _266 = _232;
    float _268 = _262;
    if (_258)
    {
        float _270 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _264 = _270;
    }
    float _272 = _264;
    if (_258)
    {
        float _274 = rsqrt(_254);
        _266 = _274;
    }
    float _276 = _266;
    if (_258)
    {
        float _278 = _262 * _272;
        _268 = _278;
    }
    float _280 = _268;
    float _282 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _284 = _88 + _282;
    if (_258)
    {
        float _286 = _280 * 0.15915493667125701904296875;
        _212 = _286;
    }
    float _288 = _212;
    float _290 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _292 = _242;
    float _294 = _290;
    float _296 = _288;
    if (_258)
    {
        float _298 = _288 * 6.283185482025146484375;
        float _300 = sin(_298);
        _292 = _300;
    }
    float _302 = _292;
    float _304 = precise::max(0.0, _290);
    float _306 = _96;
    if (_258)
    {
        float _308 = _288 * 6.283185482025146484375;
        float _310 = cos(_308);
        _306 = _310;
    }
    float _312 = _306;
    float _314 = -_244;
    float _316 = -_304;
    float _318 = fma(_220, _314, _316);
    float _320 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _322 = _90 + _320;
    float _324 = _318;
    if (!_258)
    {
        _222 = _246;
    }
    float _326 = _222;
    float _328 = _326;
    if (_258)
    {
        float _330 = _318 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _294 = _330;
    }
    float _332 = _294;
    float _334 = _302;
    float _336 = _332;
    if (_258)
    {
        float _338 = fma(_302, _332, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _334 = _338;
    }
    float _340 = _334;
    float _342 = 0.0;
    if (_258)
    {
        float _344 = _276 * _340;
        _342 = _344;
    }
    float _346 = _342;
    float _348 = _210 * _210;
    float _350 = _312;
    if (_258)
    {
        float _352 = _312 + (-1.0);
        _336 = _352;
    }
    float _354 = _336;
    float _356 = _354;
    if (_258)
    {
        float _358 = _246 * _346;
        _328 = _358;
    }
    float _360 = _328;
    float _362 = fma(_322, _322, _348);
    float _364 = _362;
    if (_258)
    {
        float _366 = _354 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _296 = _366;
    }
    float _368 = _296;
    if (!_258)
    {
        _356 = _248;
    }
    float _370 = _356;
    float _372 = fma(_284, _284, _362);
    float _374 = _370;
    if (!_258)
    {
        _364 = _250;
    }
    float _376 = _364;
    float _378 = _376;
    if (_258)
    {
        float _380 = fma(_318, _312, _368);
        _324 = _380;
    }
    float _382 = _324;
    if (_258)
    {
        float _384 = _248 * _346;
        _374 = _384;
    }
    float _386 = _374;
    if (_258)
    {
        float _388 = _360 * _360;
        _378 = _388;
    }
    float _390 = _378;
    if (!_258)
    {
        _350 = _252;
    }
    float _392 = _350;
    float _394 = sqrt(_372);
    float _396 = _392;
    if (_258)
    {
        float _398 = _386 * _386;
        _396 = _398;
    }
    float _400 = _396;
    float _402 = fma(_382, _382, _390);
    float _404 = in.m_46.x;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = _402 + _400;
    float _412 = rsqrt(_410);
    float _414 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _416 = fma(_394, (*spvDescriptorSet0.fp_c9)._m0[63].x, _414);
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = -_418;
    float _422 = _420 + 1.0;
    float _424 = abs(_422);
    float _426 = log2(_424);
    float _428 = _412 * _360;
    float _430 = _412 * _382;
    float _432 = _412 * _386;
    float _434 = _428 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _436 = -_434;
    float _438 = fma(_430, (*spvDescriptorSet0.fp_c9)._m0[69].y, _436);
    float _440 = -_432;
    float _442 = fma(_440, (*spvDescriptorSet0.fp_c9)._m0[69].z, _438);
    float _444 = _426 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _446 = fma(_442, -0.5, 0.5);
    float _448 = fma(_442, 0.5, 0.5);
    float _450 = _430 + 1.0;
    float _452 = exp2(_444);
    float _454 = fma(_448, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _456 = fma(_448, _454, -0.212114393711090087890625);
    float _458 = sqrt(_446);
    float _460 = fma(_448, _456, 1.570728778839111328125);
    float _462 = -_430;
    float _464 = fma(_452, _450, _462);
    float _466 = _86 * _84;
    float _468 = fma(_464, 0.5, 0.5);
    float _470 = _86 * _408;
    float _472 = _458 * 0.636619746685028076171875;
    float _474 = -_460;
    float _476 = fma(_472, _474, 1.0);
    float2 _1510 = float2(_470, _466);
    float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1510, float2(0.0), isnan(_1510))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1510, float2(0.0), isnan(_1510))).xyz;
    float _482 = _480.x;
    float _484 = _480.y;
    float _486 = _480.z;
    float2 _1526 = float2(_476, _468);
    float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1526, float2(0.0), isnan(_1526))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1526, float2(0.0), isnan(_1526))).xyz;
    float _490 = _488.x;
    float _492 = _488.y;
    float _494 = _488.z;
    float _496 = spvFAdd(_394, 9.9999997473787516355514526367188e-06);
    float _498 = abs(_210);
    bool _500 = _498 > 0.00999999977648258209228515625;
    float _502 = _92 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _504 = 1.0 / _496;
    float _506 = _500 ? _210 : 0.00999999977648258209228515625;
    float _508 = fma(_90, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _502);
    float _510 = in.m_48.w;
    float _512 = gl_FragCoord.w;
    float _514 = _510 * _512;
    float _516 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _518 = _506 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _520 = fma(_88, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _508);
    float _522 = -_516;
    float _524 = exp2(_522);
    float _526 = precise::max(_518, -127.0);
    float _528 = _210 * _504;
    float _530 = _322 * _504;
    float _532 = _520 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _534 = 1.0 / _526;
    float _536 = _528 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _538 = _284 * _504;
    float _540 = fma(_530, (*spvDescriptorSet0.fp_c9)._m0[69].x, _536);
    float _542 = trunc(_532);
    int _545 = int(_542);
    float _547 = fma(_538, (*spvDescriptorSet0.fp_c9)._m0[69].z, _540);
    float _549 = fma(_547, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _551 = -_526;
    float _553 = exp2(_551);
    float _555 = fma(_549, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _557 = _92 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _559 = _86 * _514;
    float _561 = fma(_90, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _557);
    float _563 = -_559;
    float _565 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _567 = _563 + _565;
    float _569 = abs(_555);
    float _571 = log2(_569);
    float _573 = fma(_88, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _561);
    float _575 = _573 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _577 = -_553;
    float _579 = _577 + 1.0;
    float _581 = _394 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _583 = trunc(_575);
    int _585 = int(_583);
    float _587 = _524 * _579;
    float _589 = _571 * 1.5;
    float _591 = _426 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _593 = _587 * _534;
    int _595 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _597 = _545 + _595;
    int _599 = _597 + 1;
    float _601 = exp2(_591);
    bool _603 = _599 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _605 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _607 = _585 + _605;
    int _609 = _607 + 1;
    float _611 = _593 * _581;
    float _613 = exp2(_589);
    int _615 = _599 | _609;
    bool _617 = _615 < 0;
    bool _619 = _617 || _603;
    float _621 = -_611;
    float _623 = exp2(_621);
    bool _625 = _609 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _627 = _625 || _619;
    float _629 = _613 * 12.56637096405029296875;
    float _631 = 1.0 / _629;
    float _633 = as_type<float>(_615);
    if (_627)
    {
        _633 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _635 = _633;
    float _637 = _635;
    if (!_627)
    {
        int _639 = _609 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _641 = _639 + _599;
        float _643 = floor(_532);
        int _645 = _641 << 2;
        int _647 = _641 >> 2;
        int _649 = 12 & _645;
        int _651 = _647 << 4;
        int _653 = _651 + _649;
        float _655 = floor(_575);
        int _657 = _653 + 16256;
        uint _660 = uint(int(uint(_657) >> uint(2)));
        uint _662 = uint(int(uint(int(_660)) >> uint(2)));
        int _664 = int(_660) & 3;
        float _666 = (*spvDescriptorSet0.fp_c9)._m0[int(_662)][_664];
        float _668 = -_655;
        float _670 = _575 + _668;
        float _672 = -_643;
        float _674 = _532 + _672;
        float _676 = rint(_666);
        float _678 = precise::max(_676, 0.0);
        uint _680 = uint(_678);
        uint _682 = clamp(_680, 0u, 65535u);
        float3 _1832 = float3(_674, _670, float(int(_682)));
        float3 _1836 = select(_1832, float3(0.0), isnan(_1832));
        float _684 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1836.xy, uint(rint(_1836.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1836.xy, uint(rint(_1836.z))).x;
        int _686 = _641 << 4;
        int _688 = _686 + 17904;
        int _690 = _653 + 24304;
        uint _692 = uint(int(uint(_690) >> uint(2)));
        uint _694 = uint(int(uint(int(_692)) >> uint(2)));
        int _696 = int(_692) & 3;
        float _698 = (*spvDescriptorSet0.fp_c9)._m0[int(_694)][_696];
        uint _700 = uint(int(uint(_688) >> uint(2)));
        uint _702 = uint(int(uint(int(_700)) >> uint(2)));
        int _704 = int(_700) & 3;
        float _706 = (*spvDescriptorSet0.fp_c9)._m0[int(_702)][_704];
        int _708 = int(_700) + 1;
        uint _710 = uint(int(uint(_708) >> uint(2)));
        int _712 = _708 & 3;
        float _714 = (*spvDescriptorSet0.fp_c9)._m0[int(_710)][_712];
        int _716 = _688 + 8;
        uint _718 = uint(int(uint(_716) >> uint(2)));
        uint _720 = uint(int(uint(int(_718)) >> uint(2)));
        int _722 = int(_718) & 3;
        float _724 = (*spvDescriptorSet0.fp_c9)._m0[int(_720)][_722];
        int _726 = int(_718) + 1;
        uint _728 = uint(int(uint(_726) >> uint(2)));
        int _730 = _726 & 3;
        float _732 = (*spvDescriptorSet0.fp_c9)._m0[int(_728)][_730];
        float _734 = 1.0 / _698;
        float _736 = _92 * _714;
        float _738 = fma(_90, _706, _736);
        float _740 = fma(_88, _724, _738);
        float _742 = _740 + _732;
        float _744 = precise::clamp(_742, 0.0, 1.0);
        float _746 = -_744;
        float _748 = _746 + _684;
        float _750 = _698 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _752 = fma(_734, (*spvDescriptorSet0.fp_c13)._m0[4].w, _748);
        float _754 = _750 * _752;
        float _756 = exp2(_754);
        float _758 = 0.0 + _756;
        float _760 = precise::clamp(_758, 0.0, 1.0);
        float _762 = precise::min(_760, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _637 = _762;
    }
    float _764 = _637;
    float _766 = _567 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _768 = precise::clamp(_766, 0.0, 1.0);
    float _770 = -_764;
    float _772 = _770 + 1.0;
    float _774 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _776 = fma(_774, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _778 = -_601;
    float _780 = _778 + 1.0;
    float _782 = fma(_768, _772, _764);
    float _784 = _776 * _631;
    float _786 = -_623;
    float _788 = _786 + 1.0;
    float _790 = (*spvDescriptorSet0.fp_c11)._m0[35].x * 10.0;
    float _792 = _780 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _794 = precise::min(_782, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _796 = _788 * _784;
    float _798 = _482 * _790;
    float _800 = _484 * _790;
    float _802 = -_792;
    float _804 = _802 + 1.0;
    float _806 = _794 * _796;
    float _808 = _798 * (*spvDescriptorSet0.fp_c7)._m0[15].y;
    float _810 = _792 * _623;
    float _812 = _486 * _790;
    float _814 = _800 * (*spvDescriptorSet0.fp_c7)._m0[15].y;
    float _816 = _806 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _818 = precise::max(0.0, _808);
    float _820 = _623 * _804;
    float _822 = _812 * (*spvDescriptorSet0.fp_c7)._m0[15].y;
    float _824 = fma(_490, _810, _816);
    float _826 = precise::max(0.0, _814);
    float _828 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _830 = _394 + _828;
    float _832 = _820 * _818;
    float _834 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _836 = _394 + _834;
    float _838 = _806 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _840 = precise::max(0.0, _822);
    float _842 = _806 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _844 = _830 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _846 = precise::clamp(_844, 0.0, 1.0);
    float _848 = _836 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _850 = precise::clamp(_848, 0.0, 1.0);
    float _852 = _820 * _826;
    float _854 = fma(_492, _810, _838);
    float _856 = _820 * _840;
    float _858 = fma(_494, _810, _842);
    float _860 = fma(_846, _832, _824);
    float _862 = fma(_850, _832, _824);
    float _864 = fma(_846, _852, _854);
    float _866 = fma(_850, _852, _854);
    float _868 = fma(_846, _856, _858);
    float _870 = fma(_850, _856, _858);
    out.m_51.x = _860;
    out.m_51.y = _864;
    out.m_51.z = _868;
    out.m_51.w = 1.0;
    out.m_53.x = _862;
    out.m_53.y = _866;
    out.m_53.z = _870;
    out.m_53.w = 1.0;
    return out;
}

