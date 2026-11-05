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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _41 = in.m_31.x;
    float _43 = in.m_31.y;
    float _45 = _41 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float2 _504 = float2(_41, _43);
    float3 _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_504, float2(0.0), isnan(_504))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_504, float2(0.0), isnan(_504))).xyz;
    float _51 = _49.x;
    float _53 = _49.y;
    float _55 = _49.z;
    float2 _521 = float2(_41, _43);
    float3 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_521, float2(0.0), isnan(_521))).xyz;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _67 = _41 + _65;
    float2 _541 = float2(_45, _43);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_541, float2(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_541, float2(0.0), isnan(_541))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _43 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _79 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _81 = _43 + _79;
    float2 _566 = float2(_67, _43);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_566, float2(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_566, float2(0.0), isnan(_566))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _580 = float2(_41, _77);
    float3 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_580, float2(0.0), isnan(_580))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_580, float2(0.0), isnan(_580))).xyz;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float2 _594 = float2(_41, _81);
    float3 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_594, float2(0.0), isnan(_594))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_594, float2(0.0), isnan(_594))).xyz;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = _99.z;
    float2 _608 = float2(_45, _77);
    float3 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_608, float2(0.0), isnan(_608))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_608, float2(0.0), isnan(_608))).xyz;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    float2 _622 = float2(_67, _77);
    float3 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_622, float2(0.0), isnan(_622))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_622, float2(0.0), isnan(_622))).xyz;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float2 _636 = float2(_45, _81);
    float3 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_636, float2(0.0), isnan(_636))).xyz;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float2 _650 = float2(_67, _81);
    float3 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_650, float2(0.0), isnan(_650))).xyz;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = _131.z;
    float _139 = _61 + (-0.5);
    float _141 = _59 + (-0.5);
    float _143 = _63 + (-0.5);
    float _145 = _53 + (-0.5);
    float _147 = _139 * _139;
    float _149 = _51 + (-0.5);
    float _151 = fma(_141, _141, _147);
    float _153 = fma(_143, _143, _151);
    float _155 = _145 * _139;
    float _157 = _55 + (-0.5);
    float _159 = _75 + (-0.5);
    float _161 = _97 + (-0.5);
    float _163 = fma(_149, _141, _155);
    float _165 = rsqrt(_153);
    float _167 = _113 + (-0.5);
    float _169 = _129 + (-0.5);
    float _171 = fma(_157, _143, _163);
    float _173 = _165 * _171;
    float _175 = _73 + (-0.5);
    float _177 = _71 + (-0.5);
    float _179 = _175 * _175;
    float _181 = _145 * _175;
    float _183 = _87 + (-0.5);
    float _185 = _85 + (-0.5);
    float _187 = fma(_177, _177, _179);
    float _189 = fma(_149, _177, _181);
    float _191 = _183 * _183;
    float _193 = _89 + (-0.5);
    float _195 = fma(_159, _159, _187);
    float _197 = fma(_157, _159, _189);
    float _199 = fma(_185, _185, _191);
    float _201 = _145 * _183;
    float _203 = _95 + (-0.5);
    float _205 = _93 + (-0.5);
    float _207 = fma(_193, _193, _199);
    float _209 = fma(_149, _185, _201);
    float _211 = rsqrt(_195);
    float _213 = _203 * _203;
    float _215 = fma(_157, _193, _209);
    float _217 = _145 * _203;
    float _219 = fma(_205, _205, _213);
    float _221 = rsqrt(_207);
    float _223 = fma(_149, _205, _217);
    float _225 = _105 + (-0.5);
    float _227 = fma(_161, _161, _219);
    float _229 = fma(_157, _161, _223);
    float _231 = rsqrt(_227);
    float _233 = _103 + (-0.5);
    float _235 = _101 + (-0.5);
    float _237 = _211 * _197;
    float _239 = _233 * _233;
    float _241 = _221 * _215;
    float _243 = fma(_235, _235, _239);
    float _245 = _145 * _233;
    bool _249 = _237 > _173;
    float _251 = fma(_225, _225, _243);
    float _253 = -_173;
    float _255 = -_237;
    float _257 = precise::min(_253, _255);
    float _259 = fma(_149, _235, _245);
    float _261 = _231 * _229;
    float _263 = _109 + (-0.5);
    float _265 = -_241;
    bool _267 = _257 > _265;
    float _269 = rsqrt(_251);
    float _271 = fma(_157, _225, _259);
    float _273 = -_241;
    float _275 = precise::min(_257, _273);
    float _277 = _111 + (-0.5);
    float _279 = _117 + (-0.5);
    float _281 = _127 + (-0.5);
    float _283 = -_261;
    bool _285 = _275 > _283;
    float _287 = _145 * _277;
    float _289 = -_261;
    float _291 = precise::min(_275, _289);
    float _293 = _125 + (-0.5);
    float _295 = _281 * _281;
    float _297 = fma(_149, _263, _287);
    float _299 = _135 + (-0.5);
    float _301 = _137 + (-0.5);
    float _303 = fma(_293, _293, _295);
    float _305 = fma(_157, _167, _297);
    float _307 = _269 * _271;
    float _309 = _277 * _277;
    float _311 = fma(_169, _169, _303);
    float _313 = _145 * _281;
    float _315 = fma(_263, _263, _309);
    float _317 = _119 + (-0.5);
    float _319 = _121 + (-0.5);
    float _321 = -_307;
    bool _323 = _291 > _321;
    float _325 = fma(_167, _167, _315);
    float _327 = _317 * _317;
    float _329 = -_307;
    float _331 = precise::min(_291, _329);
    float _333 = _133 + (-0.5);
    float _335 = _299 * _299;
    float _337 = fma(_279, _279, _327);
    float _339 = rsqrt(_325);
    float _341 = _145 * _317;
    float _343 = fma(_333, _333, _335);
    float _345 = fma(_319, _319, _337);
    float _347 = fma(_149, _293, _313);
    float _349 = fma(_149, _279, _341);
    float _351 = fma(_301, _301, _343);
    float _353 = _145 * _299;
    float _355 = rsqrt(_345);
    float _357 = fma(_157, _319, _349);
    float _359 = fma(_157, _169, _347);
    float _361 = fma(_149, _333, _353);
    bool _363 = !_285;
    int _366 = _363 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _368 = fma(_157, _301, _361);
    float _370 = _339 * _305;
    float _372 = rsqrt(_311);
    bool _374 = !_323;
    float _376 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    int _378 = _374 ? _366 : as_type<int>(_376);
    float _380 = -_370;
    bool _382 = _331 > _380;
    float _384 = -_370;
    float _386 = precise::min(_331, _384);
    float _388 = _355 * _357;
    bool _390 = !_249;
    int _392 = _390 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _394 = rsqrt(_351);
    bool _396 = !_267;
    float _398 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _400 = _396 ? _392 : as_type<int>(_398);
    float _402 = -_388;
    bool _404 = _386 > _402;
    bool _406 = _404 || _382;
    bool _408 = !_285;
    int _410 = _408 ? _400 : 0;
    float _412 = _372 * _359;
    float _414 = -_388;
    bool _416 = _386 > _414;
    bool _418 = !_323;
    int _420 = _418 ? _410 : int(0x80000000);
    float _422 = -_388;
    float _424 = precise::min(_386, _422);
    bool _426 = !_382;
    int _428 = _426 ? _420 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _430 = _394 * _368;
    float _432 = -_412;
    bool _434 = _424 > _432;
    float _436 = -_412;
    float _438 = precise::min(_424, _436);
    bool _440 = !_416;
    float _442 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _444 = _440 ? _428 : as_type<int>(_442);
    bool _446 = !_406;
    int _448 = _446 ? _378 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _450 = -_430;
    bool _452 = _438 > _450;
    bool _454 = !_434;
    int _456 = _454 ? _444 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _458 = !_434;
    float _460 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    int _462 = _458 ? _448 : as_type<int>(_460);
    bool _464 = !_452;
    float _466 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _468 = _464 ? as_type<float>(_456) : _466;
    bool _470 = !_452;
    float _472 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _474 = _470 ? as_type<float>(_462) : _472;
    float _476 = _41 + _468;
    float _478 = _43 + _474;
    float2 _1167 = float2(_476, _478);
    float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1167, float2(0.0), isnan(_1167))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1167, float2(0.0), isnan(_1167))).xyz;
    float _482 = _480.x;
    float _484 = _480.y;
    float _486 = _480.z;
    out.m_34.x = _482;
    out.m_34.y = _484;
    out.m_34.z = _486;
    return out;
}

