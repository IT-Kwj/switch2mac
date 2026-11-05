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
    constant _16* fp_c9 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_33 [[user(locn3), flat]];
    float4 m_31 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _210 = float2(_65, _67);
    float2 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_210, float2(0.0), isnan(_210))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_210, float2(0.0), isnan(_210))).xy;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = in.m_33.x;
    float _79 = in.m_31.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_31.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = _77 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _93 = _77 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _95 = _63 * _83;
    float _97 = _63 * _89;
    float _99 = fma(_91, _73, _95);
    float _101 = fma(_93, _75, _97);
    float2 _267 = float2(_99, _101);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_267, float2(0.0), isnan(_267))).w;
    float _105 = in.m_35.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_37.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_39.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _63 * _109;
    float _125 = _63 * _115;
    float _127 = in.m_35.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _103 * _123;
    float _135 = _63 * _121;
    float _137 = _125 * _133;
    float _139 = 0.0 + _137;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = _141 * _135;
    bool _147 = _143 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _149 = isnan(_143);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _155 = _151 || _153;
    float _157 = in.m_35.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_35.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    if (!_155)
    {
        discard_fragment();
    }
    float _169 = _63 * _131;
    float _171 = _63 * _161;
    float _173 = _63 * _167;
    if (!_155)
    {
        out.m_42.x = _169;
        out.m_42.y = _171;
        out.m_42.z = _173;
        out.m_42.w = _137;
        return out;
    }
    float _175 = 0.0 + _143;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    out.m_42.x = _169;
    out.m_42.y = _171;
    out.m_42.z = _173;
    out.m_42.w = _177;
    return out;
}

