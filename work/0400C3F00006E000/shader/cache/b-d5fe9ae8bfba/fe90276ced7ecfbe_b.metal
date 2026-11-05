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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
    float4 m_71 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_42.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_44.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_44.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_46.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_46.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = 1.0 / _78;
    float _124 = _122 * _84;
    float _126 = _122 * _90;
    float _128 = _122 * _96;
    float _130 = _122 * _102;
    float _132 = 1.0 / _124;
    float _134 = _122 * _108;
    float _136 = _122 * _114;
    float _138 = _122 * _120;
    float _140 = _126 * _132;
    float _142 = _128 * _132;
    float2 _778 = float2(_140, _142);
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_778, float2(0.0), isnan(_778))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_778, float2(0.0), isnan(_778))).x;
    float2 _789 = float2(_130, _134);
    float4 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_789, float2(0.0), isnan(_789))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_789, float2(0.0), isnan(_789))).xyzw;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float _155 = _147.w;
    float2 _805 = float2(_136, _138);
    float4 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_805, float2(0.0), isnan(_805))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_805, float2(0.0), isnan(_805))).xyzw;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float _165 = _157.w;
    float _167 = in.m_42.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_48.w;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_50.w;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_52.w;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _193 = _122 * _171;
    float _195 = _193 * _132;
    float _197 = in.m_54.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _205 = fma(_195, (*spvDescriptorSet0.fp_c8)._m0[30].w, _203);
    float _207 = 1.0 / _205;
    float _209 = _122 * _183;
    float _211 = _122 * _201;
    float _213 = in.m_52.z;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_50.x;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_50.y;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_50.z;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _239 = fma(_144, (*spvDescriptorSet0.fp_c8)._m0[30].w, _237);
    float _241 = _122 * _177;
    float _243 = _155 * _165;
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _247 = _207 * _245;
    float _249 = 1.0 / _239;
    float _251 = -_241;
    float _253 = fma(_243, _209, _251);
    float _255 = _122 * _189;
    float _257 = _255 * _253;
    float _259 = 0.0 + _257;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _265 = -_247;
    float _267 = fma(_249, _263, _265);
    float _269 = _267 * _191;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = _261 * _271;
    float _275 = _273 * _211;
    bool _278 = _275 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _280 = isnan(_275);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _286 = _282 || _284;
    float _288 = in.m_48.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_48.y;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_52.x;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_48.z;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_52.y;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = _275;
    if (!_286)
    {
        discard_fragment();
    }
    float _320 = _149 * _159;
    float _322 = _153 * _163;
    float _324 = _151 * _161;
    float _326 = _122 * _292;
    float _328 = _122 * _298;
    float _330 = _122 * _304;
    float _332 = _122 * _310;
    float _334 = _122 * _217;
    float _336 = _122 * _316;
    float _338 = -_330;
    float _340 = _326 + _338;
    float _342 = -_334;
    float _344 = _332 + _342;
    float _346 = -_336;
    float _348 = _328 + _346;
    float _350 = fma(_320, _340, _330);
    float _352 = _122 * _223;
    float _354 = fma(_322, _344, _334);
    float _356 = fma(_324, _348, _336);
    float _358 = _122 * _229;
    float _360 = _122 * _235;
    float _362 = _350 * _352;
    float _364 = _356 * _358;
    float _366 = _354 * _360;
    if (!_286)
    {
        out.m_57.x = _362;
        out.m_57.y = _364;
        out.m_57.z = _366;
        out.m_57.w = _257;
        return out;
    }
    float _368 = in.m_59.w;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = _122 * _372;
    bool _376 = _374 != 1.0;
    bool _378 = isnan(_374);
    bool _380 = _376 || _378;
    bool _382 = isnan(1.0);
    bool _384 = _380 || _382;
    bool _386 = !_384;
    if (!_386)
    {
        float _388 = gl_FragCoord.x;
        float _390 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _392 = _388 / _390;
        float _394 = gl_FragCoord.y;
        float _396 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _398 = _394 / _396;
        float _400 = _374 * 256.0;
        float _402 = trunc(_400);
        int _405 = int(_402);
        float _407 = trunc(_392);
        int _409 = int(_407);
        float _411 = trunc(_398);
        int _413 = int(_411);
        int _415 = _409 + 2;
        int _417 = _415 >> 1;
        uint _420 = uint(int(uint(_413) >> uint(1)));
        int _422 = _417 ^ int(_420);
        int _424 = _422 << 16;
        int _426 = _424 ^ _417;
        int _428 = 983055 & _426;
        int _430 = _428 << 6;
        int _432 = _430 + _428;
        int _434 = _432 & 13369548;
        uint _436 = uint(int(uint(_434) >> uint(3)));
        int _438 = _434 | int(_436);
        uint _440 = uint(int(uint(_405) >> uint(7)));
        int _442 = int(_440) + _405;
        int _444 = _438 & 5570560;
        int _446 = _438 & 85;
        uint _448 = uint(int(uint(_444) >> uint(15)));
        int _450 = int(_448) + _446;
        bool _452 = uint(_442) > uint(_450);
        if (!_452)
        {
            discard_fragment();
        }
        if (!_452)
        {
            out.m_57.x = _362;
            out.m_57.y = _364;
            out.m_57.z = _366;
            out.m_57.w = _275;
            return out;
        }
    }
    float _454 = in.m_61.y;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _462 = in.m_61.x;
    float _464 = gl_FragCoord.w;
    float _466 = _462 * _464;
    float _468 = in.m_61.z;
    float _470 = gl_FragCoord.w;
    float _472 = _468 * _470;
    float _474 = in.m_59.x;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = _122 * _458;
    bool _482 = as_type<int>(_460) != 0;
    float _484 = _122 * _466;
    bool _486 = !_482;
    float _488 = -_480;
    float _490 = _486 ? _488 : _480;
    float _492 = _122 * _472;
    bool _494 = !_482;
    float _496 = -_484;
    float _498 = _494 ? _496 : _484;
    float _500 = _490 * _490;
    bool _502 = !_482;
    float _504 = -_492;
    float _506 = _502 ? _504 : _492;
    float _508 = fma(_498, _498, _500);
    float _510 = fma(_506, _506, _508);
    float _512 = rsqrt(_510);
    float _514 = _498 * _512;
    float _516 = _490 * _512;
    float _518 = _506 * _512;
    float _520 = _122 * _478;
    float _522 = abs(_514);
    float _524 = abs(_516);
    float _526 = precise::max(_522, _524);
    float _528 = precise::min(_520, 1.0);
    float _530 = abs(_518);
    float _532 = precise::max(_530, _526);
    float _534 = 1.0 / _532;
    float _536 = -_534;
    float _538 = _518 * _536;
    float _540 = _514 * _534;
    float _542 = _516 * _534;
    float3 _1370 = float3(_540, _542, _538);
    float3 _546 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1370, float3(0.0), isnan(_1370)), level(_528)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1370, float3(0.0), isnan(_1370)), level(_528)).xyz;
    float _548 = _546.x;
    float _550 = _546.y;
    float _552 = _546.z;
    float _554 = in.m_67.x;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    float _560 = in.m_67.z;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    float _566 = in.m_67.y;
    float _568 = gl_FragCoord.w;
    float _570 = _566 * _568;
    float _572 = in.m_69.z;
    float _574 = gl_FragCoord.w;
    float _576 = _572 * _574;
    float _578 = in.m_69.x;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    float _584 = in.m_69.y;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = in.m_71.x;
    float _592 = gl_FragCoord.w;
    float _594 = _590 * _592;
    float _596 = in.m_71.y;
    float _598 = gl_FragCoord.w;
    float _600 = _596 * _598;
    float _602 = in.m_71.z;
    float _604 = gl_FragCoord.w;
    float _606 = _602 * _604;
    float _608 = in.m_71.w;
    float _610 = gl_FragCoord.w;
    float _612 = _608 * _610;
    bool _614 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _616 = _122 * _558;
    float _618 = _122 * _564;
    float _620 = _122 * _576;
    float _622 = _122 * _582;
    float _624 = _122 * _588;
    float _626 = _122 * _600;
    float _628 = fma(_548, 0.20999999344348907470703125, _616);
    float _630 = _122 * _570;
    float _632 = fma(_552, 0.20999999344348907470703125, _618);
    float _634 = _122 * _594;
    float _636 = _628 + _622;
    float _638 = fma(_550, 0.20999999344348907470703125, _630);
    float _640 = _550;
    if (_614)
    {
        float _642 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _644 = _247 + _642;
        _640 = _644;
    }
    float _646 = _640;
    float _648 = _632 + _620;
    float _650 = 0.0 + _275;
    float _652 = precise::clamp(_650, 0.0, 1.0);
    float _654 = _638 + _624;
    float _656 = _652;
    if (_614)
    {
        float _658 = _646 * 8.0;
        float _660 = precise::clamp(_658, 0.0, 1.0);
        _318 = _660;
    }
    float _662 = _318;
    float _664 = _122 * _606;
    float _666 = _122 * _612;
    float _668 = _362 * _636;
    float _670 = _364 * _654;
    float _672 = _366 * _648;
    if (_614)
    {
        float _674 = _652 * _662;
        _656 = _674;
    }
    float _676 = _656;
    float _678 = fma(_668, _666, _634);
    float _680 = fma(_670, _666, _626);
    float _682 = fma(_672, _666, _664);
    float _684 = 0.0 + _676;
    float _686 = precise::clamp(_684, 0.0, 1.0);
    out.m_57.x = _678;
    out.m_57.y = _680;
    out.m_57.z = _682;
    out.m_57.w = _686;
    return out;
}

