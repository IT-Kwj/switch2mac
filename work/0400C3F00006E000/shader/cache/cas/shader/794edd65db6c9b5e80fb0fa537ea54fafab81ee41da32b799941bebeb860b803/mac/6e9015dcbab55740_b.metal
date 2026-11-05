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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
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
    float2 _229 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_229, float2(0.0), isnan(_229))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_229, float2(0.0), isnan(_229))).w;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _63 * _75;
    float _91 = _63 * _81;
    float _93 = _63 * _87;
    float _95 = _69 * _69;
    float _97 = _89 * _95;
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = _99 * _91;
    bool _105 = _101 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _107 = isnan(_101);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _113 = _109 || _111;
    float _115 = in.m_37.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    if (!_113)
    {
        discard_fragment();
    }
    float _121 = _63 * _119;
    float2 _314 = float2(_121, _93);
    float3 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_314, float2(0.0), isnan(_314))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_314, float2(0.0), isnan(_314))).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = in.m_33.x;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_33.y;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_33.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_39.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_39.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_39.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _63 * _137;
    float _171 = _63 * _143;
    float _173 = _63 * _149;
    float _175 = _63 * _155;
    float _177 = _63 * _161;
    float _179 = _63 * _167;
    float _181 = _127 * _127;
    float _183 = _129 * _129;
    float _185 = _131 * _131;
    float _187 = fma(_181, _169, _175);
    float _189 = fma(_183, _171, _177);
    float _191 = fma(_185, _173, _179);
    if (!_113)
    {
        out.m_42.x = _187;
        out.m_42.y = _189;
        out.m_42.z = _191;
        out.m_42.w = _99;
        return out;
    }
    float _193 = 0.0 + _101;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    out.m_42.x = _187;
    out.m_42.y = _189;
    out.m_42.z = _191;
    out.m_42.w = _195;
    return out;
}

