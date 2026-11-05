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
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_E [[id(12)]];
    sampler fp_t_tcb_ESmplr [[id(13)]];
    texture3d<float> fp_t_tcb_1C [[id(14)]];
    sampler fp_t_tcb_1CSmplr [[id(15)]];
    texture2d<float> fp_t_tcb_14 [[id(16)]];
    sampler fp_t_tcb_14Smplr [[id(17)]];
    texturecube_array<float> fp_t_tcb_18 [[id(18)]];
    sampler fp_t_tcb_18Smplr [[id(19)]];
    texture2d_array<float> fp_t_tcb_10 [[id(20)]];
    sampler fp_t_tcb_10Smplr [[id(21)]];
    texture2d<float> fp_t_tcb_12 [[id(22)]];
    sampler fp_t_tcb_12Smplr [[id(23)]];
    sampler fp_t_tcb_16Smplr_w [[id(24)]];
    sampler fp_t_tcb_ASmplr_w [[id(25)]];
    sampler fp_t_tcb_CSmplr_w [[id(26)]];
    sampler fp_t_tcb_ESmplr_w [[id(27)]];
    sampler fp_t_tcb_1CSmplr_w [[id(28)]];
    sampler fp_t_tcb_14Smplr_w [[id(29)]];
    sampler fp_t_tcb_18Smplr_w [[id(30)]];
    sampler fp_t_tcb_10Smplr_w [[id(31)]];
    sampler fp_t_tcb_12Smplr_w [[id(32)]];
    constant dm_border_t* dm_border [[id(33)]];
};

struct main0_out
{
    float4 m_80 [[color(0)]];
    float4 m_82 [[color(1)]];
};

struct main0_in
{
    float4 m_67 [[user(locn0)]];
    float4 m_75 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
};

