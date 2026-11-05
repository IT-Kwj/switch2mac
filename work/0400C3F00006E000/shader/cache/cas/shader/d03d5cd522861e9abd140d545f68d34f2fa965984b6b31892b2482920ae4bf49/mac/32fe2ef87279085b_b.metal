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
    texture2d<float> fp_t_tcb_E [[id(1)]];
    sampler fp_t_tcb_ESmplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _43 = in.m_33.x;
    float _45 = in.m_33.y;
    float _47 = _43 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float2 _481 = float2(_43, _45);
    float2 _51 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_481, float2(0.0), isnan(_481))).xy;
    float _53 = _51.x;
    float _55 = _51.y;
    float2 _496 = float2(_43, _45);
    float2 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_496, float2(0.0), isnan(_496))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_496, float2(0.0), isnan(_496))).xy;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _65 = _43 + _63;
    float2 _514 = float2(_47, _45);
    float2 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_514, float2(0.0), isnan(_514))).xy;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _45 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _75 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _77 = _45 + _75;
    float2 _537 = float2(_65, _45);
    float2 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_537, float2(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_537, float2(0.0), isnan(_537))).xy;
    float _81 = _79.x;
    float _83 = _79.y;
    float2 _549 = float2(_43, _73);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_549, float2(0.0), isnan(_549))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_549, float2(0.0), isnan(_549))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float2 _561 = float2(_43, _77);
    float2 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_561, float2(0.0), isnan(_561))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_561, float2(0.0), isnan(_561))).xy;
    float _93 = _91.x;
    float _95 = _91.y;
    float2 _573 = float2(_47, _73);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_573, float2(0.0), isnan(_573))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_573, float2(0.0), isnan(_573))).xy;
    float _99 = _97.x;
    float _101 = _97.y;
    float2 _585 = float2(_65, _73);
    float2 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_585, float2(0.0), isnan(_585))).xy;
    float _105 = _103.x;
    float _107 = _103.y;
    float2 _597 = float2(_47, _77);
    float2 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_597, float2(0.0), isnan(_597))).xy;
    float _111 = _109.x;
    float _113 = _109.y;
    float2 _609 = float2(_65, _77);
    float2 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_609, float2(0.0), isnan(_609))).xy;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _53 + (-0.5);
    float _123 = _61 + (-0.5);
    float _125 = _55 + (-0.5);
    float _127 = _59 + (-0.5);
    float _129 = _71 + (-0.5);
    float _131 = _123 * _123;
    float _133 = _69 + (-0.5);
    float _135 = _125 * _123;
    float _137 = _129 * _129;
    float _139 = fma(_127, _127, _131);
    float _141 = fma(_121, _127, _135);
    float _143 = fma(_133, _133, _137);
    float _145 = _139 + 1.0;
    float _147 = _125 * _129;
    float _149 = _141 + 1.0;
    float _151 = _143 + 1.0;
    float _153 = fma(_121, _133, _147);
    float _155 = rsqrt(_145);
    float _157 = _153 + 1.0;
    float _159 = rsqrt(_151);
    float _161 = _155 * _149;
    float _163 = _83 + (-0.5);
    float _165 = _81 + (-0.5);
    float _167 = _163 * _163;
    float _169 = _125 * _163;
    float _171 = _101 + (-0.5);
    float _173 = _159 * _157;
    float _175 = _89 + (-0.5);
    float _177 = fma(_165, _165, _167);
    float _179 = fma(_121, _165, _169);
    float _181 = _87 + (-0.5);
    float _183 = _175 * _175;
    float _185 = _125 * _175;
    float _187 = _95 + (-0.5);
    float _189 = _93 + (-0.5);
    float _191 = _177 + 1.0;
    float _193 = fma(_181, _181, _183);
    float _195 = _187 * _187;
    float _197 = fma(_121, _181, _185);
    float _199 = rsqrt(_191);
    float _201 = _125 * _187;
    float _203 = fma(_189, _189, _195);
    float _205 = _193 + 1.0;
    float _207 = _197 + 1.0;
    float _209 = fma(_121, _189, _201);
    float _211 = _203 + 1.0;
    float _213 = _171 * _171;
    float _215 = _179 + 1.0;
    float _217 = _99 + (-0.5);
    float _219 = rsqrt(_205);
    float _221 = _209 + 1.0;
    float _223 = _125 * _171;
    float _225 = fma(_217, _217, _213);
    bool _229 = _173 > _161;
    float _231 = fma(_121, _217, _223);
    float _233 = _225 + 1.0;
    float _235 = rsqrt(_211);
    float _237 = _107 + (-0.5);
    float _239 = _105 + (-0.5);
    float _241 = _119 + (-0.5);
    float _243 = _199 * _215;
    float _245 = _237 * _237;
    float _247 = -_161;
    float _249 = -_173;
    float _251 = precise::min(_247, _249);
    float _253 = _125 * _237;
    float _255 = rsqrt(_233);
    float _257 = _219 * _207;
    float _259 = fma(_239, _239, _245);
    float _261 = -_243;
    bool _263 = _251 > _261;
    float _265 = fma(_121, _239, _253);
    float _267 = -_243;
    float _269 = precise::min(_251, _267);
    float _271 = _259 + 1.0;
    float _273 = _125 * _241;
    float _275 = _235 * _221;
    float _277 = _113 + (-0.5);
    float _279 = _111 + (-0.5);
    float _281 = _231 + 1.0;
    float _283 = rsqrt(_271);
    float _285 = _277 * _277;
    float _287 = -_257;
    bool _289 = _269 > _287;
    float _291 = _125 * _277;
    float _293 = _255 * _281;
    float _295 = fma(_279, _279, _285);
    float _297 = _117 + (-0.5);
    float _299 = _241 * _241;
    float _301 = -_257;
    float _303 = precise::min(_269, _301);
    float _305 = _295 + 1.0;
    float _307 = _265 + 1.0;
    float _309 = fma(_297, _297, _299);
    float _311 = -_275;
    bool _313 = _303 > _311;
    float _315 = fma(_121, _279, _291);
    float _317 = -_275;
    float _319 = precise::min(_303, _317);
    float _321 = _309 + 1.0;
    float _323 = rsqrt(_305);
    bool _325 = !_229;
    int _328 = _325 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _330 = _283 * _307;
    float _332 = -_293;
    bool _334 = _319 > _332;
    float _336 = _315 + 1.0;
    bool _338 = !_263;
    float _340 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _342 = _338 ? _328 : as_type<int>(_340);
    float _344 = fma(_121, _297, _273);
    float _346 = -_293;
    float _348 = precise::min(_319, _346);
    float _350 = rsqrt(_321);
    bool _352 = !_289;
    int _354 = _352 ? _342 : 0;
    float _356 = _344 + 1.0;
    bool _358 = !_289;
    int _360 = _358 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    bool _362 = !_313;
    int _364 = _362 ? _354 : int(0x80000000);
    float _366 = -_330;
    bool _368 = _348 > _366;
    bool _370 = _368 || _334;
    float _372 = _323 * _336;
    float _374 = -_330;
    bool _376 = _348 > _374;
    float _378 = -_330;
    float _380 = precise::min(_348, _378);
    bool _382 = !_334;
    int _384 = _382 ? _364 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _386 = !_313;
    float _388 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    int _390 = _386 ? _360 : as_type<int>(_388);
    float _392 = _350 * _356;
    float _394 = -_372;
    bool _396 = _380 > _394;
    float _398 = -_372;
    float _400 = precise::min(_380, _398);
    bool _402 = !_376;
    float _404 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _406 = _402 ? _384 : as_type<int>(_404);
    bool _408 = !_370;
    int _410 = _408 ? _390 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _412 = -_392;
    bool _414 = _400 > _412;
    bool _416 = !_396;
    int _418 = _416 ? _406 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _420 = !_396;
    float _422 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    int _424 = _420 ? _410 : as_type<int>(_422);
    bool _426 = !_414;
    float _428 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _430 = _426 ? as_type<float>(_418) : _428;
    bool _432 = !_414;
    float _434 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _436 = _432 ? as_type<float>(_424) : _434;
    float _438 = _43 + _430;
    float _440 = _45 + _436;
    float2 _1069 = float2(_43, _45);
    float3 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1069, float2(0.0), isnan(_1069))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1069, float2(0.0), isnan(_1069))).xyz;
    float _446 = _444.x;
    float _448 = _444.y;
    float _450 = _444.z;
    float2 _1083 = float2(_438, _440);
    float3 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1083, float2(0.0), isnan(_1083))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1083, float2(0.0), isnan(_1083))).xyz;
    float _454 = _452.x;
    float _456 = _452.y;
    float _458 = _452.z;
    float _460 = _454 * _446;
    float _462 = _456 * _448;
    float _464 = _458 * _450;
    out.m_36.x = _460;
    out.m_36.y = _462;
    out.m_36.z = _464;
    return out;
}

