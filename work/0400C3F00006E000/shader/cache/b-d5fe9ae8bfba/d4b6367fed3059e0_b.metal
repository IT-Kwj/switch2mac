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
    texturecube<float> fp_t_tcb_1E [[id(6)]];
    sampler fp_t_tcb_1ESmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_1ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_38.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_38.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _630 = float2(_88, _90);
    float4 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_630, float2(0.0), isnan(_630))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_630, float2(0.0), isnan(_630))).xyzw;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = _93.w;
    float _103 = in.m_40.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_42.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_44.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _86 * _107;
    float _123 = _86 * _113;
    float _125 = _86 * _119;
    float _127 = in.m_42.z;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_42.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_46.y;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_46.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_40.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_40.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_40.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _86 * _143;
    float _171 = _101 * _121;
    float _173 = _123 * _171;
    float _175 = 0.0 + _173;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = _177 * _125;
    bool _182 = _179 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _184 = isnan(_179);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _190 = _186 || _188;
    float _192 = in.m_42.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_46.x;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    if (!_190)
    {
        discard_fragment();
    }
    float _204 = _95 * _95;
    float _206 = _97 * _97;
    float _208 = _99 * _99;
    float _210 = _86 * _196;
    float _212 = _86 * _137;
    float _214 = _86 * _202;
    float _216 = _86 * _131;
    float _218 = _86 * _149;
    float _220 = -_169;
    float _222 = _212 + _220;
    float _224 = -_214;
    float _226 = _210 + _224;
    float _228 = -_218;
    float _230 = _216 + _228;
    float _232 = fma(_206, _222, _169);
    float _234 = fma(_204, _226, _214);
    float _236 = _86 * _155;
    float _238 = fma(_208, _230, _218);
    float _240 = _86 * _161;
    float _242 = _86 * _167;
    float _244 = _234 * _236;
    float _246 = _232 * _240;
    float _248 = _238 * _242;
    if (!_190)
    {
        out.m_49.x = _244;
        out.m_49.y = _246;
        out.m_49.z = _248;
        out.m_49.w = _173;
        return out;
    }
    float _250 = in.m_51.w;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = _86 * _254;
    bool _258 = _256 != 1.0;
    bool _260 = isnan(_256);
    bool _262 = _258 || _260;
    bool _264 = isnan(1.0);
    bool _266 = _262 || _264;
    bool _268 = !_266;
    if (!_268)
    {
        float _270 = gl_FragCoord.x;
        float _272 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _274 = _270 / _272;
        float _276 = gl_FragCoord.y;
        float _278 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _280 = _276 / _278;
        float _282 = _256 * 256.0;
        float _284 = trunc(_282);
        int _287 = int(_284);
        uint _290 = uint(int(uint(_287) >> uint(7)));
        int _292 = int(_290) + _287;
        float _294 = trunc(_274);
        int _296 = int(_294);
        float _298 = trunc(_280);
        int _300 = int(_298);
        int _302 = _296 + 2;
        int _304 = _302 >> 1;
        uint _306 = uint(int(uint(_300) >> uint(1)));
        int _308 = _304 ^ int(_306);
        int _310 = _308 << 16;
        int _312 = _310 ^ _304;
        int _314 = 983055 & _312;
        int _316 = _314 << 6;
        int _318 = _316 + _314;
        int _320 = _318 & 13369548;
        uint _322 = uint(int(uint(_320) >> uint(3)));
        int _324 = _320 | int(_322);
        int _326 = _324 & 5570560;
        int _328 = _324 & 85;
        uint _330 = uint(int(uint(_326) >> uint(15)));
        int _332 = int(_330) + _328;
        bool _334 = uint(_292) > uint(_332);
        if (!_334)
        {
            discard_fragment();
        }
        if (!_334)
        {
            out.m_49.x = _244;
            out.m_49.y = _246;
            out.m_49.z = _248;
            out.m_49.w = _179;
            return out;
        }
    }
    float _336 = in.m_53.y;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _344 = in.m_53.x;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = in.m_53.z;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_51.x;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = _86 * _340;
    bool _364 = as_type<int>(_342) != 0;
    float _366 = _86 * _348;
    bool _368 = !_364;
    float _370 = -_362;
    float _372 = _368 ? _370 : _362;
    float _374 = _86 * _354;
    bool _376 = !_364;
    float _378 = -_366;
    float _380 = _376 ? _378 : _366;
    float _382 = _372 * _372;
    bool _384 = !_364;
    float _386 = -_374;
    float _388 = _384 ? _386 : _374;
    float _390 = fma(_380, _380, _382);
    float _392 = fma(_388, _388, _390);
    float _394 = rsqrt(_392);
    float _396 = _380 * _394;
    float _398 = _372 * _394;
    float _400 = _388 * _394;
    float _402 = _86 * _360;
    float _404 = abs(_396);
    float _406 = abs(_398);
    float _408 = precise::max(_404, _406);
    float _410 = abs(_400);
    float _412 = precise::max(_410, _408);
    float _414 = 1.0 / _412;
    float _416 = _396 * _414;
    float _418 = -_414;
    float _420 = _400 * _418;
    float _422 = precise::min(_402, 1.0);
    float _424 = _398 * _414;
    float3 _1120 = float3(_416, _424, _420);
    float3 _428 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1120, float3(0.0), isnan(_1120)), level(_422)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1120, float3(0.0), isnan(_1120)), level(_422)).xyz;
    float _430 = _428.x;
    float _432 = _428.y;
    float _434 = _428.z;
    float _436 = in.m_59.y;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = in.m_59.z;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = in.m_59.x;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = in.m_61.z;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_61.x;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_61.y;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_63.x;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = in.m_63.w;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = in.m_63.y;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = in.m_63.z;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = _86 * _440;
    float _498 = _86 * _446;
    float _500 = _86 * _452;
    bool _502 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _504 = _86 * _482;
    float _506 = fma(_434, 0.20999999344348907470703125, _498);
    float _508 = fma(_430, 0.20999999344348907470703125, _500);
    float _510 = _86 * _458;
    float _512 = fma(_432, 0.20999999344348907470703125, _496);
    float _514 = _86 * _464;
    float _516 = _86 * _470;
    float _518 = _506 + _510;
    float _520 = _508 + _514;
    float _522 = _512 + _516;
    float _524 = _248 * _518;
    float _526 = 0.0 + _179;
    float _528 = precise::clamp(_526, 0.0, 1.0);
    float _530 = _244 * _520;
    float _532 = _86 * _476;
    float _534 = _246 * _522;
    float _536 = _86 * _488;
    float _538 = _86 * _494;
    float _540 = fma(_530, _504, _532);
    float _542 = _532;
    if (!_502)
    {
        _542 = _528;
    }
    float _544 = _542;
    float _546 = fma(_534, _504, _536);
    float _548 = fma(_524, _504, _538);
    bool _550 = !_502;
    float _552 = _544;
    if (!_550)
    {
        float _554 = in.m_65.w;
        float _556 = gl_FragCoord.w;
        float _558 = _554 * _556;
        float _560 = in.m_65.z;
        float _562 = gl_FragCoord.w;
        float _564 = _560 * _562;
        float _566 = _86 * _558;
        float _568 = _86 * _564;
        float _570 = 1.0 / _566;
        float _572 = _568 * _570;
        float _574 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _576 = fma(_572, (*spvDescriptorSet0.fp_c8)._m0[30].w, _574);
        float _578 = 1.0 / _576;
        float _580 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _582 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _584 = fma(_578, _580, _582);
        float _586 = _584 * 8.0;
        float _588 = precise::clamp(_586, 0.0, 1.0);
        float _590 = _528 * _588;
        _552 = _590;
    }
    float _592 = _552;
    float _594 = 0.0 + _592;
    float _596 = precise::clamp(_594, 0.0, 1.0);
    out.m_49.x = _540;
    out.m_49.y = _546;
    out.m_49.z = _548;
    out.m_49.w = _596;
    return out;
}

