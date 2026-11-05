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
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _201 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_201, float2(0.0), isnan(_201))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_201, float2(0.0), isnan(_201))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _81 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _83 = -_75;
    float _85 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _87 = fma(_81, -0.5, 0.5);
    float _89 = fma(_85, -0.5, 0.5);
    float _91 = abs(_87);
    float _93 = log2(_91);
    float _95 = abs(_89);
    float _97 = log2(_95);
    float _99 = _93 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _101 = exp2(_99);
    float _103 = _97 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _105 = exp2(_103);
    float2 _271 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_271, float2(0.0), isnan(_271))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_271, float2(0.0), isnan(_271))).x;
    float2 _280 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_280, float2(0.0), isnan(_280))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_280, float2(0.0), isnan(_280))).x;
    float _111 = abs(_75);
    float _113 = -_111;
    float _115 = _113 + 1.0;
    float _117 = _115 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _123 = _121 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _125 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _127 = _125 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _129 = abs(_119);
    float _131 = log2(_129);
    float _133 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _135 = _133 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _137 = _131 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _139 = exp2(_137);
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c4)._m0[0].w, _87);
    float _143 = fma(_139, (*spvDescriptorSet0.fp_c4)._m0[0].w, _89);
    float _145 = fma(_107, _123, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _147 = fma(_107, _127, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _149 = fma(_107, _135, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _151 = fma(_139, (*spvDescriptorSet0.fp_c4)._m0[0].x, _145);
    float _153 = fma(_139, (*spvDescriptorSet0.fp_c4)._m0[0].y, _147);
    float _155 = fma(_139, (*spvDescriptorSet0.fp_c4)._m0[0].z, _149);
    float _157 = fma(_123, _109, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _159 = fma(_127, _109, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _161 = fma(_135, _109, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _163 = fma(_139, (*spvDescriptorSet0.fp_c4)._m0[0].x, _157);
    float _165 = fma(_139, (*spvDescriptorSet0.fp_c4)._m0[0].y, _159);
    float _167 = fma(_139, (*spvDescriptorSet0.fp_c4)._m0[0].z, _161);
    out.m_38.x = _151;
    out.m_38.y = _153;
    out.m_38.z = _155;
    out.m_38.w = _141;
    out.m_40.x = _163;
    out.m_40.y = _165;
    out.m_40.z = _167;
    out.m_40.w = _143;
    return out;
}

