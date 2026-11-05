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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
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
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    const device _29* fp_s0 [[id(5)]];
    texture2d<float> fp_t_tcb_16 [[id(6)]];
    sampler fp_t_tcb_16Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    texture2d<float> fp_t_tcb_C [[id(14)]];
    sampler fp_t_tcb_CSmplr [[id(15)]];
    texturecube_array<float> fp_t_tcb_18 [[id(16)]];
    sampler fp_t_tcb_18Smplr [[id(17)]];
    texture3d<float> fp_t_tcb_1C [[id(18)]];
    sampler fp_t_tcb_1CSmplr [[id(19)]];
    texture2d<float> fp_t_tcb_14 [[id(20)]];
    sampler fp_t_tcb_14Smplr [[id(21)]];
    texture2d_array<float> fp_t_tcb_10 [[id(22)]];
    sampler fp_t_tcb_10Smplr [[id(23)]];
    texture2d<float> fp_t_tcb_12 [[id(24)]];
    sampler fp_t_tcb_12Smplr [[id(25)]];
    sampler fp_t_tcb_16Smplr_w [[id(26)]];
    sampler fp_t_tcb_8Smplr_w [[id(27)]];
    sampler fp_t_tcb_ESmplr_w [[id(28)]];
    sampler fp_t_tcb_ASmplr_w [[id(29)]];
    sampler fp_t_tcb_CSmplr_w [[id(30)]];
    sampler fp_t_tcb_18Smplr_w [[id(31)]];
    sampler fp_t_tcb_1CSmplr_w [[id(32)]];
    sampler fp_t_tcb_14Smplr_w [[id(33)]];
    sampler fp_t_tcb_10Smplr_w [[id(34)]];
    sampler fp_t_tcb_12Smplr_w [[id(35)]];
    constant dm_border_t* dm_border [[id(36)]];
};

struct main0_out
{
    float4 m_80 [[color(0)]];
    float4 m_82 [[color(1)]];
};

struct main0_in
{
    float4 m_69 [[user(locn0)]];
    float4 m_75 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
};

