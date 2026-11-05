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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0), center_no_perspective]];
    float4 m_29 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _41 = in.m_29.x;
    float _43 = in.m_29.y;
    float _45 = _41 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _47 = _41 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _49 = _43 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _51 = _43 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _53 = _47 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _55 = _49 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float2 _304 = float2(_45, _51);
    float _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_304, float2(0.0), isnan(_304))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_304, float2(0.0), isnan(_304))).x;
    float2 _316 = float2(_53, _51);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_316, float2(0.0), isnan(_316))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_316, float2(0.0), isnan(_316))).x;
    float2 _324 = float2(_45, _55);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_324, float2(0.0), isnan(_324))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_324, float2(0.0), isnan(_324))).x;
    float2 _332 = float2(_53, _55);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_332, float2(0.0), isnan(_332))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_332, float2(0.0), isnan(_332))).x;
    float _65 = in.m_31.y;
    float _67 = in.m_31.x;
    float _69 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _71 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _73 = -_69;
    float _75 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _77 = fma(_73, _65, _75);
    float _79 = -_69;
    float _81 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _83 = fma(_79, _67, _81);
    float _85 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _87 = -_69;
    float _89 = -(*spvDescriptorSet0.fp_c4)._m0[4].z;
    float _91 = _87 + _89;
    float _93 = _77 * _77;
    float _95 = -_71;
    float _97 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _99 = fma(_65, _95, _97);
    float _101 = -_71;
    float _103 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _105 = fma(_67, _101, _103);
    float _107 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _109 = fma(_83, _83, _93);
    float _111 = _99 * _99;
    float _113 = -_85;
    float _115 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _117 = fma(_65, _113, _115);
    float _119 = -_71;
    float _121 = -(*spvDescriptorSet0.fp_c4)._m0[4].z;
    float _123 = _119 + _121;
    float _125 = fma(_91, _91, _109);
    float _127 = fma(_105, _105, _111);
    float _129 = -_85;
    float _131 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _133 = fma(_67, _129, _131);
    float _135 = _117 * _117;
    float _137 = -_107;
    float _139 = -(*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _141 = fma(_65, _137, _139);
    float _143 = fma(_123, _123, _127);
    float _145 = -_85;
    float _147 = -(*spvDescriptorSet0.fp_c4)._m0[4].z;
    float _149 = _145 + _147;
    float _151 = fma(_133, _133, _135);
    float _153 = -_107;
    float _155 = -(*spvDescriptorSet0.fp_c4)._m0[4].x;
    float _157 = fma(_67, _153, _155);
    float _159 = _141 * _141;
    float _161 = sqrt(_125);
    float _163 = fma(_149, _149, _151);
    float _165 = -_107;
    float _167 = -(*spvDescriptorSet0.fp_c4)._m0[4].z;
    float _169 = _165 + _167;
    float _171 = fma(_157, _157, _159);
    float _173 = fma(_169, _169, _171);
    float _175 = sqrt(_143);
    float _177 = sqrt(_163);
    float _179 = _161 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = sqrt(_173);
    float _185 = _175 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = _177 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = abs(_181);
    float _195 = log2(_193);
    float _197 = _183 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = abs(_187);
    float _203 = log2(_201);
    float _205 = abs(_191);
    float _207 = log2(_205);
    float _209 = _195 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _211 = abs(_199);
    float _213 = log2(_211);
    float _215 = _203 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _217 = _207 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _219 = exp2(_209);
    float _221 = _213 * (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _223 = exp2(_215);
    float _225 = exp2(_217);
    float _227 = -_219;
    float _229 = _227 + 1.0;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = exp2(_221);
    float _235 = -_223;
    float _237 = _235 + 1.0;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _231 + _239;
    float _243 = -_225;
    float _245 = _243 + 1.0;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = _241 + _247;
    float _251 = -_233;
    float _253 = _251 + 1.0;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = _249 + _255;
    float _259 = _257 * 0.25;
    float _261 = _259 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _263 = _259 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _265 = _259 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
    out.m_34.x = _261;
    out.m_34.y = _263;
    out.m_34.z = _265;
    out.m_34.w = (*spvDescriptorSet0.fp_c4)._m0[5].w;
    return out;
}

