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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_25 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
    float4 m_31 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_23.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_23.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_23.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_23.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_25.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_27.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_27.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_27.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_27.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_25.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_25.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_25.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_29.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_29.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_29.z;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_29.w;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_31.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_31.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_31.z;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_31.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = 1.0 / _41;
    float _165 = _163 * _47;
    float _167 = _163 * _53;
    float _169 = _163 * _59;
    float _171 = _163 * _65;
    float _173 = _163 * _71;
    float _175 = _163 * _77;
    float _177 = _163 * _83;
    float2 _521 = float2(_165, _167);
    float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_521, float2(0.0), isnan(_521))).xyz;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float _189 = _163 * _89;
    float2 _542 = float2(_169, _171);
    float3 _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_542, float2(0.0), isnan(_542))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_542, float2(0.0), isnan(_542))).xyz;
    float _193 = _191.x;
    float _195 = _191.y;
    float _197 = _191.z;
    float _199 = _163 * _95;
    float _201 = _163 * _101;
    float2 _562 = float2(_175, _177);
    float3 _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_562, float2(0.0), isnan(_562))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_562, float2(0.0), isnan(_562))).xyz;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    float _211 = _163 * _107;
    float _213 = _163 * _113;
    float _215 = _163 * _119;
    float2 _585 = float2(_189, _199);
    float3 _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_585, float2(0.0), isnan(_585))).xyz;
    float _219 = _217.x;
    float _221 = _217.y;
    float _223 = _217.z;
    float2 _599 = float2(_201, _173);
    float3 _225 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_599, float2(0.0), isnan(_599))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_599, float2(0.0), isnan(_599))).xyz;
    float _227 = _225.x;
    float _229 = _225.y;
    float _231 = _225.z;
    float _233 = _163 * _125;
    float _235 = _163 * _131;
    float2 _619 = float2(_211, _213);
    float3 _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_619, float2(0.0), isnan(_619))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_619, float2(0.0), isnan(_619))).xyz;
    float _239 = _237.x;
    float _241 = _237.y;
    float _243 = _237.z;
    float _245 = _163 * _137;
    float _247 = _163 * _143;
    float _249 = _163 * _149;
    float2 _642 = float2(_215, _233);
    float3 _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_642, float2(0.0), isnan(_642))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_642, float2(0.0), isnan(_642))).xyz;
    float _253 = _251.x;
    float _255 = _251.y;
    float _257 = _251.z;
    float _259 = _163 * _155;
    float _261 = _163 * _161;
    float2 _662 = float2(_235, _245);
    float3 _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_662, float2(0.0), isnan(_662))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_662, float2(0.0), isnan(_662))).xyz;
    float _265 = _263.x;
    float _267 = _263.y;
    float _269 = _263.z;
    float2 _676 = float2(_247, _249);
    float3 _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_676, float2(0.0), isnan(_676))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_676, float2(0.0), isnan(_676))).xyz;
    float _273 = _271.x;
    float _275 = _271.y;
    float _277 = _271.z;
    float2 _690 = float2(_259, _261);
    float3 _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_690, float2(0.0), isnan(_690))).xyz;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = _279.z;
    float _287 = _183 + _193;
    float _289 = _185 + _195;
    float _291 = _187 + _197;
    float _293 = _287 * 0.100000001490116119384765625;
    float _295 = _289 * 0.100000001490116119384765625;
    float _297 = _291 * 0.100000001490116119384765625;
    float _299 = fma(_205, 0.100000001490116119384765625, _293);
    float _301 = fma(_207, 0.100000001490116119384765625, _295);
    float _303 = fma(_209, 0.100000001490116119384765625, _297);
    float _305 = fma(_219, 0.100000001490116119384765625, _299);
    float _307 = fma(_221, 0.100000001490116119384765625, _301);
    float _309 = fma(_223, 0.100000001490116119384765625, _303);
    float _311 = fma(_227, 0.100000001490116119384765625, _305);
    float _313 = fma(_229, 0.100000001490116119384765625, _307);
    float _315 = fma(_231, 0.100000001490116119384765625, _309);
    float _317 = fma(_239, 0.100000001490116119384765625, _311);
    float _319 = fma(_241, 0.100000001490116119384765625, _313);
    float _321 = fma(_243, 0.100000001490116119384765625, _315);
    float _323 = fma(_253, 0.100000001490116119384765625, _317);
    float _325 = fma(_255, 0.100000001490116119384765625, _319);
    float _327 = fma(_257, 0.100000001490116119384765625, _321);
    float _329 = fma(_265, 0.100000001490116119384765625, _323);
    float _331 = fma(_267, 0.100000001490116119384765625, _325);
    float _333 = fma(_269, 0.100000001490116119384765625, _327);
    float _335 = fma(_273, 0.100000001490116119384765625, _329);
    float _337 = fma(_275, 0.100000001490116119384765625, _331);
    float _339 = fma(_277, 0.100000001490116119384765625, _333);
    float _341 = fma(_281, 0.100000001490116119384765625, _335);
    float _343 = fma(_283, 0.100000001490116119384765625, _337);
    float _345 = fma(_285, 0.100000001490116119384765625, _339);
    out.m_34.x = _341;
    out.m_34.y = _343;
    out.m_34.z = _345;
    out.m_34.w = 1.0;
    return out;
}

