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
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_42 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_55 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_40.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_42.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _76;
    float _104 = _102 * _82;
    float _106 = _102 * _88;
    float _108 = _102 * _94;
    float _110 = _102 * _100;
    float2 _692 = float2(_104, _106);
    float4 _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692))).xyzw;
    float _115 = _113.x;
    float _117 = _113.y;
    float _119 = _113.z;
    float _121 = _113.w;
    float2 _711 = float2(_108, _110);
    float4 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_711, float2(0.0), isnan(_711))).xyzw;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _123.w;
    float _133 = in.m_44.w;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_46.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_48.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_50.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _102 * _137;
    float _159 = _102 * _143;
    float _161 = _102 * _149;
    float _163 = in.m_48.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_48.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_46.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_46.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_46.z;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = _102 * _173;
    float _195 = _121 * _131;
    float _197 = _102 * _155;
    float _199 = -_157;
    float _201 = fma(_195, _159, _199);
    float _203 = _161 * _201;
    float _205 = 0.0 + _203;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = _207 * _197;
    bool _212 = _209 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _214 = isnan(_209);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _220 = _216 || _218;
    float _222 = in.m_44.y;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_44.z;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_44.x;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_48.y;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    if (!_220)
    {
        discard_fragment();
    }
    float _246 = _115 * _125;
    float _248 = _119 * _129;
    float _250 = _117 * _127;
    float _252 = _102 * _191;
    float _254 = _102 * _226;
    float _256 = _102 * _232;
    float _258 = _102 * _167;
    float _260 = _102 * _238;
    float _262 = _102 * _244;
    float _264 = -_258;
    float _266 = _256 + _264;
    float _268 = -_193;
    float _270 = _260 + _268;
    float _272 = -_262;
    float _274 = _254 + _272;
    float _276 = fma(_248, _266, _258);
    float _278 = fma(_246, _270, _193);
    float _280 = _102 * _179;
    float _282 = fma(_250, _274, _262);
    float _284 = _102 * _185;
    float _286 = _278 * _280;
    float _288 = _282 * _284;
    float _290 = _276 * _252;
    if (!_220)
    {
        out.m_53.x = _286;
        out.m_53.y = _288;
        out.m_53.z = _290;
        out.m_53.w = _203;
        return out;
    }
    float _292 = in.m_55.w;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = _102 * _296;
    bool _300 = _298 != 1.0;
    bool _302 = isnan(_298);
    bool _304 = _300 || _302;
    bool _306 = isnan(1.0);
    bool _308 = _304 || _306;
    bool _310 = !_308;
    if (!_310)
    {
        float _312 = gl_FragCoord.x;
        float _314 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _316 = _312 / _314;
        float _318 = gl_FragCoord.y;
        float _320 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _322 = _318 / _320;
        float _324 = _298 * 256.0;
        float _326 = trunc(_324);
        int _329 = int(_326);
        uint _332 = uint(int(uint(_329) >> uint(7)));
        int _334 = int(_332) + _329;
        float _336 = trunc(_316);
        int _338 = int(_336);
        float _340 = trunc(_322);
        int _342 = int(_340);
        int _344 = _338 + 2;
        int _346 = _344 >> 1;
        uint _348 = uint(int(uint(_342) >> uint(1)));
        int _350 = _346 ^ int(_348);
        int _352 = _350 << 16;
        int _354 = _352 ^ _346;
        int _356 = 983055 & _354;
        int _358 = _356 << 6;
        int _360 = _358 + _356;
        int _362 = _360 & 13369548;
        uint _364 = uint(int(uint(_362) >> uint(3)));
        int _366 = _362 | int(_364);
        int _368 = _366 & 5570560;
        int _370 = _366 & 85;
        uint _372 = uint(int(uint(_368) >> uint(15)));
        int _374 = int(_372) + _370;
        bool _376 = uint(_334) > uint(_374);
        if (!_376)
        {
            discard_fragment();
        }
        if (!_376)
        {
            out.m_53.x = _286;
            out.m_53.y = _288;
            out.m_53.z = _290;
            out.m_53.w = _209;
            return out;
        }
    }
    float _378 = in.m_57.y;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _386 = in.m_57.x;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_57.z;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = in.m_55.x;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = _102 * _382;
    bool _406 = as_type<int>(_384) != 0;
    float _408 = _102 * _390;
    bool _410 = !_406;
    float _412 = -_404;
    float _414 = _410 ? _412 : _404;
    float _416 = _102 * _396;
    bool _418 = !_406;
    float _420 = -_408;
    float _422 = _418 ? _420 : _408;
    float _424 = _414 * _414;
    bool _426 = !_406;
    float _428 = -_416;
    float _430 = _426 ? _428 : _416;
    float _432 = fma(_422, _422, _424);
    float _434 = fma(_430, _430, _432);
    float _436 = rsqrt(_434);
    float _438 = _422 * _436;
    float _440 = _414 * _436;
    float _442 = _430 * _436;
    float _444 = _102 * _402;
    float _446 = abs(_438);
    float _448 = abs(_440);
    float _450 = precise::max(_446, _448);
    float _452 = abs(_442);
    float _454 = precise::max(_452, _450);
    float _456 = 1.0 / _454;
    float _458 = _438 * _456;
    float _460 = -_456;
    float _462 = _442 * _460;
    float _464 = precise::min(_444, 1.0);
    float _466 = _440 * _456;
    float3 _1214 = float3(_458, _466, _462);
    float3 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1214, float3(0.0), isnan(_1214)), level(_464)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1214, float3(0.0), isnan(_1214)), level(_464)).xyz;
    float _472 = _470.x;
    float _474 = _470.y;
    float _476 = _470.z;
    float _478 = in.m_63.y;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = in.m_63.z;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = in.m_63.x;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = in.m_65.z;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_65.x;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_65.y;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = in.m_67.x;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = in.m_67.w;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = in.m_67.y;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = in.m_67.z;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = _102 * _482;
    float _540 = _102 * _488;
    float _542 = _102 * _494;
    bool _544 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _546 = _102 * _524;
    float _548 = fma(_476, 0.20999999344348907470703125, _540);
    float _550 = fma(_472, 0.20999999344348907470703125, _542);
    float _552 = _102 * _500;
    float _554 = fma(_474, 0.20999999344348907470703125, _538);
    float _556 = _102 * _506;
    float _558 = _102 * _512;
    float _560 = _548 + _552;
    float _562 = _550 + _556;
    float _564 = _554 + _558;
    float _566 = _290 * _560;
    float _568 = 0.0 + _209;
    float _570 = precise::clamp(_568, 0.0, 1.0);
    float _572 = _286 * _562;
    float _574 = _102 * _518;
    float _576 = _288 * _564;
    float _578 = _102 * _530;
    float _580 = _102 * _536;
    float _582 = fma(_572, _546, _574);
    float _584 = _574;
    if (!_544)
    {
        _584 = _570;
    }
    float _586 = _584;
    float _588 = fma(_576, _546, _578);
    float _590 = fma(_566, _546, _580);
    bool _592 = !_544;
    float _594 = _586;
    if (!_592)
    {
        float _596 = in.m_69.w;
        float _598 = gl_FragCoord.w;
        float _600 = _596 * _598;
        float _602 = in.m_69.z;
        float _604 = gl_FragCoord.w;
        float _606 = _602 * _604;
        float _608 = _102 * _600;
        float _610 = _102 * _606;
        float _612 = 1.0 / _608;
        float _614 = _610 * _612;
        float _616 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _618 = fma(_614, (*spvDescriptorSet0.fp_c8)._m0[30].w, _616);
        float _620 = 1.0 / _618;
        float _622 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _624 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _626 = fma(_620, _622, _624);
        float _628 = _626 * 8.0;
        float _630 = precise::clamp(_628, 0.0, 1.0);
        float _632 = _570 * _630;
        _594 = _632;
    }
    float _634 = _594;
    float _636 = 0.0 + _634;
    float _638 = precise::clamp(_636, 0.0, 1.0);
    out.m_53.x = _582;
    out.m_53.y = _588;
    out.m_53.z = _590;
    out.m_53.w = _638;
    return out;
}

