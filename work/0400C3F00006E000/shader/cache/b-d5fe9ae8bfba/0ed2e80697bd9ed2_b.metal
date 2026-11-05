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

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    constant _16* fp_c4 [[id(4)]];
    constant _16* fp_c13 [[id(5)]];
    const device _31* fp_s0 [[id(6)]];
    texture2d<float> fp_t_tcb_16 [[id(7)]];
    sampler fp_t_tcb_16Smplr [[id(8)]];
    texture3d<float> fp_t_tcb_18 [[id(9)]];
    sampler fp_t_tcb_18Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texturecube_array<float> fp_t_tcb_14 [[id(13)]];
    sampler fp_t_tcb_14Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_8 [[id(15)]];
    sampler fp_t_tcb_8Smplr [[id(16)]];
    texture2d<float> fp_t_tcb_A [[id(17)]];
    sampler fp_t_tcb_ASmplr [[id(18)]];
    texture3d<float> fp_t_tcb_1C [[id(19)]];
    sampler fp_t_tcb_1CSmplr [[id(20)]];
    texture3d<float> fp_t_tcb_1A [[id(21)]];
    sampler fp_t_tcb_1ASmplr [[id(22)]];
    texture2d<float> fp_t_tcb_10 [[id(23)]];
    sampler fp_t_tcb_10Smplr [[id(24)]];
    sampler fp_t_tcb_16Smplr_w [[id(25)]];
    sampler fp_t_tcb_18Smplr_w [[id(26)]];
    sampler fp_t_tcb_ESmplr_w [[id(27)]];
    sampler fp_t_tcb_14Smplr_w [[id(28)]];
    sampler fp_t_tcb_8Smplr_w [[id(29)]];
    sampler fp_t_tcb_ASmplr_w [[id(30)]];
    sampler fp_t_tcb_1CSmplr_w [[id(31)]];
    sampler fp_t_tcb_1ASmplr_w [[id(32)]];
    sampler fp_t_tcb_10Smplr_w [[id(33)]];
    constant dm_border_t* dm_border [[id(34)]];
};

struct main0_out
{
    float4 m_78 [[color(0)]];
    float4 m_80 [[color(1)]];
};

struct main0_in
{
    float4 m_75 [[user(locn0)]];
    float4 m_71 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
};

