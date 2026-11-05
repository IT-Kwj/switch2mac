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
    float2 _286 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_286, float2(0.0), isnan(_286))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_286, float2(0.0), isnan(_286))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _303 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_303, float2(0.0), isnan(_303))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _57 * _88;
    float _92 = abs(_69);
    float _94 = log2(_92);
    float _96 = abs(_67);
    float _98 = log2(_96);
    float _100 = abs(_71);
    float _102 = log2(_100);
    float _104 = _94 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _106 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = exp2(_104);
    float _110 = _102 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _112 = exp2(_106);
    float _114 = exp2(_110);
    float _116 = _78 + _108;
    float _118 = _116 * _90;
    float _120 = _76 + _112;
    float _122 = _118 * 0.586600005626678466796875;
    float _124 = _120 * _90;
    float _126 = _80 + _114;
    float _128 = fma(_124, 0.29890000820159912109375, _122);
    float _130 = _126 * _90;
    float _132 = fma(_130, 0.1143999993801116943359375, _128);
    float _134 = _132 * (-1.44269502162933349609375);
    float _136 = exp2(_134);
    float _138 = -_136;
    float _140 = _138 + 1.0;
    bool _144 = _140 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _146 = isnan(_140);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _152 = _148 || _150;
    float _154 = _128;
    if (!_152)
    {
        _154 = _140;
    }
    float _156 = _154;
    bool _158 = !_152;
    float _160 = _156;
    if (!_158)
    {
        float _162 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _164 = _140 + _162;
        float _166 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _168 = spvFAdd(_166, 1.00000095367431640625);
        float _170 = 1.0 / _168;
        float _172 = _164 * _170;
        float _174 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _176 = _174 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _178 = -_172;
        float _180 = _178 + 1.0;
        float _182 = _176 * _170;
        float _184 = _182 + (-1.0);
        float _186 = abs(_180);
        float _188 = log2(_186);
        float _190 = _182 * _172;
        float _192 = _188 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _194 = exp2(_192);
        float _196 = fma(_184, _194, 1.0);
        float _198 = 1.0 / _196;
        float _200 = _190 * _198;
        float _202 = fma(_168, _200, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _160 = _202;
    }
    float _204 = _160;
    float _206 = -_140;
    float _208 = _206 + _204;
    float _210 = spvFAdd(_132, 9.9999999747524270787835121154785e-07);
    float _212 = _208 + 1.0;
    float _214 = 1.0 / _210;
    float _216 = abs(_212);
    float _218 = log2(_216);
    float _220 = fma(_124, _214, -1.0);
    float _222 = fma(_118, _214, -1.0);
    float _224 = fma(_130, _214, -1.0);
    float _226 = _218 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _228 = exp2(_226);
    float _230 = fma(_228, _220, 1.0);
    float _232 = fma(_228, _222, 1.0);
    float _234 = fma(_228, _224, 1.0);
    float _236 = _230 * _204;
    float _238 = _232 * _204;
    float _240 = _234 * _204;
    float _242 = precise::max(0.0, _236);
    float _244 = precise::max(0.0, _238);
    float _246 = precise::max(0.0, _240);
    float _248 = precise::min(_242, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _250 = precise::min(_244, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _252 = precise::min(_246, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _248;
    out.m_36.y = _250;
    out.m_36.z = _252;
    out.m_36.w = _82;
    return out;
}

