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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _311 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_311, float2(0.0), isnan(_311))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_311, float2(0.0), isnan(_311))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _89 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _93 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _97 = fma(_89, -0.5, 0.5);
    float _99 = fma(_91, -0.5, 0.5);
    float _101 = fma(_93, -0.5, 0.5);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _95);
    float2 _399 = float2(_97, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_399, float2(0.0), isnan(_399))).x;
    float2 _409 = float2(_99, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_409, float2(0.0), isnan(_409))).x;
    float2 _419 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_419, float2(0.0), isnan(_419))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_419, float2(0.0), isnan(_419))).x;
    float _111 = fma(_103, -0.5, 0.5);
    float2 _431 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_431, float2(0.0), isnan(_431))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_431, float2(0.0), isnan(_431))).x;
    float _115 = 0.0 + _97;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = abs(_73);
    float _121 = -_119;
    float _123 = _121 + 1.0;
    float _125 = _117 + _99;
    float _127 = precise::clamp(_125, 0.0, 1.0);
    float _129 = _123 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _135 = _133 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _137 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _139 = _137 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _141 = _127 + _101;
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _147 = _145 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _149 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _151 = _149 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _153 = abs(_131);
    float _155 = log2(_153);
    float _157 = _111 + _143;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _163 = _161 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _165 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _167 = _165 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _169 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _171 = _169 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _173 = _155 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _175 = fma(_105, _135, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_107, _151, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _181 = fma(_105, _139, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = fma(_105, _147, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = fma(_107, _163, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _191 = _177 + _179;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = fma(_107, _167, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _197 = _183 + _189;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = _187 + _195;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = fma(_109, _171, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _207 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _209 = _207 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _215 = fma(_109, _209, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _217 = _199 + _205;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_109, _213, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _223 = exp2(_173);
    float _225 = _193 + _215;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _233 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _235 = _233 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _241 = _203 + _221;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = fma(_113, _231, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _247 = fma(_113, _239, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _249 = fma(_113, _235, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _251 = _247 + _227;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _245 + _219;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = _249 + _243;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = fma(_223, (*spvDescriptorSet0.fp_c4)._m0[0].w, _159);
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = fma(_223, (*spvDescriptorSet0.fp_c4)._m0[0].x, _253);
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = fma(_223, (*spvDescriptorSet0.fp_c4)._m0[0].y, _257);
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = fma(_223, (*spvDescriptorSet0.fp_c4)._m0[0].z, _261);
    float _277 = precise::clamp(_275, 0.0, 1.0);
    out.m_38.x = _269;
    out.m_38.y = _273;
    out.m_38.z = _277;
    out.m_38.w = _265;
    return out;
}

