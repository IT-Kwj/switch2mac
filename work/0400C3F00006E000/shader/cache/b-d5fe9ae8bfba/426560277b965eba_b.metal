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
    float2 _370 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_370, float2(0.0), isnan(_370))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_370, float2(0.0), isnan(_370))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _387 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_387, float2(0.0), isnan(_387))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _57 * _88;
    float _92 = _78 + _69;
    float _94 = _76 + _67;
    float _96 = _92 * _90;
    float _98 = _80 + _71;
    float _100 = _94 * _90;
    float _102 = _96 * 0.586600005626678466796875;
    float _104 = _98 * _90;
    float _106 = fma(_100, 0.29890000820159912109375, _102);
    bool _110 = _100 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _112 = isnan(_100);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _118 = _114 || _116;
    bool _120 = _96 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _122 = isnan(_96);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _128 = _124 || _126;
    float _130 = fma(_104, 0.1143999993801116943359375, _106);
    bool _132 = !_118;
    float _134 = _132 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _136 = !_118;
    float _138 = _136 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _140 = _130 * (-1.44269502162933349609375);
    bool _142 = _104 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _144 = isnan(_104);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _150 = _146 || _148;
    float _152 = fma(_100, _134, _138);
    bool _154 = !_128;
    float _156 = _154 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _158 = exp2(_140);
    bool _160 = !_128;
    float _162 = _160 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _164 = !_150;
    float _166 = _164 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _168 = !_150;
    float _170 = _168 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _172 = fma(_96, _156, _162);
    bool _174 = !_128;
    float _176 = _174 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _178 = 1.0 / _152;
    float _180 = fma(_104, _166, _170);
    float _182 = -_158;
    float _184 = _182 + 1.0;
    float _186 = 1.0 / _172;
    bool _188 = !_128;
    float _190 = _188 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _192 = _184 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _194 = isnan(_184);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _200 = _196 || _198;
    float _202 = fma(_96, _176, _190);
    bool _204 = !_118;
    float _206 = _204 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _208 = 1.0 / _180;
    bool _210 = !_118;
    float _212 = _210 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _214 = !_150;
    float _216 = _214 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _218 = !_150;
    float _220 = _218 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _222 = _96;
    if (!_200)
    {
        _222 = _184;
    }
    float _224 = _222;
    bool _226 = !_200;
    float _228 = _224;
    if (!_226)
    {
        float _230 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _232 = _184 + _230;
        float _234 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _236 = spvFAdd(_234, 1.00000095367431640625);
        float _238 = 1.0 / _236;
        float _240 = _232 * _238;
        float _242 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _246 = -_240;
        float _248 = _246 + 1.0;
        float _250 = _244 * _238;
        float _252 = _250 + (-1.0);
        float _254 = abs(_248);
        float _256 = log2(_254);
        float _258 = _250 * _240;
        float _260 = _256 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _262 = exp2(_260);
        float _264 = fma(_252, _262, 1.0);
        float _266 = 1.0 / _264;
        float _268 = _258 * _266;
        float _270 = fma(_236, _268, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _228 = _270;
    }
    float _272 = _228;
    float _274 = -_184;
    float _276 = _274 + _272;
    float _278 = fma(_100, _206, _212);
    float _280 = _202 * _186;
    float _282 = fma(_104, _216, _220);
    float _284 = _276 + 1.0;
    float _286 = _278 * _178;
    float _288 = _280 * 0.586600005626678466796875;
    float _290 = _282 * _208;
    float _292 = abs(_284);
    float _294 = log2(_292);
    float _296 = fma(_286, 0.29890000820159912109375, _288);
    float _298 = fma(_290, 0.1143999993801116943359375, _296);
    float _300 = spvFAdd(_298, 9.9999999747524270787835121154785e-07);
    float _302 = 1.0 / _300;
    float _304 = _294 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _306 = exp2(_304);
    float _308 = fma(_286, _302, -1.0);
    float _310 = fma(_280, _302, -1.0);
    float _312 = fma(_290, _302, -1.0);
    float _314 = fma(_306, _308, 1.0);
    float _316 = fma(_306, _310, 1.0);
    float _318 = fma(_306, _312, 1.0);
    float _320 = _314 * _272;
    float _322 = _316 * _272;
    float _324 = _318 * _272;
    float _326 = precise::max(0.0, _320);
    float _328 = precise::max(0.0, _322);
    float _330 = precise::max(0.0, _324);
    float _332 = precise::min(_326, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _334 = precise::min(_328, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _336 = precise::min(_330, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _332;
    out.m_36.y = _334;
    out.m_36.z = _336;
    out.m_36.w = _82;
    return out;
}

