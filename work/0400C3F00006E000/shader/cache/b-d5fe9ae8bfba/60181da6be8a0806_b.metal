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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
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
    float _61 = fma(_59, (*spvDescriptorSet0.fp_c3)._m0[8].z, -0.5);
    float _63 = _57 * _55;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[8].w, -0.5);
    float _67 = floor(_61);
    float _69 = floor(_65);
    float _71 = _67 + 0.5;
    float _73 = _71 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _75 = _69 + 0.5;
    float _77 = _75 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float2 _336 = float2(_73, _77);
    float4 _80 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_336, float2(0.0), isnan(_336)), int2(0), component::x).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float _90 = -_82;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _94 = -_84;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _98 = -_86;
    float _100 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _102 = -_88;
    float _104 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _106 = 1.0 / _92;
    float _108 = 1.0 / _96;
    float _110 = 1.0 / _100;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _114 = _106 + _112;
    float _116 = -_106;
    float _118 = _116 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _120 = precise::max(0.0, _114);
    float _122 = 1.0 / _104;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _126 = _108 + _124;
    float _128 = -_108;
    float _130 = _128 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _132 = precise::max(_120, _118);
    float _134 = precise::max(0.0, _126);
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _138 = _110 + _136;
    float _140 = -_110;
    float _142 = _140 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _144 = precise::max(_134, _130);
    float _146 = precise::max(0.0, _138);
    float _148 = _132 + _144;
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _152 = _122 + _150;
    float _154 = precise::max(_146, _142);
    float _156 = -_122;
    float _158 = _156 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _160 = precise::max(0.0, _152);
    float _162 = _154 + _148;
    float _164 = precise::max(_160, _158);
    float _166 = -_164;
    bool _170 = _162 != _166;
    bool _172 = isnan(_162);
    bool _174 = _170 || _172;
    bool _176 = isnan(_166);
    bool _178 = _174 || _176;
    if (!_178)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        out.m_36.x = 0.0;
        return out;
    }
    float _180 = _77 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _182 = _73 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _503 = float2(_182, _180);
    float4 _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_503, float2(0.0), isnan(_503))).xyzw;
    float _186 = _184.x;
    float _188 = _184.y;
    float _190 = _184.z;
    float _192 = _184.w;
    float2 _519 = float2(_73, _180);
    float4 _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_519, float2(0.0), isnan(_519))).xyzw;
    float _196 = _194.x;
    float _198 = _194.y;
    float _200 = _194.z;
    float _202 = _194.w;
    float2 _535 = float2(_182, _77);
    float4 _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_535, float2(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_535, float2(0.0), isnan(_535))).xyzw;
    float _206 = _204.x;
    float _208 = _204.y;
    float _210 = _204.z;
    float _212 = _204.w;
    float2 _551 = float2(_73, _77);
    float4 _214 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_551, float2(0.0), isnan(_551))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_551, float2(0.0), isnan(_551))).xyzw;
    float _216 = _214.x;
    float _218 = _214.y;
    float _220 = _214.z;
    float _222 = _214.w;
    float _224 = _164 + _162;
    float _226 = -_164;
    bool _228 = _162 > _226;
    float _230 = 1.0 / _224;
    float _232 = _144 * _192;
    float _234 = _144 * _186;
    float _236 = _144 * _188;
    float _238 = _144 * _190;
    float _240 = fma(_132, _202, _232);
    float _242 = fma(_132, _196, _234);
    float _244 = fma(_132, _198, _236);
    float _246 = fma(_132, _200, _238);
    float _248 = fma(_154, _212, _240);
    float _250 = _228 ? _230 : 1.0;
    float _252 = fma(_154, _206, _242);
    float _254 = fma(_154, _208, _244);
    float _256 = fma(_154, _210, _246);
    float _258 = fma(_164, _222, _248);
    float _260 = fma(_164, _216, _252);
    float _262 = fma(_164, _218, _254);
    float _264 = fma(_164, _220, _256);
    float _266 = _258 * _250;
    float _268 = _260 * _250;
    float _270 = _262 * _250;
    float _272 = _264 * _250;
    out.m_34.x = _268;
    out.m_34.y = _270;
    out.m_34.z = _272;
    out.m_34.w = _266;
    out.m_36.x = _266;
    return out;
}

