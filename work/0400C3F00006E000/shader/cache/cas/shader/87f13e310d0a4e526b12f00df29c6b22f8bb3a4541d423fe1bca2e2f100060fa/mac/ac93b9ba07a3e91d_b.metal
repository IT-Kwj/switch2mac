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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.x;
    float _41 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _43 = _39 / _41;
    float _45 = gl_FragCoord.y;
    float _47 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _49 = _45 / _47;
    float _51 = gl_FragCoord.w;
    float _53 = in.m_29.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = trunc(_43);
    float _67 = precise::max(_65, 0.0);
    uint _70 = uint(_67);
    float _72 = trunc(_49);
    float _74 = precise::max(_72, 0.0);
    uint _76 = uint(_74);
    float _78 = 1.0 / _51;
    int _81 = int(_70) & 1;
    float _83 = float(uint(_81));
    int _85 = int(_76) & 1;
    float _87 = float(uint(_85));
    float _89 = _78 * _57;
    float _91 = -_83;
    float _93 = _91 + 1.0;
    float _95 = _78 * _63;
    float _97 = -_87;
    float _99 = _97 + 1.0;
    float _101 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[0].x, _89);
    float _103 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[0].y, _95);
    float2 _224 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_224, float2(0.0), isnan(_224)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_224, float2(0.0), isnan(_224)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)).x;
    float _107 = -_105;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    bool _113 = _105 != 1.0;
    bool _115 = isnan(_105);
    bool _117 = _113 || _115;
    bool _119 = isnan(1.0);
    bool _121 = _117 || _119;
    float _123 = 1.0 / _109;
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _127 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[0].w, _125);
    int _129 = _121 ? as_type<int>(_127) : 1065353216;
    out.m_32.x = as_type<float>(_129);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.x;
    float _41 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _43 = _39 / _41;
    float _45 = gl_FragCoord.y;
    float _47 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _49 = _45 / _47;
    float _51 = gl_FragCoord.w;
    float _53 = in.m_29.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = trunc(_43);
    float _67 = precise::max(_65, 0.0);
    uint _70 = uint(_67);
    float _72 = trunc(_49);
    float _74 = precise::max(_72, 0.0);
    uint _76 = uint(_74);
    float _78 = 1.0 / _51;
    int _81 = int(_70) & 1;
    float _83 = float(uint(_81));
    int _85 = int(_76) & 1;
    float _87 = float(uint(_85));
    float _89 = _78 * _57;
    float _91 = -_83;
    float _93 = _91 + 1.0;
    float _95 = _78 * _63;
    float _97 = -_87;
    float _99 = _97 + 1.0;
    float _101 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[0].x, _89);
    float _103 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[0].y, _95);
    float2 _224 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_224, float2(0.0), isnan(_224)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_224, float2(0.0), isnan(_224)), level((*spvDescriptorSet0.fp_c3)._m0[1].z)).x;
    float _107 = -_105;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    bool _113 = _105 != 1.0;
    bool _115 = isnan(_105);
    bool _117 = _113 || _115;
    bool _119 = isnan(1.0);
    bool _121 = _117 || _119;
    float _123 = 1.0 / _109;
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _127 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[0].w, _125);
    int _129 = _121 ? as_type<int>(_127) : 1065353216;
    out.m_32.x = as_type<float>(_129);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

