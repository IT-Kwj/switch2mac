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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_CSmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _226 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_226, float2(0.0), isnan(_226))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_226, float2(0.0), isnan(_226))).x;
    float _65 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[8].z, -0.5);
    float _67 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[8].w, -0.5);
    float _69 = floor(_65);
    float _71 = floor(_67);
    float _73 = _69 + 0.5;
    float _75 = _73 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _77 = _71 + 0.5;
    float _79 = _77 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _81 = precise::max(0.0, _63);
    float _83 = fma(_81, 2.0, _81);
    float _85 = -_81;
    bool _89 = _83 != _85;
    bool _91 = isnan(_83);
    bool _93 = _89 || _91;
    bool _95 = isnan(_85);
    bool _97 = _93 || _95;
    if (!_97)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        out.m_36.x = 0.0;
        return out;
    }
    float _99 = _79 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _101 = _75 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _306 = float2(_101, _99);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_306, float2(0.0), isnan(_306))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_306, float2(0.0), isnan(_306))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float2 _322 = float2(_75, _99);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_322, float2(0.0), isnan(_322))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float2 _338 = float2(_101, _79);
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_338, float2(0.0), isnan(_338))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_338, float2(0.0), isnan(_338))).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float2 _354 = float2(_75, _79);
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_354, float2(0.0), isnan(_354))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_354, float2(0.0), isnan(_354))).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float _144 = _81 + _83;
    float _146 = -_81;
    bool _148 = _83 > _146;
    float _150 = 1.0 / _144;
    float _152 = _81 * _112;
    float _154 = _81 * _106;
    float _156 = _81 * _108;
    float _158 = _81 * _110;
    float _160 = fma(_81, _122, _152);
    float _162 = fma(_81, _116, _154);
    float _164 = fma(_81, _118, _156);
    float _166 = fma(_81, _120, _158);
    float _168 = fma(_81, _132, _160);
    float _170 = _148 ? _150 : 1.0;
    float _172 = fma(_81, _126, _162);
    float _174 = fma(_81, _128, _164);
    float _176 = fma(_81, _130, _166);
    float _178 = fma(_81, _142, _168);
    float _180 = fma(_81, _136, _172);
    float _182 = fma(_81, _138, _174);
    float _184 = fma(_81, _140, _176);
    float _186 = _178 * _170;
    float _188 = _180 * _170;
    float _190 = _182 * _170;
    float _192 = _184 * _170;
    out.m_34.x = _188;
    out.m_34.y = _190;
    out.m_34.z = _192;
    out.m_34.w = _186;
    out.m_36.x = _186;
    return out;
}

