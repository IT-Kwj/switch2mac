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
    constant _16* fp_c3 [[id(0)]];
    texturecube<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
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
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    bool _61 = 0 != as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].y);
    float _63 = 1.0 / _39;
    float _65 = _63 * _45;
    float _67 = _63 * _51;
    float _69 = _63 * _57;
    float _71 = abs(_65);
    float _73 = abs(_67);
    float _75 = precise::max(_71, _73);
    float _77 = abs(_69);
    float _79 = precise::max(_77, _75);
    float _81 = 1.0 / _79;
    float _83 = _65 * _81;
    float _85 = _67 * _81;
    float _87 = _69 * _81;
    float _89 = _63;
    float _91 = _81;
    float _93 = 0.0;
    float _95 = 0.0;
    if (!_61)
    {
        float3 _252 = float3(_83, _85, _87);
        float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_252, float3(0.0), isnan(_252))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_252, float3(0.0), isnan(_252))).xyzw;
        float _100 = _98.x;
        float _102 = _98.y;
        float _104 = _98.z;
        float _106 = _98.w;
        _89 = _100;
        _91 = _102;
        _93 = _104;
        _95 = _106;
    }
    float _108 = _89;
    float _110 = _91;
    float _112 = _93;
    float _114 = _95;
    float _116 = 0.0;
    if (_61)
    {
        _116 = (*spvDescriptorSet0.fp_c3)._m0[7].w;
    }
    float _118 = _116;
    float _120 = _108;
    float _122 = _110;
    float _124 = _112;
    float _126 = _114;
    if (_61)
    {
        float3 _293 = float3(_83, _85, _87);
        float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_293, float3(0.0), isnan(_293)), level(_118)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_293, float3(0.0), isnan(_293)), level(_118)).xyzw;
        float _130 = _128.x;
        float _132 = _128.y;
        float _134 = _128.z;
        float _136 = _128.w;
        _120 = _130;
        _122 = _132;
        _124 = _134;
        _126 = _136;
    }
    float _138 = _120;
    float _140 = _122;
    float _142 = _124;
    float _144 = _126;
    float _146 = abs(_144);
    float _148 = log2(_146);
    float _150 = _148 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _152 = exp2(_150);
    float _154 = _152 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _156 = _154 * _138;
    float _158 = _154 * _140;
    float _160 = _154 * _142;
    float _162 = _144 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = precise::max(0.0, _156);
    float _168 = precise::max(0.0, _158);
    float _170 = precise::max(0.0, _160);
    out.m_32.x = _166;
    out.m_32.y = _168;
    out.m_32.z = _170;
    out.m_32.w = _164;
    return out;
}

