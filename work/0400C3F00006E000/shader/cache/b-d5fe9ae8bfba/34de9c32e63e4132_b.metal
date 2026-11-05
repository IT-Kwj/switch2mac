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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
    float4 m_25 [[user(locn1)]];
    float4 m_27 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_31 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_23.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_23.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_23.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_23.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _43;
    float _71 = _69 * _49;
    float _73 = _69 * _55;
    float _75 = _69 * _61;
    float _77 = _69 * _67;
    float2 _462 = float2(_71, _73);
    float3 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_462, float2(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_462, float2(0.0), isnan(_462))).xyz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float2 _480 = float2(_75, _77);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_480, float2(0.0), isnan(_480))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_480, float2(0.0), isnan(_480))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = in.m_25.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_25.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_25.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_25.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_27.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_27.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_29.x;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_31.y;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_27.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_27.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_29.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_33.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_29.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_29.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_33.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_33.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_33.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_31.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_31.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_31.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = _69 * _101;
    float _219 = _69 * _107;
    float _221 = _69 * _113;
    float _223 = _69 * _119;
    float _225 = _69 * _125;
    float _227 = _69 * _131;
    float _229 = _69 * _137;
    float2 _655 = float2(_217, _219);
    float3 _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_655, float2(0.0), isnan(_655))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_655, float2(0.0), isnan(_655))).xyz;
    float _233 = _231.x;
    float _235 = _231.y;
    float _237 = _231.z;
    float _239 = _69 * _143;
    float _241 = _69 * _149;
    float2 _675 = float2(_221, _223);
    float3 _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_675, float2(0.0), isnan(_675))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_675, float2(0.0), isnan(_675))).xyz;
    float _245 = _243.x;
    float _247 = _243.y;
    float _249 = _243.z;
    float2 _689 = float2(_225, _227);
    float3 _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_689, float2(0.0), isnan(_689))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_689, float2(0.0), isnan(_689))).xyz;
    float _253 = _251.x;
    float _255 = _251.y;
    float _257 = _251.z;
    float _259 = _69 * _155;
    float _261 = _69 * _161;
    float _263 = _69 * _167;
    float _265 = _69 * _173;
    float _267 = _69 * _179;
    float _269 = _69 * _185;
    float2 _721 = float2(_241, _259);
    float3 _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_721, float2(0.0), isnan(_721))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_721, float2(0.0), isnan(_721))).xyz;
    float _273 = _271.x;
    float _275 = _271.y;
    float _277 = _271.z;
    float2 _735 = float2(_229, _261);
    float3 _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_735, float2(0.0), isnan(_735))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_735, float2(0.0), isnan(_735))).xyz;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = _279.z;
    float _287 = _69 * _191;
    float _289 = _69 * _197;
    float2 _755 = float2(_265, _267);
    float3 _291 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_755, float2(0.0), isnan(_755))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_755, float2(0.0), isnan(_755))).xyz;
    float _293 = _291.x;
    float _295 = _291.y;
    float _297 = _291.z;
    float _299 = _69 * _203;
    float _301 = _69 * _209;
    float _303 = _69 * _215;
    float2 _778 = float2(_269, _287);
    float3 _305 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_778, float2(0.0), isnan(_778))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_778, float2(0.0), isnan(_778))).xyz;
    float _307 = _305.x;
    float _309 = _305.y;
    float _311 = _305.z;
    float2 _792 = float2(_289, _263);
    float3 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_792, float2(0.0), isnan(_792))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_792, float2(0.0), isnan(_792))).xyz;
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = _313.z;
    float _321 = _83 + _91;
    float2 _809 = float2(_299, _239);
    float3 _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_809, float2(0.0), isnan(_809))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_809, float2(0.0), isnan(_809))).xyz;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    float2 _823 = float2(_301, _303);
    float3 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_823, float2(0.0), isnan(_823))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_823, float2(0.0), isnan(_823))).xyz;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float _339 = _85 + _93;
    float _341 = _87 + _95;
    float _343 = _321 * 0.083333335816860198974609375;
    float _345 = _339 * 0.083333335816860198974609375;
    float _347 = _341 * 0.083333335816860198974609375;
    float _349 = fma(_233, 0.083333335816860198974609375, _343);
    float _351 = fma(_235, 0.083333335816860198974609375, _345);
    float _353 = fma(_237, 0.083333335816860198974609375, _347);
    float _355 = fma(_245, 0.083333335816860198974609375, _349);
    float _357 = fma(_247, 0.083333335816860198974609375, _351);
    float _359 = fma(_249, 0.083333335816860198974609375, _353);
    float _361 = fma(_253, 0.083333335816860198974609375, _355);
    float _363 = fma(_255, 0.083333335816860198974609375, _357);
    float _365 = fma(_257, 0.083333335816860198974609375, _359);
    float _367 = fma(_273, 0.083333335816860198974609375, _361);
    float _369 = fma(_275, 0.083333335816860198974609375, _363);
    float _371 = fma(_277, 0.083333335816860198974609375, _365);
    float _373 = fma(_281, 0.083333335816860198974609375, _367);
    float _375 = fma(_283, 0.083333335816860198974609375, _369);
    float _377 = fma(_285, 0.083333335816860198974609375, _371);
    float _379 = fma(_293, 0.083333335816860198974609375, _373);
    float _381 = fma(_295, 0.083333335816860198974609375, _375);
    float _383 = fma(_297, 0.083333335816860198974609375, _377);
    float _385 = fma(_307, 0.083333335816860198974609375, _379);
    float _387 = fma(_309, 0.083333335816860198974609375, _381);
    float _389 = fma(_311, 0.083333335816860198974609375, _383);
    float _391 = fma(_315, 0.083333335816860198974609375, _385);
    float _393 = fma(_317, 0.083333335816860198974609375, _387);
    float _395 = fma(_319, 0.083333335816860198974609375, _389);
    float _397 = fma(_325, 0.083333335816860198974609375, _391);
    float _399 = fma(_327, 0.083333335816860198974609375, _393);
    float _401 = fma(_329, 0.083333335816860198974609375, _395);
    float _403 = fma(_333, 0.083333335816860198974609375, _397);
    float _405 = fma(_335, 0.083333335816860198974609375, _399);
    float _407 = fma(_337, 0.083333335816860198974609375, _401);
    out.m_36.x = _403;
    out.m_36.y = _405;
    out.m_36.z = _407;
    out.m_36.w = 1.0;
    return out;
}

