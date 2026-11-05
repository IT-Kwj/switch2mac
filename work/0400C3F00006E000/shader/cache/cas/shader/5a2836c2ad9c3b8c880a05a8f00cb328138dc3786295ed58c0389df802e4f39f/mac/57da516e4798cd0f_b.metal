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
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_25 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_23.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_23.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_23.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_23.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_25.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_27.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_27.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_27.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_27.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_25.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_25.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_25.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_29.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_29.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_29.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_29.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = 1.0 / _39;
    float _139 = _137 * _45;
    float _141 = _137 * _51;
    float _143 = _137 * _57;
    float _145 = _137 * _63;
    float _147 = _137 * _69;
    float _149 = _137 * _75;
    float _151 = _137 * _81;
    float2 _431 = float2(_139, _141);
    float3 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_431, float2(0.0), isnan(_431))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_431, float2(0.0), isnan(_431))).xyz;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float _163 = _137 * _87;
    float2 _452 = float2(_143, _145);
    float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_452, float2(0.0), isnan(_452))).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float _173 = _137 * _93;
    float _175 = _137 * _99;
    float2 _472 = float2(_149, _151);
    float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_472, float2(0.0), isnan(_472))).xyz;
    float _179 = _177.x;
    float _181 = _177.y;
    float _183 = _177.z;
    float _185 = _137 * _105;
    float _187 = _137 * _111;
    float _189 = _137 * _117;
    float2 _495 = float2(_163, _173);
    float3 _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_495, float2(0.0), isnan(_495))).xyz;
    float _193 = _191.x;
    float _195 = _191.y;
    float _197 = _191.z;
    float _199 = _137 * _123;
    float _201 = _137 * _129;
    float2 _515 = float2(_175, _185);
    float3 _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_515, float2(0.0), isnan(_515))).xyz;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    float2 _529 = float2(_147, _187);
    float3 _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_529, float2(0.0), isnan(_529))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_529, float2(0.0), isnan(_529))).xyz;
    float _213 = _211.x;
    float _215 = _211.y;
    float _217 = _211.z;
    float _219 = _137 * _135;
    float2 _546 = float2(_189, _199);
    float3 _221 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_546, float2(0.0), isnan(_546))).xyz;
    float _223 = _221.x;
    float _225 = _221.y;
    float _227 = _221.z;
    float2 _560 = float2(_201, _219);
    float3 _229 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_560, float2(0.0), isnan(_560))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_560, float2(0.0), isnan(_560))).xyz;
    float _231 = _229.x;
    float _233 = _229.y;
    float _235 = _229.z;
    float _237 = _157 + _167;
    float _239 = _159 + _169;
    float _241 = _161 + _171;
    float _243 = _237 * 0.125;
    float _245 = _239 * 0.125;
    float _247 = _241 * 0.125;
    float _249 = fma(_179, 0.125, _243);
    float _251 = fma(_181, 0.125, _245);
    float _253 = fma(_183, 0.125, _247);
    float _255 = fma(_193, 0.125, _249);
    float _257 = fma(_195, 0.125, _251);
    float _259 = fma(_197, 0.125, _253);
    float _261 = fma(_205, 0.125, _255);
    float _263 = fma(_207, 0.125, _257);
    float _265 = fma(_209, 0.125, _259);
    float _267 = fma(_213, 0.125, _261);
    float _269 = fma(_215, 0.125, _263);
    float _271 = fma(_217, 0.125, _265);
    float _273 = fma(_223, 0.125, _267);
    float _275 = fma(_225, 0.125, _269);
    float _277 = fma(_227, 0.125, _271);
    float _279 = fma(_231, 0.125, _273);
    float _281 = fma(_233, 0.125, _275);
    float _283 = fma(_235, 0.125, _277);
    out.m_32.x = _279;
    out.m_32.y = _281;
    out.m_32.z = _283;
    out.m_32.w = 1.0;
    return out;
}

