#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
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
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _252 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_252, float2(0.0), isnan(_252)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_252, float2(0.0), isnan(_252)), level(0.0)).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    bool _72 = _68 >= 0.001000000047497451305389404296875;
    bool _74 = isnan(_68);
    bool _76 = _72 || _74;
    bool _78 = isnan(0.001000000047497451305389404296875);
    bool _80 = _76 || _78;
    if (!_80)
    {
        discard_fragment();
    }
    if (!_80)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    float _82 = _55 + (-0.001953125);
    float _84 = _57 + (-0.001953125);
    float _86 = _57 + 0.001953125;
    float _88 = _55 + 0.001953125;
    float2 _307 = float2(_82, _84);
    float3 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_307, float2(0.0), isnan(_307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_307, float2(0.0), isnan(_307)), level(0.0)).xyz;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float2 _321 = float2(_82, _86);
    float3 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_321, float2(0.0), isnan(_321)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_321, float2(0.0), isnan(_321)), level(0.0)).xyz;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float2 _335 = float2(_88, _86);
    float3 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_335, float2(0.0), isnan(_335)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_335, float2(0.0), isnan(_335)), level(0.0)).xyz;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float2 _349 = float2(_88, _84);
    float3 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_349, float2(0.0), isnan(_349)), level(0.0)).xyz;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = in.m_29.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_29.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[637].w;
    float _138 = spvFAdd(_136, 50.0);
    float _140 = 1.0 / _138;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[638].x;
    float _144 = _142 + (*spvDescriptorSet0.fp_c3)._m0[640].x;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[638].y;
    float _148 = _146 + (*spvDescriptorSet0.fp_c3)._m0[640].y;
    float _150 = _53 * _128;
    float _152 = _53 * _134;
    float _154 = abs(_150);
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[637].w;
    float _158 = _154 + _156;
    float _160 = _158 * _140;
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[638].z;
    float _166 = _164 + (*spvDescriptorSet0.fp_c3)._m0[640].z;
    float _168 = fma(_162, _144, (*spvDescriptorSet0.fp_c3)._m0[638].x);
    float _170 = fma(_162, _148, (*spvDescriptorSet0.fp_c3)._m0[638].y);
    float _172 = fma(_162, _166, (*spvDescriptorSet0.fp_c3)._m0[638].z);
    float _174 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[637].x, _168);
    float _176 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[637].y, _170);
    float _178 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[637].z, _172);
    float _180 = _94 + _102;
    float _182 = _96 + _104;
    float _184 = _98 + _106;
    float _186 = _68 * (*spvDescriptorSet0.fp_c3)._m0[633].y;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = _110 + _180;
    float _192 = _112 + _182;
    float _194 = _114 + _184;
    float _196 = _118 + _190;
    float _198 = _120 + _192;
    float _200 = _122 + _194;
    float _202 = fma(_62, 2.0, _196);
    float _204 = fma(_64, 2.0, _198);
    float _206 = fma(_66, 2.0, _200);
    float _208 = _202 * 0.16665999591350555419921875;
    float _210 = _204 * 0.16665999591350555419921875;
    float _212 = _206 * 0.16665999591350555419921875;
    float _214 = _208 * _174;
    float _216 = _210 * _176;
    float _218 = _212 * _178;
    out.m_32.x = _214;
    out.m_32.y = _216;
    out.m_32.z = _218;
    out.m_32.w = _188;
    return out;
}

