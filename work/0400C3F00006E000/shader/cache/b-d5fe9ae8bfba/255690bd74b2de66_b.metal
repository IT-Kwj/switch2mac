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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _246 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_246, float2(0.0), isnan(_246))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_246, float2(0.0), isnan(_246))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = in.m_31.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = _55 * _76;
    float _80 = _66 * _78;
    float _82 = _64 * _78;
    float _84 = _68 * _78;
    bool _88 = _80 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _90 = isnan(_80);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _96 = _92 || _94;
    bool _98 = _82 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _100 = isnan(_82);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _106 = _102 || _104;
    bool _108 = !_96;
    float _110 = _108 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _112 = !_96;
    float _114 = _112 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _116 = _84 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _118 = isnan(_84);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _124 = _120 || _122;
    bool _126 = !_106;
    float _128 = _126 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _130 = fma(_80, _110, _114);
    bool _132 = !_106;
    float _134 = _132 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _136 = !_124;
    float _138 = _136 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _140 = 1.0 / _130;
    bool _142 = !_124;
    float _144 = _142 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _146 = fma(_82, _128, _134);
    bool _148 = !_106;
    float _150 = _148 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _152 = fma(_84, _138, _144);
    bool _154 = !_106;
    float _156 = _154 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _158 = 1.0 / _146;
    bool _160 = !_96;
    float _162 = _160 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _164 = !_96;
    float _166 = _164 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _168 = 1.0 / _152;
    float _170 = fma(_82, _156, _150);
    float _172 = fma(_80, _162, _166);
    bool _174 = !_124;
    float _176 = _174 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _178 = !_124;
    float _180 = _178 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _182 = _172 * _140;
    float _184 = _170 * _158;
    float _186 = fma(_84, _176, _180);
    float _188 = abs(_182);
    float _190 = log2(_188);
    float _192 = _186 * _168;
    float _194 = abs(_184);
    float _196 = log2(_194);
    float _198 = abs(_192);
    float _200 = log2(_198);
    float _202 = _190 * 0.4545454680919647216796875;
    float _204 = _196 * 0.4545454680919647216796875;
    float _206 = exp2(_202);
    float _208 = _200 * 0.4545454680919647216796875;
    float _210 = exp2(_204);
    float _212 = exp2(_208);
    out.m_34.x = _210;
    out.m_34.y = _206;
    out.m_34.z = _212;
    out.m_34.w = _70;
    return out;
}

