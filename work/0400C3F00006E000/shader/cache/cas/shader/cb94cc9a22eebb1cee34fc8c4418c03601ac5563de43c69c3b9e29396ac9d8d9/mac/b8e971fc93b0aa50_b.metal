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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _49;
    float _89 = _87 * _55;
    float _91 = _87 * _61;
    float _93 = _87 * _67;
    float _95 = _87 * _73;
    float _97 = _87 * _79;
    float _99 = _87 * _85;
    float2 _302 = float2(_89, _91);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_302, float2(0.0), isnan(_302))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_302, float2(0.0), isnan(_302))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float2 _322 = float2(_95, _97);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_322, float2(0.0), isnan(_322))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _338 = float2(_99, _93);
    float _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_338, float2(0.0), isnan(_338))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_338, float2(0.0), isnan(_338))).w;
    float _124 = in.m_39.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_39.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_39.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_39.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _150 = _148 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _152 = _87 * _128;
    float _154 = _87 * _134;
    float _156 = _87 * _140;
    float _158 = _87 * _146;
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _162 = _160 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _164 = fma(_104, _150, (*spvDescriptorSet0.fp_c3)._m0[4].x);
    float _166 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _170 = fma(_110, _162, (*spvDescriptorSet0.fp_c3)._m0[4].w);
    float _172 = fma(_106, _168, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _176 = _174 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _180 = _178 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _182 = _170 * _154;
    float _184 = fma(_114, _176, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _186 = fma(_108, _180, (*spvDescriptorSet0.fp_c3)._m0[4].z);
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _190 = _188 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _192 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _194 = _192 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _196 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _198 = _196 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _200 = fma(_116, _190, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _202 = fma(_118, _194, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _204 = fma(_120, _198, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _206 = fma(_164, _182, _184);
    float _208 = fma(_172, _182, _200);
    float _210 = fma(_186, _182, _202);
    float _212 = _154 * _204;
    float _214 = _152 * _206;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = _156 * _208;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = _158 * _210;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = _212 * _122;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    out.m_42.x = _216;
    out.m_42.y = _220;
    out.m_42.z = _224;
    out.m_42.w = _228;
    return out;
}