static inline __attribute__((always_inline))
int _88(thread const int& _5072, const device _29& fp_s0)
{
    uint _5075 = uint(int(uint(_5072) >> uint(2)));
    float _5077 = as_type<float>(fp_s0._m0[int(_5075)]);
    int _5079 = _5072 & 3;
    int _5081 = _5079 << 3;
    int _5083 = as_type<int>(_5077) >> _5081;
    int _5085 = extract_bits(_5083, 0u, 16u);
    return _5085;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _92 = gl_FragCoord.w;
    float _94 = gl_FragCoord.x;
    float _96 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _98 = _94 / _96;
    float _100 = gl_FragCoord.y;
    float _102 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _104 = _100 / _102;
    float _106 = in.m_69.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_69.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = 1.0 / _92;
    float _120 = _98 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _122 = _104 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _124 = _118 * _110;
    float _126 = _118 * _116;
    float2 _2124 = float2(_120, _122);
    float2 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2124, float2(0.0), isnan(_2124))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2124, float2(0.0), isnan(_2124))).xy;
    float _132 = _130.x;
    float _134 = _130.y;
    float2 _2139 = float2(_126, _124);
    float3 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2139, float2(0.0), isnan(_2139))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2139, float2(0.0), isnan(_2139))).xyz;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float2 _2153 = float2(_126, _124);
    float3 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2153, float2(0.0), isnan(_2153))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2153, float2(0.0), isnan(_2153))).xyz;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float2 _2167 = float2(_126, _124);
    float2 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2167, float2(0.0), isnan(_2167))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2167, float2(0.0), isnan(_2167))).xy;
    float _156 = _154.x;
    float _158 = _154.y;
    float2 _2179 = float2(_126, _124);
    float2 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2179, float2(0.0), isnan(_2179))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2179, float2(0.0), isnan(_2179))).yz;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = in.m_71.z;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_71.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_73.w;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_71.y;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_75.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_75.x;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_73.z;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_75.z;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = (*spvDescriptorSet0.fp_c9)._m0[71].z + (-1.0);
    float _216 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _218 = precise::max(0.0, _216);
    float _220 = _118 * _170;
    float _222 = _118 * _176;
    float _224 = _118 * _182;
    float _226 = _118 * _188;
    float _228 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _230 = _220 + _228;
    float _232 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _234 = _222 + _232;
    float _236 = 0.0 + _224;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _242 = _222 + _240;
    float _244 = _230 * _230;
    float _246 = fma(_238, _214, 1.0);
    float _248 = fma(_234, _234, _244);
    float _250 = sqrt(_248);
    float _252 = log2(_246);
    bool _256 = _250 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _258 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _260 = _250 + _258;
    float _262 = _252 * 0.693147182464599609375;
    float _264 = 0.0;
    float _266 = _248;
    float _268 = _260;
    float _270 = _262;
    float _272 = _216;
    if (_256)
    {
        float _274 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _264 = _274;
    }
    float _276 = _264;
    float _278 = 0.0;
    if (_256)
    {
        float _280 = _226 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _278 = _280;
    }
    float _282 = _278;
    float _284 = _282;
    if (_256)
    {
        float _286 = rsqrt(_248);
        _266 = _286;
    }
    float _288 = _266;
    if (_256)
    {
        float _290 = _260 * _276;
        _268 = _290;
    }
    float _292 = _268;
    float _294 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _296 = 0.0;
    float _298 = _294;
    if (_256)
    {
        float _300 = _292 * 0.15915493667125701904296875;
        _296 = _300;
    }
    float _302 = _296;
    float _304 = _122 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _306 = _182;
    float _308 = _302;
    if (_256)
    {
        float _310 = _302 * 6.283185482025146484375;
        float _312 = sin(_310);
        _306 = _312;
    }
    float _314 = _306;
    float _316 = 0.0;
    if (_256)
    {
        float _318 = _302 * 6.283185482025146484375;
        float _320 = cos(_318);
        _316 = _320;
    }
    float _322 = _316;
    if (_256)
    {
        float _324 = fma(_314, _282, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _284 = _324;
    }
    float _326 = _284;
    float _328 = precise::min(_304, _294);
    float _330 = _262 * (*spvDescriptorSet0.fp_c9)._m0[72].x;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _332;
    float _336 = _326;
    if (!_256)
    {
        _270 = _226;
    }
    float _338 = _270;
    float _340 = _338;
    if (_256)
    {
        float _342 = _288 * _326;
        _308 = _342;
    }
    float _344 = _308;
    float _346 = _332 * (*spvDescriptorSet0.fp_c9)._m0[71].z;
    float _348 = floor(_328);
    if (_256)
    {
        float _350 = _322 + (-1.0);
        _298 = _350;
    }
    float _352 = _298;
    float _354 = _352;
    if (!_256)
    {
        _334 = _220;
    }
    float _356 = _334;
    float _358 = _356;
    if (_256)
    {
        float _360 = fma(_230, _344, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _358 = _360;
    }
    float _362 = _358;
    float _364 = precise::min(_214, _346);
    if (_256)
    {
        float _366 = _352 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _336 = _366;
    }
    float _368 = _336;
    if (!_256)
    {
        _354 = _222;
    }
    float _370 = _354;
    float _372 = _370;
    if (_256)
    {
        float _374 = fma(_234, _344, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _372 = _374;
    }
    float _376 = _372;
    float _378 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].x;
    if (_256)
    {
        float _380 = fma(_226, _322, _368);
        _340 = _380;
    }
    float _382 = _340;
    float _384 = floor(_364);
    float _386 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _388 = _376 + _386;
    float _390 = _120 * (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _392 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _394 = _382 + _392;
    float _396 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _398 = _362 + _396;
    float _400 = _394 * _394;
    float _402 = precise::min(_390, _378);
    float _404 = in.m_73.y;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = fma(_388, _388, _400);
    float _412 = fma(_348, (*spvDescriptorSet0.fp_c9)._m0[71].x, _402);
    float _414 = fma(_398, _398, _410);
    float _416 = in.m_73.x;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = _384 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _424 = _118 * _194;
    float _426 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _428 = _220 + _426;
    float _430 = rsqrt(_414);
    float _432 = fma(_422, (*spvDescriptorSet0.fp_c9)._m0[71].x, _412);
    float _434 = _424 * _424;
    float _436 = trunc(_432);
    int _438 = int(_436);
    float _440 = _430 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _442 = _118 * _206;
    float _444 = _388 * _440;
    float _446 = _398 * _440;
    float _448 = _118 * _408;
    float _450 = _118 * _212;
    float _452 = _444 * _444;
    float _454 = _446 * _446;
    int _456 = as_type<int>((*spvDescriptorSet0.fp_c9)._m0[71].w) * as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x);
    int _458 = _456 + _438;
    float _460 = _118 * _420;
    float _462 = _448 * _448;
    float _464 = _452 + _454;
    float _466 = in.m_75.w;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    int _472 = _458 * 136;
    float _474 = fma(_460, _460, _462);
    float _476 = sqrt(_464);
    float _478 = _118 * _200;
    float _480 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _482 = _226 + _480;
    float _484 = fma(_442, _442, _474);
    int _486 = _472 + 4;
    float _488 = fma(_478, _478, _434);
    float _490 = _482 * _482;
    float _492 = -_440;
    float _494 = -_218;
    float _496 = fma(_394, _492, _494);
    uint _499 = uint(int(uint(_472) >> uint(2)));
    packed_uint2 _dmw0 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s0)._m0[int(_499)];
    float _501 = as_type<float>(_dmw0.x);
    float _503 = fma(_450, _450, _488);
    float _505 = rsqrt(_484);
    float _507 = fma(_242, _242, _490);
    uint _509 = uint(int(uint(_486) >> uint(2)));
    float _511 = as_type<float>(_dmw0.y);
    float _513 = fma(_428, _428, _507);
    bool _515 = _476 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _517 = rsqrt(_503);
    float _519 = _454;
    float _521 = _507;
    float _523 = _452;
    float _525 = _394;
    if (!_515)
    {
        _272 = _454;
    }
    float _527 = _272;
    float _529 = _527;
    if (!_515)
    {
        _519 = _452;
    }
    float _531 = _519;
    float _533 = _531;
    if (!_515)
    {
        _521 = _444;
    }
    float _535 = _521;
    float _537 = _535;
    if (!_515)
    {
        _523 = _496;
    }
    float _539 = _523;
    float _541 = _539;
    if (!_515)
    {
        _525 = _446;
    }
    float _543 = _525;
    bool _545 = !_515;
    float _547 = _543;
    if (!_545)
    {
        float _549 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _551 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _553 = _476 + _551;
        float _555 = _496 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _557 = rsqrt(_464);
        float _559 = _553 * _549;
        float _561 = _559 * 0.15915493667125701904296875;
        float _563 = _561 * 6.283185482025146484375;
        float _565 = sin(_563);
        float _567 = _561 * 6.283185482025146484375;
        float _569 = cos(_567);
        float _571 = fma(_565, _555, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _573 = _557 * _571;
        float _575 = _569 + (-1.0);
        float _577 = _444 * _573;
        float _579 = _575 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _581 = _446 * _573;
        float _583 = _577 * _577;
        float _585 = fma(_496, _569, _579);
        float _587 = _581 * _581;
        _541 = _585;
        _533 = _583;
        _529 = _587;
        _537 = _577;
        _547 = _581;
    }
    float _589 = _541;
    float _591 = _533;
    float _593 = _529;
    float _595 = _537;
    float _597 = _547;
    float _599 = fma(_589, _589, _591);
    float _601 = _460 * _505;
    float _603 = _448 * _505;
    float _605 = _450 * _517;
    float _607 = _599 + _593;
    float _609 = _478 * _517;
    float _611 = _442 * _505;
    float _613 = _118 * _470;
    float _615 = _424 * _517;
    float _617 = _601 * _605;
    float _619 = rsqrt(_607);
    float _621 = _603 * _609;
    float _623 = _611 * _615;
    float _625 = -_617;
    float _627 = fma(_611, _609, _625);
    float _629 = -_621;
    float _631 = fma(_601, _615, _629);
    float _633 = -_623;
    float _635 = fma(_603, _605, _633);
    float _637 = _613 * _627;
    float _639 = sqrt(_513);
    float _641 = _613 * _635;
    float _643 = _613 * _631;
    float _645 = _619 * _595;
    float _647 = _619 * _589;
    float _649 = _619 * _597;
    float _651 = _637 * _637;
    float _653 = _645 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _655 = fma(_641, _641, _651);
    float _657 = -_653;
    float _659 = fma(_647, (*spvDescriptorSet0.fp_c9)._m0[69].y, _657);
    float _661 = spvFAdd(_639, 9.9999997473787516355514526367188e-06);
    float _663 = fma(_643, _643, _655);
    float _665 = -_649;
    float _667 = fma(_665, (*spvDescriptorSet0.fp_c9)._m0[69].z, _659);
    float _669 = 1.0 / _661;
    float _671 = fma(_158, 2.007874011993408203125, -1.007874011993408203125);
    float _673 = fma(_156, 2.007874011993408203125, -1.007874011993408203125);
    float _675 = _671 * _671;
    float _677 = rsqrt(_663);
    float _679 = fma(_667, -0.5, 0.5);
    float _681 = fma(_667, 0.5, 0.5);
    float _683 = fma(_673, _673, _675);
    float _685 = fma(_681, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _687 = -_683;
    float _689 = _687 + 1.0;
    float _691 = precise::clamp(_689, 0.0, 1.0);
    float _693 = _242 * _669;
    float _695 = _482 * _669;
    float _697 = _428 * _669;
    float _699 = sqrt(_679);
    float _701 = fma(_681, _685, -0.212114393711090087890625);
    float _703 = _677 * _671;
    float _705 = fma(_681, _701, 1.570728778839111328125);
    float _707 = sqrt(_691);
    float _709 = _637 * _703;
    float _711 = _641 * _703;
    float _713 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _715 = fma(_639, (*spvDescriptorSet0.fp_c9)._m0[63].x, _713);
    float _717 = precise::clamp(_715, 0.0, 1.0);
    float _719 = fma(_615, _673, _709);
    float _721 = _643 * _703;
    float _723 = fma(_609, _673, _711);
    float _725 = -_717;
    float _727 = _725 + 1.0;
    float _729 = _699 * 0.636619746685028076171875;
    float _731 = fma(_605, _673, _721);
    float _733 = -_705;
    float _735 = fma(_729, _733, 1.0);
    float _737 = abs(_727);
    float _739 = log2(_737);
    float _741 = gl_FragCoord.x;
    float _743 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _745 = _741 / _743;
    float _747 = fma(_603, _707, _719);
    float _749 = fma(_601, _707, _723);
    float _751 = fma(_611, _707, _731);
    float _753 = in.m_77.w;
    float _755 = gl_FragCoord.w;
    float _757 = _753 * _755;
    float _759 = _747 * _747;
    float _761 = _647 + 1.0;
    float _763 = gl_FragCoord.y;
    float _765 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _767 = _763 / _765;
    float _769 = fma(_749, _749, _759);
    float _771 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _773 = fma(_751, _751, _769);
    float _775 = _739 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _777 = rsqrt(_773);
    float _779 = exp2(_775);
    float _781 = _749 * _777;
    float _783 = _747 * _777;
    float _785 = _751 * _777;
    float _787 = _118 * _757;
    float _789 = _693 * _781;
    float _791 = _695 * _783;
    float _793 = _697 * _785;
    float _795 = _787 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _797 = -_647;
    float _799 = fma(_779, _761, _797);
    float _801 = _789 + _791;
    float _803 = -_795;
    float _805 = fma(_771, _803, 1.0);
    float _807 = _793 + _801;
    float _809 = log2(_805);
    int _811 = 1 & as_type<int>((*spvDescriptorSet0.fp_c9)._m0[40].w);
    bool _813 = _811 != 0;
    float _815 = _807 + _807;
    float _817 = -_815;
    float _819 = fma(_781, _817, _693);
    float _821 = -_815;
    float _823 = fma(_783, _821, _695);
    float _825 = -_697;
    float _827 = fma(_785, _815, _825);
    float _829 = _745 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _831 = fma(_799, 0.5, 0.5);
    float _833 = abs(_819);
    float _835 = abs(_823);
    float _837 = precise::max(_833, _835);
    float _839 = abs(_827);
    float _841 = precise::max(_839, _837);
    float _843 = 1.0 / _841;
    float _845 = _827 * _843;
    float _847 = fma(_132, 2.0, -1.0);
    float _849 = fma(_134, 2.0, -1.0);
    float _851 = (*spvDescriptorSet0.fp_c11)._m0[45].w * 7.0;
    float _853 = _819 * _843;
    float _855 = _823 * _843;
    float _857 = fma(_847, (*spvDescriptorSet0.fp_c9)._m0[983].z, _120);
    float _859 = fma(_849, (*spvDescriptorSet0.fp_c9)._m0[983].w, _122);
    float _861 = _809 * 0.693147182464599609375;
    float4 _3235 = float4(_853, _855, _845, float(1));
    float4 _3239 = select(_3235, float4(0.0), isnan(_3235));
    float3 _863 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, _3239.xyz, uint(rint(_3239.w)), level(_851)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, _3239.xyz, uint(rint(_3239.w)), level(_851)).xyz;
    float _865 = _863.x;
    float _867 = _863.y;
    float _869 = _863.z;
    float _871 = _767 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    bool _873 = !_813;
    float _875 = _873 ? _120 : _857;
    float _877 = _861 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    bool _879 = !_813;
    float _881 = _879 ? _122 : _859;
    float3 _3273 = float3(_829, _871, _877);
    float _883 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_3273, float3(0.0), isnan(_3273))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_3273, float3(0.0), isnan(_3273))).x;
    float2 _3283 = float2(_735, _831);
    float3 _885 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_3283, float2(0.0), isnan(_3283))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_3283, float2(0.0), isnan(_3283))).xyz;
    float _887 = _885.x;
    float _889 = _885.y;
    float _891 = _885.z;
    float3 _3298 = float3(_875, _881, float(1));
    float3 _3300 = select(_3298, float3(0.0), isnan(_3298));
    float _893 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3300.xy, uint(rint(_3300.z))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3300.xy, uint(rint(_3300.z))).x;
    float2 _3306 = float2(_857, _859);
    float4 _896 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_3306, float2(0.0), isnan(_3306))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_3306, float2(0.0), isnan(_3306))).xyzw;
    float _898 = _896.x;
    float _900 = _896.y;
    float _902 = _896.z;
    float _904 = _896.w;
    float3 _3323 = float3(_875, _881, float(0));
    float3 _3325 = select(_3323, float3(0.0), isnan(_3323));
    float4 _906 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3325.xy, uint(rint(_3325.z))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3325.xy, uint(rint(_3325.z))).xyzw;
    float _908 = _906.x;
    float _910 = _906.y;
    float _912 = _906.z;
    float _914 = _906.w;
    float _916 = _695 + (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _918 = _693 + (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _920 = _697 + (*spvDescriptorSet0.fp_c9)._m0[69].z;
    bool _922 = 0.0 < (*spvDescriptorSet0.fp_c9)._m0[43].w;
    float _924 = -(*spvDescriptorSet0.fp_c11)._m0[24].x;
    float _926 = _226 + _924;
    float _928 = _916 * _916;
    float _930 = -_789;
    float _932 = -_791;
    float _934 = _930 + _932;
    float _936 = _926 * 6.283185482025146484375;
    float _938 = fma(_918, _918, _928);
    float _940 = in.m_77.y;
    float _942 = gl_FragCoord.w;
    float _944 = _940 * _942;
    float _946 = abs(_807);
    float _948 = fma(_946, -2.5, 1.75);
    float _950 = precise::clamp(_948, 0.0, 1.0);
    float _952 = _936 * (*spvDescriptorSet0.fp_c11)._m0[40].x;
    float _954 = fma(_920, _920, _938);
    float _956 = in.m_77.x;
    float _958 = gl_FragCoord.w;
    float _960 = _956 * _958;
    float _962 = -_793;
    float _964 = _962 + _934;
    float _966 = precise::clamp(_964, 0.0, 1.0);
    float _968 = _952 * 0.15915493667125701904296875;
    float _970 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, (*spvDescriptorSet0.fp_c11)._m0[45].w, 0.00999999977648258209228515625);
    float _972 = precise::clamp(_970, 0.0, 1.0);
    float _974 = _950 + 1.0;
    float _976 = rsqrt(_954);
    float _978 = _972 * _972;
    bool _980 = as_type<uint>(_501) > 0u;
    float _982 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    bool _984 = as_type<uint>(_511) > 0u;
    float _986 = _968 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _916 * _976;
    float _992 = _918 * _976;
    float _994 = _920 * _976;
    float _996 = _990 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _998 = _992 * _781;
    float _1000 = _118 * _944;
    float _1002 = fma(_988, 0.5, 0.5);
    float _1004 = _781 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1006 = fma(_992, (*spvDescriptorSet0.fp_c9)._m0[69].x, _996);
    float _1008 = -_990;
    float _1010 = -_998;
    float _1012 = fma(_1008, _783, _1010);
    float _1014 = fma(0.5, (*spvDescriptorSet0.fp_c11)._m0[45].w, 0.5);
    float _1016 = -_783;
    float _1018 = -_1004;
    float _1020 = fma(_1016, (*spvDescriptorSet0.fp_c9)._m0[69].y, _1018);
    float _1022 = fma(_994, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1006);
    float _1024 = precise::clamp(_1022, 0.0, 1.0);
    float _1026 = in.m_77.z;
    float _1028 = gl_FragCoord.w;
    float _1030 = _1026 * _1028;
    float _1032 = -_994;
    float _1034 = fma(_1032, _785, _1012);
    float _1036 = precise::clamp(_1034, 0.0, 1.0);
    float _1038 = _1014 * _1014;
    float _1040 = _1038 * 0.5;
    float _1042 = _1002 * _1002;
    float _1044 = -_785;
    float _1046 = fma(_1044, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1020);
    float _1048 = precise::clamp(_1046, 0.0, 1.0);
    float _1050 = _978 + (-1.0);
    float _1052 = -_1040;
    float _1054 = _1052 + 1.0;
    float _1056 = _1042 * 0.02500000037252902984619140625;
    float _1058 = _1036 * _1036;
    float _1060 = -_1024;
    float _1062 = _1060 + 1.0;
    float _1064 = fma(_966, _1054, _1040);
    float _1066 = fma(_1048, _1054, _1040);
    float _1068 = fma(_150, _974, _1056);
    float _1070 = _966 * (-9.27999973297119140625);
    float _1072 = fma(_1058, _1050, 1.0);
    float _1074 = fma(_148, _974, _1056);
    float _1076 = fma(_152, _974, _1056);
    float _1078 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, -0.572000026702880859375, 1.03999996185302734375);
    float _1080 = _1068 * 0.17880000174045562744140625;
    float _1082 = _1072 * _1072;
    float _1084 = _1064 * _1066;
    float _1086 = exp2(_1070);
    float _1088 = fma(_1074, 0.053149998188018798828125, _1080);
    float _1090 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1092 = -(*spvDescriptorSet0.fp_c11)._m0[45].w;
    float _1094 = _1092 + 1.0;
    float _1096 = _118 * _960;
    float _1098 = _978 * 0.31830990314483642578125;
    float _1100 = _1094 * _1094;
    float _1102 = 1.0 / _1082;
    float _1104 = _118 * _1030;
    float _1106 = fma(_1076, 0.01805000007152557373046875, _1088);
    float _1108 = _1062 * _1062;
    float _1110 = 1.0 / _1084;
    float _1112 = precise::min(_1100, _1086);
    float _1114 = _1108 * _1108;
    float _1116 = fma(_1094, _1112, _982);
    float _1118 = 1.0 / _1106;
    float _1120 = _1098 * _1102;
    float _1122 = _164 * 0.319999992847442626953125;
    float _1124 = _1062 * _1114;
    float _1126 = -(*spvDescriptorSet0.fp_c9)._m0[1001].w;
    float _1128 = fma(_639, (*spvDescriptorSet0.fp_c9)._m0[1000].w, _1126);
    float _1130 = precise::clamp(_1128, 0.0, 1.0);
    float _1132 = _1048 * _1120;
    float _1134 = _1132 * 0.25;
    float _1136 = fma(_1116, -1.03999996185302734375, _1078);
    float _1138 = precise::clamp(_1136, 0.0, 1.0);
    float _1140 = -_1122;
    float _1142 = _140 + _1140;
    float _1144 = -_1122;
    float _1146 = _142 + _1144;
    float _1148 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _1150 = _1134 * _1110;
    float _1152 = -_1122;
    float _1154 = _144 + _1152;
    float _1156 = _164 * 16.0;
    float _1158 = precise::clamp(_1156, 0.0, 1.0);
    float _1160 = fma(_1116, 1.03999996185302734375, _1090);
    float _1162 = precise::clamp(_1160, 0.0, 1.0);
    float _1164 = _1118 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1166 = fma(_162, _1142, _1122);
    float _1168 = fma(_162, _1146, _1122);
    float _1170 = fma(_162, _1154, _1122);
    float _1172 = _1148 * _1164;
    float _1174 = precise::clamp(_1172, 0.0, 1.0);
    float _1176 = -_1166;
    float _1178 = _1158 + _1176;
    float _1180 = -_1168;
    float _1182 = _1158 + _1180;
    float _1184 = _1158 * _1162;
    float _1186 = fma(_1174, (*spvDescriptorSet0.fp_c9)._m0[40].y, (*spvDescriptorSet0.fp_c9)._m0[40].x);
    float _1188 = -_1170;
    float _1190 = _1158 + _1188;
    float _1192 = fma(_1178, _1124, _1166);
    float _1194 = fma(_1166, _1138, _1184);
    float _1196 = precise::min(_1164, _1186);
    float _1198 = fma(_1182, _1124, _1168);
    float _1200 = precise::min((*spvDescriptorSet0.fp_c9)._m0[27].w, 1.0);
    float _1202 = fma(_1168, _1138, _1184);
    float _1204 = fma(_1190, _1124, _1170);
    float _1206 = fma(_1170, _1138, _1184);
    float _1208 = _1196 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _1210 = _1200 * 0.31830990314483642578125;
    float _1212 = _1204 * _1150;
    float _1214 = _1198 * _1150;
    float _1216 = fma(_1186, (*spvDescriptorSet0.fp_c9)._m0[39].x, _1208);
    float _1218 = _1192 * _1150;
    float _1220 = _1200 * _865;
    float _1222 = _1200 * _867;
    float _1224 = _1200 * _869;
    float _1226 = -_1220;
    float _1228 = fma(_1096, _1210, _1226);
    float _1230 = -_1222;
    float _1232 = fma(_1000, _1210, _1230);
    float _1234 = -_1224;
    float _1236 = fma(_1104, _1210, _1234);
    float _1238 = fma(_1130, _1228, _1220);
    float _1240 = _1220;
    float _1242 = _1104;
    float _1244 = _869;
    float _1246 = 0.0;
    float _1248 = 0.0;
    float _1250 = 0.0;
    float _1252 = 0.0;
    float _1254 = 0.0;
    float _1256 = 0.0;
    if (!_922)
    {
        _1240 = 0.0;
    }
    float _1258 = _1240;
    float _1260 = _1258;
    if (!_922)
    {
        _1242 = 0.0;
        _1244 = 0.0;
    }
    float _1262 = _1242;
    float _1264 = _1244;
    bool _1266 = !_922;
    float _1268 = _1262;
    float _1270 = _1264;
    if (!_1266)
    {
        float _1272 = -_226;
        float _1274 = _1272 + (*spvDescriptorSet0.fp_c9)._m0[43].y;
        float _1276 = -_222;
        float _1278 = _1276 + (*spvDescriptorSet0.fp_c9)._m0[43].x;
        float _1280 = -_220;
        float _1282 = _1280 + (*spvDescriptorSet0.fp_c9)._m0[43].z;
        float _1284 = _1274 * _1274;
        float _1286 = fma(_1278, _1278, _1284);
        float _1288 = fma(_1282, _1282, _1286);
        float _1290 = rsqrt(_1288);
        float _1292 = sqrt(_1288);
        float _1294 = _1274 * _1290;
        float _1296 = _1278 * _1290;
        float _1298 = _1282 * _1290;
        float _1300 = -_695;
        float _1302 = _1300 + _1294;
        float _1304 = -_693;
        float _1306 = _1304 + _1296;
        float _1308 = -_697;
        float _1310 = _1308 + _1298;
        float _1312 = _1302 * _1302;
        float _1314 = -_1292;
        float _1316 = _1314 + (*spvDescriptorSet0.fp_c9)._m0[43].w;
        float _1318 = fma(_1306, _1306, _1312);
        float _1320 = _1316 * (*spvDescriptorSet0.fp_c9)._m0[46].y;
        float _1322 = precise::clamp(_1320, 0.0, 1.0);
        float _1324 = fma(_1310, _1310, _1318);
        float _1326 = abs(_1322);
        float _1328 = log2(_1326);
        float _1330 = rsqrt(_1324);
        float _1332 = _1302 * _1330;
        float _1334 = _1306 * _1330;
        float _1336 = _1310 * _1330;
        float _1338 = _783 * _1332;
        float _1340 = fma(_781, _1334, _1338);
        float _1342 = _1296 * (*spvDescriptorSet0.fp_c9)._m0[44].x;
        float _1344 = fma(_785, _1336, _1340);
        float _1346 = precise::clamp(_1344, 0.0, 1.0);
        float _1348 = _1328 * (*spvDescriptorSet0.fp_c9)._m0[45].w;
        float _1350 = -_1294;
        float _1352 = -_1342;
        float _1354 = fma(_1350, (*spvDescriptorSet0.fp_c9)._m0[44].y, _1352);
        float _1356 = _783 * _1294;
        float _1358 = _1346 * _1346;
        float _1360 = exp2(_1348);
        float _1362 = -_1298;
        float _1364 = fma(_1362, (*spvDescriptorSet0.fp_c9)._m0[44].z, _1354);
        float _1366 = fma(_1050, _1358, 1.0);
        float _1368 = fma(_781, _1296, _1356);
        float _1370 = -(*spvDescriptorSet0.fp_c9)._m0[44].w;
        float _1372 = _1364 + _1370;
        float _1374 = _1366 * _1366;
        float _1376 = fma(_785, _1298, _1368);
        float _1378 = precise::clamp(_1376, 0.0, 1.0);
        float _1380 = _1372 * (*spvDescriptorSet0.fp_c9)._m0[46].w;
        float _1382 = precise::clamp(_1380, 0.0, 1.0);
        float _1384 = 1.0 / _1374;
        float _1386 = _1360 * _1382;
        float _1388 = _1378 * _1386;
        float _1390 = _978 * _1384;
        float _1392 = _1390 * _1388;
        float _1394 = _1392 * (*spvDescriptorSet0.fp_c9)._m0[45].x;
        float _1396 = _1392 * (*spvDescriptorSet0.fp_c9)._m0[45].y;
        float _1398 = _1392 * (*spvDescriptorSet0.fp_c9)._m0[45].z;
        _1268 = _1396;
        _1260 = _1394;
        _1270 = _1398;
    }
    float _1400 = _1268;
    float _1402 = _1260;
    float _1404 = _1270;
    bool _1406 = !_980;
    if (!_1406)
    {
        int _1408 = 0;
        bool _1410;
        do
        {
            int _1412 = _1408;
            float _1414 = _1246;
            float _1416 = _1248;
            float _1418 = _1250;
            int _1420 = _1412 << 1;
            int _1422 = _1420 + _472;
            int _1424 = _1422 + 8;
            int _1426 = _1424;
            int _1428 = _88(_1426, (*spvDescriptorSet0.fp_s0));
            int _1430 = _1412 + 1;
            bool _1432 = uint(_1430) >= as_type<uint>(_501);
            int _1434 = _1428 & 65535;
            int _1436 = _1434 * 48;
            int _1438 = _1436 + 1168;
            uint _1440 = uint(int(uint(_1438) >> uint(2)));
            uint _1442 = uint(int(uint(int(_1440)) >> uint(2)));
            int _1444 = int(_1440) & 3;
            float _1446 = (*spvDescriptorSet0.fp_c9)._m0[int(_1442)][_1444];
            int _1448 = int(_1440) + 1;
            uint _1450 = uint(int(uint(_1448) >> uint(2)));
            int _1452 = _1448 & 3;
            float _1454 = (*spvDescriptorSet0.fp_c9)._m0[int(_1450)][_1452];
            int _1456 = _1436 + 1176;
            uint _1458 = uint(int(uint(_1456) >> uint(2)));
            uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
            int _1462 = int(_1458) & 3;
            float _1464 = (*spvDescriptorSet0.fp_c9)._m0[int(_1460)][_1462];
            int _1466 = int(_1458) + 1;
            uint _1468 = uint(int(uint(_1466) >> uint(2)));
            int _1470 = _1466 & 3;
            float _1472 = (*spvDescriptorSet0.fp_c9)._m0[int(_1468)][_1470];
            float _1474 = -_226;
            float _1476 = _1474 + _1454;
            float _1478 = -_222;
            float _1480 = _1478 + _1446;
            float _1482 = _1476 * _1476;
            float _1484 = -_220;
            float _1486 = _1484 + _1464;
            float _1488 = fma(_1480, _1480, _1482);
            float _1490 = fma(_1486, _1486, _1488);
            float _1492 = rsqrt(_1490);
            float _1494 = sqrt(_1490);
            float _1496 = _1476 * _1492;
            float _1498 = _1480 * _1492;
            float _1500 = _1486 * _1492;
            float _1502 = _783 * _1496;
            float _1504 = -_695;
            float _1506 = _1504 + _1496;
            float _1508 = -_693;
            float _1510 = _1508 + _1498;
            float _1512 = -_1494;
            float _1514 = _1512 + _1472;
            float _1516 = fma(_781, _1498, _1502);
            float _1518 = _1506 * _1506;
            float _1520 = fma(_785, _1500, _1516);
            float _1522 = precise::clamp(_1520, 0.0, 1.0);
            float _1524 = fma(_1510, _1510, _1518);
            float _1526 = -_697;
            float _1528 = _1526 + _1500;
            float _1530 = fma(_1528, _1528, _1524);
            float _1532 = rsqrt(_1530);
            float _1534 = _1510 * _1532;
            float _1536 = _1506 * _1532;
            float _1538 = _1528 * _1532;
            int _1540 = _1436 + 1200;
            uint _1542 = uint(int(uint(_1540) >> uint(2)));
            uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
            int _1546 = int(_1542) & 3;
            float _1548 = (*spvDescriptorSet0.fp_c9)._m0[int(_1544)][_1546];
            float _1550 = _783 * _1536;
            float _1552 = fma(_781, _1534, _1550);
            int _1554 = _1436 + 1192;
            uint _1556 = uint(int(uint(_1554) >> uint(2)));
            uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
            int _1560 = int(_1556) & 3;
            float _1562 = (*spvDescriptorSet0.fp_c9)._m0[int(_1558)][_1560];
            int _1564 = int(_1556) + 1;
            uint _1566 = uint(int(uint(_1564) >> uint(2)));
            int _1568 = _1564 & 3;
            float _1570 = (*spvDescriptorSet0.fp_c9)._m0[int(_1566)][_1568];
            float _1572 = fma(_785, _1538, _1552);
            float _1574 = precise::clamp(_1572, 0.0, 1.0);
            float _1576 = _1574 * _1574;
            float _1578 = fma(_1050, _1576, 1.0);
            float _1580 = _1578 * _1578;
            float _1582 = 1.0 / _1580;
            float _1584 = _978 * _1582;
            float _1586 = _1514 * _1548;
            float _1588 = precise::clamp(_1586, 0.0, 1.0);
            int _1590 = _1436 + 1184;
            uint _1592 = uint(int(uint(_1590) >> uint(2)));
            uint _1594 = uint(int(uint(int(_1592)) >> uint(2)));
            int _1596 = int(_1592) & 3;
            float _1598 = (*spvDescriptorSet0.fp_c9)._m0[int(_1594)][_1596];
            int _1600 = int(_1592) + 1;
            uint _1602 = uint(int(uint(_1600) >> uint(2)));
            int _1604 = _1600 & 3;
            float _1606 = (*spvDescriptorSet0.fp_c9)._m0[int(_1602)][_1604];
            float _1608 = abs(_1588);
            float _1610 = log2(_1608);
            float _1612 = _1610 * _1570;
            float _1614 = exp2(_1612);
            float _1616 = _1522 * _1614;
            float _1618 = _1584 * _1616;
            float _1620 = fma(_1618, _1598, _1414);
            float _1622 = fma(_1618, _1606, _1416);
            float _1624 = fma(_1618, _1562, _1418);
            _1410 = !_1432;
            _1408 = _1430;
            _1246 = _1620;
            _1248 = _1622;
            _1250 = _1624;
            _1252 = _1620;
            _1254 = _1622;
            _1256 = _1624;
        } while (_1410);
    }
    float _1626 = _1252;
    float _1628 = _1254;
    float _1630 = _1256;
    float _1632 = fma(_1130, _1232, _1222);
    bool _1634 = !_984;
    float _1636 = _1626;
    float _1638 = _1628;
    float _1640 = _1630;
    float _1642 = _1628;
    float _1644 = _1626;
    float _1646 = _1630;
    if (!_1634)
    {
        int _1648 = 0;
        bool _1650;
        do
        {
            int _1652 = _1648;
            float _1654 = _1636;
            float _1656 = _1638;
            float _1658 = _1640;
            int _1660 = _1652 << 1;
            int _1662 = _1660 + _472;
            int _1664 = _1662 + 72;
            int _1666 = _1664;
            int _1668 = _88(_1666, (*spvDescriptorSet0.fp_s0));
            int _1670 = _1652 + 1;
            bool _1672 = uint(_1670) >= as_type<uint>(_511);
            int _1674 = _1668 << 6;
            int _1676 = 4194240 & _1674;
            int _1678 = _1676 + 10384;
            uint _1680 = uint(int(uint(_1678) >> uint(2)));
            uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
            int _1684 = int(_1680) & 3;
            float _1686 = (*spvDescriptorSet0.fp_c9)._m0[int(_1682)][_1684];
            int _1688 = int(_1680) + 1;
            uint _1690 = uint(int(uint(_1688) >> uint(2)));
            int _1692 = _1688 & 3;
            float _1694 = (*spvDescriptorSet0.fp_c9)._m0[int(_1690)][_1692];
            int _1696 = _1676 + 10392;
            uint _1698 = uint(int(uint(_1696) >> uint(2)));
            uint _1700 = uint(int(uint(int(_1698)) >> uint(2)));
            int _1702 = int(_1698) & 3;
            float _1704 = (*spvDescriptorSet0.fp_c9)._m0[int(_1700)][_1702];
            int _1706 = int(_1698) + 1;
            uint _1708 = uint(int(uint(_1706) >> uint(2)));
            int _1710 = _1706 & 3;
            float _1712 = (*spvDescriptorSet0.fp_c9)._m0[int(_1708)][_1710];
            float _1714 = -_226;
            float _1716 = _1714 + _1694;
            float _1718 = -_222;
            float _1720 = _1718 + _1686;
            float _1722 = _1716 * _1716;
            float _1724 = -_220;
            float _1726 = _1724 + _1704;
            float _1728 = fma(_1720, _1720, _1722);
            float _1730 = fma(_1726, _1726, _1728);
            float _1732 = rsqrt(_1730);
            float _1734 = sqrt(_1730);
            float _1736 = _1716 * _1732;
            float _1738 = _1720 * _1732;
            float _1740 = _1726 * _1732;
            float _1742 = -_695;
            float _1744 = _1742 + _1736;
            float _1746 = -_693;
            float _1748 = _1746 + _1738;
            float _1750 = _1744 * _1744;
            float _1752 = -_1734;
            float _1754 = _1752 + _1712;
            float _1756 = fma(_1748, _1748, _1750);
            float _1758 = -_697;
            float _1760 = _1758 + _1740;
            float _1762 = fma(_1760, _1760, _1756);
            float _1764 = rsqrt(_1762);
            int _1766 = _1676 + 10436;
            uint _1768 = uint(int(uint(_1766) >> uint(2)));
            uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
            int _1772 = int(_1768) & 3;
            float _1774 = (*spvDescriptorSet0.fp_c9)._m0[int(_1770)][_1772];
            float _1776 = _1748 * _1764;
            float _1778 = _1744 * _1764;
            float _1780 = _1760 * _1764;
            int _1782 = _1676 + 10400;
            uint _1784 = uint(int(uint(_1782) >> uint(2)));
            uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
            int _1788 = int(_1784) & 3;
            float _1790 = (*spvDescriptorSet0.fp_c9)._m0[int(_1786)][_1788];
            int _1792 = int(_1784) + 1;
            uint _1794 = uint(int(uint(_1792) >> uint(2)));
            int _1796 = _1792 & 3;
            float _1798 = (*spvDescriptorSet0.fp_c9)._m0[int(_1794)][_1796];
            float _1800 = _783 * _1778;
            float _1802 = fma(_781, _1776, _1800);
            int _1804 = _1676 + 10444;
            uint _1806 = uint(int(uint(_1804) >> uint(2)));
            uint _1808 = uint(int(uint(int(_1806)) >> uint(2)));
            int _1810 = int(_1806) & 3;
            float _1812 = (*spvDescriptorSet0.fp_c9)._m0[int(_1808)][_1810];
            float _1814 = fma(_785, _1780, _1802);
            float _1816 = precise::clamp(_1814, 0.0, 1.0);
            float _1818 = _1816 * _1816;
            float _1820 = fma(_1050, _1818, 1.0);
            float _1822 = _1754 * _1774;
            float _1824 = precise::clamp(_1822, 0.0, 1.0);
            int _1826 = _1676 + 10416;
            uint _1828 = uint(int(uint(_1826) >> uint(2)));
            uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
            int _1832 = int(_1828) & 3;
            float _1834 = (*spvDescriptorSet0.fp_c9)._m0[int(_1830)][_1832];
            int _1836 = int(_1828) + 1;
            uint _1838 = uint(int(uint(_1836) >> uint(2)));
            int _1840 = _1836 & 3;
            float _1842 = (*spvDescriptorSet0.fp_c9)._m0[int(_1838)][_1840];
            float _1844 = abs(_1824);
            float _1846 = log2(_1844);
            float _1848 = _1738 * _1790;
            float _1850 = -_1736;
            float _1852 = -_1848;
            float _1854 = fma(_1850, _1798, _1852);
            int _1856 = _1676 + 10408;
            uint _1858 = uint(int(uint(_1856) >> uint(2)));
            uint _1860 = uint(int(uint(int(_1858)) >> uint(2)));
            int _1862 = int(_1858) & 3;
            float _1864 = (*spvDescriptorSet0.fp_c9)._m0[int(_1860)][_1862];
            int _1866 = int(_1858) + 1;
            uint _1868 = uint(int(uint(_1866) >> uint(2)));
            int _1870 = _1866 & 3;
            float _1872 = (*spvDescriptorSet0.fp_c9)._m0[int(_1868)][_1870];
            float _1874 = -_1740;
            float _1876 = fma(_1874, _1864, _1854);
            float _1878 = -_1872;
            float _1880 = _1876 + _1878;
            int _1882 = _1676 + 10424;
            uint _1884 = uint(int(uint(_1882) >> uint(2)));
            uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
            int _1888 = int(_1884) & 3;
            float _1890 = (*spvDescriptorSet0.fp_c9)._m0[int(_1886)][_1888];
            int _1892 = int(_1884) + 1;
            uint _1894 = uint(int(uint(_1892) >> uint(2)));
            int _1896 = _1892 & 3;
            float _1898 = (*spvDescriptorSet0.fp_c9)._m0[int(_1894)][_1896];
            float _1900 = _1880 * _1812;
            float _1902 = precise::clamp(_1900, 0.0, 1.0);
            float _1904 = _1846 * _1898;
            float _1906 = exp2(_1904);
            float _1908 = _1820 * _1820;
            float _1910 = _783 * _1736;
            float _1912 = fma(_781, _1738, _1910);
            float _1914 = 1.0 / _1908;
            float _1916 = _1906 * _1902;
            float _1918 = fma(_785, _1740, _1912);
            float _1920 = precise::clamp(_1918, 0.0, 1.0);
            float _1922 = _1920 * _1916;
            float _1924 = _978 * _1914;
            float _1926 = _1924 * _1922;
            float _1928 = fma(_1926, _1834, _1654);
            float _1930 = fma(_1926, _1842, _1656);
            float _1932 = fma(_1926, _1890, _1658);
            _1650 = !_1672;
            _1648 = _1670;
            _1636 = _1928;
            _1638 = _1930;
            _1640 = _1932;
            _1642 = _1930;
            _1644 = _1928;
            _1646 = _1932;
        } while (_1650);
    }
    float _1934 = _1642;
    float _1936 = _1644;
    float _1938 = _1646;
    float _1940 = _739 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1942 = -_893;
    float _1944 = _1942 + 1.0;
    float _1946 = _1934 + _1400;
    float _1948 = -_914;
    float _1950 = _1948 + 1.0;
    float _1952 = exp2(_1940);
    float _1954 = -_1944;
    float _1956 = fma(_1954, (*spvDescriptorSet0.fp_c11)._m0[46].z, 1.0);
    float _1958 = _1936 + _1402;
    float _1960 = _1938 + _1404;
    float _1962 = fma(_1130, _1236, _1224);
    float _1964 = _908 * _910;
    float _1966 = precise::min(_1956, 1.0);
    float _1968 = -_912;
    float _1970 = _1968 + 1.0;
    float _1972 = -_1950;
    float _1974 = fma(_1972, (*spvDescriptorSet0.fp_c13)._m0[1].w, 1.0);
    float _1976 = _1632 + _1946;
    float _1978 = _1238 + _1958;
    float _1980 = _1962 + _1960;
    float _1982 = precise::min(_912, _1966);
    float _1984 = -_1970;
    float _1986 = fma(_1984, (*spvDescriptorSet0.fp_c13)._m0[5].y, 1.0);
    float _1988 = precise::clamp(_1986, 0.0, 1.0);
    float _1990 = _1964 * _1974;
    float _1992 = _1202 * _1976;
    float _1994 = _1194 * _1978;
    float _1996 = -_1952;
    float _1998 = _1996 + 1.0;
    float _2000 = _1206 * _1980;
    float _2002 = _1990 * _1988;
    float _2004 = _1214 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _2006 = _1982 * _1992;
    float _2008 = _1218 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _2010 = _1982 * _1994;
    float _2012 = _1998 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _2014 = _1982 * _2000;
    float _2016 = _1212 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _2018 = fma(_2004, _2002, _2006);
    float _2020 = fma(_2008, _2002, _2010);
    float _2022 = _1074 * 0.25;
    float _2024 = -_2012;
    float _2026 = _2024 + 1.0;
    float _2028 = _1068 * 0.25;
    float _2030 = fma(_2016, _2002, _2014);
    float _2032 = _1076 * 0.25;
    float _2034 = fma(_2022, _1216, _2020);
    float _2036 = _904 * _2026;
    float _2038 = fma(_2028, _1216, _2018);
    float _2040 = _904 * _883;
    float _2042 = _887 * _2012;
    float _2044 = fma(_2032, _1216, _2030);
    float _2046 = _889 * _2012;
    float _2048 = _891 * _2012;
    float _2050 = fma(_2042, _2040, _898);
    float _2052 = precise::max(0.0, _2034);
    float _2054 = fma(_2046, _2040, _900);
    float _2056 = precise::max(0.0, _2038);
    float _2058 = fma(_2048, _2040, _902);
    float _2060 = precise::max(0.0, _2044);
    float _2062 = fma(_2036, _2052, _2050);
    float _2064 = fma(_2036, _2056, _2054);
    float _2066 = fma(_2036, _2060, _2058);
    out.m_80.x = _2062;
    out.m_80.y = _2064;
    out.m_80.z = _2066;
    out.m_80.w = 1.0;
    out.m_82.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

