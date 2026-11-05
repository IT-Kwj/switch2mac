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
    float2 _197 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_197, float2(0.0), isnan(_197))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_197, float2(0.0), isnan(_197))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _81 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _83 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _85 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _81);
    float _87 = fma(_83, -0.5, 0.5);
    float _89 = fma(_85, -0.5, 0.5);
    float2 _254 = float2(_87, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_254, float2(0.0), isnan(_254))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_254, float2(0.0), isnan(_254))).x;
    float2 _264 = float2(_89, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_264, float2(0.0), isnan(_264))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_264, float2(0.0), isnan(_264))).x;
    float _95 = abs(_73);
    float _97 = -_95;
    float _99 = _97 + 1.0;
    float _101 = _89 + _87;
    float _103 = _99 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float _107 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _109 = _107 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _111 = abs(_105);
    float _113 = log2(_111);
    float _115 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _117 = _115 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _119 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _121 = _119 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _123 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _125 = _123 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _127 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _129 = _127 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _131 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _133 = _131 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _135 = _113 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _137 = exp2(_135);
    float _139 = fma(_137, (*spvDescriptorSet0.fp_c4)._m0[0].w, _101);
    float _141 = fma(_91, _109, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _143 = fma(_93, _117, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _145 = fma(_91, _125, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _147 = fma(_91, _133, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _149 = fma(_93, _121, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _151 = fma(_93, _129, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _153 = _143 + _141;
    float _155 = _149 + _145;
    float _157 = _151 + _147;
    float _159 = fma(_137, (*spvDescriptorSet0.fp_c4)._m0[0].x, _153);
    float _161 = fma(_137, (*spvDescriptorSet0.fp_c4)._m0[0].y, _155);
    float _163 = fma(_137, (*spvDescriptorSet0.fp_c4)._m0[0].z, _157);
    out.m_38.x = _159;
    out.m_38.y = _161;
    out.m_38.z = _163;
    out.m_38.w = _139;
    return out;
}

