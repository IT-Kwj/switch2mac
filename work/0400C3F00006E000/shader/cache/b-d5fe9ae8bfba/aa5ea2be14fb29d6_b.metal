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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
    float4 m_45 [[color(1)]];
};

struct main0_in
{
    float4 m_38 [[user(locn6)]];
    float4 m_40 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _52 = gl_FragCoord.w;
    float _54 = in.m_38.z;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_38.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_38.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _52;
    float _74 = _72 * _58;
    float _76 = _72 * _64;
    float _78 = _72 * _70;
    float _80 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _82 = _74 + _80;
    float _84 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _86 = _76 + _84;
    float _88 = _82 * _82;
    float _90 = fma(_86, _86, _88);
    float _92 = sqrt(_90);
    bool _96 = _92 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _98 = 0.0;
    float _100 = _70;
    float _102 = _88;
    if (!_96)
    {
        _98 = _76;
    }
    float _104 = _98;
    float _106 = _104;
    if (!_96)
    {
        _100 = _78;
    }
    float _108 = _100;
    float _110 = _108;
    if (!_96)
    {
        _102 = _74;
    }
    float _112 = _102;
    bool _114 = !_96;
    float _116 = _112;
    if (!_114)
    {
        float _118 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _120 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _122 = _92 + _120;
        float _124 = _78 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _126 = rsqrt(_90);
        float _128 = _122 * _118;
        float _130 = _128 * 0.15915493667125701904296875;
        float _132 = _130 * 6.283185482025146484375;
        float _134 = sin(_132);
        float _136 = _130 * 6.283185482025146484375;
        float _138 = cos(_136);
        float _140 = fma(_134, _124, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _142 = _126 * _140;
        float _144 = _138 + (-1.0);
        float _146 = fma(_86, _142, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        float _148 = _144 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _150 = fma(_82, _142, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        float _152 = fma(_78, _138, _148);
        _110 = _152;
        _106 = _146;
        _116 = _150;
    }
    float _154 = _110;
    float _156 = _106;
    float _158 = _116;
    float _160 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _162 = _154 + _160;
    float _164 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _166 = _156 + _164;
    float _168 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _170 = _158 + _168;
    float _172 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _174 = _78 + _172;
    float _176 = _162 * _162;
    float _178 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _180 = _76 + _178;
    float _182 = fma(_166, _166, _176);
    float _184 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _186 = _74 + _184;
    float _188 = fma(_170, _170, _182);
    float _190 = rsqrt(_188);
    float _192 = _190 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _194 = _166 * _192;
    float _196 = _170 * _192;
    float _198 = _174 * _174;
    float _200 = _194 * _194;
    float _202 = _196 * _196;
    float _204 = fma(_180, _180, _198);
    float _206 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _208 = _200 + _202;
    float _210 = fma(_186, _186, _204);
    float _212 = precise::max(0.0, _206);
    float _214 = sqrt(_208);
    float _216 = -_192;
    float _218 = -_212;
    float _220 = fma(_162, _216, _218);
    float _222 = sqrt(_210);
    bool _224 = _214 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _226 = (*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _228 = _162;
    float _230 = _212;
    float _232 = _194;
    float _234 = _196;
    if (!_224)
    {
        _226 = _202;
    }
    float _236 = _226;
    float _238 = _236;
    if (!_224)
    {
        _228 = _200;
    }
    float _240 = _228;
    float _242 = _240;
    if (!_224)
    {
        _230 = _220;
    }
    float _244 = _230;
    bool _246 = !_224;
    float _248 = _244;
    if (!_246)
    {
        float _250 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _252 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _254 = _214 + _252;
        float _256 = _220 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _258 = rsqrt(_208);
        float _260 = _254 * _250;
        float _262 = _260 * 0.15915493667125701904296875;
        float _264 = _262 * 6.283185482025146484375;
        float _266 = sin(_264);
        float _268 = _262 * 6.283185482025146484375;
        float _270 = cos(_268);
        float _272 = fma(_266, _256, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _274 = _258 * _272;
        float _276 = _270 + (-1.0);
        float _278 = _194 * _274;
        float _280 = _196 * _274;
        float _282 = _276 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _284 = _280 * _280;
        float _286 = fma(_220, _270, _282);
        float _288 = _278 * _278;
        _248 = _286;
        _242 = _288;
        _238 = _284;
        _232 = _278;
        _234 = _280;
    }
    float _290 = _248;
    float _292 = _242;
    float _294 = _238;
    float _296 = _232;
    float _298 = _234;
    float _300 = fma(_290, _290, _292);
    float _302 = _300 + _294;
    float _304 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _306 = fma(_222, (*spvDescriptorSet0.fp_c9)._m0[63].x, _304);
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = rsqrt(_302);
    float _312 = -_308;
    float _314 = _312 + 1.0;
    float _316 = abs(_314);
    float _318 = log2(_316);
    float _320 = _310 * _296;
    float _322 = _310 * _290;
    float _324 = _310 * _298;
    float _326 = _320 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _328 = -_326;
    float _330 = fma(_322, (*spvDescriptorSet0.fp_c9)._m0[69].y, _328);
    float _332 = _318 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _334 = -_324;
    float _336 = fma(_334, (*spvDescriptorSet0.fp_c9)._m0[69].z, _330);
    float _338 = fma(_336, -0.5, 0.5);
    float _340 = exp2(_332);
    float _342 = fma(_336, 0.5, 0.5);
    float _344 = _322 + 1.0;
    float _346 = fma(_342, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _348 = sqrt(_338);
    float _350 = fma(_342, _346, -0.212114393711090087890625);
    float _352 = fma(_342, _350, 1.570728778839111328125);
    float _354 = -_322;
    float _356 = fma(_340, _344, _354);
    float _358 = fma(_356, 0.5, 0.5);
    float _360 = _348 * 0.636619746685028076171875;
    float _362 = -_352;
    float _364 = fma(_360, _362, 1.0);
    float2 _1165 = float2(_364, _358);
    float3 _368 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1165, float2(0.0), isnan(_1165))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1165, float2(0.0), isnan(_1165))).xyz;
    float _370 = _368.x;
    float _372 = _368.y;
    float _374 = _368.z;
    float _376 = spvFAdd(_222, 9.9999997473787516355514526367188e-06);
    float _378 = _78 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _380 = abs(_174);
    bool _382 = _380 > 0.00999999977648258209228515625;
    float _384 = in.m_40.w;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = 1.0 / _376;
    float _392 = fma(_76, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _378);
    float _394 = _382 ? _174 : 0.00999999977648258209228515625;
    float _396 = fma(_74, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _392);
    float _398 = _394 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _400 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _402 = precise::max(_398, -127.0);
    float _404 = -_400;
    float _406 = exp2(_404);
    float _408 = _174 * _390;
    float _410 = _180 * _390;
    float _412 = _186 * _390;
    float _414 = _408 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _416 = _396 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _418 = 1.0 / _402;
    float _420 = fma(_410, (*spvDescriptorSet0.fp_c9)._m0[69].x, _414);
    float _422 = fma(_412, (*spvDescriptorSet0.fp_c9)._m0[69].z, _420);
    float _424 = _78 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _426 = -_402;
    float _428 = exp2(_426);
    float _430 = fma(_422, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _432 = fma(_76, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _424);
    float _434 = _72 * _388;
    float _436 = fma(_430, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _438 = fma(_74, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _432);
    float _440 = -_434;
    float _442 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _444 = _440 + _442;
    float _446 = trunc(_416);
    int _449 = int(_446);
    float _451 = _222 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _453 = _438 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _455 = abs(_436);
    float _457 = log2(_455);
    float _459 = -_428;
    float _461 = _459 + 1.0;
    float _463 = _406 * _461;
    float _465 = _318 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _467 = trunc(_453);
    int _469 = int(_467);
    float _471 = _463 * _418;
    int _473 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _475 = _449 + _473;
    int _477 = _475 + 1;
    bool _479 = _477 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _481 = _457 * 1.5;
    float _483 = exp2(_465);
    int _485 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _487 = _469 + _485;
    int _489 = _487 + 1;
    float _491 = exp2(_481);
    float _493 = _471 * _451;
    int _495 = _477 | _489;
    bool _497 = _495 < 0;
    bool _499 = _497 || _479;
    float _501 = -_493;
    float _503 = exp2(_501);
    bool _505 = _489 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _507 = _505 || _499;
    float _509 = _491 * 12.56637096405029296875;
    float _511 = 1.0 / _509;
    float _513 = _465;
    if (_507)
    {
        _513 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _515 = _513;
    float _517 = _515;
    if (!_507)
    {
        int _519 = _489 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _521 = _519 + _477;
        float _523 = floor(_453);
        int _525 = _521 << 2;
        int _527 = _521 >> 2;
        int _529 = 12 & _525;
        int _531 = _527 << 4;
        int _533 = _531 + _529;
        float _535 = floor(_416);
        int _537 = _533 + 16256;
        uint _540 = uint(int(uint(_537) >> uint(2)));
        uint _542 = uint(int(uint(int(_540)) >> uint(2)));
        int _544 = int(_540) & 3;
        float _546 = (*spvDescriptorSet0.fp_c9)._m0[int(_542)][_544];
        float _548 = -_523;
        float _550 = _453 + _548;
        float _552 = -_535;
        float _554 = _416 + _552;
        float _556 = rint(_546);
        float _558 = precise::max(_556, 0.0);
        uint _560 = uint(_558);
        uint _562 = clamp(_560, 0u, 65535u);
        float3 _1472 = float3(_554, _550, float(int(_562)));
        float3 _1476 = select(_1472, float3(0.0), isnan(_1472));
        float _564 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _1476.xy, uint(rint(_1476.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _1476.xy, uint(rint(_1476.z))).x;
        int _566 = _521 << 4;
        int _568 = _566 + 17904;
        int _570 = _533 + 24304;
        uint _572 = uint(int(uint(_570) >> uint(2)));
        uint _574 = uint(int(uint(int(_572)) >> uint(2)));
        int _576 = int(_572) & 3;
        float _578 = (*spvDescriptorSet0.fp_c9)._m0[int(_574)][_576];
        uint _580 = uint(int(uint(_568) >> uint(2)));
        uint _582 = uint(int(uint(int(_580)) >> uint(2)));
        int _584 = int(_580) & 3;
        float _586 = (*spvDescriptorSet0.fp_c9)._m0[int(_582)][_584];
        int _588 = int(_580) + 1;
        uint _590 = uint(int(uint(_588) >> uint(2)));
        int _592 = _588 & 3;
        float _594 = (*spvDescriptorSet0.fp_c9)._m0[int(_590)][_592];
        int _596 = _568 + 8;
        uint _598 = uint(int(uint(_596) >> uint(2)));
        uint _600 = uint(int(uint(int(_598)) >> uint(2)));
        int _602 = int(_598) & 3;
        float _604 = (*spvDescriptorSet0.fp_c9)._m0[int(_600)][_602];
        int _606 = int(_598) + 1;
        uint _608 = uint(int(uint(_606) >> uint(2)));
        int _610 = _606 & 3;
        float _612 = (*spvDescriptorSet0.fp_c9)._m0[int(_608)][_610];
        float _614 = _78 * _594;
        float _616 = fma(_76, _586, _614);
        float _618 = 1.0 / _578;
        float _620 = fma(_74, _604, _616);
        float _622 = _578 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _624 = _620 + _612;
        float _626 = precise::clamp(_624, 0.0, 1.0);
        float _628 = -_626;
        float _630 = _628 + _564;
        float _632 = fma(_618, (*spvDescriptorSet0.fp_c13)._m0[4].w, _630);
        float _634 = _622 * _632;
        float _636 = exp2(_634);
        float _638 = 0.0 + _636;
        float _640 = precise::clamp(_638, 0.0, 1.0);
        float _642 = precise::min(_640, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _517 = _642;
    }
    float _644 = _517;
    float _646 = _444 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _648 = precise::clamp(_646, 0.0, 1.0);
    float _650 = -_644;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _656 = fma(_654, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _658 = -_503;
    float _660 = _658 + 1.0;
    float _662 = -_483;
    float _664 = _662 + 1.0;
    float _666 = fma(_648, _652, _644);
    float _668 = _656 * _511;
    float _670 = _664 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _672 = _660 * _668;
    float _674 = precise::min(_666, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _676 = _503 * _670;
    float _678 = _674 * _672;
    float _680 = _678 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _682 = _678 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _684 = _678 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _686 = fma(_370, _676, _680);
    float _688 = fma(_372, _676, _682);
    float _690 = fma(_374, _676, _684);
    out.m_43.x = _686;
    out.m_43.y = _688;
    out.m_43.z = _690;
    out.m_43.w = 1.0;
    out.m_45.x = _686;
    out.m_45.y = _688;
    out.m_45.z = _690;
    out.m_45.w = 1.0;
    return out;
}