static inline __attribute__((always_inline))
int _88(thread const int& _4920, const device _29& fp_s0)
{
    uint _4923 = uint(int(uint(_4920) >> uint(2)));
    float _4925 = as_type<float>(fp_s0._m0[int(_4923)]);
    int _4927 = _4920 & 3;
    int _4929 = _4927 << 3;
    int _4931 = as_type<int>(_4925) >> _4929;
    int _4933 = extract_bits(_4931, 0u, 16u);
    return _4933;
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
    float _106 = in.m_67.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_67.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = 1.0 / _92;
    float _120 = _98 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _122 = _104 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _124 = _118 * _110;
    float _126 = _118 * _116;
    float2 _2066 = float2(_120, _122);
    float2 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2066, float2(0.0), isnan(_2066))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2066, float2(0.0), isnan(_2066))).xy;
    float _132 = _130.x;
    float _134 = _130.y;
    float2 _2081 = float2(_124, _126);
    float2 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2081, float2(0.0), isnan(_2081))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2081, float2(0.0), isnan(_2081))).xy;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = in.m_69.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_69.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_69.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_71.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_73.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_73.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_71.z;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = (*spvDescriptorSet0.fp_c9)._m0[71].z + (-1.0);
    float _186 = in.m_73.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _194 = _118 * _146;
    float _196 = _118 * _152;
    float _198 = _118 * _158;
    float _200 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _202 = _194 + _200;
    float _204 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _206 = _196 + _204;
    float _208 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _210 = _198 + _208;
    float _212 = _202 * _202;
    float _214 = _210 * _210;
    float _216 = fma(_206, _206, _212);
    float _218 = in.m_71.w;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = sqrt(_216);
    bool _228 = _224 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _230 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _232 = _224 + _230;
    float _234 = 0.0;
    float _236 = _216;
    float _238 = _232;
    if (_228)
    {
        float _240 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _234 = _240;
    }
    float _242 = _234;
    float _244 = _118 * _222;
    float _246 = 0.0;
    if (_228)
    {
        float _248 = _198 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _246 = _248;
    }
    float _250 = _246;
    float _252 = 0.0 + _244;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _250;
    if (_228)
    {
        float _258 = rsqrt(_216);
        _236 = _258;
    }
    float _260 = _236;
    float _262 = fma(_254, _184, 1.0);
    if (_228)
    {
        float _264 = _232 * _242;
        _238 = _264;
    }
    float _266 = _238;
    float _268 = log2(_262);
    float _270 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _272 = 0.0;
    float _274 = _270;
    if (_228)
    {
        float _276 = _266 * 0.15915493667125701904296875;
        _272 = _276;
    }
    float _278 = _272;
    float _280 = _122 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _282 = 0.0;
    float _284 = _278;
    if (_228)
    {
        float _286 = _278 * 6.283185482025146484375;
        float _288 = sin(_286);
        _282 = _288;
    }
    float _290 = _282;
    float _292 = 0.0;
    if (_228)
    {
        float _294 = _278 * 6.283185482025146484375;
        float _296 = cos(_294);
        _292 = _296;
    }
    float _298 = _292;
    float _300 = _268 * 0.693147182464599609375;
    float _302 = _300;
    if (_228)
    {
        float _304 = fma(_290, _250, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _256 = _304;
    }
    float _306 = _256;
    float _308 = precise::min(_280, _270);
    float _310 = _300 * (*spvDescriptorSet0.fp_c9)._m0[72].x;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = _312;
    float _316 = _306;
    if (!_228)
    {
        _302 = _198;
    }
    float _318 = _302;
    float _320 = _318;
    if (_228)
    {
        float _322 = _260 * _306;
        _284 = _322;
    }
    float _324 = _284;
    float _326 = _312 * (*spvDescriptorSet0.fp_c9)._m0[71].z;
    if (!_228)
    {
        _314 = _194;
    }
    float _328 = _314;
    float _330 = _328;
    if (_228)
    {
        float _332 = _298 + (-1.0);
        _274 = _332;
    }
    float _334 = _274;
    float _336 = floor(_308);
    float _338 = _334;
    if (_228)
    {
        float _340 = fma(_202, _324, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _330 = _340;
    }
    float _342 = _330;
    float _344 = precise::min(_184, _326);
    if (_228)
    {
        float _346 = _334 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _316 = _346;
    }
    float _348 = _316;
    if (!_228)
    {
        _338 = _196;
    }
    float _350 = _338;
    float _352 = _350;
    if (_228)
    {
        float _354 = fma(_206, _324, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _352 = _354;
    }
    float _356 = _352;
    float _358 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _360 = _342 + _358;
    if (_228)
    {
        float _362 = fma(_198, _298, _348);
        _320 = _362;
    }
    float _364 = _320;
    float _366 = floor(_344);
    float _368 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _370 = _356 + _368;
    float _372 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _374 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _376 = _364 + _374;
    float _378 = _120 * (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _380 = _376 * _376;
    float _382 = precise::min(_378, _372);
    float _384 = fma(_370, _370, _380);
    float _386 = in.m_71.x;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = fma(_336, (*spvDescriptorSet0.fp_c9)._m0[71].x, _382);
    float _394 = fma(_360, _360, _384);
    float _396 = _366 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _398 = _118 * _170;
    float _400 = in.m_73.w;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = fma(_396, (*spvDescriptorSet0.fp_c9)._m0[71].x, _392);
    float _408 = rsqrt(_394);
    float _410 = trunc(_406);
    int _412 = int(_410);
    float _414 = _408 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _416 = _118 * _176;
    float _418 = precise::max(0.0, _192);
    float _420 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _422 = _194 + _420;
    float _424 = _370 * _414;
    float _426 = _360 * _414;
    float _428 = _118 * _390;
    float _430 = _424 * _424;
    float _432 = _426 * _426;
    int _434 = as_type<int>((*spvDescriptorSet0.fp_c9)._m0[71].w) * as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x);
    int _436 = _434 + _412;
    float _438 = _118 * _164;
    float _440 = _118 * _182;
    float _442 = _430 + _432;
    float _444 = _118 * _190;
    float _446 = _438 * _438;
    int _448 = _436 * 136;
    float _450 = sqrt(_442);
    float _452 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _454 = _196 + _452;
    float _456 = fma(_428, _428, _446);
    float _458 = _398 * _398;
    int _460 = _448 + 4;
    float _462 = fma(_454, _454, _214);
    float _464 = fma(_440, _440, _456);
    float _466 = fma(_416, _416, _458);
    float _468 = -_414;
    float _470 = -_418;
    float _472 = fma(_376, _468, _470);
    uint _475 = uint(int(uint(_448) >> uint(2)));
    packed_uint2 _dmw0 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s0)._m0[int(_475)];
    float _477 = as_type<float>(_dmw0.x);
    float _479 = fma(_444, _444, _466);
    float _481 = rsqrt(_464);
    uint _483 = uint(int(uint(_460) >> uint(2)));
    float _485 = as_type<float>(_dmw0.y);
    float _487 = fma(_422, _422, _462);
    bool _489 = _450 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _491 = rsqrt(_479);
    float _493 = _376;
    float _495 = _418;
    float _497 = _462;
    float _499 = _424;
    float _501 = _426;
    if (!_489)
    {
        _493 = _432;
    }
    float _503 = _493;
    float _505 = _503;
    if (!_489)
    {
        _495 = _430;
    }
    float _507 = _495;
    float _509 = _507;
    if (!_489)
    {
        _497 = _472;
    }
    float _511 = _497;
    bool _513 = !_489;
    float _515 = _511;
    if (!_513)
    {
        float _517 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _519 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _521 = _450 + _519;
        float _523 = rsqrt(_442);
        float _525 = _521 * _517;
        float _527 = _472 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _529 = _525 * 0.15915493667125701904296875;
        float _531 = _529 * 6.283185482025146484375;
        float _533 = sin(_531);
        float _535 = _529 * 6.283185482025146484375;
        float _537 = cos(_535);
        float _539 = fma(_533, _527, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _541 = _523 * _539;
        float _543 = _537 + (-1.0);
        float _545 = _424 * _541;
        float _547 = _426 * _541;
        float _549 = _543 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _551 = _547 * _547;
        float _553 = fma(_472, _537, _549);
        float _555 = _545 * _545;
        _515 = _553;
        _509 = _555;
        _505 = _551;
        _499 = _545;
        _501 = _547;
    }
    float _557 = _515;
    float _559 = _509;
    float _561 = _505;
    float _563 = _499;
    float _565 = _501;
    float _567 = fma(_557, _557, _559);
    float _569 = _444 * _491;
    float _571 = _438 * _481;
    float _573 = _416 * _491;
    float _575 = _567 + _561;
    float _577 = _428 * _481;
    float _579 = _440 * _481;
    float _581 = _398 * _491;
    float _583 = rsqrt(_575);
    float _585 = _577 * _569;
    float _587 = _118 * _404;
    float _589 = _571 * _573;
    float _591 = _579 * _581;
    float _593 = -_585;
    float _595 = fma(_579, _573, _593);
    float _597 = in.m_75.w;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = -_589;
    float _605 = fma(_577, _581, _603);
    float _607 = sqrt(_487);
    float _609 = _587 * _595;
    float _611 = -_591;
    float _613 = fma(_571, _569, _611);
    float _615 = fma(_134, 2.0, -1.0);
    float _617 = fma(_132, 2.0, -1.0);
    float _619 = _609 * _609;
    float _621 = _583 * _563;
    float _623 = _583 * _557;
    float _625 = _587 * _613;
    float _627 = _583 * _565;
    float _629 = _621 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _631 = _587 * _605;
    float _633 = fma(_625, _625, _619);
    float _635 = -_629;
    float _637 = fma(_623, (*spvDescriptorSet0.fp_c9)._m0[69].y, _635);
    float _639 = spvFAdd(_607, 9.9999997473787516355514526367188e-06);
    float _641 = fma(_631, _631, _633);
    float _643 = -_627;
    float _645 = fma(_643, (*spvDescriptorSet0.fp_c9)._m0[69].z, _637);
    float _647 = fma(_140, 2.007874011993408203125, -1.007874011993408203125);
    float _649 = 1.0 / _639;
    float _651 = fma(_138, 2.007874011993408203125, -1.007874011993408203125);
    float2 _2852 = float2(_124, _126);
    float3 _655 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2852, float2(0.0), isnan(_2852))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2852, float2(0.0), isnan(_2852))).xyz;
    float _657 = _655.x;
    float _659 = _655.y;
    float _661 = _655.z;
    float _663 = _647 * _647;
    float _665 = gl_FragCoord.x;
    float _667 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _669 = _665 / _667;
    float _671 = fma(_617, (*spvDescriptorSet0.fp_c9)._m0[983].z, _120);
    float _673 = fma(_651, _651, _663);
    float _675 = rsqrt(_641);
    float _677 = fma(_645, -0.5, 0.5);
    float _679 = fma(_645, 0.5, 0.5);
    float _681 = -_673;
    float _683 = _681 + 1.0;
    float _685 = precise::clamp(_683, 0.0, 1.0);
    float _687 = _118 * _601;
    float _689 = fma(_679, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _691 = sqrt(_677);
    float _693 = _454 * _649;
    float _695 = _210 * _649;
    float _697 = _422 * _649;
    float _699 = fma(_679, _689, -0.212114393711090087890625);
    float _701 = sqrt(_685);
    float _703 = _675 * _647;
    float _705 = fma(_679, _699, 1.570728778839111328125);
    float _707 = _609 * _703;
    float _709 = _625 * _703;
    float _711 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _713 = fma(_607, (*spvDescriptorSet0.fp_c9)._m0[63].x, _711);
    float _715 = precise::clamp(_713, 0.0, 1.0);
    float _717 = _691 * 0.636619746685028076171875;
    float _719 = fma(_581, _651, _707);
    float _721 = _631 * _703;
    float _723 = fma(_573, _651, _709);
    float _725 = -_705;
    float _727 = fma(_717, _725, 1.0);
    float _729 = -_715;
    float _731 = _729 + 1.0;
    float _733 = fma(_569, _651, _721);
    float _735 = gl_FragCoord.y;
    float _737 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _739 = _735 / _737;
    float _741 = fma(_571, _701, _719);
    float _743 = fma(_577, _701, _723);
    float _745 = fma(_579, _701, _733);
    float _747 = abs(_731);
    float _749 = log2(_747);
    float _751 = _741 * _741;
    float _753 = in.m_77.w;
    float _755 = gl_FragCoord.w;
    float _757 = _753 * _755;
    float _759 = _669 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _761 = fma(_743, _743, _751);
    float _763 = (*spvDescriptorSet0.fp_c11)._m0[45].w * 7.0;
    float _765 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _767 = fma(_745, _745, _761);
    float _769 = rsqrt(_767);
    float _771 = _749 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _773 = exp2(_771);
    float _775 = _739 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _777 = _743 * _769;
    float _779 = _741 * _769;
    float _781 = _745 * _769;
    float _783 = _623 + 1.0;
    float _785 = in.m_75.z;
    float _787 = gl_FragCoord.w;
    float _789 = _785 * _787;
    float _791 = fma(_615, (*spvDescriptorSet0.fp_c9)._m0[983].w, _122);
    float _793 = _693 * _777;
    float _795 = _695 * _779;
    float _797 = -_623;
    float _799 = fma(_773, _783, _797);
    float _801 = _118 * _757;
    float _803 = _697 * _781;
    float _805 = _793 + _795;
    float _807 = fma(_799, 0.5, 0.5);
    float _809 = _801 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _811 = _803 + _805;
    float _813 = -_809;
    float _815 = fma(_765, _813, 1.0);
    float _817 = _811 + _811;
    int _819 = 1 & as_type<int>((*spvDescriptorSet0.fp_c9)._m0[40].w);
    bool _821 = _819 != 0;
    float _823 = log2(_815);
    float _825 = -_817;
    float _827 = fma(_777, _825, _693);
    float _829 = -_817;
    float _831 = fma(_779, _829, _695);
    float _833 = -_697;
    float _835 = fma(_781, _817, _833);
    bool _837 = !_821;
    float _839 = _837 ? _122 : _791;
    float _841 = abs(_827);
    float _843 = abs(_831);
    float _845 = precise::max(_841, _843);
    float _847 = abs(_835);
    float _849 = precise::max(_847, _845);
    float _851 = _118 * _789;
    float _853 = _823 * 0.693147182464599609375;
    float _855 = 1.0 / _849;
    float _857 = _853 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float2 _3159 = float2(_851, _687);
    float _859 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3159, float2(0.0), isnan(_3159))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3159, float2(0.0), isnan(_3159))).x;
    float3 _3168 = float3(_759, _775, _857);
    float _861 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_3168, float3(0.0), isnan(_3168))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_3168, float3(0.0), isnan(_3168))).x;
    float2 _3178 = float2(_727, _807);
    float3 _863 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_3178, float2(0.0), isnan(_3178))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_3178, float2(0.0), isnan(_3178))).xyz;
    float _865 = _863.x;
    float _867 = _863.y;
    float _869 = _863.z;
    float _871 = _835 * _855;
    float _873 = _827 * _855;
    float _875 = _831 * _855;
    bool _877 = !_821;
    float _879 = _877 ? _120 : _671;
    float4 _3209 = float4(_873, _875, _871, float(1));
    float4 _3213 = select(_3209, float4(0.0), isnan(_3209));
    float3 _881 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, _3213.xyz, uint(rint(_3213.w)), level(_763)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, _3213.xyz, uint(rint(_3213.w)), level(_763)).xyz;
    float _883 = _881.x;
    float _885 = _881.y;
    float _887 = _881.z;
    float3 _3227 = float3(_879, _839, float(1));
    float3 _3229 = select(_3227, float3(0.0), isnan(_3227));
    float _889 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3229.xy, uint(rint(_3229.z))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3229.xy, uint(rint(_3229.z))).x;
    float2 _3235 = float2(_671, _791);
    float4 _892 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_3235, float2(0.0), isnan(_3235))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_3235, float2(0.0), isnan(_3235))).xyzw;
    float _894 = _892.x;
    float _896 = _892.y;
    float _898 = _892.z;
    float _900 = _892.w;
    float3 _3252 = float3(_879, _839, float(0));
    float3 _3254 = select(_3252, float3(0.0), isnan(_3252));
    float4 _902 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3254.xy, uint(rint(_3254.z))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3254.xy, uint(rint(_3254.z))).xyzw;
    float _904 = _902.x;
    float _906 = _902.y;
    float _908 = _902.z;
    float _910 = _902.w;
    float _912 = _695 + (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _914 = _693 + (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _916 = -(*spvDescriptorSet0.fp_c11)._m0[24].x;
    float _918 = _198 + _916;
    float _920 = _697 + (*spvDescriptorSet0.fp_c9)._m0[69].z;
    float _922 = _912 * _912;
    float _924 = -_793;
    float _926 = -_795;
    float _928 = _924 + _926;
    float _930 = _918 * 6.283185482025146484375;
    float _932 = fma(_914, _914, _922);
    float _934 = _930 * (*spvDescriptorSet0.fp_c11)._m0[40].x;
    bool _936 = 0.0 < (*spvDescriptorSet0.fp_c9)._m0[43].w;
    float _938 = fma(_920, _920, _932);
    float _940 = _934 * 0.15915493667125701904296875;
    float _942 = abs(_811);
    float _944 = fma(_942, -2.5, 1.75);
    float _946 = precise::clamp(_944, 0.0, 1.0);
    float _948 = rsqrt(_938);
    float _950 = in.m_77.z;
    float _952 = gl_FragCoord.w;
    float _954 = _950 * _952;
    bool _956 = as_type<uint>(_477) > 0u;
    bool _958 = as_type<uint>(_485) > 0u;
    float _960 = _940 * 6.283185482025146484375;
    float _962 = sin(_960);
    float _964 = _912 * _948;
    float _966 = _914 * _948;
    float _968 = _920 * _948;
    float _970 = _777 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _972 = _964 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _974 = -_779;
    float _976 = -_970;
    float _978 = fma(_974, (*spvDescriptorSet0.fp_c9)._m0[69].y, _976);
    float _980 = fma(_962, 0.5, 0.5);
    float _982 = fma(0.5, (*spvDescriptorSet0.fp_c11)._m0[45].w, 0.5);
    float _984 = fma(_966, (*spvDescriptorSet0.fp_c9)._m0[69].x, _972);
    float _986 = _966 * _777;
    float _988 = -_781;
    float _990 = fma(_988, (*spvDescriptorSet0.fp_c9)._m0[69].z, _978);
    float _992 = precise::clamp(_990, 0.0, 1.0);
    float _994 = _982 * _982;
    float _996 = _994 * 0.5;
    float _998 = fma(_968, (*spvDescriptorSet0.fp_c9)._m0[69].z, _984);
    float _1000 = precise::clamp(_998, 0.0, 1.0);
    float _1002 = -_964;
    float _1004 = -_986;
    float _1006 = fma(_1002, _779, _1004);
    float _1008 = -_803;
    float _1010 = _1008 + _928;
    float _1012 = precise::clamp(_1010, 0.0, 1.0);
    float _1014 = -_996;
    float _1016 = _1014 + 1.0;
    float _1018 = -_968;
    float _1020 = fma(_1018, _781, _1006);
    float _1022 = precise::clamp(_1020, 0.0, 1.0);
    float _1024 = _1012 * (-9.27999973297119140625);
    float _1026 = fma(_1012, _1016, _996);
    float _1028 = fma(_992, _1016, _996);
    float _1030 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, (*spvDescriptorSet0.fp_c11)._m0[45].w, 0.00999999977648258209228515625);
    float _1032 = precise::clamp(_1030, 0.0, 1.0);
    float _1034 = _1022 * _1022;
    float _1036 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, -0.572000026702880859375, 1.03999996185302734375);
    float _1038 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1040 = _1032 * _1032;
    float _1042 = -_1000;
    float _1044 = _1042 + 1.0;
    float _1046 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1048 = -(*spvDescriptorSet0.fp_c11)._m0[45].w;
    float _1050 = _1048 + 1.0;
    float _1052 = _1040 + (-1.0);
    float _1054 = _1044 * _1044;
    float _1056 = _980 * _980;
    float _1058 = _946 + 1.0;
    float _1060 = fma(_1034, _1052, 1.0);
    float _1062 = _1054 * _1054;
    float _1064 = in.m_77.x;
    float _1066 = gl_FragCoord.w;
    float _1068 = _1064 * _1066;
    float _1070 = in.m_77.y;
    float _1072 = gl_FragCoord.w;
    float _1074 = _1070 * _1072;
    float _1076 = _1060 * _1060;
    float _1078 = _1056 * 0.02500000037252902984619140625;
    float _1080 = _1044 * _1062;
    float _1082 = _1026 * _1028;
    float _1084 = exp2(_1024);
    float _1086 = _1050 * _1050;
    float _1088 = _1040 * 0.31830990314483642578125;
    float _1090 = 1.0 / _1076;
    float _1092 = precise::min(_1086, _1084);
    float _1094 = fma(_1050, _1092, _1038);
    float _1096 = fma(_1080, 0.959999978542327880859375, 0.039999999105930328369140625);
    float _1098 = _1088 * _1090;
    float _1100 = fma(_1094, -1.03999996185302734375, _1036);
    float _1102 = precise::clamp(_1100, 0.0, 1.0);
    float _1104 = fma(_1094, 1.03999996185302734375, _1046);
    float _1106 = precise::clamp(_1104, 0.0, 1.0);
    float _1108 = _118 * _1068;
    float _1110 = _992 * _1098;
    float _1112 = _118 * _1074;
    float _1114 = _118 * _954;
    float _1116 = -(*spvDescriptorSet0.fp_c9)._m0[1001].w;
    float _1118 = fma(_607, (*spvDescriptorSet0.fp_c9)._m0[1000].w, _1116);
    float _1120 = precise::clamp(_1118, 0.0, 1.0);
    float _1122 = fma(_1102, 0.039999999105930328369140625, _1106);
    float _1124 = _1090;
    float _1126 = _1096;
    float _1128 = _1106;
    float _1130 = 0.0;
    float _1132 = 0.0;
    float _1134 = 0.0;
    float _1136 = 0.0;
    if (!_936)
    {
        _1124 = 0.0;
    }
    float _1138 = _1124;
    float _1140 = fma(_659, _1058, _1078);
    float _1142 = fma(_657, _1058, _1078);
    float _1144 = fma(_661, _1058, _1078);
    float _1146 = 1.0 / _1082;
    float _1148 = _1140 * 0.17880000174045562744140625;
    float _1150 = fma(_1142, 0.053149998188018798828125, _1148);
    float _1152 = fma(_1144, 0.01805000007152557373046875, _1150);
    float _1154 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _1156 = 1.0 / _1152;
    float _1158 = _1110 * _1146;
    float _1160 = _1158 * 0.25;
    float _1162 = _1096 * _1160;
    float _1164 = _1138;
    float _1166 = 0.0;
    float _1168 = 0.0;
    if (!_936)
    {
        _1126 = 0.0;
        _1128 = 0.0;
    }
    float _1170 = _1126;
    float _1172 = _1128;
    float _1174 = _1156 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1176 = _1154 * _1174;
    float _1178 = precise::clamp(_1176, 0.0, 1.0);
    bool _1180 = !_936;
    float _1182 = _1170;
    float _1184 = _1172;
    if (!_1180)
    {
        float _1186 = -_198;
        float _1188 = _1186 + (*spvDescriptorSet0.fp_c9)._m0[43].y;
        float _1190 = -_196;
        float _1192 = _1190 + (*spvDescriptorSet0.fp_c9)._m0[43].x;
        float _1194 = -_194;
        float _1196 = _1194 + (*spvDescriptorSet0.fp_c9)._m0[43].z;
        float _1198 = _1188 * _1188;
        float _1200 = fma(_1192, _1192, _1198);
        float _1202 = fma(_1196, _1196, _1200);
        float _1204 = rsqrt(_1202);
        float _1206 = sqrt(_1202);
        float _1208 = _1188 * _1204;
        float _1210 = _1192 * _1204;
        float _1212 = _1196 * _1204;
        float _1214 = -_695;
        float _1216 = _1214 + _1208;
        float _1218 = -_693;
        float _1220 = _1218 + _1210;
        float _1222 = -_697;
        float _1224 = _1222 + _1212;
        float _1226 = _1210 * (*spvDescriptorSet0.fp_c9)._m0[44].x;
        float _1228 = _1216 * _1216;
        float _1230 = -_1206;
        float _1232 = _1230 + (*spvDescriptorSet0.fp_c9)._m0[43].w;
        float _1234 = -_1208;
        float _1236 = -_1226;
        float _1238 = fma(_1234, (*spvDescriptorSet0.fp_c9)._m0[44].y, _1236);
        float _1240 = fma(_1220, _1220, _1228);
        float _1242 = _1232 * (*spvDescriptorSet0.fp_c9)._m0[46].y;
        float _1244 = precise::clamp(_1242, 0.0, 1.0);
        float _1246 = _779 * _1208;
        float _1248 = -_1212;
        float _1250 = fma(_1248, (*spvDescriptorSet0.fp_c9)._m0[44].z, _1238);
        float _1252 = fma(_1224, _1224, _1240);
        float _1254 = fma(_777, _1210, _1246);
        float _1256 = abs(_1244);
        float _1258 = log2(_1256);
        float _1260 = -(*spvDescriptorSet0.fp_c9)._m0[44].w;
        float _1262 = _1250 + _1260;
        float _1264 = fma(_781, _1212, _1254);
        float _1266 = precise::clamp(_1264, 0.0, 1.0);
        float _1268 = rsqrt(_1252);
        float _1270 = _1216 * _1268;
        float _1272 = _1220 * _1268;
        float _1274 = _1224 * _1268;
        float _1276 = _1258 * (*spvDescriptorSet0.fp_c9)._m0[45].w;
        float _1278 = _779 * _1270;
        float _1280 = fma(_777, _1272, _1278);
        float _1282 = exp2(_1276);
        float _1284 = fma(_781, _1274, _1280);
        float _1286 = precise::clamp(_1284, 0.0, 1.0);
        float _1288 = _1286 * _1286;
        float _1290 = fma(_1052, _1288, 1.0);
        float _1292 = _1290 * _1290;
        float _1294 = _1262 * (*spvDescriptorSet0.fp_c9)._m0[46].w;
        float _1296 = precise::clamp(_1294, 0.0, 1.0);
        float _1298 = 1.0 / _1292;
        float _1300 = _1282 * _1296;
        float _1302 = _1266 * _1300;
        float _1304 = _1040 * _1298;
        float _1306 = _1304 * _1302;
        float _1308 = _1306 * (*spvDescriptorSet0.fp_c9)._m0[45].x;
        float _1310 = _1306 * (*spvDescriptorSet0.fp_c9)._m0[45].y;
        float _1312 = _1306 * (*spvDescriptorSet0.fp_c9)._m0[45].z;
        _1182 = _1308;
        _1184 = _1310;
        _1164 = _1312;
    }
    float _1314 = _1182;
    float _1316 = _1184;
    float _1318 = _1164;
    bool _1320 = !_956;
    if (!_1320)
    {
        int _1322 = 0;
        bool _1324;
        do
        {
            int _1326 = _1322;
            float _1328 = _1166;
            float _1330 = _1130;
            float _1332 = _1132;
            int _1334 = _1326 << 1;
            int _1336 = _1334 + _448;
            int _1338 = _1336 + 8;
            int _1340 = _1338;
            int _1342 = _88(_1340, (*spvDescriptorSet0.fp_s0));
            int _1344 = _1326 + 1;
            bool _1346 = uint(_1344) >= as_type<uint>(_477);
            int _1348 = _1342 & 65535;
            int _1350 = _1348 * 48;
            int _1352 = _1350 + 1168;
            uint _1354 = uint(int(uint(_1352) >> uint(2)));
            uint _1356 = uint(int(uint(int(_1354)) >> uint(2)));
            int _1358 = int(_1354) & 3;
            float _1360 = (*spvDescriptorSet0.fp_c9)._m0[int(_1356)][_1358];
            int _1362 = int(_1354) + 1;
            uint _1364 = uint(int(uint(_1362) >> uint(2)));
            int _1366 = _1362 & 3;
            float _1368 = (*spvDescriptorSet0.fp_c9)._m0[int(_1364)][_1366];
            int _1370 = _1350 + 1176;
            uint _1372 = uint(int(uint(_1370) >> uint(2)));
            uint _1374 = uint(int(uint(int(_1372)) >> uint(2)));
            int _1376 = int(_1372) & 3;
            float _1378 = (*spvDescriptorSet0.fp_c9)._m0[int(_1374)][_1376];
            int _1380 = int(_1372) + 1;
            uint _1382 = uint(int(uint(_1380) >> uint(2)));
            int _1384 = _1380 & 3;
            float _1386 = (*spvDescriptorSet0.fp_c9)._m0[int(_1382)][_1384];
            float _1388 = -_198;
            float _1390 = _1388 + _1368;
            float _1392 = -_196;
            float _1394 = _1392 + _1360;
            float _1396 = _1390 * _1390;
            float _1398 = -_194;
            float _1400 = _1398 + _1378;
            float _1402 = fma(_1394, _1394, _1396);
            float _1404 = fma(_1400, _1400, _1402);
            float _1406 = rsqrt(_1404);
            float _1408 = sqrt(_1404);
            float _1410 = _1390 * _1406;
            float _1412 = _1394 * _1406;
            float _1414 = _1400 * _1406;
            float _1416 = -_695;
            float _1418 = _1416 + _1410;
            float _1420 = -_693;
            float _1422 = _1420 + _1412;
            float _1424 = -_1408;
            float _1426 = _1424 + _1386;
            float _1428 = _779 * _1410;
            float _1430 = fma(_777, _1412, _1428);
            float _1432 = _1418 * _1418;
            float _1434 = fma(_781, _1414, _1430);
            float _1436 = precise::clamp(_1434, 0.0, 1.0);
            float _1438 = fma(_1422, _1422, _1432);
            float _1440 = -_697;
            float _1442 = _1440 + _1414;
            float _1444 = fma(_1442, _1442, _1438);
            float _1446 = rsqrt(_1444);
            float _1448 = _1442 * _1446;
            float _1450 = _1418 * _1446;
            int _1452 = _1350 + 1200;
            uint _1454 = uint(int(uint(_1452) >> uint(2)));
            uint _1456 = uint(int(uint(int(_1454)) >> uint(2)));
            int _1458 = int(_1454) & 3;
            float _1460 = (*spvDescriptorSet0.fp_c9)._m0[int(_1456)][_1458];
            float _1462 = _1422 * _1446;
            float _1464 = _779 * _1450;
            float _1466 = fma(_777, _1462, _1464);
            float _1468 = fma(_781, _1448, _1466);
            float _1470 = precise::clamp(_1468, 0.0, 1.0);
            float _1472 = _1470 * _1470;
            float _1474 = fma(_1052, _1472, 1.0);
            float _1476 = _1474 * _1474;
            float _1478 = 1.0 / _1476;
            float _1480 = _1040 * _1478;
            float _1482 = _1426 * _1460;
            float _1484 = precise::clamp(_1482, 0.0, 1.0);
            int _1486 = _1350 + 1192;
            uint _1488 = uint(int(uint(_1486) >> uint(2)));
            uint _1490 = uint(int(uint(int(_1488)) >> uint(2)));
            int _1492 = int(_1488) & 3;
            float _1494 = (*spvDescriptorSet0.fp_c9)._m0[int(_1490)][_1492];
            int _1496 = int(_1488) + 1;
            uint _1498 = uint(int(uint(_1496) >> uint(2)));
            int _1500 = _1496 & 3;
            float _1502 = (*spvDescriptorSet0.fp_c9)._m0[int(_1498)][_1500];
            float _1504 = abs(_1484);
            float _1506 = log2(_1504);
            int _1508 = _1350 + 1184;
            uint _1510 = uint(int(uint(_1508) >> uint(2)));
            uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
            int _1514 = int(_1510) & 3;
            float _1516 = (*spvDescriptorSet0.fp_c9)._m0[int(_1512)][_1514];
            int _1518 = int(_1510) + 1;
            uint _1520 = uint(int(uint(_1518) >> uint(2)));
            int _1522 = _1518 & 3;
            float _1524 = (*spvDescriptorSet0.fp_c9)._m0[int(_1520)][_1522];
            float _1526 = _1506 * _1502;
            float _1528 = exp2(_1526);
            float _1530 = _1436 * _1528;
            float _1532 = _1480 * _1530;
            float _1534 = fma(_1532, _1516, _1328);
            float _1536 = fma(_1532, _1524, _1330);
            float _1538 = fma(_1532, _1494, _1332);
            _1324 = !_1346;
            _1322 = _1344;
            _1166 = _1534;
            _1130 = _1536;
            _1132 = _1538;
            _1134 = _1538;
            _1168 = _1534;
            _1136 = _1536;
        } while (_1324);
    }
    float _1540 = _1134;
    float _1542 = _1168;
    float _1544 = _1136;
    float _1546 = fma(_1178, (*spvDescriptorSet0.fp_c9)._m0[40].y, (*spvDescriptorSet0.fp_c9)._m0[40].x);
    float _1548 = -_889;
    float _1550 = _1548 + 1.0;
    float _1552 = precise::min(_1174, _1546);
    bool _1554 = !_958;
    float _1556 = _1540;
    float _1558 = _1542;
    float _1560 = _1544;
    float _1562 = _1542;
    float _1564 = _1544;
    float _1566 = _1540;
    if (!_1554)
    {
        int _1568 = 0;
        bool _1570;
        do
        {
            int _1572 = _1568;
            float _1574 = _1556;
            float _1576 = _1558;
            float _1578 = _1560;
            int _1580 = _1572 << 1;
            int _1582 = _1580 + _448;
            int _1584 = _1582 + 72;
            int _1586 = _1584;
            int _1588 = _88(_1586, (*spvDescriptorSet0.fp_s0));
            int _1590 = _1572 + 1;
            bool _1592 = uint(_1590) >= as_type<uint>(_485);
            int _1594 = _1588 << 6;
            int _1596 = 4194240 & _1594;
            int _1598 = _1596 + 10384;
            uint _1600 = uint(int(uint(_1598) >> uint(2)));
            uint _1602 = uint(int(uint(int(_1600)) >> uint(2)));
            int _1604 = int(_1600) & 3;
            float _1606 = (*spvDescriptorSet0.fp_c9)._m0[int(_1602)][_1604];
            int _1608 = int(_1600) + 1;
            uint _1610 = uint(int(uint(_1608) >> uint(2)));
            int _1612 = _1608 & 3;
            float _1614 = (*spvDescriptorSet0.fp_c9)._m0[int(_1610)][_1612];
            int _1616 = _1596 + 10392;
            uint _1618 = uint(int(uint(_1616) >> uint(2)));
            uint _1620 = uint(int(uint(int(_1618)) >> uint(2)));
            int _1622 = int(_1618) & 3;
            float _1624 = (*spvDescriptorSet0.fp_c9)._m0[int(_1620)][_1622];
            int _1626 = int(_1618) + 1;
            uint _1628 = uint(int(uint(_1626) >> uint(2)));
            int _1630 = _1626 & 3;
            float _1632 = (*spvDescriptorSet0.fp_c9)._m0[int(_1628)][_1630];
            float _1634 = -_198;
            float _1636 = _1634 + _1614;
            float _1638 = -_196;
            float _1640 = _1638 + _1606;
            float _1642 = _1636 * _1636;
            float _1644 = -_194;
            float _1646 = _1644 + _1624;
            float _1648 = fma(_1640, _1640, _1642);
            float _1650 = fma(_1646, _1646, _1648);
            float _1652 = rsqrt(_1650);
            float _1654 = sqrt(_1650);
            float _1656 = _1636 * _1652;
            float _1658 = _1640 * _1652;
            float _1660 = _1646 * _1652;
            float _1662 = -_693;
            float _1664 = _1662 + _1658;
            float _1666 = -_1654;
            float _1668 = _1666 + _1632;
            float _1670 = -_695;
            float _1672 = _1670 + _1656;
            float _1674 = _1672 * _1672;
            float _1676 = fma(_1664, _1664, _1674);
            float _1678 = -_697;
            float _1680 = _1678 + _1660;
            float _1682 = fma(_1680, _1680, _1676);
            float _1684 = rsqrt(_1682);
            float _1686 = _1672 * _1684;
            float _1688 = _1664 * _1684;
            float _1690 = _1680 * _1684;
            int _1692 = _1596 + 10400;
            uint _1694 = uint(int(uint(_1692) >> uint(2)));
            uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
            int _1698 = int(_1694) & 3;
            float _1700 = (*spvDescriptorSet0.fp_c9)._m0[int(_1696)][_1698];
            int _1702 = int(_1694) + 1;
            uint _1704 = uint(int(uint(_1702) >> uint(2)));
            int _1706 = _1702 & 3;
            float _1708 = (*spvDescriptorSet0.fp_c9)._m0[int(_1704)][_1706];
            float _1710 = _779 * _1686;
            float _1712 = fma(_777, _1688, _1710);
            int _1714 = _1596 + 10436;
            uint _1716 = uint(int(uint(_1714) >> uint(2)));
            uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
            int _1720 = int(_1716) & 3;
            float _1722 = (*spvDescriptorSet0.fp_c9)._m0[int(_1718)][_1720];
            float _1724 = fma(_781, _1690, _1712);
            float _1726 = precise::clamp(_1724, 0.0, 1.0);
            float _1728 = _779 * _1656;
            float _1730 = _1726 * _1726;
            float _1732 = fma(_777, _1658, _1728);
            float _1734 = fma(_1052, _1730, 1.0);
            float _1736 = fma(_781, _1660, _1732);
            float _1738 = precise::clamp(_1736, 0.0, 1.0);
            float _1740 = _1658 * _1700;
            float _1742 = _1734 * _1734;
            float _1744 = -_1656;
            float _1746 = -_1740;
            float _1748 = fma(_1744, _1708, _1746);
            int _1750 = _1596 + 10408;
            uint _1752 = uint(int(uint(_1750) >> uint(2)));
            uint _1754 = uint(int(uint(int(_1752)) >> uint(2)));
            int _1756 = int(_1752) & 3;
            float _1758 = (*spvDescriptorSet0.fp_c9)._m0[int(_1754)][_1756];
            int _1760 = int(_1752) + 1;
            uint _1762 = uint(int(uint(_1760) >> uint(2)));
            int _1764 = _1760 & 3;
            float _1766 = (*spvDescriptorSet0.fp_c9)._m0[int(_1762)][_1764];
            float _1768 = 1.0 / _1742;
            float _1770 = _1668 * _1722;
            float _1772 = precise::clamp(_1770, 0.0, 1.0);
            int _1774 = _1596 + 10444;
            uint _1776 = uint(int(uint(_1774) >> uint(2)));
            uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
            int _1780 = int(_1776) & 3;
            float _1782 = (*spvDescriptorSet0.fp_c9)._m0[int(_1778)][_1780];
            float _1784 = -_1660;
            float _1786 = fma(_1784, _1758, _1748);
            int _1788 = _1596 + 10424;
            uint _1790 = uint(int(uint(_1788) >> uint(2)));
            uint _1792 = uint(int(uint(int(_1790)) >> uint(2)));
            int _1794 = int(_1790) & 3;
            float _1796 = (*spvDescriptorSet0.fp_c9)._m0[int(_1792)][_1794];
            int _1798 = int(_1790) + 1;
            uint _1800 = uint(int(uint(_1798) >> uint(2)));
            int _1802 = _1798 & 3;
            float _1804 = (*spvDescriptorSet0.fp_c9)._m0[int(_1800)][_1802];
            float _1806 = -_1766;
            float _1808 = _1786 + _1806;
            float _1810 = abs(_1772);
            float _1812 = log2(_1810);
            float _1814 = _1808 * _1782;
            float _1816 = precise::clamp(_1814, 0.0, 1.0);
            float _1818 = _1812 * _1804;
            int _1820 = _1596 + 10416;
            uint _1822 = uint(int(uint(_1820) >> uint(2)));
            uint _1824 = uint(int(uint(int(_1822)) >> uint(2)));
            int _1826 = int(_1822) & 3;
            float _1828 = (*spvDescriptorSet0.fp_c9)._m0[int(_1824)][_1826];
            int _1830 = int(_1822) + 1;
            uint _1832 = uint(int(uint(_1830) >> uint(2)));
            int _1834 = _1830 & 3;
            float _1836 = (*spvDescriptorSet0.fp_c9)._m0[int(_1832)][_1834];
            float _1838 = exp2(_1818);
            float _1840 = _1838 * _1816;
            float _1842 = _1738 * _1840;
            float _1844 = _1040 * _1768;
            float _1846 = _1844 * _1842;
            float _1848 = fma(_1846, _1796, _1574);
            float _1850 = fma(_1846, _1828, _1576);
            float _1852 = fma(_1846, _1836, _1578);
            _1570 = !_1592;
            _1568 = _1590;
            _1556 = _1848;
            _1558 = _1850;
            _1560 = _1852;
            _1562 = _1850;
            _1564 = _1852;
            _1566 = _1848;
        } while (_1570);
    }
    float _1854 = _1562;
    float _1856 = _1564;
    float _1858 = _1566;
    float _1860 = _749 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1862 = -_1550;
    float _1864 = fma(_1862, (*spvDescriptorSet0.fp_c11)._m0[46].z, 1.0);
    float _1866 = _904 * _906;
    float _1868 = precise::min((*spvDescriptorSet0.fp_c9)._m0[27].w, 1.0);
    float _1870 = -_910;
    float _1872 = _1870 + 1.0;
    float _1874 = exp2(_1860);
    float _1876 = precise::min(_859, _1864);
    float _1878 = _1868 * _883;
    float _1880 = _1868 * _885;
    float _1882 = _1868 * _887;
    float _1884 = _1868 * 0.31830990314483642578125;
    float _1886 = -_908;
    float _1888 = _1886 + 1.0;
    float _1890 = precise::min(_908, _1876);
    float _1892 = _1854 + _1314;
    float _1894 = -_1878;
    float _1896 = fma(_1108, _1884, _1894);
    float _1898 = -_1880;
    float _1900 = fma(_1112, _1884, _1898);
    float _1902 = -_1882;
    float _1904 = fma(_1114, _1884, _1902);
    float _1906 = -_1872;
    float _1908 = fma(_1906, (*spvDescriptorSet0.fp_c13)._m0[1].w, 1.0);
    float _1910 = fma(_1120, _1896, _1878);
    float _1912 = _1856 + _1316;
    float _1914 = fma(_1120, _1900, _1880);
    float _1916 = _1858 + _1318;
    float _1918 = fma(_1120, _1904, _1882);
    float _1920 = -_1888;
    float _1922 = fma(_1920, (*spvDescriptorSet0.fp_c13)._m0[5].y, 1.0);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = _1866 * _1908;
    float _1928 = _1122 * _1890;
    float _1930 = _1910 + _1892;
    float _1932 = _1914 + _1912;
    float _1934 = -_1874;
    float _1936 = _1934 + 1.0;
    float _1938 = _1918 + _1916;
    float _1940 = _1926 * _1924;
    float _1942 = _1162 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1944 = _1930 * _1928;
    float _1946 = _1552 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _1948 = _1162 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1950 = _1932 * _1928;
    float _1952 = _1936 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1954 = _1938 * _1928;
    float _1956 = _1162 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1958 = fma(_1942, _1940, _1944);
    float _1960 = fma(_1546, (*spvDescriptorSet0.fp_c9)._m0[39].x, _1946);
    float _1962 = fma(_1948, _1940, _1950);
    float _1964 = _1140 * 0.25;
    float _1966 = -_1952;
    float _1968 = _1966 + 1.0;
    float _1970 = _1142 * 0.25;
    float _1972 = fma(_1956, _1940, _1954);
    float _1974 = _1144 * 0.25;
    float _1976 = fma(_1964, _1960, _1962);
    float _1978 = _900 * _1968;
    float _1980 = fma(_1970, _1960, _1958);
    float _1982 = _900 * _861;
    float _1984 = _865 * _1952;
    float _1986 = _867 * _1952;
    float _1988 = fma(_1974, _1960, _1972);
    float _1990 = _869 * _1952;
    float _1992 = fma(_1984, _1982, _894);
    float _1994 = fma(_1986, _1982, _896);
    float _1996 = precise::max(0.0, _1980);
    float _1998 = fma(_1990, _1982, _898);
    float _2000 = precise::max(0.0, _1976);
    float _2002 = precise::max(0.0, _1988);
    float _2004 = fma(_1978, _1996, _1992);
    float _2006 = fma(_1978, _2000, _1994);
    float _2008 = fma(_1978, _2002, _1998);
    out.m_80.x = _2004;
    out.m_80.y = _2006;
    out.m_80.z = _2008;
    out.m_80.w = 1.0;
    out.m_82.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

