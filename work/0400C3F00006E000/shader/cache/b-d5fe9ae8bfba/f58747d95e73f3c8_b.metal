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
    float4 m_40 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
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
    float2 _640 = float2(_88, _90);
    float4 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_640, float2(0.0), isnan(_640))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_640, float2(0.0), isnan(_640))).xyzw;
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
    float _115 = in.m_44.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_46.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _86 * _107;
    float _129 = _86 * _113;
    float _131 = _86 * _119;
    float _133 = _86 * _125;
    float _135 = in.m_40.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_40.z;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_44.y;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_44.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_42.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_42.y;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_42.z;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = _86 * _151;
    float _179 = -_127;
    float _181 = fma(_101, _129, _179);
    float _183 = _131 * _181;
    float _185 = 0.0 + _183;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = _187 * _133;
    bool _192 = _189 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _194 = isnan(_189);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _200 = _196 || _198;
    float _202 = in.m_40.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_44.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    if (!_200)
    {
        discard_fragment();
    }
    float _214 = _95 * _95;
    float _216 = _97 * _97;
    float _218 = _99 * _99;
    float _220 = _86 * _206;
    float _222 = _86 * _139;
    float _224 = _86 * _212;
    float _226 = _86 * _145;
    float _228 = _86 * _157;
    float _230 = -_177;
    float _232 = _222 + _230;
    float _234 = -_224;
    float _236 = _220 + _234;
    float _238 = -_228;
    float _240 = _226 + _238;
    float _242 = fma(_216, _232, _177);
    float _244 = fma(_214, _236, _224);
    float _246 = _86 * _163;
    float _248 = fma(_218, _240, _228);
    float _250 = _86 * _169;
    float _252 = _86 * _175;
    float _254 = _244 * _246;
    float _256 = _242 * _250;
    float _258 = _248 * _252;
    if (!_200)
    {
        out.m_49.x = _254;
        out.m_49.y = _256;
        out.m_49.z = _258;
        out.m_49.w = _183;
        return out;
    }
    float _260 = in.m_51.w;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = _86 * _264;
    bool _268 = _266 != 1.0;
    bool _270 = isnan(_266);
    bool _272 = _268 || _270;
    bool _274 = isnan(1.0);
    bool _276 = _272 || _274;
    bool _278 = !_276;
    if (!_278)
    {
        float _280 = gl_FragCoord.x;
        float _282 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _284 = _280 / _282;
        float _286 = gl_FragCoord.y;
        float _288 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _290 = _286 / _288;
        float _292 = _266 * 256.0;
        float _294 = trunc(_292);
        int _297 = int(_294);
        uint _300 = uint(int(uint(_297) >> uint(7)));
        int _302 = int(_300) + _297;
        float _304 = trunc(_284);
        int _306 = int(_304);
        float _308 = trunc(_290);
        int _310 = int(_308);
        int _312 = _306 + 2;
        int _314 = _312 >> 1;
        uint _316 = uint(int(uint(_310) >> uint(1)));
        int _318 = _314 ^ int(_316);
        int _320 = _318 << 16;
        int _322 = _320 ^ _314;
        int _324 = 983055 & _322;
        int _326 = _324 << 6;
        int _328 = _326 + _324;
        int _330 = _328 & 13369548;
        uint _332 = uint(int(uint(_330) >> uint(3)));
        int _334 = _330 | int(_332);
        int _336 = _334 & 5570560;
        int _338 = _334 & 85;
        uint _340 = uint(int(uint(_336) >> uint(15)));
        int _342 = int(_340) + _338;
        bool _344 = uint(_302) > uint(_342);
        if (!_344)
        {
            discard_fragment();
        }
        if (!_344)
        {
            out.m_49.x = _254;
            out.m_49.y = _256;
            out.m_49.z = _258;
            out.m_49.w = _189;
            return out;
        }
    }
    float _346 = in.m_53.y;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _354 = in.m_53.x;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_53.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_51.x;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = _86 * _350;
    bool _374 = as_type<int>(_352) != 0;
    float _376 = _86 * _358;
    bool _378 = !_374;
    float _380 = -_372;
    float _382 = _378 ? _380 : _372;
    float _384 = _86 * _364;
    bool _386 = !_374;
    float _388 = -_376;
    float _390 = _386 ? _388 : _376;
    float _392 = _382 * _382;
    bool _394 = !_374;
    float _396 = -_384;
    float _398 = _394 ? _396 : _384;
    float _400 = fma(_390, _390, _392);
    float _402 = fma(_398, _398, _400);
    float _404 = rsqrt(_402);
    float _406 = _390 * _404;
    float _408 = _382 * _404;
    float _410 = _398 * _404;
    float _412 = _86 * _370;
    float _414 = abs(_406);
    float _416 = abs(_408);
    float _418 = precise::max(_414, _416);
    float _420 = abs(_410);
    float _422 = precise::max(_420, _418);
    float _424 = 1.0 / _422;
    float _426 = _406 * _424;
    float _428 = -_424;
    float _430 = _410 * _428;
    float _432 = precise::min(_412, 1.0);
    float _434 = _408 * _424;
    float3 _1143 = float3(_426, _434, _430);
    float3 _438 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1143, float3(0.0), isnan(_1143)), level(_432)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1143, float3(0.0), isnan(_1143)), level(_432)).xyz;
    float _440 = _438.x;
    float _442 = _438.y;
    float _444 = _438.z;
    float _446 = in.m_59.y;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_59.z;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = in.m_59.x;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = in.m_61.z;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = in.m_61.x;
    float _472 = gl_FragCoord.w;
    float _474 = _470 * _472;
    float _476 = in.m_61.y;
    float _478 = gl_FragCoord.w;
    float _480 = _476 * _478;
    float _482 = in.m_63.x;
    float _484 = gl_FragCoord.w;
    float _486 = _482 * _484;
    float _488 = in.m_63.w;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    float _494 = in.m_63.y;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = in.m_63.z;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = _86 * _450;
    float _508 = _86 * _456;
    float _510 = _86 * _462;
    bool _512 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _514 = _86 * _492;
    float _516 = fma(_444, 0.20999999344348907470703125, _508);
    float _518 = fma(_440, 0.20999999344348907470703125, _510);
    float _520 = _86 * _468;
    float _522 = fma(_442, 0.20999999344348907470703125, _506);
    float _524 = _86 * _474;
    float _526 = _86 * _480;
    float _528 = _516 + _520;
    float _530 = _518 + _524;
    float _532 = _522 + _526;
    float _534 = _258 * _528;
    float _536 = 0.0 + _189;
    float _538 = precise::clamp(_536, 0.0, 1.0);
    float _540 = _254 * _530;
    float _542 = _86 * _486;
    float _544 = _256 * _532;
    float _546 = _86 * _498;
    float _548 = _86 * _504;
    float _550 = fma(_540, _514, _542);
    float _552 = _542;
    if (!_512)
    {
        _552 = _538;
    }
    float _554 = _552;
    float _556 = fma(_544, _514, _546);
    float _558 = fma(_534, _514, _548);
    bool _560 = !_512;
    float _562 = _554;
    if (!_560)
    {
        float _564 = in.m_65.w;
        float _566 = gl_FragCoord.w;
        float _568 = _564 * _566;
        float _570 = in.m_65.z;
        float _572 = gl_FragCoord.w;
        float _574 = _570 * _572;
        float _576 = _86 * _568;
        float _578 = _86 * _574;
        float _580 = 1.0 / _576;
        float _582 = _578 * _580;
        float _584 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _586 = fma(_582, (*spvDescriptorSet0.fp_c8)._m0[30].w, _584);
        float _588 = 1.0 / _586;
        float _590 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _592 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _594 = fma(_588, _590, _592);
        float _596 = _594 * 8.0;
        float _598 = precise::clamp(_596, 0.0, 1.0);
        float _600 = _538 * _598;
        _562 = _600;
    }
    float _602 = _562;
    float _604 = 0.0 + _602;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    out.m_49.x = _550;
    out.m_49.y = _556;
    out.m_49.z = _558;
    out.m_49.w = _606;
    return out;
}

