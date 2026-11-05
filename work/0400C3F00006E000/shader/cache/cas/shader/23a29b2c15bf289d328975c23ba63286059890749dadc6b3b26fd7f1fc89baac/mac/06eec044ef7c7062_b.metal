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
    float2 _624 = float2(_88, _90);
    float4 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_624, float2(0.0), isnan(_624))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_624, float2(0.0), isnan(_624))).xyzw;
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
    float _204 = _86 * _196;
    float _206 = _86 * _137;
    float _208 = _86 * _202;
    float _210 = _86 * _131;
    float _212 = _86 * _149;
    float _214 = -_169;
    float _216 = _206 + _214;
    float _218 = -_208;
    float _220 = _204 + _218;
    float _222 = -_212;
    float _224 = _210 + _222;
    float _226 = fma(_97, _216, _169);
    float _228 = fma(_95, _220, _208);
    float _230 = _86 * _155;
    float _232 = fma(_99, _224, _212);
    float _234 = _86 * _161;
    float _236 = _86 * _167;
    float _238 = _228 * _230;
    float _240 = _226 * _234;
    float _242 = _232 * _236;
    if (!_190)
    {
        out.m_49.x = _238;
        out.m_49.y = _240;
        out.m_49.z = _242;
        out.m_49.w = _173;
        return out;
    }
    float _244 = in.m_51.w;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = _86 * _248;
    bool _252 = _250 != 1.0;
    bool _254 = isnan(_250);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.0);
    bool _260 = _256 || _258;
    bool _262 = !_260;
    if (!_262)
    {
        float _264 = gl_FragCoord.x;
        float _266 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _268 = _264 / _266;
        float _270 = gl_FragCoord.y;
        float _272 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _274 = _270 / _272;
        float _276 = _250 * 256.0;
        float _278 = trunc(_276);
        int _281 = int(_278);
        uint _284 = uint(int(uint(_281) >> uint(7)));
        int _286 = int(_284) + _281;
        float _288 = trunc(_268);
        int _290 = int(_288);
        float _292 = trunc(_274);
        int _294 = int(_292);
        int _296 = _290 + 2;
        int _298 = _296 >> 1;
        uint _300 = uint(int(uint(_294) >> uint(1)));
        int _302 = _298 ^ int(_300);
        int _304 = _302 << 16;
        int _306 = _304 ^ _298;
        int _308 = 983055 & _306;
        int _310 = _308 << 6;
        int _312 = _310 + _308;
        int _314 = _312 & 13369548;
        uint _316 = uint(int(uint(_314) >> uint(3)));
        int _318 = _314 | int(_316);
        int _320 = _318 & 5570560;
        int _322 = _318 & 85;
        uint _324 = uint(int(uint(_320) >> uint(15)));
        int _326 = int(_324) + _322;
        bool _328 = uint(_286) > uint(_326);
        if (!_328)
        {
            discard_fragment();
        }
        if (!_328)
        {
            out.m_49.x = _238;
            out.m_49.y = _240;
            out.m_49.z = _242;
            out.m_49.w = _179;
            return out;
        }
    }
    float _330 = in.m_53.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _338 = in.m_53.x;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = in.m_53.z;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = in.m_51.x;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = _86 * _334;
    bool _358 = as_type<int>(_336) != 0;
    float _360 = _86 * _342;
    bool _362 = !_358;
    float _364 = -_356;
    float _366 = _362 ? _364 : _356;
    float _368 = _86 * _348;
    bool _370 = !_358;
    float _372 = -_360;
    float _374 = _370 ? _372 : _360;
    float _376 = _366 * _366;
    bool _378 = !_358;
    float _380 = -_368;
    float _382 = _378 ? _380 : _368;
    float _384 = fma(_374, _374, _376);
    float _386 = fma(_382, _382, _384);
    float _388 = rsqrt(_386);
    float _390 = _374 * _388;
    float _392 = _366 * _388;
    float _394 = _382 * _388;
    float _396 = _86 * _354;
    float _398 = abs(_390);
    float _400 = abs(_392);
    float _402 = precise::max(_398, _400);
    float _404 = abs(_394);
    float _406 = precise::max(_404, _402);
    float _408 = 1.0 / _406;
    float _410 = _390 * _408;
    float _412 = -_408;
    float _414 = _394 * _412;
    float _416 = precise::min(_396, 1.0);
    float _418 = _392 * _408;
    float3 _1105 = float3(_410, _418, _414);
    float3 _422 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1105, float3(0.0), isnan(_1105)), level(_416)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1105, float3(0.0), isnan(_1105)), level(_416)).xyz;
    float _424 = _422.x;
    float _426 = _422.y;
    float _428 = _422.z;
    float _430 = in.m_59.y;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_59.z;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = in.m_59.x;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = in.m_61.z;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = in.m_61.x;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_61.y;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_63.x;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_63.w;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = in.m_63.y;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = in.m_63.z;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = _86 * _434;
    float _492 = _86 * _440;
    float _494 = _86 * _446;
    bool _496 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _498 = _86 * _476;
    float _500 = fma(_428, 0.20999999344348907470703125, _492);
    float _502 = fma(_424, 0.20999999344348907470703125, _494);
    float _504 = _86 * _452;
    float _506 = fma(_426, 0.20999999344348907470703125, _490);
    float _508 = _86 * _458;
    float _510 = _86 * _464;
    float _512 = _500 + _504;
    float _514 = _502 + _508;
    float _516 = _506 + _510;
    float _518 = _242 * _512;
    float _520 = 0.0 + _179;
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = _238 * _514;
    float _526 = _86 * _470;
    float _528 = _240 * _516;
    float _530 = _86 * _482;
    float _532 = _86 * _488;
    float _534 = fma(_524, _498, _526);
    float _536 = _526;
    if (!_496)
    {
        _536 = _522;
    }
    float _538 = _536;
    float _540 = fma(_528, _498, _530);
    float _542 = fma(_518, _498, _532);
    bool _544 = !_496;
    float _546 = _538;
    if (!_544)
    {
        float _548 = in.m_65.w;
        float _550 = gl_FragCoord.w;
        float _552 = _548 * _550;
        float _554 = in.m_65.z;
        float _556 = gl_FragCoord.w;
        float _558 = _554 * _556;
        float _560 = _86 * _552;
        float _562 = _86 * _558;
        float _564 = 1.0 / _560;
        float _566 = _562 * _564;
        float _568 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _570 = fma(_566, (*spvDescriptorSet0.fp_c8)._m0[30].w, _568);
        float _572 = 1.0 / _570;
        float _574 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _576 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _578 = fma(_572, _574, _576);
        float _580 = _578 * 8.0;
        float _582 = precise::clamp(_580, 0.0, 1.0);
        float _584 = _522 * _582;
        _546 = _584;
    }
    float _586 = _546;
    float _588 = 0.0 + _586;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    out.m_49.x = _534;
    out.m_49.y = _540;
    out.m_49.z = _542;
    out.m_49.w = _590;
    return out;
}

