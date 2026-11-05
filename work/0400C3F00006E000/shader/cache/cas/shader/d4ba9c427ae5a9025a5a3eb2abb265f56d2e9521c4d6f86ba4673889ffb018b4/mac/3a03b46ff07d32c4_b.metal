#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

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

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

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
    constant _16* fp_c3 [[id(0)]];
    texturecube_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
    float4 m_36 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5495 = false;
    bool _5477 = false;
    bool _5333 = false;
    bool _5315 = false;
    bool _5171 = false;
    bool _5153 = false;
    bool _5009 = false;
    bool _4991 = false;
    bool _4847 = false;
    bool _4829 = false;
    bool _4685 = false;
    bool _4667 = false;
    bool _4523 = false;
    bool _4505 = false;
    bool _4361 = false;
    bool _4343 = false;
    bool _4199 = false;
    bool _4181 = false;
    bool _4037 = false;
    bool _4019 = false;
    bool _3875 = false;
    bool _3857 = false;
    bool _3713 = false;
    bool _3695 = false;
    bool _3551 = false;
    bool _3533 = false;
    bool _3389 = false;
    bool _3371 = false;
    bool _3227 = false;
    bool _3209 = false;
    bool _3099 = false;
    bool _3065 = false;
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_36.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_36.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_34.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_36.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_38.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_38.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_38.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = 1.0 / _48;
    float _106 = _104 * _54;
    float _108 = _104 * _60;
    float _110 = _104 * _66;
    float _112 = _104 * _72;
    float _114 = _104 * _78;
    float _116 = _104 * _84;
    float _118 = _108 + _110;
    float _120 = _106 + _112;
    float _122 = abs(_108);
    float _124 = abs(_106);
    float _126 = precise::max(_122, _124);
    float _128 = _114 + _116;
    float _130 = fma(_110, 2.0, _108);
    float _132 = fma(_112, 2.0, _106);
    float _134 = abs(_118);
    float _136 = abs(_120);
    float _138 = precise::max(_134, _136);
    float _140 = _104 * _96;
    float _142 = abs(_114);
    float _144 = precise::max(_142, _126);
    float _146 = _104 * _90;
    float _148 = abs(_128);
    float _150 = precise::max(_148, _138);
    float _152 = _104 * _102;
    float _154 = fma(_116, 2.0, _114);
    float _156 = in.m_34.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = abs(_130);
    float _164 = abs(_132);
    float _166 = precise::max(_162, _164);
    float _168 = _108 + _146;
    float _170 = _106 + _140;
    float _172 = _114 + _152;
    float _174 = abs(_154);
    float _176 = precise::max(_174, _166);
    float _178 = fma(_146, 3.0, _108);
    float _180 = fma(_140, 3.0, _106);
    float _182 = abs(_168);
    float _184 = abs(_170);
    float _186 = precise::max(_182, _184);
    float _188 = fma(_146, 2.0, _108);
    float _190 = fma(_140, 2.0, _106);
    float _192 = 1.0 / _144;
    float _194 = abs(_172);
    float _196 = precise::max(_194, _186);
    float _198 = fma(_152, 3.0, _114);
    float _200 = _188 + _110;
    float _202 = abs(_188);
    float _204 = abs(_190);
    float _206 = precise::max(_202, _204);
    float _208 = _190 + _112;
    float _210 = fma(_112, 3.0, _106);
    float _212 = fma(_116, 3.0, _114);
    float _214 = 1.0 / _196;
    float _216 = fma(_152, 2.0, _114);
    float _218 = abs(_178);
    float _220 = abs(_180);
    float _222 = precise::max(_218, _220);
    float _224 = _168 + _110;
    float _226 = _170 + _112;
    float _228 = _216 + _116;
    float _230 = abs(_198);
    float _232 = precise::max(_230, _222);
    float _234 = fma(_110, 2.0, _168);
    float _236 = abs(_216);
    float _238 = precise::max(_236, _206);
    float _240 = 1.0 / _150;
    float _242 = _106 * _192;
    float _244 = _114 * _192;
    float _246 = fma(_112, 2.0, _170);
    float _248 = _104 * _160;
    float _250 = fma(_110, 3.0, _188);
    float _252 = _178 + _110;
    float _254 = _172 * _214;
    float _256 = 1.0 / _232;
    float _258 = fma(_110, 3.0, _108);
    float _260 = _108 * _192;
    float _262 = fma(_110, 2.0, _188);
    float _264 = fma(_110, 2.0, _178);
    float _266 = fma(_110, 3.0, _178);
    float _268 = fma(_116, 3.0, _216);
    float _270 = fma(_116, 2.0, _216);
    float _272 = 1.0 / _238;
    float _274 = abs(_200);
    float _276 = abs(_208);
    float _278 = precise::max(_274, _276);
    float _280 = _172 + _116;
    float _282 = fma(_116, 2.0, _172);
    float _284 = fma(_112, 2.0, _190);
    float _286 = abs(_228);
    float _288 = precise::max(_286, _278);
    float _290 = _198 + _116;
    float _292 = fma(_116, 2.0, _198);
    float _294 = 1.0 / _176;
    float _296 = fma(_116, 3.0, _172);
    float _298 = _180 + _112;
    float _300 = fma(_116, 3.0, _198);
    float _302 = _178 * _256;
    float _304 = _198 * _256;
    float _306 = abs(_224);
    float _308 = abs(_226);
    float _310 = precise::max(_306, _308);
    float _312 = _118 * _240;
    float _314 = 1.0 / _288;
    float _316 = fma(_112, 3.0, _170);
    float _318 = _170 * _214;
    float _320 = _216 * _272;
    float _322 = _188 * _272;
    float _324 = abs(_280);
    float _326 = precise::max(_324, _310);
    float _328 = _120 * _240;
    float _330 = abs(_258);
    float _332 = abs(_210);
    float _334 = precise::max(_330, _332);
    float _336 = _130 * _294;
    float _338 = fma(_110, 3.0, _168);
    float _340 = _168 * _214;
    float _342 = fma(_112, 3.0, _190);
    float _344 = _132 * _294;
    float _346 = _154 * _294;
    float _348 = _190 * _272;
    float _350 = fma(_112, 2.0, _180);
    float _352 = abs(_250);
    float _354 = abs(_342);
    float _356 = precise::max(_352, _354);
    float _358 = fma(_112, 3.0, _180);
    float _360 = _180 * _256;
    float _362 = rint(_248);
    float _364 = precise::max(_362, 0.0);
    uint _367 = uint(_364);
    uint _369 = clamp(_367, 0u, 65535u);
    float _371 = abs(_268);
    float _373 = precise::max(_371, _356);
    float _375 = _200 * _314;
    float _377 = abs(_338);
    float _379 = abs(_316);
    float _381 = precise::max(_377, _379);
    float _383 = _208 * _314;
    float _385 = abs(_252);
    float _387 = abs(_298);
    float _389 = precise::max(_385, _387);
    float _391 = _228 * _314;
    float _393 = abs(_212);
    float _395 = precise::max(_393, _334);
    float _397 = 1.0 / _373;
    float _399 = abs(_296);
    float _401 = precise::max(_399, _381);
    float _403 = _128 * _240;
    float _405 = abs(_264);
    float _407 = abs(_350);
    float _409 = precise::max(_405, _407);
    float _411 = abs(_290);
    float _413 = precise::max(_411, _389);
    float _415 = abs(_234);
    float _417 = abs(_246);
    float _419 = precise::max(_415, _417);
    float _421 = 1.0 / _326;
    float _423 = abs(_292);
    float _425 = precise::max(_423, _409);
    float _427 = abs(_266);
    float _429 = abs(_358);
    float _431 = precise::max(_427, _429);
    float _433 = _342 * _397;
    float _435 = 1.0 / _395;
    float _437 = abs(_282);
    float _439 = precise::max(_437, _419);
    float4 _7820 = float4(_260, _242, _244, float(int(_369)));
    float4 _7824 = select(_7820, float4(0.0), isnan(_7820));
    float4 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7824.xyz, uint(rint(_7824.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7824.xyz, uint(rint(_7824.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _444 = _442.x;
    float _446 = _442.y;
    float _448 = _442.z;
    float _450 = _442.w;
    float4 _7845 = float4(_340, _318, _254, float(int(_369)));
    float4 _7847 = select(_7845, float4(0.0), isnan(_7845));
    float4 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7847.xyz, uint(rint(_7847.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7847.xyz, uint(rint(_7847.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _454 = _452.x;
    float _456 = _452.y;
    float _458 = _452.z;
    float _460 = _452.w;
    float4 _7867 = float4(_322, _348, _320, float(int(_369)));
    float4 _7869 = select(_7867, float4(0.0), isnan(_7867));
    float4 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7869.xyz, uint(rint(_7869.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7869.xyz, uint(rint(_7869.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _464 = _462.x;
    float _466 = _462.y;
    float _468 = _462.z;
    float _470 = _462.w;
    float _472 = abs(_300);
    float _474 = precise::max(_472, _431);
    float _476 = _224 * _421;
    float _478 = 1.0 / _401;
    float _480 = abs(_262);
    float _482 = abs(_284);
    float _484 = precise::max(_480, _482);
    float _486 = _226 * _421;
    float _488 = _280 * _421;
    float _490 = abs(_270);
    float _492 = precise::max(_490, _484);
    float _494 = 1.0 / _413;
    float4 _7919 = float4(_302, _360, _304, float(int(_369)));
    float4 _7921 = select(_7919, float4(0.0), isnan(_7919));
    float4 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7921.xyz, uint(rint(_7921.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7921.xyz, uint(rint(_7921.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _498 = _496.x;
    float _500 = _496.y;
    float _502 = _496.z;
    float _504 = _496.w;
    float _506 = 1.0 / _425;
    float4 _7943 = float4(_312, _328, _403, float(int(_369)));
    float4 _7945 = select(_7943, float4(0.0), isnan(_7943));
    float4 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7945.xyz, uint(rint(_7945.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7945.xyz, uint(rint(_7945.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _510 = _508.x;
    float _512 = _508.y;
    float _514 = _508.z;
    float _516 = _508.w;
    float4 _7965 = float4(_476, _486, _488, float(int(_369)));
    float4 _7967 = select(_7965, float4(0.0), isnan(_7965));
    float4 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7967.xyz, uint(rint(_7967.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7967.xyz, uint(rint(_7967.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _520 = _518.x;
    float _522 = _518.y;
    float _524 = _518.z;
    float _526 = _518.w;
    float4 _7987 = float4(_375, _383, _391, float(int(_369)));
    float4 _7989 = select(_7987, float4(0.0), isnan(_7987));
    float4 _528 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7989.xyz, uint(rint(_7989.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7989.xyz, uint(rint(_7989.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _530 = _528.x;
    float _532 = _528.y;
    float _534 = _528.z;
    float _536 = _528.w;
    float _538 = _258 * _435;
    float _540 = _338 * _478;
    float _542 = _316 * _478;
    float _544 = _296 * _478;
    float _546 = 1.0 / _474;
    float _548 = _252 * _494;
    float _550 = _298 * _494;
    float _552 = _290 * _494;
    float _554 = _210 * _435;
    float _556 = _212 * _435;
    float _558 = 1.0 / _439;
    float _560 = _264 * _506;
    float _562 = _350 * _506;
    float _564 = _292 * _506;
    float _566 = 1.0 / _492;
    float4 _8051 = float4(_548, _550, _552, float(int(_369)));
    float4 _8053 = select(_8051, float4(0.0), isnan(_8051));
    float4 _568 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8053.xyz, uint(rint(_8053.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8053.xyz, uint(rint(_8053.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _570 = _568.x;
    float _572 = _568.y;
    float _574 = _568.z;
    float _576 = _568.w;
    float4 _8073 = float4(_336, _344, _346, float(int(_369)));
    float4 _8075 = select(_8073, float4(0.0), isnan(_8073));
    float4 _578 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8075.xyz, uint(rint(_8075.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8075.xyz, uint(rint(_8075.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _580 = _578.x;
    float _582 = _578.y;
    float _584 = _578.z;
    float _586 = _578.w;
    float _588 = _358 * _546;
    float _590 = _300 * _546;
    float _592 = _250 * _397;
    float _594 = _234 * _558;
    float _596 = _246 * _558;
    float _598 = _282 * _558;
    float _600 = _268 * _397;
    float _602 = _266 * _546;
    float _604 = _262 * _566;
    float _606 = _284 * _566;
    float _608 = _270 * _566;
    float4 _8128 = float4(_594, _596, _598, float(int(_369)));
    float4 _8130 = select(_8128, float4(0.0), isnan(_8128));
    float4 _610 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8130.xyz, uint(rint(_8130.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8130.xyz, uint(rint(_8130.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _612 = _610.x;
    float _614 = _610.y;
    float _616 = _610.z;
    float _618 = _610.w;
    float4 _8150 = float4(_604, _606, _608, float(int(_369)));
    float4 _8152 = select(_8150, float4(0.0), isnan(_8150));
    float4 _620 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8152.xyz, uint(rint(_8152.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8152.xyz, uint(rint(_8152.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _622 = _620.x;
    float _624 = _620.y;
    float _626 = _620.z;
    float _628 = _620.w;
    float4 _8172 = float4(_560, _562, _564, float(int(_369)));
    float4 _8174 = select(_8172, float4(0.0), isnan(_8172));
    float4 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8174.xyz, uint(rint(_8174.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8174.xyz, uint(rint(_8174.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _632 = _630.x;
    float _634 = _630.y;
    float _636 = _630.z;
    float _638 = _630.w;
    float4 _8194 = float4(_538, _554, _556, float(int(_369)));
    float4 _8196 = select(_8194, float4(0.0), isnan(_8194));
    float4 _640 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8196.xyz, uint(rint(_8196.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8196.xyz, uint(rint(_8196.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _642 = _640.x;
    float _644 = _640.y;
    float _646 = _640.z;
    float _648 = _640.w;
    float4 _8216 = float4(_540, _542, _544, float(int(_369)));
    float4 _8218 = select(_8216, float4(0.0), isnan(_8216));
    float4 _650 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8218.xyz, uint(rint(_8218.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8218.xyz, uint(rint(_8218.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _652 = _650.x;
    float _654 = _650.y;
    float _656 = _650.z;
    float _658 = _650.w;
    float4 _8238 = float4(_592, _433, _600, float(int(_369)));
    float4 _8240 = select(_8238, float4(0.0), isnan(_8238));
    float4 _660 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8240.xyz, uint(rint(_8240.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8240.xyz, uint(rint(_8240.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _662 = _660.x;
    float _664 = _660.y;
    float _666 = _660.z;
    float _668 = _660.w;
    float4 _8260 = float4(_602, _588, _590, float(int(_369)));
    float4 _8262 = select(_8260, float4(0.0), isnan(_8260));
    float4 _670 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8262.xyz, uint(rint(_8262.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8262.xyz, uint(rint(_8262.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _672 = _670.x;
    float _674 = _670.y;
    float _676 = _670.z;
    float _678 = _670.w;
    float _680 = _446 + _456;
    float _682 = _444 + _454;
    float _684 = _448 + _458;
    float _686 = _466 + _680;
    float _688 = _464 + _682;
    float _690 = _468 + _684;
    float _692 = _500 + _686;
    float _694 = _498 + _688;
    float _696 = _502 + _690;
    float _698 = _512 + _692;
    float _700 = _510 + _694;
    float _702 = _514 + _696;
    float _704 = _522 + _698;
    float _706 = _520 + _700;
    float _708 = _524 + _702;
    float _710 = _532 + _704;
    float _712 = _530 + _706;
    float _714 = _534 + _708;
    float _716 = _572 + _710;
    float _718 = _570 + _712;
    float _720 = _574 + _714;
    float _722 = _582 + _716;
    float _724 = _580 + _718;
    float _726 = _584 + _720;
    float _728 = _614 + _722;
    float _730 = _612 + _724;
    float _732 = _616 + _726;
    float _734 = _624 + _728;
    float _736 = _622 + _730;
    float _738 = _626 + _732;
    float _740 = _634 + _734;
    float _742 = _632 + _736;
    float _744 = _636 + _738;
    float _746 = _644 + _740;
    float _748 = _642 + _742;
    float _750 = _646 + _744;
    float _752 = _654 + _746;
    float _754 = _652 + _748;
    float _756 = _656 + _750;
    float _758 = _664 + _752;
    float _760 = _662 + _754;
    float _762 = _666 + _756;
    float _764 = _674 + _758;
    float _766 = _672 + _760;
    float _768 = _676 + _762;
    float _770 = fma(_764, -0.0625, _456);
    float _772 = fma(_766, -0.0625, _454);
    float _774 = fma(_768, -0.0625, _458);
    float _776 = fma(_764, -0.0625, _446);
    float _778 = _770 * _770;
    float _780 = _772 * _770;
    float _782 = _770 * _774;
    float _784 = fma(_766, -0.0625, _444);
    float _786 = fma(_768, -0.0625, _448);
    float _788 = _772 * _772;
    float _790 = _772 * _774;
    float _792 = fma(_776, _776, _778);
    float _794 = fma(_784, _776, _780);
    float _796 = fma(_776, _786, _782);
    float _798 = fma(_784, _784, _788);
    float _800 = fma(_784, _786, _790);
    float _802 = _774 * _774;
    float _804 = fma(_764, -0.0625, _466);
    float _806 = fma(_766, -0.0625, _464);
    float _808 = fma(_768, -0.0625, _468);
    float _810 = fma(_786, _786, _802);
    float _812 = fma(_804, _804, _792);
    float _814 = fma(_806, _804, _794);
    float _816 = fma(_804, _808, _796);
    float _818 = fma(_806, _806, _798);
    float _820 = fma(_806, _808, _800);
    float _822 = fma(_764, -0.0625, _500);
    float _824 = fma(_766, -0.0625, _498);
    float _826 = fma(_768, -0.0625, _502);
    float _828 = fma(_808, _808, _810);
    float _830 = fma(_822, _822, _812);
    float _832 = fma(_824, _822, _814);
    float _834 = fma(_822, _826, _816);
    float _836 = fma(_824, _824, _818);
    float _838 = fma(_824, _826, _820);
    float _840 = fma(_764, -0.0625, _512);
    float _842 = fma(_766, -0.0625, _510);
    float _844 = fma(_768, -0.0625, _514);
    float _846 = fma(_826, _826, _828);
    float _848 = fma(_840, _840, _830);
    float _850 = fma(_842, _840, _832);
    float _852 = fma(_840, _844, _834);
    float _854 = fma(_842, _842, _836);
    float _856 = fma(_842, _844, _838);
    float _858 = fma(_764, -0.0625, _522);
    float _860 = fma(_766, -0.0625, _520);
    float _862 = fma(_768, -0.0625, _524);
    float _864 = fma(_844, _844, _846);
    float _866 = fma(_858, _858, _848);
    float _868 = fma(_860, _858, _850);
    float _870 = fma(_858, _862, _852);
    float _872 = fma(_860, _860, _854);
    float _874 = fma(_860, _862, _856);
    float _876 = fma(_764, -0.0625, _532);
    float _878 = fma(_766, -0.0625, _530);
    float _880 = fma(_768, -0.0625, _534);
    float _882 = fma(_862, _862, _864);
    float _884 = fma(_876, _876, _866);
    float _886 = fma(_878, _876, _868);
    float _888 = fma(_876, _880, _870);
    float _890 = fma(_878, _878, _872);
    float _892 = fma(_878, _880, _874);
    float _894 = fma(_764, -0.0625, _572);
    float _896 = fma(_766, -0.0625, _570);
    float _898 = fma(_768, -0.0625, _574);
    float _900 = fma(_880, _880, _882);
    float _902 = fma(_894, _894, _884);
    float _904 = fma(_896, _894, _886);
    float _906 = fma(_894, _898, _888);
    float _908 = fma(_896, _896, _890);
    float _910 = fma(_896, _898, _892);
    float _912 = fma(_764, -0.0625, _582);
    float _914 = fma(_766, -0.0625, _580);
    float _916 = fma(_768, -0.0625, _584);
    float _918 = fma(_898, _898, _900);
    float _920 = fma(_912, _912, _902);
    float _922 = fma(_914, _912, _904);
    float _924 = fma(_912, _916, _906);
    float _926 = fma(_914, _914, _908);
    float _928 = fma(_914, _916, _910);
    float _930 = fma(_764, -0.0625, _614);
    float _932 = fma(_766, -0.0625, _612);
    float _934 = fma(_768, -0.0625, _616);
    float _936 = fma(_916, _916, _918);
    float _938 = fma(_930, _930, _920);
    float _940 = fma(_932, _930, _922);
    float _942 = fma(_930, _934, _924);
    float _944 = fma(_932, _932, _926);
    float _946 = fma(_932, _934, _928);
    float _948 = fma(_764, -0.0625, _624);
    float _950 = fma(_766, -0.0625, _622);
    float _952 = fma(_768, -0.0625, _626);
    float _954 = fma(_934, _934, _936);
    float _956 = fma(_948, _948, _938);
    float _958 = fma(_950, _948, _940);
    float _960 = fma(_948, _952, _942);
    float _962 = fma(_950, _950, _944);
    float _964 = fma(_950, _952, _946);
    float _966 = fma(_764, -0.0625, _634);
    float _968 = fma(_766, -0.0625, _632);
    float _970 = fma(_768, -0.0625, _636);
    float _972 = fma(_952, _952, _954);
    float _974 = fma(_966, _966, _956);
    float _976 = fma(_968, _966, _958);
    float _978 = fma(_966, _970, _960);
    float _980 = fma(_968, _968, _962);
    float _982 = fma(_968, _970, _964);
    float _984 = fma(_764, -0.0625, _644);
    float _986 = fma(_766, -0.0625, _642);
    float _988 = fma(_768, -0.0625, _646);
    float _990 = fma(_970, _970, _972);
    float _992 = fma(_984, _984, _974);
    float _994 = fma(_986, _984, _976);
    float _996 = fma(_984, _988, _978);
    float _998 = fma(_986, _986, _980);
    float _1000 = fma(_986, _988, _982);
    float _1002 = fma(_764, -0.0625, _654);
    float _1004 = fma(_766, -0.0625, _652);
    float _1006 = fma(_768, -0.0625, _656);
    float _1008 = fma(_988, _988, _990);
    float _1010 = fma(_1002, _1002, _992);
    float _1012 = fma(_1004, _1002, _994);
    float _1014 = fma(_1002, _1006, _996);
    float _1016 = fma(_1004, _1004, _998);
    float _1018 = fma(_1004, _1006, _1000);
    float _1020 = fma(_764, -0.0625, _664);
    float _1022 = fma(_766, -0.0625, _662);
    float _1024 = fma(_768, -0.0625, _666);
    float _1026 = fma(_766, -0.0625, _672);
    float _1028 = fma(_1020, _1020, _1010);
    float _1030 = fma(_1022, _1020, _1012);
    float _1032 = fma(_1020, _1024, _1014);
    float _1034 = fma(_764, -0.0625, _674);
    float _1036 = fma(_1006, _1006, _1008);
    float _1038 = fma(_768, -0.0625, _676);
    float _1040 = fma(_1022, _1022, _1016);
    float _1042 = fma(_1034, _1034, _1028);
    float _1044 = fma(_1026, _1034, _1030);
    float _1046 = fma(_1022, _1024, _1018);
    float _1048 = fma(_1034, _1038, _1032);
    float _1050 = fma(_1026, _1026, _1040);
    float _1052 = _1042 + _1044;
    float _1054 = fma(_1024, _1024, _1036);
    float _1056 = fma(_1026, _1038, _1046);
    float _1058 = _1050 + _1044;
    float _1060 = _1048 + _1052;
    float _1062 = fma(_1038, _1038, _1054);
    float _1064 = _1048 + _1056;
    float _1066 = _1056 + _1058;
    float _1068 = _1060 * _1060;
    float _1070 = _1062 + _1064;
    float _1072 = fma(_1066, _1066, _1068);
    float _1074 = fma(_1070, _1070, _1072);
    float _1076 = rsqrt(_1074);
    float _1078 = _1060 * _1076;
    float _1080 = _1066 * _1076;
    float _1082 = _1070 * _1076;
    float _1084 = _1042 * _1078;
    float _1086 = _1044 * _1078;
    float _1088 = fma(_1044, _1080, _1084);
    float _1090 = _1048 * _1078;
    float _1092 = fma(_1050, _1080, _1086);
    float _1094 = fma(_1048, _1082, _1088);
    float _1096 = fma(_1056, _1080, _1090);
    float _1098 = fma(_1056, _1082, _1092);
    float _1100 = _1094 * _1094;
    float _1102 = fma(_1062, _1082, _1096);
    float _1104 = fma(_1098, _1098, _1100);
    float _1106 = fma(_1102, _1102, _1104);
    float _1108 = rsqrt(_1106);
    float _1110 = _1094 * _1108;
    float _1112 = _1098 * _1108;
    float _1114 = _1102 * _1108;
    float _1116 = _1042 * _1110;
    float _1118 = _1044 * _1110;
    float _1120 = _1048 * _1110;
    float _1122 = fma(_1044, _1112, _1116);
    float _1124 = fma(_1050, _1112, _1118);
    float _1126 = fma(_1056, _1112, _1120);
    float _1128 = fma(_1048, _1114, _1122);
    float _1130 = fma(_1056, _1114, _1124);
    float _1132 = fma(_1062, _1114, _1126);
    float _1134 = _1128 * _1128;
    float _1136 = fma(_1130, _1130, _1134);
    float _1138 = fma(_1132, _1132, _1136);
    float _1140 = rsqrt(_1138);
    float _1142 = _1128 * _1140;
    float _1144 = _1130 * _1140;
    float _1146 = _1132 * _1140;
    float _1148 = _1042 * _1142;
    float _1150 = _1044 * _1142;
    float _1152 = _1048 * _1142;
    float _1154 = fma(_1044, _1144, _1148);
    float _1156 = fma(_1050, _1144, _1150);
    float _1158 = fma(_1056, _1144, _1152);
    float _1160 = fma(_1048, _1146, _1154);
    float _1162 = fma(_1056, _1146, _1156);
    float _1164 = fma(_1062, _1146, _1158);
    float _1166 = _1160 * _1160;
    float _1168 = fma(_1162, _1162, _1166);
    float _1170 = fma(_1164, _1164, _1168);
    float _1172 = rsqrt(_1170);
    float _1174 = _1160 * _1172;
    float _1176 = _1162 * _1172;
    float _1178 = _1164 * _1172;
    float _1180 = _1042 * _1174;
    float _1182 = _1044 * _1174;
    float _1184 = _1048 * _1174;
    float _1186 = fma(_1044, _1176, _1180);
    float _1188 = fma(_1050, _1176, _1182);
    float _1190 = fma(_1056, _1176, _1184);
    float _1192 = fma(_1048, _1178, _1186);
    float _1194 = fma(_1056, _1178, _1188);
    float _1196 = fma(_1062, _1178, _1190);
    float _1198 = _1192 * _1192;
    float _1200 = fma(_1194, _1194, _1198);
    float _1202 = fma(_1196, _1196, _1200);
    float _1204 = rsqrt(_1202);
    float _1206 = _1192 * _1204;
    float _1208 = _1194 * _1204;
    float _1210 = _1196 * _1204;
    float _1212 = _1042 * _1206;
    float _1214 = _1044 * _1206;
    float _1216 = _1048 * _1206;
    float _1218 = fma(_1044, _1208, _1212);
    float _1220 = fma(_1050, _1208, _1214);
    float _1222 = fma(_1056, _1208, _1216);
    float _1224 = fma(_1048, _1210, _1218);
    float _1226 = fma(_1056, _1210, _1220);
    float _1228 = fma(_1062, _1210, _1222);
    float _1230 = _1224 * _1224;
    float _1232 = fma(_1226, _1226, _1230);
    float _1234 = fma(_1228, _1228, _1232);
    float _1236 = rsqrt(_1234);
    float _1238 = _1224 * _1236;
    float _1240 = _1226 * _1236;
    float _1242 = _1228 * _1236;
    float _1244 = _1042 * _1238;
    float _1246 = _1044 * _1238;
    float _1248 = _1048 * _1238;
    float _1250 = fma(_1044, _1240, _1244);
    float _1252 = fma(_1050, _1240, _1246);
    float _1254 = fma(_1056, _1240, _1248);
    float _1256 = fma(_1048, _1242, _1250);
    float _1258 = fma(_1056, _1242, _1252);
    float _1260 = fma(_1062, _1242, _1254);
    float _1262 = _1256 * _1256;
    float _1264 = fma(_1258, _1258, _1262);
    float _1266 = fma(_1260, _1260, _1264);
    float _1268 = rsqrt(_1266);
    float _1270 = _1256 * _1268;
    float _1272 = _1258 * _1268;
    float _1274 = _1260 * _1268;
    float _1276 = _1042 * _1270;
    float _1278 = _1044 * _1270;
    float _1280 = fma(_1044, _1272, _1276);
    float _1282 = _1048 * _1270;
    float _1284 = fma(_1050, _1272, _1278);
    float _1286 = fma(_1048, _1274, _1280);
    float _1288 = fma(_1056, _1272, _1282);
    float _1290 = fma(_1056, _1274, _1284);
    float _1292 = _1286 * _1286;
    float _1294 = fma(_1062, _1274, _1288);
    float _1296 = fma(_1290, _1290, _1292);
    float _1298 = fma(_1294, _1294, _1296);
    float _1300 = rsqrt(_1298);
    float _1302 = _1286 * _1300;
    float _1304 = _1290 * _1300;
    float _1306 = _1294 * _1300;
    float _1308 = _446 * _1302;
    float _1310 = _456 * _1302;
    float _1312 = _466 * _1302;
    float _1314 = fma(_444, _1304, _1308);
    float _1316 = fma(_454, _1304, _1310);
    float _1318 = fma(_464, _1304, _1312);
    float _1320 = fma(_448, _1306, _1314);
    float _1322 = fma(_458, _1306, _1316);
    float _1324 = fma(_468, _1306, _1318);
    bool _1328 = _1320 >= _1322;
    bool _1330 = isnan(_1320);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(_1322);
    bool _1336 = _1332 || _1334;
    float _1338 = _588;
    float _1340 = _1318;
    float _1342 = _1050;
    float _1344 = _1314;
    float _1346 = _1300;
    float _1348 = _1272;
    float _1350 = _1260;
    float _1352 = _1270;
    float _1354 = _1320;
    float _1356 = _1244;
    float _1358 = _1324;
    float _1360 = _1324;
    float _1362 = _1302;
    float _1364 = _1304;
    spvUnsafeArray<uint, 4> _24;
    if (!_1336)
    {
        _1338 = _454;
    }
    float _1366 = _1338;
    float _1368 = _1366;
    float _1370 = _1366;
    if (!_1336)
    {
        _1340 = _456;
    }
    float _1372 = _1340;
    float _1374 = _1372;
    float _1376 = _1372;
    if (!_1336)
    {
        _1342 = _458;
    }
    float _1378 = _1342;
    float _1380 = _1378;
    float _1382 = _1378;
    if (!_1336)
    {
        _1344 = _1320;
    }
    float _1384 = _1344;
    float _1386 = _1384;
    float _1388 = _1384;
    if (!_1336)
    {
        _1346 = _1322;
    }
    float _1390 = _1346;
    float _1392 = _1390;
    float _1394 = _1390;
    if (!_1336)
    {
        _1348 = _444;
    }
    float _1396 = _1348;
    float _1398 = _1396;
    float _1400 = _1396;
    if (!_1336)
    {
        _1350 = _446;
    }
    float _1402 = _1350;
    float _1404 = _1402;
    float _1406 = _1402;
    if (!_1336)
    {
        _1352 = _448;
    }
    float _1408 = _1352;
    bool _1410 = !_1336;
    float _1412 = _1408;
    float _1414 = _1408;
    if (!_1410)
    {
        bool _1416 = _1320 > _1322;
        if (!_1416)
        {
            _1386 = _1320;
        }
        float _1418 = _1386;
        float _1420 = _1418;
        if (!_1416)
        {
            _1392 = _1320;
        }
        float _1422 = _1392;
        float _1424 = _1422;
        if (!_1416)
        {
            _1398 = _444;
        }
        float _1426 = _1398;
        float _1428 = _1426;
        if (!_1416)
        {
            _1404 = _446;
        }
        float _1430 = _1404;
        float _1432 = _1430;
        if (!_1416)
        {
            _1412 = _448;
        }
        float _1434 = _1412;
        float _1436 = _1434;
        if (!_1416)
        {
            _1368 = _444;
        }
        float _1438 = _1368;
        float _1440 = _1438;
        if (!_1416)
        {
            _1374 = _446;
        }
        float _1442 = _1374;
        float _1444 = _1442;
        if (!_1416)
        {
            _1380 = _448;
        }
        float _1446 = _1380;
        _1382 = _1446;
        if (_1416)
        {
            _1420 = _1322;
        }
        float _1448 = _1420;
        _1388 = _1448;
        if (_1416)
        {
            _1424 = _1320;
        }
        float _1450 = _1424;
        _1394 = _1450;
        if (_1416)
        {
            _1428 = _454;
        }
        float _1452 = _1428;
        _1400 = _1452;
        if (_1416)
        {
            _1432 = _456;
        }
        float _1454 = _1432;
        _1406 = _1454;
        if (_1416)
        {
            _1436 = _458;
        }
        float _1456 = _1436;
        _1414 = _1456;
        if (_1416)
        {
            _1440 = _444;
        }
        float _1458 = _1440;
        _1370 = _1458;
        if (_1416)
        {
            _1444 = _446;
        }
        float _1460 = _1444;
        _1376 = _1460;
        if (_1416)
        {
            _1382 = _448;
        }
    }
    float _1462 = _1394;
    float _1464 = _1388;
    float _1466 = _1370;
    float _1468 = _1376;
    float _1470 = _1382;
    float _1472 = _1400;
    float _1474 = _1406;
    float _1476 = _1414;
    bool _1478 = _1462 >= _1324;
    bool _1480 = isnan(_1462);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(_1324);
    bool _1486 = _1482 || _1484;
    float _1488 = _500 * _1302;
    float _1490 = fma(_498, _1304, _1488);
    float _1492 = fma(_502, _1306, _1490);
    float _1494 = _1490;
    float _1496 = _1464;
    float _1498 = _1472;
    float _1500 = _1474;
    float _1502 = _1464;
    float _1504 = _1472;
    float _1506 = _1474;
    float _1508 = _1476;
    float _1510 = _1462;
    float _1512 = _1470;
    float _1514 = _1492;
    float _1516 = _1492;
    if (!_1486)
    {
        _1354 = _464;
    }
    float _1518 = _1354;
    float _1520 = _1518;
    float _1522 = _1518;
    if (!_1486)
    {
        _1494 = _466;
    }
    float _1524 = _1494;
    float _1526 = _1524;
    float _1528 = _1524;
    if (!_1486)
    {
        _1356 = _468;
    }
    float _1530 = _1356;
    bool _1532 = !_1486;
    float _1534 = _1530;
    float _1536 = _1530;
    if (!_1532)
    {
        bool _1538 = _1464 > _1324;
        if (_1538)
        {
            _1496 = _1324;
        }
        float _1540 = _1496;
        _1502 = _1540;
        if (!_1538)
        {
            _1520 = _1466;
        }
        float _1542 = _1520;
        float _1544 = _1542;
        if (!_1538)
        {
            _1526 = _1468;
        }
        float _1546 = _1526;
        float _1548 = _1546;
        if (!_1538)
        {
            _1534 = _1470;
        }
        float _1550 = _1534;
        float _1552 = _1550;
        if (!_1538)
        {
            _1358 = _1462;
        }
        float _1554 = _1358;
        float _1556 = _1554;
        if (_1538)
        {
            _1544 = _1466;
        }
        float _1558 = _1544;
        _1522 = _1558;
        if (_1538)
        {
            _1548 = _1468;
        }
        float _1560 = _1548;
        _1528 = _1560;
        if (_1538)
        {
            _1552 = _1470;
        }
        float _1562 = _1552;
        _1536 = _1562;
        if (_1538)
        {
            _1556 = _1462;
        }
        float _1564 = _1556;
        _1360 = _1564;
        if (_1538)
        {
            _1498 = _464;
        }
        float _1566 = _1498;
        _1504 = _1566;
        if (_1538)
        {
            _1500 = _466;
        }
        float _1568 = _1500;
        _1506 = _1568;
        if (_1538)
        {
            _1508 = _468;
        }
    }
    float _1570 = _1360;
    float _1572 = _1502;
    float _1574 = _1522;
    float _1576 = _1528;
    float _1578 = _1536;
    float _1580 = _1504;
    float _1582 = _1506;
    float _1584 = _1508;
    bool _1586 = _1570 >= _1492;
    bool _1588 = isnan(_1570);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan(_1492);
    bool _1594 = _1590 || _1592;
    float _1596 = _512 * _1302;
    float _1598 = fma(_510, _1304, _1596);
    float _1600 = fma(_514, _1306, _1598);
    float _1602 = _1598;
    float _1604 = _1572;
    float _1606 = _1580;
    float _1608 = _1582;
    float _1610 = _1572;
    float _1612 = _1580;
    float _1614 = _1582;
    float _1616 = _1584;
    float _1618 = _1574;
    float _1620 = _1578;
    float _1622 = _1600;
    float _1624 = _1600;
    if (!_1594)
    {
        _1510 = _498;
    }
    float _1626 = _1510;
    float _1628 = _1626;
    float _1630 = _1626;
    if (!_1594)
    {
        _1512 = _500;
    }
    float _1632 = _1512;
    float _1634 = _1632;
    float _1636 = _1632;
    if (!_1594)
    {
        _1602 = _502;
    }
    float _1638 = _1602;
    bool _1640 = !_1594;
    float _1642 = _1638;
    float _1644 = _1638;
    if (!_1640)
    {
        bool _1646 = _1572 > _1492;
        if (_1646)
        {
            _1604 = _1492;
        }
        float _1648 = _1604;
        _1610 = _1648;
        if (!_1646)
        {
            _1628 = _1574;
        }
        float _1650 = _1628;
        float _1652 = _1650;
        if (!_1646)
        {
            _1634 = _1576;
        }
        float _1654 = _1634;
        float _1656 = _1654;
        if (!_1646)
        {
            _1642 = _1578;
        }
        float _1658 = _1642;
        float _1660 = _1658;
        if (!_1646)
        {
            _1514 = _1570;
        }
        float _1662 = _1514;
        float _1664 = _1662;
        if (_1646)
        {
            _1652 = _1574;
        }
        float _1666 = _1652;
        _1630 = _1666;
        if (_1646)
        {
            _1656 = _1576;
        }
        float _1668 = _1656;
        _1636 = _1668;
        if (_1646)
        {
            _1660 = _1578;
        }
        float _1670 = _1660;
        _1644 = _1670;
        if (_1646)
        {
            _1664 = _1570;
        }
        float _1672 = _1664;
        _1516 = _1672;
        if (_1646)
        {
            _1606 = _498;
        }
        float _1674 = _1606;
        _1612 = _1674;
        if (_1646)
        {
            _1608 = _500;
        }
        float _1676 = _1608;
        _1614 = _1676;
        if (_1646)
        {
            _1616 = _502;
        }
    }
    float _1678 = _1516;
    float _1680 = _1610;
    float _1682 = _1630;
    float _1684 = _1636;
    float _1686 = _1644;
    float _1688 = _1612;
    float _1690 = _1614;
    float _1692 = _1616;
    bool _1694 = _1678 >= _1600;
    bool _1696 = isnan(_1678);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan(_1600);
    bool _1702 = _1698 || _1700;
    float _1704 = _522 * _1302;
    float _1706 = fma(_520, _1304, _1704);
    float _1708 = fma(_524, _1306, _1706);
    float _1710 = _1706;
    float _1712 = _1680;
    float _1714 = _1688;
    float _1716 = _1690;
    float _1718 = _1680;
    float _1720 = _1688;
    float _1722 = _1690;
    float _1724 = _1692;
    float _1726 = _1682;
    float _1728 = _1684;
    float _1730 = _1708;
    float _1732 = _1708;
    float _1734 = _1678;
    if (!_1702)
    {
        _1618 = _510;
    }
    float _1736 = _1618;
    float _1738 = _1736;
    float _1740 = _1736;
    if (!_1702)
    {
        _1710 = _512;
    }
    float _1742 = _1710;
    float _1744 = _1742;
    float _1746 = _1742;
    if (!_1702)
    {
        _1620 = _514;
    }
    float _1748 = _1620;
    bool _1750 = !_1702;
    float _1752 = _1748;
    float _1754 = _1748;
    if (!_1750)
    {
        bool _1756 = _1680 > _1600;
        if (_1756)
        {
            _1712 = _1600;
        }
        float _1758 = _1712;
        _1718 = _1758;
        if (!_1756)
        {
            _1738 = _1682;
        }
        float _1760 = _1738;
        float _1762 = _1760;
        if (!_1756)
        {
            _1744 = _1684;
        }
        float _1764 = _1744;
        float _1766 = _1764;
        if (!_1756)
        {
            _1752 = _1686;
        }
        float _1768 = _1752;
        float _1770 = _1768;
        if (!_1756)
        {
            _1622 = _1678;
        }
        float _1772 = _1622;
        float _1774 = _1772;
        if (_1756)
        {
            _1762 = _1682;
        }
        float _1776 = _1762;
        _1740 = _1776;
        if (_1756)
        {
            _1766 = _1684;
        }
        float _1778 = _1766;
        _1746 = _1778;
        if (_1756)
        {
            _1770 = _1686;
        }
        float _1780 = _1770;
        _1754 = _1780;
        if (_1756)
        {
            _1774 = _1678;
        }
        float _1782 = _1774;
        _1624 = _1782;
        if (_1756)
        {
            _1714 = _510;
        }
        float _1784 = _1714;
        _1720 = _1784;
        if (_1756)
        {
            _1716 = _512;
        }
        float _1786 = _1716;
        _1722 = _1786;
        if (_1756)
        {
            _1724 = _514;
        }
    }
    float _1788 = _1624;
    float _1790 = _1718;
    float _1792 = _1740;
    float _1794 = _1746;
    float _1796 = _1754;
    float _1798 = _1720;
    float _1800 = _1722;
    float _1802 = _1724;
    bool _1804 = _1788 >= _1708;
    bool _1806 = isnan(_1788);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan(_1708);
    bool _1812 = _1808 || _1810;
    float _1814 = _532 * _1302;
    float _1816 = fma(_530, _1304, _1814);
    float _1818 = fma(_534, _1306, _1816);
    float _1820 = _1816;
    float _1822 = _1790;
    float _1824 = _1798;
    float _1826 = _1800;
    float _1828 = _1790;
    float _1830 = _1798;
    float _1832 = _1800;
    float _1834 = _1802;
    float _1836 = _1796;
    float _1838 = _1788;
    float _1840 = _1818;
    float _1842 = _1818;
    if (!_1812)
    {
        _1726 = _520;
    }
    float _1844 = _1726;
    float _1846 = _1844;
    float _1848 = _1844;
    if (!_1812)
    {
        _1728 = _522;
    }
    float _1850 = _1728;
    float _1852 = _1850;
    float _1854 = _1850;
    if (!_1812)
    {
        _1820 = _524;
    }
    float _1856 = _1820;
    bool _1858 = !_1812;
    float _1860 = _1856;
    float _1862 = _1856;
    if (!_1858)
    {
        bool _1864 = _1790 > _1708;
        if (_1864)
        {
            _1822 = _1708;
        }
        float _1866 = _1822;
        _1828 = _1866;
        if (!_1864)
        {
            _1846 = _1792;
        }
        float _1868 = _1846;
        float _1870 = _1868;
        if (!_1864)
        {
            _1852 = _1794;
        }
        float _1872 = _1852;
        float _1874 = _1872;
        if (!_1864)
        {
            _1860 = _1796;
        }
        float _1876 = _1860;
        float _1878 = _1876;
        if (!_1864)
        {
            _1730 = _1788;
        }
        float _1880 = _1730;
        float _1882 = _1880;
        if (_1864)
        {
            _1870 = _1792;
        }
        float _1884 = _1870;
        _1848 = _1884;
        if (_1864)
        {
            _1874 = _1794;
        }
        float _1886 = _1874;
        _1854 = _1886;
        if (_1864)
        {
            _1878 = _1796;
        }
        float _1888 = _1878;
        _1862 = _1888;
        if (_1864)
        {
            _1882 = _1788;
        }
        float _1890 = _1882;
        _1732 = _1890;
        if (_1864)
        {
            _1824 = _520;
        }
        float _1892 = _1824;
        _1830 = _1892;
        if (_1864)
        {
            _1826 = _522;
        }
        float _1894 = _1826;
        _1832 = _1894;
        if (_1864)
        {
            _1834 = _524;
        }
    }
    float _1896 = _1732;
    float _1898 = _1828;
    float _1900 = _1848;
    float _1902 = _1854;
    float _1904 = _1862;
    float _1906 = _1830;
    float _1908 = _1832;
    float _1910 = _1834;
    bool _1912 = _1896 >= _1818;
    bool _1914 = isnan(_1896);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan(_1818);
    bool _1920 = _1916 || _1918;
    float _1922 = _572 * _1302;
    float _1924 = fma(_570, _1304, _1922);
    float _1926 = fma(_574, _1306, _1924);
    float _1928 = _1898;
    float _1930 = _1906;
    float _1932 = _1908;
    float _1934 = _1898;
    float _1936 = _1906;
    float _1938 = _1908;
    float _1940 = _1910;
    float _1942 = _1900;
    float _1944 = _1902;
    float _1946 = _1926;
    float _1948 = _1926;
    if (!_1920)
    {
        _1836 = _530;
    }
    float _1950 = _1836;
    float _1952 = _1950;
    float _1954 = _1950;
    if (!_1920)
    {
        _1734 = _532;
    }
    float _1956 = _1734;
    float _1958 = _1956;
    float _1960 = _1956;
    if (!_1920)
    {
        _1838 = _534;
    }
    float _1962 = _1838;
    bool _1964 = !_1920;
    float _1966 = _1962;
    float _1968 = _1962;
    if (!_1964)
    {
        bool _1970 = _1898 > _1818;
        if (_1970)
        {
            _1928 = _1818;
        }
        float _1972 = _1928;
        _1934 = _1972;
        if (!_1970)
        {
            _1952 = _1900;
        }
        float _1974 = _1952;
        float _1976 = _1974;
        if (!_1970)
        {
            _1958 = _1902;
        }
        float _1978 = _1958;
        float _1980 = _1978;
        if (!_1970)
        {
            _1966 = _1904;
        }
        float _1982 = _1966;
        float _1984 = _1982;
        if (!_1970)
        {
            _1840 = _1896;
        }
        float _1986 = _1840;
        float _1988 = _1986;
        if (_1970)
        {
            _1976 = _1900;
        }
        float _1990 = _1976;
        _1954 = _1990;
        if (_1970)
        {
            _1980 = _1902;
        }
        float _1992 = _1980;
        _1960 = _1992;
        if (_1970)
        {
            _1984 = _1904;
        }
        float _1994 = _1984;
        _1968 = _1994;
        if (_1970)
        {
            _1988 = _1896;
        }
        float _1996 = _1988;
        _1842 = _1996;
        if (_1970)
        {
            _1930 = _530;
        }
        float _1998 = _1930;
        _1936 = _1998;
        if (_1970)
        {
            _1932 = _532;
        }
        float _2000 = _1932;
        _1938 = _2000;
        if (_1970)
        {
            _1940 = _534;
        }
    }
    float _2002 = _1842;
    float _2004 = _1934;
    float _2006 = _1954;
    float _2008 = _1960;
    float _2010 = _1968;
    float _2012 = _1936;
    float _2014 = _1938;
    float _2016 = _1940;
    bool _2018 = _2002 >= _1926;
    bool _2020 = isnan(_2002);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(_1926);
    bool _2026 = _2022 || _2024;
    float _2028 = _582 * _1302;
    float _2030 = fma(_580, _1304, _2028);
    float _2032 = fma(_584, _1306, _2030);
    float _2034 = _2030;
    float _2036 = _2004;
    float _2038 = _2012;
    float _2040 = _2014;
    float _2042 = _2004;
    float _2044 = _2012;
    float _2046 = _2014;
    float _2048 = _2016;
    float _2050 = _2010;
    float _2052 = _2006;
    float _2054 = _2032;
    float _2056 = _2032;
    if (!_2026)
    {
        _1942 = _570;
    }
    float _2058 = _1942;
    float _2060 = _2058;
    float _2062 = _2058;
    if (!_2026)
    {
        _1944 = _572;
    }
    float _2064 = _1944;
    float _2066 = _2064;
    float _2068 = _2064;
    if (!_2026)
    {
        _2034 = _574;
    }
    float _2070 = _2034;
    bool _2072 = !_2026;
    float _2074 = _2070;
    float _2076 = _2070;
    if (!_2072)
    {
        bool _2078 = _2004 > _1926;
        if (_2078)
        {
            _2036 = _1926;
        }
        float _2080 = _2036;
        _2042 = _2080;
        if (!_2078)
        {
            _2060 = _2006;
        }
        float _2082 = _2060;
        float _2084 = _2082;
        if (!_2078)
        {
            _2066 = _2008;
        }
        float _2086 = _2066;
        float _2088 = _2086;
        if (!_2078)
        {
            _2074 = _2010;
        }
        float _2090 = _2074;
        float _2092 = _2090;
        if (!_2078)
        {
            _1946 = _2002;
        }
        float _2094 = _1946;
        float _2096 = _2094;
        if (_2078)
        {
            _2084 = _2006;
        }
        float _2098 = _2084;
        _2062 = _2098;
        if (_2078)
        {
            _2088 = _2008;
        }
        float _2100 = _2088;
        _2068 = _2100;
        if (_2078)
        {
            _2092 = _2010;
        }
        float _2102 = _2092;
        _2076 = _2102;
        if (_2078)
        {
            _2096 = _2002;
        }
        float _2104 = _2096;
        _1948 = _2104;
        if (_2078)
        {
            _2038 = _570;
        }
        float _2106 = _2038;
        _2044 = _2106;
        if (_2078)
        {
            _2040 = _572;
        }
        float _2108 = _2040;
        _2046 = _2108;
        if (_2078)
        {
            _2048 = _574;
        }
    }
    float _2110 = _1948;
    float _2112 = _2042;
    float _2114 = _2062;
    float _2116 = _2068;
    float _2118 = _2076;
    float _2120 = _2044;
    float _2122 = _2046;
    float _2124 = _2048;
    bool _2126 = _2110 >= _2032;
    bool _2128 = isnan(_2110);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan(_2032);
    bool _2134 = _2130 || _2132;
    float _2136 = _614 * _1302;
    float _2138 = fma(_612, _1304, _2136);
    float _2140 = fma(_616, _1306, _2138);
    float _2142 = _2138;
    float _2144 = _2112;
    float _2146 = _2120;
    float _2148 = _2122;
    float _2150 = _2112;
    float _2152 = _2120;
    float _2154 = _2122;
    float _2156 = _2124;
    float _2158 = _2116;
    float _2160 = _2114;
    float _2162 = _2140;
    float _2164 = _2140;
    if (!_2134)
    {
        _2050 = _580;
    }
    float _2166 = _2050;
    float _2168 = _2166;
    float _2170 = _2166;
    if (!_2134)
    {
        _2142 = _582;
    }
    float _2172 = _2142;
    float _2174 = _2172;
    float _2176 = _2172;
    if (!_2134)
    {
        _2052 = _584;
    }
    float _2178 = _2052;
    bool _2180 = !_2134;
    float _2182 = _2178;
    float _2184 = _2178;
    if (!_2180)
    {
        bool _2186 = _2112 > _2032;
        if (_2186)
        {
            _2144 = _2032;
        }
        float _2188 = _2144;
        _2150 = _2188;
        if (!_2186)
        {
            _2168 = _2114;
        }
        float _2190 = _2168;
        float _2192 = _2190;
        if (!_2186)
        {
            _2174 = _2116;
        }
        float _2194 = _2174;
        float _2196 = _2194;
        if (!_2186)
        {
            _2182 = _2118;
        }
        float _2198 = _2182;
        float _2200 = _2198;
        if (!_2186)
        {
            _2054 = _2110;
        }
        float _2202 = _2054;
        float _2204 = _2202;
        if (_2186)
        {
            _2192 = _2114;
        }
        float _2206 = _2192;
        _2170 = _2206;
        if (_2186)
        {
            _2196 = _2116;
        }
        float _2208 = _2196;
        _2176 = _2208;
        if (_2186)
        {
            _2200 = _2118;
        }
        float _2210 = _2200;
        _2184 = _2210;
        if (_2186)
        {
            _2204 = _2110;
        }
        float _2212 = _2204;
        _2056 = _2212;
        if (_2186)
        {
            _2146 = _580;
        }
        float _2214 = _2146;
        _2152 = _2214;
        if (_2186)
        {
            _2148 = _582;
        }
        float _2216 = _2148;
        _2154 = _2216;
        if (_2186)
        {
            _2156 = _584;
        }
    }
    float _2218 = _2056;
    float _2220 = _2150;
    float _2222 = _2170;
    float _2224 = _2176;
    float _2226 = _2184;
    float _2228 = _2152;
    float _2230 = _2154;
    float _2232 = _2156;
    bool _2234 = _2218 >= _2140;
    bool _2236 = isnan(_2218);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan(_2140);
    bool _2242 = _2238 || _2240;
    float _2244 = _624 * _1302;
    float _2246 = fma(_622, _1304, _2244);
    float _2248 = fma(_626, _1306, _2246);
    float _2250 = _2246;
    float _2252 = _2220;
    float _2254 = _2228;
    float _2256 = _2230;
    float _2258 = _2220;
    float _2260 = _2228;
    float _2262 = _2230;
    float _2264 = _2232;
    float _2266 = _2226;
    float _2268 = _2218;
    float _2270 = _2248;
    float _2272 = _2248;
    if (!_2242)
    {
        _2250 = _612;
    }
    float _2274 = _2250;
    float _2276 = _2274;
    float _2278 = _2274;
    if (!_2242)
    {
        _2158 = _614;
    }
    float _2280 = _2158;
    float _2282 = _2280;
    float _2284 = _2280;
    if (!_2242)
    {
        _2160 = _616;
    }
    float _2286 = _2160;
    bool _2288 = !_2242;
    float _2290 = _2286;
    float _2292 = _2286;
    if (!_2288)
    {
        bool _2294 = _2220 > _2140;
        if (_2294)
        {
            _2252 = _2140;
        }
        float _2296 = _2252;
        _2258 = _2296;
        if (!_2294)
        {
            _2276 = _2222;
        }
        float _2298 = _2276;
        float _2300 = _2298;
        if (!_2294)
        {
            _2282 = _2224;
        }
        float _2302 = _2282;
        float _2304 = _2302;
        if (!_2294)
        {
            _2290 = _2226;
        }
        float _2306 = _2290;
        float _2308 = _2306;
        if (!_2294)
        {
            _2162 = _2218;
        }
        float _2310 = _2162;
        float _2312 = _2310;
        if (_2294)
        {
            _2300 = _2222;
        }
        float _2314 = _2300;
        _2278 = _2314;
        if (_2294)
        {
            _2304 = _2224;
        }
        float _2316 = _2304;
        _2284 = _2316;
        if (_2294)
        {
            _2308 = _2226;
        }
        float _2318 = _2308;
        _2292 = _2318;
        if (_2294)
        {
            _2312 = _2218;
        }
        float _2320 = _2312;
        _2164 = _2320;
        if (_2294)
        {
            _2254 = _612;
        }
        float _2322 = _2254;
        _2260 = _2322;
        if (_2294)
        {
            _2256 = _614;
        }
        float _2324 = _2256;
        _2262 = _2324;
        if (_2294)
        {
            _2264 = _616;
        }
    }
    float _2326 = _2164;
    float _2328 = _2258;
    float _2330 = _2278;
    float _2332 = _2284;
    float _2334 = _2292;
    float _2336 = _2260;
    float _2338 = _2262;
    float _2340 = _2264;
    bool _2342 = _2326 >= _2248;
    bool _2344 = isnan(_2326);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan(_2248);
    bool _2350 = _2346 || _2348;
    float _2352 = _634 * _1302;
    float _2354 = fma(_632, _1304, _2352);
    float _2356 = fma(_636, _1306, _2354);
    float _2358 = _2354;
    float _2360 = _2328;
    float _2362 = _2336;
    float _2364 = _2338;
    float _2366 = _2328;
    float _2368 = _2336;
    float _2370 = _2338;
    float _2372 = _2340;
    float _2374 = _2332;
    float _2376 = _2334;
    float _2378 = _2356;
    float _2380 = _2356;
    if (!_2350)
    {
        _2266 = _622;
    }
    float _2382 = _2266;
    float _2384 = _2382;
    float _2386 = _2382;
    if (!_2350)
    {
        _2358 = _624;
    }
    float _2388 = _2358;
    float _2390 = _2388;
    float _2392 = _2388;
    if (!_2350)
    {
        _2268 = _626;
    }
    float _2394 = _2268;
    bool _2396 = !_2350;
    float _2398 = _2394;
    float _2400 = _2394;
    if (!_2396)
    {
        bool _2402 = _2328 > _2248;
        if (_2402)
        {
            _2360 = _2248;
        }
        float _2404 = _2360;
        _2366 = _2404;
        if (!_2402)
        {
            _2384 = _2330;
        }
        float _2406 = _2384;
        float _2408 = _2406;
        if (!_2402)
        {
            _2390 = _2332;
        }
        float _2410 = _2390;
        float _2412 = _2410;
        if (!_2402)
        {
            _2398 = _2334;
        }
        float _2414 = _2398;
        float _2416 = _2414;
        if (!_2402)
        {
            _2270 = _2326;
        }
        float _2418 = _2270;
        float _2420 = _2418;
        if (_2402)
        {
            _2408 = _2330;
        }
        float _2422 = _2408;
        _2386 = _2422;
        if (_2402)
        {
            _2412 = _2332;
        }
        float _2424 = _2412;
        _2392 = _2424;
        if (_2402)
        {
            _2416 = _2334;
        }
        float _2426 = _2416;
        _2400 = _2426;
        if (_2402)
        {
            _2420 = _2326;
        }
        float _2428 = _2420;
        _2272 = _2428;
        if (_2402)
        {
            _2362 = _622;
        }
        float _2430 = _2362;
        _2368 = _2430;
        if (_2402)
        {
            _2364 = _624;
        }
        float _2432 = _2364;
        _2370 = _2432;
        if (_2402)
        {
            _2372 = _626;
        }
    }
    float _2434 = _2272;
    float _2436 = _2366;
    float _2438 = _2386;
    float _2440 = _2392;
    float _2442 = _2400;
    float _2444 = _2368;
    float _2446 = _2370;
    float _2448 = _2372;
    bool _2450 = _2434 >= _2356;
    bool _2452 = isnan(_2434);
    bool _2454 = _2450 || _2452;
    bool _2456 = isnan(_2356);
    bool _2458 = _2454 || _2456;
    float _2460 = _644 * _1302;
    float _2462 = fma(_642, _1304, _2460);
    float _2464 = fma(_646, _1306, _2462);
    float _2466 = _2462;
    float _2468 = _2436;
    float _2470 = _2444;
    float _2472 = _2446;
    float _2474 = _2436;
    float _2476 = _2444;
    float _2478 = _2446;
    float _2480 = _2448;
    float _2482 = _2438;
    float _2484 = _2442;
    float _2486 = _2464;
    float _2488 = _2464;
    if (!_2458)
    {
        _2466 = _632;
    }
    float _2490 = _2466;
    float _2492 = _2490;
    float _2494 = _2490;
    if (!_2458)
    {
        _2374 = _634;
    }
    float _2496 = _2374;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2458)
    {
        _2376 = _636;
    }
    float _2502 = _2376;
    bool _2504 = !_2458;
    float _2506 = _2502;
    float _2508 = _2502;
    if (!_2504)
    {
        bool _2510 = _2436 > _2356;
        if (_2510)
        {
            _2468 = _2356;
        }
        float _2512 = _2468;
        _2474 = _2512;
        if (!_2510)
        {
            _2492 = _2438;
        }
        float _2514 = _2492;
        float _2516 = _2514;
        if (!_2510)
        {
            _2498 = _2440;
        }
        float _2518 = _2498;
        float _2520 = _2518;
        if (!_2510)
        {
            _2506 = _2442;
        }
        float _2522 = _2506;
        float _2524 = _2522;
        if (!_2510)
        {
            _2378 = _2434;
        }
        float _2526 = _2378;
        float _2528 = _2526;
        if (_2510)
        {
            _2516 = _2438;
        }
        float _2530 = _2516;
        _2494 = _2530;
        if (_2510)
        {
            _2520 = _2440;
        }
        float _2532 = _2520;
        _2500 = _2532;
        if (_2510)
        {
            _2524 = _2442;
        }
        float _2534 = _2524;
        _2508 = _2534;
        if (_2510)
        {
            _2528 = _2434;
        }
        float _2536 = _2528;
        _2380 = _2536;
        if (_2510)
        {
            _2470 = _632;
        }
        float _2538 = _2470;
        _2476 = _2538;
        if (_2510)
        {
            _2472 = _634;
        }
        float _2540 = _2472;
        _2478 = _2540;
        if (_2510)
        {
            _2480 = _636;
        }
    }
    float _2542 = _2380;
    float _2544 = _2474;
    float _2546 = _2494;
    float _2548 = _2500;
    float _2550 = _2508;
    float _2552 = _2476;
    float _2554 = _2478;
    float _2556 = _2480;
    bool _2558 = _2542 >= _2464;
    bool _2560 = isnan(_2542);
    bool _2562 = _2558 || _2560;
    bool _2564 = isnan(_2464);
    bool _2566 = _2562 || _2564;
    float _2568 = _654 * _1302;
    float _2570 = fma(_652, _1304, _2568);
    float _2572 = fma(_656, _1306, _2570);
    float _2574 = _2570;
    float _2576 = _2544;
    float _2578 = _2552;
    float _2580 = _2554;
    float _2582 = _2544;
    float _2584 = _2552;
    float _2586 = _2554;
    float _2588 = _2556;
    float _2590 = _2548;
    float _2592 = _2550;
    float _2594 = _2572;
    float _2596 = _2572;
    if (!_2566)
    {
        _2482 = _642;
    }
    float _2598 = _2482;
    float _2600 = _2598;
    float _2602 = _2598;
    if (!_2566)
    {
        _2574 = _644;
    }
    float _2604 = _2574;
    float _2606 = _2604;
    float _2608 = _2604;
    if (!_2566)
    {
        _2484 = _646;
    }
    float _2610 = _2484;
    bool _2612 = !_2566;
    float _2614 = _2610;
    float _2616 = _2610;
    if (!_2612)
    {
        bool _2618 = _2544 > _2464;
        if (_2618)
        {
            _2576 = _2464;
        }
        float _2620 = _2576;
        _2582 = _2620;
        if (!_2618)
        {
            _2600 = _2546;
        }
        float _2622 = _2600;
        float _2624 = _2622;
        if (!_2618)
        {
            _2606 = _2548;
        }
        float _2626 = _2606;
        float _2628 = _2626;
        if (!_2618)
        {
            _2614 = _2550;
        }
        float _2630 = _2614;
        float _2632 = _2630;
        if (!_2618)
        {
            _2486 = _2542;
        }
        float _2634 = _2486;
        float _2636 = _2634;
        if (_2618)
        {
            _2624 = _2546;
        }
        float _2638 = _2624;
        _2602 = _2638;
        if (_2618)
        {
            _2628 = _2548;
        }
        float _2640 = _2628;
        _2608 = _2640;
        if (_2618)
        {
            _2632 = _2550;
        }
        float _2642 = _2632;
        _2616 = _2642;
        if (_2618)
        {
            _2636 = _2542;
        }
        float _2644 = _2636;
        _2488 = _2644;
        if (_2618)
        {
            _2578 = _642;
        }
        float _2646 = _2578;
        _2584 = _2646;
        if (_2618)
        {
            _2580 = _644;
        }
        float _2648 = _2580;
        _2586 = _2648;
        if (_2618)
        {
            _2588 = _646;
        }
    }
    float _2650 = _2488;
    float _2652 = _2582;
    float _2654 = _2602;
    float _2656 = _2608;
    float _2658 = _2616;
    float _2660 = _2584;
    float _2662 = _2586;
    float _2664 = _2588;
    bool _2666 = _2650 >= _2572;
    bool _2668 = isnan(_2650);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan(_2572);
    bool _2674 = _2670 || _2672;
    float _2676 = _664 * _1302;
    float _2678 = fma(_662, _1304, _2676);
    float _2680 = fma(_666, _1306, _2678);
    float _2682 = _2678;
    float _2684 = _2652;
    float _2686 = _2660;
    float _2688 = _2662;
    float _2690 = _2660;
    float _2692 = _2662;
    float _2694 = _2652;
    float _2696 = _2664;
    float _2698 = _2658;
    float _2700 = _2654;
    float _2702 = _2680;
    float _2704 = _2680;
    if (!_2674)
    {
        _2682 = _652;
    }
    float _2706 = _2682;
    float _2708 = _2706;
    float _2710 = _2706;
    if (!_2674)
    {
        _2590 = _654;
    }
    float _2712 = _2590;
    float _2714 = _2712;
    float _2716 = _2712;
    if (!_2674)
    {
        _2592 = _656;
    }
    float _2718 = _2592;
    bool _2720 = !_2674;
    float _2722 = _2718;
    float _2724 = _2718;
    if (!_2720)
    {
        bool _2726 = _2652 > _2572;
        if (_2726)
        {
            _2684 = _2572;
        }
        float _2728 = _2684;
        _2694 = _2728;
        if (!_2726)
        {
            _2708 = _2654;
        }
        float _2730 = _2708;
        float _2732 = _2730;
        if (!_2726)
        {
            _2714 = _2656;
        }
        float _2734 = _2714;
        float _2736 = _2734;
        if (!_2726)
        {
            _2722 = _2658;
        }
        float _2738 = _2722;
        float _2740 = _2738;
        if (!_2726)
        {
            _2594 = _2650;
        }
        float _2742 = _2594;
        float _2744 = _2742;
        if (_2726)
        {
            _2732 = _2654;
        }
        float _2746 = _2732;
        _2710 = _2746;
        if (_2726)
        {
            _2736 = _2656;
        }
        float _2748 = _2736;
        _2716 = _2748;
        if (_2726)
        {
            _2740 = _2658;
        }
        float _2750 = _2740;
        _2724 = _2750;
        if (_2726)
        {
            _2744 = _2650;
        }
        float _2752 = _2744;
        _2596 = _2752;
        if (_2726)
        {
            _2686 = _652;
        }
        float _2754 = _2686;
        _2690 = _2754;
        if (_2726)
        {
            _2688 = _654;
        }
        float _2756 = _2688;
        _2692 = _2756;
        if (_2726)
        {
            _2696 = _656;
        }
    }
    float _2758 = _2596;
    float _2760 = _2690;
    float _2762 = _2692;
    float _2764 = _2694;
    float _2766 = _2710;
    float _2768 = _2716;
    float _2770 = _2724;
    float _2772 = _2696;
    bool _2774 = _2758 >= _2680;
    bool _2776 = isnan(_2758);
    bool _2778 = _2774 || _2776;
    bool _2780 = isnan(_2680);
    bool _2782 = _2778 || _2780;
    float _2784 = _674 * _1302;
    float _2786 = fma(_672, _1304, _2784);
    float _2788 = fma(_676, _1306, _2786);
    float _2790 = _2786;
    float _2792 = _2764;
    float _2794 = _2772;
    float _2796 = _2764;
    float _2798 = _2762;
    float _2800 = _2760;
    if (!_2782)
    {
        _1362 = _2760;
    }
    float _2802 = _1362;
    float _2804 = _2802;
    float _2806 = _2802;
    if (!_2782)
    {
        _2790 = _2762;
    }
    float _2808 = _2790;
    float _2810 = _2808;
    float _2812 = _2808;
    if (!_2782)
    {
        _1364 = _662;
    }
    float _2814 = _1364;
    float _2816 = _2814;
    float _2818 = _2814;
    if (!_2782)
    {
        _2698 = _664;
    }
    float _2820 = _2698;
    float _2822 = _2820;
    float _2824 = _2820;
    if (!_2782)
    {
        _2700 = _666;
    }
    float _2826 = _2700;
    bool _2828 = !_2782;
    float _2830 = _2826;
    float _2832 = _2826;
    if (!_2828)
    {
        bool _2834 = _2764 > _2680;
        if (_2834)
        {
            _2792 = _2680;
        }
        float _2836 = _2792;
        _2796 = _2836;
        if (!_2834)
        {
            _2816 = _2766;
        }
        float _2838 = _2816;
        float _2840 = _2838;
        if (!_2834)
        {
            _2822 = _2768;
        }
        float _2842 = _2822;
        float _2844 = _2842;
        if (!_2834)
        {
            _2830 = _2770;
        }
        float _2846 = _2830;
        float _2848 = _2846;
        if (!_2834)
        {
            _2702 = _2758;
        }
        float _2850 = _2702;
        float _2852 = _2850;
        if (!_2834)
        {
            _2804 = _2760;
        }
        float _2854 = _2804;
        float _2856 = _2854;
        if (!_2834)
        {
            _2810 = _2762;
        }
        float _2858 = _2810;
        float _2860 = _2858;
        if (_2834)
        {
            _2840 = _2766;
        }
        float _2862 = _2840;
        _2818 = _2862;
        if (_2834)
        {
            _2844 = _2768;
        }
        float _2864 = _2844;
        _2824 = _2864;
        if (_2834)
        {
            _2848 = _2770;
        }
        float _2866 = _2848;
        _2832 = _2866;
        if (_2834)
        {
            _2852 = _2758;
        }
        float _2868 = _2852;
        _2704 = _2868;
        if (_2834)
        {
            _2856 = _662;
        }
        float _2870 = _2856;
        _2806 = _2870;
        if (_2834)
        {
            _2860 = _664;
        }
        float _2872 = _2860;
        _2812 = _2872;
        if (_2834)
        {
            _2794 = _666;
        }
    }
    float _2874 = _2704;
    float _2876 = _2806;
    float _2878 = _2794;
    float _2880 = _2796;
    float _2882 = _2818;
    float _2884 = _2824;
    float _2886 = _2832;
    float _2888 = _2812;
    bool _2890 = _2874 >= _2788;
    bool _2892 = isnan(_2874);
    bool _2894 = _2890 || _2892;
    bool _2896 = isnan(_2788);
    bool _2898 = _2894 || _2896;
    float _2900 = _2888;
    float _2902 = _2888;
    if (!_2898)
    {
        _2798 = _2876;
    }
    float _2904 = _2798;
    float _2906 = _2904;
    float _2908 = _2904;
    if (!_2898)
    {
        _2800 = _2878;
    }
    float _2910 = _2800;
    float _2912 = 0.0;
    float _2914 = _2910;
    float _2916 = _2910;
    if (!_2898)
    {
        _2912 = _672;
    }
    float _2918 = _2912;
    float _2920 = 0.0;
    float _2922 = _2918;
    float _2924 = _2918;
    if (!_2898)
    {
        _2920 = _674;
    }
    float _2926 = _2920;
    float _2928 = 0.0;
    float _2930 = _2926;
    float _2932 = _2926;
    if (!_2898)
    {
        _2928 = _676;
    }
    float _2934 = _2928;
    bool _2936 = !_2898;
    float _2938 = _2934;
    float _2940 = _2934;
    if (!_2936)
    {
        bool _2942 = _2880 > _2788;
        if (!_2942)
        {
            _2922 = _2882;
        }
        float _2944 = _2922;
        float _2946 = _2944;
        if (!_2942)
        {
            _2930 = _2884;
        }
        float _2948 = _2930;
        float _2950 = _2948;
        if (!_2942)
        {
            _2938 = _2886;
        }
        float _2952 = _2938;
        float _2954 = _2952;
        if (!_2942)
        {
            _2906 = _2876;
        }
        float _2956 = _2906;
        float _2958 = _2956;
        if (!_2942)
        {
            _2914 = _2878;
        }
        float _2960 = _2914;
        _2916 = _2960;
        if (_2942)
        {
            _2946 = _2882;
        }
        float _2962 = _2946;
        _2924 = _2962;
        if (_2942)
        {
            _2950 = _2884;
        }
        float _2964 = _2950;
        _2932 = _2964;
        if (_2942)
        {
            _2954 = _2886;
        }
        float _2966 = _2954;
        _2940 = _2966;
        if (_2942)
        {
            _2958 = _672;
        }
        float _2968 = _2958;
        _2908 = _2968;
        if (_2942)
        {
            _2900 = _674;
        }
        float _2970 = _2900;
        _2902 = _2970;
        if (_2942)
        {
            _2916 = _676;
        }
    }
    float _2972 = _2902;
    float _2974 = _2932;
    float _2976 = _2908;
    float _2978 = _2924;
    float _2980 = _2916;
    float _2982 = _2940;
    float _2984 = -_2972;
    float _2986 = _2974 + _2984;
    float _2988 = -_2976;
    float _2990 = _2978 + _2988;
    float _2992 = -_2980;
    float _2994 = _2982 + _2992;
    float _2996 = -_2972;
    float _2998 = _446 + _2996;
    float _3000 = _2986 * _2986;
    float _3002 = _2986 * _2998;
    float _3004 = fma(_2990, _2990, _3000);
    float _3006 = -_2976;
    float _3008 = _444 + _3006;
    float _3010 = -_2980;
    float _3012 = _448 + _3010;
    float _3014 = fma(_2994, _2994, _3004);
    float _3016 = fma(_2990, _3008, _3002);
    float _3018 = fma(_2994, _3012, _3016);
    float _3020 = 1.0 / _3014;
    float _3022 = _3020 * 3.0;
    float _3024 = _3022 * _3018;
    float _3026 = rint(_3024);
    float _3028 = precise::max(0.0, _3026);
    float _3030 = precise::min(_3028, 3.0);
    float _3032 = trunc(_3030);
    int _3035 = int(_3032);
    bool _3037 = _3035 >= 2;
    bool _3039 = !_3037;
    float _3041 = _2990;
    float _3043 = _2986;
    float _3045 = _2994;
    float _3047 = _2976;
    float _3049 = _2978;
    float _3051 = _2972;
    float _3053 = _2974;
    float _3055 = _2980;
    float _3057 = _2982;
    float _3067;
    float _3069;
    float _3071;
    float _3073;
    float _3075;
    float _3077;
    float _3079;
    float _3081;
    float _3083;
    float _3085;
    float _3087;
    float _3089;
    float _3091;
    float _3093;
    float _3095;
    float _3097;
    if (!_3039)
    {
        bool _3059 = _3035 >= 3;
        bool _3061 = !_3059;
        if (!_3061)
        {
            bool _3063 = _3035 != 3;
            _3065 = _3063;
            if (!_3065)
            {
                _3067 = _444;
                _3069 = _446;
                _3071 = _448;
                _3073 = 1.0;
                _3075 = 0.0;
                _3077 = 0.0;
                _3079 = 0.0;
                _3081 = 0.0;
                _3083 = 0.0;
                _3085 = 0.0;
                _3087 = 0.0;
                _3089 = 0.0;
                _3091 = 0.0;
                _3093 = 0.0;
                _3095 = 0.0;
                _3097 = 0.0;
                _3099 = true;
            }
        }
        else
        {
            _3067 = 0.0;
            _3069 = 0.0;
            _3071 = 0.0;
            _3073 = 0.0;
            _3075 = 0.0;
            _3077 = 0.0;
            _3079 = 0.0;
            _3081 = 0.0;
            _3083 = _444;
            _3085 = _446;
            _3087 = _448;
            _3089 = 1.0;
            _3091 = 0.0;
            _3093 = 0.0;
            _3095 = 0.0;
            _3097 = 0.0;
            _3099 = true;
        }
    }
    if ((!_3099) || _3065)
    {
        bool _3101;
        if (!_3065)
        {
            _3101 = _3035 >= 1;
        }
        if ((!_3101) || _3065)
        {
            bool _3103;
            if (!_3065)
            {
                _3103 = _3035 != 0;
            }
            if ((!_3103) && (!_3065))
            {
                _3067 = 0.0;
                _3069 = 0.0;
                _3071 = 0.0;
                _3073 = 0.0;
                _3075 = _444;
                _3077 = _446;
                _3079 = _448;
                _3081 = 1.0;
                _3083 = 0.0;
                _3085 = 0.0;
                _3087 = 0.0;
                _3089 = 0.0;
                _3091 = 0.0;
                _3093 = 0.0;
                _3095 = 0.0;
                _3097 = 0.0;
                _3099 = true;
            }
            else
            {
                _3065 = false;
                _3067 = 0.0;
                _3069 = 0.0;
                _3071 = 0.0;
                _3073 = 0.0;
                _3075 = 0.0;
                _3077 = 0.0;
                _3079 = 0.0;
                _3081 = 0.0;
                _3083 = 0.0;
                _3085 = 0.0;
                _3087 = 0.0;
                _3089 = 0.0;
                _3091 = 0.0;
                _3093 = 0.0;
                _3095 = 0.0;
                _3097 = 0.0;
                _3099 = true;
            }
        }
        else
        {
            _3067 = 0.0;
            _3069 = 0.0;
            _3071 = 0.0;
            _3073 = 0.0;
            _3075 = 0.0;
            _3077 = 0.0;
            _3079 = 0.0;
            _3081 = 0.0;
            _3083 = 0.0;
            _3085 = 0.0;
            _3087 = 0.0;
            _3089 = 0.0;
            _3091 = _444;
            _3093 = _446;
            _3095 = _448;
            _3097 = 1.0;
        }
    }
    _3099 = false;
    float _3105 = _3067;
    float _3107 = _3069;
    float _3109 = _3071;
    float _3111 = _3073;
    float _3113 = _3075;
    float _3115 = _3077;
    float _3117 = _3079;
    float _3119 = _3081;
    float _3121 = _3083;
    float _3123 = _3085;
    float _3125 = _3087;
    float _3127 = _3089;
    float _3129 = _3091;
    float _3131 = _3093;
    float _3133 = _3095;
    float _3135 = _3097;
    float _3137 = -_2972;
    float _3139 = _456 + _3137;
    float _3141 = -_2976;
    float _3143 = _454 + _3141;
    float _3145 = _2986 * _3139;
    float _3147 = -_2980;
    float _3149 = _458 + _3147;
    float _3151 = fma(_2990, _3143, _3145);
    float _3153 = fma(_2994, _3149, _3151);
    float _3155 = _3022 * _3153;
    float _3157 = rint(_3155);
    float _3159 = precise::max(0.0, _3157);
    float _3161 = precise::min(_3159, 3.0);
    float _3163 = trunc(_3161);
    int _3165 = int(_3163);
    bool _3167 = _3165 >= 2;
    bool _3169 = !_3167;
    float _3171 = as_type<float>(_3165);
    float _3173 = _3157;
    float _3175 = _3151;
    float _3177 = _3145;
    float _3179 = _3105;
    float _3181 = _3107;
    float _3183 = _3109;
    float _3185 = _3111;
    float _3187 = _3121;
    float _3189 = _3123;
    float _3191 = _3125;
    float _3193 = _3127;
    float _3195 = _3129;
    float _3197 = _3131;
    float _3199 = _3133;
    float _3201 = _3135;
    float _3219;
    float _3221;
    float _3223;
    float _3225;
    if (!_3169)
    {
        bool _3203 = _3165 >= 3;
        bool _3205 = !_3203;
        if (!_3205)
        {
            bool _3207 = _3165 != 3;
            _3209 = _3207;
            if (!_3209)
            {
                float _3211 = _454 + _3105;
                float _3213 = _456 + _3107;
                float _3215 = _458 + _3109;
                float _3217 = _3111 + 1.0;
                _3179 = _3211;
                _3181 = _3213;
                _3183 = _3215;
                _3185 = _3217;
                _3219 = _3113;
                _3221 = _3115;
                _3223 = _3117;
                _3225 = _3119;
                _3227 = true;
            }
        }
        else
        {
            float _3229 = _454 + _3121;
            float _3231 = _456 + _3123;
            float _3233 = _458 + _3125;
            float _3235 = _3127 + 1.0;
            _3219 = _3113;
            _3221 = _3115;
            _3223 = _3117;
            _3225 = _3119;
            _3187 = _3229;
            _3189 = _3231;
            _3191 = _3233;
            _3193 = _3235;
            _3227 = true;
        }
    }
    if ((!_3227) || _3209)
    {
        bool _3237;
        if (!_3209)
        {
            _3237 = _3165 >= 1;
        }
        if ((!_3237) || _3209)
        {
            if (!_3209)
            {
                bool _3239 = _3165 != 0;
                if (!_3239)
                {
                    float _3241 = _454 + _3113;
                    _3171 = _3241;
                }
                float _3243 = _3171;
                _3219 = _3243;
                if (!_3239)
                {
                    float _3245 = _456 + _3115;
                    _3173 = _3245;
                }
                float _3247 = _3173;
                _3221 = _3247;
                if (!_3239)
                {
                    float _3249 = _458 + _3117;
                    _3175 = _3249;
                }
                float _3251 = _3175;
                _3223 = _3251;
                if (!_3239)
                {
                    float _3253 = _3119 + 1.0;
                    _3177 = _3253;
                }
                float _3255 = _3177;
                bool _3257 = !_3239;
                _3225 = _3255;
                _3227 = _3257;
            }
            if ((!_3227) || _3209)
            {
                _3209 = false;
                _3219 = _3113;
                _3221 = _3115;
                _3223 = _3117;
                _3225 = _3119;
                _3227 = true;
            }
        }
        else
        {
            float _3259 = _454 + _3129;
            float _3261 = _456 + _3131;
            float _3263 = _458 + _3133;
            float _3265 = _3135 + 1.0;
            _3219 = _3113;
            _3221 = _3115;
            _3223 = _3117;
            _3225 = _3119;
            _3195 = _3259;
            _3197 = _3261;
            _3199 = _3263;
            _3201 = _3265;
        }
    }
    _3227 = false;
    float _3267 = _3179;
    float _3269 = _3181;
    float _3271 = _3183;
    float _3273 = _3185;
    float _3275 = _3219;
    float _3277 = _3221;
    float _3279 = _3223;
    float _3281 = _3225;
    float _3283 = _3187;
    float _3285 = _3189;
    float _3287 = _3191;
    float _3289 = _3193;
    float _3291 = _3195;
    float _3293 = _3197;
    float _3295 = _3199;
    float _3297 = _3201;
    float _3299 = -_2972;
    float _3301 = _466 + _3299;
    float _3303 = -_2976;
    float _3305 = _464 + _3303;
    float _3307 = _2986 * _3301;
    float _3309 = -_2980;
    float _3311 = _468 + _3309;
    float _3313 = fma(_2990, _3305, _3307);
    float _3315 = fma(_2994, _3311, _3313);
    float _3317 = _3022 * _3315;
    float _3319 = rint(_3317);
    float _3321 = precise::max(0.0, _3319);
    float _3323 = precise::min(_3321, 3.0);
    float _3325 = trunc(_3323);
    int _3327 = int(_3325);
    bool _3329 = _3327 >= 2;
    bool _3331 = !_3329;
    float _3333 = _3319;
    float _3335 = as_type<float>(_3327);
    float _3337 = _3307;
    float _3339 = _3313;
    float _3341 = _3267;
    float _3343 = _3269;
    float _3345 = _3271;
    float _3347 = _3273;
    float _3349 = _3283;
    float _3351 = _3285;
    float _3353 = _3287;
    float _3355 = _3289;
    float _3357 = _3291;
    float _3359 = _3293;
    float _3361 = _3295;
    float _3363 = _3297;
    float _3381;
    float _3383;
    float _3385;
    float _3387;
    if (!_3331)
    {
        bool _3365 = _3327 >= 3;
        bool _3367 = !_3365;
        if (!_3367)
        {
            bool _3369 = _3327 != 3;
            _3371 = _3369;
            if (!_3371)
            {
                float _3373 = _464 + _3267;
                float _3375 = _466 + _3269;
                float _3377 = _468 + _3271;
                float _3379 = _3273 + 1.0;
                _3341 = _3373;
                _3343 = _3375;
                _3345 = _3377;
                _3347 = _3379;
                _3381 = _3275;
                _3383 = _3277;
                _3385 = _3279;
                _3387 = _3281;
                _3389 = true;
            }
        }
        else
        {
            float _3391 = _464 + _3283;
            float _3393 = _466 + _3285;
            float _3395 = _468 + _3287;
            float _3397 = _3289 + 1.0;
            _3381 = _3275;
            _3383 = _3277;
            _3385 = _3279;
            _3387 = _3281;
            _3349 = _3391;
            _3351 = _3393;
            _3353 = _3395;
            _3355 = _3397;
            _3389 = true;
        }
    }
    if ((!_3389) || _3371)
    {
        bool _3399;
        if (!_3371)
        {
            _3399 = _3327 >= 1;
        }
        if ((!_3399) || _3371)
        {
            if (!_3371)
            {
                bool _3401 = _3327 != 0;
                if (!_3401)
                {
                    float _3403 = _464 + _3275;
                    _3333 = _3403;
                }
                float _3405 = _3333;
                _3381 = _3405;
                if (!_3401)
                {
                    float _3407 = _466 + _3277;
                    _3335 = _3407;
                }
                float _3409 = _3335;
                _3383 = _3409;
                if (!_3401)
                {
                    float _3411 = _468 + _3279;
                    _3337 = _3411;
                }
                float _3413 = _3337;
                _3385 = _3413;
                if (!_3401)
                {
                    float _3415 = _3281 + 1.0;
                    _3339 = _3415;
                }
                float _3417 = _3339;
                bool _3419 = !_3401;
                _3387 = _3417;
                _3389 = _3419;
            }
            if ((!_3389) || _3371)
            {
                _3371 = false;
                _3381 = _3275;
                _3383 = _3277;
                _3385 = _3279;
                _3387 = _3281;
                _3389 = true;
            }
        }
        else
        {
            float _3421 = _464 + _3291;
            float _3423 = _466 + _3293;
            float _3425 = _468 + _3295;
            float _3427 = _3297 + 1.0;
            _3381 = _3275;
            _3383 = _3277;
            _3385 = _3279;
            _3387 = _3281;
            _3357 = _3421;
            _3359 = _3423;
            _3361 = _3425;
            _3363 = _3427;
        }
    }
    _3389 = false;
    float _3429 = _3341;
    float _3431 = _3343;
    float _3433 = _3345;
    float _3435 = _3347;
    float _3437 = _3381;
    float _3439 = _3383;
    float _3441 = _3385;
    float _3443 = _3387;
    float _3445 = _3349;
    float _3447 = _3351;
    float _3449 = _3353;
    float _3451 = _3355;
    float _3453 = _3357;
    float _3455 = _3359;
    float _3457 = _3361;
    float _3459 = _3363;
    float _3461 = -_2972;
    float _3463 = _500 + _3461;
    float _3465 = -_2976;
    float _3467 = _498 + _3465;
    float _3469 = _2986 * _3463;
    float _3471 = -_2980;
    float _3473 = _502 + _3471;
    float _3475 = fma(_2990, _3467, _3469);
    float _3477 = fma(_2994, _3473, _3475);
    float _3479 = _3022 * _3477;
    float _3481 = rint(_3479);
    float _3483 = precise::max(0.0, _3481);
    float _3485 = precise::min(_3483, 3.0);
    float _3487 = trunc(_3485);
    int _3489 = int(_3487);
    bool _3491 = _3489 >= 2;
    bool _3493 = !_3491;
    float _3495 = as_type<float>(_3489);
    float _3497 = _3481;
    float _3499 = _3475;
    float _3501 = _3469;
    float _3503 = _3429;
    float _3505 = _3431;
    float _3507 = _3433;
    float _3509 = _3435;
    float _3511 = _3445;
    float _3513 = _3447;
    float _3515 = _3449;
    float _3517 = _3451;
    float _3519 = _3453;
    float _3521 = _3455;
    float _3523 = _3457;
    float _3525 = _3459;
    float _3543;
    float _3545;
    float _3547;
    float _3549;
    if (!_3493)
    {
        bool _3527 = _3489 >= 3;
        bool _3529 = !_3527;
        if (!_3529)
        {
            bool _3531 = _3489 != 3;
            _3533 = _3531;
            if (!_3533)
            {
                float _3535 = _498 + _3429;
                float _3537 = _500 + _3431;
                float _3539 = _502 + _3433;
                float _3541 = _3435 + 1.0;
                _3503 = _3535;
                _3505 = _3537;
                _3507 = _3539;
                _3509 = _3541;
                _3543 = _3437;
                _3545 = _3439;
                _3547 = _3441;
                _3549 = _3443;
                _3551 = true;
            }
        }
        else
        {
            float _3553 = _498 + _3445;
            float _3555 = _500 + _3447;
            float _3557 = _502 + _3449;
            float _3559 = _3451 + 1.0;
            _3543 = _3437;
            _3545 = _3439;
            _3547 = _3441;
            _3549 = _3443;
            _3511 = _3553;
            _3513 = _3555;
            _3515 = _3557;
            _3517 = _3559;
            _3551 = true;
        }
    }
    if ((!_3551) || _3533)
    {
        bool _3561;
        if (!_3533)
        {
            _3561 = _3489 >= 1;
        }
        if ((!_3561) || _3533)
        {
            if (!_3533)
            {
                bool _3563 = _3489 != 0;
                if (!_3563)
                {
                    float _3565 = _498 + _3437;
                    _3495 = _3565;
                }
                float _3567 = _3495;
                _3543 = _3567;
                if (!_3563)
                {
                    float _3569 = _500 + _3439;
                    _3497 = _3569;
                }
                float _3571 = _3497;
                _3545 = _3571;
                if (!_3563)
                {
                    float _3573 = _502 + _3441;
                    _3499 = _3573;
                }
                float _3575 = _3499;
                _3547 = _3575;
                if (!_3563)
                {
                    float _3577 = _3443 + 1.0;
                    _3501 = _3577;
                }
                float _3579 = _3501;
                bool _3581 = !_3563;
                _3549 = _3579;
                _3551 = _3581;
            }
            if ((!_3551) || _3533)
            {
                _3533 = false;
                _3543 = _3437;
                _3545 = _3439;
                _3547 = _3441;
                _3549 = _3443;
                _3551 = true;
            }
        }
        else
        {
            float _3583 = _498 + _3453;
            float _3585 = _500 + _3455;
            float _3587 = _502 + _3457;
            float _3589 = _3459 + 1.0;
            _3543 = _3437;
            _3545 = _3439;
            _3547 = _3441;
            _3549 = _3443;
            _3519 = _3583;
            _3521 = _3585;
            _3523 = _3587;
            _3525 = _3589;
        }
    }
    _3551 = false;
    float _3591 = _3503;
    float _3593 = _3505;
    float _3595 = _3507;
    float _3597 = _3509;
    float _3599 = _3543;
    float _3601 = _3545;
    float _3603 = _3547;
    float _3605 = _3549;
    float _3607 = _3511;
    float _3609 = _3513;
    float _3611 = _3515;
    float _3613 = _3517;
    float _3615 = _3519;
    float _3617 = _3521;
    float _3619 = _3523;
    float _3621 = _3525;
    float _3623 = -_2972;
    float _3625 = _512 + _3623;
    float _3627 = -_2976;
    float _3629 = _510 + _3627;
    float _3631 = _2986 * _3625;
    float _3633 = -_2980;
    float _3635 = _514 + _3633;
    float _3637 = fma(_2990, _3629, _3631);
    float _3639 = fma(_2994, _3635, _3637);
    float _3641 = _3022 * _3639;
    float _3643 = rint(_3641);
    float _3645 = precise::max(0.0, _3643);
    float _3647 = precise::min(_3645, 3.0);
    float _3649 = trunc(_3647);
    int _3651 = int(_3649);
    bool _3653 = _3651 >= 2;
    bool _3655 = !_3653;
    float _3657 = _3643;
    float _3659 = as_type<float>(_3651);
    float _3661 = _3631;
    float _3663 = _3637;
    float _3665 = _3591;
    float _3667 = _3593;
    float _3669 = _3595;
    float _3671 = _3597;
    float _3673 = _3607;
    float _3675 = _3609;
    float _3677 = _3611;
    float _3679 = _3613;
    float _3681 = _3615;
    float _3683 = _3617;
    float _3685 = _3619;
    float _3687 = _3621;
    float _3705;
    float _3707;
    float _3709;
    float _3711;
    if (!_3655)
    {
        bool _3689 = _3651 >= 3;
        bool _3691 = !_3689;
        if (!_3691)
        {
            bool _3693 = _3651 != 3;
            _3695 = _3693;
            if (!_3695)
            {
                float _3697 = _510 + _3591;
                float _3699 = _512 + _3593;
                float _3701 = _514 + _3595;
                float _3703 = _3597 + 1.0;
                _3665 = _3697;
                _3667 = _3699;
                _3669 = _3701;
                _3671 = _3703;
                _3705 = _3599;
                _3707 = _3601;
                _3709 = _3603;
                _3711 = _3605;
                _3713 = true;
            }
        }
        else
        {
            float _3715 = _510 + _3607;
            float _3717 = _512 + _3609;
            float _3719 = _514 + _3611;
            float _3721 = _3613 + 1.0;
            _3705 = _3599;
            _3707 = _3601;
            _3709 = _3603;
            _3711 = _3605;
            _3673 = _3715;
            _3675 = _3717;
            _3677 = _3719;
            _3679 = _3721;
            _3713 = true;
        }
    }
    if ((!_3713) || _3695)
    {
        bool _3723;
        if (!_3695)
        {
            _3723 = _3651 >= 1;
        }
        if ((!_3723) || _3695)
        {
            if (!_3695)
            {
                bool _3725 = _3651 != 0;
                if (!_3725)
                {
                    float _3727 = _510 + _3599;
                    _3657 = _3727;
                }
                float _3729 = _3657;
                _3705 = _3729;
                if (!_3725)
                {
                    float _3731 = _512 + _3601;
                    _3659 = _3731;
                }
                float _3733 = _3659;
                _3707 = _3733;
                if (!_3725)
                {
                    float _3735 = _514 + _3603;
                    _3661 = _3735;
                }
                float _3737 = _3661;
                _3709 = _3737;
                if (!_3725)
                {
                    float _3739 = _3605 + 1.0;
                    _3663 = _3739;
                }
                float _3741 = _3663;
                bool _3743 = !_3725;
                _3711 = _3741;
                _3713 = _3743;
            }
            if ((!_3713) || _3695)
            {
                _3695 = false;
                _3705 = _3599;
                _3707 = _3601;
                _3709 = _3603;
                _3711 = _3605;
                _3713 = true;
            }
        }
        else
        {
            float _3745 = _510 + _3615;
            float _3747 = _512 + _3617;
            float _3749 = _514 + _3619;
            float _3751 = _3621 + 1.0;
            _3705 = _3599;
            _3707 = _3601;
            _3709 = _3603;
            _3711 = _3605;
            _3681 = _3745;
            _3683 = _3747;
            _3685 = _3749;
            _3687 = _3751;
        }
    }
    _3713 = false;
    float _3753 = _3665;
    float _3755 = _3667;
    float _3757 = _3669;
    float _3759 = _3671;
    float _3761 = _3705;
    float _3763 = _3707;
    float _3765 = _3709;
    float _3767 = _3711;
    float _3769 = _3673;
    float _3771 = _3675;
    float _3773 = _3677;
    float _3775 = _3679;
    float _3777 = _3681;
    float _3779 = _3683;
    float _3781 = _3685;
    float _3783 = _3687;
    float _3785 = -_2972;
    float _3787 = _522 + _3785;
    float _3789 = -_2976;
    float _3791 = _520 + _3789;
    float _3793 = _2986 * _3787;
    float _3795 = -_2980;
    float _3797 = _524 + _3795;
    float _3799 = fma(_2990, _3791, _3793);
    float _3801 = fma(_2994, _3797, _3799);
    float _3803 = _3022 * _3801;
    float _3805 = rint(_3803);
    float _3807 = precise::max(0.0, _3805);
    float _3809 = precise::min(_3807, 3.0);
    float _3811 = trunc(_3809);
    int _3813 = int(_3811);
    bool _3815 = _3813 >= 2;
    bool _3817 = !_3815;
    float _3819 = as_type<float>(_3813);
    float _3821 = _3805;
    float _3823 = _3799;
    float _3825 = _3793;
    float _3827 = _3753;
    float _3829 = _3755;
    float _3831 = _3757;
    float _3833 = _3759;
    float _3835 = _3769;
    float _3837 = _3771;
    float _3839 = _3773;
    float _3841 = _3775;
    float _3843 = _3777;
    float _3845 = _3779;
    float _3847 = _3781;
    float _3849 = _3783;
    float _3867;
    float _3869;
    float _3871;
    float _3873;
    if (!_3817)
    {
        bool _3851 = _3813 >= 3;
        bool _3853 = !_3851;
        if (!_3853)
        {
            bool _3855 = _3813 != 3;
            _3857 = _3855;
            if (!_3857)
            {
                float _3859 = _520 + _3753;
                float _3861 = _522 + _3755;
                float _3863 = _524 + _3757;
                float _3865 = _3759 + 1.0;
                _3827 = _3859;
                _3829 = _3861;
                _3831 = _3863;
                _3833 = _3865;
                _3867 = _3761;
                _3869 = _3763;
                _3871 = _3765;
                _3873 = _3767;
                _3875 = true;
            }
        }
        else
        {
            float _3877 = _520 + _3769;
            float _3879 = _522 + _3771;
            float _3881 = _524 + _3773;
            float _3883 = _3775 + 1.0;
            _3867 = _3761;
            _3869 = _3763;
            _3871 = _3765;
            _3873 = _3767;
            _3835 = _3877;
            _3837 = _3879;
            _3839 = _3881;
            _3841 = _3883;
            _3875 = true;
        }
    }
    if ((!_3875) || _3857)
    {
        bool _3885;
        if (!_3857)
        {
            _3885 = _3813 >= 1;
        }
        if ((!_3885) || _3857)
        {
            if (!_3857)
            {
                bool _3887 = _3813 != 0;
                if (!_3887)
                {
                    float _3889 = _520 + _3761;
                    _3819 = _3889;
                }
                float _3891 = _3819;
                _3867 = _3891;
                if (!_3887)
                {
                    float _3893 = _522 + _3763;
                    _3821 = _3893;
                }
                float _3895 = _3821;
                _3869 = _3895;
                if (!_3887)
                {
                    float _3897 = _524 + _3765;
                    _3823 = _3897;
                }
                float _3899 = _3823;
                _3871 = _3899;
                if (!_3887)
                {
                    float _3901 = _3767 + 1.0;
                    _3825 = _3901;
                }
                float _3903 = _3825;
                bool _3905 = !_3887;
                _3873 = _3903;
                _3875 = _3905;
            }
            if ((!_3875) || _3857)
            {
                _3857 = false;
                _3867 = _3761;
                _3869 = _3763;
                _3871 = _3765;
                _3873 = _3767;
                _3875 = true;
            }
        }
        else
        {
            float _3907 = _520 + _3777;
            float _3909 = _522 + _3779;
            float _3911 = _524 + _3781;
            float _3913 = _3783 + 1.0;
            _3867 = _3761;
            _3869 = _3763;
            _3871 = _3765;
            _3873 = _3767;
            _3843 = _3907;
            _3845 = _3909;
            _3847 = _3911;
            _3849 = _3913;
        }
    }
    _3875 = false;
    float _3915 = _3827;
    float _3917 = _3829;
    float _3919 = _3831;
    float _3921 = _3833;
    float _3923 = _3867;
    float _3925 = _3869;
    float _3927 = _3871;
    float _3929 = _3873;
    float _3931 = _3835;
    float _3933 = _3837;
    float _3935 = _3839;
    float _3937 = _3841;
    float _3939 = _3843;
    float _3941 = _3845;
    float _3943 = _3847;
    float _3945 = _3849;
    float _3947 = -_2972;
    float _3949 = _532 + _3947;
    float _3951 = -_2976;
    float _3953 = _530 + _3951;
    float _3955 = _2986 * _3949;
    float _3957 = -_2980;
    float _3959 = _534 + _3957;
    float _3961 = fma(_2990, _3953, _3955);
    float _3963 = fma(_2994, _3959, _3961);
    float _3965 = _3022 * _3963;
    float _3967 = rint(_3965);
    float _3969 = precise::max(0.0, _3967);
    float _3971 = precise::min(_3969, 3.0);
    float _3973 = trunc(_3971);
    int _3975 = int(_3973);
    bool _3977 = _3975 >= 2;
    bool _3979 = !_3977;
    float _3981 = _3967;
    float _3983 = as_type<float>(_3975);
    float _3985 = _3955;
    float _3987 = _3961;
    float _3989 = _3915;
    float _3991 = _3917;
    float _3993 = _3919;
    float _3995 = _3921;
    float _3997 = _3931;
    float _3999 = _3933;
    float _4001 = _3935;
    float _4003 = _3937;
    float _4005 = _3939;
    float _4007 = _3941;
    float _4009 = _3943;
    float _4011 = _3945;
    float _4029;
    float _4031;
    float _4033;
    float _4035;
    if (!_3979)
    {
        bool _4013 = _3975 >= 3;
        bool _4015 = !_4013;
        if (!_4015)
        {
            bool _4017 = _3975 != 3;
            _4019 = _4017;
            if (!_4019)
            {
                float _4021 = _530 + _3915;
                float _4023 = _532 + _3917;
                float _4025 = _534 + _3919;
                float _4027 = _3921 + 1.0;
                _3989 = _4021;
                _3991 = _4023;
                _3993 = _4025;
                _3995 = _4027;
                _4029 = _3923;
                _4031 = _3925;
                _4033 = _3927;
                _4035 = _3929;
                _4037 = true;
            }
        }
        else
        {
            float _4039 = _530 + _3931;
            float _4041 = _532 + _3933;
            float _4043 = _534 + _3935;
            float _4045 = _3937 + 1.0;
            _4029 = _3923;
            _4031 = _3925;
            _4033 = _3927;
            _4035 = _3929;
            _3997 = _4039;
            _3999 = _4041;
            _4001 = _4043;
            _4003 = _4045;
            _4037 = true;
        }
    }
    if ((!_4037) || _4019)
    {
        bool _4047;
        if (!_4019)
        {
            _4047 = _3975 >= 1;
        }
        if ((!_4047) || _4019)
        {
            if (!_4019)
            {
                bool _4049 = _3975 != 0;
                if (!_4049)
                {
                    float _4051 = _530 + _3923;
                    _3981 = _4051;
                }
                float _4053 = _3981;
                _4029 = _4053;
                if (!_4049)
                {
                    float _4055 = _532 + _3925;
                    _3983 = _4055;
                }
                float _4057 = _3983;
                _4031 = _4057;
                if (!_4049)
                {
                    float _4059 = _534 + _3927;
                    _3985 = _4059;
                }
                float _4061 = _3985;
                _4033 = _4061;
                if (!_4049)
                {
                    float _4063 = _3929 + 1.0;
                    _3987 = _4063;
                }
                float _4065 = _3987;
                bool _4067 = !_4049;
                _4035 = _4065;
                _4037 = _4067;
            }
            if ((!_4037) || _4019)
            {
                _4019 = false;
                _4029 = _3923;
                _4031 = _3925;
                _4033 = _3927;
                _4035 = _3929;
                _4037 = true;
            }
        }
        else
        {
            float _4069 = _530 + _3939;
            float _4071 = _532 + _3941;
            float _4073 = _534 + _3943;
            float _4075 = _3945 + 1.0;
            _4029 = _3923;
            _4031 = _3925;
            _4033 = _3927;
            _4035 = _3929;
            _4005 = _4069;
            _4007 = _4071;
            _4009 = _4073;
            _4011 = _4075;
        }
    }
    _4037 = false;
    float _4077 = _3989;
    float _4079 = _3991;
    float _4081 = _3993;
    float _4083 = _3995;
    float _4085 = _4029;
    float _4087 = _4031;
    float _4089 = _4033;
    float _4091 = _4035;
    float _4093 = _3997;
    float _4095 = _3999;
    float _4097 = _4001;
    float _4099 = _4003;
    float _4101 = _4005;
    float _4103 = _4007;
    float _4105 = _4009;
    float _4107 = _4011;
    float _4109 = -_2972;
    float _4111 = _572 + _4109;
    float _4113 = -_2976;
    float _4115 = _570 + _4113;
    float _4117 = _2986 * _4111;
    float _4119 = -_2980;
    float _4121 = _574 + _4119;
    float _4123 = fma(_2990, _4115, _4117);
    float _4125 = fma(_2994, _4121, _4123);
    float _4127 = _3022 * _4125;
    float _4129 = rint(_4127);
    float _4131 = precise::max(0.0, _4129);
    float _4133 = precise::min(_4131, 3.0);
    float _4135 = trunc(_4133);
    int _4137 = int(_4135);
    bool _4139 = _4137 >= 2;
    bool _4141 = !_4139;
    float _4143 = _4117;
    float _4145 = _4123;
    float _4147 = _4129;
    float _4149 = as_type<float>(_4137);
    float _4151 = _4077;
    float _4153 = _4079;
    float _4155 = _4081;
    float _4157 = _4083;
    float _4159 = _4093;
    float _4161 = _4095;
    float _4163 = _4097;
    float _4165 = _4099;
    float _4167 = _4101;
    float _4169 = _4103;
    float _4171 = _4105;
    float _4173 = _4107;
    float _4191;
    float _4193;
    float _4195;
    float _4197;
    if (!_4141)
    {
        bool _4175 = _4137 >= 3;
        bool _4177 = !_4175;
        if (!_4177)
        {
            bool _4179 = _4137 != 3;
            _4181 = _4179;
            if (!_4181)
            {
                float _4183 = _570 + _4077;
                float _4185 = _572 + _4079;
                float _4187 = _574 + _4081;
                float _4189 = _4083 + 1.0;
                _4151 = _4183;
                _4153 = _4185;
                _4155 = _4187;
                _4157 = _4189;
                _4191 = _4085;
                _4193 = _4087;
                _4195 = _4089;
                _4197 = _4091;
                _4199 = true;
            }
        }
        else
        {
            float _4201 = _570 + _4093;
            float _4203 = _572 + _4095;
            float _4205 = _574 + _4097;
            float _4207 = _4099 + 1.0;
            _4191 = _4085;
            _4193 = _4087;
            _4195 = _4089;
            _4197 = _4091;
            _4159 = _4201;
            _4161 = _4203;
            _4163 = _4205;
            _4165 = _4207;
            _4199 = true;
        }
    }
    if ((!_4199) || _4181)
    {
        bool _4209;
        if (!_4181)
        {
            _4209 = _4137 >= 1;
        }
        if ((!_4209) || _4181)
        {
            if (!_4181)
            {
                bool _4211 = _4137 != 0;
                if (!_4211)
                {
                    float _4213 = _570 + _4085;
                    _4143 = _4213;
                }
                float _4215 = _4143;
                _4191 = _4215;
                if (!_4211)
                {
                    float _4217 = _572 + _4087;
                    _4145 = _4217;
                }
                float _4219 = _4145;
                _4193 = _4219;
                if (!_4211)
                {
                    float _4221 = _574 + _4089;
                    _4147 = _4221;
                }
                float _4223 = _4147;
                _4195 = _4223;
                if (!_4211)
                {
                    float _4225 = _4091 + 1.0;
                    _4149 = _4225;
                }
                float _4227 = _4149;
                bool _4229 = !_4211;
                _4197 = _4227;
                _4199 = _4229;
            }
            if ((!_4199) || _4181)
            {
                _4181 = false;
                _4191 = _4085;
                _4193 = _4087;
                _4195 = _4089;
                _4197 = _4091;
                _4199 = true;
            }
        }
        else
        {
            float _4231 = _570 + _4101;
            float _4233 = _572 + _4103;
            float _4235 = _574 + _4105;
            float _4237 = _4107 + 1.0;
            _4191 = _4085;
            _4193 = _4087;
            _4195 = _4089;
            _4197 = _4091;
            _4167 = _4231;
            _4169 = _4233;
            _4171 = _4235;
            _4173 = _4237;
        }
    }
    _4199 = false;
    float _4239 = _4151;
    float _4241 = _4153;
    float _4243 = _4155;
    float _4245 = _4157;
    float _4247 = _4191;
    float _4249 = _4193;
    float _4251 = _4195;
    float _4253 = _4197;
    float _4255 = _4159;
    float _4257 = _4161;
    float _4259 = _4163;
    float _4261 = _4165;
    float _4263 = _4167;
    float _4265 = _4169;
    float _4267 = _4171;
    float _4269 = _4173;
    float _4271 = -_2972;
    float _4273 = _582 + _4271;
    float _4275 = -_2976;
    float _4277 = _580 + _4275;
    float _4279 = _2986 * _4273;
    float _4281 = -_2980;
    float _4283 = _584 + _4281;
    float _4285 = fma(_2990, _4277, _4279);
    float _4287 = fma(_2994, _4283, _4285);
    float _4289 = _3022 * _4287;
    float _4291 = rint(_4289);
    float _4293 = precise::max(0.0, _4291);
    float _4295 = precise::min(_4293, 3.0);
    float _4297 = trunc(_4295);
    int _4299 = int(_4297);
    bool _4301 = _4299 >= 2;
    bool _4303 = !_4301;
    float _4305 = _4291;
    float _4307 = as_type<float>(_4299);
    float _4309 = _4279;
    float _4311 = _4285;
    float _4313 = _4239;
    float _4315 = _4241;
    float _4317 = _4243;
    float _4319 = _4245;
    float _4321 = _4255;
    float _4323 = _4257;
    float _4325 = _4259;
    float _4327 = _4261;
    float _4329 = _4263;
    float _4331 = _4265;
    float _4333 = _4267;
    float _4335 = _4269;
    float _4353;
    float _4355;
    float _4357;
    float _4359;
    if (!_4303)
    {
        bool _4337 = _4299 >= 3;
        bool _4339 = !_4337;
        if (!_4339)
        {
            bool _4341 = _4299 != 3;
            _4343 = _4341;
            if (!_4343)
            {
                float _4345 = _580 + _4239;
                float _4347 = _582 + _4241;
                float _4349 = _584 + _4243;
                float _4351 = _4245 + 1.0;
                _4313 = _4345;
                _4315 = _4347;
                _4317 = _4349;
                _4319 = _4351;
                _4353 = _4247;
                _4355 = _4249;
                _4357 = _4251;
                _4359 = _4253;
                _4361 = true;
            }
        }
        else
        {
            float _4363 = _580 + _4255;
            float _4365 = _582 + _4257;
            float _4367 = _584 + _4259;
            float _4369 = _4261 + 1.0;
            _4353 = _4247;
            _4355 = _4249;
            _4357 = _4251;
            _4359 = _4253;
            _4321 = _4363;
            _4323 = _4365;
            _4325 = _4367;
            _4327 = _4369;
            _4361 = true;
        }
    }
    if ((!_4361) || _4343)
    {
        bool _4371;
        if (!_4343)
        {
            _4371 = _4299 >= 1;
        }
        if ((!_4371) || _4343)
        {
            if (!_4343)
            {
                bool _4373 = _4299 != 0;
                if (!_4373)
                {
                    float _4375 = _580 + _4247;
                    _4305 = _4375;
                }
                float _4377 = _4305;
                _4353 = _4377;
                if (!_4373)
                {
                    float _4379 = _582 + _4249;
                    _4307 = _4379;
                }
                float _4381 = _4307;
                _4355 = _4381;
                if (!_4373)
                {
                    float _4383 = _584 + _4251;
                    _4309 = _4383;
                }
                float _4385 = _4309;
                _4357 = _4385;
                if (!_4373)
                {
                    float _4387 = _4253 + 1.0;
                    _4311 = _4387;
                }
                float _4389 = _4311;
                bool _4391 = !_4373;
                _4359 = _4389;
                _4361 = _4391;
            }
            if ((!_4361) || _4343)
            {
                _4343 = false;
                _4353 = _4247;
                _4355 = _4249;
                _4357 = _4251;
                _4359 = _4253;
                _4361 = true;
            }
        }
        else
        {
            float _4393 = _580 + _4263;
            float _4395 = _582 + _4265;
            float _4397 = _584 + _4267;
            float _4399 = _4269 + 1.0;
            _4353 = _4247;
            _4355 = _4249;
            _4357 = _4251;
            _4359 = _4253;
            _4329 = _4393;
            _4331 = _4395;
            _4333 = _4397;
            _4335 = _4399;
        }
    }
    _4361 = false;
    float _4401 = _4313;
    float _4403 = _4315;
    float _4405 = _4317;
    float _4407 = _4319;
    float _4409 = _4353;
    float _4411 = _4355;
    float _4413 = _4357;
    float _4415 = _4359;
    float _4417 = _4321;
    float _4419 = _4323;
    float _4421 = _4325;
    float _4423 = _4327;
    float _4425 = _4329;
    float _4427 = _4331;
    float _4429 = _4333;
    float _4431 = _4335;
    float _4433 = -_2972;
    float _4435 = _614 + _4433;
    float _4437 = -_2976;
    float _4439 = _612 + _4437;
    float _4441 = _2986 * _4435;
    float _4443 = -_2980;
    float _4445 = _616 + _4443;
    float _4447 = fma(_2990, _4439, _4441);
    float _4449 = fma(_2994, _4445, _4447);
    float _4451 = _3022 * _4449;
    float _4453 = rint(_4451);
    float _4455 = precise::max(0.0, _4453);
    float _4457 = precise::min(_4455, 3.0);
    float _4459 = trunc(_4457);
    int _4461 = int(_4459);
    bool _4463 = _4461 >= 2;
    bool _4465 = !_4463;
    float _4467 = as_type<float>(_4461);
    float _4469 = _4453;
    float _4471 = _4447;
    float _4473 = _4441;
    float _4475 = _4401;
    float _4477 = _4403;
    float _4479 = _4405;
    float _4481 = _4407;
    float _4483 = _4417;
    float _4485 = _4419;
    float _4487 = _4421;
    float _4489 = _4423;
    float _4491 = _4425;
    float _4493 = _4427;
    float _4495 = _4429;
    float _4497 = _4431;
    float _4515;
    float _4517;
    float _4519;
    float _4521;
    if (!_4465)
    {
        bool _4499 = _4461 >= 3;
        bool _4501 = !_4499;
        if (!_4501)
        {
            bool _4503 = _4461 != 3;
            _4505 = _4503;
            if (!_4505)
            {
                float _4507 = _612 + _4401;
                float _4509 = _614 + _4403;
                float _4511 = _616 + _4405;
                float _4513 = _4407 + 1.0;
                _4475 = _4507;
                _4477 = _4509;
                _4479 = _4511;
                _4481 = _4513;
                _4515 = _4409;
                _4517 = _4411;
                _4519 = _4413;
                _4521 = _4415;
                _4523 = true;
            }
        }
        else
        {
            float _4525 = _612 + _4417;
            float _4527 = _614 + _4419;
            float _4529 = _616 + _4421;
            float _4531 = _4423 + 1.0;
            _4515 = _4409;
            _4517 = _4411;
            _4519 = _4413;
            _4521 = _4415;
            _4483 = _4525;
            _4485 = _4527;
            _4487 = _4529;
            _4489 = _4531;
            _4523 = true;
        }
    }
    if ((!_4523) || _4505)
    {
        bool _4533;
        if (!_4505)
        {
            _4533 = _4461 >= 1;
        }
        if ((!_4533) || _4505)
        {
            if (!_4505)
            {
                bool _4535 = _4461 != 0;
                if (!_4535)
                {
                    float _4537 = _612 + _4409;
                    _4467 = _4537;
                }
                float _4539 = _4467;
                _4515 = _4539;
                if (!_4535)
                {
                    float _4541 = _614 + _4411;
                    _4469 = _4541;
                }
                float _4543 = _4469;
                _4517 = _4543;
                if (!_4535)
                {
                    float _4545 = _616 + _4413;
                    _4471 = _4545;
                }
                float _4547 = _4471;
                _4519 = _4547;
                if (!_4535)
                {
                    float _4549 = _4415 + 1.0;
                    _4473 = _4549;
                }
                float _4551 = _4473;
                bool _4553 = !_4535;
                _4521 = _4551;
                _4523 = _4553;
            }
            if ((!_4523) || _4505)
            {
                _4505 = false;
                _4515 = _4409;
                _4517 = _4411;
                _4519 = _4413;
                _4521 = _4415;
                _4523 = true;
            }
        }
        else
        {
            float _4555 = _612 + _4425;
            float _4557 = _614 + _4427;
            float _4559 = _616 + _4429;
            float _4561 = _4431 + 1.0;
            _4515 = _4409;
            _4517 = _4411;
            _4519 = _4413;
            _4521 = _4415;
            _4491 = _4555;
            _4493 = _4557;
            _4495 = _4559;
            _4497 = _4561;
        }
    }
    _4523 = false;
    float _4563 = _4475;
    float _4565 = _4477;
    float _4567 = _4479;
    float _4569 = _4481;
    float _4571 = _4515;
    float _4573 = _4517;
    float _4575 = _4519;
    float _4577 = _4521;
    float _4579 = _4483;
    float _4581 = _4485;
    float _4583 = _4487;
    float _4585 = _4489;
    float _4587 = _4491;
    float _4589 = _4493;
    float _4591 = _4495;
    float _4593 = _4497;
    float _4595 = -_2972;
    float _4597 = _624 + _4595;
    float _4599 = -_2976;
    float _4601 = _622 + _4599;
    float _4603 = _2986 * _4597;
    float _4605 = -_2980;
    float _4607 = _626 + _4605;
    float _4609 = fma(_2990, _4601, _4603);
    float _4611 = fma(_2994, _4607, _4609);
    float _4613 = _3022 * _4611;
    float _4615 = rint(_4613);
    float _4617 = precise::max(0.0, _4615);
    float _4619 = precise::min(_4617, 3.0);
    float _4621 = trunc(_4619);
    int _4623 = int(_4621);
    bool _4625 = _4623 >= 2;
    bool _4627 = !_4625;
    float _4629 = _4615;
    float _4631 = as_type<float>(_4623);
    float _4633 = _4603;
    float _4635 = _4609;
    float _4637 = _4563;
    float _4639 = _4565;
    float _4641 = _4567;
    float _4643 = _4569;
    float _4645 = _4579;
    float _4647 = _4581;
    float _4649 = _4583;
    float _4651 = _4585;
    float _4653 = _4587;
    float _4655 = _4589;
    float _4657 = _4591;
    float _4659 = _4593;
    float _4677;
    float _4679;
    float _4681;
    float _4683;
    if (!_4627)
    {
        bool _4661 = _4623 >= 3;
        bool _4663 = !_4661;
        if (!_4663)
        {
            bool _4665 = _4623 != 3;
            _4667 = _4665;
            if (!_4667)
            {
                float _4669 = _622 + _4563;
                float _4671 = _624 + _4565;
                float _4673 = _626 + _4567;
                float _4675 = _4569 + 1.0;
                _4637 = _4669;
                _4639 = _4671;
                _4641 = _4673;
                _4643 = _4675;
                _4677 = _4571;
                _4679 = _4573;
                _4681 = _4575;
                _4683 = _4577;
                _4685 = true;
            }
        }
        else
        {
            float _4687 = _622 + _4579;
            float _4689 = _624 + _4581;
            float _4691 = _626 + _4583;
            float _4693 = _4585 + 1.0;
            _4677 = _4571;
            _4679 = _4573;
            _4681 = _4575;
            _4683 = _4577;
            _4645 = _4687;
            _4647 = _4689;
            _4649 = _4691;
            _4651 = _4693;
            _4685 = true;
        }
    }
    if ((!_4685) || _4667)
    {
        bool _4695;
        if (!_4667)
        {
            _4695 = _4623 >= 1;
        }
        if ((!_4695) || _4667)
        {
            if (!_4667)
            {
                bool _4697 = _4623 != 0;
                if (!_4697)
                {
                    float _4699 = _622 + _4571;
                    _4629 = _4699;
                }
                float _4701 = _4629;
                _4677 = _4701;
                if (!_4697)
                {
                    float _4703 = _624 + _4573;
                    _4631 = _4703;
                }
                float _4705 = _4631;
                _4679 = _4705;
                if (!_4697)
                {
                    float _4707 = _626 + _4575;
                    _4633 = _4707;
                }
                float _4709 = _4633;
                _4681 = _4709;
                if (!_4697)
                {
                    float _4711 = _4577 + 1.0;
                    _4635 = _4711;
                }
                float _4713 = _4635;
                bool _4715 = !_4697;
                _4683 = _4713;
                _4685 = _4715;
            }
            if ((!_4685) || _4667)
            {
                _4667 = false;
                _4677 = _4571;
                _4679 = _4573;
                _4681 = _4575;
                _4683 = _4577;
                _4685 = true;
            }
        }
        else
        {
            float _4717 = _622 + _4587;
            float _4719 = _624 + _4589;
            float _4721 = _626 + _4591;
            float _4723 = _4593 + 1.0;
            _4677 = _4571;
            _4679 = _4573;
            _4681 = _4575;
            _4683 = _4577;
            _4653 = _4717;
            _4655 = _4719;
            _4657 = _4721;
            _4659 = _4723;
        }
    }
    _4685 = false;
    float _4725 = _4637;
    float _4727 = _4639;
    float _4729 = _4641;
    float _4731 = _4643;
    float _4733 = _4677;
    float _4735 = _4679;
    float _4737 = _4681;
    float _4739 = _4683;
    float _4741 = _4645;
    float _4743 = _4647;
    float _4745 = _4649;
    float _4747 = _4651;
    float _4749 = _4653;
    float _4751 = _4655;
    float _4753 = _4657;
    float _4755 = _4659;
    float _4757 = -_2972;
    float _4759 = _634 + _4757;
    float _4761 = -_2976;
    float _4763 = _632 + _4761;
    float _4765 = _2986 * _4759;
    float _4767 = -_2980;
    float _4769 = _636 + _4767;
    float _4771 = fma(_2990, _4763, _4765);
    float _4773 = fma(_2994, _4769, _4771);
    float _4775 = _3022 * _4773;
    float _4777 = rint(_4775);
    float _4779 = precise::max(0.0, _4777);
    float _4781 = precise::min(_4779, 3.0);
    float _4783 = trunc(_4781);
    int _4785 = int(_4783);
    bool _4787 = _4785 >= 2;
    bool _4789 = !_4787;
    float _4791 = as_type<float>(_4785);
    float _4793 = _4777;
    float _4795 = _4771;
    float _4797 = _4765;
    float _4799 = _4725;
    float _4801 = _4727;
    float _4803 = _4729;
    float _4805 = _4731;
    float _4807 = _4741;
    float _4809 = _4743;
    float _4811 = _4745;
    float _4813 = _4747;
    float _4815 = _4749;
    float _4817 = _4751;
    float _4819 = _4753;
    float _4821 = _4755;
    float _4839;
    float _4841;
    float _4843;
    float _4845;
    if (!_4789)
    {
        bool _4823 = _4785 >= 3;
        bool _4825 = !_4823;
        if (!_4825)
        {
            bool _4827 = _4785 != 3;
            _4829 = _4827;
            if (!_4829)
            {
                float _4831 = _632 + _4725;
                float _4833 = _634 + _4727;
                float _4835 = _636 + _4729;
                float _4837 = _4731 + 1.0;
                _4799 = _4831;
                _4801 = _4833;
                _4803 = _4835;
                _4805 = _4837;
                _4839 = _4733;
                _4841 = _4735;
                _4843 = _4737;
                _4845 = _4739;
                _4847 = true;
            }
        }
        else
        {
            float _4849 = _632 + _4741;
            float _4851 = _634 + _4743;
            float _4853 = _636 + _4745;
            float _4855 = _4747 + 1.0;
            _4839 = _4733;
            _4841 = _4735;
            _4843 = _4737;
            _4845 = _4739;
            _4807 = _4849;
            _4809 = _4851;
            _4811 = _4853;
            _4813 = _4855;
            _4847 = true;
        }
    }
    if ((!_4847) || _4829)
    {
        bool _4857;
        if (!_4829)
        {
            _4857 = _4785 >= 1;
        }
        if ((!_4857) || _4829)
        {
            if (!_4829)
            {
                bool _4859 = _4785 != 0;
                if (!_4859)
                {
                    float _4861 = _632 + _4733;
                    _4791 = _4861;
                }
                float _4863 = _4791;
                _4839 = _4863;
                if (!_4859)
                {
                    float _4865 = _634 + _4735;
                    _4793 = _4865;
                }
                float _4867 = _4793;
                _4841 = _4867;
                if (!_4859)
                {
                    float _4869 = _636 + _4737;
                    _4795 = _4869;
                }
                float _4871 = _4795;
                _4843 = _4871;
                if (!_4859)
                {
                    float _4873 = _4739 + 1.0;
                    _4797 = _4873;
                }
                float _4875 = _4797;
                bool _4877 = !_4859;
                _4845 = _4875;
                _4847 = _4877;
            }
            if ((!_4847) || _4829)
            {
                _4829 = false;
                _4839 = _4733;
                _4841 = _4735;
                _4843 = _4737;
                _4845 = _4739;
                _4847 = true;
            }
        }
        else
        {
            float _4879 = _632 + _4749;
            float _4881 = _634 + _4751;
            float _4883 = _636 + _4753;
            float _4885 = _4755 + 1.0;
            _4839 = _4733;
            _4841 = _4735;
            _4843 = _4737;
            _4845 = _4739;
            _4815 = _4879;
            _4817 = _4881;
            _4819 = _4883;
            _4821 = _4885;
        }
    }
    _4847 = false;
    float _4887 = _4799;
    float _4889 = _4801;
    float _4891 = _4803;
    float _4893 = _4805;
    float _4895 = _4839;
    float _4897 = _4841;
    float _4899 = _4843;
    float _4901 = _4845;
    float _4903 = _4807;
    float _4905 = _4809;
    float _4907 = _4811;
    float _4909 = _4813;
    float _4911 = _4815;
    float _4913 = _4817;
    float _4915 = _4819;
    float _4917 = _4821;
    float _4919 = -_2972;
    float _4921 = _644 + _4919;
    float _4923 = -_2976;
    float _4925 = _642 + _4923;
    float _4927 = _2986 * _4921;
    float _4929 = -_2980;
    float _4931 = _646 + _4929;
    float _4933 = fma(_2990, _4925, _4927);
    float _4935 = fma(_2994, _4931, _4933);
    float _4937 = _3022 * _4935;
    float _4939 = rint(_4937);
    float _4941 = precise::max(0.0, _4939);
    float _4943 = precise::min(_4941, 3.0);
    float _4945 = trunc(_4943);
    int _4947 = int(_4945);
    bool _4949 = _4947 >= 2;
    bool _4951 = !_4949;
    float _4953 = _4939;
    float _4955 = as_type<float>(_4947);
    float _4957 = _4927;
    float _4959 = _4933;
    float _4961 = _4887;
    float _4963 = _4889;
    float _4965 = _4891;
    float _4967 = _4893;
    float _4969 = _4903;
    float _4971 = _4905;
    float _4973 = _4907;
    float _4975 = _4909;
    float _4977 = _4911;
    float _4979 = _4913;
    float _4981 = _4915;
    float _4983 = _4917;
    float _5001;
    float _5003;
    float _5005;
    float _5007;
    if (!_4951)
    {
        bool _4985 = _4947 >= 3;
        bool _4987 = !_4985;
        if (!_4987)
        {
            bool _4989 = _4947 != 3;
            _4991 = _4989;
            if (!_4991)
            {
                float _4993 = _642 + _4887;
                float _4995 = _644 + _4889;
                float _4997 = _646 + _4891;
                float _4999 = _4893 + 1.0;
                _4961 = _4993;
                _4963 = _4995;
                _4965 = _4997;
                _4967 = _4999;
                _5001 = _4895;
                _5003 = _4897;
                _5005 = _4899;
                _5007 = _4901;
                _5009 = true;
            }
        }
        else
        {
            float _5011 = _642 + _4903;
            float _5013 = _644 + _4905;
            float _5015 = _646 + _4907;
            float _5017 = _4909 + 1.0;
            _5001 = _4895;
            _5003 = _4897;
            _5005 = _4899;
            _5007 = _4901;
            _4969 = _5011;
            _4971 = _5013;
            _4973 = _5015;
            _4975 = _5017;
            _5009 = true;
        }
    }
    if ((!_5009) || _4991)
    {
        bool _5019;
        if (!_4991)
        {
            _5019 = _4947 >= 1;
        }
        if ((!_5019) || _4991)
        {
            if (!_4991)
            {
                bool _5021 = _4947 != 0;
                if (!_5021)
                {
                    float _5023 = _642 + _4895;
                    _4953 = _5023;
                }
                float _5025 = _4953;
                _5001 = _5025;
                if (!_5021)
                {
                    float _5027 = _644 + _4897;
                    _4955 = _5027;
                }
                float _5029 = _4955;
                _5003 = _5029;
                if (!_5021)
                {
                    float _5031 = _646 + _4899;
                    _4957 = _5031;
                }
                float _5033 = _4957;
                _5005 = _5033;
                if (!_5021)
                {
                    float _5035 = _4901 + 1.0;
                    _4959 = _5035;
                }
                float _5037 = _4959;
                bool _5039 = !_5021;
                _5007 = _5037;
                _5009 = _5039;
            }
            if ((!_5009) || _4991)
            {
                _4991 = false;
                _5001 = _4895;
                _5003 = _4897;
                _5005 = _4899;
                _5007 = _4901;
                _5009 = true;
            }
        }
        else
        {
            float _5041 = _642 + _4911;
            float _5043 = _644 + _4913;
            float _5045 = _646 + _4915;
            float _5047 = _4917 + 1.0;
            _5001 = _4895;
            _5003 = _4897;
            _5005 = _4899;
            _5007 = _4901;
            _4977 = _5041;
            _4979 = _5043;
            _4981 = _5045;
            _4983 = _5047;
        }
    }
    _5009 = false;
    float _5049 = _4961;
    float _5051 = _4963;
    float _5053 = _4965;
    float _5055 = _4967;
    float _5057 = _5001;
    float _5059 = _5003;
    float _5061 = _5005;
    float _5063 = _5007;
    float _5065 = _4969;
    float _5067 = _4971;
    float _5069 = _4973;
    float _5071 = _4975;
    float _5073 = _4977;
    float _5075 = _4979;
    float _5077 = _4981;
    float _5079 = _4983;
    float _5081 = -_2972;
    float _5083 = _654 + _5081;
    float _5085 = -_2976;
    float _5087 = _652 + _5085;
    float _5089 = _2986 * _5083;
    float _5091 = -_2980;
    float _5093 = _656 + _5091;
    float _5095 = fma(_2990, _5087, _5089);
    float _5097 = fma(_2994, _5093, _5095);
    float _5099 = _3022 * _5097;
    float _5101 = rint(_5099);
    float _5103 = precise::max(0.0, _5101);
    float _5105 = precise::min(_5103, 3.0);
    float _5107 = trunc(_5105);
    int _5109 = int(_5107);
    bool _5111 = _5109 >= 2;
    bool _5113 = !_5111;
    float _5115 = as_type<float>(_5109);
    float _5117 = _5101;
    float _5119 = _5095;
    float _5121 = _5089;
    float _5123 = _5049;
    float _5125 = _5051;
    float _5127 = _5053;
    float _5129 = _5055;
    float _5131 = _5065;
    float _5133 = _5067;
    float _5135 = _5069;
    float _5137 = _5071;
    float _5139 = _5073;
    float _5141 = _5075;
    float _5143 = _5077;
    float _5145 = _5079;
    float _5163;
    float _5165;
    float _5167;
    float _5169;
    if (!_5113)
    {
        bool _5147 = _5109 >= 3;
        bool _5149 = !_5147;
        if (!_5149)
        {
            bool _5151 = _5109 != 3;
            _5153 = _5151;
            if (!_5153)
            {
                float _5155 = _652 + _5049;
                float _5157 = _654 + _5051;
                float _5159 = _656 + _5053;
                float _5161 = _5055 + 1.0;
                _5123 = _5155;
                _5125 = _5157;
                _5127 = _5159;
                _5129 = _5161;
                _5163 = _5057;
                _5165 = _5059;
                _5167 = _5061;
                _5169 = _5063;
                _5171 = true;
            }
        }
        else
        {
            float _5173 = _652 + _5065;
            float _5175 = _654 + _5067;
            float _5177 = _656 + _5069;
            float _5179 = _5071 + 1.0;
            _5163 = _5057;
            _5165 = _5059;
            _5167 = _5061;
            _5169 = _5063;
            _5131 = _5173;
            _5133 = _5175;
            _5135 = _5177;
            _5137 = _5179;
            _5171 = true;
        }
    }
    if ((!_5171) || _5153)
    {
        bool _5181;
        if (!_5153)
        {
            _5181 = _5109 >= 1;
        }
        if ((!_5181) || _5153)
        {
            if (!_5153)
            {
                bool _5183 = _5109 != 0;
                if (!_5183)
                {
                    float _5185 = _652 + _5057;
                    _5115 = _5185;
                }
                float _5187 = _5115;
                _5163 = _5187;
                if (!_5183)
                {
                    float _5189 = _654 + _5059;
                    _5117 = _5189;
                }
                float _5191 = _5117;
                _5165 = _5191;
                if (!_5183)
                {
                    float _5193 = _656 + _5061;
                    _5119 = _5193;
                }
                float _5195 = _5119;
                _5167 = _5195;
                if (!_5183)
                {
                    float _5197 = _5063 + 1.0;
                    _5121 = _5197;
                }
                float _5199 = _5121;
                bool _5201 = !_5183;
                _5169 = _5199;
                _5171 = _5201;
            }
            if ((!_5171) || _5153)
            {
                _5153 = false;
                _5163 = _5057;
                _5165 = _5059;
                _5167 = _5061;
                _5169 = _5063;
                _5171 = true;
            }
        }
        else
        {
            float _5203 = _652 + _5073;
            float _5205 = _654 + _5075;
            float _5207 = _656 + _5077;
            float _5209 = _5079 + 1.0;
            _5163 = _5057;
            _5165 = _5059;
            _5167 = _5061;
            _5169 = _5063;
            _5139 = _5203;
            _5141 = _5205;
            _5143 = _5207;
            _5145 = _5209;
        }
    }
    _5171 = false;
    float _5211 = _5123;
    float _5213 = _5125;
    float _5215 = _5127;
    float _5217 = _5129;
    float _5219 = _5163;
    float _5221 = _5165;
    float _5223 = _5167;
    float _5225 = _5169;
    float _5227 = _5131;
    float _5229 = _5133;
    float _5231 = _5135;
    float _5233 = _5137;
    float _5235 = _5139;
    float _5237 = _5141;
    float _5239 = _5143;
    float _5241 = _5145;
    float _5243 = -_2972;
    float _5245 = _664 + _5243;
    float _5247 = -_2976;
    float _5249 = _662 + _5247;
    float _5251 = _2986 * _5245;
    float _5253 = -_2980;
    float _5255 = _666 + _5253;
    float _5257 = fma(_2990, _5249, _5251);
    float _5259 = fma(_2994, _5255, _5257);
    float _5261 = _3022 * _5259;
    float _5263 = rint(_5261);
    float _5265 = precise::max(0.0, _5263);
    float _5267 = precise::min(_5265, 3.0);
    float _5269 = trunc(_5267);
    int _5271 = int(_5269);
    bool _5273 = _5271 >= 2;
    bool _5275 = !_5273;
    float _5277 = _5263;
    float _5279 = as_type<float>(_5271);
    float _5281 = _5251;
    float _5283 = _5257;
    float _5285 = _5211;
    float _5287 = _5213;
    float _5289 = _5215;
    float _5291 = _5217;
    float _5293 = _5227;
    float _5295 = _5229;
    float _5297 = _5231;
    float _5299 = _5233;
    float _5301 = _5235;
    float _5303 = _5237;
    float _5305 = _5239;
    float _5307 = _5241;
    float _5325;
    float _5327;
    float _5329;
    float _5331;
    if (!_5275)
    {
        bool _5309 = _5271 >= 3;
        bool _5311 = !_5309;
        if (!_5311)
        {
            bool _5313 = _5271 != 3;
            _5315 = _5313;
            if (!_5315)
            {
                float _5317 = _662 + _5211;
                float _5319 = _664 + _5213;
                float _5321 = _666 + _5215;
                float _5323 = _5217 + 1.0;
                _5285 = _5317;
                _5287 = _5319;
                _5289 = _5321;
                _5291 = _5323;
                _5325 = _5219;
                _5327 = _5221;
                _5329 = _5223;
                _5331 = _5225;
                _5333 = true;
            }
        }
        else
        {
            float _5335 = _662 + _5227;
            float _5337 = _664 + _5229;
            float _5339 = _666 + _5231;
            float _5341 = _5233 + 1.0;
            _5325 = _5219;
            _5327 = _5221;
            _5329 = _5223;
            _5331 = _5225;
            _5293 = _5335;
            _5295 = _5337;
            _5297 = _5339;
            _5299 = _5341;
            _5333 = true;
        }
    }
    if ((!_5333) || _5315)
    {
        bool _5343;
        if (!_5315)
        {
            _5343 = _5271 >= 1;
        }
        if ((!_5343) || _5315)
        {
            if (!_5315)
            {
                bool _5345 = _5271 != 0;
                if (!_5345)
                {
                    float _5347 = _662 + _5219;
                    _5277 = _5347;
                }
                float _5349 = _5277;
                _5325 = _5349;
                if (!_5345)
                {
                    float _5351 = _664 + _5221;
                    _5279 = _5351;
                }
                float _5353 = _5279;
                _5327 = _5353;
                if (!_5345)
                {
                    float _5355 = _666 + _5223;
                    _5281 = _5355;
                }
                float _5357 = _5281;
                _5329 = _5357;
                if (!_5345)
                {
                    float _5359 = _5225 + 1.0;
                    _5283 = _5359;
                }
                float _5361 = _5283;
                bool _5363 = !_5345;
                _5331 = _5361;
                _5333 = _5363;
            }
            if ((!_5333) || _5315)
            {
                _5315 = false;
                _5325 = _5219;
                _5327 = _5221;
                _5329 = _5223;
                _5331 = _5225;
                _5333 = true;
            }
        }
        else
        {
            float _5365 = _662 + _5235;
            float _5367 = _664 + _5237;
            float _5369 = _666 + _5239;
            float _5371 = _5241 + 1.0;
            _5325 = _5219;
            _5327 = _5221;
            _5329 = _5223;
            _5331 = _5225;
            _5301 = _5365;
            _5303 = _5367;
            _5305 = _5369;
            _5307 = _5371;
        }
    }
    _5333 = false;
    float _5373 = _5285;
    float _5375 = _5287;
    float _5377 = _5289;
    float _5379 = _5291;
    float _5381 = _5325;
    float _5383 = _5327;
    float _5385 = _5329;
    float _5387 = _5331;
    float _5389 = _5293;
    float _5391 = _5295;
    float _5393 = _5297;
    float _5395 = _5299;
    float _5397 = _5301;
    float _5399 = _5303;
    float _5401 = _5305;
    float _5403 = _5307;
    float _5405 = -_2972;
    float _5407 = _674 + _5405;
    float _5409 = -_2976;
    float _5411 = _672 + _5409;
    float _5413 = _2986 * _5407;
    float _5415 = -_2980;
    float _5417 = _676 + _5415;
    float _5419 = fma(_2990, _5411, _5413);
    float _5421 = fma(_2994, _5417, _5419);
    float _5423 = _3022 * _5421;
    float _5425 = rint(_5423);
    float _5427 = precise::max(0.0, _5425);
    float _5429 = precise::min(_5427, 3.0);
    float _5431 = trunc(_5429);
    int _5433 = int(_5431);
    bool _5435 = _5433 >= 2;
    bool _5437 = !_5435;
    float _5439 = as_type<float>(_5433);
    float _5441 = _5425;
    float _5443 = _5419;
    float _5445 = _5413;
    float _5447 = _5389;
    float _5449 = _5391;
    float _5451 = _5397;
    float _5453 = _5399;
    float _5455 = _5403;
    float _5457 = _5395;
    float _5459 = _5379;
    float _5461 = _5401;
    float _5463 = _5393;
    float _5465 = _5373;
    float _5467 = _5375;
    float _5469 = _5377;
    float _5487;
    float _5489;
    float _5491;
    float _5493;
    if (!_5437)
    {
        bool _5471 = _5433 >= 3;
        bool _5473 = !_5471;
        if (!_5473)
        {
            bool _5475 = _5433 != 3;
            _5477 = _5475;
            if (!_5477)
            {
                float _5479 = _672 + _5373;
                float _5481 = _674 + _5375;
                float _5483 = _676 + _5377;
                float _5485 = _5379 + 1.0;
                _5487 = _5381;
                _5489 = _5387;
                _5459 = _5485;
                _5491 = _5383;
                _5493 = _5385;
                _5465 = _5479;
                _5467 = _5481;
                _5469 = _5483;
                _5495 = true;
            }
        }
        else
        {
            float _5497 = _672 + _5389;
            float _5499 = _674 + _5391;
            float _5501 = _676 + _5393;
            float _5503 = _5395 + 1.0;
            _5447 = _5497;
            _5449 = _5499;
            _5457 = _5503;
            _5487 = _5381;
            _5489 = _5387;
            _5491 = _5383;
            _5463 = _5501;
            _5493 = _5385;
            _5495 = true;
        }
    }
    if ((!_5495) || _5477)
    {
        bool _5505;
        if (!_5477)
        {
            _5505 = _5433 >= 1;
        }
        if ((!_5505) || _5477)
        {
            if (!_5477)
            {
                bool _5507 = _5433 != 0;
                if (!_5507)
                {
                    float _5509 = _672 + _5381;
                    _5439 = _5509;
                }
                float _5511 = _5439;
                _5487 = _5511;
                if (!_5507)
                {
                    float _5513 = _674 + _5383;
                    _5441 = _5513;
                }
                float _5515 = _5441;
                _5491 = _5515;
                if (!_5507)
                {
                    float _5517 = _676 + _5385;
                    _5443 = _5517;
                }
                float _5519 = _5443;
                _5493 = _5519;
                if (!_5507)
                {
                    float _5521 = _5387 + 1.0;
                    _5445 = _5521;
                }
                float _5523 = _5445;
                bool _5525 = !_5507;
                _5489 = _5523;
                _5495 = _5525;
            }
            if ((!_5495) || _5477)
            {
                _5477 = false;
                _5487 = _5381;
                _5489 = _5387;
                _5491 = _5383;
                _5493 = _5385;
                _5495 = true;
            }
        }
        else
        {
            float _5527 = _672 + _5397;
            float _5529 = _674 + _5399;
            float _5531 = _676 + _5401;
            float _5533 = _5403 + 1.0;
            _5451 = _5527;
            _5453 = _5529;
            _5455 = _5533;
            _5487 = _5381;
            _5489 = _5387;
            _5491 = _5383;
            _5461 = _5531;
            _5493 = _5385;
        }
    }
    _5495 = false;
    float _5535 = _5447;
    float _5537 = _5449;
    float _5539 = _5451;
    float _5541 = _5453;
    float _5543 = _5455;
    float _5545 = _5457;
    float _5547 = _5487;
    float _5549 = _5489;
    float _5551 = _5459;
    float _5553 = _5491;
    float _5555 = _5461;
    float _5557 = _5463;
    float _5559 = _5493;
    float _5561 = _5465;
    float _5563 = _5467;
    float _5565 = _5469;
    float _5567 = _5535 * 6.0;
    float _5569 = _5537 * 6.0;
    float _5571 = _5539 * 6.0;
    float _5573 = _5541 * 6.0;
    float _5575 = fma(_5539, 3.0, _5567);
    float _5577 = fma(_5541, 3.0, _5569);
    float _5579 = _5543 * 4.0;
    float _5581 = fma(_5545, 4.0, _5543);
    _24[1] = as_type<uint>(_632);
    float _5583 = fma(_5547, 9.0, _5571);
    float _5585 = fma(_5549, 9.0, _5579);
    float _5587 = fma(_5551, 9.0, _5581);
    _24[0] = as_type<uint>(_636);
    float _5589 = precise::max(_536, _576);
    float _5591 = fma(_5553, 9.0, _5573);
    float _5593 = precise::max(_628, _638);
    float _5595 = _5555 * 6.0;
    float _5597 = precise::max(_516, _526);
    float _5599 = _5557 * 6.0;
    float _5601 = _5545 + _5543;
    float _5603 = precise::max(_586, _618);
    float _5605 = fma(_5559, 9.0, _5595);
    float _5607 = precise::max(_5597, _5589);
    float _5609 = fma(_5555, 3.0, _5599);
    float _5611 = precise::max(_5603, _5593);
    float _5613 = as_type<float>(_24[1]);
    float _5615 = precise::max(_450, _460);
    float _5617 = _5585 + _5545;
    float _5619 = precise::max(_470, _504);
    float _5621 = as_type<float>(_24[0]);
    float _5623 = precise::max(_648, _658);
    float _5625 = _5617 * _5587;
    float _5627 = precise::max(_5615, _5619);
    float _5629 = _5601 * 2.0;
    float _5631 = precise::max(_668, _678);
    float _5633 = -_5625;
    float _5635 = fma(_5629, _5629, _5633);
    bool _5637 = _5635 != 0.0;
    bool _5639 = isnan(_5635);
    bool _5641 = _5637 || _5639;
    bool _5643 = isnan(0.0);
    bool _5645 = _5641 || _5643;
    float _5647 = precise::max(_5623, _5631);
    float _5649 = precise::max(_5627, _5607);
    float _5651 = precise::max(_5611, _5647);
    float _5653 = fma(_5535, 3.0, _5583);
    float _5655 = fma(_5557, 3.0, _5605);
    float _5657 = fma(_5537, 3.0, _5591);
    float _5659 = fma(_5561, 9.0, _5575);
    float _5661 = fma(_5563, 9.0, _5577);
    float _5663 = fma(_5565, 9.0, _5609);
    float _5665 = precise::max(_5649, _5651);
    bool _5667 = !_5645;
    if (!_5667)
    {
        float _5669 = 1.0 / _5635;
        float _5671 = _5617 * _5659;
        float _5673 = _5653 * _5587;
        float _5675 = -_5671;
        float _5677 = fma(_5653, _5629, _5675);
        float _5679 = -_5673;
        float _5681 = fma(_5659, _5629, _5679);
        float _5683 = _5617 * _5661;
        float _5685 = _5657 * _5587;
        float _5687 = _5617 * _5663;
        float _5689 = _5655 * _5587;
        float _5691 = -_5683;
        float _5693 = fma(_5657, _5629, _5691);
        float _5695 = -_5685;
        float _5697 = fma(_5661, _5629, _5695);
        float _5699 = -_5687;
        float _5701 = fma(_5655, _5629, _5699);
        float _5703 = -_5689;
        float _5705 = fma(_5663, _5629, _5703);
        float _5707 = _5697 * _5669;
        float _5709 = _5677 * _5669;
        float _5711 = _5693 * _5669;
        float _5713 = _5701 * _5669;
        float _5715 = _5681 * _5669;
        float _5717 = _5705 * _5669;
        float _5719 = -_5707;
        float _5721 = _5711 + _5719;
        float _5723 = -_5715;
        float _5725 = _5709 + _5723;
        float _5727 = -_5717;
        float _5729 = _5713 + _5727;
        _3041 = _5725;
        _3043 = _5721;
        _3045 = _5729;
        _3047 = _5715;
        _3049 = _5709;
        _3051 = _5707;
        _3053 = _5711;
        _3055 = _5717;
        _3057 = _5713;
    }
    float _5731 = _3041;
    float _5733 = _3043;
    float _5735 = _3045;
    float _5737 = _3047;
    float _5739 = _3049;
    float _5741 = _3051;
    float _5743 = _3053;
    float _5745 = _3055;
    float _5747 = _3057;
    float _5749 = fma(_5731, 496.0, 0.5);
    float _5751 = precise::clamp(_5749, 0.0, 1.0);
    float _5753 = fma(_5733, 1008.0, 0.5);
    float _5755 = precise::clamp(_5753, 0.0, 1.0);
    float _5757 = fma(_5731, -31.0, 1.0);
    float _5759 = precise::clamp(_5757, 0.0, 1.0);
    float _5761 = fma(_5735, 496.0, 0.5);
    float _5763 = precise::clamp(_5761, 0.0, 1.0);
    float _5765 = _5751 + (-0.5);
    float _5767 = fma(_5733, -63.0, 1.0);
    float _5769 = precise::clamp(_5767, 0.0, 1.0);
    float _5771 = _5755 + (-0.5);
    float _5773 = fma(_5735, -31.0, 1.0);
    float _5775 = precise::clamp(_5773, 0.0, 1.0);
    float _5777 = _5759 * _5765;
    float _5779 = _5763 + (-0.5);
    float _5781 = _5769 * _5771;
    float _5783 = _5781 * 2.0;
    float _5785 = _5665 * 255.0;
    float _5787 = fma(_5777, -0.0322580635547637939453125, _5737);
    float _5789 = precise::clamp(_5787, 0.0, 1.0);
    float _5791 = _5775 * _5779;
    float _5793 = fma(_5777, 0.0322580635547637939453125, _5739);
    float _5795 = precise::clamp(_5793, 0.0, 1.0);
    float _5797 = fma(_5783, -0.01587301678955554962158203125, _5741);
    float _5799 = precise::clamp(_5797, 0.0, 1.0);
    float _5801 = fma(_5783, 0.01587301678955554962158203125, _5743);
    float _5803 = precise::clamp(_5801, 0.0, 1.0);
    float _5805 = fma(_5791, -0.0322580635547637939453125, _5745);
    float _5807 = precise::clamp(_5805, 0.0, 1.0);
    float _5809 = _5795 * 31.0;
    float _5811 = fma(_5791, 0.0322580635547637939453125, _5747);
    float _5813 = precise::clamp(_5811, 0.0, 1.0);
    float _5815 = _5789 * 31.0;
    float _5817 = _5799 * 63.0;
    float _5819 = _5803 * 63.0;
    float _5821 = _5807 * 31.0;
    float _5823 = _5813 * 31.0;
    float _5825 = trunc(_5785);
    float _5827 = precise::max(_5825, 0.0);
    uint _5829 = uint(_5827);
    float _5831 = precise::min(_450, _460);
    float _5833 = precise::min(_516, _526);
    float _5835 = precise::min(_586, _618);
    float _5837 = precise::min(_628, _638);
    float _5839 = rint(_5809);
    float _5841 = precise::min(_648, _658);
    float _5843 = precise::min(_668, _678);
    float _5845 = precise::min(_5835, _5837);
    float _5847 = precise::min(_5841, _5843);
    float _5849 = rint(_5819);
    float _5851 = precise::min(_5845, _5847);
    float _5853 = rint(_5815);
    float _5855 = _5839 + 0.5;
    float _5857 = rint(_5817);
    float _5859 = _5849 + 0.5;
    float _5861 = rint(_5821);
    float _5863 = _5853 + 0.5;
    float _5865 = rint(_5823);
    float _5867 = precise::min(_470, _504);
    float _5869 = precise::min(_5831, _5867);
    float _5871 = precise::min(_536, _576);
    float _5873 = trunc(_5855);
    float _5875 = precise::max(_5873, 0.0);
    uint _5877 = uint(_5875);
    float _5879 = precise::min(_5833, _5871);
    float _5881 = _5857 + 0.5;
    float _5883 = precise::min(_5869, _5879);
    float _5885 = _5865 + 0.5;
    float _5887 = trunc(_5859);
    float _5889 = precise::max(_5887, 0.0);
    uint _5891 = uint(_5889);
    float _5893 = precise::min(_5883, _5851);
    float _5895 = _5861 + 0.5;
    float _5897 = _5893 * 255.0;
    float _5899 = trunc(_5863);
    float _5901 = precise::max(_5899, 0.0);
    uint _5903 = uint(_5901);
    int _5905 = int(_5877) << 11;
    float _5907 = trunc(_5881);
    float _5909 = precise::max(_5907, 0.0);
    uint _5911 = uint(_5909);
    int _5913 = int(_5891) << 5;
    float _5915 = trunc(_5885);
    float _5917 = precise::max(_5915, 0.0);
    uint _5919 = uint(_5917);
    int _5921 = int(_5903) << 11;
    float _5923 = trunc(_5895);
    float _5925 = precise::max(_5923, 0.0);
    uint _5927 = uint(_5925);
    int _5929 = int(_5911) << 5;
    float _5931 = trunc(_5897);
    float _5933 = precise::max(_5931, 0.0);
    uint _5935 = uint(_5933);
    int _5937 = _5905 | _5913;
    int _5939 = int(_5919) | _5937;
    int _5941 = _5921 | _5929;
    int _5943 = int(_5927) | _5941;
    bool _5945 = _5939 != _5943;
    bool _5947 = _5829 > _5935;
    int _5949 = int(_5935) << 8;
    int _5951 = _5949 & 65280;
    int _5953 = int(_5911);
    int _5955 = _5949;
    int _5957 = _5913;
    int _5959 = _5951;
    int _5961 = as_type<int>(_5853);
    int _5963 = _5939;
    int _5965 = _5943;
    if (!_5945)
    {
        _5953 = _5939;
    }
    int _5967 = _5953;
    int _5969 = 255 & int(_5829);
    int _5971 = _5951 | _5969;
    int _5973 = _5967;
    if (!_5947)
    {
        _5955 = 0;
    }
    int _5975 = _5955;
    int _5977 = _5975;
    if (!_5945)
    {
        _5957 = 0;
    }
    int _5979 = _5957;
    int _5981 = _5979;
    if (!_5945)
    {
        _5959 = 0;
    }
    int _5983 = _5959;
    bool _5985 = !_5945;
    int _5987 = _5983;
    if (!_5985)
    {
        float _5989 = _5853 * 0.0322580635547637939453125;
        float _5991 = _5849 * 0.01587301678955554962158203125;
        float _5993 = _5857 * 0.01587301678955554962158203125;
        bool _5995 = uint(_5939) >= uint(_5943);
        float _5997 = _5839 * 0.0322580635547637939453125;
        float _5999 = _5865 * 0.0322580635547637939453125;
        float _6001 = _5861 * 0.0322580635547637939453125;
        bool _6003 = !_5995;
        float _6005 = _6003 ? _5991 : _5993;
        bool _6007 = !_5995;
        float _6009 = _6007 ? _5993 : _5991;
        bool _6011 = !_5995;
        float _6013 = _6011 ? _5997 : _5989;
        float _6015 = -_6005;
        float _6017 = _572 + _6015;
        bool _6019 = !_5995;
        float _6021 = _6019 ? _5989 : _5997;
        float _6023 = -_6005;
        float _6025 = _6023 + _6009;
        bool _6027 = !_5995;
        float _6029 = _6027 ? _5999 : _6001;
        float _6031 = -_6013;
        float _6033 = _570 + _6031;
        bool _6035 = !_5995;
        float _6037 = _6035 ? _6001 : _5999;
        float _6039 = -_6013;
        float _6041 = _6039 + _6021;
        float _6043 = -_6013;
        float _6045 = _530 + _6043;
        float _6047 = -_6013;
        float _6049 = _520 + _6047;
        float _6051 = -_6013;
        float _6053 = _510 + _6051;
        float _6055 = -_6013;
        float _6057 = _498 + _6055;
        float _6059 = -_6013;
        float _6061 = _464 + _6059;
        float _6063 = -_6013;
        float _6065 = _454 + _6063;
        float _6067 = -_6013;
        float _6069 = _444 + _6067;
        float _6071 = -_6013;
        float _6073 = _672 + _6071;
        float _6075 = -_6013;
        float _6077 = _662 + _6075;
        float _6079 = -_6013;
        float _6081 = _652 + _6079;
        float _6083 = -_6013;
        float _6085 = _642 + _6083;
        float _6087 = -_6013;
        float _6089 = _5613 + _6087;
        float _6091 = -_6013;
        float _6093 = _622 + _6091;
        float _6095 = -_6013;
        float _6097 = _612 + _6095;
        float _6099 = -_6013;
        float _6101 = _580 + _6099;
        float _6103 = _6025 * _6025;
        float _6105 = -_6029;
        float _6107 = _6105 + _6037;
        float _6109 = -_6005;
        float _6111 = _532 + _6109;
        float _6113 = -_6029;
        float _6115 = _574 + _6113;
        float _6117 = fma(_6041, _6041, _6103);
        float _6119 = -_6029;
        float _6121 = _534 + _6119;
        float _6123 = -_6005;
        float _6125 = _522 + _6123;
        float _6127 = -_6005;
        float _6129 = _512 + _6127;
        float _6131 = fma(_6107, _6107, _6117);
        float _6133 = -_6029;
        float _6135 = _524 + _6133;
        float _6137 = -_6005;
        float _6139 = _500 + _6137;
        float _6141 = -_6005;
        float _6143 = _466 + _6141;
        float _6145 = 1.0 / _6131;
        float _6147 = -_6005;
        float _6149 = _456 + _6147;
        float _6151 = -_6005;
        float _6153 = _446 + _6151;
        float _6155 = -_6005;
        float _6157 = _674 + _6155;
        float _6159 = -_6005;
        float _6161 = _664 + _6159;
        float _6163 = -_6005;
        float _6165 = _654 + _6163;
        float _6167 = -_6005;
        float _6169 = _644 + _6167;
        float _6171 = -_6005;
        float _6173 = _634 + _6171;
        float _6175 = -_6005;
        float _6177 = _624 + _6175;
        float _6179 = -_6005;
        float _6181 = _614 + _6179;
        float _6183 = -_6005;
        float _6185 = _582 + _6183;
        float _6187 = -_6029;
        float _6189 = _514 + _6187;
        float _6191 = -_6029;
        float _6193 = _502 + _6191;
        float _6195 = -_6029;
        float _6197 = _468 + _6195;
        float _6199 = -_6029;
        float _6201 = _458 + _6199;
        float _6203 = _6025 * _6145;
        float _6205 = _6041 * _6145;
        float _6207 = _6107 * _6145;
        float _6209 = _6203 * _6017;
        float _6211 = _6203 * _6111;
        float _6213 = _6203 * _6125;
        float _6215 = _6203 * _6129;
        float _6217 = fma(_6205, _6033, _6209);
        float _6219 = fma(_6205, _6045, _6211);
        float _6221 = fma(_6205, _6049, _6213);
        float _6223 = fma(_6205, _6053, _6215);
        float _6225 = fma(_6207, _6115, _6217);
        float _6227 = fma(_6207, _6121, _6219);
        float _6229 = fma(_6207, _6135, _6221);
        float _6231 = _6203 * _6139;
        float _6233 = _6203 * _6185;
        bool _6235 = _6225 >= 0.5;
        float _6237 = _6203 * _6143;
        bool _6239 = _6227 >= 0.5;
        float _6241 = _6203 * _6149;
        bool _6243 = _6225 >= 0.833000004291534423828125;
        float _6245 = _6203 * _6153;
        bool _6247 = _6225 >= 0.16599999368190765380859375;
        float _6249 = _6203 * _6157;
        float _6251 = _6203 * _6161;
        float _6253 = _6203 * _6165;
        float _6255 = _6203 * _6169;
        float _6257 = _6203 * _6173;
        float _6259 = _6203 * _6177;
        float _6261 = _6203 * _6181;
        int _6263 = _6243 ? 0 : 32768;
        float _6265 = fma(_6207, _6189, _6223);
        bool _6267 = _6227 >= 0.833000004291534423828125;
        float _6269 = fma(_6205, _6057, _6231);
        int _6271 = _6263;
        if (!_6235)
        {
            int _6273 = _6247 ? 49152 : 16384;
            _6271 = _6273;
        }
        int _6275 = _6271;
        float _6277 = fma(_6205, _6061, _6237);
        bool _6279 = _6227 >= 0.16599999368190765380859375;
        float _6281 = fma(_6205, _6065, _6241);
        float _6283 = fma(_6205, _6069, _6245);
        bool _6285 = _6229 >= 0.5;
        float _6287 = fma(_6205, _6073, _6249);
        float _6289 = fma(_6205, _6077, _6251);
        float _6291 = fma(_6205, _6081, _6253);
        float _6293 = fma(_6205, _6085, _6255);
        float _6295 = fma(_6205, _6089, _6257);
        float _6297 = fma(_6205, _6093, _6259);
        float _6299 = fma(_6205, _6097, _6261);
        float _6301 = fma(_6205, _6101, _6233);
        int _6303 = _6267 ? 0 : 8192;
        float _6305 = fma(_6207, _6193, _6269);
        bool _6307 = _6265 >= 0.5;
        float _6309 = fma(_6207, _6197, _6277);
        int _6311 = _6303;
        if (!_6239)
        {
            int _6313 = _6279 ? 12288 : 4096;
            _6311 = _6313;
        }
        int _6315 = _6311;
        float _6317 = fma(_6207, _6201, _6281);
        bool _6319 = _6265 >= 0.833000004291534423828125;
        float _6321 = -_6029;
        float _6323 = _676 + _6321;
        bool _6325 = _6229 >= 0.833000004291534423828125;
        float _6327 = -_6029;
        float _6329 = _666 + _6327;
        bool _6331 = _6229 >= 0.16599999368190765380859375;
        float _6333 = fma(_6207, _6323, _6287);
        int _6335 = _6319 ? 0 : 512;
        float _6337 = fma(_6207, _6329, _6289);
        bool _6339 = _6305 >= 0.5;
        float _6341 = -_6029;
        float _6343 = _656 + _6341;
        int _6345 = _6325 ? 0 : 2048;
        float _6347 = -_6029;
        float _6349 = _646 + _6347;
        bool _6351 = _6265 >= 0.16599999368190765380859375;
        float _6353 = fma(_6207, _6343, _6291);
        float _6355 = fma(_6207, _6349, _6293);
        int _6357 = _6345;
        int _6359 = _6335;
        if (!_6285)
        {
            int _6361 = _6331 ? 3072 : 1024;
            _6357 = _6361;
        }
        int _6363 = _6357;
        float _6365 = -_6029;
        float _6367 = _5621 + _6365;
        bool _6369 = _6309 >= 0.5;
        float _6371 = -_6029;
        float _6373 = _616 + _6371;
        if (!_6307)
        {
            int _6375 = _6351 ? 768 : 256;
            _6359 = _6375;
        }
        int _6377 = _6359;
        float _6379 = fma(_6207, _6367, _6295);
        bool _6381 = _6305 >= 0.833000004291534423828125;
        float _6383 = -_6029;
        float _6385 = _626 + _6383;
        bool _6387 = _6309 >= 0.833000004291534423828125;
        float _6389 = fma(_6207, _6373, _6299);
        bool _6391 = _6305 >= 0.16599999368190765380859375;
        float _6393 = fma(_6207, _6385, _6297);
        int _6395 = _6381 ? 0 : 128;
        float _6397 = -_6029;
        float _6399 = _448 + _6397;
        int _6401 = _6387 ? 0 : 32;
        float _6403 = -_6029;
        float _6405 = _584 + _6403;
        bool _6407 = _6317 >= 0.5;
        float _6409 = fma(_6207, _6399, _6283);
        bool _6411 = _6309 >= 0.16599999368190765380859375;
        float _6413 = fma(_6207, _6405, _6301);
        int _6415 = _6395;
        int _6417 = _6401;
        if (!_6339)
        {
            int _6419 = _6391 ? 192 : 64;
            _6415 = _6419;
        }
        int _6421 = _6415;
        bool _6423 = _6317 >= 0.833000004291534423828125;
        if (!_6369)
        {
            int _6425 = _6411 ? 48 : 16;
            _6417 = _6425;
        }
        int _6427 = _6417;
        int _6429 = _6423 ? 0 : 8;
        bool _6431 = _6333 >= 0.5;
        bool _6433 = _6317 >= 0.16599999368190765380859375;
        bool _6435 = _6337 >= 0.5;
        bool _6437 = _6333 >= 0.833000004291534423828125;
        int _6439 = _6429;
        if (!_6407)
        {
            int _6441 = _6433 ? 12 : 4;
            _6439 = _6441;
        }
        int _6443 = _6439;
        bool _6445 = _6337 >= 0.833000004291534423828125;
        bool _6447 = _6333 >= 0.16599999368190765380859375;
        int _6449 = _6437 ? 0 : int(0x80000000);
        bool _6451 = _6337 >= 0.16599999368190765380859375;
        int _6453 = _6445 ? 0 : 536870912;
        bool _6455 = _6353 >= 0.5;
        int _6457 = _6449;
        int _6459 = _6453;
        if (!_6431)
        {
            int _6461 = _6447 ? (-1073741824) : 1073741824;
            _6457 = _6461;
        }
        int _6463 = _6457;
        bool _6465 = _6355 >= 0.5;
        if (!_6435)
        {
            int _6467 = _6451 ? 805306368 : 268435456;
            _6459 = _6467;
        }
        int _6469 = _6459;
        bool _6471 = _6353 >= 0.833000004291534423828125;
        bool _6473 = _6355 >= 0.833000004291534423828125;
        int _6475 = _6471 ? 0 : 134217728;
        bool _6477 = _6353 >= 0.16599999368190765380859375;
        bool _6479 = _6379 >= 0.5;
        int _6481 = _6473 ? 0 : 33554432;
        bool _6483 = _6355 >= 0.16599999368190765380859375;
        int _6485 = _6475;
        int _6487 = _6481;
        if (!_6455)
        {
            int _6489 = _6477 ? 201326592 : 67108864;
            _6485 = _6489;
        }
        int _6491 = _6485;
        bool _6493 = _6379 >= 0.833000004291534423828125;
        if (!_6465)
        {
            int _6495 = _6483 ? 50331648 : 16777216;
            _6487 = _6495;
        }
        int _6497 = _6487;
        bool _6499 = _6389 >= 0.5;
        bool _6501 = _6379 >= 0.16599999368190765380859375;
        int _6503 = _6493 ? 0 : 8388608;
        bool _6505 = _6393 >= 0.5;
        bool _6507 = _6393 >= 0.833000004291534423828125;
        int _6509 = _6503;
        if (!_6479)
        {
            int _6511 = _6501 ? 12582912 : 4194304;
            _6509 = _6511;
        }
        int _6513 = _6509;
        bool _6515 = _6393 >= 0.16599999368190765380859375;
        bool _6517 = _6389 >= 0.833000004291534423828125;
        int _6519 = _6507 ? 0 : 2097152;
        bool _6521 = _6389 >= 0.16599999368190765380859375;
        int _6523 = _6517 ? 0 : 524288;
        int _6525 = _6523;
        int _6527 = _6519;
        if (!_6499)
        {
            int _6529 = _6521 ? 786432 : 262144;
            _6525 = _6529;
        }
        int _6531 = _6525;
        bool _6533 = _6409 >= 0.5;
        bool _6535 = _6413 >= 0.5;
        if (!_6505)
        {
            int _6537 = _6515 ? 3145728 : 1048576;
            _6527 = _6537;
        }
        int _6539 = _6527;
        bool _6541 = _6409 >= 0.833000004291534423828125;
        int _6543 = _6491 + _6463;
        int _6545 = _6543 + _6469;
        int _6547 = _6363 + _6275;
        int _6549 = _6547 + _6315;
        bool _6551 = _6413 >= 0.833000004291534423828125;
        int _6553 = _6541 ? 0 : 2;
        bool _6555 = _6409 >= 0.16599999368190765380859375;
        bool _6557 = _6413 >= 0.16599999368190765380859375;
        int _6559 = _6513 + _6545;
        int _6561 = _6559 + _6497;
        int _6563 = _6421 + _6549;
        int _6565 = _6563 + _6377;
        int _6567 = _6551 ? 0 : 131072;
        int _6569 = _6553;
        int _6571 = _6567;
        _5961 = 3;
        if (!_6533)
        {
            int _6573 = _6555 ? 3 : 1;
            _6569 = _6573;
        }
        int _6575 = _6569;
        if (!_6535)
        {
            int _6577 = _6557 ? 196608 : 65536;
            _6571 = _6577;
        }
        int _6579 = _6571;
        int _6581 = _6531 + _6561;
        int _6583 = _6581 + _6539;
        int _6585 = _6443 + _6565;
        int _6587 = _6585 + _6427;
        bool _6589 = !_5995;
        int _6591 = _6589 ? _5943 : _5939;
        bool _6593 = !_5995;
        int _6595 = _6593 ? _5939 : _5943;
        int _6597 = _6583 + _6579;
        int _6599 = _6587 + _6575;
        _5973 = _6591;
        _5987 = _6597;
        _5981 = _6599;
        _5963 = _6595;
    }
    int _6601 = _5973;
    int _6603 = _5961;
    int _6605 = _5987;
    int _6607 = _5981;
    int _6609 = _5963;
    int _6611 = _6603;
    if (!_5947)
    {
        _6611 = 0;
    }
    int _6613 = _6611;
    int _6615 = _6613;
    if (!_5947)
    {
        _5965 = 0;
    }
    int _6617 = _5965;
    bool _6619 = !_5947;
    int _6621 = _6617;
    if (!_6619)
    {
        float _6623 = -_5893;
        float _6625 = _5665 + _6623;
        float _6627 = -_5893;
        float _6629 = _470 + _6627;
        float _6631 = -_5893;
        float _6633 = _450 + _6631;
        float _6635 = -_5893;
        float _6637 = _460 + _6635;
        float _6639 = -_5893;
        float _6641 = _526 + _6639;
        float _6643 = 1.0 / _6625;
        float _6645 = -_5893;
        float _6647 = _536 + _6645;
        float _6649 = -_5893;
        float _6651 = _576 + _6649;
        float _6653 = -_5893;
        float _6655 = _586 + _6653;
        float _6657 = -_5893;
        float _6659 = _618 + _6657;
        float _6661 = -_5893;
        float _6663 = _628 + _6661;
        float _6665 = -_5893;
        float _6667 = _638 + _6665;
        float _6669 = -_5893;
        float _6671 = _648 + _6669;
        float _6673 = -_5893;
        float _6675 = _658 + _6673;
        float _6677 = -_5893;
        float _6679 = _668 + _6677;
        float _6681 = -_5893;
        float _6683 = _678 + _6681;
        float _6685 = _6629 * _6643;
        float _6687 = -_5893;
        float _6689 = _504 + _6687;
        float _6691 = _6633 * _6643;
        float _6693 = _6637 * _6643;
        float _6695 = _6689 * _6643;
        float _6697 = -_5893;
        float _6699 = _516 + _6697;
        float _6701 = fma(_6691, -1.99999904632568359375, 1.99999904632568359375);
        float _6703 = fma(_6691, -7.99999904632568359375, 7.99999904632568359375);
        float _6705 = fma(_6693, -1.99999904632568359375, 1.99999904632568359375);
        float _6707 = fma(_6693, -7.99999904632568359375, 7.99999904632568359375);
        float _6709 = fma(_6685, -1.99999904632568359375, 1.99999904632568359375);
        float _6711 = fma(_6685, -7.99999904632568359375, 7.99999904632568359375);
        float _6713 = _6699 * _6643;
        float _6715 = -_6691;
        float _6717 = _6715 + 0.5;
        float _6719 = -_6693;
        float _6721 = _6719 + 0.5;
        float _6723 = fma(_6695, -1.99999904632568359375, 1.99999904632568359375);
        float _6725 = fma(_6695, -7.99999904632568359375, 7.99999904632568359375);
        float _6727 = trunc(_6701);
        float _6729 = precise::max(_6727, 0.0);
        uint _6731 = uint(_6729);
        float _6733 = fma(_6713, -1.99999904632568359375, 1.99999904632568359375);
        float _6735 = fma(_6713, -7.99999904632568359375, 7.99999904632568359375);
        float _6737 = _6641 * _6643;
        float _6739 = _6647 * _6643;
        float _6741 = -_6685;
        float _6743 = _6741 + 0.5;
        float _6745 = abs(_6717);
        bool _6747 = _6745 >= 0.375;
        float _6749 = -_6695;
        float _6751 = _6749 + 0.5;
        float _6753 = trunc(_6703);
        float _6755 = precise::max(_6753, 0.0);
        uint _6757 = uint(_6755);
        float _6759 = abs(_6721);
        bool _6761 = _6759 >= 0.375;
        float _6763 = fma(_6737, -1.99999904632568359375, 1.99999904632568359375);
        float _6765 = fma(_6737, -7.99999904632568359375, 7.99999904632568359375);
        float _6767 = fma(_6739, -1.99999904632568359375, 1.99999904632568359375);
        float _6769 = fma(_6739, -7.99999904632568359375, 7.99999904632568359375);
        float _6771 = _6651 * _6643;
        float _6773 = _6655 * _6643;
        float _6775 = trunc(_6705);
        float _6777 = precise::max(_6775, 0.0);
        uint _6779 = uint(_6777);
        float _6781 = -_6713;
        float _6783 = _6781 + 0.5;
        float _6785 = abs(_6743);
        bool _6787 = _6785 >= 0.375;
        float _6789 = _6659 * _6643;
        float _6791 = fma(_6771, -1.99999904632568359375, 1.99999904632568359375);
        float _6793 = fma(_6771, -7.99999904632568359375, 7.99999904632568359375);
        float _6795 = fma(_6773, -1.99999904632568359375, 1.99999904632568359375);
        float _6797 = fma(_6773, -7.99999904632568359375, 7.99999904632568359375);
        float _6799 = trunc(_6707);
        float _6801 = precise::max(_6799, 0.0);
        uint _6803 = uint(_6801);
        float _6805 = -_6737;
        float _6807 = _6805 + 0.5;
        float _6809 = abs(_6751);
        bool _6811 = _6809 >= 0.375;
        float _6813 = -_6739;
        float _6815 = _6813 + 0.5;
        float _6817 = abs(_6783);
        bool _6819 = _6817 >= 0.375;
        float _6821 = fma(_6789, -1.99999904632568359375, 1.99999904632568359375);
        float _6823 = fma(_6789, -7.99999904632568359375, 7.99999904632568359375);
        float _6825 = _6663 * _6643;
        float _6827 = trunc(_6709);
        float _6829 = precise::max(_6827, 0.0);
        uint _6831 = uint(_6829);
        float _6833 = _6667 * _6643;
        float _6835 = -_6771;
        float _6837 = _6835 + 0.5;
        float _6839 = -_6773;
        float _6841 = _6839 + 0.5;
        float _6843 = abs(_6807);
        bool _6845 = _6843 >= 0.375;
        float _6847 = fma(_6825, -1.99999904632568359375, 1.99999904632568359375);
        float _6849 = abs(_6815);
        bool _6851 = _6849 >= 0.375;
        float _6853 = fma(_6825, -7.99999904632568359375, 7.99999904632568359375);
        float _6855 = trunc(_6711);
        float _6857 = precise::max(_6855, 0.0);
        uint _6859 = uint(_6857);
        float _6861 = fma(_6833, -1.99999904632568359375, 1.99999904632568359375);
        float _6863 = fma(_6833, -7.99999904632568359375, 7.99999904632568359375);
        float _6865 = _6671 * _6643;
        float _6867 = _6675 * _6643;
        float _6869 = -_6789;
        float _6871 = _6869 + 0.5;
        int _6873 = int(_6731);
        int _6875 = int(_6779);
        int _6877 = int(_6831);
        if (!_6747)
        {
            int _6879 = int(_6757) + 1;
            _6873 = _6879;
        }
        int _6881 = _6873;
        float _6883 = _6679 * _6643;
        float _6885 = trunc(_6723);
        float _6887 = precise::max(_6885, 0.0);
        uint _6889 = uint(_6887);
        int _6891 = int(_6889);
        if (!_6761)
        {
            int _6893 = int(_6803) + 1;
            _6875 = _6893;
        }
        int _6895 = _6875;
        float _6897 = _6683 * _6643;
        float _6899 = abs(_6837);
        bool _6901 = _6899 >= 0.375;
        float _6903 = fma(_6865, -1.99999904632568359375, 1.99999904632568359375);
        float _6905 = abs(_6841);
        bool _6907 = _6905 >= 0.375;
        float _6909 = fma(_6865, -7.99999904632568359375, 7.99999904632568359375);
        float _6911 = fma(_6867, -1.99999904632568359375, 1.99999904632568359375);
        float _6913 = trunc(_6725);
        float _6915 = precise::max(_6913, 0.0);
        uint _6917 = uint(_6915);
        float _6919 = fma(_6867, -7.99999904632568359375, 7.99999904632568359375);
        if (!_6787)
        {
            int _6921 = int(_6859) + 1;
            _6877 = _6921;
        }
        int _6923 = _6877;
        float _6925 = -_6825;
        float _6927 = _6925 + 0.5;
        float _6929 = -_6833;
        float _6931 = _6929 + 0.5;
        float _6933 = abs(_6871);
        bool _6935 = _6933 >= 0.375;
        float _6937 = fma(_6883, -1.99999904632568359375, 1.99999904632568359375);
        float _6939 = -_6865;
        float _6941 = _6939 + 0.5;
        float _6943 = trunc(_6733);
        float _6945 = precise::max(_6943, 0.0);
        uint _6947 = uint(_6945);
        float _6949 = -_6867;
        float _6951 = _6949 + 0.5;
        float _6953 = fma(_6883, -7.99999904632568359375, 7.99999904632568359375);
        float _6955 = fma(_6897, -1.99999904632568359375, 1.99999904632568359375);
        float _6957 = -_6883;
        float _6959 = _6957 + 0.5;
        int _6961 = _6895 << 3;
        float _6963 = trunc(_6735);
        float _6965 = precise::max(_6963, 0.0);
        uint _6967 = uint(_6965);
        int _6969 = int(_6947);
        if (!_6811)
        {
            int _6971 = int(_6917) + 1;
            _6891 = _6971;
        }
        int _6973 = _6891;
        float _6975 = fma(_6897, -7.99999904632568359375, 7.99999904632568359375);
        float _6977 = abs(_6927);
        bool _6979 = _6977 >= 0.375;
        float _6981 = -_6897;
        float _6983 = _6981 + 0.5;
        int _6985 = _6881 | _6961;
        int _6987 = _6973 << 9;
        float _6989 = trunc(_6763);
        float _6991 = precise::max(_6989, 0.0);
        uint _6993 = uint(_6991);
        float _6995 = trunc(_6765);
        float _6997 = precise::max(_6995, 0.0);
        uint _6999 = uint(_6997);
        int _7001 = int(_6993);
        if (!_6819)
        {
            int _7003 = int(_6967) + 1;
            _6969 = _7003;
        }
        int _7005 = _6969;
        float _7007 = abs(_6931);
        bool _7009 = _7007 >= 0.375;
        float _7011 = trunc(_6767);
        float _7013 = precise::max(_7011, 0.0);
        uint _7015 = uint(_7013);
        float _7017 = trunc(_6769);
        float _7019 = precise::max(_7017, 0.0);
        uint _7021 = uint(_7019);
        int _7023 = int(_7015);
        if (!_6845)
        {
            int _7025 = int(_6999) + 1;
            _7001 = _7025;
        }
        int _7027 = _7001;
        float _7029 = abs(_6941);
        bool _7031 = _7029 >= 0.375;
        int _7033 = _7027 << 15;
        float _7035 = trunc(_6791);
        float _7037 = precise::max(_7035, 0.0);
        uint _7039 = uint(_7037);
        float _7041 = trunc(_6793);
        float _7043 = precise::max(_7041, 0.0);
        uint _7045 = uint(_7043);
        int _7047 = int(_7039);
        if (!_6851)
        {
            int _7049 = int(_7021) + 1;
            _7023 = _7049;
        }
        int _7051 = _7023;
        float _7053 = abs(_6951);
        bool _7055 = _7053 >= 0.375;
        float _7057 = trunc(_6795);
        float _7059 = precise::max(_7057, 0.0);
        uint _7061 = uint(_7059);
        float _7063 = trunc(_6797);
        float _7065 = precise::max(_7063, 0.0);
        uint _7067 = uint(_7065);
        int _7069 = int(_7061);
        if (!_6901)
        {
            int _7071 = int(_7045) + 1;
            _7047 = _7071;
        }
        int _7073 = _7047;
        float _7075 = abs(_6959);
        bool _7077 = _7075 >= 0.375;
        int _7079 = _7073 << 21;
        float _7081 = trunc(_6821);
        float _7083 = precise::max(_7081, 0.0);
        uint _7085 = uint(_7083);
        float _7087 = trunc(_6823);
        float _7089 = precise::max(_7087, 0.0);
        uint _7091 = uint(_7089);
        int _7093 = int(_7085);
        if (!_6907)
        {
            int _7095 = int(_7067) + 1;
            _7069 = _7095;
        }
        int _7097 = _7069;
        float _7099 = abs(_6983);
        bool _7101 = _7099 >= 0.375;
        float _7103 = trunc(_6847);
        float _7105 = precise::max(_7103, 0.0);
        uint _7107 = uint(_7105);
        float _7109 = trunc(_6853);
        float _7111 = precise::max(_7109, 0.0);
        uint _7113 = uint(_7111);
        int _7115 = int(_7107);
        if (!_6935)
        {
            int _7117 = int(_7091) + 1;
            _7093 = _7117;
        }
        int _7119 = _7093;
        int _7121 = _7119 << 3;
        float _7123 = trunc(_6861);
        float _7125 = precise::max(_7123, 0.0);
        uint _7127 = uint(_7125);
        int _7129 = _7097 | _7121;
        float _7131 = trunc(_6863);
        float _7133 = precise::max(_7131, 0.0);
        uint _7135 = uint(_7133);
        int _7137 = int(_7127);
        if (!_6979)
        {
            int _7139 = int(_7113) + 1;
            _7115 = _7139;
        }
        int _7141 = _7115;
        int _7143 = _7141 << 6;
        float _7145 = trunc(_6903);
        float _7147 = precise::max(_7145, 0.0);
        uint _7149 = uint(_7147);
        float _7151 = trunc(_6909);
        float _7153 = precise::max(_7151, 0.0);
        uint _7155 = uint(_7153);
        int _7157 = int(_7149);
        if (!_7009)
        {
            int _7159 = int(_7135) + 1;
            _7137 = _7159;
        }
        int _7161 = _7137;
        int _7163 = _7161 << 9;
        float _7165 = trunc(_6911);
        float _7167 = precise::max(_7165, 0.0);
        uint _7169 = uint(_7167);
        int _7171 = _7129 | _7143;
        int _7173 = _7163 | _7171;
        float _7175 = trunc(_6919);
        float _7177 = precise::max(_7175, 0.0);
        uint _7179 = uint(_7177);
        int _7181 = int(_7169);
        if (!_7031)
        {
            int _7183 = int(_7155) + 1;
            _7157 = _7183;
        }
        int _7185 = _7157;
        float _7187 = trunc(_6937);
        float _7189 = precise::max(_7187, 0.0);
        uint _7191 = uint(_7189);
        float _7193 = trunc(_6953);
        float _7195 = precise::max(_7193, 0.0);
        uint _7197 = uint(_7195);
        int _7199 = int(_7191);
        if (!_7055)
        {
            int _7201 = int(_7179) + 1;
            _7181 = _7201;
        }
        int _7203 = _7181;
        int _7205 = _7203 << 15;
        float _7207 = trunc(_6955);
        float _7209 = precise::max(_7207, 0.0);
        uint _7211 = uint(_7209);
        float _7213 = trunc(_6975);
        float _7215 = precise::max(_7213, 0.0);
        uint _7217 = uint(_7215);
        int _7219 = _6923 << 6;
        int _7221 = _7185 << 12;
        int _7223 = _6985 | _7219;
        int _7225 = _6987 | _7223;
        int _7227 = _7005 << 12;
        int _7229 = int(_7211);
        if (!_7077)
        {
            int _7231 = int(_7197) + 1;
            _7199 = _7231;
        }
        int _7233 = _7199;
        int _7235 = _7225 | _7227;
        int _7237 = _7033 | _7235;
        int _7239 = _7173 | _7221;
        int _7241 = _7205 | _7239;
        int _7243 = _7051 << 18;
        if (!_7101)
        {
            int _7245 = int(_7217) + 1;
            _7229 = _7245;
        }
        int _7247 = _7229;
        int _7249 = _7233 << 18;
        int _7251 = _7247 << 21;
        int _7253 = _7237 | _7243;
        int _7255 = _7079 | _7253;
        int _7257 = _7241 | _7249;
        int _7259 = _7251 | _7257;
        uint _7261 = uint(int(uint(_7255) >> uint(16)));
        int _7263 = _7259 << 8;
        uint _7265 = uint(int(uint(_7259) >> uint(8)));
        int _7267 = 65280 & _7263;
        int _7269 = int(_7261) | _7267;
        int _7271 = _7255 << 16;
        int _7273 = int(_7265) << 16;
        _5977 = _7271;
        _6621 = _7273;
        _6615 = _7269;
    }
    int _7275 = _5977;
    int _7277 = _6621;
    int _7279 = _6615;
    int _7281 = _6601 & 65535;
    int _7283 = _7275 | _5971;
    int _7285 = _7277 | _7279;
    int _7287 = _6605 | _6607;
    int _7289 = _6609 << 16;
    int _7291 = _7289 + _7281;
    out.m_41.x = as_type<float>(_7283);
    out.m_41.y = as_type<float>(_7285);
    out.m_41.z = as_type<float>(_7291);
    out.m_41.w = as_type<float>(_7287);
    return out;
}


struct main0_out_u
{
    uint4 m_41 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5495 = false;
    bool _5477 = false;
    bool _5333 = false;
    bool _5315 = false;
    bool _5171 = false;
    bool _5153 = false;
    bool _5009 = false;
    bool _4991 = false;
    bool _4847 = false;
    bool _4829 = false;
    bool _4685 = false;
    bool _4667 = false;
    bool _4523 = false;
    bool _4505 = false;
    bool _4361 = false;
    bool _4343 = false;
    bool _4199 = false;
    bool _4181 = false;
    bool _4037 = false;
    bool _4019 = false;
    bool _3875 = false;
    bool _3857 = false;
    bool _3713 = false;
    bool _3695 = false;
    bool _3551 = false;
    bool _3533 = false;
    bool _3389 = false;
    bool _3371 = false;
    bool _3227 = false;
    bool _3209 = false;
    bool _3099 = false;
    bool _3065 = false;
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_36.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_36.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_34.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_36.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_38.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_38.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_38.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = 1.0 / _48;
    float _106 = _104 * _54;
    float _108 = _104 * _60;
    float _110 = _104 * _66;
    float _112 = _104 * _72;
    float _114 = _104 * _78;
    float _116 = _104 * _84;
    float _118 = _108 + _110;
    float _120 = _106 + _112;
    float _122 = abs(_108);
    float _124 = abs(_106);
    float _126 = precise::max(_122, _124);
    float _128 = _114 + _116;
    float _130 = fma(_110, 2.0, _108);
    float _132 = fma(_112, 2.0, _106);
    float _134 = abs(_118);
    float _136 = abs(_120);
    float _138 = precise::max(_134, _136);
    float _140 = _104 * _96;
    float _142 = abs(_114);
    float _144 = precise::max(_142, _126);
    float _146 = _104 * _90;
    float _148 = abs(_128);
    float _150 = precise::max(_148, _138);
    float _152 = _104 * _102;
    float _154 = fma(_116, 2.0, _114);
    float _156 = in.m_34.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = abs(_130);
    float _164 = abs(_132);
    float _166 = precise::max(_162, _164);
    float _168 = _108 + _146;
    float _170 = _106 + _140;
    float _172 = _114 + _152;
    float _174 = abs(_154);
    float _176 = precise::max(_174, _166);
    float _178 = fma(_146, 3.0, _108);
    float _180 = fma(_140, 3.0, _106);
    float _182 = abs(_168);
    float _184 = abs(_170);
    float _186 = precise::max(_182, _184);
    float _188 = fma(_146, 2.0, _108);
    float _190 = fma(_140, 2.0, _106);
    float _192 = 1.0 / _144;
    float _194 = abs(_172);
    float _196 = precise::max(_194, _186);
    float _198 = fma(_152, 3.0, _114);
    float _200 = _188 + _110;
    float _202 = abs(_188);
    float _204 = abs(_190);
    float _206 = precise::max(_202, _204);
    float _208 = _190 + _112;
    float _210 = fma(_112, 3.0, _106);
    float _212 = fma(_116, 3.0, _114);
    float _214 = 1.0 / _196;
    float _216 = fma(_152, 2.0, _114);
    float _218 = abs(_178);
    float _220 = abs(_180);
    float _222 = precise::max(_218, _220);
    float _224 = _168 + _110;
    float _226 = _170 + _112;
    float _228 = _216 + _116;
    float _230 = abs(_198);
    float _232 = precise::max(_230, _222);
    float _234 = fma(_110, 2.0, _168);
    float _236 = abs(_216);
    float _238 = precise::max(_236, _206);
    float _240 = 1.0 / _150;
    float _242 = _106 * _192;
    float _244 = _114 * _192;
    float _246 = fma(_112, 2.0, _170);
    float _248 = _104 * _160;
    float _250 = fma(_110, 3.0, _188);
    float _252 = _178 + _110;
    float _254 = _172 * _214;
    float _256 = 1.0 / _232;
    float _258 = fma(_110, 3.0, _108);
    float _260 = _108 * _192;
    float _262 = fma(_110, 2.0, _188);
    float _264 = fma(_110, 2.0, _178);
    float _266 = fma(_110, 3.0, _178);
    float _268 = fma(_116, 3.0, _216);
    float _270 = fma(_116, 2.0, _216);
    float _272 = 1.0 / _238;
    float _274 = abs(_200);
    float _276 = abs(_208);
    float _278 = precise::max(_274, _276);
    float _280 = _172 + _116;
    float _282 = fma(_116, 2.0, _172);
    float _284 = fma(_112, 2.0, _190);
    float _286 = abs(_228);
    float _288 = precise::max(_286, _278);
    float _290 = _198 + _116;
    float _292 = fma(_116, 2.0, _198);
    float _294 = 1.0 / _176;
    float _296 = fma(_116, 3.0, _172);
    float _298 = _180 + _112;
    float _300 = fma(_116, 3.0, _198);
    float _302 = _178 * _256;
    float _304 = _198 * _256;
    float _306 = abs(_224);
    float _308 = abs(_226);
    float _310 = precise::max(_306, _308);
    float _312 = _118 * _240;
    float _314 = 1.0 / _288;
    float _316 = fma(_112, 3.0, _170);
    float _318 = _170 * _214;
    float _320 = _216 * _272;
    float _322 = _188 * _272;
    float _324 = abs(_280);
    float _326 = precise::max(_324, _310);
    float _328 = _120 * _240;
    float _330 = abs(_258);
    float _332 = abs(_210);
    float _334 = precise::max(_330, _332);
    float _336 = _130 * _294;
    float _338 = fma(_110, 3.0, _168);
    float _340 = _168 * _214;
    float _342 = fma(_112, 3.0, _190);
    float _344 = _132 * _294;
    float _346 = _154 * _294;
    float _348 = _190 * _272;
    float _350 = fma(_112, 2.0, _180);
    float _352 = abs(_250);
    float _354 = abs(_342);
    float _356 = precise::max(_352, _354);
    float _358 = fma(_112, 3.0, _180);
    float _360 = _180 * _256;
    float _362 = rint(_248);
    float _364 = precise::max(_362, 0.0);
    uint _367 = uint(_364);
    uint _369 = clamp(_367, 0u, 65535u);
    float _371 = abs(_268);
    float _373 = precise::max(_371, _356);
    float _375 = _200 * _314;
    float _377 = abs(_338);
    float _379 = abs(_316);
    float _381 = precise::max(_377, _379);
    float _383 = _208 * _314;
    float _385 = abs(_252);
    float _387 = abs(_298);
    float _389 = precise::max(_385, _387);
    float _391 = _228 * _314;
    float _393 = abs(_212);
    float _395 = precise::max(_393, _334);
    float _397 = 1.0 / _373;
    float _399 = abs(_296);
    float _401 = precise::max(_399, _381);
    float _403 = _128 * _240;
    float _405 = abs(_264);
    float _407 = abs(_350);
    float _409 = precise::max(_405, _407);
    float _411 = abs(_290);
    float _413 = precise::max(_411, _389);
    float _415 = abs(_234);
    float _417 = abs(_246);
    float _419 = precise::max(_415, _417);
    float _421 = 1.0 / _326;
    float _423 = abs(_292);
    float _425 = precise::max(_423, _409);
    float _427 = abs(_266);
    float _429 = abs(_358);
    float _431 = precise::max(_427, _429);
    float _433 = _342 * _397;
    float _435 = 1.0 / _395;
    float _437 = abs(_282);
    float _439 = precise::max(_437, _419);
    float4 _7820 = float4(_260, _242, _244, float(int(_369)));
    float4 _7824 = select(_7820, float4(0.0), isnan(_7820));
    float4 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7824.xyz, uint(rint(_7824.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7824.xyz, uint(rint(_7824.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _444 = _442.x;
    float _446 = _442.y;
    float _448 = _442.z;
    float _450 = _442.w;
    float4 _7845 = float4(_340, _318, _254, float(int(_369)));
    float4 _7847 = select(_7845, float4(0.0), isnan(_7845));
    float4 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7847.xyz, uint(rint(_7847.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7847.xyz, uint(rint(_7847.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _454 = _452.x;
    float _456 = _452.y;
    float _458 = _452.z;
    float _460 = _452.w;
    float4 _7867 = float4(_322, _348, _320, float(int(_369)));
    float4 _7869 = select(_7867, float4(0.0), isnan(_7867));
    float4 _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7869.xyz, uint(rint(_7869.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7869.xyz, uint(rint(_7869.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _464 = _462.x;
    float _466 = _462.y;
    float _468 = _462.z;
    float _470 = _462.w;
    float _472 = abs(_300);
    float _474 = precise::max(_472, _431);
    float _476 = _224 * _421;
    float _478 = 1.0 / _401;
    float _480 = abs(_262);
    float _482 = abs(_284);
    float _484 = precise::max(_480, _482);
    float _486 = _226 * _421;
    float _488 = _280 * _421;
    float _490 = abs(_270);
    float _492 = precise::max(_490, _484);
    float _494 = 1.0 / _413;
    float4 _7919 = float4(_302, _360, _304, float(int(_369)));
    float4 _7921 = select(_7919, float4(0.0), isnan(_7919));
    float4 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7921.xyz, uint(rint(_7921.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7921.xyz, uint(rint(_7921.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _498 = _496.x;
    float _500 = _496.y;
    float _502 = _496.z;
    float _504 = _496.w;
    float _506 = 1.0 / _425;
    float4 _7943 = float4(_312, _328, _403, float(int(_369)));
    float4 _7945 = select(_7943, float4(0.0), isnan(_7943));
    float4 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7945.xyz, uint(rint(_7945.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7945.xyz, uint(rint(_7945.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _510 = _508.x;
    float _512 = _508.y;
    float _514 = _508.z;
    float _516 = _508.w;
    float4 _7965 = float4(_476, _486, _488, float(int(_369)));
    float4 _7967 = select(_7965, float4(0.0), isnan(_7965));
    float4 _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7967.xyz, uint(rint(_7967.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7967.xyz, uint(rint(_7967.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _520 = _518.x;
    float _522 = _518.y;
    float _524 = _518.z;
    float _526 = _518.w;
    float4 _7987 = float4(_375, _383, _391, float(int(_369)));
    float4 _7989 = select(_7987, float4(0.0), isnan(_7987));
    float4 _528 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _7989.xyz, uint(rint(_7989.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _7989.xyz, uint(rint(_7989.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _530 = _528.x;
    float _532 = _528.y;
    float _534 = _528.z;
    float _536 = _528.w;
    float _538 = _258 * _435;
    float _540 = _338 * _478;
    float _542 = _316 * _478;
    float _544 = _296 * _478;
    float _546 = 1.0 / _474;
    float _548 = _252 * _494;
    float _550 = _298 * _494;
    float _552 = _290 * _494;
    float _554 = _210 * _435;
    float _556 = _212 * _435;
    float _558 = 1.0 / _439;
    float _560 = _264 * _506;
    float _562 = _350 * _506;
    float _564 = _292 * _506;
    float _566 = 1.0 / _492;
    float4 _8051 = float4(_548, _550, _552, float(int(_369)));
    float4 _8053 = select(_8051, float4(0.0), isnan(_8051));
    float4 _568 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8053.xyz, uint(rint(_8053.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8053.xyz, uint(rint(_8053.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _570 = _568.x;
    float _572 = _568.y;
    float _574 = _568.z;
    float _576 = _568.w;
    float4 _8073 = float4(_336, _344, _346, float(int(_369)));
    float4 _8075 = select(_8073, float4(0.0), isnan(_8073));
    float4 _578 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8075.xyz, uint(rint(_8075.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8075.xyz, uint(rint(_8075.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _580 = _578.x;
    float _582 = _578.y;
    float _584 = _578.z;
    float _586 = _578.w;
    float _588 = _358 * _546;
    float _590 = _300 * _546;
    float _592 = _250 * _397;
    float _594 = _234 * _558;
    float _596 = _246 * _558;
    float _598 = _282 * _558;
    float _600 = _268 * _397;
    float _602 = _266 * _546;
    float _604 = _262 * _566;
    float _606 = _284 * _566;
    float _608 = _270 * _566;
    float4 _8128 = float4(_594, _596, _598, float(int(_369)));
    float4 _8130 = select(_8128, float4(0.0), isnan(_8128));
    float4 _610 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8130.xyz, uint(rint(_8130.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8130.xyz, uint(rint(_8130.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _612 = _610.x;
    float _614 = _610.y;
    float _616 = _610.z;
    float _618 = _610.w;
    float4 _8150 = float4(_604, _606, _608, float(int(_369)));
    float4 _8152 = select(_8150, float4(0.0), isnan(_8150));
    float4 _620 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8152.xyz, uint(rint(_8152.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8152.xyz, uint(rint(_8152.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _622 = _620.x;
    float _624 = _620.y;
    float _626 = _620.z;
    float _628 = _620.w;
    float4 _8172 = float4(_560, _562, _564, float(int(_369)));
    float4 _8174 = select(_8172, float4(0.0), isnan(_8172));
    float4 _630 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8174.xyz, uint(rint(_8174.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8174.xyz, uint(rint(_8174.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _632 = _630.x;
    float _634 = _630.y;
    float _636 = _630.z;
    float _638 = _630.w;
    float4 _8194 = float4(_538, _554, _556, float(int(_369)));
    float4 _8196 = select(_8194, float4(0.0), isnan(_8194));
    float4 _640 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8196.xyz, uint(rint(_8196.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8196.xyz, uint(rint(_8196.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _642 = _640.x;
    float _644 = _640.y;
    float _646 = _640.z;
    float _648 = _640.w;
    float4 _8216 = float4(_540, _542, _544, float(int(_369)));
    float4 _8218 = select(_8216, float4(0.0), isnan(_8216));
    float4 _650 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8218.xyz, uint(rint(_8218.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8218.xyz, uint(rint(_8218.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _652 = _650.x;
    float _654 = _650.y;
    float _656 = _650.z;
    float _658 = _650.w;
    float4 _8238 = float4(_592, _433, _600, float(int(_369)));
    float4 _8240 = select(_8238, float4(0.0), isnan(_8238));
    float4 _660 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8240.xyz, uint(rint(_8240.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8240.xyz, uint(rint(_8240.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _662 = _660.x;
    float _664 = _660.y;
    float _666 = _660.z;
    float _668 = _660.w;
    float4 _8260 = float4(_602, _588, _590, float(int(_369)));
    float4 _8262 = select(_8260, float4(0.0), isnan(_8260));
    float4 _670 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _8262.xyz, uint(rint(_8262.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _8262.xyz, uint(rint(_8262.w)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _672 = _670.x;
    float _674 = _670.y;
    float _676 = _670.z;
    float _678 = _670.w;
    float _680 = _446 + _456;
    float _682 = _444 + _454;
    float _684 = _448 + _458;
    float _686 = _466 + _680;
    float _688 = _464 + _682;
    float _690 = _468 + _684;
    float _692 = _500 + _686;
    float _694 = _498 + _688;
    float _696 = _502 + _690;
    float _698 = _512 + _692;
    float _700 = _510 + _694;
    float _702 = _514 + _696;
    float _704 = _522 + _698;
    float _706 = _520 + _700;
    float _708 = _524 + _702;
    float _710 = _532 + _704;
    float _712 = _530 + _706;
    float _714 = _534 + _708;
    float _716 = _572 + _710;
    float _718 = _570 + _712;
    float _720 = _574 + _714;
    float _722 = _582 + _716;
    float _724 = _580 + _718;
    float _726 = _584 + _720;
    float _728 = _614 + _722;
    float _730 = _612 + _724;
    float _732 = _616 + _726;
    float _734 = _624 + _728;
    float _736 = _622 + _730;
    float _738 = _626 + _732;
    float _740 = _634 + _734;
    float _742 = _632 + _736;
    float _744 = _636 + _738;
    float _746 = _644 + _740;
    float _748 = _642 + _742;
    float _750 = _646 + _744;
    float _752 = _654 + _746;
    float _754 = _652 + _748;
    float _756 = _656 + _750;
    float _758 = _664 + _752;
    float _760 = _662 + _754;
    float _762 = _666 + _756;
    float _764 = _674 + _758;
    float _766 = _672 + _760;
    float _768 = _676 + _762;
    float _770 = fma(_764, -0.0625, _456);
    float _772 = fma(_766, -0.0625, _454);
    float _774 = fma(_768, -0.0625, _458);
    float _776 = fma(_764, -0.0625, _446);
    float _778 = _770 * _770;
    float _780 = _772 * _770;
    float _782 = _770 * _774;
    float _784 = fma(_766, -0.0625, _444);
    float _786 = fma(_768, -0.0625, _448);
    float _788 = _772 * _772;
    float _790 = _772 * _774;
    float _792 = fma(_776, _776, _778);
    float _794 = fma(_784, _776, _780);
    float _796 = fma(_776, _786, _782);
    float _798 = fma(_784, _784, _788);
    float _800 = fma(_784, _786, _790);
    float _802 = _774 * _774;
    float _804 = fma(_764, -0.0625, _466);
    float _806 = fma(_766, -0.0625, _464);
    float _808 = fma(_768, -0.0625, _468);
    float _810 = fma(_786, _786, _802);
    float _812 = fma(_804, _804, _792);
    float _814 = fma(_806, _804, _794);
    float _816 = fma(_804, _808, _796);
    float _818 = fma(_806, _806, _798);
    float _820 = fma(_806, _808, _800);
    float _822 = fma(_764, -0.0625, _500);
    float _824 = fma(_766, -0.0625, _498);
    float _826 = fma(_768, -0.0625, _502);
    float _828 = fma(_808, _808, _810);
    float _830 = fma(_822, _822, _812);
    float _832 = fma(_824, _822, _814);
    float _834 = fma(_822, _826, _816);
    float _836 = fma(_824, _824, _818);
    float _838 = fma(_824, _826, _820);
    float _840 = fma(_764, -0.0625, _512);
    float _842 = fma(_766, -0.0625, _510);
    float _844 = fma(_768, -0.0625, _514);
    float _846 = fma(_826, _826, _828);
    float _848 = fma(_840, _840, _830);
    float _850 = fma(_842, _840, _832);
    float _852 = fma(_840, _844, _834);
    float _854 = fma(_842, _842, _836);
    float _856 = fma(_842, _844, _838);
    float _858 = fma(_764, -0.0625, _522);
    float _860 = fma(_766, -0.0625, _520);
    float _862 = fma(_768, -0.0625, _524);
    float _864 = fma(_844, _844, _846);
    float _866 = fma(_858, _858, _848);
    float _868 = fma(_860, _858, _850);
    float _870 = fma(_858, _862, _852);
    float _872 = fma(_860, _860, _854);
    float _874 = fma(_860, _862, _856);
    float _876 = fma(_764, -0.0625, _532);
    float _878 = fma(_766, -0.0625, _530);
    float _880 = fma(_768, -0.0625, _534);
    float _882 = fma(_862, _862, _864);
    float _884 = fma(_876, _876, _866);
    float _886 = fma(_878, _876, _868);
    float _888 = fma(_876, _880, _870);
    float _890 = fma(_878, _878, _872);
    float _892 = fma(_878, _880, _874);
    float _894 = fma(_764, -0.0625, _572);
    float _896 = fma(_766, -0.0625, _570);
    float _898 = fma(_768, -0.0625, _574);
    float _900 = fma(_880, _880, _882);
    float _902 = fma(_894, _894, _884);
    float _904 = fma(_896, _894, _886);
    float _906 = fma(_894, _898, _888);
    float _908 = fma(_896, _896, _890);
    float _910 = fma(_896, _898, _892);
    float _912 = fma(_764, -0.0625, _582);
    float _914 = fma(_766, -0.0625, _580);
    float _916 = fma(_768, -0.0625, _584);
    float _918 = fma(_898, _898, _900);
    float _920 = fma(_912, _912, _902);
    float _922 = fma(_914, _912, _904);
    float _924 = fma(_912, _916, _906);
    float _926 = fma(_914, _914, _908);
    float _928 = fma(_914, _916, _910);
    float _930 = fma(_764, -0.0625, _614);
    float _932 = fma(_766, -0.0625, _612);
    float _934 = fma(_768, -0.0625, _616);
    float _936 = fma(_916, _916, _918);
    float _938 = fma(_930, _930, _920);
    float _940 = fma(_932, _930, _922);
    float _942 = fma(_930, _934, _924);
    float _944 = fma(_932, _932, _926);
    float _946 = fma(_932, _934, _928);
    float _948 = fma(_764, -0.0625, _624);
    float _950 = fma(_766, -0.0625, _622);
    float _952 = fma(_768, -0.0625, _626);
    float _954 = fma(_934, _934, _936);
    float _956 = fma(_948, _948, _938);
    float _958 = fma(_950, _948, _940);
    float _960 = fma(_948, _952, _942);
    float _962 = fma(_950, _950, _944);
    float _964 = fma(_950, _952, _946);
    float _966 = fma(_764, -0.0625, _634);
    float _968 = fma(_766, -0.0625, _632);
    float _970 = fma(_768, -0.0625, _636);
    float _972 = fma(_952, _952, _954);
    float _974 = fma(_966, _966, _956);
    float _976 = fma(_968, _966, _958);
    float _978 = fma(_966, _970, _960);
    float _980 = fma(_968, _968, _962);
    float _982 = fma(_968, _970, _964);
    float _984 = fma(_764, -0.0625, _644);
    float _986 = fma(_766, -0.0625, _642);
    float _988 = fma(_768, -0.0625, _646);
    float _990 = fma(_970, _970, _972);
    float _992 = fma(_984, _984, _974);
    float _994 = fma(_986, _984, _976);
    float _996 = fma(_984, _988, _978);
    float _998 = fma(_986, _986, _980);
    float _1000 = fma(_986, _988, _982);
    float _1002 = fma(_764, -0.0625, _654);
    float _1004 = fma(_766, -0.0625, _652);
    float _1006 = fma(_768, -0.0625, _656);
    float _1008 = fma(_988, _988, _990);
    float _1010 = fma(_1002, _1002, _992);
    float _1012 = fma(_1004, _1002, _994);
    float _1014 = fma(_1002, _1006, _996);
    float _1016 = fma(_1004, _1004, _998);
    float _1018 = fma(_1004, _1006, _1000);
    float _1020 = fma(_764, -0.0625, _664);
    float _1022 = fma(_766, -0.0625, _662);
    float _1024 = fma(_768, -0.0625, _666);
    float _1026 = fma(_766, -0.0625, _672);
    float _1028 = fma(_1020, _1020, _1010);
    float _1030 = fma(_1022, _1020, _1012);
    float _1032 = fma(_1020, _1024, _1014);
    float _1034 = fma(_764, -0.0625, _674);
    float _1036 = fma(_1006, _1006, _1008);
    float _1038 = fma(_768, -0.0625, _676);
    float _1040 = fma(_1022, _1022, _1016);
    float _1042 = fma(_1034, _1034, _1028);
    float _1044 = fma(_1026, _1034, _1030);
    float _1046 = fma(_1022, _1024, _1018);
    float _1048 = fma(_1034, _1038, _1032);
    float _1050 = fma(_1026, _1026, _1040);
    float _1052 = _1042 + _1044;
    float _1054 = fma(_1024, _1024, _1036);
    float _1056 = fma(_1026, _1038, _1046);
    float _1058 = _1050 + _1044;
    float _1060 = _1048 + _1052;
    float _1062 = fma(_1038, _1038, _1054);
    float _1064 = _1048 + _1056;
    float _1066 = _1056 + _1058;
    float _1068 = _1060 * _1060;
    float _1070 = _1062 + _1064;
    float _1072 = fma(_1066, _1066, _1068);
    float _1074 = fma(_1070, _1070, _1072);
    float _1076 = rsqrt(_1074);
    float _1078 = _1060 * _1076;
    float _1080 = _1066 * _1076;
    float _1082 = _1070 * _1076;
    float _1084 = _1042 * _1078;
    float _1086 = _1044 * _1078;
    float _1088 = fma(_1044, _1080, _1084);
    float _1090 = _1048 * _1078;
    float _1092 = fma(_1050, _1080, _1086);
    float _1094 = fma(_1048, _1082, _1088);
    float _1096 = fma(_1056, _1080, _1090);
    float _1098 = fma(_1056, _1082, _1092);
    float _1100 = _1094 * _1094;
    float _1102 = fma(_1062, _1082, _1096);
    float _1104 = fma(_1098, _1098, _1100);
    float _1106 = fma(_1102, _1102, _1104);
    float _1108 = rsqrt(_1106);
    float _1110 = _1094 * _1108;
    float _1112 = _1098 * _1108;
    float _1114 = _1102 * _1108;
    float _1116 = _1042 * _1110;
    float _1118 = _1044 * _1110;
    float _1120 = _1048 * _1110;
    float _1122 = fma(_1044, _1112, _1116);
    float _1124 = fma(_1050, _1112, _1118);
    float _1126 = fma(_1056, _1112, _1120);
    float _1128 = fma(_1048, _1114, _1122);
    float _1130 = fma(_1056, _1114, _1124);
    float _1132 = fma(_1062, _1114, _1126);
    float _1134 = _1128 * _1128;
    float _1136 = fma(_1130, _1130, _1134);
    float _1138 = fma(_1132, _1132, _1136);
    float _1140 = rsqrt(_1138);
    float _1142 = _1128 * _1140;
    float _1144 = _1130 * _1140;
    float _1146 = _1132 * _1140;
    float _1148 = _1042 * _1142;
    float _1150 = _1044 * _1142;
    float _1152 = _1048 * _1142;
    float _1154 = fma(_1044, _1144, _1148);
    float _1156 = fma(_1050, _1144, _1150);
    float _1158 = fma(_1056, _1144, _1152);
    float _1160 = fma(_1048, _1146, _1154);
    float _1162 = fma(_1056, _1146, _1156);
    float _1164 = fma(_1062, _1146, _1158);
    float _1166 = _1160 * _1160;
    float _1168 = fma(_1162, _1162, _1166);
    float _1170 = fma(_1164, _1164, _1168);
    float _1172 = rsqrt(_1170);
    float _1174 = _1160 * _1172;
    float _1176 = _1162 * _1172;
    float _1178 = _1164 * _1172;
    float _1180 = _1042 * _1174;
    float _1182 = _1044 * _1174;
    float _1184 = _1048 * _1174;
    float _1186 = fma(_1044, _1176, _1180);
    float _1188 = fma(_1050, _1176, _1182);
    float _1190 = fma(_1056, _1176, _1184);
    float _1192 = fma(_1048, _1178, _1186);
    float _1194 = fma(_1056, _1178, _1188);
    float _1196 = fma(_1062, _1178, _1190);
    float _1198 = _1192 * _1192;
    float _1200 = fma(_1194, _1194, _1198);
    float _1202 = fma(_1196, _1196, _1200);
    float _1204 = rsqrt(_1202);
    float _1206 = _1192 * _1204;
    float _1208 = _1194 * _1204;
    float _1210 = _1196 * _1204;
    float _1212 = _1042 * _1206;
    float _1214 = _1044 * _1206;
    float _1216 = _1048 * _1206;
    float _1218 = fma(_1044, _1208, _1212);
    float _1220 = fma(_1050, _1208, _1214);
    float _1222 = fma(_1056, _1208, _1216);
    float _1224 = fma(_1048, _1210, _1218);
    float _1226 = fma(_1056, _1210, _1220);
    float _1228 = fma(_1062, _1210, _1222);
    float _1230 = _1224 * _1224;
    float _1232 = fma(_1226, _1226, _1230);
    float _1234 = fma(_1228, _1228, _1232);
    float _1236 = rsqrt(_1234);
    float _1238 = _1224 * _1236;
    float _1240 = _1226 * _1236;
    float _1242 = _1228 * _1236;
    float _1244 = _1042 * _1238;
    float _1246 = _1044 * _1238;
    float _1248 = _1048 * _1238;
    float _1250 = fma(_1044, _1240, _1244);
    float _1252 = fma(_1050, _1240, _1246);
    float _1254 = fma(_1056, _1240, _1248);
    float _1256 = fma(_1048, _1242, _1250);
    float _1258 = fma(_1056, _1242, _1252);
    float _1260 = fma(_1062, _1242, _1254);
    float _1262 = _1256 * _1256;
    float _1264 = fma(_1258, _1258, _1262);
    float _1266 = fma(_1260, _1260, _1264);
    float _1268 = rsqrt(_1266);
    float _1270 = _1256 * _1268;
    float _1272 = _1258 * _1268;
    float _1274 = _1260 * _1268;
    float _1276 = _1042 * _1270;
    float _1278 = _1044 * _1270;
    float _1280 = fma(_1044, _1272, _1276);
    float _1282 = _1048 * _1270;
    float _1284 = fma(_1050, _1272, _1278);
    float _1286 = fma(_1048, _1274, _1280);
    float _1288 = fma(_1056, _1272, _1282);
    float _1290 = fma(_1056, _1274, _1284);
    float _1292 = _1286 * _1286;
    float _1294 = fma(_1062, _1274, _1288);
    float _1296 = fma(_1290, _1290, _1292);
    float _1298 = fma(_1294, _1294, _1296);
    float _1300 = rsqrt(_1298);
    float _1302 = _1286 * _1300;
    float _1304 = _1290 * _1300;
    float _1306 = _1294 * _1300;
    float _1308 = _446 * _1302;
    float _1310 = _456 * _1302;
    float _1312 = _466 * _1302;
    float _1314 = fma(_444, _1304, _1308);
    float _1316 = fma(_454, _1304, _1310);
    float _1318 = fma(_464, _1304, _1312);
    float _1320 = fma(_448, _1306, _1314);
    float _1322 = fma(_458, _1306, _1316);
    float _1324 = fma(_468, _1306, _1318);
    bool _1328 = _1320 >= _1322;
    bool _1330 = isnan(_1320);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(_1322);
    bool _1336 = _1332 || _1334;
    float _1338 = _588;
    float _1340 = _1318;
    float _1342 = _1050;
    float _1344 = _1314;
    float _1346 = _1300;
    float _1348 = _1272;
    float _1350 = _1260;
    float _1352 = _1270;
    float _1354 = _1320;
    float _1356 = _1244;
    float _1358 = _1324;
    float _1360 = _1324;
    float _1362 = _1302;
    float _1364 = _1304;
    spvUnsafeArray<uint, 4> _24;
    if (!_1336)
    {
        _1338 = _454;
    }
    float _1366 = _1338;
    float _1368 = _1366;
    float _1370 = _1366;
    if (!_1336)
    {
        _1340 = _456;
    }
    float _1372 = _1340;
    float _1374 = _1372;
    float _1376 = _1372;
    if (!_1336)
    {
        _1342 = _458;
    }
    float _1378 = _1342;
    float _1380 = _1378;
    float _1382 = _1378;
    if (!_1336)
    {
        _1344 = _1320;
    }
    float _1384 = _1344;
    float _1386 = _1384;
    float _1388 = _1384;
    if (!_1336)
    {
        _1346 = _1322;
    }
    float _1390 = _1346;
    float _1392 = _1390;
    float _1394 = _1390;
    if (!_1336)
    {
        _1348 = _444;
    }
    float _1396 = _1348;
    float _1398 = _1396;
    float _1400 = _1396;
    if (!_1336)
    {
        _1350 = _446;
    }
    float _1402 = _1350;
    float _1404 = _1402;
    float _1406 = _1402;
    if (!_1336)
    {
        _1352 = _448;
    }
    float _1408 = _1352;
    bool _1410 = !_1336;
    float _1412 = _1408;
    float _1414 = _1408;
    if (!_1410)
    {
        bool _1416 = _1320 > _1322;
        if (!_1416)
        {
            _1386 = _1320;
        }
        float _1418 = _1386;
        float _1420 = _1418;
        if (!_1416)
        {
            _1392 = _1320;
        }
        float _1422 = _1392;
        float _1424 = _1422;
        if (!_1416)
        {
            _1398 = _444;
        }
        float _1426 = _1398;
        float _1428 = _1426;
        if (!_1416)
        {
            _1404 = _446;
        }
        float _1430 = _1404;
        float _1432 = _1430;
        if (!_1416)
        {
            _1412 = _448;
        }
        float _1434 = _1412;
        float _1436 = _1434;
        if (!_1416)
        {
            _1368 = _444;
        }
        float _1438 = _1368;
        float _1440 = _1438;
        if (!_1416)
        {
            _1374 = _446;
        }
        float _1442 = _1374;
        float _1444 = _1442;
        if (!_1416)
        {
            _1380 = _448;
        }
        float _1446 = _1380;
        _1382 = _1446;
        if (_1416)
        {
            _1420 = _1322;
        }
        float _1448 = _1420;
        _1388 = _1448;
        if (_1416)
        {
            _1424 = _1320;
        }
        float _1450 = _1424;
        _1394 = _1450;
        if (_1416)
        {
            _1428 = _454;
        }
        float _1452 = _1428;
        _1400 = _1452;
        if (_1416)
        {
            _1432 = _456;
        }
        float _1454 = _1432;
        _1406 = _1454;
        if (_1416)
        {
            _1436 = _458;
        }
        float _1456 = _1436;
        _1414 = _1456;
        if (_1416)
        {
            _1440 = _444;
        }
        float _1458 = _1440;
        _1370 = _1458;
        if (_1416)
        {
            _1444 = _446;
        }
        float _1460 = _1444;
        _1376 = _1460;
        if (_1416)
        {
            _1382 = _448;
        }
    }
    float _1462 = _1394;
    float _1464 = _1388;
    float _1466 = _1370;
    float _1468 = _1376;
    float _1470 = _1382;
    float _1472 = _1400;
    float _1474 = _1406;
    float _1476 = _1414;
    bool _1478 = _1462 >= _1324;
    bool _1480 = isnan(_1462);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(_1324);
    bool _1486 = _1482 || _1484;
    float _1488 = _500 * _1302;
    float _1490 = fma(_498, _1304, _1488);
    float _1492 = fma(_502, _1306, _1490);
    float _1494 = _1490;
    float _1496 = _1464;
    float _1498 = _1472;
    float _1500 = _1474;
    float _1502 = _1464;
    float _1504 = _1472;
    float _1506 = _1474;
    float _1508 = _1476;
    float _1510 = _1462;
    float _1512 = _1470;
    float _1514 = _1492;
    float _1516 = _1492;
    if (!_1486)
    {
        _1354 = _464;
    }
    float _1518 = _1354;
    float _1520 = _1518;
    float _1522 = _1518;
    if (!_1486)
    {
        _1494 = _466;
    }
    float _1524 = _1494;
    float _1526 = _1524;
    float _1528 = _1524;
    if (!_1486)
    {
        _1356 = _468;
    }
    float _1530 = _1356;
    bool _1532 = !_1486;
    float _1534 = _1530;
    float _1536 = _1530;
    if (!_1532)
    {
        bool _1538 = _1464 > _1324;
        if (_1538)
        {
            _1496 = _1324;
        }
        float _1540 = _1496;
        _1502 = _1540;
        if (!_1538)
        {
            _1520 = _1466;
        }
        float _1542 = _1520;
        float _1544 = _1542;
        if (!_1538)
        {
            _1526 = _1468;
        }
        float _1546 = _1526;
        float _1548 = _1546;
        if (!_1538)
        {
            _1534 = _1470;
        }
        float _1550 = _1534;
        float _1552 = _1550;
        if (!_1538)
        {
            _1358 = _1462;
        }
        float _1554 = _1358;
        float _1556 = _1554;
        if (_1538)
        {
            _1544 = _1466;
        }
        float _1558 = _1544;
        _1522 = _1558;
        if (_1538)
        {
            _1548 = _1468;
        }
        float _1560 = _1548;
        _1528 = _1560;
        if (_1538)
        {
            _1552 = _1470;
        }
        float _1562 = _1552;
        _1536 = _1562;
        if (_1538)
        {
            _1556 = _1462;
        }
        float _1564 = _1556;
        _1360 = _1564;
        if (_1538)
        {
            _1498 = _464;
        }
        float _1566 = _1498;
        _1504 = _1566;
        if (_1538)
        {
            _1500 = _466;
        }
        float _1568 = _1500;
        _1506 = _1568;
        if (_1538)
        {
            _1508 = _468;
        }
    }
    float _1570 = _1360;
    float _1572 = _1502;
    float _1574 = _1522;
    float _1576 = _1528;
    float _1578 = _1536;
    float _1580 = _1504;
    float _1582 = _1506;
    float _1584 = _1508;
    bool _1586 = _1570 >= _1492;
    bool _1588 = isnan(_1570);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan(_1492);
    bool _1594 = _1590 || _1592;
    float _1596 = _512 * _1302;
    float _1598 = fma(_510, _1304, _1596);
    float _1600 = fma(_514, _1306, _1598);
    float _1602 = _1598;
    float _1604 = _1572;
    float _1606 = _1580;
    float _1608 = _1582;
    float _1610 = _1572;
    float _1612 = _1580;
    float _1614 = _1582;
    float _1616 = _1584;
    float _1618 = _1574;
    float _1620 = _1578;
    float _1622 = _1600;
    float _1624 = _1600;
    if (!_1594)
    {
        _1510 = _498;
    }
    float _1626 = _1510;
    float _1628 = _1626;
    float _1630 = _1626;
    if (!_1594)
    {
        _1512 = _500;
    }
    float _1632 = _1512;
    float _1634 = _1632;
    float _1636 = _1632;
    if (!_1594)
    {
        _1602 = _502;
    }
    float _1638 = _1602;
    bool _1640 = !_1594;
    float _1642 = _1638;
    float _1644 = _1638;
    if (!_1640)
    {
        bool _1646 = _1572 > _1492;
        if (_1646)
        {
            _1604 = _1492;
        }
        float _1648 = _1604;
        _1610 = _1648;
        if (!_1646)
        {
            _1628 = _1574;
        }
        float _1650 = _1628;
        float _1652 = _1650;
        if (!_1646)
        {
            _1634 = _1576;
        }
        float _1654 = _1634;
        float _1656 = _1654;
        if (!_1646)
        {
            _1642 = _1578;
        }
        float _1658 = _1642;
        float _1660 = _1658;
        if (!_1646)
        {
            _1514 = _1570;
        }
        float _1662 = _1514;
        float _1664 = _1662;
        if (_1646)
        {
            _1652 = _1574;
        }
        float _1666 = _1652;
        _1630 = _1666;
        if (_1646)
        {
            _1656 = _1576;
        }
        float _1668 = _1656;
        _1636 = _1668;
        if (_1646)
        {
            _1660 = _1578;
        }
        float _1670 = _1660;
        _1644 = _1670;
        if (_1646)
        {
            _1664 = _1570;
        }
        float _1672 = _1664;
        _1516 = _1672;
        if (_1646)
        {
            _1606 = _498;
        }
        float _1674 = _1606;
        _1612 = _1674;
        if (_1646)
        {
            _1608 = _500;
        }
        float _1676 = _1608;
        _1614 = _1676;
        if (_1646)
        {
            _1616 = _502;
        }
    }
    float _1678 = _1516;
    float _1680 = _1610;
    float _1682 = _1630;
    float _1684 = _1636;
    float _1686 = _1644;
    float _1688 = _1612;
    float _1690 = _1614;
    float _1692 = _1616;
    bool _1694 = _1678 >= _1600;
    bool _1696 = isnan(_1678);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan(_1600);
    bool _1702 = _1698 || _1700;
    float _1704 = _522 * _1302;
    float _1706 = fma(_520, _1304, _1704);
    float _1708 = fma(_524, _1306, _1706);
    float _1710 = _1706;
    float _1712 = _1680;
    float _1714 = _1688;
    float _1716 = _1690;
    float _1718 = _1680;
    float _1720 = _1688;
    float _1722 = _1690;
    float _1724 = _1692;
    float _1726 = _1682;
    float _1728 = _1684;
    float _1730 = _1708;
    float _1732 = _1708;
    float _1734 = _1678;
    if (!_1702)
    {
        _1618 = _510;
    }
    float _1736 = _1618;
    float _1738 = _1736;
    float _1740 = _1736;
    if (!_1702)
    {
        _1710 = _512;
    }
    float _1742 = _1710;
    float _1744 = _1742;
    float _1746 = _1742;
    if (!_1702)
    {
        _1620 = _514;
    }
    float _1748 = _1620;
    bool _1750 = !_1702;
    float _1752 = _1748;
    float _1754 = _1748;
    if (!_1750)
    {
        bool _1756 = _1680 > _1600;
        if (_1756)
        {
            _1712 = _1600;
        }
        float _1758 = _1712;
        _1718 = _1758;
        if (!_1756)
        {
            _1738 = _1682;
        }
        float _1760 = _1738;
        float _1762 = _1760;
        if (!_1756)
        {
            _1744 = _1684;
        }
        float _1764 = _1744;
        float _1766 = _1764;
        if (!_1756)
        {
            _1752 = _1686;
        }
        float _1768 = _1752;
        float _1770 = _1768;
        if (!_1756)
        {
            _1622 = _1678;
        }
        float _1772 = _1622;
        float _1774 = _1772;
        if (_1756)
        {
            _1762 = _1682;
        }
        float _1776 = _1762;
        _1740 = _1776;
        if (_1756)
        {
            _1766 = _1684;
        }
        float _1778 = _1766;
        _1746 = _1778;
        if (_1756)
        {
            _1770 = _1686;
        }
        float _1780 = _1770;
        _1754 = _1780;
        if (_1756)
        {
            _1774 = _1678;
        }
        float _1782 = _1774;
        _1624 = _1782;
        if (_1756)
        {
            _1714 = _510;
        }
        float _1784 = _1714;
        _1720 = _1784;
        if (_1756)
        {
            _1716 = _512;
        }
        float _1786 = _1716;
        _1722 = _1786;
        if (_1756)
        {
            _1724 = _514;
        }
    }
    float _1788 = _1624;
    float _1790 = _1718;
    float _1792 = _1740;
    float _1794 = _1746;
    float _1796 = _1754;
    float _1798 = _1720;
    float _1800 = _1722;
    float _1802 = _1724;
    bool _1804 = _1788 >= _1708;
    bool _1806 = isnan(_1788);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan(_1708);
    bool _1812 = _1808 || _1810;
    float _1814 = _532 * _1302;
    float _1816 = fma(_530, _1304, _1814);
    float _1818 = fma(_534, _1306, _1816);
    float _1820 = _1816;
    float _1822 = _1790;
    float _1824 = _1798;
    float _1826 = _1800;
    float _1828 = _1790;
    float _1830 = _1798;
    float _1832 = _1800;
    float _1834 = _1802;
    float _1836 = _1796;
    float _1838 = _1788;
    float _1840 = _1818;
    float _1842 = _1818;
    if (!_1812)
    {
        _1726 = _520;
    }
    float _1844 = _1726;
    float _1846 = _1844;
    float _1848 = _1844;
    if (!_1812)
    {
        _1728 = _522;
    }
    float _1850 = _1728;
    float _1852 = _1850;
    float _1854 = _1850;
    if (!_1812)
    {
        _1820 = _524;
    }
    float _1856 = _1820;
    bool _1858 = !_1812;
    float _1860 = _1856;
    float _1862 = _1856;
    if (!_1858)
    {
        bool _1864 = _1790 > _1708;
        if (_1864)
        {
            _1822 = _1708;
        }
        float _1866 = _1822;
        _1828 = _1866;
        if (!_1864)
        {
            _1846 = _1792;
        }
        float _1868 = _1846;
        float _1870 = _1868;
        if (!_1864)
        {
            _1852 = _1794;
        }
        float _1872 = _1852;
        float _1874 = _1872;
        if (!_1864)
        {
            _1860 = _1796;
        }
        float _1876 = _1860;
        float _1878 = _1876;
        if (!_1864)
        {
            _1730 = _1788;
        }
        float _1880 = _1730;
        float _1882 = _1880;
        if (_1864)
        {
            _1870 = _1792;
        }
        float _1884 = _1870;
        _1848 = _1884;
        if (_1864)
        {
            _1874 = _1794;
        }
        float _1886 = _1874;
        _1854 = _1886;
        if (_1864)
        {
            _1878 = _1796;
        }
        float _1888 = _1878;
        _1862 = _1888;
        if (_1864)
        {
            _1882 = _1788;
        }
        float _1890 = _1882;
        _1732 = _1890;
        if (_1864)
        {
            _1824 = _520;
        }
        float _1892 = _1824;
        _1830 = _1892;
        if (_1864)
        {
            _1826 = _522;
        }
        float _1894 = _1826;
        _1832 = _1894;
        if (_1864)
        {
            _1834 = _524;
        }
    }
    float _1896 = _1732;
    float _1898 = _1828;
    float _1900 = _1848;
    float _1902 = _1854;
    float _1904 = _1862;
    float _1906 = _1830;
    float _1908 = _1832;
    float _1910 = _1834;
    bool _1912 = _1896 >= _1818;
    bool _1914 = isnan(_1896);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan(_1818);
    bool _1920 = _1916 || _1918;
    float _1922 = _572 * _1302;
    float _1924 = fma(_570, _1304, _1922);
    float _1926 = fma(_574, _1306, _1924);
    float _1928 = _1898;
    float _1930 = _1906;
    float _1932 = _1908;
    float _1934 = _1898;
    float _1936 = _1906;
    float _1938 = _1908;
    float _1940 = _1910;
    float _1942 = _1900;
    float _1944 = _1902;
    float _1946 = _1926;
    float _1948 = _1926;
    if (!_1920)
    {
        _1836 = _530;
    }
    float _1950 = _1836;
    float _1952 = _1950;
    float _1954 = _1950;
    if (!_1920)
    {
        _1734 = _532;
    }
    float _1956 = _1734;
    float _1958 = _1956;
    float _1960 = _1956;
    if (!_1920)
    {
        _1838 = _534;
    }
    float _1962 = _1838;
    bool _1964 = !_1920;
    float _1966 = _1962;
    float _1968 = _1962;
    if (!_1964)
    {
        bool _1970 = _1898 > _1818;
        if (_1970)
        {
            _1928 = _1818;
        }
        float _1972 = _1928;
        _1934 = _1972;
        if (!_1970)
        {
            _1952 = _1900;
        }
        float _1974 = _1952;
        float _1976 = _1974;
        if (!_1970)
        {
            _1958 = _1902;
        }
        float _1978 = _1958;
        float _1980 = _1978;
        if (!_1970)
        {
            _1966 = _1904;
        }
        float _1982 = _1966;
        float _1984 = _1982;
        if (!_1970)
        {
            _1840 = _1896;
        }
        float _1986 = _1840;
        float _1988 = _1986;
        if (_1970)
        {
            _1976 = _1900;
        }
        float _1990 = _1976;
        _1954 = _1990;
        if (_1970)
        {
            _1980 = _1902;
        }
        float _1992 = _1980;
        _1960 = _1992;
        if (_1970)
        {
            _1984 = _1904;
        }
        float _1994 = _1984;
        _1968 = _1994;
        if (_1970)
        {
            _1988 = _1896;
        }
        float _1996 = _1988;
        _1842 = _1996;
        if (_1970)
        {
            _1930 = _530;
        }
        float _1998 = _1930;
        _1936 = _1998;
        if (_1970)
        {
            _1932 = _532;
        }
        float _2000 = _1932;
        _1938 = _2000;
        if (_1970)
        {
            _1940 = _534;
        }
    }
    float _2002 = _1842;
    float _2004 = _1934;
    float _2006 = _1954;
    float _2008 = _1960;
    float _2010 = _1968;
    float _2012 = _1936;
    float _2014 = _1938;
    float _2016 = _1940;
    bool _2018 = _2002 >= _1926;
    bool _2020 = isnan(_2002);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(_1926);
    bool _2026 = _2022 || _2024;
    float _2028 = _582 * _1302;
    float _2030 = fma(_580, _1304, _2028);
    float _2032 = fma(_584, _1306, _2030);
    float _2034 = _2030;
    float _2036 = _2004;
    float _2038 = _2012;
    float _2040 = _2014;
    float _2042 = _2004;
    float _2044 = _2012;
    float _2046 = _2014;
    float _2048 = _2016;
    float _2050 = _2010;
    float _2052 = _2006;
    float _2054 = _2032;
    float _2056 = _2032;
    if (!_2026)
    {
        _1942 = _570;
    }
    float _2058 = _1942;
    float _2060 = _2058;
    float _2062 = _2058;
    if (!_2026)
    {
        _1944 = _572;
    }
    float _2064 = _1944;
    float _2066 = _2064;
    float _2068 = _2064;
    if (!_2026)
    {
        _2034 = _574;
    }
    float _2070 = _2034;
    bool _2072 = !_2026;
    float _2074 = _2070;
    float _2076 = _2070;
    if (!_2072)
    {
        bool _2078 = _2004 > _1926;
        if (_2078)
        {
            _2036 = _1926;
        }
        float _2080 = _2036;
        _2042 = _2080;
        if (!_2078)
        {
            _2060 = _2006;
        }
        float _2082 = _2060;
        float _2084 = _2082;
        if (!_2078)
        {
            _2066 = _2008;
        }
        float _2086 = _2066;
        float _2088 = _2086;
        if (!_2078)
        {
            _2074 = _2010;
        }
        float _2090 = _2074;
        float _2092 = _2090;
        if (!_2078)
        {
            _1946 = _2002;
        }
        float _2094 = _1946;
        float _2096 = _2094;
        if (_2078)
        {
            _2084 = _2006;
        }
        float _2098 = _2084;
        _2062 = _2098;
        if (_2078)
        {
            _2088 = _2008;
        }
        float _2100 = _2088;
        _2068 = _2100;
        if (_2078)
        {
            _2092 = _2010;
        }
        float _2102 = _2092;
        _2076 = _2102;
        if (_2078)
        {
            _2096 = _2002;
        }
        float _2104 = _2096;
        _1948 = _2104;
        if (_2078)
        {
            _2038 = _570;
        }
        float _2106 = _2038;
        _2044 = _2106;
        if (_2078)
        {
            _2040 = _572;
        }
        float _2108 = _2040;
        _2046 = _2108;
        if (_2078)
        {
            _2048 = _574;
        }
    }
    float _2110 = _1948;
    float _2112 = _2042;
    float _2114 = _2062;
    float _2116 = _2068;
    float _2118 = _2076;
    float _2120 = _2044;
    float _2122 = _2046;
    float _2124 = _2048;
    bool _2126 = _2110 >= _2032;
    bool _2128 = isnan(_2110);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan(_2032);
    bool _2134 = _2130 || _2132;
    float _2136 = _614 * _1302;
    float _2138 = fma(_612, _1304, _2136);
    float _2140 = fma(_616, _1306, _2138);
    float _2142 = _2138;
    float _2144 = _2112;
    float _2146 = _2120;
    float _2148 = _2122;
    float _2150 = _2112;
    float _2152 = _2120;
    float _2154 = _2122;
    float _2156 = _2124;
    float _2158 = _2116;
    float _2160 = _2114;
    float _2162 = _2140;
    float _2164 = _2140;
    if (!_2134)
    {
        _2050 = _580;
    }
    float _2166 = _2050;
    float _2168 = _2166;
    float _2170 = _2166;
    if (!_2134)
    {
        _2142 = _582;
    }
    float _2172 = _2142;
    float _2174 = _2172;
    float _2176 = _2172;
    if (!_2134)
    {
        _2052 = _584;
    }
    float _2178 = _2052;
    bool _2180 = !_2134;
    float _2182 = _2178;
    float _2184 = _2178;
    if (!_2180)
    {
        bool _2186 = _2112 > _2032;
        if (_2186)
        {
            _2144 = _2032;
        }
        float _2188 = _2144;
        _2150 = _2188;
        if (!_2186)
        {
            _2168 = _2114;
        }
        float _2190 = _2168;
        float _2192 = _2190;
        if (!_2186)
        {
            _2174 = _2116;
        }
        float _2194 = _2174;
        float _2196 = _2194;
        if (!_2186)
        {
            _2182 = _2118;
        }
        float _2198 = _2182;
        float _2200 = _2198;
        if (!_2186)
        {
            _2054 = _2110;
        }
        float _2202 = _2054;
        float _2204 = _2202;
        if (_2186)
        {
            _2192 = _2114;
        }
        float _2206 = _2192;
        _2170 = _2206;
        if (_2186)
        {
            _2196 = _2116;
        }
        float _2208 = _2196;
        _2176 = _2208;
        if (_2186)
        {
            _2200 = _2118;
        }
        float _2210 = _2200;
        _2184 = _2210;
        if (_2186)
        {
            _2204 = _2110;
        }
        float _2212 = _2204;
        _2056 = _2212;
        if (_2186)
        {
            _2146 = _580;
        }
        float _2214 = _2146;
        _2152 = _2214;
        if (_2186)
        {
            _2148 = _582;
        }
        float _2216 = _2148;
        _2154 = _2216;
        if (_2186)
        {
            _2156 = _584;
        }
    }
    float _2218 = _2056;
    float _2220 = _2150;
    float _2222 = _2170;
    float _2224 = _2176;
    float _2226 = _2184;
    float _2228 = _2152;
    float _2230 = _2154;
    float _2232 = _2156;
    bool _2234 = _2218 >= _2140;
    bool _2236 = isnan(_2218);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan(_2140);
    bool _2242 = _2238 || _2240;
    float _2244 = _624 * _1302;
    float _2246 = fma(_622, _1304, _2244);
    float _2248 = fma(_626, _1306, _2246);
    float _2250 = _2246;
    float _2252 = _2220;
    float _2254 = _2228;
    float _2256 = _2230;
    float _2258 = _2220;
    float _2260 = _2228;
    float _2262 = _2230;
    float _2264 = _2232;
    float _2266 = _2226;
    float _2268 = _2218;
    float _2270 = _2248;
    float _2272 = _2248;
    if (!_2242)
    {
        _2250 = _612;
    }
    float _2274 = _2250;
    float _2276 = _2274;
    float _2278 = _2274;
    if (!_2242)
    {
        _2158 = _614;
    }
    float _2280 = _2158;
    float _2282 = _2280;
    float _2284 = _2280;
    if (!_2242)
    {
        _2160 = _616;
    }
    float _2286 = _2160;
    bool _2288 = !_2242;
    float _2290 = _2286;
    float _2292 = _2286;
    if (!_2288)
    {
        bool _2294 = _2220 > _2140;
        if (_2294)
        {
            _2252 = _2140;
        }
        float _2296 = _2252;
        _2258 = _2296;
        if (!_2294)
        {
            _2276 = _2222;
        }
        float _2298 = _2276;
        float _2300 = _2298;
        if (!_2294)
        {
            _2282 = _2224;
        }
        float _2302 = _2282;
        float _2304 = _2302;
        if (!_2294)
        {
            _2290 = _2226;
        }
        float _2306 = _2290;
        float _2308 = _2306;
        if (!_2294)
        {
            _2162 = _2218;
        }
        float _2310 = _2162;
        float _2312 = _2310;
        if (_2294)
        {
            _2300 = _2222;
        }
        float _2314 = _2300;
        _2278 = _2314;
        if (_2294)
        {
            _2304 = _2224;
        }
        float _2316 = _2304;
        _2284 = _2316;
        if (_2294)
        {
            _2308 = _2226;
        }
        float _2318 = _2308;
        _2292 = _2318;
        if (_2294)
        {
            _2312 = _2218;
        }
        float _2320 = _2312;
        _2164 = _2320;
        if (_2294)
        {
            _2254 = _612;
        }
        float _2322 = _2254;
        _2260 = _2322;
        if (_2294)
        {
            _2256 = _614;
        }
        float _2324 = _2256;
        _2262 = _2324;
        if (_2294)
        {
            _2264 = _616;
        }
    }
    float _2326 = _2164;
    float _2328 = _2258;
    float _2330 = _2278;
    float _2332 = _2284;
    float _2334 = _2292;
    float _2336 = _2260;
    float _2338 = _2262;
    float _2340 = _2264;
    bool _2342 = _2326 >= _2248;
    bool _2344 = isnan(_2326);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan(_2248);
    bool _2350 = _2346 || _2348;
    float _2352 = _634 * _1302;
    float _2354 = fma(_632, _1304, _2352);
    float _2356 = fma(_636, _1306, _2354);
    float _2358 = _2354;
    float _2360 = _2328;
    float _2362 = _2336;
    float _2364 = _2338;
    float _2366 = _2328;
    float _2368 = _2336;
    float _2370 = _2338;
    float _2372 = _2340;
    float _2374 = _2332;
    float _2376 = _2334;
    float _2378 = _2356;
    float _2380 = _2356;
    if (!_2350)
    {
        _2266 = _622;
    }
    float _2382 = _2266;
    float _2384 = _2382;
    float _2386 = _2382;
    if (!_2350)
    {
        _2358 = _624;
    }
    float _2388 = _2358;
    float _2390 = _2388;
    float _2392 = _2388;
    if (!_2350)
    {
        _2268 = _626;
    }
    float _2394 = _2268;
    bool _2396 = !_2350;
    float _2398 = _2394;
    float _2400 = _2394;
    if (!_2396)
    {
        bool _2402 = _2328 > _2248;
        if (_2402)
        {
            _2360 = _2248;
        }
        float _2404 = _2360;
        _2366 = _2404;
        if (!_2402)
        {
            _2384 = _2330;
        }
        float _2406 = _2384;
        float _2408 = _2406;
        if (!_2402)
        {
            _2390 = _2332;
        }
        float _2410 = _2390;
        float _2412 = _2410;
        if (!_2402)
        {
            _2398 = _2334;
        }
        float _2414 = _2398;
        float _2416 = _2414;
        if (!_2402)
        {
            _2270 = _2326;
        }
        float _2418 = _2270;
        float _2420 = _2418;
        if (_2402)
        {
            _2408 = _2330;
        }
        float _2422 = _2408;
        _2386 = _2422;
        if (_2402)
        {
            _2412 = _2332;
        }
        float _2424 = _2412;
        _2392 = _2424;
        if (_2402)
        {
            _2416 = _2334;
        }
        float _2426 = _2416;
        _2400 = _2426;
        if (_2402)
        {
            _2420 = _2326;
        }
        float _2428 = _2420;
        _2272 = _2428;
        if (_2402)
        {
            _2362 = _622;
        }
        float _2430 = _2362;
        _2368 = _2430;
        if (_2402)
        {
            _2364 = _624;
        }
        float _2432 = _2364;
        _2370 = _2432;
        if (_2402)
        {
            _2372 = _626;
        }
    }
    float _2434 = _2272;
    float _2436 = _2366;
    float _2438 = _2386;
    float _2440 = _2392;
    float _2442 = _2400;
    float _2444 = _2368;
    float _2446 = _2370;
    float _2448 = _2372;
    bool _2450 = _2434 >= _2356;
    bool _2452 = isnan(_2434);
    bool _2454 = _2450 || _2452;
    bool _2456 = isnan(_2356);
    bool _2458 = _2454 || _2456;
    float _2460 = _644 * _1302;
    float _2462 = fma(_642, _1304, _2460);
    float _2464 = fma(_646, _1306, _2462);
    float _2466 = _2462;
    float _2468 = _2436;
    float _2470 = _2444;
    float _2472 = _2446;
    float _2474 = _2436;
    float _2476 = _2444;
    float _2478 = _2446;
    float _2480 = _2448;
    float _2482 = _2438;
    float _2484 = _2442;
    float _2486 = _2464;
    float _2488 = _2464;
    if (!_2458)
    {
        _2466 = _632;
    }
    float _2490 = _2466;
    float _2492 = _2490;
    float _2494 = _2490;
    if (!_2458)
    {
        _2374 = _634;
    }
    float _2496 = _2374;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2458)
    {
        _2376 = _636;
    }
    float _2502 = _2376;
    bool _2504 = !_2458;
    float _2506 = _2502;
    float _2508 = _2502;
    if (!_2504)
    {
        bool _2510 = _2436 > _2356;
        if (_2510)
        {
            _2468 = _2356;
        }
        float _2512 = _2468;
        _2474 = _2512;
        if (!_2510)
        {
            _2492 = _2438;
        }
        float _2514 = _2492;
        float _2516 = _2514;
        if (!_2510)
        {
            _2498 = _2440;
        }
        float _2518 = _2498;
        float _2520 = _2518;
        if (!_2510)
        {
            _2506 = _2442;
        }
        float _2522 = _2506;
        float _2524 = _2522;
        if (!_2510)
        {
            _2378 = _2434;
        }
        float _2526 = _2378;
        float _2528 = _2526;
        if (_2510)
        {
            _2516 = _2438;
        }
        float _2530 = _2516;
        _2494 = _2530;
        if (_2510)
        {
            _2520 = _2440;
        }
        float _2532 = _2520;
        _2500 = _2532;
        if (_2510)
        {
            _2524 = _2442;
        }
        float _2534 = _2524;
        _2508 = _2534;
        if (_2510)
        {
            _2528 = _2434;
        }
        float _2536 = _2528;
        _2380 = _2536;
        if (_2510)
        {
            _2470 = _632;
        }
        float _2538 = _2470;
        _2476 = _2538;
        if (_2510)
        {
            _2472 = _634;
        }
        float _2540 = _2472;
        _2478 = _2540;
        if (_2510)
        {
            _2480 = _636;
        }
    }
    float _2542 = _2380;
    float _2544 = _2474;
    float _2546 = _2494;
    float _2548 = _2500;
    float _2550 = _2508;
    float _2552 = _2476;
    float _2554 = _2478;
    float _2556 = _2480;
    bool _2558 = _2542 >= _2464;
    bool _2560 = isnan(_2542);
    bool _2562 = _2558 || _2560;
    bool _2564 = isnan(_2464);
    bool _2566 = _2562 || _2564;
    float _2568 = _654 * _1302;
    float _2570 = fma(_652, _1304, _2568);
    float _2572 = fma(_656, _1306, _2570);
    float _2574 = _2570;
    float _2576 = _2544;
    float _2578 = _2552;
    float _2580 = _2554;
    float _2582 = _2544;
    float _2584 = _2552;
    float _2586 = _2554;
    float _2588 = _2556;
    float _2590 = _2548;
    float _2592 = _2550;
    float _2594 = _2572;
    float _2596 = _2572;
    if (!_2566)
    {
        _2482 = _642;
    }
    float _2598 = _2482;
    float _2600 = _2598;
    float _2602 = _2598;
    if (!_2566)
    {
        _2574 = _644;
    }
    float _2604 = _2574;
    float _2606 = _2604;
    float _2608 = _2604;
    if (!_2566)
    {
        _2484 = _646;
    }
    float _2610 = _2484;
    bool _2612 = !_2566;
    float _2614 = _2610;
    float _2616 = _2610;
    if (!_2612)
    {
        bool _2618 = _2544 > _2464;
        if (_2618)
        {
            _2576 = _2464;
        }
        float _2620 = _2576;
        _2582 = _2620;
        if (!_2618)
        {
            _2600 = _2546;
        }
        float _2622 = _2600;
        float _2624 = _2622;
        if (!_2618)
        {
            _2606 = _2548;
        }
        float _2626 = _2606;
        float _2628 = _2626;
        if (!_2618)
        {
            _2614 = _2550;
        }
        float _2630 = _2614;
        float _2632 = _2630;
        if (!_2618)
        {
            _2486 = _2542;
        }
        float _2634 = _2486;
        float _2636 = _2634;
        if (_2618)
        {
            _2624 = _2546;
        }
        float _2638 = _2624;
        _2602 = _2638;
        if (_2618)
        {
            _2628 = _2548;
        }
        float _2640 = _2628;
        _2608 = _2640;
        if (_2618)
        {
            _2632 = _2550;
        }
        float _2642 = _2632;
        _2616 = _2642;
        if (_2618)
        {
            _2636 = _2542;
        }
        float _2644 = _2636;
        _2488 = _2644;
        if (_2618)
        {
            _2578 = _642;
        }
        float _2646 = _2578;
        _2584 = _2646;
        if (_2618)
        {
            _2580 = _644;
        }
        float _2648 = _2580;
        _2586 = _2648;
        if (_2618)
        {
            _2588 = _646;
        }
    }
    float _2650 = _2488;
    float _2652 = _2582;
    float _2654 = _2602;
    float _2656 = _2608;
    float _2658 = _2616;
    float _2660 = _2584;
    float _2662 = _2586;
    float _2664 = _2588;
    bool _2666 = _2650 >= _2572;
    bool _2668 = isnan(_2650);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan(_2572);
    bool _2674 = _2670 || _2672;
    float _2676 = _664 * _1302;
    float _2678 = fma(_662, _1304, _2676);
    float _2680 = fma(_666, _1306, _2678);
    float _2682 = _2678;
    float _2684 = _2652;
    float _2686 = _2660;
    float _2688 = _2662;
    float _2690 = _2660;
    float _2692 = _2662;
    float _2694 = _2652;
    float _2696 = _2664;
    float _2698 = _2658;
    float _2700 = _2654;
    float _2702 = _2680;
    float _2704 = _2680;
    if (!_2674)
    {
        _2682 = _652;
    }
    float _2706 = _2682;
    float _2708 = _2706;
    float _2710 = _2706;
    if (!_2674)
    {
        _2590 = _654;
    }
    float _2712 = _2590;
    float _2714 = _2712;
    float _2716 = _2712;
    if (!_2674)
    {
        _2592 = _656;
    }
    float _2718 = _2592;
    bool _2720 = !_2674;
    float _2722 = _2718;
    float _2724 = _2718;
    if (!_2720)
    {
        bool _2726 = _2652 > _2572;
        if (_2726)
        {
            _2684 = _2572;
        }
        float _2728 = _2684;
        _2694 = _2728;
        if (!_2726)
        {
            _2708 = _2654;
        }
        float _2730 = _2708;
        float _2732 = _2730;
        if (!_2726)
        {
            _2714 = _2656;
        }
        float _2734 = _2714;
        float _2736 = _2734;
        if (!_2726)
        {
            _2722 = _2658;
        }
        float _2738 = _2722;
        float _2740 = _2738;
        if (!_2726)
        {
            _2594 = _2650;
        }
        float _2742 = _2594;
        float _2744 = _2742;
        if (_2726)
        {
            _2732 = _2654;
        }
        float _2746 = _2732;
        _2710 = _2746;
        if (_2726)
        {
            _2736 = _2656;
        }
        float _2748 = _2736;
        _2716 = _2748;
        if (_2726)
        {
            _2740 = _2658;
        }
        float _2750 = _2740;
        _2724 = _2750;
        if (_2726)
        {
            _2744 = _2650;
        }
        float _2752 = _2744;
        _2596 = _2752;
        if (_2726)
        {
            _2686 = _652;
        }
        float _2754 = _2686;
        _2690 = _2754;
        if (_2726)
        {
            _2688 = _654;
        }
        float _2756 = _2688;
        _2692 = _2756;
        if (_2726)
        {
            _2696 = _656;
        }
    }
    float _2758 = _2596;
    float _2760 = _2690;
    float _2762 = _2692;
    float _2764 = _2694;
    float _2766 = _2710;
    float _2768 = _2716;
    float _2770 = _2724;
    float _2772 = _2696;
    bool _2774 = _2758 >= _2680;
    bool _2776 = isnan(_2758);
    bool _2778 = _2774 || _2776;
    bool _2780 = isnan(_2680);
    bool _2782 = _2778 || _2780;
    float _2784 = _674 * _1302;
    float _2786 = fma(_672, _1304, _2784);
    float _2788 = fma(_676, _1306, _2786);
    float _2790 = _2786;
    float _2792 = _2764;
    float _2794 = _2772;
    float _2796 = _2764;
    float _2798 = _2762;
    float _2800 = _2760;
    if (!_2782)
    {
        _1362 = _2760;
    }
    float _2802 = _1362;
    float _2804 = _2802;
    float _2806 = _2802;
    if (!_2782)
    {
        _2790 = _2762;
    }
    float _2808 = _2790;
    float _2810 = _2808;
    float _2812 = _2808;
    if (!_2782)
    {
        _1364 = _662;
    }
    float _2814 = _1364;
    float _2816 = _2814;
    float _2818 = _2814;
    if (!_2782)
    {
        _2698 = _664;
    }
    float _2820 = _2698;
    float _2822 = _2820;
    float _2824 = _2820;
    if (!_2782)
    {
        _2700 = _666;
    }
    float _2826 = _2700;
    bool _2828 = !_2782;
    float _2830 = _2826;
    float _2832 = _2826;
    if (!_2828)
    {
        bool _2834 = _2764 > _2680;
        if (_2834)
        {
            _2792 = _2680;
        }
        float _2836 = _2792;
        _2796 = _2836;
        if (!_2834)
        {
            _2816 = _2766;
        }
        float _2838 = _2816;
        float _2840 = _2838;
        if (!_2834)
        {
            _2822 = _2768;
        }
        float _2842 = _2822;
        float _2844 = _2842;
        if (!_2834)
        {
            _2830 = _2770;
        }
        float _2846 = _2830;
        float _2848 = _2846;
        if (!_2834)
        {
            _2702 = _2758;
        }
        float _2850 = _2702;
        float _2852 = _2850;
        if (!_2834)
        {
            _2804 = _2760;
        }
        float _2854 = _2804;
        float _2856 = _2854;
        if (!_2834)
        {
            _2810 = _2762;
        }
        float _2858 = _2810;
        float _2860 = _2858;
        if (_2834)
        {
            _2840 = _2766;
        }
        float _2862 = _2840;
        _2818 = _2862;
        if (_2834)
        {
            _2844 = _2768;
        }
        float _2864 = _2844;
        _2824 = _2864;
        if (_2834)
        {
            _2848 = _2770;
        }
        float _2866 = _2848;
        _2832 = _2866;
        if (_2834)
        {
            _2852 = _2758;
        }
        float _2868 = _2852;
        _2704 = _2868;
        if (_2834)
        {
            _2856 = _662;
        }
        float _2870 = _2856;
        _2806 = _2870;
        if (_2834)
        {
            _2860 = _664;
        }
        float _2872 = _2860;
        _2812 = _2872;
        if (_2834)
        {
            _2794 = _666;
        }
    }
    float _2874 = _2704;
    float _2876 = _2806;
    float _2878 = _2794;
    float _2880 = _2796;
    float _2882 = _2818;
    float _2884 = _2824;
    float _2886 = _2832;
    float _2888 = _2812;
    bool _2890 = _2874 >= _2788;
    bool _2892 = isnan(_2874);
    bool _2894 = _2890 || _2892;
    bool _2896 = isnan(_2788);
    bool _2898 = _2894 || _2896;
    float _2900 = _2888;
    float _2902 = _2888;
    if (!_2898)
    {
        _2798 = _2876;
    }
    float _2904 = _2798;
    float _2906 = _2904;
    float _2908 = _2904;
    if (!_2898)
    {
        _2800 = _2878;
    }
    float _2910 = _2800;
    float _2912 = 0.0;
    float _2914 = _2910;
    float _2916 = _2910;
    if (!_2898)
    {
        _2912 = _672;
    }
    float _2918 = _2912;
    float _2920 = 0.0;
    float _2922 = _2918;
    float _2924 = _2918;
    if (!_2898)
    {
        _2920 = _674;
    }
    float _2926 = _2920;
    float _2928 = 0.0;
    float _2930 = _2926;
    float _2932 = _2926;
    if (!_2898)
    {
        _2928 = _676;
    }
    float _2934 = _2928;
    bool _2936 = !_2898;
    float _2938 = _2934;
    float _2940 = _2934;
    if (!_2936)
    {
        bool _2942 = _2880 > _2788;
        if (!_2942)
        {
            _2922 = _2882;
        }
        float _2944 = _2922;
        float _2946 = _2944;
        if (!_2942)
        {
            _2930 = _2884;
        }
        float _2948 = _2930;
        float _2950 = _2948;
        if (!_2942)
        {
            _2938 = _2886;
        }
        float _2952 = _2938;
        float _2954 = _2952;
        if (!_2942)
        {
            _2906 = _2876;
        }
        float _2956 = _2906;
        float _2958 = _2956;
        if (!_2942)
        {
            _2914 = _2878;
        }
        float _2960 = _2914;
        _2916 = _2960;
        if (_2942)
        {
            _2946 = _2882;
        }
        float _2962 = _2946;
        _2924 = _2962;
        if (_2942)
        {
            _2950 = _2884;
        }
        float _2964 = _2950;
        _2932 = _2964;
        if (_2942)
        {
            _2954 = _2886;
        }
        float _2966 = _2954;
        _2940 = _2966;
        if (_2942)
        {
            _2958 = _672;
        }
        float _2968 = _2958;
        _2908 = _2968;
        if (_2942)
        {
            _2900 = _674;
        }
        float _2970 = _2900;
        _2902 = _2970;
        if (_2942)
        {
            _2916 = _676;
        }
    }
    float _2972 = _2902;
    float _2974 = _2932;
    float _2976 = _2908;
    float _2978 = _2924;
    float _2980 = _2916;
    float _2982 = _2940;
    float _2984 = -_2972;
    float _2986 = _2974 + _2984;
    float _2988 = -_2976;
    float _2990 = _2978 + _2988;
    float _2992 = -_2980;
    float _2994 = _2982 + _2992;
    float _2996 = -_2972;
    float _2998 = _446 + _2996;
    float _3000 = _2986 * _2986;
    float _3002 = _2986 * _2998;
    float _3004 = fma(_2990, _2990, _3000);
    float _3006 = -_2976;
    float _3008 = _444 + _3006;
    float _3010 = -_2980;
    float _3012 = _448 + _3010;
    float _3014 = fma(_2994, _2994, _3004);
    float _3016 = fma(_2990, _3008, _3002);
    float _3018 = fma(_2994, _3012, _3016);
    float _3020 = 1.0 / _3014;
    float _3022 = _3020 * 3.0;
    float _3024 = _3022 * _3018;
    float _3026 = rint(_3024);
    float _3028 = precise::max(0.0, _3026);
    float _3030 = precise::min(_3028, 3.0);
    float _3032 = trunc(_3030);
    int _3035 = int(_3032);
    bool _3037 = _3035 >= 2;
    bool _3039 = !_3037;
    float _3041 = _2990;
    float _3043 = _2986;
    float _3045 = _2994;
    float _3047 = _2976;
    float _3049 = _2978;
    float _3051 = _2972;
    float _3053 = _2974;
    float _3055 = _2980;
    float _3057 = _2982;
    float _3067;
    float _3069;
    float _3071;
    float _3073;
    float _3075;
    float _3077;
    float _3079;
    float _3081;
    float _3083;
    float _3085;
    float _3087;
    float _3089;
    float _3091;
    float _3093;
    float _3095;
    float _3097;
    if (!_3039)
    {
        bool _3059 = _3035 >= 3;
        bool _3061 = !_3059;
        if (!_3061)
        {
            bool _3063 = _3035 != 3;
            _3065 = _3063;
            if (!_3065)
            {
                _3067 = _444;
                _3069 = _446;
                _3071 = _448;
                _3073 = 1.0;
                _3075 = 0.0;
                _3077 = 0.0;
                _3079 = 0.0;
                _3081 = 0.0;
                _3083 = 0.0;
                _3085 = 0.0;
                _3087 = 0.0;
                _3089 = 0.0;
                _3091 = 0.0;
                _3093 = 0.0;
                _3095 = 0.0;
                _3097 = 0.0;
                _3099 = true;
            }
        }
        else
        {
            _3067 = 0.0;
            _3069 = 0.0;
            _3071 = 0.0;
            _3073 = 0.0;
            _3075 = 0.0;
            _3077 = 0.0;
            _3079 = 0.0;
            _3081 = 0.0;
            _3083 = _444;
            _3085 = _446;
            _3087 = _448;
            _3089 = 1.0;
            _3091 = 0.0;
            _3093 = 0.0;
            _3095 = 0.0;
            _3097 = 0.0;
            _3099 = true;
        }
    }
    if ((!_3099) || _3065)
    {
        bool _3101;
        if (!_3065)
        {
            _3101 = _3035 >= 1;
        }
        if ((!_3101) || _3065)
        {
            bool _3103;
            if (!_3065)
            {
                _3103 = _3035 != 0;
            }
            if ((!_3103) && (!_3065))
            {
                _3067 = 0.0;
                _3069 = 0.0;
                _3071 = 0.0;
                _3073 = 0.0;
                _3075 = _444;
                _3077 = _446;
                _3079 = _448;
                _3081 = 1.0;
                _3083 = 0.0;
                _3085 = 0.0;
                _3087 = 0.0;
                _3089 = 0.0;
                _3091 = 0.0;
                _3093 = 0.0;
                _3095 = 0.0;
                _3097 = 0.0;
                _3099 = true;
            }
            else
            {
                _3065 = false;
                _3067 = 0.0;
                _3069 = 0.0;
                _3071 = 0.0;
                _3073 = 0.0;
                _3075 = 0.0;
                _3077 = 0.0;
                _3079 = 0.0;
                _3081 = 0.0;
                _3083 = 0.0;
                _3085 = 0.0;
                _3087 = 0.0;
                _3089 = 0.0;
                _3091 = 0.0;
                _3093 = 0.0;
                _3095 = 0.0;
                _3097 = 0.0;
                _3099 = true;
            }
        }
        else
        {
            _3067 = 0.0;
            _3069 = 0.0;
            _3071 = 0.0;
            _3073 = 0.0;
            _3075 = 0.0;
            _3077 = 0.0;
            _3079 = 0.0;
            _3081 = 0.0;
            _3083 = 0.0;
            _3085 = 0.0;
            _3087 = 0.0;
            _3089 = 0.0;
            _3091 = _444;
            _3093 = _446;
            _3095 = _448;
            _3097 = 1.0;
        }
    }
    _3099 = false;
    float _3105 = _3067;
    float _3107 = _3069;
    float _3109 = _3071;
    float _3111 = _3073;
    float _3113 = _3075;
    float _3115 = _3077;
    float _3117 = _3079;
    float _3119 = _3081;
    float _3121 = _3083;
    float _3123 = _3085;
    float _3125 = _3087;
    float _3127 = _3089;
    float _3129 = _3091;
    float _3131 = _3093;
    float _3133 = _3095;
    float _3135 = _3097;
    float _3137 = -_2972;
    float _3139 = _456 + _3137;
    float _3141 = -_2976;
    float _3143 = _454 + _3141;
    float _3145 = _2986 * _3139;
    float _3147 = -_2980;
    float _3149 = _458 + _3147;
    float _3151 = fma(_2990, _3143, _3145);
    float _3153 = fma(_2994, _3149, _3151);
    float _3155 = _3022 * _3153;
    float _3157 = rint(_3155);
    float _3159 = precise::max(0.0, _3157);
    float _3161 = precise::min(_3159, 3.0);
    float _3163 = trunc(_3161);
    int _3165 = int(_3163);
    bool _3167 = _3165 >= 2;
    bool _3169 = !_3167;
    float _3171 = as_type<float>(_3165);
    float _3173 = _3157;
    float _3175 = _3151;
    float _3177 = _3145;
    float _3179 = _3105;
    float _3181 = _3107;
    float _3183 = _3109;
    float _3185 = _3111;
    float _3187 = _3121;
    float _3189 = _3123;
    float _3191 = _3125;
    float _3193 = _3127;
    float _3195 = _3129;
    float _3197 = _3131;
    float _3199 = _3133;
    float _3201 = _3135;
    float _3219;
    float _3221;
    float _3223;
    float _3225;
    if (!_3169)
    {
        bool _3203 = _3165 >= 3;
        bool _3205 = !_3203;
        if (!_3205)
        {
            bool _3207 = _3165 != 3;
            _3209 = _3207;
            if (!_3209)
            {
                float _3211 = _454 + _3105;
                float _3213 = _456 + _3107;
                float _3215 = _458 + _3109;
                float _3217 = _3111 + 1.0;
                _3179 = _3211;
                _3181 = _3213;
                _3183 = _3215;
                _3185 = _3217;
                _3219 = _3113;
                _3221 = _3115;
                _3223 = _3117;
                _3225 = _3119;
                _3227 = true;
            }
        }
        else
        {
            float _3229 = _454 + _3121;
            float _3231 = _456 + _3123;
            float _3233 = _458 + _3125;
            float _3235 = _3127 + 1.0;
            _3219 = _3113;
            _3221 = _3115;
            _3223 = _3117;
            _3225 = _3119;
            _3187 = _3229;
            _3189 = _3231;
            _3191 = _3233;
            _3193 = _3235;
            _3227 = true;
        }
    }
    if ((!_3227) || _3209)
    {
        bool _3237;
        if (!_3209)
        {
            _3237 = _3165 >= 1;
        }
        if ((!_3237) || _3209)
        {
            if (!_3209)
            {
                bool _3239 = _3165 != 0;
                if (!_3239)
                {
                    float _3241 = _454 + _3113;
                    _3171 = _3241;
                }
                float _3243 = _3171;
                _3219 = _3243;
                if (!_3239)
                {
                    float _3245 = _456 + _3115;
                    _3173 = _3245;
                }
                float _3247 = _3173;
                _3221 = _3247;
                if (!_3239)
                {
                    float _3249 = _458 + _3117;
                    _3175 = _3249;
                }
                float _3251 = _3175;
                _3223 = _3251;
                if (!_3239)
                {
                    float _3253 = _3119 + 1.0;
                    _3177 = _3253;
                }
                float _3255 = _3177;
                bool _3257 = !_3239;
                _3225 = _3255;
                _3227 = _3257;
            }
            if ((!_3227) || _3209)
            {
                _3209 = false;
                _3219 = _3113;
                _3221 = _3115;
                _3223 = _3117;
                _3225 = _3119;
                _3227 = true;
            }
        }
        else
        {
            float _3259 = _454 + _3129;
            float _3261 = _456 + _3131;
            float _3263 = _458 + _3133;
            float _3265 = _3135 + 1.0;
            _3219 = _3113;
            _3221 = _3115;
            _3223 = _3117;
            _3225 = _3119;
            _3195 = _3259;
            _3197 = _3261;
            _3199 = _3263;
            _3201 = _3265;
        }
    }
    _3227 = false;
    float _3267 = _3179;
    float _3269 = _3181;
    float _3271 = _3183;
    float _3273 = _3185;
    float _3275 = _3219;
    float _3277 = _3221;
    float _3279 = _3223;
    float _3281 = _3225;
    float _3283 = _3187;
    float _3285 = _3189;
    float _3287 = _3191;
    float _3289 = _3193;
    float _3291 = _3195;
    float _3293 = _3197;
    float _3295 = _3199;
    float _3297 = _3201;
    float _3299 = -_2972;
    float _3301 = _466 + _3299;
    float _3303 = -_2976;
    float _3305 = _464 + _3303;
    float _3307 = _2986 * _3301;
    float _3309 = -_2980;
    float _3311 = _468 + _3309;
    float _3313 = fma(_2990, _3305, _3307);
    float _3315 = fma(_2994, _3311, _3313);
    float _3317 = _3022 * _3315;
    float _3319 = rint(_3317);
    float _3321 = precise::max(0.0, _3319);
    float _3323 = precise::min(_3321, 3.0);
    float _3325 = trunc(_3323);
    int _3327 = int(_3325);
    bool _3329 = _3327 >= 2;
    bool _3331 = !_3329;
    float _3333 = _3319;
    float _3335 = as_type<float>(_3327);
    float _3337 = _3307;
    float _3339 = _3313;
    float _3341 = _3267;
    float _3343 = _3269;
    float _3345 = _3271;
    float _3347 = _3273;
    float _3349 = _3283;
    float _3351 = _3285;
    float _3353 = _3287;
    float _3355 = _3289;
    float _3357 = _3291;
    float _3359 = _3293;
    float _3361 = _3295;
    float _3363 = _3297;
    float _3381;
    float _3383;
    float _3385;
    float _3387;
    if (!_3331)
    {
        bool _3365 = _3327 >= 3;
        bool _3367 = !_3365;
        if (!_3367)
        {
            bool _3369 = _3327 != 3;
            _3371 = _3369;
            if (!_3371)
            {
                float _3373 = _464 + _3267;
                float _3375 = _466 + _3269;
                float _3377 = _468 + _3271;
                float _3379 = _3273 + 1.0;
                _3341 = _3373;
                _3343 = _3375;
                _3345 = _3377;
                _3347 = _3379;
                _3381 = _3275;
                _3383 = _3277;
                _3385 = _3279;
                _3387 = _3281;
                _3389 = true;
            }
        }
        else
        {
            float _3391 = _464 + _3283;
            float _3393 = _466 + _3285;
            float _3395 = _468 + _3287;
            float _3397 = _3289 + 1.0;
            _3381 = _3275;
            _3383 = _3277;
            _3385 = _3279;
            _3387 = _3281;
            _3349 = _3391;
            _3351 = _3393;
            _3353 = _3395;
            _3355 = _3397;
            _3389 = true;
        }
    }
    if ((!_3389) || _3371)
    {
        bool _3399;
        if (!_3371)
        {
            _3399 = _3327 >= 1;
        }
        if ((!_3399) || _3371)
        {
            if (!_3371)
            {
                bool _3401 = _3327 != 0;
                if (!_3401)
                {
                    float _3403 = _464 + _3275;
                    _3333 = _3403;
                }
                float _3405 = _3333;
                _3381 = _3405;
                if (!_3401)
                {
                    float _3407 = _466 + _3277;
                    _3335 = _3407;
                }
                float _3409 = _3335;
                _3383 = _3409;
                if (!_3401)
                {
                    float _3411 = _468 + _3279;
                    _3337 = _3411;
                }
                float _3413 = _3337;
                _3385 = _3413;
                if (!_3401)
                {
                    float _3415 = _3281 + 1.0;
                    _3339 = _3415;
                }
                float _3417 = _3339;
                bool _3419 = !_3401;
                _3387 = _3417;
                _3389 = _3419;
            }
            if ((!_3389) || _3371)
            {
                _3371 = false;
                _3381 = _3275;
                _3383 = _3277;
                _3385 = _3279;
                _3387 = _3281;
                _3389 = true;
            }
        }
        else
        {
            float _3421 = _464 + _3291;
            float _3423 = _466 + _3293;
            float _3425 = _468 + _3295;
            float _3427 = _3297 + 1.0;
            _3381 = _3275;
            _3383 = _3277;
            _3385 = _3279;
            _3387 = _3281;
            _3357 = _3421;
            _3359 = _3423;
            _3361 = _3425;
            _3363 = _3427;
        }
    }
    _3389 = false;
    float _3429 = _3341;
    float _3431 = _3343;
    float _3433 = _3345;
    float _3435 = _3347;
    float _3437 = _3381;
    float _3439 = _3383;
    float _3441 = _3385;
    float _3443 = _3387;
    float _3445 = _3349;
    float _3447 = _3351;
    float _3449 = _3353;
    float _3451 = _3355;
    float _3453 = _3357;
    float _3455 = _3359;
    float _3457 = _3361;
    float _3459 = _3363;
    float _3461 = -_2972;
    float _3463 = _500 + _3461;
    float _3465 = -_2976;
    float _3467 = _498 + _3465;
    float _3469 = _2986 * _3463;
    float _3471 = -_2980;
    float _3473 = _502 + _3471;
    float _3475 = fma(_2990, _3467, _3469);
    float _3477 = fma(_2994, _3473, _3475);
    float _3479 = _3022 * _3477;
    float _3481 = rint(_3479);
    float _3483 = precise::max(0.0, _3481);
    float _3485 = precise::min(_3483, 3.0);
    float _3487 = trunc(_3485);
    int _3489 = int(_3487);
    bool _3491 = _3489 >= 2;
    bool _3493 = !_3491;
    float _3495 = as_type<float>(_3489);
    float _3497 = _3481;
    float _3499 = _3475;
    float _3501 = _3469;
    float _3503 = _3429;
    float _3505 = _3431;
    float _3507 = _3433;
    float _3509 = _3435;
    float _3511 = _3445;
    float _3513 = _3447;
    float _3515 = _3449;
    float _3517 = _3451;
    float _3519 = _3453;
    float _3521 = _3455;
    float _3523 = _3457;
    float _3525 = _3459;
    float _3543;
    float _3545;
    float _3547;
    float _3549;
    if (!_3493)
    {
        bool _3527 = _3489 >= 3;
        bool _3529 = !_3527;
        if (!_3529)
        {
            bool _3531 = _3489 != 3;
            _3533 = _3531;
            if (!_3533)
            {
                float _3535 = _498 + _3429;
                float _3537 = _500 + _3431;
                float _3539 = _502 + _3433;
                float _3541 = _3435 + 1.0;
                _3503 = _3535;
                _3505 = _3537;
                _3507 = _3539;
                _3509 = _3541;
                _3543 = _3437;
                _3545 = _3439;
                _3547 = _3441;
                _3549 = _3443;
                _3551 = true;
            }
        }
        else
        {
            float _3553 = _498 + _3445;
            float _3555 = _500 + _3447;
            float _3557 = _502 + _3449;
            float _3559 = _3451 + 1.0;
            _3543 = _3437;
            _3545 = _3439;
            _3547 = _3441;
            _3549 = _3443;
            _3511 = _3553;
            _3513 = _3555;
            _3515 = _3557;
            _3517 = _3559;
            _3551 = true;
        }
    }
    if ((!_3551) || _3533)
    {
        bool _3561;
        if (!_3533)
        {
            _3561 = _3489 >= 1;
        }
        if ((!_3561) || _3533)
        {
            if (!_3533)
            {
                bool _3563 = _3489 != 0;
                if (!_3563)
                {
                    float _3565 = _498 + _3437;
                    _3495 = _3565;
                }
                float _3567 = _3495;
                _3543 = _3567;
                if (!_3563)
                {
                    float _3569 = _500 + _3439;
                    _3497 = _3569;
                }
                float _3571 = _3497;
                _3545 = _3571;
                if (!_3563)
                {
                    float _3573 = _502 + _3441;
                    _3499 = _3573;
                }
                float _3575 = _3499;
                _3547 = _3575;
                if (!_3563)
                {
                    float _3577 = _3443 + 1.0;
                    _3501 = _3577;
                }
                float _3579 = _3501;
                bool _3581 = !_3563;
                _3549 = _3579;
                _3551 = _3581;
            }
            if ((!_3551) || _3533)
            {
                _3533 = false;
                _3543 = _3437;
                _3545 = _3439;
                _3547 = _3441;
                _3549 = _3443;
                _3551 = true;
            }
        }
        else
        {
            float _3583 = _498 + _3453;
            float _3585 = _500 + _3455;
            float _3587 = _502 + _3457;
            float _3589 = _3459 + 1.0;
            _3543 = _3437;
            _3545 = _3439;
            _3547 = _3441;
            _3549 = _3443;
            _3519 = _3583;
            _3521 = _3585;
            _3523 = _3587;
            _3525 = _3589;
        }
    }
    _3551 = false;
    float _3591 = _3503;
    float _3593 = _3505;
    float _3595 = _3507;
    float _3597 = _3509;
    float _3599 = _3543;
    float _3601 = _3545;
    float _3603 = _3547;
    float _3605 = _3549;
    float _3607 = _3511;
    float _3609 = _3513;
    float _3611 = _3515;
    float _3613 = _3517;
    float _3615 = _3519;
    float _3617 = _3521;
    float _3619 = _3523;
    float _3621 = _3525;
    float _3623 = -_2972;
    float _3625 = _512 + _3623;
    float _3627 = -_2976;
    float _3629 = _510 + _3627;
    float _3631 = _2986 * _3625;
    float _3633 = -_2980;
    float _3635 = _514 + _3633;
    float _3637 = fma(_2990, _3629, _3631);
    float _3639 = fma(_2994, _3635, _3637);
    float _3641 = _3022 * _3639;
    float _3643 = rint(_3641);
    float _3645 = precise::max(0.0, _3643);
    float _3647 = precise::min(_3645, 3.0);
    float _3649 = trunc(_3647);
    int _3651 = int(_3649);
    bool _3653 = _3651 >= 2;
    bool _3655 = !_3653;
    float _3657 = _3643;
    float _3659 = as_type<float>(_3651);
    float _3661 = _3631;
    float _3663 = _3637;
    float _3665 = _3591;
    float _3667 = _3593;
    float _3669 = _3595;
    float _3671 = _3597;
    float _3673 = _3607;
    float _3675 = _3609;
    float _3677 = _3611;
    float _3679 = _3613;
    float _3681 = _3615;
    float _3683 = _3617;
    float _3685 = _3619;
    float _3687 = _3621;
    float _3705;
    float _3707;
    float _3709;
    float _3711;
    if (!_3655)
    {
        bool _3689 = _3651 >= 3;
        bool _3691 = !_3689;
        if (!_3691)
        {
            bool _3693 = _3651 != 3;
            _3695 = _3693;
            if (!_3695)
            {
                float _3697 = _510 + _3591;
                float _3699 = _512 + _3593;
                float _3701 = _514 + _3595;
                float _3703 = _3597 + 1.0;
                _3665 = _3697;
                _3667 = _3699;
                _3669 = _3701;
                _3671 = _3703;
                _3705 = _3599;
                _3707 = _3601;
                _3709 = _3603;
                _3711 = _3605;
                _3713 = true;
            }
        }
        else
        {
            float _3715 = _510 + _3607;
            float _3717 = _512 + _3609;
            float _3719 = _514 + _3611;
            float _3721 = _3613 + 1.0;
            _3705 = _3599;
            _3707 = _3601;
            _3709 = _3603;
            _3711 = _3605;
            _3673 = _3715;
            _3675 = _3717;
            _3677 = _3719;
            _3679 = _3721;
            _3713 = true;
        }
    }
    if ((!_3713) || _3695)
    {
        bool _3723;
        if (!_3695)
        {
            _3723 = _3651 >= 1;
        }
        if ((!_3723) || _3695)
        {
            if (!_3695)
            {
                bool _3725 = _3651 != 0;
                if (!_3725)
                {
                    float _3727 = _510 + _3599;
                    _3657 = _3727;
                }
                float _3729 = _3657;
                _3705 = _3729;
                if (!_3725)
                {
                    float _3731 = _512 + _3601;
                    _3659 = _3731;
                }
                float _3733 = _3659;
                _3707 = _3733;
                if (!_3725)
                {
                    float _3735 = _514 + _3603;
                    _3661 = _3735;
                }
                float _3737 = _3661;
                _3709 = _3737;
                if (!_3725)
                {
                    float _3739 = _3605 + 1.0;
                    _3663 = _3739;
                }
                float _3741 = _3663;
                bool _3743 = !_3725;
                _3711 = _3741;
                _3713 = _3743;
            }
            if ((!_3713) || _3695)
            {
                _3695 = false;
                _3705 = _3599;
                _3707 = _3601;
                _3709 = _3603;
                _3711 = _3605;
                _3713 = true;
            }
        }
        else
        {
            float _3745 = _510 + _3615;
            float _3747 = _512 + _3617;
            float _3749 = _514 + _3619;
            float _3751 = _3621 + 1.0;
            _3705 = _3599;
            _3707 = _3601;
            _3709 = _3603;
            _3711 = _3605;
            _3681 = _3745;
            _3683 = _3747;
            _3685 = _3749;
            _3687 = _3751;
        }
    }
    _3713 = false;
    float _3753 = _3665;
    float _3755 = _3667;
    float _3757 = _3669;
    float _3759 = _3671;
    float _3761 = _3705;
    float _3763 = _3707;
    float _3765 = _3709;
    float _3767 = _3711;
    float _3769 = _3673;
    float _3771 = _3675;
    float _3773 = _3677;
    float _3775 = _3679;
    float _3777 = _3681;
    float _3779 = _3683;
    float _3781 = _3685;
    float _3783 = _3687;
    float _3785 = -_2972;
    float _3787 = _522 + _3785;
    float _3789 = -_2976;
    float _3791 = _520 + _3789;
    float _3793 = _2986 * _3787;
    float _3795 = -_2980;
    float _3797 = _524 + _3795;
    float _3799 = fma(_2990, _3791, _3793);
    float _3801 = fma(_2994, _3797, _3799);
    float _3803 = _3022 * _3801;
    float _3805 = rint(_3803);
    float _3807 = precise::max(0.0, _3805);
    float _3809 = precise::min(_3807, 3.0);
    float _3811 = trunc(_3809);
    int _3813 = int(_3811);
    bool _3815 = _3813 >= 2;
    bool _3817 = !_3815;
    float _3819 = as_type<float>(_3813);
    float _3821 = _3805;
    float _3823 = _3799;
    float _3825 = _3793;
    float _3827 = _3753;
    float _3829 = _3755;
    float _3831 = _3757;
    float _3833 = _3759;
    float _3835 = _3769;
    float _3837 = _3771;
    float _3839 = _3773;
    float _3841 = _3775;
    float _3843 = _3777;
    float _3845 = _3779;
    float _3847 = _3781;
    float _3849 = _3783;
    float _3867;
    float _3869;
    float _3871;
    float _3873;
    if (!_3817)
    {
        bool _3851 = _3813 >= 3;
        bool _3853 = !_3851;
        if (!_3853)
        {
            bool _3855 = _3813 != 3;
            _3857 = _3855;
            if (!_3857)
            {
                float _3859 = _520 + _3753;
                float _3861 = _522 + _3755;
                float _3863 = _524 + _3757;
                float _3865 = _3759 + 1.0;
                _3827 = _3859;
                _3829 = _3861;
                _3831 = _3863;
                _3833 = _3865;
                _3867 = _3761;
                _3869 = _3763;
                _3871 = _3765;
                _3873 = _3767;
                _3875 = true;
            }
        }
        else
        {
            float _3877 = _520 + _3769;
            float _3879 = _522 + _3771;
            float _3881 = _524 + _3773;
            float _3883 = _3775 + 1.0;
            _3867 = _3761;
            _3869 = _3763;
            _3871 = _3765;
            _3873 = _3767;
            _3835 = _3877;
            _3837 = _3879;
            _3839 = _3881;
            _3841 = _3883;
            _3875 = true;
        }
    }
    if ((!_3875) || _3857)
    {
        bool _3885;
        if (!_3857)
        {
            _3885 = _3813 >= 1;
        }
        if ((!_3885) || _3857)
        {
            if (!_3857)
            {
                bool _3887 = _3813 != 0;
                if (!_3887)
                {
                    float _3889 = _520 + _3761;
                    _3819 = _3889;
                }
                float _3891 = _3819;
                _3867 = _3891;
                if (!_3887)
                {
                    float _3893 = _522 + _3763;
                    _3821 = _3893;
                }
                float _3895 = _3821;
                _3869 = _3895;
                if (!_3887)
                {
                    float _3897 = _524 + _3765;
                    _3823 = _3897;
                }
                float _3899 = _3823;
                _3871 = _3899;
                if (!_3887)
                {
                    float _3901 = _3767 + 1.0;
                    _3825 = _3901;
                }
                float _3903 = _3825;
                bool _3905 = !_3887;
                _3873 = _3903;
                _3875 = _3905;
            }
            if ((!_3875) || _3857)
            {
                _3857 = false;
                _3867 = _3761;
                _3869 = _3763;
                _3871 = _3765;
                _3873 = _3767;
                _3875 = true;
            }
        }
        else
        {
            float _3907 = _520 + _3777;
            float _3909 = _522 + _3779;
            float _3911 = _524 + _3781;
            float _3913 = _3783 + 1.0;
            _3867 = _3761;
            _3869 = _3763;
            _3871 = _3765;
            _3873 = _3767;
            _3843 = _3907;
            _3845 = _3909;
            _3847 = _3911;
            _3849 = _3913;
        }
    }
    _3875 = false;
    float _3915 = _3827;
    float _3917 = _3829;
    float _3919 = _3831;
    float _3921 = _3833;
    float _3923 = _3867;
    float _3925 = _3869;
    float _3927 = _3871;
    float _3929 = _3873;
    float _3931 = _3835;
    float _3933 = _3837;
    float _3935 = _3839;
    float _3937 = _3841;
    float _3939 = _3843;
    float _3941 = _3845;
    float _3943 = _3847;
    float _3945 = _3849;
    float _3947 = -_2972;
    float _3949 = _532 + _3947;
    float _3951 = -_2976;
    float _3953 = _530 + _3951;
    float _3955 = _2986 * _3949;
    float _3957 = -_2980;
    float _3959 = _534 + _3957;
    float _3961 = fma(_2990, _3953, _3955);
    float _3963 = fma(_2994, _3959, _3961);
    float _3965 = _3022 * _3963;
    float _3967 = rint(_3965);
    float _3969 = precise::max(0.0, _3967);
    float _3971 = precise::min(_3969, 3.0);
    float _3973 = trunc(_3971);
    int _3975 = int(_3973);
    bool _3977 = _3975 >= 2;
    bool _3979 = !_3977;
    float _3981 = _3967;
    float _3983 = as_type<float>(_3975);
    float _3985 = _3955;
    float _3987 = _3961;
    float _3989 = _3915;
    float _3991 = _3917;
    float _3993 = _3919;
    float _3995 = _3921;
    float _3997 = _3931;
    float _3999 = _3933;
    float _4001 = _3935;
    float _4003 = _3937;
    float _4005 = _3939;
    float _4007 = _3941;
    float _4009 = _3943;
    float _4011 = _3945;
    float _4029;
    float _4031;
    float _4033;
    float _4035;
    if (!_3979)
    {
        bool _4013 = _3975 >= 3;
        bool _4015 = !_4013;
        if (!_4015)
        {
            bool _4017 = _3975 != 3;
            _4019 = _4017;
            if (!_4019)
            {
                float _4021 = _530 + _3915;
                float _4023 = _532 + _3917;
                float _4025 = _534 + _3919;
                float _4027 = _3921 + 1.0;
                _3989 = _4021;
                _3991 = _4023;
                _3993 = _4025;
                _3995 = _4027;
                _4029 = _3923;
                _4031 = _3925;
                _4033 = _3927;
                _4035 = _3929;
                _4037 = true;
            }
        }
        else
        {
            float _4039 = _530 + _3931;
            float _4041 = _532 + _3933;
            float _4043 = _534 + _3935;
            float _4045 = _3937 + 1.0;
            _4029 = _3923;
            _4031 = _3925;
            _4033 = _3927;
            _4035 = _3929;
            _3997 = _4039;
            _3999 = _4041;
            _4001 = _4043;
            _4003 = _4045;
            _4037 = true;
        }
    }
    if ((!_4037) || _4019)
    {
        bool _4047;
        if (!_4019)
        {
            _4047 = _3975 >= 1;
        }
        if ((!_4047) || _4019)
        {
            if (!_4019)
            {
                bool _4049 = _3975 != 0;
                if (!_4049)
                {
                    float _4051 = _530 + _3923;
                    _3981 = _4051;
                }
                float _4053 = _3981;
                _4029 = _4053;
                if (!_4049)
                {
                    float _4055 = _532 + _3925;
                    _3983 = _4055;
                }
                float _4057 = _3983;
                _4031 = _4057;
                if (!_4049)
                {
                    float _4059 = _534 + _3927;
                    _3985 = _4059;
                }
                float _4061 = _3985;
                _4033 = _4061;
                if (!_4049)
                {
                    float _4063 = _3929 + 1.0;
                    _3987 = _4063;
                }
                float _4065 = _3987;
                bool _4067 = !_4049;
                _4035 = _4065;
                _4037 = _4067;
            }
            if ((!_4037) || _4019)
            {
                _4019 = false;
                _4029 = _3923;
                _4031 = _3925;
                _4033 = _3927;
                _4035 = _3929;
                _4037 = true;
            }
        }
        else
        {
            float _4069 = _530 + _3939;
            float _4071 = _532 + _3941;
            float _4073 = _534 + _3943;
            float _4075 = _3945 + 1.0;
            _4029 = _3923;
            _4031 = _3925;
            _4033 = _3927;
            _4035 = _3929;
            _4005 = _4069;
            _4007 = _4071;
            _4009 = _4073;
            _4011 = _4075;
        }
    }
    _4037 = false;
    float _4077 = _3989;
    float _4079 = _3991;
    float _4081 = _3993;
    float _4083 = _3995;
    float _4085 = _4029;
    float _4087 = _4031;
    float _4089 = _4033;
    float _4091 = _4035;
    float _4093 = _3997;
    float _4095 = _3999;
    float _4097 = _4001;
    float _4099 = _4003;
    float _4101 = _4005;
    float _4103 = _4007;
    float _4105 = _4009;
    float _4107 = _4011;
    float _4109 = -_2972;
    float _4111 = _572 + _4109;
    float _4113 = -_2976;
    float _4115 = _570 + _4113;
    float _4117 = _2986 * _4111;
    float _4119 = -_2980;
    float _4121 = _574 + _4119;
    float _4123 = fma(_2990, _4115, _4117);
    float _4125 = fma(_2994, _4121, _4123);
    float _4127 = _3022 * _4125;
    float _4129 = rint(_4127);
    float _4131 = precise::max(0.0, _4129);
    float _4133 = precise::min(_4131, 3.0);
    float _4135 = trunc(_4133);
    int _4137 = int(_4135);
    bool _4139 = _4137 >= 2;
    bool _4141 = !_4139;
    float _4143 = _4117;
    float _4145 = _4123;
    float _4147 = _4129;
    float _4149 = as_type<float>(_4137);
    float _4151 = _4077;
    float _4153 = _4079;
    float _4155 = _4081;
    float _4157 = _4083;
    float _4159 = _4093;
    float _4161 = _4095;
    float _4163 = _4097;
    float _4165 = _4099;
    float _4167 = _4101;
    float _4169 = _4103;
    float _4171 = _4105;
    float _4173 = _4107;
    float _4191;
    float _4193;
    float _4195;
    float _4197;
    if (!_4141)
    {
        bool _4175 = _4137 >= 3;
        bool _4177 = !_4175;
        if (!_4177)
        {
            bool _4179 = _4137 != 3;
            _4181 = _4179;
            if (!_4181)
            {
                float _4183 = _570 + _4077;
                float _4185 = _572 + _4079;
                float _4187 = _574 + _4081;
                float _4189 = _4083 + 1.0;
                _4151 = _4183;
                _4153 = _4185;
                _4155 = _4187;
                _4157 = _4189;
                _4191 = _4085;
                _4193 = _4087;
                _4195 = _4089;
                _4197 = _4091;
                _4199 = true;
            }
        }
        else
        {
            float _4201 = _570 + _4093;
            float _4203 = _572 + _4095;
            float _4205 = _574 + _4097;
            float _4207 = _4099 + 1.0;
            _4191 = _4085;
            _4193 = _4087;
            _4195 = _4089;
            _4197 = _4091;
            _4159 = _4201;
            _4161 = _4203;
            _4163 = _4205;
            _4165 = _4207;
            _4199 = true;
        }
    }
    if ((!_4199) || _4181)
    {
        bool _4209;
        if (!_4181)
        {
            _4209 = _4137 >= 1;
        }
        if ((!_4209) || _4181)
        {
            if (!_4181)
            {
                bool _4211 = _4137 != 0;
                if (!_4211)
                {
                    float _4213 = _570 + _4085;
                    _4143 = _4213;
                }
                float _4215 = _4143;
                _4191 = _4215;
                if (!_4211)
                {
                    float _4217 = _572 + _4087;
                    _4145 = _4217;
                }
                float _4219 = _4145;
                _4193 = _4219;
                if (!_4211)
                {
                    float _4221 = _574 + _4089;
                    _4147 = _4221;
                }
                float _4223 = _4147;
                _4195 = _4223;
                if (!_4211)
                {
                    float _4225 = _4091 + 1.0;
                    _4149 = _4225;
                }
                float _4227 = _4149;
                bool _4229 = !_4211;
                _4197 = _4227;
                _4199 = _4229;
            }
            if ((!_4199) || _4181)
            {
                _4181 = false;
                _4191 = _4085;
                _4193 = _4087;
                _4195 = _4089;
                _4197 = _4091;
                _4199 = true;
            }
        }
        else
        {
            float _4231 = _570 + _4101;
            float _4233 = _572 + _4103;
            float _4235 = _574 + _4105;
            float _4237 = _4107 + 1.0;
            _4191 = _4085;
            _4193 = _4087;
            _4195 = _4089;
            _4197 = _4091;
            _4167 = _4231;
            _4169 = _4233;
            _4171 = _4235;
            _4173 = _4237;
        }
    }
    _4199 = false;
    float _4239 = _4151;
    float _4241 = _4153;
    float _4243 = _4155;
    float _4245 = _4157;
    float _4247 = _4191;
    float _4249 = _4193;
    float _4251 = _4195;
    float _4253 = _4197;
    float _4255 = _4159;
    float _4257 = _4161;
    float _4259 = _4163;
    float _4261 = _4165;
    float _4263 = _4167;
    float _4265 = _4169;
    float _4267 = _4171;
    float _4269 = _4173;
    float _4271 = -_2972;
    float _4273 = _582 + _4271;
    float _4275 = -_2976;
    float _4277 = _580 + _4275;
    float _4279 = _2986 * _4273;
    float _4281 = -_2980;
    float _4283 = _584 + _4281;
    float _4285 = fma(_2990, _4277, _4279);
    float _4287 = fma(_2994, _4283, _4285);
    float _4289 = _3022 * _4287;
    float _4291 = rint(_4289);
    float _4293 = precise::max(0.0, _4291);
    float _4295 = precise::min(_4293, 3.0);
    float _4297 = trunc(_4295);
    int _4299 = int(_4297);
    bool _4301 = _4299 >= 2;
    bool _4303 = !_4301;
    float _4305 = _4291;
    float _4307 = as_type<float>(_4299);
    float _4309 = _4279;
    float _4311 = _4285;
    float _4313 = _4239;
    float _4315 = _4241;
    float _4317 = _4243;
    float _4319 = _4245;
    float _4321 = _4255;
    float _4323 = _4257;
    float _4325 = _4259;
    float _4327 = _4261;
    float _4329 = _4263;
    float _4331 = _4265;
    float _4333 = _4267;
    float _4335 = _4269;
    float _4353;
    float _4355;
    float _4357;
    float _4359;
    if (!_4303)
    {
        bool _4337 = _4299 >= 3;
        bool _4339 = !_4337;
        if (!_4339)
        {
            bool _4341 = _4299 != 3;
            _4343 = _4341;
            if (!_4343)
            {
                float _4345 = _580 + _4239;
                float _4347 = _582 + _4241;
                float _4349 = _584 + _4243;
                float _4351 = _4245 + 1.0;
                _4313 = _4345;
                _4315 = _4347;
                _4317 = _4349;
                _4319 = _4351;
                _4353 = _4247;
                _4355 = _4249;
                _4357 = _4251;
                _4359 = _4253;
                _4361 = true;
            }
        }
        else
        {
            float _4363 = _580 + _4255;
            float _4365 = _582 + _4257;
            float _4367 = _584 + _4259;
            float _4369 = _4261 + 1.0;
            _4353 = _4247;
            _4355 = _4249;
            _4357 = _4251;
            _4359 = _4253;
            _4321 = _4363;
            _4323 = _4365;
            _4325 = _4367;
            _4327 = _4369;
            _4361 = true;
        }
    }
    if ((!_4361) || _4343)
    {
        bool _4371;
        if (!_4343)
        {
            _4371 = _4299 >= 1;
        }
        if ((!_4371) || _4343)
        {
            if (!_4343)
            {
                bool _4373 = _4299 != 0;
                if (!_4373)
                {
                    float _4375 = _580 + _4247;
                    _4305 = _4375;
                }
                float _4377 = _4305;
                _4353 = _4377;
                if (!_4373)
                {
                    float _4379 = _582 + _4249;
                    _4307 = _4379;
                }
                float _4381 = _4307;
                _4355 = _4381;
                if (!_4373)
                {
                    float _4383 = _584 + _4251;
                    _4309 = _4383;
                }
                float _4385 = _4309;
                _4357 = _4385;
                if (!_4373)
                {
                    float _4387 = _4253 + 1.0;
                    _4311 = _4387;
                }
                float _4389 = _4311;
                bool _4391 = !_4373;
                _4359 = _4389;
                _4361 = _4391;
            }
            if ((!_4361) || _4343)
            {
                _4343 = false;
                _4353 = _4247;
                _4355 = _4249;
                _4357 = _4251;
                _4359 = _4253;
                _4361 = true;
            }
        }
        else
        {
            float _4393 = _580 + _4263;
            float _4395 = _582 + _4265;
            float _4397 = _584 + _4267;
            float _4399 = _4269 + 1.0;
            _4353 = _4247;
            _4355 = _4249;
            _4357 = _4251;
            _4359 = _4253;
            _4329 = _4393;
            _4331 = _4395;
            _4333 = _4397;
            _4335 = _4399;
        }
    }
    _4361 = false;
    float _4401 = _4313;
    float _4403 = _4315;
    float _4405 = _4317;
    float _4407 = _4319;
    float _4409 = _4353;
    float _4411 = _4355;
    float _4413 = _4357;
    float _4415 = _4359;
    float _4417 = _4321;
    float _4419 = _4323;
    float _4421 = _4325;
    float _4423 = _4327;
    float _4425 = _4329;
    float _4427 = _4331;
    float _4429 = _4333;
    float _4431 = _4335;
    float _4433 = -_2972;
    float _4435 = _614 + _4433;
    float _4437 = -_2976;
    float _4439 = _612 + _4437;
    float _4441 = _2986 * _4435;
    float _4443 = -_2980;
    float _4445 = _616 + _4443;
    float _4447 = fma(_2990, _4439, _4441);
    float _4449 = fma(_2994, _4445, _4447);
    float _4451 = _3022 * _4449;
    float _4453 = rint(_4451);
    float _4455 = precise::max(0.0, _4453);
    float _4457 = precise::min(_4455, 3.0);
    float _4459 = trunc(_4457);
    int _4461 = int(_4459);
    bool _4463 = _4461 >= 2;
    bool _4465 = !_4463;
    float _4467 = as_type<float>(_4461);
    float _4469 = _4453;
    float _4471 = _4447;
    float _4473 = _4441;
    float _4475 = _4401;
    float _4477 = _4403;
    float _4479 = _4405;
    float _4481 = _4407;
    float _4483 = _4417;
    float _4485 = _4419;
    float _4487 = _4421;
    float _4489 = _4423;
    float _4491 = _4425;
    float _4493 = _4427;
    float _4495 = _4429;
    float _4497 = _4431;
    float _4515;
    float _4517;
    float _4519;
    float _4521;
    if (!_4465)
    {
        bool _4499 = _4461 >= 3;
        bool _4501 = !_4499;
        if (!_4501)
        {
            bool _4503 = _4461 != 3;
            _4505 = _4503;
            if (!_4505)
            {
                float _4507 = _612 + _4401;
                float _4509 = _614 + _4403;
                float _4511 = _616 + _4405;
                float _4513 = _4407 + 1.0;
                _4475 = _4507;
                _4477 = _4509;
                _4479 = _4511;
                _4481 = _4513;
                _4515 = _4409;
                _4517 = _4411;
                _4519 = _4413;
                _4521 = _4415;
                _4523 = true;
            }
        }
        else
        {
            float _4525 = _612 + _4417;
            float _4527 = _614 + _4419;
            float _4529 = _616 + _4421;
            float _4531 = _4423 + 1.0;
            _4515 = _4409;
            _4517 = _4411;
            _4519 = _4413;
            _4521 = _4415;
            _4483 = _4525;
            _4485 = _4527;
            _4487 = _4529;
            _4489 = _4531;
            _4523 = true;
        }
    }
    if ((!_4523) || _4505)
    {
        bool _4533;
        if (!_4505)
        {
            _4533 = _4461 >= 1;
        }
        if ((!_4533) || _4505)
        {
            if (!_4505)
            {
                bool _4535 = _4461 != 0;
                if (!_4535)
                {
                    float _4537 = _612 + _4409;
                    _4467 = _4537;
                }
                float _4539 = _4467;
                _4515 = _4539;
                if (!_4535)
                {
                    float _4541 = _614 + _4411;
                    _4469 = _4541;
                }
                float _4543 = _4469;
                _4517 = _4543;
                if (!_4535)
                {
                    float _4545 = _616 + _4413;
                    _4471 = _4545;
                }
                float _4547 = _4471;
                _4519 = _4547;
                if (!_4535)
                {
                    float _4549 = _4415 + 1.0;
                    _4473 = _4549;
                }
                float _4551 = _4473;
                bool _4553 = !_4535;
                _4521 = _4551;
                _4523 = _4553;
            }
            if ((!_4523) || _4505)
            {
                _4505 = false;
                _4515 = _4409;
                _4517 = _4411;
                _4519 = _4413;
                _4521 = _4415;
                _4523 = true;
            }
        }
        else
        {
            float _4555 = _612 + _4425;
            float _4557 = _614 + _4427;
            float _4559 = _616 + _4429;
            float _4561 = _4431 + 1.0;
            _4515 = _4409;
            _4517 = _4411;
            _4519 = _4413;
            _4521 = _4415;
            _4491 = _4555;
            _4493 = _4557;
            _4495 = _4559;
            _4497 = _4561;
        }
    }
    _4523 = false;
    float _4563 = _4475;
    float _4565 = _4477;
    float _4567 = _4479;
    float _4569 = _4481;
    float _4571 = _4515;
    float _4573 = _4517;
    float _4575 = _4519;
    float _4577 = _4521;
    float _4579 = _4483;
    float _4581 = _4485;
    float _4583 = _4487;
    float _4585 = _4489;
    float _4587 = _4491;
    float _4589 = _4493;
    float _4591 = _4495;
    float _4593 = _4497;
    float _4595 = -_2972;
    float _4597 = _624 + _4595;
    float _4599 = -_2976;
    float _4601 = _622 + _4599;
    float _4603 = _2986 * _4597;
    float _4605 = -_2980;
    float _4607 = _626 + _4605;
    float _4609 = fma(_2990, _4601, _4603);
    float _4611 = fma(_2994, _4607, _4609);
    float _4613 = _3022 * _4611;
    float _4615 = rint(_4613);
    float _4617 = precise::max(0.0, _4615);
    float _4619 = precise::min(_4617, 3.0);
    float _4621 = trunc(_4619);
    int _4623 = int(_4621);
    bool _4625 = _4623 >= 2;
    bool _4627 = !_4625;
    float _4629 = _4615;
    float _4631 = as_type<float>(_4623);
    float _4633 = _4603;
    float _4635 = _4609;
    float _4637 = _4563;
    float _4639 = _4565;
    float _4641 = _4567;
    float _4643 = _4569;
    float _4645 = _4579;
    float _4647 = _4581;
    float _4649 = _4583;
    float _4651 = _4585;
    float _4653 = _4587;
    float _4655 = _4589;
    float _4657 = _4591;
    float _4659 = _4593;
    float _4677;
    float _4679;
    float _4681;
    float _4683;
    if (!_4627)
    {
        bool _4661 = _4623 >= 3;
        bool _4663 = !_4661;
        if (!_4663)
        {
            bool _4665 = _4623 != 3;
            _4667 = _4665;
            if (!_4667)
            {
                float _4669 = _622 + _4563;
                float _4671 = _624 + _4565;
                float _4673 = _626 + _4567;
                float _4675 = _4569 + 1.0;
                _4637 = _4669;
                _4639 = _4671;
                _4641 = _4673;
                _4643 = _4675;
                _4677 = _4571;
                _4679 = _4573;
                _4681 = _4575;
                _4683 = _4577;
                _4685 = true;
            }
        }
        else
        {
            float _4687 = _622 + _4579;
            float _4689 = _624 + _4581;
            float _4691 = _626 + _4583;
            float _4693 = _4585 + 1.0;
            _4677 = _4571;
            _4679 = _4573;
            _4681 = _4575;
            _4683 = _4577;
            _4645 = _4687;
            _4647 = _4689;
            _4649 = _4691;
            _4651 = _4693;
            _4685 = true;
        }
    }
    if ((!_4685) || _4667)
    {
        bool _4695;
        if (!_4667)
        {
            _4695 = _4623 >= 1;
        }
        if ((!_4695) || _4667)
        {
            if (!_4667)
            {
                bool _4697 = _4623 != 0;
                if (!_4697)
                {
                    float _4699 = _622 + _4571;
                    _4629 = _4699;
                }
                float _4701 = _4629;
                _4677 = _4701;
                if (!_4697)
                {
                    float _4703 = _624 + _4573;
                    _4631 = _4703;
                }
                float _4705 = _4631;
                _4679 = _4705;
                if (!_4697)
                {
                    float _4707 = _626 + _4575;
                    _4633 = _4707;
                }
                float _4709 = _4633;
                _4681 = _4709;
                if (!_4697)
                {
                    float _4711 = _4577 + 1.0;
                    _4635 = _4711;
                }
                float _4713 = _4635;
                bool _4715 = !_4697;
                _4683 = _4713;
                _4685 = _4715;
            }
            if ((!_4685) || _4667)
            {
                _4667 = false;
                _4677 = _4571;
                _4679 = _4573;
                _4681 = _4575;
                _4683 = _4577;
                _4685 = true;
            }
        }
        else
        {
            float _4717 = _622 + _4587;
            float _4719 = _624 + _4589;
            float _4721 = _626 + _4591;
            float _4723 = _4593 + 1.0;
            _4677 = _4571;
            _4679 = _4573;
            _4681 = _4575;
            _4683 = _4577;
            _4653 = _4717;
            _4655 = _4719;
            _4657 = _4721;
            _4659 = _4723;
        }
    }
    _4685 = false;
    float _4725 = _4637;
    float _4727 = _4639;
    float _4729 = _4641;
    float _4731 = _4643;
    float _4733 = _4677;
    float _4735 = _4679;
    float _4737 = _4681;
    float _4739 = _4683;
    float _4741 = _4645;
    float _4743 = _4647;
    float _4745 = _4649;
    float _4747 = _4651;
    float _4749 = _4653;
    float _4751 = _4655;
    float _4753 = _4657;
    float _4755 = _4659;
    float _4757 = -_2972;
    float _4759 = _634 + _4757;
    float _4761 = -_2976;
    float _4763 = _632 + _4761;
    float _4765 = _2986 * _4759;
    float _4767 = -_2980;
    float _4769 = _636 + _4767;
    float _4771 = fma(_2990, _4763, _4765);
    float _4773 = fma(_2994, _4769, _4771);
    float _4775 = _3022 * _4773;
    float _4777 = rint(_4775);
    float _4779 = precise::max(0.0, _4777);
    float _4781 = precise::min(_4779, 3.0);
    float _4783 = trunc(_4781);
    int _4785 = int(_4783);
    bool _4787 = _4785 >= 2;
    bool _4789 = !_4787;
    float _4791 = as_type<float>(_4785);
    float _4793 = _4777;
    float _4795 = _4771;
    float _4797 = _4765;
    float _4799 = _4725;
    float _4801 = _4727;
    float _4803 = _4729;
    float _4805 = _4731;
    float _4807 = _4741;
    float _4809 = _4743;
    float _4811 = _4745;
    float _4813 = _4747;
    float _4815 = _4749;
    float _4817 = _4751;
    float _4819 = _4753;
    float _4821 = _4755;
    float _4839;
    float _4841;
    float _4843;
    float _4845;
    if (!_4789)
    {
        bool _4823 = _4785 >= 3;
        bool _4825 = !_4823;
        if (!_4825)
        {
            bool _4827 = _4785 != 3;
            _4829 = _4827;
            if (!_4829)
            {
                float _4831 = _632 + _4725;
                float _4833 = _634 + _4727;
                float _4835 = _636 + _4729;
                float _4837 = _4731 + 1.0;
                _4799 = _4831;
                _4801 = _4833;
                _4803 = _4835;
                _4805 = _4837;
                _4839 = _4733;
                _4841 = _4735;
                _4843 = _4737;
                _4845 = _4739;
                _4847 = true;
            }
        }
        else
        {
            float _4849 = _632 + _4741;
            float _4851 = _634 + _4743;
            float _4853 = _636 + _4745;
            float _4855 = _4747 + 1.0;
            _4839 = _4733;
            _4841 = _4735;
            _4843 = _4737;
            _4845 = _4739;
            _4807 = _4849;
            _4809 = _4851;
            _4811 = _4853;
            _4813 = _4855;
            _4847 = true;
        }
    }
    if ((!_4847) || _4829)
    {
        bool _4857;
        if (!_4829)
        {
            _4857 = _4785 >= 1;
        }
        if ((!_4857) || _4829)
        {
            if (!_4829)
            {
                bool _4859 = _4785 != 0;
                if (!_4859)
                {
                    float _4861 = _632 + _4733;
                    _4791 = _4861;
                }
                float _4863 = _4791;
                _4839 = _4863;
                if (!_4859)
                {
                    float _4865 = _634 + _4735;
                    _4793 = _4865;
                }
                float _4867 = _4793;
                _4841 = _4867;
                if (!_4859)
                {
                    float _4869 = _636 + _4737;
                    _4795 = _4869;
                }
                float _4871 = _4795;
                _4843 = _4871;
                if (!_4859)
                {
                    float _4873 = _4739 + 1.0;
                    _4797 = _4873;
                }
                float _4875 = _4797;
                bool _4877 = !_4859;
                _4845 = _4875;
                _4847 = _4877;
            }
            if ((!_4847) || _4829)
            {
                _4829 = false;
                _4839 = _4733;
                _4841 = _4735;
                _4843 = _4737;
                _4845 = _4739;
                _4847 = true;
            }
        }
        else
        {
            float _4879 = _632 + _4749;
            float _4881 = _634 + _4751;
            float _4883 = _636 + _4753;
            float _4885 = _4755 + 1.0;
            _4839 = _4733;
            _4841 = _4735;
            _4843 = _4737;
            _4845 = _4739;
            _4815 = _4879;
            _4817 = _4881;
            _4819 = _4883;
            _4821 = _4885;
        }
    }
    _4847 = false;
    float _4887 = _4799;
    float _4889 = _4801;
    float _4891 = _4803;
    float _4893 = _4805;
    float _4895 = _4839;
    float _4897 = _4841;
    float _4899 = _4843;
    float _4901 = _4845;
    float _4903 = _4807;
    float _4905 = _4809;
    float _4907 = _4811;
    float _4909 = _4813;
    float _4911 = _4815;
    float _4913 = _4817;
    float _4915 = _4819;
    float _4917 = _4821;
    float _4919 = -_2972;
    float _4921 = _644 + _4919;
    float _4923 = -_2976;
    float _4925 = _642 + _4923;
    float _4927 = _2986 * _4921;
    float _4929 = -_2980;
    float _4931 = _646 + _4929;
    float _4933 = fma(_2990, _4925, _4927);
    float _4935 = fma(_2994, _4931, _4933);
    float _4937 = _3022 * _4935;
    float _4939 = rint(_4937);
    float _4941 = precise::max(0.0, _4939);
    float _4943 = precise::min(_4941, 3.0);
    float _4945 = trunc(_4943);
    int _4947 = int(_4945);
    bool _4949 = _4947 >= 2;
    bool _4951 = !_4949;
    float _4953 = _4939;
    float _4955 = as_type<float>(_4947);
    float _4957 = _4927;
    float _4959 = _4933;
    float _4961 = _4887;
    float _4963 = _4889;
    float _4965 = _4891;
    float _4967 = _4893;
    float _4969 = _4903;
    float _4971 = _4905;
    float _4973 = _4907;
    float _4975 = _4909;
    float _4977 = _4911;
    float _4979 = _4913;
    float _4981 = _4915;
    float _4983 = _4917;
    float _5001;
    float _5003;
    float _5005;
    float _5007;
    if (!_4951)
    {
        bool _4985 = _4947 >= 3;
        bool _4987 = !_4985;
        if (!_4987)
        {
            bool _4989 = _4947 != 3;
            _4991 = _4989;
            if (!_4991)
            {
                float _4993 = _642 + _4887;
                float _4995 = _644 + _4889;
                float _4997 = _646 + _4891;
                float _4999 = _4893 + 1.0;
                _4961 = _4993;
                _4963 = _4995;
                _4965 = _4997;
                _4967 = _4999;
                _5001 = _4895;
                _5003 = _4897;
                _5005 = _4899;
                _5007 = _4901;
                _5009 = true;
            }
        }
        else
        {
            float _5011 = _642 + _4903;
            float _5013 = _644 + _4905;
            float _5015 = _646 + _4907;
            float _5017 = _4909 + 1.0;
            _5001 = _4895;
            _5003 = _4897;
            _5005 = _4899;
            _5007 = _4901;
            _4969 = _5011;
            _4971 = _5013;
            _4973 = _5015;
            _4975 = _5017;
            _5009 = true;
        }
    }
    if ((!_5009) || _4991)
    {
        bool _5019;
        if (!_4991)
        {
            _5019 = _4947 >= 1;
        }
        if ((!_5019) || _4991)
        {
            if (!_4991)
            {
                bool _5021 = _4947 != 0;
                if (!_5021)
                {
                    float _5023 = _642 + _4895;
                    _4953 = _5023;
                }
                float _5025 = _4953;
                _5001 = _5025;
                if (!_5021)
                {
                    float _5027 = _644 + _4897;
                    _4955 = _5027;
                }
                float _5029 = _4955;
                _5003 = _5029;
                if (!_5021)
                {
                    float _5031 = _646 + _4899;
                    _4957 = _5031;
                }
                float _5033 = _4957;
                _5005 = _5033;
                if (!_5021)
                {
                    float _5035 = _4901 + 1.0;
                    _4959 = _5035;
                }
                float _5037 = _4959;
                bool _5039 = !_5021;
                _5007 = _5037;
                _5009 = _5039;
            }
            if ((!_5009) || _4991)
            {
                _4991 = false;
                _5001 = _4895;
                _5003 = _4897;
                _5005 = _4899;
                _5007 = _4901;
                _5009 = true;
            }
        }
        else
        {
            float _5041 = _642 + _4911;
            float _5043 = _644 + _4913;
            float _5045 = _646 + _4915;
            float _5047 = _4917 + 1.0;
            _5001 = _4895;
            _5003 = _4897;
            _5005 = _4899;
            _5007 = _4901;
            _4977 = _5041;
            _4979 = _5043;
            _4981 = _5045;
            _4983 = _5047;
        }
    }
    _5009 = false;
    float _5049 = _4961;
    float _5051 = _4963;
    float _5053 = _4965;
    float _5055 = _4967;
    float _5057 = _5001;
    float _5059 = _5003;
    float _5061 = _5005;
    float _5063 = _5007;
    float _5065 = _4969;
    float _5067 = _4971;
    float _5069 = _4973;
    float _5071 = _4975;
    float _5073 = _4977;
    float _5075 = _4979;
    float _5077 = _4981;
    float _5079 = _4983;
    float _5081 = -_2972;
    float _5083 = _654 + _5081;
    float _5085 = -_2976;
    float _5087 = _652 + _5085;
    float _5089 = _2986 * _5083;
    float _5091 = -_2980;
    float _5093 = _656 + _5091;
    float _5095 = fma(_2990, _5087, _5089);
    float _5097 = fma(_2994, _5093, _5095);
    float _5099 = _3022 * _5097;
    float _5101 = rint(_5099);
    float _5103 = precise::max(0.0, _5101);
    float _5105 = precise::min(_5103, 3.0);
    float _5107 = trunc(_5105);
    int _5109 = int(_5107);
    bool _5111 = _5109 >= 2;
    bool _5113 = !_5111;
    float _5115 = as_type<float>(_5109);
    float _5117 = _5101;
    float _5119 = _5095;
    float _5121 = _5089;
    float _5123 = _5049;
    float _5125 = _5051;
    float _5127 = _5053;
    float _5129 = _5055;
    float _5131 = _5065;
    float _5133 = _5067;
    float _5135 = _5069;
    float _5137 = _5071;
    float _5139 = _5073;
    float _5141 = _5075;
    float _5143 = _5077;
    float _5145 = _5079;
    float _5163;
    float _5165;
    float _5167;
    float _5169;
    if (!_5113)
    {
        bool _5147 = _5109 >= 3;
        bool _5149 = !_5147;
        if (!_5149)
        {
            bool _5151 = _5109 != 3;
            _5153 = _5151;
            if (!_5153)
            {
                float _5155 = _652 + _5049;
                float _5157 = _654 + _5051;
                float _5159 = _656 + _5053;
                float _5161 = _5055 + 1.0;
                _5123 = _5155;
                _5125 = _5157;
                _5127 = _5159;
                _5129 = _5161;
                _5163 = _5057;
                _5165 = _5059;
                _5167 = _5061;
                _5169 = _5063;
                _5171 = true;
            }
        }
        else
        {
            float _5173 = _652 + _5065;
            float _5175 = _654 + _5067;
            float _5177 = _656 + _5069;
            float _5179 = _5071 + 1.0;
            _5163 = _5057;
            _5165 = _5059;
            _5167 = _5061;
            _5169 = _5063;
            _5131 = _5173;
            _5133 = _5175;
            _5135 = _5177;
            _5137 = _5179;
            _5171 = true;
        }
    }
    if ((!_5171) || _5153)
    {
        bool _5181;
        if (!_5153)
        {
            _5181 = _5109 >= 1;
        }
        if ((!_5181) || _5153)
        {
            if (!_5153)
            {
                bool _5183 = _5109 != 0;
                if (!_5183)
                {
                    float _5185 = _652 + _5057;
                    _5115 = _5185;
                }
                float _5187 = _5115;
                _5163 = _5187;
                if (!_5183)
                {
                    float _5189 = _654 + _5059;
                    _5117 = _5189;
                }
                float _5191 = _5117;
                _5165 = _5191;
                if (!_5183)
                {
                    float _5193 = _656 + _5061;
                    _5119 = _5193;
                }
                float _5195 = _5119;
                _5167 = _5195;
                if (!_5183)
                {
                    float _5197 = _5063 + 1.0;
                    _5121 = _5197;
                }
                float _5199 = _5121;
                bool _5201 = !_5183;
                _5169 = _5199;
                _5171 = _5201;
            }
            if ((!_5171) || _5153)
            {
                _5153 = false;
                _5163 = _5057;
                _5165 = _5059;
                _5167 = _5061;
                _5169 = _5063;
                _5171 = true;
            }
        }
        else
        {
            float _5203 = _652 + _5073;
            float _5205 = _654 + _5075;
            float _5207 = _656 + _5077;
            float _5209 = _5079 + 1.0;
            _5163 = _5057;
            _5165 = _5059;
            _5167 = _5061;
            _5169 = _5063;
            _5139 = _5203;
            _5141 = _5205;
            _5143 = _5207;
            _5145 = _5209;
        }
    }
    _5171 = false;
    float _5211 = _5123;
    float _5213 = _5125;
    float _5215 = _5127;
    float _5217 = _5129;
    float _5219 = _5163;
    float _5221 = _5165;
    float _5223 = _5167;
    float _5225 = _5169;
    float _5227 = _5131;
    float _5229 = _5133;
    float _5231 = _5135;
    float _5233 = _5137;
    float _5235 = _5139;
    float _5237 = _5141;
    float _5239 = _5143;
    float _5241 = _5145;
    float _5243 = -_2972;
    float _5245 = _664 + _5243;
    float _5247 = -_2976;
    float _5249 = _662 + _5247;
    float _5251 = _2986 * _5245;
    float _5253 = -_2980;
    float _5255 = _666 + _5253;
    float _5257 = fma(_2990, _5249, _5251);
    float _5259 = fma(_2994, _5255, _5257);
    float _5261 = _3022 * _5259;
    float _5263 = rint(_5261);
    float _5265 = precise::max(0.0, _5263);
    float _5267 = precise::min(_5265, 3.0);
    float _5269 = trunc(_5267);
    int _5271 = int(_5269);
    bool _5273 = _5271 >= 2;
    bool _5275 = !_5273;
    float _5277 = _5263;
    float _5279 = as_type<float>(_5271);
    float _5281 = _5251;
    float _5283 = _5257;
    float _5285 = _5211;
    float _5287 = _5213;
    float _5289 = _5215;
    float _5291 = _5217;
    float _5293 = _5227;
    float _5295 = _5229;
    float _5297 = _5231;
    float _5299 = _5233;
    float _5301 = _5235;
    float _5303 = _5237;
    float _5305 = _5239;
    float _5307 = _5241;
    float _5325;
    float _5327;
    float _5329;
    float _5331;
    if (!_5275)
    {
        bool _5309 = _5271 >= 3;
        bool _5311 = !_5309;
        if (!_5311)
        {
            bool _5313 = _5271 != 3;
            _5315 = _5313;
            if (!_5315)
            {
                float _5317 = _662 + _5211;
                float _5319 = _664 + _5213;
                float _5321 = _666 + _5215;
                float _5323 = _5217 + 1.0;
                _5285 = _5317;
                _5287 = _5319;
                _5289 = _5321;
                _5291 = _5323;
                _5325 = _5219;
                _5327 = _5221;
                _5329 = _5223;
                _5331 = _5225;
                _5333 = true;
            }
        }
        else
        {
            float _5335 = _662 + _5227;
            float _5337 = _664 + _5229;
            float _5339 = _666 + _5231;
            float _5341 = _5233 + 1.0;
            _5325 = _5219;
            _5327 = _5221;
            _5329 = _5223;
            _5331 = _5225;
            _5293 = _5335;
            _5295 = _5337;
            _5297 = _5339;
            _5299 = _5341;
            _5333 = true;
        }
    }
    if ((!_5333) || _5315)
    {
        bool _5343;
        if (!_5315)
        {
            _5343 = _5271 >= 1;
        }
        if ((!_5343) || _5315)
        {
            if (!_5315)
            {
                bool _5345 = _5271 != 0;
                if (!_5345)
                {
                    float _5347 = _662 + _5219;
                    _5277 = _5347;
                }
                float _5349 = _5277;
                _5325 = _5349;
                if (!_5345)
                {
                    float _5351 = _664 + _5221;
                    _5279 = _5351;
                }
                float _5353 = _5279;
                _5327 = _5353;
                if (!_5345)
                {
                    float _5355 = _666 + _5223;
                    _5281 = _5355;
                }
                float _5357 = _5281;
                _5329 = _5357;
                if (!_5345)
                {
                    float _5359 = _5225 + 1.0;
                    _5283 = _5359;
                }
                float _5361 = _5283;
                bool _5363 = !_5345;
                _5331 = _5361;
                _5333 = _5363;
            }
            if ((!_5333) || _5315)
            {
                _5315 = false;
                _5325 = _5219;
                _5327 = _5221;
                _5329 = _5223;
                _5331 = _5225;
                _5333 = true;
            }
        }
        else
        {
            float _5365 = _662 + _5235;
            float _5367 = _664 + _5237;
            float _5369 = _666 + _5239;
            float _5371 = _5241 + 1.0;
            _5325 = _5219;
            _5327 = _5221;
            _5329 = _5223;
            _5331 = _5225;
            _5301 = _5365;
            _5303 = _5367;
            _5305 = _5369;
            _5307 = _5371;
        }
    }
    _5333 = false;
    float _5373 = _5285;
    float _5375 = _5287;
    float _5377 = _5289;
    float _5379 = _5291;
    float _5381 = _5325;
    float _5383 = _5327;
    float _5385 = _5329;
    float _5387 = _5331;
    float _5389 = _5293;
    float _5391 = _5295;
    float _5393 = _5297;
    float _5395 = _5299;
    float _5397 = _5301;
    float _5399 = _5303;
    float _5401 = _5305;
    float _5403 = _5307;
    float _5405 = -_2972;
    float _5407 = _674 + _5405;
    float _5409 = -_2976;
    float _5411 = _672 + _5409;
    float _5413 = _2986 * _5407;
    float _5415 = -_2980;
    float _5417 = _676 + _5415;
    float _5419 = fma(_2990, _5411, _5413);
    float _5421 = fma(_2994, _5417, _5419);
    float _5423 = _3022 * _5421;
    float _5425 = rint(_5423);
    float _5427 = precise::max(0.0, _5425);
    float _5429 = precise::min(_5427, 3.0);
    float _5431 = trunc(_5429);
    int _5433 = int(_5431);
    bool _5435 = _5433 >= 2;
    bool _5437 = !_5435;
    float _5439 = as_type<float>(_5433);
    float _5441 = _5425;
    float _5443 = _5419;
    float _5445 = _5413;
    float _5447 = _5389;
    float _5449 = _5391;
    float _5451 = _5397;
    float _5453 = _5399;
    float _5455 = _5403;
    float _5457 = _5395;
    float _5459 = _5379;
    float _5461 = _5401;
    float _5463 = _5393;
    float _5465 = _5373;
    float _5467 = _5375;
    float _5469 = _5377;
    float _5487;
    float _5489;
    float _5491;
    float _5493;
    if (!_5437)
    {
        bool _5471 = _5433 >= 3;
        bool _5473 = !_5471;
        if (!_5473)
        {
            bool _5475 = _5433 != 3;
            _5477 = _5475;
            if (!_5477)
            {
                float _5479 = _672 + _5373;
                float _5481 = _674 + _5375;
                float _5483 = _676 + _5377;
                float _5485 = _5379 + 1.0;
                _5487 = _5381;
                _5489 = _5387;
                _5459 = _5485;
                _5491 = _5383;
                _5493 = _5385;
                _5465 = _5479;
                _5467 = _5481;
                _5469 = _5483;
                _5495 = true;
            }
        }
        else
        {
            float _5497 = _672 + _5389;
            float _5499 = _674 + _5391;
            float _5501 = _676 + _5393;
            float _5503 = _5395 + 1.0;
            _5447 = _5497;
            _5449 = _5499;
            _5457 = _5503;
            _5487 = _5381;
            _5489 = _5387;
            _5491 = _5383;
            _5463 = _5501;
            _5493 = _5385;
            _5495 = true;
        }
    }
    if ((!_5495) || _5477)
    {
        bool _5505;
        if (!_5477)
        {
            _5505 = _5433 >= 1;
        }
        if ((!_5505) || _5477)
        {
            if (!_5477)
            {
                bool _5507 = _5433 != 0;
                if (!_5507)
                {
                    float _5509 = _672 + _5381;
                    _5439 = _5509;
                }
                float _5511 = _5439;
                _5487 = _5511;
                if (!_5507)
                {
                    float _5513 = _674 + _5383;
                    _5441 = _5513;
                }
                float _5515 = _5441;
                _5491 = _5515;
                if (!_5507)
                {
                    float _5517 = _676 + _5385;
                    _5443 = _5517;
                }
                float _5519 = _5443;
                _5493 = _5519;
                if (!_5507)
                {
                    float _5521 = _5387 + 1.0;
                    _5445 = _5521;
                }
                float _5523 = _5445;
                bool _5525 = !_5507;
                _5489 = _5523;
                _5495 = _5525;
            }
            if ((!_5495) || _5477)
            {
                _5477 = false;
                _5487 = _5381;
                _5489 = _5387;
                _5491 = _5383;
                _5493 = _5385;
                _5495 = true;
            }
        }
        else
        {
            float _5527 = _672 + _5397;
            float _5529 = _674 + _5399;
            float _5531 = _676 + _5401;
            float _5533 = _5403 + 1.0;
            _5451 = _5527;
            _5453 = _5529;
            _5455 = _5533;
            _5487 = _5381;
            _5489 = _5387;
            _5491 = _5383;
            _5461 = _5531;
            _5493 = _5385;
        }
    }
    _5495 = false;
    float _5535 = _5447;
    float _5537 = _5449;
    float _5539 = _5451;
    float _5541 = _5453;
    float _5543 = _5455;
    float _5545 = _5457;
    float _5547 = _5487;
    float _5549 = _5489;
    float _5551 = _5459;
    float _5553 = _5491;
    float _5555 = _5461;
    float _5557 = _5463;
    float _5559 = _5493;
    float _5561 = _5465;
    float _5563 = _5467;
    float _5565 = _5469;
    float _5567 = _5535 * 6.0;
    float _5569 = _5537 * 6.0;
    float _5571 = _5539 * 6.0;
    float _5573 = _5541 * 6.0;
    float _5575 = fma(_5539, 3.0, _5567);
    float _5577 = fma(_5541, 3.0, _5569);
    float _5579 = _5543 * 4.0;
    float _5581 = fma(_5545, 4.0, _5543);
    _24[1] = as_type<uint>(_632);
    float _5583 = fma(_5547, 9.0, _5571);
    float _5585 = fma(_5549, 9.0, _5579);
    float _5587 = fma(_5551, 9.0, _5581);
    _24[0] = as_type<uint>(_636);
    float _5589 = precise::max(_536, _576);
    float _5591 = fma(_5553, 9.0, _5573);
    float _5593 = precise::max(_628, _638);
    float _5595 = _5555 * 6.0;
    float _5597 = precise::max(_516, _526);
    float _5599 = _5557 * 6.0;
    float _5601 = _5545 + _5543;
    float _5603 = precise::max(_586, _618);
    float _5605 = fma(_5559, 9.0, _5595);
    float _5607 = precise::max(_5597, _5589);
    float _5609 = fma(_5555, 3.0, _5599);
    float _5611 = precise::max(_5603, _5593);
    float _5613 = as_type<float>(_24[1]);
    float _5615 = precise::max(_450, _460);
    float _5617 = _5585 + _5545;
    float _5619 = precise::max(_470, _504);
    float _5621 = as_type<float>(_24[0]);
    float _5623 = precise::max(_648, _658);
    float _5625 = _5617 * _5587;
    float _5627 = precise::max(_5615, _5619);
    float _5629 = _5601 * 2.0;
    float _5631 = precise::max(_668, _678);
    float _5633 = -_5625;
    float _5635 = fma(_5629, _5629, _5633);
    bool _5637 = _5635 != 0.0;
    bool _5639 = isnan(_5635);
    bool _5641 = _5637 || _5639;
    bool _5643 = isnan(0.0);
    bool _5645 = _5641 || _5643;
    float _5647 = precise::max(_5623, _5631);
    float _5649 = precise::max(_5627, _5607);
    float _5651 = precise::max(_5611, _5647);
    float _5653 = fma(_5535, 3.0, _5583);
    float _5655 = fma(_5557, 3.0, _5605);
    float _5657 = fma(_5537, 3.0, _5591);
    float _5659 = fma(_5561, 9.0, _5575);
    float _5661 = fma(_5563, 9.0, _5577);
    float _5663 = fma(_5565, 9.0, _5609);
    float _5665 = precise::max(_5649, _5651);
    bool _5667 = !_5645;
    if (!_5667)
    {
        float _5669 = 1.0 / _5635;
        float _5671 = _5617 * _5659;
        float _5673 = _5653 * _5587;
        float _5675 = -_5671;
        float _5677 = fma(_5653, _5629, _5675);
        float _5679 = -_5673;
        float _5681 = fma(_5659, _5629, _5679);
        float _5683 = _5617 * _5661;
        float _5685 = _5657 * _5587;
        float _5687 = _5617 * _5663;
        float _5689 = _5655 * _5587;
        float _5691 = -_5683;
        float _5693 = fma(_5657, _5629, _5691);
        float _5695 = -_5685;
        float _5697 = fma(_5661, _5629, _5695);
        float _5699 = -_5687;
        float _5701 = fma(_5655, _5629, _5699);
        float _5703 = -_5689;
        float _5705 = fma(_5663, _5629, _5703);
        float _5707 = _5697 * _5669;
        float _5709 = _5677 * _5669;
        float _5711 = _5693 * _5669;
        float _5713 = _5701 * _5669;
        float _5715 = _5681 * _5669;
        float _5717 = _5705 * _5669;
        float _5719 = -_5707;
        float _5721 = _5711 + _5719;
        float _5723 = -_5715;
        float _5725 = _5709 + _5723;
        float _5727 = -_5717;
        float _5729 = _5713 + _5727;
        _3041 = _5725;
        _3043 = _5721;
        _3045 = _5729;
        _3047 = _5715;
        _3049 = _5709;
        _3051 = _5707;
        _3053 = _5711;
        _3055 = _5717;
        _3057 = _5713;
    }
    float _5731 = _3041;
    float _5733 = _3043;
    float _5735 = _3045;
    float _5737 = _3047;
    float _5739 = _3049;
    float _5741 = _3051;
    float _5743 = _3053;
    float _5745 = _3055;
    float _5747 = _3057;
    float _5749 = fma(_5731, 496.0, 0.5);
    float _5751 = precise::clamp(_5749, 0.0, 1.0);
    float _5753 = fma(_5733, 1008.0, 0.5);
    float _5755 = precise::clamp(_5753, 0.0, 1.0);
    float _5757 = fma(_5731, -31.0, 1.0);
    float _5759 = precise::clamp(_5757, 0.0, 1.0);
    float _5761 = fma(_5735, 496.0, 0.5);
    float _5763 = precise::clamp(_5761, 0.0, 1.0);
    float _5765 = _5751 + (-0.5);
    float _5767 = fma(_5733, -63.0, 1.0);
    float _5769 = precise::clamp(_5767, 0.0, 1.0);
    float _5771 = _5755 + (-0.5);
    float _5773 = fma(_5735, -31.0, 1.0);
    float _5775 = precise::clamp(_5773, 0.0, 1.0);
    float _5777 = _5759 * _5765;
    float _5779 = _5763 + (-0.5);
    float _5781 = _5769 * _5771;
    float _5783 = _5781 * 2.0;
    float _5785 = _5665 * 255.0;
    float _5787 = fma(_5777, -0.0322580635547637939453125, _5737);
    float _5789 = precise::clamp(_5787, 0.0, 1.0);
    float _5791 = _5775 * _5779;
    float _5793 = fma(_5777, 0.0322580635547637939453125, _5739);
    float _5795 = precise::clamp(_5793, 0.0, 1.0);
    float _5797 = fma(_5783, -0.01587301678955554962158203125, _5741);
    float _5799 = precise::clamp(_5797, 0.0, 1.0);
    float _5801 = fma(_5783, 0.01587301678955554962158203125, _5743);
    float _5803 = precise::clamp(_5801, 0.0, 1.0);
    float _5805 = fma(_5791, -0.0322580635547637939453125, _5745);
    float _5807 = precise::clamp(_5805, 0.0, 1.0);
    float _5809 = _5795 * 31.0;
    float _5811 = fma(_5791, 0.0322580635547637939453125, _5747);
    float _5813 = precise::clamp(_5811, 0.0, 1.0);
    float _5815 = _5789 * 31.0;
    float _5817 = _5799 * 63.0;
    float _5819 = _5803 * 63.0;
    float _5821 = _5807 * 31.0;
    float _5823 = _5813 * 31.0;
    float _5825 = trunc(_5785);
    float _5827 = precise::max(_5825, 0.0);
    uint _5829 = uint(_5827);
    float _5831 = precise::min(_450, _460);
    float _5833 = precise::min(_516, _526);
    float _5835 = precise::min(_586, _618);
    float _5837 = precise::min(_628, _638);
    float _5839 = rint(_5809);
    float _5841 = precise::min(_648, _658);
    float _5843 = precise::min(_668, _678);
    float _5845 = precise::min(_5835, _5837);
    float _5847 = precise::min(_5841, _5843);
    float _5849 = rint(_5819);
    float _5851 = precise::min(_5845, _5847);
    float _5853 = rint(_5815);
    float _5855 = _5839 + 0.5;
    float _5857 = rint(_5817);
    float _5859 = _5849 + 0.5;
    float _5861 = rint(_5821);
    float _5863 = _5853 + 0.5;
    float _5865 = rint(_5823);
    float _5867 = precise::min(_470, _504);
    float _5869 = precise::min(_5831, _5867);
    float _5871 = precise::min(_536, _576);
    float _5873 = trunc(_5855);
    float _5875 = precise::max(_5873, 0.0);
    uint _5877 = uint(_5875);
    float _5879 = precise::min(_5833, _5871);
    float _5881 = _5857 + 0.5;
    float _5883 = precise::min(_5869, _5879);
    float _5885 = _5865 + 0.5;
    float _5887 = trunc(_5859);
    float _5889 = precise::max(_5887, 0.0);
    uint _5891 = uint(_5889);
    float _5893 = precise::min(_5883, _5851);
    float _5895 = _5861 + 0.5;
    float _5897 = _5893 * 255.0;
    float _5899 = trunc(_5863);
    float _5901 = precise::max(_5899, 0.0);
    uint _5903 = uint(_5901);
    int _5905 = int(_5877) << 11;
    float _5907 = trunc(_5881);
    float _5909 = precise::max(_5907, 0.0);
    uint _5911 = uint(_5909);
    int _5913 = int(_5891) << 5;
    float _5915 = trunc(_5885);
    float _5917 = precise::max(_5915, 0.0);
    uint _5919 = uint(_5917);
    int _5921 = int(_5903) << 11;
    float _5923 = trunc(_5895);
    float _5925 = precise::max(_5923, 0.0);
    uint _5927 = uint(_5925);
    int _5929 = int(_5911) << 5;
    float _5931 = trunc(_5897);
    float _5933 = precise::max(_5931, 0.0);
    uint _5935 = uint(_5933);
    int _5937 = _5905 | _5913;
    int _5939 = int(_5919) | _5937;
    int _5941 = _5921 | _5929;
    int _5943 = int(_5927) | _5941;
    bool _5945 = _5939 != _5943;
    bool _5947 = _5829 > _5935;
    int _5949 = int(_5935) << 8;
    int _5951 = _5949 & 65280;
    int _5953 = int(_5911);
    int _5955 = _5949;
    int _5957 = _5913;
    int _5959 = _5951;
    int _5961 = as_type<int>(_5853);
    int _5963 = _5939;
    int _5965 = _5943;
    if (!_5945)
    {
        _5953 = _5939;
    }
    int _5967 = _5953;
    int _5969 = 255 & int(_5829);
    int _5971 = _5951 | _5969;
    int _5973 = _5967;
    if (!_5947)
    {
        _5955 = 0;
    }
    int _5975 = _5955;
    int _5977 = _5975;
    if (!_5945)
    {
        _5957 = 0;
    }
    int _5979 = _5957;
    int _5981 = _5979;
    if (!_5945)
    {
        _5959 = 0;
    }
    int _5983 = _5959;
    bool _5985 = !_5945;
    int _5987 = _5983;
    if (!_5985)
    {
        float _5989 = _5853 * 0.0322580635547637939453125;
        float _5991 = _5849 * 0.01587301678955554962158203125;
        float _5993 = _5857 * 0.01587301678955554962158203125;
        bool _5995 = uint(_5939) >= uint(_5943);
        float _5997 = _5839 * 0.0322580635547637939453125;
        float _5999 = _5865 * 0.0322580635547637939453125;
        float _6001 = _5861 * 0.0322580635547637939453125;
        bool _6003 = !_5995;
        float _6005 = _6003 ? _5991 : _5993;
        bool _6007 = !_5995;
        float _6009 = _6007 ? _5993 : _5991;
        bool _6011 = !_5995;
        float _6013 = _6011 ? _5997 : _5989;
        float _6015 = -_6005;
        float _6017 = _572 + _6015;
        bool _6019 = !_5995;
        float _6021 = _6019 ? _5989 : _5997;
        float _6023 = -_6005;
        float _6025 = _6023 + _6009;
        bool _6027 = !_5995;
        float _6029 = _6027 ? _5999 : _6001;
        float _6031 = -_6013;
        float _6033 = _570 + _6031;
        bool _6035 = !_5995;
        float _6037 = _6035 ? _6001 : _5999;
        float _6039 = -_6013;
        float _6041 = _6039 + _6021;
        float _6043 = -_6013;
        float _6045 = _530 + _6043;
        float _6047 = -_6013;
        float _6049 = _520 + _6047;
        float _6051 = -_6013;
        float _6053 = _510 + _6051;
        float _6055 = -_6013;
        float _6057 = _498 + _6055;
        float _6059 = -_6013;
        float _6061 = _464 + _6059;
        float _6063 = -_6013;
        float _6065 = _454 + _6063;
        float _6067 = -_6013;
        float _6069 = _444 + _6067;
        float _6071 = -_6013;
        float _6073 = _672 + _6071;
        float _6075 = -_6013;
        float _6077 = _662 + _6075;
        float _6079 = -_6013;
        float _6081 = _652 + _6079;
        float _6083 = -_6013;
        float _6085 = _642 + _6083;
        float _6087 = -_6013;
        float _6089 = _5613 + _6087;
        float _6091 = -_6013;
        float _6093 = _622 + _6091;
        float _6095 = -_6013;
        float _6097 = _612 + _6095;
        float _6099 = -_6013;
        float _6101 = _580 + _6099;
        float _6103 = _6025 * _6025;
        float _6105 = -_6029;
        float _6107 = _6105 + _6037;
        float _6109 = -_6005;
        float _6111 = _532 + _6109;
        float _6113 = -_6029;
        float _6115 = _574 + _6113;
        float _6117 = fma(_6041, _6041, _6103);
        float _6119 = -_6029;
        float _6121 = _534 + _6119;
        float _6123 = -_6005;
        float _6125 = _522 + _6123;
        float _6127 = -_6005;
        float _6129 = _512 + _6127;
        float _6131 = fma(_6107, _6107, _6117);
        float _6133 = -_6029;
        float _6135 = _524 + _6133;
        float _6137 = -_6005;
        float _6139 = _500 + _6137;
        float _6141 = -_6005;
        float _6143 = _466 + _6141;
        float _6145 = 1.0 / _6131;
        float _6147 = -_6005;
        float _6149 = _456 + _6147;
        float _6151 = -_6005;
        float _6153 = _446 + _6151;
        float _6155 = -_6005;
        float _6157 = _674 + _6155;
        float _6159 = -_6005;
        float _6161 = _664 + _6159;
        float _6163 = -_6005;
        float _6165 = _654 + _6163;
        float _6167 = -_6005;
        float _6169 = _644 + _6167;
        float _6171 = -_6005;
        float _6173 = _634 + _6171;
        float _6175 = -_6005;
        float _6177 = _624 + _6175;
        float _6179 = -_6005;
        float _6181 = _614 + _6179;
        float _6183 = -_6005;
        float _6185 = _582 + _6183;
        float _6187 = -_6029;
        float _6189 = _514 + _6187;
        float _6191 = -_6029;
        float _6193 = _502 + _6191;
        float _6195 = -_6029;
        float _6197 = _468 + _6195;
        float _6199 = -_6029;
        float _6201 = _458 + _6199;
        float _6203 = _6025 * _6145;
        float _6205 = _6041 * _6145;
        float _6207 = _6107 * _6145;
        float _6209 = _6203 * _6017;
        float _6211 = _6203 * _6111;
        float _6213 = _6203 * _6125;
        float _6215 = _6203 * _6129;
        float _6217 = fma(_6205, _6033, _6209);
        float _6219 = fma(_6205, _6045, _6211);
        float _6221 = fma(_6205, _6049, _6213);
        float _6223 = fma(_6205, _6053, _6215);
        float _6225 = fma(_6207, _6115, _6217);
        float _6227 = fma(_6207, _6121, _6219);
        float _6229 = fma(_6207, _6135, _6221);
        float _6231 = _6203 * _6139;
        float _6233 = _6203 * _6185;
        bool _6235 = _6225 >= 0.5;
        float _6237 = _6203 * _6143;
        bool _6239 = _6227 >= 0.5;
        float _6241 = _6203 * _6149;
        bool _6243 = _6225 >= 0.833000004291534423828125;
        float _6245 = _6203 * _6153;
        bool _6247 = _6225 >= 0.16599999368190765380859375;
        float _6249 = _6203 * _6157;
        float _6251 = _6203 * _6161;
        float _6253 = _6203 * _6165;
        float _6255 = _6203 * _6169;
        float _6257 = _6203 * _6173;
        float _6259 = _6203 * _6177;
        float _6261 = _6203 * _6181;
        int _6263 = _6243 ? 0 : 32768;
        float _6265 = fma(_6207, _6189, _6223);
        bool _6267 = _6227 >= 0.833000004291534423828125;
        float _6269 = fma(_6205, _6057, _6231);
        int _6271 = _6263;
        if (!_6235)
        {
            int _6273 = _6247 ? 49152 : 16384;
            _6271 = _6273;
        }
        int _6275 = _6271;
        float _6277 = fma(_6205, _6061, _6237);
        bool _6279 = _6227 >= 0.16599999368190765380859375;
        float _6281 = fma(_6205, _6065, _6241);
        float _6283 = fma(_6205, _6069, _6245);
        bool _6285 = _6229 >= 0.5;
        float _6287 = fma(_6205, _6073, _6249);
        float _6289 = fma(_6205, _6077, _6251);
        float _6291 = fma(_6205, _6081, _6253);
        float _6293 = fma(_6205, _6085, _6255);
        float _6295 = fma(_6205, _6089, _6257);
        float _6297 = fma(_6205, _6093, _6259);
        float _6299 = fma(_6205, _6097, _6261);
        float _6301 = fma(_6205, _6101, _6233);
        int _6303 = _6267 ? 0 : 8192;
        float _6305 = fma(_6207, _6193, _6269);
        bool _6307 = _6265 >= 0.5;
        float _6309 = fma(_6207, _6197, _6277);
        int _6311 = _6303;
        if (!_6239)
        {
            int _6313 = _6279 ? 12288 : 4096;
            _6311 = _6313;
        }
        int _6315 = _6311;
        float _6317 = fma(_6207, _6201, _6281);
        bool _6319 = _6265 >= 0.833000004291534423828125;
        float _6321 = -_6029;
        float _6323 = _676 + _6321;
        bool _6325 = _6229 >= 0.833000004291534423828125;
        float _6327 = -_6029;
        float _6329 = _666 + _6327;
        bool _6331 = _6229 >= 0.16599999368190765380859375;
        float _6333 = fma(_6207, _6323, _6287);
        int _6335 = _6319 ? 0 : 512;
        float _6337 = fma(_6207, _6329, _6289);
        bool _6339 = _6305 >= 0.5;
        float _6341 = -_6029;
        float _6343 = _656 + _6341;
        int _6345 = _6325 ? 0 : 2048;
        float _6347 = -_6029;
        float _6349 = _646 + _6347;
        bool _6351 = _6265 >= 0.16599999368190765380859375;
        float _6353 = fma(_6207, _6343, _6291);
        float _6355 = fma(_6207, _6349, _6293);
        int _6357 = _6345;
        int _6359 = _6335;
        if (!_6285)
        {
            int _6361 = _6331 ? 3072 : 1024;
            _6357 = _6361;
        }
        int _6363 = _6357;
        float _6365 = -_6029;
        float _6367 = _5621 + _6365;
        bool _6369 = _6309 >= 0.5;
        float _6371 = -_6029;
        float _6373 = _616 + _6371;
        if (!_6307)
        {
            int _6375 = _6351 ? 768 : 256;
            _6359 = _6375;
        }
        int _6377 = _6359;
        float _6379 = fma(_6207, _6367, _6295);
        bool _6381 = _6305 >= 0.833000004291534423828125;
        float _6383 = -_6029;
        float _6385 = _626 + _6383;
        bool _6387 = _6309 >= 0.833000004291534423828125;
        float _6389 = fma(_6207, _6373, _6299);
        bool _6391 = _6305 >= 0.16599999368190765380859375;
        float _6393 = fma(_6207, _6385, _6297);
        int _6395 = _6381 ? 0 : 128;
        float _6397 = -_6029;
        float _6399 = _448 + _6397;
        int _6401 = _6387 ? 0 : 32;
        float _6403 = -_6029;
        float _6405 = _584 + _6403;
        bool _6407 = _6317 >= 0.5;
        float _6409 = fma(_6207, _6399, _6283);
        bool _6411 = _6309 >= 0.16599999368190765380859375;
        float _6413 = fma(_6207, _6405, _6301);
        int _6415 = _6395;
        int _6417 = _6401;
        if (!_6339)
        {
            int _6419 = _6391 ? 192 : 64;
            _6415 = _6419;
        }
        int _6421 = _6415;
        bool _6423 = _6317 >= 0.833000004291534423828125;
        if (!_6369)
        {
            int _6425 = _6411 ? 48 : 16;
            _6417 = _6425;
        }
        int _6427 = _6417;
        int _6429 = _6423 ? 0 : 8;
        bool _6431 = _6333 >= 0.5;
        bool _6433 = _6317 >= 0.16599999368190765380859375;
        bool _6435 = _6337 >= 0.5;
        bool _6437 = _6333 >= 0.833000004291534423828125;
        int _6439 = _6429;
        if (!_6407)
        {
            int _6441 = _6433 ? 12 : 4;
            _6439 = _6441;
        }
        int _6443 = _6439;
        bool _6445 = _6337 >= 0.833000004291534423828125;
        bool _6447 = _6333 >= 0.16599999368190765380859375;
        int _6449 = _6437 ? 0 : int(0x80000000);
        bool _6451 = _6337 >= 0.16599999368190765380859375;
        int _6453 = _6445 ? 0 : 536870912;
        bool _6455 = _6353 >= 0.5;
        int _6457 = _6449;
        int _6459 = _6453;
        if (!_6431)
        {
            int _6461 = _6447 ? (-1073741824) : 1073741824;
            _6457 = _6461;
        }
        int _6463 = _6457;
        bool _6465 = _6355 >= 0.5;
        if (!_6435)
        {
            int _6467 = _6451 ? 805306368 : 268435456;
            _6459 = _6467;
        }
        int _6469 = _6459;
        bool _6471 = _6353 >= 0.833000004291534423828125;
        bool _6473 = _6355 >= 0.833000004291534423828125;
        int _6475 = _6471 ? 0 : 134217728;
        bool _6477 = _6353 >= 0.16599999368190765380859375;
        bool _6479 = _6379 >= 0.5;
        int _6481 = _6473 ? 0 : 33554432;
        bool _6483 = _6355 >= 0.16599999368190765380859375;
        int _6485 = _6475;
        int _6487 = _6481;
        if (!_6455)
        {
            int _6489 = _6477 ? 201326592 : 67108864;
            _6485 = _6489;
        }
        int _6491 = _6485;
        bool _6493 = _6379 >= 0.833000004291534423828125;
        if (!_6465)
        {
            int _6495 = _6483 ? 50331648 : 16777216;
            _6487 = _6495;
        }
        int _6497 = _6487;
        bool _6499 = _6389 >= 0.5;
        bool _6501 = _6379 >= 0.16599999368190765380859375;
        int _6503 = _6493 ? 0 : 8388608;
        bool _6505 = _6393 >= 0.5;
        bool _6507 = _6393 >= 0.833000004291534423828125;
        int _6509 = _6503;
        if (!_6479)
        {
            int _6511 = _6501 ? 12582912 : 4194304;
            _6509 = _6511;
        }
        int _6513 = _6509;
        bool _6515 = _6393 >= 0.16599999368190765380859375;
        bool _6517 = _6389 >= 0.833000004291534423828125;
        int _6519 = _6507 ? 0 : 2097152;
        bool _6521 = _6389 >= 0.16599999368190765380859375;
        int _6523 = _6517 ? 0 : 524288;
        int _6525 = _6523;
        int _6527 = _6519;
        if (!_6499)
        {
            int _6529 = _6521 ? 786432 : 262144;
            _6525 = _6529;
        }
        int _6531 = _6525;
        bool _6533 = _6409 >= 0.5;
        bool _6535 = _6413 >= 0.5;
        if (!_6505)
        {
            int _6537 = _6515 ? 3145728 : 1048576;
            _6527 = _6537;
        }
        int _6539 = _6527;
        bool _6541 = _6409 >= 0.833000004291534423828125;
        int _6543 = _6491 + _6463;
        int _6545 = _6543 + _6469;
        int _6547 = _6363 + _6275;
        int _6549 = _6547 + _6315;
        bool _6551 = _6413 >= 0.833000004291534423828125;
        int _6553 = _6541 ? 0 : 2;
        bool _6555 = _6409 >= 0.16599999368190765380859375;
        bool _6557 = _6413 >= 0.16599999368190765380859375;
        int _6559 = _6513 + _6545;
        int _6561 = _6559 + _6497;
        int _6563 = _6421 + _6549;
        int _6565 = _6563 + _6377;
        int _6567 = _6551 ? 0 : 131072;
        int _6569 = _6553;
        int _6571 = _6567;
        _5961 = 3;
        if (!_6533)
        {
            int _6573 = _6555 ? 3 : 1;
            _6569 = _6573;
        }
        int _6575 = _6569;
        if (!_6535)
        {
            int _6577 = _6557 ? 196608 : 65536;
            _6571 = _6577;
        }
        int _6579 = _6571;
        int _6581 = _6531 + _6561;
        int _6583 = _6581 + _6539;
        int _6585 = _6443 + _6565;
        int _6587 = _6585 + _6427;
        bool _6589 = !_5995;
        int _6591 = _6589 ? _5943 : _5939;
        bool _6593 = !_5995;
        int _6595 = _6593 ? _5939 : _5943;
        int _6597 = _6583 + _6579;
        int _6599 = _6587 + _6575;
        _5973 = _6591;
        _5987 = _6597;
        _5981 = _6599;
        _5963 = _6595;
    }
    int _6601 = _5973;
    int _6603 = _5961;
    int _6605 = _5987;
    int _6607 = _5981;
    int _6609 = _5963;
    int _6611 = _6603;
    if (!_5947)
    {
        _6611 = 0;
    }
    int _6613 = _6611;
    int _6615 = _6613;
    if (!_5947)
    {
        _5965 = 0;
    }
    int _6617 = _5965;
    bool _6619 = !_5947;
    int _6621 = _6617;
    if (!_6619)
    {
        float _6623 = -_5893;
        float _6625 = _5665 + _6623;
        float _6627 = -_5893;
        float _6629 = _470 + _6627;
        float _6631 = -_5893;
        float _6633 = _450 + _6631;
        float _6635 = -_5893;
        float _6637 = _460 + _6635;
        float _6639 = -_5893;
        float _6641 = _526 + _6639;
        float _6643 = 1.0 / _6625;
        float _6645 = -_5893;
        float _6647 = _536 + _6645;
        float _6649 = -_5893;
        float _6651 = _576 + _6649;
        float _6653 = -_5893;
        float _6655 = _586 + _6653;
        float _6657 = -_5893;
        float _6659 = _618 + _6657;
        float _6661 = -_5893;
        float _6663 = _628 + _6661;
        float _6665 = -_5893;
        float _6667 = _638 + _6665;
        float _6669 = -_5893;
        float _6671 = _648 + _6669;
        float _6673 = -_5893;
        float _6675 = _658 + _6673;
        float _6677 = -_5893;
        float _6679 = _668 + _6677;
        float _6681 = -_5893;
        float _6683 = _678 + _6681;
        float _6685 = _6629 * _6643;
        float _6687 = -_5893;
        float _6689 = _504 + _6687;
        float _6691 = _6633 * _6643;
        float _6693 = _6637 * _6643;
        float _6695 = _6689 * _6643;
        float _6697 = -_5893;
        float _6699 = _516 + _6697;
        float _6701 = fma(_6691, -1.99999904632568359375, 1.99999904632568359375);
        float _6703 = fma(_6691, -7.99999904632568359375, 7.99999904632568359375);
        float _6705 = fma(_6693, -1.99999904632568359375, 1.99999904632568359375);
        float _6707 = fma(_6693, -7.99999904632568359375, 7.99999904632568359375);
        float _6709 = fma(_6685, -1.99999904632568359375, 1.99999904632568359375);
        float _6711 = fma(_6685, -7.99999904632568359375, 7.99999904632568359375);
        float _6713 = _6699 * _6643;
        float _6715 = -_6691;
        float _6717 = _6715 + 0.5;
        float _6719 = -_6693;
        float _6721 = _6719 + 0.5;
        float _6723 = fma(_6695, -1.99999904632568359375, 1.99999904632568359375);
        float _6725 = fma(_6695, -7.99999904632568359375, 7.99999904632568359375);
        float _6727 = trunc(_6701);
        float _6729 = precise::max(_6727, 0.0);
        uint _6731 = uint(_6729);
        float _6733 = fma(_6713, -1.99999904632568359375, 1.99999904632568359375);
        float _6735 = fma(_6713, -7.99999904632568359375, 7.99999904632568359375);
        float _6737 = _6641 * _6643;
        float _6739 = _6647 * _6643;
        float _6741 = -_6685;
        float _6743 = _6741 + 0.5;
        float _6745 = abs(_6717);
        bool _6747 = _6745 >= 0.375;
        float _6749 = -_6695;
        float _6751 = _6749 + 0.5;
        float _6753 = trunc(_6703);
        float _6755 = precise::max(_6753, 0.0);
        uint _6757 = uint(_6755);
        float _6759 = abs(_6721);
        bool _6761 = _6759 >= 0.375;
        float _6763 = fma(_6737, -1.99999904632568359375, 1.99999904632568359375);
        float _6765 = fma(_6737, -7.99999904632568359375, 7.99999904632568359375);
        float _6767 = fma(_6739, -1.99999904632568359375, 1.99999904632568359375);
        float _6769 = fma(_6739, -7.99999904632568359375, 7.99999904632568359375);
        float _6771 = _6651 * _6643;
        float _6773 = _6655 * _6643;
        float _6775 = trunc(_6705);
        float _6777 = precise::max(_6775, 0.0);
        uint _6779 = uint(_6777);
        float _6781 = -_6713;
        float _6783 = _6781 + 0.5;
        float _6785 = abs(_6743);
        bool _6787 = _6785 >= 0.375;
        float _6789 = _6659 * _6643;
        float _6791 = fma(_6771, -1.99999904632568359375, 1.99999904632568359375);
        float _6793 = fma(_6771, -7.99999904632568359375, 7.99999904632568359375);
        float _6795 = fma(_6773, -1.99999904632568359375, 1.99999904632568359375);
        float _6797 = fma(_6773, -7.99999904632568359375, 7.99999904632568359375);
        float _6799 = trunc(_6707);
        float _6801 = precise::max(_6799, 0.0);
        uint _6803 = uint(_6801);
        float _6805 = -_6737;
        float _6807 = _6805 + 0.5;
        float _6809 = abs(_6751);
        bool _6811 = _6809 >= 0.375;
        float _6813 = -_6739;
        float _6815 = _6813 + 0.5;
        float _6817 = abs(_6783);
        bool _6819 = _6817 >= 0.375;
        float _6821 = fma(_6789, -1.99999904632568359375, 1.99999904632568359375);
        float _6823 = fma(_6789, -7.99999904632568359375, 7.99999904632568359375);
        float _6825 = _6663 * _6643;
        float _6827 = trunc(_6709);
        float _6829 = precise::max(_6827, 0.0);
        uint _6831 = uint(_6829);
        float _6833 = _6667 * _6643;
        float _6835 = -_6771;
        float _6837 = _6835 + 0.5;
        float _6839 = -_6773;
        float _6841 = _6839 + 0.5;
        float _6843 = abs(_6807);
        bool _6845 = _6843 >= 0.375;
        float _6847 = fma(_6825, -1.99999904632568359375, 1.99999904632568359375);
        float _6849 = abs(_6815);
        bool _6851 = _6849 >= 0.375;
        float _6853 = fma(_6825, -7.99999904632568359375, 7.99999904632568359375);
        float _6855 = trunc(_6711);
        float _6857 = precise::max(_6855, 0.0);
        uint _6859 = uint(_6857);
        float _6861 = fma(_6833, -1.99999904632568359375, 1.99999904632568359375);
        float _6863 = fma(_6833, -7.99999904632568359375, 7.99999904632568359375);
        float _6865 = _6671 * _6643;
        float _6867 = _6675 * _6643;
        float _6869 = -_6789;
        float _6871 = _6869 + 0.5;
        int _6873 = int(_6731);
        int _6875 = int(_6779);
        int _6877 = int(_6831);
        if (!_6747)
        {
            int _6879 = int(_6757) + 1;
            _6873 = _6879;
        }
        int _6881 = _6873;
        float _6883 = _6679 * _6643;
        float _6885 = trunc(_6723);
        float _6887 = precise::max(_6885, 0.0);
        uint _6889 = uint(_6887);
        int _6891 = int(_6889);
        if (!_6761)
        {
            int _6893 = int(_6803) + 1;
            _6875 = _6893;
        }
        int _6895 = _6875;
        float _6897 = _6683 * _6643;
        float _6899 = abs(_6837);
        bool _6901 = _6899 >= 0.375;
        float _6903 = fma(_6865, -1.99999904632568359375, 1.99999904632568359375);
        float _6905 = abs(_6841);
        bool _6907 = _6905 >= 0.375;
        float _6909 = fma(_6865, -7.99999904632568359375, 7.99999904632568359375);
        float _6911 = fma(_6867, -1.99999904632568359375, 1.99999904632568359375);
        float _6913 = trunc(_6725);
        float _6915 = precise::max(_6913, 0.0);
        uint _6917 = uint(_6915);
        float _6919 = fma(_6867, -7.99999904632568359375, 7.99999904632568359375);
        if (!_6787)
        {
            int _6921 = int(_6859) + 1;
            _6877 = _6921;
        }
        int _6923 = _6877;
        float _6925 = -_6825;
        float _6927 = _6925 + 0.5;
        float _6929 = -_6833;
        float _6931 = _6929 + 0.5;
        float _6933 = abs(_6871);
        bool _6935 = _6933 >= 0.375;
        float _6937 = fma(_6883, -1.99999904632568359375, 1.99999904632568359375);
        float _6939 = -_6865;
        float _6941 = _6939 + 0.5;
        float _6943 = trunc(_6733);
        float _6945 = precise::max(_6943, 0.0);
        uint _6947 = uint(_6945);
        float _6949 = -_6867;
        float _6951 = _6949 + 0.5;
        float _6953 = fma(_6883, -7.99999904632568359375, 7.99999904632568359375);
        float _6955 = fma(_6897, -1.99999904632568359375, 1.99999904632568359375);
        float _6957 = -_6883;
        float _6959 = _6957 + 0.5;
        int _6961 = _6895 << 3;
        float _6963 = trunc(_6735);
        float _6965 = precise::max(_6963, 0.0);
        uint _6967 = uint(_6965);
        int _6969 = int(_6947);
        if (!_6811)
        {
            int _6971 = int(_6917) + 1;
            _6891 = _6971;
        }
        int _6973 = _6891;
        float _6975 = fma(_6897, -7.99999904632568359375, 7.99999904632568359375);
        float _6977 = abs(_6927);
        bool _6979 = _6977 >= 0.375;
        float _6981 = -_6897;
        float _6983 = _6981 + 0.5;
        int _6985 = _6881 | _6961;
        int _6987 = _6973 << 9;
        float _6989 = trunc(_6763);
        float _6991 = precise::max(_6989, 0.0);
        uint _6993 = uint(_6991);
        float _6995 = trunc(_6765);
        float _6997 = precise::max(_6995, 0.0);
        uint _6999 = uint(_6997);
        int _7001 = int(_6993);
        if (!_6819)
        {
            int _7003 = int(_6967) + 1;
            _6969 = _7003;
        }
        int _7005 = _6969;
        float _7007 = abs(_6931);
        bool _7009 = _7007 >= 0.375;
        float _7011 = trunc(_6767);
        float _7013 = precise::max(_7011, 0.0);
        uint _7015 = uint(_7013);
        float _7017 = trunc(_6769);
        float _7019 = precise::max(_7017, 0.0);
        uint _7021 = uint(_7019);
        int _7023 = int(_7015);
        if (!_6845)
        {
            int _7025 = int(_6999) + 1;
            _7001 = _7025;
        }
        int _7027 = _7001;
        float _7029 = abs(_6941);
        bool _7031 = _7029 >= 0.375;
        int _7033 = _7027 << 15;
        float _7035 = trunc(_6791);
        float _7037 = precise::max(_7035, 0.0);
        uint _7039 = uint(_7037);
        float _7041 = trunc(_6793);
        float _7043 = precise::max(_7041, 0.0);
        uint _7045 = uint(_7043);
        int _7047 = int(_7039);
        if (!_6851)
        {
            int _7049 = int(_7021) + 1;
            _7023 = _7049;
        }
        int _7051 = _7023;
        float _7053 = abs(_6951);
        bool _7055 = _7053 >= 0.375;
        float _7057 = trunc(_6795);
        float _7059 = precise::max(_7057, 0.0);
        uint _7061 = uint(_7059);
        float _7063 = trunc(_6797);
        float _7065 = precise::max(_7063, 0.0);
        uint _7067 = uint(_7065);
        int _7069 = int(_7061);
        if (!_6901)
        {
            int _7071 = int(_7045) + 1;
            _7047 = _7071;
        }
        int _7073 = _7047;
        float _7075 = abs(_6959);
        bool _7077 = _7075 >= 0.375;
        int _7079 = _7073 << 21;
        float _7081 = trunc(_6821);
        float _7083 = precise::max(_7081, 0.0);
        uint _7085 = uint(_7083);
        float _7087 = trunc(_6823);
        float _7089 = precise::max(_7087, 0.0);
        uint _7091 = uint(_7089);
        int _7093 = int(_7085);
        if (!_6907)
        {
            int _7095 = int(_7067) + 1;
            _7069 = _7095;
        }
        int _7097 = _7069;
        float _7099 = abs(_6983);
        bool _7101 = _7099 >= 0.375;
        float _7103 = trunc(_6847);
        float _7105 = precise::max(_7103, 0.0);
        uint _7107 = uint(_7105);
        float _7109 = trunc(_6853);
        float _7111 = precise::max(_7109, 0.0);
        uint _7113 = uint(_7111);
        int _7115 = int(_7107);
        if (!_6935)
        {
            int _7117 = int(_7091) + 1;
            _7093 = _7117;
        }
        int _7119 = _7093;
        int _7121 = _7119 << 3;
        float _7123 = trunc(_6861);
        float _7125 = precise::max(_7123, 0.0);
        uint _7127 = uint(_7125);
        int _7129 = _7097 | _7121;
        float _7131 = trunc(_6863);
        float _7133 = precise::max(_7131, 0.0);
        uint _7135 = uint(_7133);
        int _7137 = int(_7127);
        if (!_6979)
        {
            int _7139 = int(_7113) + 1;
            _7115 = _7139;
        }
        int _7141 = _7115;
        int _7143 = _7141 << 6;
        float _7145 = trunc(_6903);
        float _7147 = precise::max(_7145, 0.0);
        uint _7149 = uint(_7147);
        float _7151 = trunc(_6909);
        float _7153 = precise::max(_7151, 0.0);
        uint _7155 = uint(_7153);
        int _7157 = int(_7149);
        if (!_7009)
        {
            int _7159 = int(_7135) + 1;
            _7137 = _7159;
        }
        int _7161 = _7137;
        int _7163 = _7161 << 9;
        float _7165 = trunc(_6911);
        float _7167 = precise::max(_7165, 0.0);
        uint _7169 = uint(_7167);
        int _7171 = _7129 | _7143;
        int _7173 = _7163 | _7171;
        float _7175 = trunc(_6919);
        float _7177 = precise::max(_7175, 0.0);
        uint _7179 = uint(_7177);
        int _7181 = int(_7169);
        if (!_7031)
        {
            int _7183 = int(_7155) + 1;
            _7157 = _7183;
        }
        int _7185 = _7157;
        float _7187 = trunc(_6937);
        float _7189 = precise::max(_7187, 0.0);
        uint _7191 = uint(_7189);
        float _7193 = trunc(_6953);
        float _7195 = precise::max(_7193, 0.0);
        uint _7197 = uint(_7195);
        int _7199 = int(_7191);
        if (!_7055)
        {
            int _7201 = int(_7179) + 1;
            _7181 = _7201;
        }
        int _7203 = _7181;
        int _7205 = _7203 << 15;
        float _7207 = trunc(_6955);
        float _7209 = precise::max(_7207, 0.0);
        uint _7211 = uint(_7209);
        float _7213 = trunc(_6975);
        float _7215 = precise::max(_7213, 0.0);
        uint _7217 = uint(_7215);
        int _7219 = _6923 << 6;
        int _7221 = _7185 << 12;
        int _7223 = _6985 | _7219;
        int _7225 = _6987 | _7223;
        int _7227 = _7005 << 12;
        int _7229 = int(_7211);
        if (!_7077)
        {
            int _7231 = int(_7197) + 1;
            _7199 = _7231;
        }
        int _7233 = _7199;
        int _7235 = _7225 | _7227;
        int _7237 = _7033 | _7235;
        int _7239 = _7173 | _7221;
        int _7241 = _7205 | _7239;
        int _7243 = _7051 << 18;
        if (!_7101)
        {
            int _7245 = int(_7217) + 1;
            _7229 = _7245;
        }
        int _7247 = _7229;
        int _7249 = _7233 << 18;
        int _7251 = _7247 << 21;
        int _7253 = _7237 | _7243;
        int _7255 = _7079 | _7253;
        int _7257 = _7241 | _7249;
        int _7259 = _7251 | _7257;
        uint _7261 = uint(int(uint(_7255) >> uint(16)));
        int _7263 = _7259 << 8;
        uint _7265 = uint(int(uint(_7259) >> uint(8)));
        int _7267 = 65280 & _7263;
        int _7269 = int(_7261) | _7267;
        int _7271 = _7255 << 16;
        int _7273 = int(_7265) << 16;
        _5977 = _7271;
        _6621 = _7273;
        _6615 = _7269;
    }
    int _7275 = _5977;
    int _7277 = _6621;
    int _7279 = _6615;
    int _7281 = _6601 & 65535;
    int _7283 = _7275 | _5971;
    int _7285 = _7277 | _7279;
    int _7287 = _6605 | _6607;
    int _7289 = _6609 << 16;
    int _7291 = _7289 + _7281;
    out.m_41.x = as_type<float>(_7283);
    out.m_41.y = as_type<float>(_7285);
    out.m_41.z = as_type<float>(_7291);
    out.m_41.w = as_type<float>(_7287);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

