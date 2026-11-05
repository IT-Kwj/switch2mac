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
    float2 _316 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_316, float2(0.0), isnan(_316))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_316, float2(0.0), isnan(_316))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _333 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_333, float2(0.0), isnan(_333))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_333, float2(0.0), isnan(_333))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _57 * _88;
    float _92 = _78 + _69;
    float _94 = _80 + _71;
    float _96 = _76 + _67;
    float _98 = _92 * _90;
    float _100 = _94 * _90;
    float _102 = _96 * _90;
    float _104 = _98 * (-1.44269502162933349609375);
    float _106 = _100 * (-1.44269502162933349609375);
    float _108 = _102 * (-1.44269502162933349609375);
    float _110 = _98 * 0.586600005626678466796875;
    float _112 = exp2(_104);
    float _114 = fma(_102, 0.29890000820159912109375, _110);
    float _116 = fma(_100, 0.1143999993801116943359375, _114);
    float _118 = exp2(_106);
    float _120 = _116 * (-1.44269502162933349609375);
    float _122 = exp2(_108);
    float _124 = -_112;
    float _126 = _124 + 1.0;
    float _128 = -_118;
    float _130 = _128 + 1.0;
    float _132 = exp2(_120);
    float _134 = -_122;
    float _136 = _134 + 1.0;
    float _138 = abs(_130);
    float _140 = log2(_138);
    float _142 = abs(_136);
    float _144 = log2(_142);
    float _146 = -_132;
    float _148 = _146 + 1.0;
    bool _152 = _148 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _154 = isnan(_148);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _160 = _156 || _158;
    float _162 = abs(_126);
    float _164 = log2(_162);
    float _166 = _140 * 2.2000000476837158203125;
    float _168 = _144 * 2.2000000476837158203125;
    float _170 = exp2(_166);
    float _172 = _144;
    if (!_160)
    {
        _172 = _148;
    }
    float _174 = _172;
    float _176 = _164 * 2.2000000476837158203125;
    float _178 = exp2(_168);
    float _180 = exp2(_176);
    bool _182 = !_160;
    float _184 = _174;
    if (!_182)
    {
        float _186 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _188 = _148 + _186;
        float _190 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _192 = spvFAdd(_190, 1.00000095367431640625);
        float _194 = 1.0 / _192;
        float _196 = _188 * _194;
        float _198 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _200 = _198 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _202 = -_196;
        float _204 = _202 + 1.0;
        float _206 = _200 * _194;
        float _208 = _206 + (-1.0);
        float _210 = abs(_204);
        float _212 = log2(_210);
        float _214 = _206 * _196;
        float _216 = _212 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _218 = exp2(_216);
        float _220 = fma(_208, _218, 1.0);
        float _222 = 1.0 / _220;
        float _224 = _214 * _222;
        float _226 = fma(_192, _224, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _184 = _226;
    }
    float _228 = _184;
    float _230 = -_148;
    float _232 = _230 + _228;
    float _234 = _180 * 0.586600005626678466796875;
    float _236 = _232 + 1.0;
    float _238 = fma(_178, 0.29890000820159912109375, _234);
    float _240 = fma(_170, 0.1143999993801116943359375, _238);
    float _242 = abs(_236);
    float _244 = log2(_242);
    float _246 = spvFAdd(_240, 9.9999999747524270787835121154785e-07);
    float _248 = 1.0 / _246;
    float _250 = _244 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _252 = exp2(_250);
    float _254 = fma(_178, _248, -1.0);
    float _256 = fma(_180, _248, -1.0);
    float _258 = fma(_170, _248, -1.0);
    float _260 = fma(_252, _254, 1.0);
    float _262 = fma(_252, _256, 1.0);
    float _264 = fma(_252, _258, 1.0);
    float _266 = _260 * _228;
    float _268 = _262 * _228;
    float _270 = _264 * _228;
    float _272 = precise::max(0.0, _266);
    float _274 = precise::max(0.0, _268);
    float _276 = precise::max(0.0, _270);
    float _278 = precise::min(_272, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _280 = precise::min(_274, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _282 = precise::min(_276, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _278;
    out.m_36.y = _280;
    out.m_36.z = _282;
    out.m_36.w = _82;
    return out;
}

