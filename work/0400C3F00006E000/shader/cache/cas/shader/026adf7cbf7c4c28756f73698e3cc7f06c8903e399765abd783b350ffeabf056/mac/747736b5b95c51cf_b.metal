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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _45;
    float _73 = _71 * _51;
    float _75 = _71 * _57;
    float _77 = _71 * _63;
    float _79 = _71 * _69;
    float2 _268 = float2(_73, _75);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_268, float2(0.0), isnan(_268))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_268, float2(0.0), isnan(_268))).x;
    float2 _279 = float2(_77, _79);
    float4 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_279, float2(0.0), isnan(_279))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_279, float2(0.0), isnan(_279))).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float _94 = in.m_35.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_35.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_35.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_35.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = -(*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _120 = (*spvDescriptorSet0.fp_c3)._m0[18].x + _118;
    float _122 = (*spvDescriptorSet0.fp_c3)._m0[18].x + (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _124 = -_120;
    float _126 = _124 + _122;
    float _128 = 1.0 / _126;
    float _130 = _71 * _98;
    float _132 = _71 * _104;
    float _134 = _71 * _110;
    float _136 = _71 * _116;
    float _138 = -_120;
    float _140 = _138 + _81;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _144 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _146 = _140 * _128;
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = fma(_86, _144, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _156 = fma(_148, -2.0, 3.0);
    float _158 = _148 * _148;
    float _160 = fma(_92, _154, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _162 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _166 = -_158;
    float _168 = fma(_156, _166, 1.0);
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _172 = _170 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    bool _176 = (*spvDescriptorSet0.fp_c3)._m0[18].z >= 0.5;
    bool _178 = isnan((*spvDescriptorSet0.fp_c3)._m0[18].z);
    bool _180 = _176 || _178;
    bool _182 = isnan(0.5);
    bool _184 = _180 || _182;
    float _186 = float(_184);
    float _188 = fma(_88, _164, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _190 = -_168;
    float _192 = fma(_156, _158, _190);
    float _194 = fma(_90, _172, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _196 = _160 * _136;
    float _198 = _150 * _130;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = fma(_186, _192, _168);
    float _204 = _188 * _132;
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = _194 * _134;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = _196 * _202;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    out.m_38.x = _200;
    out.m_38.y = _206;
    out.m_38.z = _210;
    out.m_38.w = _214;
    return out;
}

