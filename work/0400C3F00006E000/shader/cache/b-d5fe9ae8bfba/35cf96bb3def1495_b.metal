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
    float2 _312 = float2(_73, _77);
    float4 _80 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_312, float2(0.0), isnan(_312)), int2(0), component::x).xyzw;
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
    float _116 = precise::max(0.0, _114);
    float _118 = 1.0 / _104;
    float _120 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _122 = _108 + _120;
    float _124 = precise::max(0.0, _122);
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _128 = _110 + _126;
    float _130 = _116 + _124;
    float _132 = precise::max(0.0, _128);
    float _134 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _136 = _118 + _134;
    float _138 = _132 + _130;
    float _140 = precise::max(0.0, _136);
    float _142 = -_140;
    bool _146 = _138 != _142;
    bool _148 = isnan(_138);
    bool _150 = _146 || _148;
    bool _152 = isnan(_142);
    bool _154 = _150 || _152;
    if (!_154)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        out.m_36.x = 0.0;
        return out;
    }
    float _156 = _77 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _158 = _73 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _443 = float2(_158, _156);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float2 _459 = float2(_73, _156);
    float4 _170 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_459, float2(0.0), isnan(_459))).xyzw;
    float _172 = _170.x;
    float _174 = _170.y;
    float _176 = _170.z;
    float _178 = _170.w;
    float2 _475 = float2(_158, _77);
    float4 _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_475, float2(0.0), isnan(_475))).xyzw;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = _180.w;
    float2 _491 = float2(_73, _77);
    float4 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).xyzw;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = _190.w;
    float _200 = _140 + _138;
    float _202 = -_140;
    bool _204 = _138 > _202;
    float _206 = 1.0 / _200;
    float _208 = _124 * _168;
    float _210 = _124 * _162;
    float _212 = _124 * _164;
    float _214 = _124 * _166;
    float _216 = fma(_116, _178, _208);
    float _218 = fma(_116, _172, _210);
    float _220 = fma(_116, _174, _212);
    float _222 = fma(_116, _176, _214);
    float _224 = fma(_132, _188, _216);
    float _226 = fma(_132, _182, _218);
    float _228 = fma(_132, _184, _220);
    float _230 = _204 ? _206 : 1.0;
    float _232 = fma(_132, _186, _222);
    float _234 = fma(_140, _198, _224);
    float _236 = fma(_140, _192, _226);
    float _238 = fma(_140, _194, _228);
    float _240 = fma(_140, _196, _232);
    float _242 = _234 * _230;
    float _244 = _236 * _230;
    float _246 = _238 * _230;
    float _248 = _240 * _230;
    out.m_34.x = _244;
    out.m_34.y = _246;
    out.m_34.z = _248;
    out.m_34.w = _242;
    out.m_36.x = _242;
    return out;
}

