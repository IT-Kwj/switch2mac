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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_29.x;
    float _41 = in.m_29.y;
    float _43 = fma((*spvDescriptorSet0.fp_c3)._m0[2].x, -3.0, _39);
    float _45 = fma((*spvDescriptorSet0.fp_c3)._m0[2].x, -2.0, _39);
    float2 _296 = float2(_39, _41);
    float3 _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_296, float2(0.0), isnan(_296))).xyz;
    float _51 = _49.x;
    float _53 = _49.y;
    float _55 = _49.z;
    float _57 = -(*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _59 = _39 + _57;
    float _61 = _39 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _63 = fma((*spvDescriptorSet0.fp_c3)._m0[2].x, 2.0, _39);
    float2 _329 = float2(_43, _41);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_329, float2(0.0), isnan(_329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_329, float2(0.0), isnan(_329))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _343 = float2(_45, _41);
    float3 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_343, float2(0.0), isnan(_343))).xyz;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = _73.z;
    float2 _357 = float2(_39, _41);
    float3 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_357, float2(0.0), isnan(_357))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_357, float2(0.0), isnan(_357))).xyz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float2 _371 = float2(_59, _41);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_371, float2(0.0), isnan(_371))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float2 _385 = float2(_61, _41);
    float3 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).xyz;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float _105 = fma((*spvDescriptorSet0.fp_c3)._m0[2].x, 3.0, _39);
    float2 _404 = float2(_63, _41);
    float3 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_404, float2(0.0), isnan(_404))).xyz;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    float2 _418 = float2(_105, _41);
    float3 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_418, float2(0.0), isnan(_418))).xyz;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = -_53;
    float _125 = _123 + _69;
    float _127 = -_51;
    float _129 = _127 + _67;
    float _131 = -_51;
    float _133 = _131 + _75;
    float _135 = -_55;
    float _137 = _135 + _71;
    float _139 = fma(_85, _125, _53);
    float _141 = -_53;
    float _143 = _141 + _77;
    float _145 = fma(_83, _129, _51);
    float _147 = fma(_87, _137, _55);
    float _149 = _139 * 0.006000000052154064178466796875;
    float _151 = fma(_83, _133, _51);
    float _153 = -_51;
    float _155 = _153 + _91;
    float _157 = fma(_85, _143, _53);
    float _159 = fma(_53, 0.3819999992847442626953125, _149);
    float _161 = -_53;
    float _163 = _161 + _93;
    float _165 = _145 * 0.006000000052154064178466796875;
    float _167 = -_55;
    float _169 = _167 + _79;
    float _171 = _147 * 0.006000000052154064178466796875;
    float _173 = -_51;
    float _175 = _173 + _99;
    float _177 = -_53;
    float _179 = _177 + _101;
    float _181 = fma(_157, 0.0610000006854534149169921875, _159);
    float _183 = fma(_85, _163, _53);
    float _185 = fma(_51, 0.3819999992847442626953125, _165);
    float _187 = fma(_87, _169, _55);
    float _189 = fma(_55, 0.3819999992847442626953125, _171);
    float _191 = -_55;
    float _193 = _191 + _95;
    float _195 = fma(_85, _179, _53);
    float _197 = fma(_183, 0.24199999868869781494140625, _181);
    float _199 = -_53;
    float _201 = _199 + _111;
    float _203 = fma(_151, 0.0610000006854534149169921875, _185);
    float _205 = fma(_83, _155, _51);
    float _207 = fma(_187, 0.0610000006854534149169921875, _189);
    float _209 = fma(_87, _193, _55);
    float _211 = -_55;
    float _213 = _211 + _103;
    float _215 = fma(_195, 0.24199999868869781494140625, _197);
    float _217 = fma(_85, _201, _53);
    float _219 = fma(_205, 0.24199999868869781494140625, _203);
    float _221 = fma(_83, _175, _51);
    float _223 = -_51;
    float _225 = _223 + _109;
    float _227 = fma(_209, 0.24199999868869781494140625, _207);
    float _229 = fma(_87, _213, _55);
    float _231 = -_55;
    float _233 = _231 + _113;
    float _235 = fma(_217, 0.0610000006854534149169921875, _215);
    float _237 = -_51;
    float _239 = _237 + _117;
    float _241 = fma(_221, 0.24199999868869781494140625, _219);
    float _243 = fma(_83, _225, _51);
    float _245 = -_53;
    float _247 = _245 + _119;
    float _249 = fma(_229, 0.24199999868869781494140625, _227);
    float _251 = fma(_87, _233, _55);
    float _253 = -_55;
    float _255 = _253 + _121;
    float _257 = fma(_83, _239, _51);
    float _259 = fma(_243, 0.0610000006854534149169921875, _241);
    float _261 = fma(_85, _247, _53);
    float _263 = fma(_251, 0.0610000006854534149169921875, _249);
    float _265 = fma(_87, _255, _55);
    float _267 = fma(_257, 0.006000000052154064178466796875, _259);
    float _269 = fma(_261, 0.006000000052154064178466796875, _235);
    float _271 = fma(_265, 0.006000000052154064178466796875, _263);
    out.m_32.x = _267;
    out.m_32.y = _269;
    out.m_32.z = _271;
    out.m_32.w = (*spvDescriptorSet0.fp_c3)._m0[2].w;
    return out;
}

