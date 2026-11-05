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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _214 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_214, float2(0.0), isnan(_214))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_214, float2(0.0), isnan(_214))).x;
    float2 _226 = float2(_59, _61);
    float4 _66 = spvDescriptorSet0.fp_t_tcb_C.gather(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_226, float2(0.0), isnan(_226)), int2(0), component::x).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = in.m_33.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_33.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = _57 * _80;
    float _90 = _57 * _86;
    float _92 = floor(_88);
    float _94 = floor(_90);
    float _96 = -_92;
    float _98 = _88 + _96;
    float _100 = -_94;
    float _102 = _90 + _100;
    float _104 = _63 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _106 = 1.0 / _104;
    float _108 = -_63;
    float _110 = _108 + _74;
    float _112 = -_63;
    float _114 = _112 + _68;
    float _116 = -_63;
    float _118 = _116 + _70;
    float _120 = -_63;
    float _122 = _120 + _72;
    float _124 = abs(_118);
    float _126 = -_124;
    float _128 = abs(_110);
    float _130 = _126 + _128;
    float _132 = abs(_114);
    float _134 = abs(_122);
    float _136 = -_134;
    float _138 = _132 + _136;
    float _140 = _130 + _138;
    float _142 = -_138;
    float _144 = _130 + _142;
    float _146 = _106 * (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _148 = fma(_146, _140, _98);
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = fma(_146, _144, _102);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = 2.0 * (*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _158 = -_98;
    float _160 = _158 + _150;
    float _162 = -_102;
    float _164 = _162 + _154;
    float _166 = 2.0 * (*spvDescriptorSet0.fp_c3)._m0[39].w;
    float _168 = fma(_156, _160, _59);
    float _170 = fma(_166, _164, _61);
    float2 _374 = float2(_168, _170);
    float4 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_374, float2(0.0), isnan(_374))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_374, float2(0.0), isnan(_374))).xyzw;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _172.w;
    out.m_36.x = _174;
    out.m_36.y = _176;
    out.m_36.z = _178;
    out.m_36.w = _180;
    return out;
}

