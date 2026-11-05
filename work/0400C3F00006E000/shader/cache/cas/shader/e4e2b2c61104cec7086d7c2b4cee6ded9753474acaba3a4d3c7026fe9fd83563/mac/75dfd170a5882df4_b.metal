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
    float2 _296 = float2(_73, _77);
    float4 _80 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_296, float2(0.0), isnan(_296)), int2(0), component::x).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float _90 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _92 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _94 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _96 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _100 = _90 + _98;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _104 = _92 + _102;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _108 = _94 + _106;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _112 = _96 + _110;
    float _114 = precise::max(0.0, _100);
    float _116 = precise::max(0.0, _104);
    float _118 = precise::max(0.0, _108);
    float _120 = precise::max(0.0, _112);
    float _122 = _114 + _116;
    float _124 = _118 + _122;
    float _126 = -_120;
    bool _130 = _124 != _126;
    bool _132 = isnan(_124);
    bool _134 = _130 || _132;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    if (!_138)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        out.m_36.x = 0.0;
        return out;
    }
    float _140 = _77 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _142 = _73 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _411 = float2(_142, _140);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float2 _427 = float2(_73, _140);
    float4 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).xyzw;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    float _162 = _154.w;
    float2 _443 = float2(_142, _77);
    float4 _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).xyzw;
    float _166 = _164.x;
    float _168 = _164.y;
    float _170 = _164.z;
    float _172 = _164.w;
    float2 _459 = float2(_73, _77);
    float4 _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_459, float2(0.0), isnan(_459))).xyzw;
    float _176 = _174.x;
    float _178 = _174.y;
    float _180 = _174.z;
    float _182 = _174.w;
    float _184 = _120 + _124;
    float _186 = -_120;
    bool _188 = _124 > _186;
    float _190 = 1.0 / _184;
    float _192 = _116 * _152;
    float _194 = _116 * _146;
    float _196 = _116 * _148;
    float _198 = _116 * _150;
    float _200 = fma(_114, _162, _192);
    float _202 = fma(_114, _156, _194);
    float _204 = fma(_114, _158, _196);
    float _206 = fma(_114, _160, _198);
    float _208 = fma(_118, _172, _200);
    float _210 = fma(_118, _166, _202);
    float _212 = _188 ? _190 : 1.0;
    float _214 = fma(_118, _168, _204);
    float _216 = fma(_118, _170, _206);
    float _218 = fma(_120, _182, _208);
    float _220 = fma(_120, _176, _210);
    float _222 = fma(_120, _178, _214);
    float _224 = fma(_120, _180, _216);
    float _226 = _218 * _212;
    float _228 = _220 * _212;
    float _230 = _222 * _212;
    float _232 = _224 * _212;
    out.m_34.x = _228;
    out.m_34.y = _230;
    out.m_34.z = _232;
    out.m_34.w = _226;
    out.m_36.x = _226;
    return out;
}

