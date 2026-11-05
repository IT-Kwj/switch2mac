#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
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
    float _61 = _57 * _55;
    float2 _310 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_310, float2(0.0), isnan(_310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_310, float2(0.0), isnan(_310))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _327 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_327, float2(0.0), isnan(_327))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_327, float2(0.0), isnan(_327))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _57 * _88;
    float _92 = _76 + _67;
    float _94 = _78 + _69;
    float _96 = _80 + _71;
    float _98 = _92 * _90;
    float _100 = _94 * _90;
    float _102 = _96 * _90;
    float _104 = spvFAdd(_98, 1.0);
    float _106 = spvFAdd(_100, 1.0);
    float _108 = spvFAdd(_102, 1.0);
    float _110 = _100 * 0.586600005626678466796875;
    float _112 = 1.0 / _104;
    float _114 = fma(_98, 0.29890000820159912109375, _110);
    float _116 = fma(_102, 0.1143999993801116943359375, _114);
    float _118 = 1.0 / _106;
    float _120 = _116 * (-1.44269502162933349609375);
    float _122 = 1.0 / _108;
    float _124 = _98 * _112;
    float _126 = _100 * _118;
    float _128 = abs(_124);
    float _130 = log2(_128);
    float _132 = _102 * _122;
    float _134 = exp2(_120);
    float _136 = abs(_126);
    float _138 = log2(_136);
    float _140 = _130 * 2.2000000476837158203125;
    float _142 = abs(_132);
    float _144 = log2(_142);
    float _146 = -_134;
    float _148 = _146 + 1.0;
    bool _152 = _148 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _154 = isnan(_148);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _160 = _156 || _158;
    float _162 = _138 * 2.2000000476837158203125;
    float _164 = exp2(_140);
    float _166 = _144 * 2.2000000476837158203125;
    float _168 = exp2(_162);
    float _170 = _108;
    if (!_160)
    {
        _170 = _148;
    }
    float _172 = _170;
    float _174 = exp2(_166);
    bool _176 = !_160;
    float _178 = _172;
    if (!_176)
    {
        float _180 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _182 = _148 + _180;
        float _184 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _186 = spvFAdd(_184, 1.00000095367431640625);
        float _188 = 1.0 / _186;
        float _190 = _182 * _188;
        float _192 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _194 = _192 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _196 = -_190;
        float _198 = _196 + 1.0;
        float _200 = _194 * _188;
        float _202 = _200 + (-1.0);
        float _204 = abs(_198);
        float _206 = log2(_204);
        float _208 = _200 * _190;
        float _210 = _206 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _212 = exp2(_210);
        float _214 = fma(_202, _212, 1.0);
        float _216 = 1.0 / _214;
        float _218 = _208 * _216;
        float _220 = fma(_186, _218, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _178 = _220;
    }
    float _222 = _178;
    float _224 = -_148;
    float _226 = _224 + _222;
    float _228 = _168 * 0.586600005626678466796875;
    float _230 = _226 + 1.0;
    float _232 = fma(_164, 0.29890000820159912109375, _228);
    float _234 = fma(_174, 0.1143999993801116943359375, _232);
    float _236 = abs(_230);
    float _238 = log2(_236);
    float _240 = spvFAdd(_234, 9.9999999747524270787835121154785e-07);
    float _242 = 1.0 / _240;
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _246 = exp2(_244);
    float _248 = fma(_164, _242, -1.0);
    float _250 = fma(_168, _242, -1.0);
    float _252 = fma(_174, _242, -1.0);
    float _254 = fma(_246, _248, 1.0);
    float _256 = fma(_246, _250, 1.0);
    float _258 = fma(_246, _252, 1.0);
    float _260 = _254 * _222;
    float _262 = _256 * _222;
    float _264 = _258 * _222;
    float _266 = precise::max(0.0, _260);
    float _268 = precise::max(0.0, _262);
    float _270 = precise::max(0.0, _264);
    float _272 = precise::min(_266, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _274 = precise::min(_268, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _276 = precise::min(_270, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _272;
    out.m_36.y = _274;
    out.m_36.z = _276;
    out.m_36.w = _82;
    return out;
}

