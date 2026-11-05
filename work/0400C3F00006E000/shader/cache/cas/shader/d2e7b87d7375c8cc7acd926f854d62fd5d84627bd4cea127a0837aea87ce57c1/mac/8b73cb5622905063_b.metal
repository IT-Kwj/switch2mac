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
    float2 _267 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_267, float2(0.0), isnan(_267))).xyz;
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
    float2 _340 = float2(_93, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_340, float2(0.0), isnan(_340))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_340, float2(0.0), isnan(_340))).x;
    float2 _350 = float2(_95, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_350, float2(0.0), isnan(_350))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_350, float2(0.0), isnan(_350))).x;
    float2 _360 = float2(_97, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_360, float2(0.0), isnan(_360))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_360, float2(0.0), isnan(_360))).x;
    float _105 = abs(_73);
    float _107 = -_105;
    float _109 = _107 + 1.0;
    float _111 = 0.0 + _93;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = _109 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _113 + _95;
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = _97 + _121;
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = abs(_117);
    float _129 = log2(_127);
    float _131 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _133 = _131 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _135 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _137 = _135 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _139 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _141 = _139 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _143 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _145 = _143 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _147 = _129 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _149 = fma(_99, _145, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _155 = _153 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _157 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _159 = _157 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _161 = fma(_99, _133, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = fma(_101, _141, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _167 = fma(_101, _155, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _169 = fma(_101, _159, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _171 = fma(_99, _137, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = exp2(_147);
    float _177 = _163 + _167;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = _173 + _165;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _189 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _191 = _189 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _193 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _195 = _193 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _197 = _151 + _169;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = fma(_103, _187, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _203 = fma(_103, _191, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _205 = fma(_103, _195, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _207 = _201 + _179;
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = _203 + _183;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = _205 + _199;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = fma(_175, (*spvDescriptorSet0.fp_c4)._m0[0].w, _125);
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = fma(_175, (*spvDescriptorSet0.fp_c4)._m0[0].x, _209);
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = fma(_175, (*spvDescriptorSet0.fp_c4)._m0[0].y, _213);
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_175, (*spvDescriptorSet0.fp_c4)._m0[0].z, _217);
    float _233 = precise::clamp(_231, 0.0, 1.0);
    out.m_38.x = _225;
    out.m_38.y = _229;
    out.m_38.z = _233;
    out.m_38.w = _221;
    return out;
}

