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
    float2 _269 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_269, float2(0.0), isnan(_269))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_269, float2(0.0), isnan(_269))).xyz;
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
    float2 _357 = float2(_97, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_357, float2(0.0), isnan(_357))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_357, float2(0.0), isnan(_357))).x;
    float2 _367 = float2(_99, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_367, float2(0.0), isnan(_367))).x;
    float2 _377 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377))).x;
    float _111 = fma(_103, -0.5, 0.5);
    float2 _389 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_389, float2(0.0), isnan(_389))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_389, float2(0.0), isnan(_389))).x;
    float _115 = abs(_73);
    float _117 = -_115;
    float _119 = _117 + 1.0;
    float _121 = _97 + _99;
    float _123 = _119 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _129 = _127 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _131 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _133 = _131 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _135 = _121 + _101;
    float _137 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _139 = _137 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _141 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _143 = _141 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _145 = abs(_125);
    float _147 = log2(_145);
    float _149 = _111 + _135;
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _163 = _147 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _165 = fma(_105, _129, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _167 = fma(_107, _143, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _169 = fma(_105, _133, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _171 = fma(_105, _139, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _173 = fma(_107, _153, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _175 = _165 + _167;
    float _177 = fma(_107, _157, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _179 = _169 + _173;
    float _181 = _171 + _177;
    float _183 = fma(_109, _161, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _189 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _191 = _189 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _193 = fma(_109, _187, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _195 = _179 + _183;
    float _197 = fma(_109, _191, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _199 = exp2(_163);
    float _201 = _175 + _193;
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _207 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _209 = _207 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _215 = _181 + _197;
    float _217 = fma(_113, _205, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _219 = fma(_113, _213, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _221 = fma(_113, _209, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _223 = _219 + _201;
    float _225 = _217 + _195;
    float _227 = _221 + _215;
    float _229 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].w, _149);
    float _231 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].x, _223);
    float _233 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].y, _225);
    float _235 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].z, _227);
    out.m_38.x = _231;
    out.m_38.y = _233;
    out.m_38.z = _235;
    out.m_38.w = _229;
    return out;
}

