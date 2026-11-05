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
    float2 _324 = float2(_75, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_324, float2(0.0), isnan(_324)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float2 _343 = float2(_61, _63);
    float _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_343, float2(0.0), isnan(_343))).x;
    float _94 = -_86;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _98 = -_84;
    float _100 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _102 = -_88;
    float _104 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _106 = -_90;
    float _108 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _110 = 1.0 / _100;
    float _112 = 1.0 / _96;
    float _114 = 1.0 / _104;
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _118 = _110 + _116;
    float _120 = precise::max(0.0, _118);
    float _122 = 1.0 / _108;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _126 = _112 + _124;
    float _128 = precise::max(_120, _92);
    float _130 = precise::max(0.0, _126);
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _134 = _114 + _132;
    float _136 = precise::max(_130, _92);
    float _138 = precise::max(0.0, _134);
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _142 = _122 + _140;
    float _144 = precise::max(_138, _92);
    float _146 = _128 + _136;
    float _148 = precise::max(0.0, _142);
    float _150 = _144 + _146;
    float _152 = precise::max(_148, _92);
    float _154 = -_152;
    bool _158 = _150 != _154;
    bool _160 = isnan(_150);
    bool _162 = _158 || _160;
    bool _164 = isnan(_154);
    bool _166 = _162 || _164;
    if (!_166)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        out.m_38.x = 0.0;
        return out;
    }
    float _168 = _79 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _170 = _75 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _475 = float2(_170, _168);
    float4 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_475, float2(0.0), isnan(_475))).xyzw;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _172.w;
    float2 _491 = float2(_75, _168);
    float4 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).xyzw;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = _182.z;
    float _190 = _182.w;
    float2 _507 = float2(_170, _79);
    float4 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_507, float2(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_507, float2(0.0), isnan(_507))).xyzw;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = _192.w;
    float2 _523 = float2(_75, _79);
    float4 _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).xyzw;
    float _204 = _202.x;
    float _206 = _202.y;
    float _208 = _202.z;
    float _210 = _202.w;
    float _212 = _152 + _150;
    float _214 = -_152;
    bool _216 = _150 > _214;
    float _218 = 1.0 / _212;
    float _220 = _136 * _180;
    float _222 = _136 * _174;
    float _224 = _136 * _176;
    float _226 = _136 * _178;
    float _228 = fma(_128, _190, _220);
    float _230 = fma(_128, _184, _222);
    float _232 = fma(_128, _186, _224);
    float _234 = fma(_128, _188, _226);
    float _236 = fma(_144, _200, _228);
    float _238 = _216 ? _218 : 1.0;
    float _240 = fma(_144, _194, _230);
    float _242 = fma(_144, _196, _232);
    float _244 = fma(_144, _198, _234);
    float _246 = fma(_152, _210, _236);
    float _248 = fma(_152, _204, _240);
    float _250 = fma(_152, _206, _242);
    float _252 = fma(_152, _208, _244);
    float _254 = _246 * _238;
    float _256 = _248 * _238;
    float _258 = _250 * _238;
    float _260 = _252 * _238;
    out.m_36.x = _256;
    out.m_36.y = _258;
    out.m_36.z = _260;
    out.m_36.w = _254;
    out.m_38.x = _254;
    return out;
}

