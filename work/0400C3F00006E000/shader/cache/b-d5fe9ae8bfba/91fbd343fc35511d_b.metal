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
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
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
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _218 = float2(_61, _63);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_218, float2(0.0), isnan(_218))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_218, float2(0.0), isnan(_218))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = in.m_33.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_33.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _90 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _88);
    float _94 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _90);
    float _96 = _59 * _80;
    float _98 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].z, _92);
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, _94);
    float _102 = _59 * _86;
    float _104 = _98 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _106 = _100 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _108 = _96 + _104;
    float _110 = _102 + _106;
    float2 _302 = float2(_108, _110);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_302, float2(0.0), isnan(_302))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_302, float2(0.0), isnan(_302))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float _122 = in.m_35.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_35.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_35.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_35.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = _59 * _126;
    float _148 = _59 * _132;
    float _150 = _59 * _138;
    float _152 = _59 * _144;
    float _154 = precise::min(_74, _120);
    float _156 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _158 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _160 = _156 * _146;
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = _158 * _148;
    bool _168 = _162 != 0.0;
    bool _170 = isnan(_162);
    bool _172 = _168 || _170;
    bool _174 = isnan(0.0);
    bool _176 = _172 || _174;
    float _178 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _180 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _182 = _178 * _150;
    float _184 = _180 * _152;
    if (_176)
    {
        out.m_38.x = _164;
        out.m_38.y = _182;
        out.m_38.z = _184;
        out.m_38.w = _162;
        return out;
    }
    discard_fragment();
    return out;
}

