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
    constant _16* fp_c4 [[id(2)]];
    constant _16* fp_c7 [[id(3)]];
    constant _16* fp_c11 [[id(4)]];
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
int _86(thread const int& _5032, const device _31& fp_s0)
{
    uint _5035 = uint(int(uint(_5032) >> uint(2)));
    float _5037 = as_type<float>(fp_s0._m0[int(_5035)]);
    int _5039 = _5032 & 3;
    int _5041 = _5039 << 3;
    int _5043 = as_type<int>(_5037) >> _5041;
    int _5045 = extract_bits(_5043, 0u, 16u);
    return _5045;
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
    float2 _2134 = float2(_126, _136);
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2134, float2(0.0), isnan(_2134))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2134, float2(0.0), isnan(_2134))).x;
    float3 _2145 = float3(_140, _142, _138);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2145, float3(0.0), isnan(_2145))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2145, float3(0.0), isnan(_2145))).x;
    float _148 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _150 = _112 + _148;
    float _152 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _154 = _114 + _152;
    float _156 = gl_FragCoord.y;
    float _158 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _160 = _156 / _158;
    float _162 = _150 * _150;
    float _164 = in.m_71.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_71.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_71.y;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = fma(_154, _154, _162);
    float _184 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _186 = _116 + _184;
    float _188 = in.m_71.w;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = sqrt(_182);
    bool _198 = _194 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _200 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _202 = _194 + _200;
    float _204 = _160 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _206 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _208 = (*spvDescriptorSet0.fp_c9)._m0[71].z + (-1.0);
    float _210 = _204 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _212 = _110 * _180;
    float _214 = 0.0;
    float _216 = _182;
    float _218 = _202;
    float _220 = _206;
    float _222 = _210;
    if (_198)
    {
        float _224 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _214 = _224;
    }
    float _226 = _214;
    float _228 = _110 * _192;
    float _230 = 0.0;
    if (_198)
    {
        float _232 = _116 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _230 = _232;
    }
    float _234 = _230;
    float _236 = 0.0 + _228;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    if (_198)
    {
        float _240 = rsqrt(_182);
        _216 = _240;
    }
    float _242 = _216;
    float _244 = fma(_238, _208, 1.0);
    float _246 = _226;
    float _248 = _242;
    if (_198)
    {
        float _250 = _202 * _226;
        _218 = _250;
    }
    float _252 = _218;
    float _254 = log2(_244);
    if (_198)
    {
        float _256 = _252 * 0.15915493667125701904296875;
        _246 = _256;
    }
    float _258 = _246;
    float _260 = gl_FragCoord.x;
    float _262 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _264 = _260 / _262;
    float _266 = 0.0;
    if (_198)
    {
        float _268 = _258 * 6.283185482025146484375;
        float _270 = cos(_268);
        _266 = _270;
    }
    float _272 = _266;
    float _274 = _138;
    if (_198)
    {
        float _276 = _258 * 6.283185482025146484375;
        float _278 = sin(_276);
        _274 = _278;
    }
    float _280 = _274;
    float _282 = _254 * 0.693147182464599609375;
    float _284 = _282 * (*spvDescriptorSet0.fp_c9)._m0[72].x;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = precise::min(_210, _206);
    float _290 = _286;
    if (_198)
    {
        float _292 = _272 + (-1.0);
        _220 = _292;
    }
    float _294 = _220;
    if (!_198)
    {
        _222 = _116;
    }
    float _296 = _222;
    float _298 = 0.0;
    float _300 = _296;
    if (_198)
    {
        float _302 = _294 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _298 = _302;
    }
    float _304 = _298;
    float _306 = _286 * (*spvDescriptorSet0.fp_c9)._m0[71].z;
    float _308 = _280;
    if (_198)
    {
        float _310 = fma(_280, _234, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _308 = _310;
    }
    float _312 = _308;
    float _314 = _312;
    if (!_198)
    {
        _290 = _112;
    }
    float _316 = _290;
    float _318 = _316;
    if (_198)
    {
        float _320 = fma(_116, _272, _304);
        _300 = _320;
    }
    float _322 = _300;
    float _324 = floor(_288);
    if (_198)
    {
        float _326 = _242 * _312;
        _248 = _326;
    }
    float _328 = _248;
    if (!_198)
    {
        _314 = _114;
    }
    float _330 = _314;
    float _332 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _334 = _322 + _332;
    float _336 = precise::min(_208, _306);
    float _338 = _330;
    float _340 = _334;
    if (_198)
    {
        float _342 = fma(_154, _328, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _338 = _342;
    }
    float _344 = _338;
    if (_198)
    {
        float _346 = fma(_150, _328, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _318 = _346;
    }
    float _348 = _318;
    float _350 = _334 * _334;
    float _352 = _264 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _354 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _356 = _344 + _354;
    float _358 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _360 = _348 + _358;
    float _362 = floor(_336);
    float _364 = _352 * (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _366 = fma(_356, _356, _350);
    float _368 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _370 = _110 * _168;
    float _372 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _374 = _114 + _372;
    float _376 = fma(_360, _360, _366);
    float _378 = _186 * _186;
    float _380 = precise::min(_364, _368);
    float _382 = _110 * _174;
    float _384 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _386 = _112 + _384;
    float _388 = fma(_374, _374, _378);
    float _390 = rsqrt(_376);
    float _392 = fma(_324, (*spvDescriptorSet0.fp_c9)._m0[71].x, _380);
    float _394 = _212 * _212;
    float _396 = fma(_386, _386, _388);
    float _398 = _362 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _400 = fma(_370, _370, _394);
    float _402 = fma(_398, (*spvDescriptorSet0.fp_c9)._m0[71].x, _392);
    float _404 = sqrt(_396);
    float _406 = fma(_382, _382, _400);
    float _408 = _390 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _410 = _116 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _412 = rsqrt(_406);
    float _414 = _356 * _408;
    float _416 = _360 * _408;
    float _418 = fma(_114, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _410);
    float _420 = _116 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _422 = _414 * _414;
    float _424 = _416 * _416;
    float _426 = fma(_112, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _418);
    float _428 = trunc(_402);
    int _430 = int(_428);
    float _432 = fma(_114, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _420);
    float _434 = _422 + _424;
    float _436 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _438 = fma(_112, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _432);
    float _440 = sqrt(_434);
    float _442 = _426 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _444 = _438 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    int _446 = as_type<int>((*spvDescriptorSet0.fp_c9)._m0[71].w) * as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x);
    int _448 = _446 + _430;
    float _450 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _452 = fma(_404, (*spvDescriptorSet0.fp_c9)._m0[63].x, _450);
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = precise::max(0.0, _436);
    float _458 = trunc(_444);
    int _460 = int(_458);
    int _462 = _448 * 136;
    float _464 = -_454;
    float _466 = _464 + 1.0;
    float _468 = -_408;
    float _470 = -_456;
    float _472 = fma(_334, _468, _470);
    bool _474 = _440 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    uint _477 = uint(int(uint(_462) >> uint(2)));
    packed_uint2 _dmw0 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s0)._m0[int(_477)];
    float _479 = as_type<float>(_dmw0.x);
    int _481 = _462 + 4;
    float _483 = trunc(_442);
    int _485 = int(_483);
    uint _487 = uint(int(uint(_481) >> uint(2)));
    float _489 = as_type<float>(_dmw0.y);
    float _491 = abs(_466);
    float _493 = log2(_491);
    float _495 = _456;
    float _497 = _422;
    float _499 = _424;
    float _501 = _416;
    float _503 = _412;
    if (!_474)
    {
        _340 = _422;
    }
    float _505 = _340;
    float _507 = _505;
    if (!_474)
    {
        _495 = _414;
    }
    float _509 = _495;
    float _511 = _509;
    if (!_474)
    {
        _497 = _472;
    }
    float _513 = _497;
    bool _515 = !_474;
    float _517 = _513;
    if (!_515)
    {
        float _519 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _521 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _523 = _440 + _521;
        float _525 = rsqrt(_434);
        float _527 = _523 * _519;
        float _529 = _472 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _531 = _527 * 0.15915493667125701904296875;
        float _533 = _531 * 6.283185482025146484375;
        float _535 = sin(_533);
        float _537 = _531 * 6.283185482025146484375;
        float _539 = cos(_537);
        float _541 = fma(_535, _529, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _543 = _525 * _541;
        float _545 = _539 + (-1.0);
        float _547 = _414 * _543;
        float _549 = _416 * _543;
        float _551 = _545 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _553 = _549 * _549;
        float _555 = fma(_472, _539, _551);
        float _557 = _547 * _547;
        _517 = _555;
        _507 = _557;
        _499 = _553;
        _511 = _547;
        _501 = _549;
    }
    float _559 = _517;
    float _561 = _507;
    float _563 = _499;
    float _565 = _511;
    float _567 = _501;
    float _569 = in.m_73.w;
    float _571 = gl_FragCoord.w;
    float _573 = _569 * _571;
    int _575 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _577 = _460 + _575;
    int _579 = _577 + 1;
    float _581 = fma(_559, _559, _561);
    int _583 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _585 = _485 + _583;
    int _587 = _585 + 1;
    float _589 = spvFAdd(_404, 9.9999997473787516355514526367188e-06);
    bool _591 = _579 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _593 = _581 + _563;
    int _595 = _579 | _587;
    float _597 = _493 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _599 = 1.0 / _589;
    bool _601 = _595 < 0;
    bool _603 = _601 || _591;
    float _605 = _370 * _412;
    float _607 = _212 * _412;
    float _609 = _382 * _412;
    bool _611 = _587 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _613 = _611 || _603;
    float _615 = rsqrt(_593);
    float _617 = exp2(_597);
    float _619 = _374 * _599;
    float _621 = _186 * _599;
    float _623 = _386 * _599;
    if (_613)
    {
        _503 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _625 = _503;
    float _627 = _615 * _565;
    float _629 = _615 * _559;
    float _631 = _625;
    if (!_613)
    {
        int _633 = _587 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _635 = _633 + _579;
        float _637 = floor(_444);
        int _639 = _635 << 2;
        int _641 = _635 >> 2;
        int _643 = 12 & _639;
        float _645 = floor(_442);
        int _647 = _641 << 4;
        int _649 = _647 + _643;
        int _651 = _649 + 16256;
        uint _653 = uint(int(uint(_651) >> uint(2)));
        uint _655 = uint(int(uint(int(_653)) >> uint(2)));
        int _657 = int(_653) & 3;
        float _659 = (*spvDescriptorSet0.fp_c9)._m0[int(_655)][_657];
        float _661 = -_637;
        float _663 = _444 + _661;
        float _665 = -_645;
        float _667 = _442 + _665;
        float _669 = rint(_659);
        float _671 = precise::max(_669, 0.0);
        uint _673 = uint(_671);
        uint _675 = clamp(_673, 0u, 65535u);
        float3 _2960 = float3(_663, _667, float(int(_675)));
        float3 _2962 = select(_2960, float3(0.0), isnan(_2960));
        float _677 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2962.xy, uint(rint(_2962.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2962.xy, uint(rint(_2962.z))).x;
        int _679 = _635 << 4;
        int _681 = _679 + 17904;
        int _683 = _649 + 24304;
        uint _685 = uint(int(uint(_683) >> uint(2)));
        uint _687 = uint(int(uint(int(_685)) >> uint(2)));
        int _689 = int(_685) & 3;
        float _691 = (*spvDescriptorSet0.fp_c9)._m0[int(_687)][_689];
        uint _693 = uint(int(uint(_681) >> uint(2)));
        uint _695 = uint(int(uint(int(_693)) >> uint(2)));
        int _697 = int(_693) & 3;
        float _699 = (*spvDescriptorSet0.fp_c9)._m0[int(_695)][_697];
        int _701 = int(_693) + 1;
        uint _703 = uint(int(uint(_701) >> uint(2)));
        int _705 = _701 & 3;
        float _707 = (*spvDescriptorSet0.fp_c9)._m0[int(_703)][_705];
        int _709 = _681 + 8;
        uint _711 = uint(int(uint(_709) >> uint(2)));
        uint _713 = uint(int(uint(int(_711)) >> uint(2)));
        int _715 = int(_711) & 3;
        float _717 = (*spvDescriptorSet0.fp_c9)._m0[int(_713)][_715];
        int _719 = int(_711) + 1;
        uint _721 = uint(int(uint(_719) >> uint(2)));
        int _723 = _719 & 3;
        float _725 = (*spvDescriptorSet0.fp_c9)._m0[int(_721)][_723];
        float _727 = 1.0 / _691;
        float _729 = _116 * _707;
        float _731 = fma(_114, _699, _729);
        float _733 = fma(_112, _717, _731);
        float _735 = _733 + _725;
        float _737 = precise::clamp(_735, 0.0, 1.0);
        float _739 = _691 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _741 = -_737;
        float _743 = _741 + _677;
        float _745 = fma(_727, (*spvDescriptorSet0.fp_c13)._m0[4].w, _743);
        float _747 = _739 * _745;
        float _749 = exp2(_747);
        float _751 = 0.0 + _749;
        float _753 = precise::clamp(_751, 0.0, 1.0);
        float _755 = precise::min(_753, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _631 = _755;
    }
    float _757 = _631;
    float _759 = _627 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _761 = _605 * _619;
    float _763 = _607 * _621;
    float _765 = _629 + 1.0;
    float _767 = -_759;
    float _769 = fma(_629, (*spvDescriptorSet0.fp_c9)._m0[69].y, _767);
    float _771 = _615 * _567;
    float _773 = _609 * _623;
    float _775 = _761 + _763;
    float _777 = -_629;
    float _779 = fma(_617, _765, _777);
    float _781 = -_771;
    float _783 = fma(_781, (*spvDescriptorSet0.fp_c9)._m0[69].z, _769);
    float _785 = _773 + _775;
    float _787 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _789 = 1.0 + _787;
    float _791 = _785 + _785;
    float _793 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _795 = fma(_783, -0.5, 0.5);
    float _797 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _789);
    float _799 = -_791;
    float _801 = fma(_607, _799, _621);
    float _803 = -_791;
    float _805 = fma(_605, _803, _619);
    float _807 = _110 * _573;
    float _809 = sqrt(_795);
    float _811 = _797 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _813 = fma(_783, 0.5, 0.5);
    float _815 = -_623;
    float _817 = fma(_609, _791, _815);
    float _819 = abs(_801);
    float _821 = abs(_805);
    float _823 = precise::max(_819, _821);
    float _825 = -_807;
    float _827 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _829 = _825 + _827;
    float _831 = precise::min(_811, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _833 = fma(_813, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _835 = abs(_817);
    float _837 = precise::max(_835, _823);
    float _839 = _829 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _841 = precise::clamp(_839, 0.0, 1.0);
    float _843 = fma(_779, 0.5, 0.5);
    float _845 = -_831;
    float _847 = _845 + 1.0;
    float _849 = -_757;
    float _851 = _849 + 1.0;
    float _853 = fma(_813, _833, -0.212114393711090087890625);
    float _855 = in.m_75.x;
    float _857 = gl_FragCoord.w;
    float _859 = _855 * _857;
    float _861 = fma(_841, _851, _757);
    float _863 = fma(_813, _853, 1.570728778839111328125);
    float _865 = _809 * 0.636619746685028076171875;
    float _867 = precise::max(0.0, _607);
    float _869 = in.m_75.y;
    float _871 = gl_FragCoord.w;
    float _873 = _869 * _871;
    float _875 = precise::max(_146, 0.25);
    float _877 = -_863;
    float _879 = fma(_865, _877, 1.0);
    float _881 = precise::min(_867, 0.100000001490116119384765625);
    float _883 = gl_FragCoord.x;
    float _885 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _887 = _883 / _885;
    float _889 = _807 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _891 = 1.0 / _837;
    float _893 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _895 = _893 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _897 = fma(_881, 10.0, -1.0);
    float _899 = 0.0 + _144;
    float _901 = precise::clamp(_899, 0.0, 1.0);
    float _903 = -_889;
    float _905 = fma(_793, _903, 1.0);
    float _907 = fma(_847, _895, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _909 = _875 + _897;
    float _911 = _861 * _901;
    float _913 = _907 + (-1.0);
    float _915 = _909 * 4.0;
    float _917 = precise::clamp(_915, 0.0, 1.0);
    float _919 = log2(_905);
    float _921 = _911 * _917;
    float _923 = _805 * _891;
    float _925 = _801 * _891;
    float _927 = _921 * _913;
    float _929 = _817 * _891;
    float _931 = _110 * _859;
    float _933 = fma(_927, 7.0, 7.0);
    float4 _3358 = float4(_923, _925, _929, float(1));
    float4 _3362 = select(_3358, float4(0.0), isnan(_3358));
    float3 _937 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, _3362.xyz, uint(rint(_3362.w)), level(_933)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, _3362.xyz, uint(rint(_3362.w)), level(_933)).xyz;
    float _939 = _937.x;
    float _941 = _937.y;
    float _943 = _937.z;
    float _945 = _919 * 0.693147182464599609375;
    float _947 = _110 * _873;
    float _949 = _887 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _951 = _945 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float2 _3388 = float2(_931, _947);
    float _953 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3388, float2(0.0), isnan(_3388))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3388, float2(0.0), isnan(_3388))).w;
    float2 _3396 = float2(_931, _947);
    float3 _955 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3396, float2(0.0), isnan(_3396))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3396, float2(0.0), isnan(_3396))).xyz;
    float _957 = _955.x;
    float _959 = _955.y;
    float _961 = _955.z;
    float3 _3411 = float3(_949, _204, _951);
    float _963 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_3411, float3(0.0), isnan(_3411))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_3411, float3(0.0), isnan(_3411))).x;
    float3 _3420 = float3(_949, _204, _951);
    float4 _966 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_3420, float3(0.0), isnan(_3420))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_3420, float3(0.0), isnan(_3420))).xyzw;
    float _968 = _966.x;
    float _970 = _966.y;
    float _972 = _966.z;
    float _974 = _966.w;
    float2 _3436 = float2(_879, _843);
    float3 _976 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3436, float2(0.0), isnan(_3436))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3436, float2(0.0), isnan(_3436))).xyz;
    float _978 = _976.x;
    float _980 = _976.y;
    float _982 = _976.z;
    float _984 = _621 + (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _986 = _619 + (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _988 = -_761;
    float _990 = -_763;
    float _992 = _988 + _990;
    float _994 = _623 + (*spvDescriptorSet0.fp_c9)._m0[69].z;
    float _996 = _984 * _984;
    float _998 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _789);
    float _1000 = -_773;
    float _1002 = _1000 + _992;
    float _1004 = precise::clamp(_1002, 0.0, 1.0);
    bool _1006 = 0.0 < (*spvDescriptorSet0.fp_c9)._m0[43].w;
    float _1008 = fma(_986, _986, _996);
    float _1010 = _998 + (-1.0);
    bool _1012 = as_type<uint>(_479) > 0u;
    float _1014 = fma(_994, _994, _1008);
    float _1016 = rsqrt(_1014);
    float _1018 = _1004 * (-9.27999973297119140625);
    float _1020 = exp2(_1018);
    float _1022 = _984 * _1016;
    float _1024 = _986 * _1016;
    float _1026 = _994 * _1016;
    float _1028 = _1022 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1030 = fma(_1024, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1028);
    float _1032 = fma(_1026, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1030);
    float _1034 = precise::clamp(_1032, 0.0, 1.0);
    float _1036 = -_1034;
    float _1038 = _1036 + 1.0;
    float _1040 = _605 * _1024;
    float _1042 = _1038 * _1038;
    float _1044 = -_1022;
    float _1046 = -_1040;
    float _1048 = fma(_607, _1044, _1046);
    float _1050 = _927 + 1.0;
    float _1052 = _1042 * _1042;
    float _1054 = -_1026;
    float _1056 = fma(_609, _1054, _1048);
    float _1058 = precise::clamp(_1056, 0.0, 1.0);
    float _1060 = fma(_921, _1010, 1.0);
    float _1062 = fma(_1050, _1050, 0.00999999977648258209228515625);
    float _1064 = precise::clamp(_1062, 0.0, 1.0);
    float _1066 = _1038 * _1052;
    float _1068 = fma(_921, _1010, 0.959999978542327880859375);
    float _1070 = _927 * _927;
    float _1072 = fma(_1050, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1074 = _1064 * _1064;
    float _1076 = in.m_73.x;
    float _1078 = gl_FragCoord.w;
    float _1080 = _1076 * _1078;
    float _1082 = precise::min(_1070, _1020);
    float _1084 = fma(_1050, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1086 = fma(_1068, _1066, 0.039999999105930328369140625);
    float _1088 = -_927;
    float _1090 = fma(_1088, _1082, _1084);
    float _1092 = _1058 * _1058;
    float _1094 = fma(_1050, -0.572000026702880859375, 1.03999996185302734375);
    float _1096 = _1074 + (-1.0);
    float _1098 = fma(_1090, 1.03999996185302734375, _1072);
    float _1100 = precise::clamp(_1098, 0.0, 1.0);
    float _1102 = in.m_73.y;
    float _1104 = gl_FragCoord.w;
    float _1106 = _1102 * _1104;
    float _1108 = fma(_1090, -1.03999996185302734375, _1094);
    float _1110 = precise::clamp(_1108, 0.0, 1.0);
    float _1112 = fma(_1092, _1096, 1.0);
    float _1114 = _1060 * _1100;
    float _1116 = fma(_1050, 0.5, 0.5);
    float _1118 = _605 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1120 = in.m_73.z;
    float _1122 = gl_FragCoord.w;
    float _1124 = _1120 * _1122;
    float _1126 = _1112 * _1112;
    float _1128 = _1116 * _1116;
    float _1130 = _1128 * 0.5;
    float _1132 = -_607;
    float _1134 = -_1118;
    float _1136 = fma(_1132, (*spvDescriptorSet0.fp_c9)._m0[69].y, _1134);
    float _1138 = _1074 * 0.31830990314483642578125;
    float _1140 = 1.0 / _1126;
    float _1142 = -_609;
    float _1144 = fma(_1142, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1136);
    float _1146 = precise::clamp(_1144, 0.0, 1.0);
    float _1148 = _110 * _1080;
    float _1150 = -_1130;
    float _1152 = _1150 + 1.0;
    float _1154 = fma(_1004, _1152, _1130);
    float _1156 = fma(_1146, _1152, _1130);
    float _1158 = _1138 * _1140;
    float _1160 = _1154 * _1156;
    float _1162 = _110 * _1106;
    float _1164 = _1146 * _1158;
    float _1166 = 1.0 / _1160;
    float _1168 = _110 * _1124;
    float _1170 = precise::min(1.0, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1172 = -(*spvDescriptorSet0.fp_c9)._m0[1001].w;
    float _1174 = fma(_404, (*spvDescriptorSet0.fp_c9)._m0[1000].w, _1172);
    float _1176 = precise::clamp(_1174, 0.0, 1.0);
    float _1178 = fma(_1110, 0.039999999105930328369140625, _1114);
    float _1180 = _1170 * 0.31830990314483642578125;
    float _1182 = _1164 * _1166;
    float _1184 = _1182 * 0.25;
    float _1186 = _1166;
    float _1188 = _1184;
    float _1190 = 0.0;
    float _1192 = 0.0;
    if (!_1006)
    {
        _1186 = 0.0;
    }
    float _1194 = _1186;
    float _1196 = _1086 * _1184;
    float _1198 = _1170 * _939;
    float _1200 = _1170 * _941;
    float _1202 = _1170 * _943;
    float _1204 = -_1198;
    float _1206 = fma(_1148, _1180, _1204);
    float _1208 = -_1200;
    float _1210 = fma(_1162, _1180, _1208);
    float _1212 = -_1202;
    float _1214 = fma(_1168, _1180, _1212);
    float _1216 = _943;
    float _1218 = _1194;
    if (!_1006)
    {
        _1216 = 0.0;
        _1188 = 0.0;
    }
    float _1220 = _1216;
    float _1222 = _1188;
    float _1224 = fma(_1176, _1206, _1198);
    float _1226 = fma(_1176, _1210, _1200);
    float _1228 = fma(_1176, _1214, _1202);
    bool _1230 = !_1006;
    float _1232 = _1220;
    float _1234 = _1222;
    float _1236 = 0.0;
    float _1238 = 0.0;
    float _1240 = 0.0;
    float _1242 = 0.0;
    if (!_1230)
    {
        float _1244 = -_116;
        float _1246 = _1244 + (*spvDescriptorSet0.fp_c9)._m0[43].y;
        float _1248 = -_114;
        float _1250 = _1248 + (*spvDescriptorSet0.fp_c9)._m0[43].x;
        float _1252 = -_112;
        float _1254 = _1252 + (*spvDescriptorSet0.fp_c9)._m0[43].z;
        float _1256 = _1246 * _1246;
        float _1258 = fma(_1250, _1250, _1256);
        float _1260 = fma(_1254, _1254, _1258);
        float _1262 = rsqrt(_1260);
        float _1264 = sqrt(_1260);
        float _1266 = _1250 * _1262;
        float _1268 = _1246 * _1262;
        float _1270 = _1254 * _1262;
        float _1272 = _1266 * (*spvDescriptorSet0.fp_c9)._m0[44].x;
        float _1274 = _607 * _1268;
        float _1276 = -_623;
        float _1278 = _1276 + _1270;
        float _1280 = -_1268;
        float _1282 = -_1272;
        float _1284 = fma(_1280, (*spvDescriptorSet0.fp_c9)._m0[44].y, _1282);
        float _1286 = -_621;
        float _1288 = _1286 + _1268;
        float _1290 = fma(_605, _1266, _1274);
        float _1292 = -_619;
        float _1294 = _1292 + _1266;
        float _1296 = -_1264;
        float _1298 = _1296 + (*spvDescriptorSet0.fp_c9)._m0[43].w;
        float _1300 = _1288 * _1288;
        float _1302 = -_1270;
        float _1304 = fma(_1302, (*spvDescriptorSet0.fp_c9)._m0[44].z, _1284);
        float _1306 = fma(_609, _1270, _1290);
        float _1308 = precise::clamp(_1306, 0.0, 1.0);
        float _1310 = _1298 * (*spvDescriptorSet0.fp_c9)._m0[46].y;
        float _1312 = precise::clamp(_1310, 0.0, 1.0);
        float _1314 = fma(_1294, _1294, _1300);
        float _1316 = -(*spvDescriptorSet0.fp_c9)._m0[44].w;
        float _1318 = _1304 + _1316;
        float _1320 = fma(_1278, _1278, _1314);
        float _1322 = abs(_1312);
        float _1324 = log2(_1322);
        float _1326 = _1318 * (*spvDescriptorSet0.fp_c9)._m0[46].w;
        float _1328 = precise::clamp(_1326, 0.0, 1.0);
        float _1330 = rsqrt(_1320);
        float _1332 = _1324 * (*spvDescriptorSet0.fp_c9)._m0[45].w;
        float _1334 = exp2(_1332);
        float _1336 = _1288 * _1330;
        float _1338 = _1294 * _1330;
        float _1340 = _1278 * _1330;
        float _1342 = _607 * _1336;
        float _1344 = fma(_605, _1338, _1342);
        float _1346 = fma(_609, _1340, _1344);
        float _1348 = precise::clamp(_1346, 0.0, 1.0);
        float _1350 = _1334 * _1328;
        float _1352 = _1348 * _1348;
        float _1354 = _1308 * _1350;
        float _1356 = fma(_1096, _1352, 1.0);
        float _1358 = _1356 * _1356;
        float _1360 = 1.0 / _1358;
        float _1362 = _1074 * _1360;
        float _1364 = _1362 * _1354;
        float _1366 = _1364 * (*spvDescriptorSet0.fp_c9)._m0[45].x;
        float _1368 = _1364 * (*spvDescriptorSet0.fp_c9)._m0[45].y;
        float _1370 = _1364 * (*spvDescriptorSet0.fp_c9)._m0[45].z;
        _1232 = _1366;
        _1234 = _1368;
        _1218 = _1370;
    }
    float _1372 = _1232;
    float _1374 = _1234;
    float _1376 = _1218;
    bool _1378 = !_1012;
    if (!_1378)
    {
        int _1380 = 0;
        bool _1382;
        do
        {
            int _1384 = _1380;
            float _1386 = _1190;
            float _1388 = _1236;
            float _1390 = _1238;
            int _1392 = _1384 << 1;
            int _1394 = _1392 + _462;
            int _1396 = _1394 + 8;
            int _1398 = _1396;
            int _1400 = _86(_1398, (*spvDescriptorSet0.fp_s0));
            int _1402 = _1384 + 1;
            bool _1404 = uint(_1402) >= as_type<uint>(_479);
            int _1406 = _1400 & 65535;
            int _1408 = _1406 * 48;
            int _1410 = _1408 + 1168;
            uint _1412 = uint(int(uint(_1410) >> uint(2)));
            uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
            int _1416 = int(_1412) & 3;
            float _1418 = (*spvDescriptorSet0.fp_c9)._m0[int(_1414)][_1416];
            int _1420 = int(_1412) + 1;
            uint _1422 = uint(int(uint(_1420) >> uint(2)));
            int _1424 = _1420 & 3;
            float _1426 = (*spvDescriptorSet0.fp_c9)._m0[int(_1422)][_1424];
            int _1428 = _1408 + 1176;
            uint _1430 = uint(int(uint(_1428) >> uint(2)));
            uint _1432 = uint(int(uint(int(_1430)) >> uint(2)));
            int _1434 = int(_1430) & 3;
            float _1436 = (*spvDescriptorSet0.fp_c9)._m0[int(_1432)][_1434];
            int _1438 = int(_1430) + 1;
            uint _1440 = uint(int(uint(_1438) >> uint(2)));
            int _1442 = _1438 & 3;
            float _1444 = (*spvDescriptorSet0.fp_c9)._m0[int(_1440)][_1442];
            float _1446 = -_116;
            float _1448 = _1446 + _1426;
            float _1450 = -_114;
            float _1452 = _1450 + _1418;
            float _1454 = _1448 * _1448;
            float _1456 = -_112;
            float _1458 = _1456 + _1436;
            float _1460 = fma(_1452, _1452, _1454);
            float _1462 = fma(_1458, _1458, _1460);
            float _1464 = rsqrt(_1462);
            float _1466 = sqrt(_1462);
            float _1468 = _1448 * _1464;
            float _1470 = _1458 * _1464;
            float _1472 = _1452 * _1464;
            float _1474 = _607 * _1468;
            float _1476 = -_621;
            float _1478 = _1476 + _1468;
            float _1480 = fma(_605, _1472, _1474);
            float _1482 = -_619;
            float _1484 = _1482 + _1472;
            float _1486 = _1478 * _1478;
            float _1488 = -_1466;
            float _1490 = _1488 + _1444;
            float _1492 = fma(_609, _1470, _1480);
            float _1494 = precise::clamp(_1492, 0.0, 1.0);
            float _1496 = -_623;
            float _1498 = _1496 + _1470;
            float _1500 = fma(_1484, _1484, _1486);
            float _1502 = fma(_1498, _1498, _1500);
            float _1504 = rsqrt(_1502);
            float _1506 = _1478 * _1504;
            float _1508 = _1484 * _1504;
            float _1510 = _1498 * _1504;
            float _1512 = _607 * _1506;
            float _1514 = fma(_605, _1508, _1512);
            int _1516 = _1408 + 1200;
            uint _1518 = uint(int(uint(_1516) >> uint(2)));
            uint _1520 = uint(int(uint(int(_1518)) >> uint(2)));
            int _1522 = int(_1518) & 3;
            float _1524 = (*spvDescriptorSet0.fp_c9)._m0[int(_1520)][_1522];
            float _1526 = fma(_609, _1510, _1514);
            float _1528 = precise::clamp(_1526, 0.0, 1.0);
            int _1530 = _1408 + 1192;
            uint _1532 = uint(int(uint(_1530) >> uint(2)));
            uint _1534 = uint(int(uint(int(_1532)) >> uint(2)));
            int _1536 = int(_1532) & 3;
            float _1538 = (*spvDescriptorSet0.fp_c9)._m0[int(_1534)][_1536];
            int _1540 = int(_1532) + 1;
            uint _1542 = uint(int(uint(_1540) >> uint(2)));
            int _1544 = _1540 & 3;
            float _1546 = (*spvDescriptorSet0.fp_c9)._m0[int(_1542)][_1544];
            float _1548 = _1490 * _1524;
            float _1550 = precise::clamp(_1548, 0.0, 1.0);
            float _1552 = _1528 * _1528;
            float _1554 = fma(_1096, _1552, 1.0);
            float _1556 = abs(_1550);
            float _1558 = log2(_1556);
            float _1560 = _1554 * _1554;
            float _1562 = 1.0 / _1560;
            float _1564 = _1558 * _1546;
            float _1566 = exp2(_1564);
            float _1568 = _1494 * _1566;
            float _1570 = _1074 * _1562;
            float _1572 = _1570 * _1568;
            int _1574 = _1408 + 1184;
            uint _1576 = uint(int(uint(_1574) >> uint(2)));
            uint _1578 = uint(int(uint(int(_1576)) >> uint(2)));
            int _1580 = int(_1576) & 3;
            float _1582 = (*spvDescriptorSet0.fp_c9)._m0[int(_1578)][_1580];
            int _1584 = int(_1576) + 1;
            uint _1586 = uint(int(uint(_1584) >> uint(2)));
            int _1588 = _1584 & 3;
            float _1590 = (*spvDescriptorSet0.fp_c9)._m0[int(_1586)][_1588];
            float _1592 = fma(_1572, _1538, _1386);
            float _1594 = fma(_1572, _1582, _1388);
            float _1596 = fma(_1572, _1590, _1390);
            _1382 = !_1404;
            _1380 = _1402;
            _1190 = _1592;
            _1236 = _1594;
            _1238 = _1596;
            _1192 = _1592;
            _1240 = _1594;
            _1242 = _1596;
        } while (_1382);
    }
    float _1598 = _1192;
    float _1600 = _1240;
    float _1602 = _1242;
    float _1604 = _493 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    int _1606 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    bool _1608 = as_type<uint>(_489) > 0u;
    int _1610 = _1606 & 31;
    bool _1612 = _1610 == 0;
    bool _1614 = uint(_1610) < 32u;
    int _1616 = 32 - _1610;
    int _1618 = _1610 - 32;
    uint _1620 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_1610)));
    int _1622 = 0 << _1616;
    int _1624 = int(_1620) | _1622;
    int _1626 = _1612 ? as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z) : _1624;
    uint _1628 = uint(int(uint(0) >> uint(_1618)));
    bool _1630 = uint(_1618) < 32u;
    int _1632 = _1630 ? int(_1628) : 0;
    uint _1634 = uint(_1614 ? _1626 : _1632);
    float _1636 = exp2(_1604);
    uint _1638 = extract_bits(_1634, 0u, 8u);
    float _1640 = float(_1638);
    float _1642 = _1640 * 0.0039215688593685626983642578125;
    float _1644 = _1642 * _1642;
    float _1646 = _953 * _1644;
    bool _1648 = !_1608;
    float _1650 = _1598;
    float _1652 = _1600;
    float _1654 = _1602;
    float _1656 = _1600;
    float _1658 = _1602;
    float _1660 = _1598;
    if (!_1648)
    {
        int _1662 = 0;
        bool _1664;
        do
        {
            int _1666 = _1662;
            float _1668 = _1650;
            float _1670 = _1652;
            float _1672 = _1654;
            int _1674 = _1666 << 1;
            int _1676 = _1674 + _462;
            int _1678 = _1676 + 72;
            int _1680 = _1678;
            int _1682 = _86(_1680, (*spvDescriptorSet0.fp_s0));
            int _1684 = _1666 + 1;
            bool _1686 = uint(_1684) >= as_type<uint>(_489);
            int _1688 = _1682 << 6;
            int _1690 = 4194240 & _1688;
            int _1692 = _1690 + 10384;
            uint _1694 = uint(int(uint(_1692) >> uint(2)));
            uint _1696 = uint(int(uint(int(_1694)) >> uint(2)));
            int _1698 = int(_1694) & 3;
            float _1700 = (*spvDescriptorSet0.fp_c9)._m0[int(_1696)][_1698];
            int _1702 = int(_1694) + 1;
            uint _1704 = uint(int(uint(_1702) >> uint(2)));
            int _1706 = _1702 & 3;
            float _1708 = (*spvDescriptorSet0.fp_c9)._m0[int(_1704)][_1706];
            int _1710 = _1690 + 10392;
            uint _1712 = uint(int(uint(_1710) >> uint(2)));
            uint _1714 = uint(int(uint(int(_1712)) >> uint(2)));
            int _1716 = int(_1712) & 3;
            float _1718 = (*spvDescriptorSet0.fp_c9)._m0[int(_1714)][_1716];
            int _1720 = int(_1712) + 1;
            uint _1722 = uint(int(uint(_1720) >> uint(2)));
            int _1724 = _1720 & 3;
            float _1726 = (*spvDescriptorSet0.fp_c9)._m0[int(_1722)][_1724];
            float _1728 = -_116;
            float _1730 = _1728 + _1708;
            float _1732 = -_114;
            float _1734 = _1732 + _1700;
            float _1736 = _1730 * _1730;
            float _1738 = -_112;
            float _1740 = _1738 + _1718;
            float _1742 = fma(_1734, _1734, _1736);
            float _1744 = fma(_1740, _1740, _1742);
            float _1746 = rsqrt(_1744);
            float _1748 = sqrt(_1744);
            float _1750 = _1730 * _1746;
            float _1752 = _1734 * _1746;
            float _1754 = _1740 * _1746;
            float _1756 = -_621;
            float _1758 = _1756 + _1750;
            float _1760 = -_619;
            float _1762 = _1760 + _1752;
            float _1764 = _1758 * _1758;
            float _1766 = -_1748;
            float _1768 = _1766 + _1726;
            float _1770 = -_623;
            float _1772 = _1770 + _1754;
            float _1774 = fma(_1762, _1762, _1764);
            float _1776 = fma(_1772, _1772, _1774);
            float _1778 = rsqrt(_1776);
            float _1780 = _1758 * _1778;
            float _1782 = _1762 * _1778;
            float _1784 = _1772 * _1778;
            float _1786 = _607 * _1780;
            float _1788 = fma(_605, _1782, _1786);
            float _1790 = fma(_609, _1784, _1788);
            float _1792 = precise::clamp(_1790, 0.0, 1.0);
            float _1794 = _607 * _1750;
            float _1796 = fma(_605, _1752, _1794);
            int _1798 = _1690 + 10400;
            uint _1800 = uint(int(uint(_1798) >> uint(2)));
            uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
            int _1804 = int(_1800) & 3;
            float _1806 = (*spvDescriptorSet0.fp_c9)._m0[int(_1802)][_1804];
            int _1808 = int(_1800) + 1;
            uint _1810 = uint(int(uint(_1808) >> uint(2)));
            int _1812 = _1808 & 3;
            float _1814 = (*spvDescriptorSet0.fp_c9)._m0[int(_1810)][_1812];
            float _1816 = _1752 * _1806;
            float _1818 = -_1750;
            float _1820 = -_1816;
            float _1822 = fma(_1818, _1814, _1820);
            float _1824 = fma(_609, _1754, _1796);
            float _1826 = precise::clamp(_1824, 0.0, 1.0);
            int _1828 = _1690 + 10408;
            uint _1830 = uint(int(uint(_1828) >> uint(2)));
            uint _1832 = uint(int(uint(int(_1830)) >> uint(2)));
            int _1834 = int(_1830) & 3;
            float _1836 = (*spvDescriptorSet0.fp_c9)._m0[int(_1832)][_1834];
            int _1838 = int(_1830) + 1;
            uint _1840 = uint(int(uint(_1838) >> uint(2)));
            int _1842 = _1838 & 3;
            float _1844 = (*spvDescriptorSet0.fp_c9)._m0[int(_1840)][_1842];
            int _1846 = _1690 + 10436;
            uint _1848 = uint(int(uint(_1846) >> uint(2)));
            uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
            int _1852 = int(_1848) & 3;
            float _1854 = (*spvDescriptorSet0.fp_c9)._m0[int(_1850)][_1852];
            float _1856 = -_1754;
            float _1858 = fma(_1856, _1836, _1822);
            float _1860 = _1792 * _1792;
            float _1862 = -_1844;
            float _1864 = _1858 + _1862;
            float _1866 = fma(_1096, _1860, 1.0);
            int _1868 = _1690 + 10444;
            uint _1870 = uint(int(uint(_1868) >> uint(2)));
            uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
            int _1874 = int(_1870) & 3;
            float _1876 = (*spvDescriptorSet0.fp_c9)._m0[int(_1872)][_1874];
            float _1878 = _1768 * _1854;
            float _1880 = precise::clamp(_1878, 0.0, 1.0);
            float _1882 = _1866 * _1866;
            float _1884 = 1.0 / _1882;
            float _1886 = abs(_1880);
            float _1888 = log2(_1886);
            float _1890 = _1074 * _1884;
            float _1892 = _1864 * _1876;
            float _1894 = precise::clamp(_1892, 0.0, 1.0);
            int _1896 = _1690 + 10424;
            uint _1898 = uint(int(uint(_1896) >> uint(2)));
            uint _1900 = uint(int(uint(int(_1898)) >> uint(2)));
            int _1902 = int(_1898) & 3;
            float _1904 = (*spvDescriptorSet0.fp_c9)._m0[int(_1900)][_1902];
            int _1906 = int(_1898) + 1;
            uint _1908 = uint(int(uint(_1906) >> uint(2)));
            int _1910 = _1906 & 3;
            float _1912 = (*spvDescriptorSet0.fp_c9)._m0[int(_1908)][_1910];
            float _1914 = _1888 * _1912;
            float _1916 = exp2(_1914);
            float _1918 = _1916 * _1894;
            float _1920 = _1826 * _1918;
            int _1922 = _1690 + 10416;
            uint _1924 = uint(int(uint(_1922) >> uint(2)));
            uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
            int _1928 = int(_1924) & 3;
            float _1930 = (*spvDescriptorSet0.fp_c9)._m0[int(_1926)][_1928];
            int _1932 = int(_1924) + 1;
            uint _1934 = uint(int(uint(_1932) >> uint(2)));
            int _1936 = _1932 & 3;
            float _1938 = (*spvDescriptorSet0.fp_c9)._m0[int(_1934)][_1936];
            float _1940 = _1890 * _1920;
            float _1942 = fma(_1940, _1904, _1668);
            float _1944 = fma(_1940, _1930, _1670);
            float _1946 = fma(_1940, _1938, _1672);
            _1664 = !_1686;
            _1662 = _1684;
            _1650 = _1942;
            _1652 = _1944;
            _1654 = _1946;
            _1656 = _1944;
            _1658 = _1946;
            _1660 = _1942;
        } while (_1664);
    }
    float _1948 = _1656;
    float _1950 = _1658;
    float _1952 = _1660;
    float _1954 = _1948 + _1372;
    float _1956 = _1950 + _1374;
    float _1958 = _1952 + _1376;
    float _1960 = -_1636;
    float _1962 = _1960 + 1.0;
    float _1964 = _1224 + _1954;
    float _1966 = _1226 + _1956;
    float _1968 = _1228 + _1958;
    float _1970 = _957 * 10.0;
    float _1972 = _1178 * _1964;
    float _1974 = _1178 * _1966;
    float _1976 = _959 * 10.0;
    float _1978 = _1178 * _1968;
    float _1980 = fma(_1196, (*spvDescriptorSet0.fp_c9)._m0[70].x, _1972);
    float _1982 = fma(_1196, (*spvDescriptorSet0.fp_c9)._m0[70].y, _1974);
    float _1984 = _1962 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1986 = fma(_1196, (*spvDescriptorSet0.fp_c9)._m0[70].z, _1978);
    float _1988 = fma(_1970, (*spvDescriptorSet0.fp_c9)._m0[40].z, _1980);
    float _1990 = fma(_1976, (*spvDescriptorSet0.fp_c9)._m0[40].z, _1982);
    float _1992 = _961 * 10.0;
    float _1994 = _980 * _1984;
    float _1996 = _978 * _1984;
    float _1998 = _982 * _1984;
    float _2000 = -_1984;
    float _2002 = _2000 + 1.0;
    float _2004 = fma(_1992, (*spvDescriptorSet0.fp_c9)._m0[40].z, _1986);
    float _2006 = fma(_1994, _974, _970);
    float _2008 = fma(_1996, _974, _968);
    float _2010 = fma(_1998, _974, _972);
    float _2012 = _2002 * _974;
    float _2014 = _963 * _2006;
    float _2016 = precise::max(0.0, _1988);
    float _2018 = _963 * _2008;
    float _2020 = precise::max(0.0, _1990);
    float _2022 = _963 * _2010;
    float _2024 = precise::max(0.0, _2004);
    float _2026 = fma(_2012, _2016, _2018);
    float _2028 = fma(_2012, _2020, _2014);
    float _2030 = fma(_2012, _2024, _2022);
    out.m_78.x = _2026;
    out.m_78.y = _2028;
    out.m_78.z = _2030;
    out.m_78.w = _1646;
    out.m_80.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

