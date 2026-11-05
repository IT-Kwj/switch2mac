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
    float2 _213 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_213, float2(0.0), isnan(_213))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_213, float2(0.0), isnan(_213))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _77);
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _85 = fma(_81, -0.5, 0.5);
    float _87 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _89 = abs(_85);
    float _91 = log2(_89);
    float _93 = fma(_87, -0.5, 0.5);
    float _95 = abs(_93);
    float _97 = log2(_95);
    float _99 = _91 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _101 = exp2(_99);
    float _103 = _97 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _105 = exp2(_103);
    float2 _290 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_290, float2(0.0), isnan(_290))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_290, float2(0.0), isnan(_290))).x;
    float2 _300 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_300, float2(0.0), isnan(_300))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_300, float2(0.0), isnan(_300))).x;
    float _111 = abs(_73);
    float _113 = -_111;
    float _115 = _113 + 1.0;
    float _117 = _93 + _85;
    float _119 = _115 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = abs(_121);
    float _125 = log2(_123);
    float _127 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _129 = _127 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _131 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _133 = _131 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _135 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _137 = _135 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _139 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _141 = _139 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _143 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _145 = _143 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _147 = _125 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _149 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _151 = _149 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _153 = exp2(_147);
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c4)._m0[0].w, _117);
    float _157 = fma(_107, _129, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _159 = fma(_107, _133, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _161 = fma(_107, _145, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _163 = fma(_109, _151, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _165 = fma(_109, _137, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _167 = fma(_109, _141, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _169 = _163 + _159;
    float _171 = _165 + _157;
    float _173 = _167 + _161;
    float _175 = fma(_153, (*spvDescriptorSet0.fp_c4)._m0[0].y, _169);
    float _177 = fma(_153, (*spvDescriptorSet0.fp_c4)._m0[0].x, _171);
    float _179 = fma(_153, (*spvDescriptorSet0.fp_c4)._m0[0].z, _173);
    out.m_38.x = _177;
    out.m_38.y = _175;
    out.m_38.z = _179;
    out.m_38.w = _155;
    return out;
}

