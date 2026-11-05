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
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float _65 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[8].z, -0.5);
    float _67 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[8].w, -0.5);
    float _69 = floor(_65);
    float _71 = floor(_67);
    float _73 = _69 + 0.5;
    float _75 = _73 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _77 = _71 + 0.5;
    float _79 = _77 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float2 _308 = float2(_75, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_308, float2(0.0), isnan(_308)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float2 _327 = float2(_61, _63);
    float _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_327, float2(0.0), isnan(_327))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_327, float2(0.0), isnan(_327))).x;
    float _94 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _96 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _98 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _100 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _104 = _94 + _102;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _108 = _96 + _106;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _112 = _98 + _110;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _116 = _100 + _114;
    float _118 = precise::max(0.0, _104);
    float _120 = precise::max(0.0, _108);
    float _122 = precise::max(0.0, _112);
    float _124 = precise::max(_118, _92);
    float _126 = precise::max(_120, _92);
    float _128 = precise::max(_122, _92);
    float _130 = precise::max(0.0, _116);
    float _132 = _124 + _126;
    float _134 = precise::max(_130, _92);
    float _136 = _128 + _132;
    float _138 = -_134;
    bool _142 = _136 != _138;
    bool _144 = isnan(_136);
    bool _146 = _142 || _144;
    bool _148 = isnan(_138);
    bool _150 = _146 || _148;
    if (!_150)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        out.m_38.x = 0.0;
        return out;
    }
    float _152 = _79 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _154 = _75 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _443 = float2(_154, _152);
    float4 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).xyzw;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _156.w;
    float2 _459 = float2(_75, _152);
    float4 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_459, float2(0.0), isnan(_459))).xyzw;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float2 _475 = float2(_154, _79);
    float4 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_475, float2(0.0), isnan(_475))).xyzw;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _176.w;
    float2 _491 = float2(_75, _79);
    float4 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).xyzw;
    float _188 = _186.x;
    float _190 = _186.y;
    float _192 = _186.z;
    float _194 = _186.w;
    float _196 = _134 + _136;
    float _198 = -_134;
    bool _200 = _136 > _198;
    float _202 = 1.0 / _196;
    float _204 = _126 * _164;
    float _206 = _126 * _158;
    float _208 = _126 * _160;
    float _210 = _126 * _162;
    float _212 = fma(_124, _174, _204);
    float _214 = fma(_124, _168, _206);
    float _216 = fma(_124, _170, _208);
    float _218 = fma(_124, _172, _210);
    float _220 = fma(_128, _184, _212);
    float _222 = _200 ? _202 : 1.0;
    float _224 = fma(_128, _178, _214);
    float _226 = fma(_128, _180, _216);
    float _228 = fma(_128, _182, _218);
    float _230 = fma(_134, _194, _220);
    float _232 = fma(_134, _188, _224);
    float _234 = fma(_134, _190, _226);
    float _236 = fma(_134, _192, _228);
    float _238 = _230 * _222;
    float _240 = _232 * _222;
    float _242 = _234 * _222;
    float _244 = _236 * _222;
    out.m_36.x = _240;
    out.m_36.y = _242;
    out.m_36.z = _244;
    out.m_36.w = _238;
    out.m_38.x = _238;
    return out;
}

