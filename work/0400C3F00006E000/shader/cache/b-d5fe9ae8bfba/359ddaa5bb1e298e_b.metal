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
    float2 _198 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_198, float2(0.0), isnan(_198))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_198, float2(0.0), isnan(_198))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _74 = _64 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _76 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[18].x, _70);
    float _78 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[17].x, _72);
    float _80 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[19].x, _74);
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _76);
    float _84 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _78);
    float _86 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _80);
    float _88 = _82 * 9.9999997473787516355514526367188e-05;
    float _90 = _84 * 9.9999997473787516355514526367188e-05;
    float _92 = _86 * 9.9999997473787516355514526367188e-05;
    float _94 = abs(_88);
    float _96 = log2(_94);
    float _98 = abs(_90);
    float _100 = log2(_98);
    float _102 = abs(_92);
    float _104 = log2(_102);
    float _106 = _96 * 0.1593017578125;
    float _108 = _100 * 0.1593017578125;
    float _110 = exp2(_106);
    float _112 = _104 * 0.1593017578125;
    float _114 = exp2(_108);
    float _116 = exp2(_112);
    float _118 = fma(_110, 18.6875, 1.0);
    float _120 = fma(_114, 18.6875, 1.0);
    float _122 = 1.0 / _118;
    float _124 = fma(_116, 18.6875, 1.0);
    float _126 = 1.0 / _120;
    float _128 = fma(_110, 18.8515625, 0.8359375);
    float _130 = fma(_114, 18.8515625, 0.8359375);
    float _132 = 1.0 / _124;
    float _134 = fma(_116, 18.8515625, 0.8359375);
    float _136 = _128 * _122;
    float _138 = _130 * _126;
    float _140 = abs(_136);
    float _142 = log2(_140);
    float _144 = _134 * _132;
    float _146 = abs(_138);
    float _148 = log2(_146);
    float _150 = abs(_144);
    float _152 = log2(_150);
    float _154 = _142 * 78.84375;
    float _156 = _148 * 78.84375;
    float _158 = exp2(_154);
    float _160 = _152 * 78.84375;
    float _162 = exp2(_156);
    float _164 = exp2(_160);
    out.m_32.x = _162;
    out.m_32.y = _158;
    out.m_32.z = _164;
    out.m_32.w = _68;
    return out;
}

