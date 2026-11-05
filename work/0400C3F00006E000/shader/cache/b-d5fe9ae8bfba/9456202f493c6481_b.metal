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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _37 = in.m_27.x;
    float _39 = in.m_27.y;
    float _41 = fma((*spvDescriptorSet0.fp_c3)._m0[2].x, -3.0, _37);
    float _43 = fma((*spvDescriptorSet0.fp_c3)._m0[2].x, -2.0, _37);
    float _45 = fma((*spvDescriptorSet0.fp_c3)._m0[2].x, 2.0, _37);
    float _47 = fma((*spvDescriptorSet0.fp_c3)._m0[2].x, 3.0, _37);
    float _49 = -(*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _51 = _37 + _49;
    float _53 = _37 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float2 _306 = float2(_37, _39);
    float3 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_306, float2(0.0), isnan(_306))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_306, float2(0.0), isnan(_306))).xyz;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float2 _324 = float2(_41, _39);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_324, float2(0.0), isnan(_324))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_324, float2(0.0), isnan(_324))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _338 = float2(_43, _39);
    float3 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_338, float2(0.0), isnan(_338))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_338, float2(0.0), isnan(_338))).xyz;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = _73.z;
    float2 _352 = float2(_51, _39);
    float3 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_352, float2(0.0), isnan(_352))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_352, float2(0.0), isnan(_352))).xyz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float2 _366 = float2(_53, _39);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_366, float2(0.0), isnan(_366))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_366, float2(0.0), isnan(_366))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float2 _380 = float2(_45, _39);
    float3 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_380, float2(0.0), isnan(_380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_380, float2(0.0), isnan(_380))).xyz;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float2 _394 = float2(_47, _39);
    float3 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_394, float2(0.0), isnan(_394))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_394, float2(0.0), isnan(_394))).xyz;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = -_61;
    float _115 = _113 + _69;
    float _117 = -_63;
    float _119 = _117 + _71;
    float _121 = -_59;
    float _123 = _121 + _67;
    float _125 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[1].y, _61);
    float _127 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
    float _129 = -_61;
    float _131 = _129 + _77;
    float _133 = -_63;
    float _135 = _133 + _79;
    float _137 = _125 * 0.006000000052154064178466796875;
    float _139 = _127 * 0.006000000052154064178466796875;
    float _141 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[1].x, _59);
    float _143 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[1].y, _61);
    float _145 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
    float _147 = fma(_61, 0.3819999992847442626953125, _137);
    float _149 = fma(_63, 0.3819999992847442626953125, _139);
    float _151 = -_63;
    float _153 = _151 + _87;
    float _155 = -_59;
    float _157 = _155 + _75;
    float _159 = _141 * 0.006000000052154064178466796875;
    float _161 = fma(_143, 0.0610000006854534149169921875, _147);
    float _163 = fma(_145, 0.0610000006854534149169921875, _149);
    float _165 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
    float _167 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[1].x, _59);
    float _169 = fma(_59, 0.3819999992847442626953125, _159);
    float _171 = -_59;
    float _173 = _171 + _83;
    float _175 = -_61;
    float _177 = _175 + _85;
    float _179 = fma(_165, 0.24199999868869781494140625, _163);
    float _181 = fma(_167, 0.0610000006854534149169921875, _169);
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[1].x, _59);
    float _185 = -_59;
    float _187 = _185 + _91;
    float _189 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[1].y, _61);
    float _191 = -_61;
    float _193 = _191 + _93;
    float _195 = fma(_183, 0.24199999868869781494140625, _181);
    float _197 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[1].x, _59);
    float _199 = -_59;
    float _201 = _199 + _99;
    float _203 = fma(_189, 0.24199999868869781494140625, _161);
    float _205 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[1].y, _61);
    float _207 = -_61;
    float _209 = _207 + _101;
    float _211 = -_63;
    float _213 = _211 + _95;
    float _215 = fma(_197, 0.24199999868869781494140625, _195);
    float _217 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[1].x, _59);
    float _219 = fma(_205, 0.24199999868869781494140625, _203);
    float _221 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[1].y, _61);
    float _223 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
    float _225 = -_63;
    float _227 = _225 + _103;
    float _229 = fma(_217, 0.0610000006854534149169921875, _215);
    float _231 = -_59;
    float _233 = _231 + _107;
    float _235 = fma(_221, 0.0610000006854534149169921875, _219);
    float _237 = -_61;
    float _239 = _237 + _109;
    float _241 = fma(_223, 0.24199999868869781494140625, _179);
    float _243 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
    float _245 = -_63;
    float _247 = _245 + _111;
    float _249 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[1].x, _59);
    float _251 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[1].y, _61);
    float _253 = fma(_243, 0.0610000006854534149169921875, _241);
    float _255 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
    float _257 = fma(_249, 0.006000000052154064178466796875, _229);
    float _259 = fma(_251, 0.006000000052154064178466796875, _235);
    float _261 = fma(_255, 0.006000000052154064178466796875, _253);
    out.m_30.x = _257;
    out.m_30.y = _259;
    out.m_30.z = _261;
    out.m_30.w = (*spvDescriptorSet0.fp_c3)._m0[2].w;
    return out;
}

