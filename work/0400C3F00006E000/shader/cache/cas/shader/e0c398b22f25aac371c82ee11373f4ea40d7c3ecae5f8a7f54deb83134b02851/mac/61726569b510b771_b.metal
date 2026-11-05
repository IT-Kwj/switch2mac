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
    float2 _291 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_291, float2(0.0), isnan(_291))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_291, float2(0.0), isnan(_291))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _87 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _89 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _85);
    float _93 = fma(_87, -0.5, 0.5);
    float _95 = fma(_89, -0.5, 0.5);
    float _97 = fma(_91, -0.5, 0.5);
    float _99 = abs(_93);
    float _101 = log2(_99);
    float _103 = abs(_95);
    float _105 = log2(_103);
    float _107 = abs(_97);
    float _109 = log2(_107);
    float _111 = _101 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _113 = _105 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _115 = exp2(_111);
    float _117 = _109 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _119 = exp2(_113);
    float _121 = exp2(_117);
    float2 _394 = float2(_115, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_394, float2(0.0), isnan(_394))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_394, float2(0.0), isnan(_394))).x;
    float2 _404 = float2(_119, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_404, float2(0.0), isnan(_404))).x;
    float2 _414 = float2(_121, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_414, float2(0.0), isnan(_414))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_414, float2(0.0), isnan(_414))).x;
    float _129 = abs(_73);
    float _131 = -_129;
    float _133 = _131 + 1.0;
    float _135 = 0.0 + _93;
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = _133 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = _137 + _95;
    float _145 = precise::clamp(_143, 0.0, 1.0);
    float _147 = _97 + _145;
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = abs(_141);
    float _153 = log2(_151);
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _163 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _165 = _163 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _167 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _169 = _167 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _171 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _173 = _171 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _179 = _153 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _181 = fma(_123, _157, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = fma(_123, _165, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = fma(_123, _161, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = fma(_125, _169, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _195 = fma(_125, _177, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _197 = fma(_125, _173, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _199 = exp2(_179);
    float _201 = _183 + _193;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = _187 + _195;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _211 = _209 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _213 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _215 = _213 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _221 = _191 + _197;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = fma(_127, _211, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _227 = fma(_127, _215, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _229 = fma(_127, _219, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _231 = _225 + _203;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _227 + _207;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _229 + _223;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].w, _149);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].x, _233);
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].y, _237);
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].z, _241);
    float _257 = precise::clamp(_255, 0.0, 1.0);
    out.m_38.x = _249;
    out.m_38.y = _253;
    out.m_38.z = _257;
    out.m_38.w = _245;
    return out;
}

