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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _556 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_556, float2(0.0), isnan(_556))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_33.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_33.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _61 * _73;
    float _119 = _61 * _79;
    float _121 = _61 * _85;
    float _123 = _61 * _91;
    float _125 = _61 * _97;
    float _127 = _61 * _103;
    float _129 = _61 * _109;
    float _131 = _61 * _115;
    float2 _648 = float2(_129, _131);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_648, float2(0.0), isnan(_648))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_648, float2(0.0), isnan(_648))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float2 _662 = float2(_129, _131);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_662, float2(0.0), isnan(_662)), int2(1, 0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_662, float2(0.0), isnan(_662)), int2(1, 0)).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float2 _678 = float2(_129, _131);
    float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_678, float2(0.0), isnan(_678)), int2(0, 1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_678, float2(0.0), isnan(_678)), int2(0, 1)).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float _159 = fma(_121, _67, _119);
    float _161 = fma(_125, _67, _117);
    float _163 = fma(_127, _67, _123);
    float _165 = 1.0 / _159;
    float _167 = _161 * _165;
    float _169 = _163 * _165;
    float2 _714 = float2(_129, _131);
    float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_714, float2(0.0), isnan(_714)), int2(1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_714, float2(0.0), isnan(_714)), int2(1)).xyz;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float2 _729 = float2(_63, _65);
    float4 _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_729, float2(0.0), isnan(_729))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_729, float2(0.0), isnan(_729))).xyzw;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = _180.w;
    float2 _745 = float2(_167, _169);
    float4 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_745, float2(0.0), isnan(_745))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_745, float2(0.0), isnan(_745))).xyzw;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = _190.w;
    float _200 = _139 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _202 = _147 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _204 = _155 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _206 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].x, _200);
    float _208 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[2].x, _202);
    float _210 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[2].x, _204);
    float _212 = -_65;
    float _214 = _212 + _169;
    float _216 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[2].z, _206);
    float _218 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[2].z, _208);
    float _220 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[2].z, _210);
    float _222 = -_63;
    float _224 = _222 + _167;
    float _226 = _214 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _228 = precise::min(_216, _220);
    float _230 = _224 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _232 = precise::max(_216, _220);
    float _234 = _226 * _226;
    float _236 = fma(_230, _230, _234);
    float _238 = sqrt(_236);
    float _240 = _175 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _242 = _184 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _244 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[2].x, _240);
    float _246 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[2].x, _242);
    float _248 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[2].z, _244);
    float _250 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[2].z, _246);
    float _252 = precise::min(_218, _248);
    float _254 = precise::max(_218, _248);
    float _256 = precise::min(_228, _252);
    float _258 = precise::max(_232, _254);
    float _260 = precise::min(_250, _256);
    float _262 = precise::max(_250, _258);
    float _264 = _258 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _266 = -_260;
    float _268 = _266 + _262;
    float _270 = precise::max(_264, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _274 = _268 > _270;
    float _276 = 0.0 + _238;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = fma(_278, -0.5, 0.5);
    float _282 = 0.5;
    float _284 = _252;
    float _286 = _264;
    float _288 = _182;
    if (!_274)
    {
        _282 = _184;
    }
    float _290 = _282;
    float _292 = _290;
    if (!_274)
    {
        _284 = _186;
    }
    float _294 = _284;
    float _296 = _294;
    if (!_274)
    {
        _286 = _188;
    }
    float _298 = _286;
    bool _300 = !_274;
    float _302 = _298;
    if (!_300)
    {
        float _304 = _216 + _218;
        float _306 = -_218;
        float _308 = _306 + _220;
        float _310 = -_216;
        float _312 = _310 + _248;
        float _314 = _220 + _304;
        float _316 = _308 + _312;
        float _318 = -_312;
        float _320 = _308 + _318;
        float _322 = _248 + _314;
        float _324 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _326 = abs(_316);
        float _328 = abs(_320);
        float _330 = precise::min(_326, _328);
        float _332 = fma(_322, _324, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _334 = precise::max(_332, _330);
        float _336 = 1.0 / _334;
        float _338 = _316 * _336;
        float _340 = _320 * _336;
        float _342 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _344 = precise::max(_338, _342);
        float _346 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _348 = precise::max(_340, _346);
        float _350 = precise::min(_344, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _352 = precise::min(_348, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _354 = -_350;
        float _356 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _358 = -_350;
        float _360 = fma(_358, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _362 = -_352;
        float _364 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _366 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _368 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _370 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _372 = -_352;
        float _374 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float _376 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float2 _1060 = float2(_356, _364);
        float4 _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1060, float2(0.0), isnan(_1060))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1060, float2(0.0), isnan(_1060))).xyzw;
        float _380 = _378.x;
        float _382 = _378.y;
        float _384 = _378.z;
        float _386 = _378.w;
        float2 _1076 = float2(_366, _370);
        float4 _388 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1076, float2(0.0), isnan(_1076))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1076, float2(0.0), isnan(_1076))).xyzw;
        float _390 = _388.x;
        float _392 = _388.y;
        float _394 = _388.z;
        float _396 = _388.w;
        float2 _1092 = float2(_360, _374);
        float4 _398 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1092, float2(0.0), isnan(_1092))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1092, float2(0.0), isnan(_1092))).xyzw;
        float _400 = _398.x;
        float _402 = _398.y;
        float _404 = _398.z;
        float _406 = _398.w;
        float2 _1108 = float2(_368, _376);
        float4 _408 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1108, float2(0.0), isnan(_1108))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1108, float2(0.0), isnan(_1108))).xyzw;
        float _410 = _408.x;
        float _412 = _408.y;
        float _414 = _408.z;
        float _416 = _408.w;
        float _418 = _382 + _392;
        float _420 = _380 + _390;
        float _422 = _402 + _412;
        float _424 = _400 + _410;
        float _426 = _384 + _394;
        float _428 = _404 + _414;
        float _430 = _418 + _422;
        float _432 = _420 + _424;
        float _434 = _386 + _396;
        float _436 = _426 + _428;
        float _438 = _430 * 0.25;
        float _440 = _432 * 0.25;
        float _442 = _436 * 0.25;
        float _444 = _438 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _446 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[2].x, _444);
        float _448 = fma(_442, (*spvDescriptorSet0.fp_c3)._m0[2].z, _446);
        float _450 = _406 + _416;
        bool _452 = _448 > _258;
        bool _454 = isnan(_448);
        bool _456 = _452 || _454;
        bool _458 = isnan(_258);
        bool _460 = _456 || _458;
        float _462 = _434 + _450;
        float _464 = _434 * 0.5;
        bool _466 = _256 <= _448;
        bool _468 = !_460;
        bool _470 = _466 && _468;
        float _472 = _440;
        float _474 = _438;
        float _476 = _442;
        _302 = _464;
        if (!_470)
        {
            float _478 = _420 * 0.5;
            _472 = _478;
        }
        float _480 = _472;
        _288 = _480;
        if (!_470)
        {
            float _482 = _418 * 0.5;
            _474 = _482;
        }
        float _484 = _474;
        _292 = _484;
        if (!_470)
        {
            float _486 = _426 * 0.5;
            _476 = _486;
        }
        float _488 = _476;
        _296 = _488;
        if (_470)
        {
            float _490 = _462 * 0.25;
            _302 = _490;
        }
    }
    float _492 = _288;
    float _494 = _292;
    float _496 = _296;
    float _498 = _302;
    float _500 = -_492;
    float _502 = _192 + _500;
    float _504 = -_494;
    float _506 = _194 + _504;
    float _508 = -_496;
    float _510 = _196 + _508;
    float _512 = -_498;
    float _514 = _198 + _512;
    float _516 = fma(_280, _502, _492);
    float _518 = fma(_280, _506, _494);
    float _520 = fma(_280, _510, _496);
    float _522 = fma(_280, _514, _498);
    out.m_40.x = _516;
    out.m_40.y = _518;
    out.m_40.z = _520;
    out.m_40.w = _522;
    return out;
}