static inline __attribute__((always_inline))
int _86(thread const int& _4944, const device _31& fp_s0)
{
    uint _4947 = uint(int(uint(_4944) >> uint(2)));
    float _4949 = as_type<float>(fp_s0._m0[int(_4947)]);
    int _4951 = _4944 & 3;
    int _4953 = _4951 << 3;
    int _4955 = as_type<int>(_4949) >> _4953;
    int _4957 = extract_bits(_4955, 0u, 16u);
    return _4957;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _90 = gl_FragCoord.w;
    float _92 = in.m_69.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_69.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_69.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = 1.0 / _90;
    float _112 = _110 * _96;
    float _114 = _110 * _102;
    float _116 = _110 * _108;
    float _118 = _112 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _120 = _114 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _122 = _116 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _124 = fma(_114, 6.2500002968590706586837768554688e-05, 0.5);
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = _118 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _130 = _120 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _132 = _122 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _134 = fma(_112, 6.2500002968590706586837768554688e-05, 0.5);
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = fma(_128, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _140 = fma(_130, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _142 = fma(_132, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float2 _2100 = float2(_126, _136);
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2100, float2(0.0), isnan(_2100))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2100, float2(0.0), isnan(_2100))).x;
    float3 _2111 = float3(_140, _142, _138);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2111, float3(0.0), isnan(_2111))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2111, float3(0.0), isnan(_2111))).x;
    float _148 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _150 = _112 + _148;
    float _152 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _154 = _114 + _152;
    float _156 = in.m_71.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = gl_FragCoord.y;
    float _164 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _166 = _162 / _164;
    float _168 = _150 * _150;
    float _170 = in.m_71.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = fma(_154, _154, _168);
    float _178 = in.m_71.y;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = (*spvDescriptorSet0.fp_c9)._m0[71].z + (-1.0);
    float _186 = in.m_71.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = sqrt(_176);
    float _194 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _196 = _116 + _194;
    float _198 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _200 = _112 + _198;
    bool _204 = _192 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _206 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _208 = _192 + _206;
    float _210 = _110 * _160;
    float _212 = _166 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _214 = 0.0 + _210;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = 0.0;
    float _220 = _208;
    float _222 = _160;
    float _224 = _176;
    float _226 = (*spvDescriptorSet0.fp_c9)._m0[63].x;
    float _228 = (*spvDescriptorSet0.fp_c9)._m0[71].w;
    if (_204)
    {
        float _230 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _218 = _230;
    }
    float _232 = _218;
    float _234 = fma(_216, _184, 1.0);
    float _236 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _238 = gl_FragCoord.x;
    float _240 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _242 = _238 / _240;
    float _244 = 0.0;
    float _246 = _236;
    if (_204)
    {
        float _248 = _116 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _244 = _248;
    }
    float _250 = _244;
    float _252 = _110 * _182;
    float _254 = log2(_234);
    float _256 = _232;
    float _258 = _250;
    if (_204)
    {
        float _260 = _208 * _232;
        _220 = _260;
    }
    float _262 = _220;
    if (_204)
    {
        float _264 = rsqrt(_176);
        _222 = _264;
    }
    float _266 = _222;
    if (_204)
    {
        float _268 = _262 * 0.15915493667125701904296875;
        _256 = _268;
    }
    float _270 = _256;
    float _272 = _212 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _274 = _254 * 0.693147182464599609375;
    float _276 = 0.0;
    float _278 = _272;
    if (_204)
    {
        float _280 = _270 * 6.283185482025146484375;
        float _282 = cos(_280);
        _276 = _282;
    }
    float _284 = _276;
    float _286 = _274 * (*spvDescriptorSet0.fp_c9)._m0[72].x;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _138;
    float _292 = _288;
    if (_204)
    {
        float _294 = _270 * 6.283185482025146484375;
        float _296 = sin(_294);
        _290 = _296;
    }
    float _298 = _290;
    float _300 = _242 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _302 = precise::min(_272, _236);
    if (_204)
    {
        float _304 = _284 + (-1.0);
        _246 = _304;
    }
    float _306 = _246;
    float _308 = _306;
    if (!_204)
    {
        _278 = _116;
    }
    float _310 = _278;
    float _312 = _310;
    if (_204)
    {
        float _314 = _306 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _224 = _314;
    }
    float _316 = _224;
    if (!_204)
    {
        _308 = _114;
    }
    float _318 = _308;
    float _320 = _318;
    if (_204)
    {
        float _322 = fma(_298, _250, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _258 = _322;
    }
    float _324 = _258;
    float _326 = _288 * (*spvDescriptorSet0.fp_c9)._m0[71].z;
    float _328 = _324;
    if (_204)
    {
        float _330 = fma(_116, _284, _316);
        _312 = _330;
    }
    float _332 = _312;
    if (!_204)
    {
        _292 = _112;
    }
    float _334 = _292;
    float _336 = _334;
    if (_204)
    {
        float _338 = _266 * _324;
        _328 = _338;
    }
    float _340 = _328;
    float _342 = floor(_302);
    float _344 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _346 = _332 + _344;
    float _348 = precise::min(_184, _326);
    float _350 = _346;
    if (_204)
    {
        float _352 = fma(_154, _340, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _320 = _352;
    }
    float _354 = _320;
    if (_204)
    {
        float _356 = fma(_150, _340, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _336 = _356;
    }
    float _358 = _336;
    float _360 = _346 * _346;
    float _362 = _116 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _364 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _366 = _354 + _364;
    float _368 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _370 = _358 + _368;
    float _372 = floor(_348);
    float _374 = _300 * (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _376 = fma(_366, _366, _360);
    float _378 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _380 = _196 * _196;
    float _382 = fma(_114, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _362);
    float _384 = fma(_370, _370, _376);
    float _386 = _110 * _174;
    float _388 = precise::min(_374, _378);
    float _390 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _392 = _114 + _390;
    float _394 = _110 * _190;
    float _396 = _252 * _252;
    float _398 = rsqrt(_384);
    float _400 = fma(_342, (*spvDescriptorSet0.fp_c9)._m0[71].x, _388);
    float _402 = fma(_392, _392, _380);
    float _404 = fma(_112, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _382);
    float _406 = _372 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _408 = fma(_394, _394, _396);
    float _410 = fma(_200, _200, _402);
    float _412 = fma(_406, (*spvDescriptorSet0.fp_c9)._m0[71].x, _400);
    float _414 = fma(_386, _386, _408);
    float _416 = sqrt(_410);
    float _418 = _398 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _420 = trunc(_412);
    int _422 = int(_420);
    float _424 = _366 * _418;
    float _426 = _370 * _418;
    float _428 = _116 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _430 = _424 * _424;
    float _432 = _426 * _426;
    float _434 = fma(_114, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _428);
    float _436 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _438 = fma(_416, (*spvDescriptorSet0.fp_c9)._m0[63].x, _436);
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = _404 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _444 = _430 + _432;
    float _446 = fma(_112, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _434);
    float _448 = -_440;
    float _450 = _448 + 1.0;
    float _452 = sqrt(_444);
    int _454 = as_type<int>((*spvDescriptorSet0.fp_c9)._m0[71].w) * as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x);
    int _456 = _454 + _422;
    float _458 = _446 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _460 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    int _462 = _456 * 136;
    float _464 = precise::max(0.0, _460);
    float _466 = rsqrt(_414);
    int _468 = _462 + 4;
    uint _471 = uint(int(uint(_462) >> uint(2)));
    packed_uint2 _dmw0 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s0)._m0[int(_471)];
    float _473 = as_type<float>(_dmw0.x);
    float _475 = -_418;
    float _477 = -_464;
    float _479 = fma(_346, _475, _477);
    bool _481 = _452 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _483 = trunc(_458);
    int _485 = int(_483);
    uint _487 = uint(int(uint(_468) >> uint(2)));
    float _489 = as_type<float>(_dmw0.y);
    float _491 = trunc(_442);
    int _493 = int(_491);
    float _495 = abs(_450);
    float _497 = log2(_495);
    float _499 = _464;
    float _501 = _426;
    if (!_481)
    {
        _226 = _432;
    }
    float _503 = _226;
    float _505 = _503;
    if (!_481)
    {
        _499 = _430;
    }
    float _507 = _499;
    float _509 = _507;
    if (!_481)
    {
        _228 = _424;
    }
    float _511 = _228;
    float _513 = _511;
    if (!_481)
    {
        _350 = _479;
    }
    float _515 = _350;
    bool _517 = !_481;
    float _519 = _515;
    float _521 = _466;
    if (!_517)
    {
        float _523 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _525 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _527 = _452 + _525;
        float _529 = rsqrt(_444);
        float _531 = _527 * _523;
        float _533 = _479 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _535 = _531 * 0.15915493667125701904296875;
        float _537 = _535 * 6.283185482025146484375;
        float _539 = sin(_537);
        float _541 = _535 * 6.283185482025146484375;
        float _543 = cos(_541);
        float _545 = fma(_539, _533, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _547 = _529 * _545;
        float _549 = _543 + (-1.0);
        float _551 = _426 * _547;
        float _553 = _549 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _555 = _424 * _547;
        float _557 = _551 * _551;
        float _559 = fma(_479, _543, _553);
        float _561 = _555 * _555;
        _519 = _559;
        _509 = _561;
        _505 = _557;
        _513 = _555;
        _501 = _551;
    }
    float _563 = _519;
    float _565 = _509;
    float _567 = _505;
    float _569 = _513;
    float _571 = _501;
    float _573 = in.m_73.w;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    int _579 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _581 = _485 + _579;
    int _583 = _581 + 1;
    float _585 = fma(_563, _563, _565);
    int _587 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _589 = _493 + _587;
    int _591 = _589 + 1;
    float _593 = spvFAdd(_416, 9.9999997473787516355514526367188e-06);
    bool _595 = _583 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _597 = _585 + _567;
    int _599 = _583 | _591;
    float _601 = 1.0 / _593;
    float _603 = _394 * _466;
    bool _605 = _599 < 0;
    bool _607 = _605 || _595;
    float _609 = _497 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _611 = _252 * _466;
    float _613 = _386 * _466;
    bool _615 = _591 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _617 = _615 || _607;
    float _619 = rsqrt(_597);
    float _621 = exp2(_609);
    float _623 = _392 * _601;
    float _625 = _196 * _601;
    float _627 = _200 * _601;
    if (_617)
    {
        _521 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _629 = _521;
    float _631 = _619 * _569;
    float _633 = _619 * _563;
    float _635 = _629;
    if (!_617)
    {
        int _637 = _591 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _639 = _637 + _583;
        float _641 = floor(_458);
        int _643 = _639 << 2;
        int _645 = _639 >> 2;
        int _647 = 12 & _643;
        int _649 = _645 << 4;
        int _651 = _649 + _647;
        float _653 = floor(_442);
        int _655 = _651 + 16256;
        uint _657 = uint(int(uint(_655) >> uint(2)));
        uint _659 = uint(int(uint(int(_657)) >> uint(2)));
        int _661 = int(_657) & 3;
        float _663 = (*spvDescriptorSet0.fp_c9)._m0[int(_659)][_661];
        float _665 = -_653;
        float _667 = _442 + _665;
        float _669 = -_641;
        float _671 = _458 + _669;
        float _673 = rint(_663);
        float _675 = precise::max(_673, 0.0);
        uint _677 = uint(_675);
        uint _679 = clamp(_677, 0u, 65535u);
        float3 _2936 = float3(_671, _667, float(int(_679)));
        float3 _2938 = select(_2936, float3(0.0), isnan(_2936));
        float _681 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2938.xy, uint(rint(_2938.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2938.xy, uint(rint(_2938.z))).x;
        int _683 = _639 << 4;
        int _685 = _683 + 17904;
        int _687 = _651 + 24304;
        uint _689 = uint(int(uint(_687) >> uint(2)));
        uint _691 = uint(int(uint(int(_689)) >> uint(2)));
        int _693 = int(_689) & 3;
        float _695 = (*spvDescriptorSet0.fp_c9)._m0[int(_691)][_693];
        uint _697 = uint(int(uint(_685) >> uint(2)));
        uint _699 = uint(int(uint(int(_697)) >> uint(2)));
        int _701 = int(_697) & 3;
        float _703 = (*spvDescriptorSet0.fp_c9)._m0[int(_699)][_701];
        int _705 = int(_697) + 1;
        uint _707 = uint(int(uint(_705) >> uint(2)));
        int _709 = _705 & 3;
        float _711 = (*spvDescriptorSet0.fp_c9)._m0[int(_707)][_709];
        int _713 = _685 + 8;
        uint _715 = uint(int(uint(_713) >> uint(2)));
        uint _717 = uint(int(uint(int(_715)) >> uint(2)));
        int _719 = int(_715) & 3;
        float _721 = (*spvDescriptorSet0.fp_c9)._m0[int(_717)][_719];
        int _723 = int(_715) + 1;
        uint _725 = uint(int(uint(_723) >> uint(2)));
        int _727 = _723 & 3;
        float _729 = (*spvDescriptorSet0.fp_c9)._m0[int(_725)][_727];
        float _731 = 1.0 / _695;
        float _733 = _116 * _711;
        float _735 = fma(_114, _703, _733);
        float _737 = fma(_112, _721, _735);
        float _739 = _737 + _729;
        float _741 = precise::clamp(_739, 0.0, 1.0);
        float _743 = _695 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _745 = -_741;
        float _747 = _745 + _681;
        float _749 = fma(_731, (*spvDescriptorSet0.fp_c13)._m0[4].w, _747);
        float _751 = _743 * _749;
        float _753 = exp2(_751);
        float _755 = 0.0 + _753;
        float _757 = precise::clamp(_755, 0.0, 1.0);
        float _759 = precise::min(_757, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _635 = _759;
    }
    float _761 = _635;
    float _763 = _631 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _765 = _603 * _623;
    float _767 = _611 * _625;
    float _769 = _619 * _571;
    float _771 = _633 + 1.0;
    float _773 = -_763;
    float _775 = fma(_633, (*spvDescriptorSet0.fp_c9)._m0[69].y, _773);
    float _777 = _613 * _627;
    float _779 = _765 + _767;
    float _781 = -_633;
    float _783 = fma(_621, _771, _781);
    float _785 = -_769;
    float _787 = fma(_785, (*spvDescriptorSet0.fp_c9)._m0[69].z, _775);
    float _789 = _777 + _779;
    float _791 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _793 = 1.0 + _791;
    float _795 = fma(_787, -0.5, 0.5);
    float _797 = _789 + _789;
    float _799 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _801 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _793);
    float _803 = _110 * _577;
    float _805 = sqrt(_795);
    float _807 = fma(_787, 0.5, 0.5);
    float _809 = _801 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _811 = -_803;
    float _813 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _815 = _811 + _813;
    float _817 = -_797;
    float _819 = fma(_611, _817, _625);
    float _821 = -_797;
    float _823 = fma(_603, _821, _623);
    float _825 = -_627;
    float _827 = fma(_613, _797, _825);
    float _829 = precise::min(_809, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _831 = _803 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _833 = fma(_807, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _835 = abs(_819);
    float _837 = abs(_823);
    float _839 = precise::max(_835, _837);
    float _841 = _815 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _843 = precise::clamp(_841, 0.0, 1.0);
    float _845 = -_829;
    float _847 = _845 + 1.0;
    float _849 = fma(_807, _833, -0.212114393711090087890625);
    float _851 = fma(_783, 0.5, 0.5);
    float _853 = abs(_827);
    float _855 = precise::max(_853, _839);
    float _857 = _805 * 0.636619746685028076171875;
    float _859 = fma(_807, _849, 1.570728778839111328125);
    float _861 = precise::max(0.0, _611);
    float _863 = -_761;
    float _865 = _863 + 1.0;
    float _867 = precise::max(_146, 0.25);
    float _869 = -_859;
    float _871 = fma(_857, _869, 1.0);
    float _873 = precise::min(_861, 0.100000001490116119384765625);
    float _875 = 1.0 / _855;
    float _877 = fma(_843, _865, _761);
    float _879 = -_831;
    float _881 = fma(_799, _879, 1.0);
    float _883 = fma(_873, 10.0, -1.0);
    float _885 = in.m_75.x;
    float _887 = gl_FragCoord.w;
    float _889 = _885 * _887;
    float _891 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _893 = _891 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _895 = in.m_75.y;
    float _897 = gl_FragCoord.w;
    float _899 = _895 * _897;
    float _901 = _867 + _883;
    float _903 = 0.0 + _144;
    float _905 = precise::clamp(_903, 0.0, 1.0);
    float _907 = fma(_847, _893, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _909 = gl_FragCoord.x;
    float _911 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _913 = _909 / _911;
    float _915 = _901 * 4.0;
    float _917 = precise::clamp(_915, 0.0, 1.0);
    float _919 = _877 * _905;
    float _921 = _907 + (-1.0);
    float _923 = _823 * _875;
    float _925 = _919 * _917;
    float _927 = _819 * _875;
    float _929 = _827 * _875;
    float _931 = _925 * _921;
    float _933 = log2(_881);
    float _935 = fma(_931, 7.0, 7.0);
    float4 _3331 = float4(_923, _927, _929, float(1));
    float4 _3335 = select(_3331, float4(0.0), isnan(_3331));
    float3 _939 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, _3335.xyz, uint(rint(_3335.w)), level(_935)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, _3335.xyz, uint(rint(_3335.w)), level(_935)).xyz;
    float _941 = _939.x;
    float _943 = _939.y;
    float _945 = _939.z;
    float _947 = _110 * _889;
    float _949 = _933 * 0.693147182464599609375;
    float _951 = _110 * _899;
    float _953 = _949 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float _955 = _913 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float2 _3364 = float2(_947, _951);
    float _957 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3364, float2(0.0), isnan(_3364))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3364, float2(0.0), isnan(_3364))).w;
    float2 _3372 = float2(_947, _951);
    float3 _959 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3372, float2(0.0), isnan(_3372))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3372, float2(0.0), isnan(_3372))).xyz;
    float _961 = _959.x;
    float _963 = _959.y;
    float _965 = _959.z;
    float3 _3387 = float3(_955, _212, _953);
    float _967 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_3387, float3(0.0), isnan(_3387))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_3387, float3(0.0), isnan(_3387))).x;
    float3 _3396 = float3(_955, _212, _953);
    float4 _970 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_3396, float3(0.0), isnan(_3396))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_3396, float3(0.0), isnan(_3396))).xyzw;
    float _972 = _970.x;
    float _974 = _970.y;
    float _976 = _970.z;
    float _978 = _970.w;
    float2 _3412 = float2(_871, _851);
    float3 _980 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3412, float2(0.0), isnan(_3412))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3412, float2(0.0), isnan(_3412))).xyz;
    float _982 = _980.x;
    float _984 = _980.y;
    float _986 = _980.z;
    float _988 = _625 + (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _990 = _623 + (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _992 = -_765;
    float _994 = -_767;
    float _996 = _992 + _994;
    float _998 = _627 + (*spvDescriptorSet0.fp_c9)._m0[69].z;
    float _1000 = _988 * _988;
    float _1002 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _793);
    float _1004 = -_777;
    float _1006 = _1004 + _996;
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    bool _1010 = 0.0 < (*spvDescriptorSet0.fp_c9)._m0[43].w;
    float _1012 = fma(_990, _990, _1000);
    float _1014 = _1002 + (-1.0);
    bool _1016 = as_type<uint>(_473) > 0u;
    float _1018 = fma(_998, _998, _1012);
    float _1020 = _1008 * (-9.27999973297119140625);
    float _1022 = fma(_925, _1014, 1.0);
    float _1024 = fma(_925, _1014, 0.959999978542327880859375);
    float _1026 = rsqrt(_1018);
    float _1028 = exp2(_1020);
    float _1030 = _988 * _1026;
    float _1032 = _990 * _1026;
    float _1034 = _998 * _1026;
    float _1036 = _1030 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1038 = _603 * _1032;
    float _1040 = in.m_73.x;
    float _1042 = gl_FragCoord.w;
    float _1044 = _1040 * _1042;
    float _1046 = fma(_1032, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1036);
    float _1048 = -_1030;
    float _1050 = -_1038;
    float _1052 = fma(_611, _1048, _1050);
    float _1054 = fma(_1034, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1046);
    float _1056 = precise::clamp(_1054, 0.0, 1.0);
    float _1058 = -_1034;
    float _1060 = fma(_613, _1058, _1052);
    float _1062 = precise::clamp(_1060, 0.0, 1.0);
    float _1064 = _931 * _931;
    float _1066 = _931 + 1.0;
    float _1068 = -_1056;
    float _1070 = _1068 + 1.0;
    float _1072 = _1062 * _1062;
    float _1074 = precise::min(_1064, _1028);
    float _1076 = fma(_1066, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1078 = _1070 * _1070;
    float _1080 = -_931;
    float _1082 = fma(_1080, _1074, _1076);
    float _1084 = fma(_1066, _1066, 0.00999999977648258209228515625);
    float _1086 = precise::clamp(_1084, 0.0, 1.0);
    float _1088 = _1078 * _1078;
    float _1090 = _603 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1092 = _1086 * _1086;
    float _1094 = _1070 * _1088;
    float _1096 = _1092 + (-1.0);
    float _1098 = fma(_1024, _1094, 0.039999999105930328369140625);
    float _1100 = fma(_1066, 0.5, 0.5);
    float _1102 = fma(_1072, _1096, 1.0);
    float _1104 = -_611;
    float _1106 = -_1090;
    float _1108 = fma(_1104, (*spvDescriptorSet0.fp_c9)._m0[69].y, _1106);
    float _1110 = _1100 * _1100;
    float _1112 = _1110 * 0.5;
    float _1114 = _1102 * _1102;
    float _1116 = -_613;
    float _1118 = fma(_1116, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1108);
    float _1120 = precise::clamp(_1118, 0.0, 1.0);
    float _1122 = -_1112;
    float _1124 = _1122 + 1.0;
    float _1126 = 1.0 / _1114;
    float _1128 = fma(_1008, _1124, _1112);
    float _1130 = fma(_1066, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1132 = fma(_1120, _1124, _1112);
    float _1134 = in.m_73.y;
    float _1136 = gl_FragCoord.w;
    float _1138 = _1134 * _1136;
    float _1140 = fma(_1066, -0.572000026702880859375, 1.03999996185302734375);
    float _1142 = _1092 * 0.31830990314483642578125;
    float _1144 = _1128 * _1132;
    float _1146 = fma(_1082, -1.03999996185302734375, _1140);
    float _1148 = precise::clamp(_1146, 0.0, 1.0);
    float _1150 = 1.0 / _1144;
    float _1152 = _1142 * _1126;
    float _1154 = in.m_73.z;
    float _1156 = gl_FragCoord.w;
    float _1158 = _1154 * _1156;
    float _1160 = _1120 * _1152;
    float _1162 = fma(_1082, 1.03999996185302734375, _1130);
    float _1164 = precise::clamp(_1162, 0.0, 1.0);
    float _1166 = _1022 * _1164;
    float _1168 = precise::min(1.0, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1170 = _110 * _1044;
    float _1172 = _1160 * _1150;
    float _1174 = _1172 * 0.25;
    float _1176 = -(*spvDescriptorSet0.fp_c9)._m0[1001].w;
    float _1178 = fma(_416, (*spvDescriptorSet0.fp_c9)._m0[1000].w, _1176);
    float _1180 = precise::clamp(_1178, 0.0, 1.0);
    float _1182 = fma(_1148, 0.039999999105930328369140625, _1166);
    float _1184 = _1168 * 0.31830990314483642578125;
    float _1186 = _110 * _1138;
    float _1188 = _110 * _1158;
    float _1190 = _1098 * _1174;
    float _1192 = _1168 * _941;
    float _1194 = _1168 * _943;
    float _1196 = _1168 * _945;
    float _1198 = _497 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1200 = -_1192;
    float _1202 = fma(_1170, _1184, _1200);
    float _1204 = -_1194;
    float _1206 = fma(_1186, _1184, _1204);
    float _1208 = -_1196;
    float _1210 = fma(_1188, _1184, _1208);
    float _1212 = fma(_1180, _1202, _1192);
    float _1214 = exp2(_1198);
    float _1216 = fma(_1180, _1206, _1194);
    float _1218 = fma(_1180, _1210, _1196);
    float _1220 = _1180;
    float _1222 = _1206;
    float _1224 = _1184;
    float _1226 = 0.0;
    float _1228 = 0.0;
    float _1230 = 0.0;
    float _1232 = 0.0;
    float _1234 = 0.0;
    float _1236 = 0.0;
    if (!_1010)
    {
        _1220 = 0.0;
    }
    float _1238 = _1220;
    float _1240 = _1238;
    if (!_1010)
    {
        _1222 = 0.0;
        _1224 = 0.0;
    }
    float _1242 = _1222;
    float _1244 = _1224;
    bool _1246 = !_1010;
    float _1248 = _1242;
    float _1250 = _1244;
    if (!_1246)
    {
        float _1252 = -_116;
        float _1254 = _1252 + (*spvDescriptorSet0.fp_c9)._m0[43].y;
        float _1256 = -_114;
        float _1258 = _1256 + (*spvDescriptorSet0.fp_c9)._m0[43].x;
        float _1260 = -_112;
        float _1262 = _1260 + (*spvDescriptorSet0.fp_c9)._m0[43].z;
        float _1264 = _1254 * _1254;
        float _1266 = fma(_1258, _1258, _1264);
        float _1268 = fma(_1262, _1262, _1266);
        float _1270 = rsqrt(_1268);
        float _1272 = sqrt(_1268);
        float _1274 = _1258 * _1270;
        float _1276 = _1254 * _1270;
        float _1278 = _1262 * _1270;
        float _1280 = _1274 * (*spvDescriptorSet0.fp_c9)._m0[44].x;
        float _1282 = _611 * _1276;
        float _1284 = -_1276;
        float _1286 = -_1280;
        float _1288 = fma(_1284, (*spvDescriptorSet0.fp_c9)._m0[44].y, _1286);
        float _1290 = -_625;
        float _1292 = _1290 + _1276;
        float _1294 = fma(_603, _1274, _1282);
        float _1296 = -_623;
        float _1298 = _1296 + _1274;
        float _1300 = -_627;
        float _1302 = _1300 + _1278;
        float _1304 = _1292 * _1292;
        float _1306 = -_1272;
        float _1308 = _1306 + (*spvDescriptorSet0.fp_c9)._m0[43].w;
        float _1310 = -_1278;
        float _1312 = fma(_1310, (*spvDescriptorSet0.fp_c9)._m0[44].z, _1288);
        float _1314 = fma(_613, _1278, _1294);
        float _1316 = precise::clamp(_1314, 0.0, 1.0);
        float _1318 = fma(_1298, _1298, _1304);
        float _1320 = _1308 * (*spvDescriptorSet0.fp_c9)._m0[46].y;
        float _1322 = precise::clamp(_1320, 0.0, 1.0);
        float _1324 = -(*spvDescriptorSet0.fp_c9)._m0[44].w;
        float _1326 = _1312 + _1324;
        float _1328 = fma(_1302, _1302, _1318);
        float _1330 = _1326 * (*spvDescriptorSet0.fp_c9)._m0[46].w;
        float _1332 = precise::clamp(_1330, 0.0, 1.0);
        float _1334 = abs(_1322);
        float _1336 = log2(_1334);
        float _1338 = rsqrt(_1328);
        float _1340 = _1336 * (*spvDescriptorSet0.fp_c9)._m0[45].w;
        float _1342 = exp2(_1340);
        float _1344 = _1292 * _1338;
        float _1346 = _1298 * _1338;
        float _1348 = _1302 * _1338;
        float _1350 = _611 * _1344;
        float _1352 = fma(_603, _1346, _1350);
        float _1354 = fma(_613, _1348, _1352);
        float _1356 = precise::clamp(_1354, 0.0, 1.0);
        float _1358 = _1342 * _1332;
        float _1360 = _1356 * _1356;
        float _1362 = _1316 * _1358;
        float _1364 = fma(_1096, _1360, 1.0);
        float _1366 = _1364 * _1364;
        float _1368 = 1.0 / _1366;
        float _1370 = _1092 * _1368;
        float _1372 = _1370 * _1362;
        float _1374 = _1372 * (*spvDescriptorSet0.fp_c9)._m0[45].x;
        float _1376 = _1372 * (*spvDescriptorSet0.fp_c9)._m0[45].y;
        float _1378 = _1372 * (*spvDescriptorSet0.fp_c9)._m0[45].z;
        _1240 = _1374;
        _1248 = _1376;
        _1250 = _1378;
    }
    float _1380 = _1240;
    float _1382 = _1248;
    float _1384 = _1250;
    bool _1386 = !_1016;
    if (!_1386)
    {
        int _1388 = 0;
        bool _1390;
        do
        {
            int _1392 = _1388;
            float _1394 = _1226;
            float _1396 = _1228;
            float _1398 = _1230;
            int _1400 = _1392 << 1;
            int _1402 = _1400 + _462;
            int _1404 = _1402 + 8;
            int _1406 = _1404;
            int _1408 = _86(_1406, (*spvDescriptorSet0.fp_s0));
            int _1410 = _1392 + 1;
            bool _1412 = uint(_1410) >= as_type<uint>(_473);
            int _1414 = _1408 & 65535;
            int _1416 = _1414 * 48;
            int _1418 = _1416 + 1168;
            uint _1420 = uint(int(uint(_1418) >> uint(2)));
            uint _1422 = uint(int(uint(int(_1420)) >> uint(2)));
            int _1424 = int(_1420) & 3;
            float _1426 = (*spvDescriptorSet0.fp_c9)._m0[int(_1422)][_1424];
            int _1428 = int(_1420) + 1;
            uint _1430 = uint(int(uint(_1428) >> uint(2)));
            int _1432 = _1428 & 3;
            float _1434 = (*spvDescriptorSet0.fp_c9)._m0[int(_1430)][_1432];
            int _1436 = _1416 + 1176;
            uint _1438 = uint(int(uint(_1436) >> uint(2)));
            uint _1440 = uint(int(uint(int(_1438)) >> uint(2)));
            int _1442 = int(_1438) & 3;
            float _1444 = (*spvDescriptorSet0.fp_c9)._m0[int(_1440)][_1442];
            int _1446 = int(_1438) + 1;
            uint _1448 = uint(int(uint(_1446) >> uint(2)));
            int _1450 = _1446 & 3;
            float _1452 = (*spvDescriptorSet0.fp_c9)._m0[int(_1448)][_1450];
            float _1454 = -_116;
            float _1456 = _1454 + _1434;
            float _1458 = -_114;
            float _1460 = _1458 + _1426;
            float _1462 = _1456 * _1456;
            float _1464 = -_112;
            float _1466 = _1464 + _1444;
            float _1468 = fma(_1460, _1460, _1462);
            float _1470 = fma(_1466, _1466, _1468);
            float _1472 = rsqrt(_1470);
            float _1474 = sqrt(_1470);
            float _1476 = _1456 * _1472;
            float _1478 = _1466 * _1472;
            float _1480 = _1460 * _1472;
            float _1482 = _611 * _1476;
            float _1484 = -_625;
            float _1486 = _1484 + _1476;
            float _1488 = fma(_603, _1480, _1482);
            float _1490 = -_623;
            float _1492 = _1490 + _1480;
            float _1494 = _1486 * _1486;
            float _1496 = -_1474;
            float _1498 = _1496 + _1452;
            float _1500 = fma(_613, _1478, _1488);
            float _1502 = precise::clamp(_1500, 0.0, 1.0);
            float _1504 = -_627;
            float _1506 = _1504 + _1478;
            float _1508 = fma(_1492, _1492, _1494);
            float _1510 = fma(_1506, _1506, _1508);
            float _1512 = rsqrt(_1510);
            float _1514 = _1486 * _1512;
            float _1516 = _1492 * _1512;
            float _1518 = _1506 * _1512;
            float _1520 = _611 * _1514;
            float _1522 = fma(_603, _1516, _1520);
            int _1524 = _1416 + 1200;
            uint _1526 = uint(int(uint(_1524) >> uint(2)));
            uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
            int _1530 = int(_1526) & 3;
            float _1532 = (*spvDescriptorSet0.fp_c9)._m0[int(_1528)][_1530];
            float _1534 = fma(_613, _1518, _1522);
            float _1536 = precise::clamp(_1534, 0.0, 1.0);
            float _1538 = _1536 * _1536;
            int _1540 = _1416 + 1192;
            uint _1542 = uint(int(uint(_1540) >> uint(2)));
            uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
            int _1546 = int(_1542) & 3;
            float _1548 = (*spvDescriptorSet0.fp_c9)._m0[int(_1544)][_1546];
            int _1550 = int(_1542) + 1;
            uint _1552 = uint(int(uint(_1550) >> uint(2)));
            int _1554 = _1550 & 3;
            float _1556 = (*spvDescriptorSet0.fp_c9)._m0[int(_1552)][_1554];
            float _1558 = fma(_1096, _1538, 1.0);
            float _1560 = _1558 * _1558;
            float _1562 = 1.0 / _1560;
            float _1564 = _1498 * _1532;
            float _1566 = precise::clamp(_1564, 0.0, 1.0);
            float _1568 = abs(_1566);
            float _1570 = log2(_1568);
            float _1572 = _1570 * _1556;
            float _1574 = exp2(_1572);
            float _1576 = _1502 * _1574;
            float _1578 = _1092 * _1562;
            float _1580 = _1578 * _1576;
            int _1582 = _1416 + 1184;
            uint _1584 = uint(int(uint(_1582) >> uint(2)));
            uint _1586 = uint(int(uint(int(_1584)) >> uint(2)));
            int _1588 = int(_1584) & 3;
            float _1590 = (*spvDescriptorSet0.fp_c9)._m0[int(_1586)][_1588];
            int _1592 = int(_1584) + 1;
            uint _1594 = uint(int(uint(_1592) >> uint(2)));
            int _1596 = _1592 & 3;
            float _1598 = (*spvDescriptorSet0.fp_c9)._m0[int(_1594)][_1596];
            float _1600 = fma(_1580, _1548, _1394);
            float _1602 = fma(_1580, _1590, _1396);
            float _1604 = fma(_1580, _1598, _1398);
            _1390 = !_1412;
            _1388 = _1410;
            _1226 = _1600;
            _1228 = _1602;
            _1230 = _1604;
            _1232 = _1602;
            _1234 = _1600;
            _1236 = _1604;
        } while (_1390);
    }
    float _1606 = _1232;
    float _1608 = _1234;
    float _1610 = _1236;
    bool _1612 = as_type<uint>(_489) > 0u;
    bool _1614 = !_1612;
    float _1616 = _1608;
    float _1618 = _1606;
    float _1620 = _1610;
    float _1622 = _1606;
    float _1624 = _1610;
    float _1626 = _1608;
    if (!_1614)
    {
        int _1628 = 0;
        bool _1630;
        do
        {
            int _1632 = _1628;
            float _1634 = _1616;
            float _1636 = _1618;
            float _1638 = _1620;
            int _1640 = _1632 << 1;
            int _1642 = _1640 + _462;
            int _1644 = _1642 + 72;
            int _1646 = _1644;
            int _1648 = _86(_1646, (*spvDescriptorSet0.fp_s0));
            int _1650 = _1632 + 1;
            bool _1652 = uint(_1650) >= as_type<uint>(_489);
            int _1654 = _1648 << 6;
            int _1656 = 4194240 & _1654;
            int _1658 = _1656 + 10384;
            uint _1660 = uint(int(uint(_1658) >> uint(2)));
            uint _1662 = uint(int(uint(int(_1660)) >> uint(2)));
            int _1664 = int(_1660) & 3;
            float _1666 = (*spvDescriptorSet0.fp_c9)._m0[int(_1662)][_1664];
            int _1668 = int(_1660) + 1;
            uint _1670 = uint(int(uint(_1668) >> uint(2)));
            int _1672 = _1668 & 3;
            float _1674 = (*spvDescriptorSet0.fp_c9)._m0[int(_1670)][_1672];
            int _1676 = _1656 + 10392;
            uint _1678 = uint(int(uint(_1676) >> uint(2)));
            uint _1680 = uint(int(uint(int(_1678)) >> uint(2)));
            int _1682 = int(_1678) & 3;
            float _1684 = (*spvDescriptorSet0.fp_c9)._m0[int(_1680)][_1682];
            int _1686 = int(_1678) + 1;
            uint _1688 = uint(int(uint(_1686) >> uint(2)));
            int _1690 = _1686 & 3;
            float _1692 = (*spvDescriptorSet0.fp_c9)._m0[int(_1688)][_1690];
            float _1694 = -_116;
            float _1696 = _1694 + _1674;
            float _1698 = -_114;
            float _1700 = _1698 + _1666;
            float _1702 = _1696 * _1696;
            float _1704 = -_112;
            float _1706 = _1704 + _1684;
            float _1708 = fma(_1700, _1700, _1702);
            float _1710 = fma(_1706, _1706, _1708);
            float _1712 = rsqrt(_1710);
            float _1714 = sqrt(_1710);
            float _1716 = _1696 * _1712;
            float _1718 = _1700 * _1712;
            float _1720 = _1706 * _1712;
            float _1722 = -_625;
            float _1724 = _1722 + _1716;
            float _1726 = -_623;
            float _1728 = _1726 + _1718;
            float _1730 = -_627;
            float _1732 = _1730 + _1720;
            float _1734 = _1724 * _1724;
            float _1736 = -_1714;
            float _1738 = _1736 + _1692;
            float _1740 = fma(_1728, _1728, _1734);
            float _1742 = fma(_1732, _1732, _1740);
            float _1744 = rsqrt(_1742);
            float _1746 = _1724 * _1744;
            float _1748 = _1728 * _1744;
            float _1750 = _1732 * _1744;
            float _1752 = _611 * _1746;
            float _1754 = fma(_603, _1748, _1752);
            float _1756 = fma(_613, _1750, _1754);
            float _1758 = precise::clamp(_1756, 0.0, 1.0);
            float _1760 = _611 * _1716;
            float _1762 = _1758 * _1758;
            float _1764 = fma(_603, _1718, _1760);
            int _1766 = _1656 + 10400;
            uint _1768 = uint(int(uint(_1766) >> uint(2)));
            uint _1770 = uint(int(uint(int(_1768)) >> uint(2)));
            int _1772 = int(_1768) & 3;
            float _1774 = (*spvDescriptorSet0.fp_c9)._m0[int(_1770)][_1772];
            int _1776 = int(_1768) + 1;
            uint _1778 = uint(int(uint(_1776) >> uint(2)));
            int _1780 = _1776 & 3;
            float _1782 = (*spvDescriptorSet0.fp_c9)._m0[int(_1778)][_1780];
            float _1784 = fma(_1096, _1762, 1.0);
            float _1786 = _1784 * _1784;
            float _1788 = _1718 * _1774;
            float _1790 = -_1716;
            float _1792 = -_1788;
            float _1794 = fma(_1790, _1782, _1792);
            float _1796 = fma(_613, _1720, _1764);
            float _1798 = precise::clamp(_1796, 0.0, 1.0);
            int _1800 = _1656 + 10408;
            uint _1802 = uint(int(uint(_1800) >> uint(2)));
            uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
            int _1806 = int(_1802) & 3;
            float _1808 = (*spvDescriptorSet0.fp_c9)._m0[int(_1804)][_1806];
            int _1810 = int(_1802) + 1;
            uint _1812 = uint(int(uint(_1810) >> uint(2)));
            int _1814 = _1810 & 3;
            float _1816 = (*spvDescriptorSet0.fp_c9)._m0[int(_1812)][_1814];
            float _1818 = 1.0 / _1786;
            int _1820 = _1656 + 10436;
            uint _1822 = uint(int(uint(_1820) >> uint(2)));
            uint _1824 = uint(int(uint(int(_1822)) >> uint(2)));
            int _1826 = int(_1822) & 3;
            float _1828 = (*spvDescriptorSet0.fp_c9)._m0[int(_1824)][_1826];
            float _1830 = _1092 * _1818;
            float _1832 = -_1720;
            float _1834 = fma(_1832, _1808, _1794);
            float _1836 = -_1816;
            float _1838 = _1834 + _1836;
            int _1840 = _1656 + 10444;
            uint _1842 = uint(int(uint(_1840) >> uint(2)));
            uint _1844 = uint(int(uint(int(_1842)) >> uint(2)));
            int _1846 = int(_1842) & 3;
            float _1848 = (*spvDescriptorSet0.fp_c9)._m0[int(_1844)][_1846];
            float _1850 = _1738 * _1828;
            float _1852 = precise::clamp(_1850, 0.0, 1.0);
            float _1854 = abs(_1852);
            float _1856 = log2(_1854);
            float _1858 = _1838 * _1848;
            float _1860 = precise::clamp(_1858, 0.0, 1.0);
            int _1862 = _1656 + 10424;
            uint _1864 = uint(int(uint(_1862) >> uint(2)));
            uint _1866 = uint(int(uint(int(_1864)) >> uint(2)));
            int _1868 = int(_1864) & 3;
            float _1870 = (*spvDescriptorSet0.fp_c9)._m0[int(_1866)][_1868];
            int _1872 = int(_1864) + 1;
            uint _1874 = uint(int(uint(_1872) >> uint(2)));
            int _1876 = _1872 & 3;
            float _1878 = (*spvDescriptorSet0.fp_c9)._m0[int(_1874)][_1876];
            float _1880 = _1856 * _1878;
            float _1882 = exp2(_1880);
            float _1884 = _1882 * _1860;
            float _1886 = _1798 * _1884;
            int _1888 = _1656 + 10416;
            uint _1890 = uint(int(uint(_1888) >> uint(2)));
            uint _1892 = uint(int(uint(int(_1890)) >> uint(2)));
            int _1894 = int(_1890) & 3;
            float _1896 = (*spvDescriptorSet0.fp_c9)._m0[int(_1892)][_1894];
            int _1898 = int(_1890) + 1;
            uint _1900 = uint(int(uint(_1898) >> uint(2)));
            int _1902 = _1898 & 3;
            float _1904 = (*spvDescriptorSet0.fp_c9)._m0[int(_1900)][_1902];
            float _1906 = _1830 * _1886;
            float _1908 = fma(_1906, _1870, _1634);
            float _1910 = fma(_1906, _1896, _1636);
            float _1912 = fma(_1906, _1904, _1638);
            _1630 = !_1652;
            _1628 = _1650;
            _1616 = _1908;
            _1618 = _1910;
            _1620 = _1912;
            _1622 = _1910;
            _1624 = _1912;
            _1626 = _1908;
        } while (_1630);
    }
    float _1914 = _1622;
    float _1916 = _1624;
    float _1918 = _1626;
    float _1920 = _1914 + _1380;
    float _1922 = _1916 + _1382;
    float _1924 = _1918 + _1384;
    float _1926 = -_1214;
    float _1928 = _1926 + 1.0;
    float _1930 = _1212 + _1920;
    float _1932 = _1216 + _1922;
    float _1934 = _1218 + _1924;
    float _1936 = _961 * 1.60000002384185791015625;
    float _1938 = _1182 * _1930;
    float _1940 = _1182 * _1932;
    float _1942 = _963 * 1.60000002384185791015625;
    float _1944 = _1928 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1946 = fma(_1190, (*spvDescriptorSet0.fp_c9)._m0[70].x, _1938);
    float _1948 = fma(_1190, (*spvDescriptorSet0.fp_c9)._m0[70].y, _1940);
    float _1950 = _1182 * _1934;
    float _1952 = _986 * _1944;
    float _1954 = fma(_1936, (*spvDescriptorSet0.fp_c9)._m0[40].z, _1946);
    float _1956 = fma(_1942, (*spvDescriptorSet0.fp_c9)._m0[40].z, _1948);
    float _1958 = _982 * _1944;
    float _1960 = fma(_1190, (*spvDescriptorSet0.fp_c9)._m0[70].z, _1950);
    float _1962 = _965 * 1.60000002384185791015625;
    float _1964 = _984 * _1944;
    float _1966 = -_1944;
    float _1968 = _1966 + 1.0;
    float _1970 = fma(_1962, (*spvDescriptorSet0.fp_c9)._m0[40].z, _1960);
    float _1972 = fma(_1964, _978, _974);
    float _1974 = fma(_1958, _978, _972);
    float _1976 = fma(_1952, _978, _976);
    float _1978 = _1968 * _978;
    float _1980 = _967 * _1972;
    float _1982 = precise::max(0.0, _1954);
    float _1984 = _967 * _1974;
    float _1986 = precise::max(0.0, _1956);
    float _1988 = _967 * _1976;
    float _1990 = precise::max(0.0, _1970);
    float _1992 = fma(_1978, _1982, _1984);
    float _1994 = fma(_1978, _1986, _1980);
    float _1996 = fma(_1978, _1990, _1988);
    out.m_78.x = _1992;
    out.m_78.y = _1994;
    out.m_78.z = _1996;
    out.m_78.w = _957;
    out.m_80.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

