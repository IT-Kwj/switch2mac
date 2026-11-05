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
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.w;
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
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_662, float2(0.0), isnan(_662)), int2(0, 1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_662, float2(0.0), isnan(_662)), int2(0, 1)).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = -_67;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _155 = _151 + _153;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _159 = _127 * _157;
    float _161 = _125 * _157;
    float _163 = _123 * _157;
    float _165 = fma(_121, _155, _159);
    float _167 = fma(_119, _155, _161);
    float _169 = fma(_117, _155, _163);
    float _171 = 1.0 / _165;
    float _173 = _167 * _171;
    float _175 = _169 * _171;
    float2 _724 = float2(_129, _131);
    float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_724, float2(0.0), isnan(_724)), int2(1, 0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_724, float2(0.0), isnan(_724)), int2(1, 0)).xyz;
    float _179 = _177.x;
    float _181 = _177.y;
    float _183 = _177.z;
    float2 _739 = float2(_129, _131);
    float3 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_739, float2(0.0), isnan(_739)), int2(1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_739, float2(0.0), isnan(_739)), int2(1)).xyz;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    float2 _754 = float2(_63, _65);
    float4 _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_754, float2(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_754, float2(0.0), isnan(_754))).xyzw;
    float _196 = _194.x;
    float _198 = _194.y;
    float _200 = _194.z;
    float _202 = _194.w;
    float2 _770 = float2(_175, _173);
    float4 _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_770, float2(0.0), isnan(_770))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_770, float2(0.0), isnan(_770))).xyzw;
    float _206 = _204.x;
    float _208 = _204.y;
    float _210 = _204.z;
    float _212 = _204.w;
    float _214 = _147 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _216 = _139 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _218 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[2].x, _214);
    float _220 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].x, _216);
    float _222 = -_65;
    float _224 = _222 + _173;
    float _226 = -_63;
    float _228 = _226 + _175;
    float _230 = _224 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _232 = _228 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _234 = _230 * _230;
    float _236 = _181 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _238 = _189 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _240 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[2].z, _220);
    float _242 = _198 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _244 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[2].x, _236);
    float _246 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[2].x, _238);
    float _248 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[2].z, _218);
    float _250 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[2].x, _242);
    float _252 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[2].z, _244);
    float _254 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[2].z, _246);
    float _256 = precise::min(_240, _248);
    float _258 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[2].z, _250);
    float _260 = precise::max(_240, _248);
    float _262 = precise::min(_252, _254);
    float _264 = precise::max(_252, _254);
    float _266 = precise::min(_256, _262);
    float _268 = precise::max(_260, _264);
    float _270 = precise::min(_258, _266);
    float _272 = precise::max(_258, _268);
    float _274 = _268 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _276 = -_270;
    float _278 = _276 + _272;
    float _280 = precise::max(_274, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _284 = _278 > _280;
    float _286 = fma(_232, _232, _234);
    float _288 = _232;
    float _290 = _278;
    float _292 = _262;
    float _294 = _274;
    if (!_284)
    {
        _288 = _196;
    }
    float _296 = _288;
    float _298 = _296;
    if (!_284)
    {
        _290 = _198;
    }
    float _300 = _290;
    float _302 = _300;
    if (!_284)
    {
        _292 = _200;
    }
    float _304 = _292;
    float _306 = _304;
    if (!_284)
    {
        _294 = _202;
    }
    float _308 = _294;
    bool _310 = !_284;
    float _312 = _308;
    if (!_310)
    {
        float _314 = _240 + _252;
        float _316 = -_252;
        float _318 = _316 + _248;
        float _320 = -_240;
        float _322 = _320 + _254;
        float _324 = _248 + _314;
        float _326 = _318 + _322;
        float _328 = -_322;
        float _330 = _318 + _328;
        float _332 = _254 + _324;
        float _334 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _336 = abs(_326);
        float _338 = abs(_330);
        float _340 = precise::min(_336, _338);
        float _342 = fma(_332, _334, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _344 = precise::max(_342, _340);
        float _346 = 1.0 / _344;
        float _348 = _326 * _346;
        float _350 = _330 * _346;
        float _352 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _354 = precise::max(_348, _352);
        float _356 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _358 = precise::max(_350, _356);
        float _360 = precise::min(_354, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _362 = precise::min(_358, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _364 = -_360;
        float _366 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _368 = -_360;
        float _370 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _372 = fma(_360, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _374 = fma(_360, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _376 = -_362;
        float _378 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float _380 = -_362;
        float _382 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _384 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _386 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float2 _1082 = float2(_366, _378);
        float4 _388 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1082, float2(0.0), isnan(_1082))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1082, float2(0.0), isnan(_1082))).xyzw;
        float _390 = _388.x;
        float _392 = _388.y;
        float _394 = _388.z;
        float _396 = _388.w;
        float2 _1098 = float2(_370, _382);
        float4 _398 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1098, float2(0.0), isnan(_1098))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1098, float2(0.0), isnan(_1098))).xyzw;
        float _400 = _398.x;
        float _402 = _398.y;
        float _404 = _398.z;
        float _406 = _398.w;
        float2 _1114 = float2(_372, _384);
        float4 _408 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1114, float2(0.0), isnan(_1114))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1114, float2(0.0), isnan(_1114))).xyzw;
        float _410 = _408.x;
        float _412 = _408.y;
        float _414 = _408.z;
        float _416 = _408.w;
        float2 _1130 = float2(_374, _386);
        float4 _418 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1130, float2(0.0), isnan(_1130))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1130, float2(0.0), isnan(_1130))).xyzw;
        float _420 = _418.x;
        float _422 = _418.y;
        float _424 = _418.z;
        float _426 = _418.w;
        float _428 = _392 + _402;
        float _430 = _394 + _404;
        float _432 = _390 + _400;
        float _434 = _396 + _406;
        float _436 = _412 + _428;
        float _438 = _414 + _430;
        float _440 = _410 + _432;
        float _442 = _416 + _434;
        float _444 = _422 + _436;
        float _446 = _424 + _438;
        float _448 = _420 + _440;
        float _450 = _426 + _442;
        float _452 = _444 * 0.25;
        float _454 = _446 * 0.25;
        float _456 = _448 * 0.25;
        float _458 = _450 * 0.25;
        float _460 = -_452;
        float _462 = _198 + _460;
        float _464 = -_454;
        float _466 = _200 + _464;
        float _468 = -_456;
        float _470 = _196 + _468;
        float _472 = -_458;
        float _474 = _202 + _472;
        float _476 = fma(_462, (*spvDescriptorSet0.fp_c3)._m0[5].x, _452);
        float _478 = fma(_466, (*spvDescriptorSet0.fp_c3)._m0[5].x, _454);
        float _480 = fma(_470, (*spvDescriptorSet0.fp_c3)._m0[5].x, _456);
        float _482 = fma(_474, (*spvDescriptorSet0.fp_c3)._m0[5].x, _458);
        _298 = _480;
        _306 = _478;
        _312 = _482;
        _302 = _476;
    }
    float _484 = _298;
    float _486 = _306;
    float _488 = _312;
    float _490 = _302;
    float _492 = sqrt(_286);
    float _494 = -_484;
    float _496 = _206 + _494;
    float _498 = -_486;
    float _500 = _210 + _498;
    float _502 = -_488;
    float _504 = _212 + _502;
    float _506 = 0.0 + _492;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = fma(_508, -0.5, 0.5);
    float _512 = -_490;
    float _514 = _208 + _512;
    float _516 = fma(_510, _496, _484);
    float _518 = fma(_510, _514, _490);
    float _520 = fma(_510, _500, _486);
    float _522 = fma(_510, _504, _488);
    out.m_40.x = _516;
    out.m_40.y = _518;
    out.m_40.z = _520;
    out.m_40.w = _522;
    return out;
}

