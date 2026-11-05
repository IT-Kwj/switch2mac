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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
    float4 m_31 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _43 = in.m_31.x;
    float _45 = in.m_31.y;
    float2 _189 = float2(_43, _45);
    float _47 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_189, float2(0.0), isnan(_189))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_189, float2(0.0), isnan(_189))).x;
    float2 _200 = float2(_43, _45);
    float3 _51 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_200, float2(0.0), isnan(_200))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_200, float2(0.0), isnan(_200))).xyz;
    float _53 = _51.x;
    float _55 = _51.y;
    float _57 = _51.z;
    float _59 = in.m_33.z;
    float _61 = in.m_33.w;
    float _63 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _65 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _63);
    float _67 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _65);
    float _69 = rsqrt(_67);
    float _71 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _73 = fma(_55, 2.0, -1.0);
    float _75 = in.m_33.y;
    float _77 = fma(_53, 2.0, -1.0);
    float _79 = -_71;
    float _81 = fma(_79, _59, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _83 = -_71;
    float _85 = fma(_83, _61, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _87 = _73 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _89 = fma(_57, 2.0, -1.0);
    float _91 = fma(_81, -0.5, 0.5);
    float _93 = in.m_33.x;
    float _95 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[15].x, _87);
    bool _99 = _91 <= 1.0;
    bool _101 = isnan(_91);
    bool _103 = _99 || _101;
    bool _105 = isnan(1.0);
    bool _107 = _103 || _105;
    float _109 = float(_107);
    float _111 = fma(_89, (*spvDescriptorSet0.fp_c4)._m0[15].z, _95);
    float _113 = _91 * _109;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = -_69;
    float _119 = fma(_117, _111, 0.0);
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = abs(_115);
    float _125 = log2(_123);
    float _127 = -_71;
    float _129 = fma(_127, _75, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _131 = _125 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _133 = -_71;
    float _135 = fma(_133, _93, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _137 = exp2(_131);
    float _139 = precise::min(_135, _129);
    float _141 = precise::max(_135, _129);
    bool _143 = _139 >= 0.0;
    bool _145 = isnan(_139);
    bool _147 = _143 || _145;
    bool _149 = isnan(0.0);
    bool _151 = _147 || _149;
    bool _153 = _85 >= _141;
    bool _155 = isnan(_85);
    bool _157 = _153 || _155;
    bool _159 = isnan(_141);
    bool _161 = _157 || _159;
    bool _163 = _161 && _151;
    float _165 = float(_163);
    float _167 = _165 * _137;
    float _169 = _167 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _171 = _169 * _121;
    float _173 = _171 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _175 = _171 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _177 = _171 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    out.m_36.x = _173;
    out.m_36.y = _175;
    out.m_36.z = _177;
    out.m_36.w = 0.0;
    return out;
}

