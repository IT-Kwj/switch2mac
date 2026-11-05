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
    float2 _376 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_376, float2(0.0), isnan(_376))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _393 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).xyzw;
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
    float _124 = _118 * (-1.44269502162933349609375);
    float _126 = _120 * _90;
    float _128 = _80 + _114;
    float _130 = fma(_126, 0.29890000820159912109375, _122);
    float _132 = _126 * (-1.44269502162933349609375);
    float _134 = exp2(_124);
    float _136 = _128 * _90;
    float _138 = fma(_136, 0.1143999993801116943359375, _130);
    float _140 = _136 * (-1.44269502162933349609375);
    float _142 = exp2(_132);
    float _144 = _138 * (-1.44269502162933349609375);
    float _146 = exp2(_144);
    float _148 = 1.0 / _138;
    float _150 = -_142;
    float _152 = _150 + 1.0;
    float _154 = -_146;
    float _156 = _154 + 1.0;
    float _158 = exp2(_140);
    float _160 = _156 * _156;
    bool _164 = _156 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _166 = isnan(_156);
    bool _168 = _164 || _166;
    bool _170 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _172 = _168 || _170;
    float _174 = _156 * _148;
    float _176 = _126 * _174;
    float _178 = -_134;
    float _180 = _178 + 1.0;
    float _182 = _118 * _174;
    float _184 = _136 * _174;
    float _186 = -_176;
    float _188 = _152 + _186;
    float _190 = -_158;
    float _192 = _190 + 1.0;
    float _194 = -_182;
    float _196 = _180 + _194;
    float _198 = _138;
    if (!_172)
    {
        _198 = _156;
    }
    float _200 = _198;
    float _202 = fma(_160, _188, _176);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = -_184;
    float _208 = _192 + _206;
    float _210 = fma(_160, _196, _182);
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = fma(_160, _208, _184);
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = abs(_204);
    float _220 = log2(_218);
    float _222 = abs(_212);
    float _224 = log2(_222);
    float _226 = abs(_216);
    float _228 = log2(_226);
    float _230 = _220 * 0.4545454680919647216796875;
    float _232 = _224 * 0.4545454680919647216796875;
    float _234 = exp2(_230);
    float _236 = _228 * 0.4545454680919647216796875;
    float _238 = exp2(_232);
    bool _240 = !_172;
    float _242 = _200;
    if (!_240)
    {
        float _244 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _246 = _156 + _244;
        float _248 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _250 = spvFAdd(_248, 1.00000095367431640625);
        float _252 = 1.0 / _250;
        float _254 = _246 * _252;
        float _256 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _260 = -_254;
        float _262 = _260 + 1.0;
        float _264 = _258 * _252;
        float _266 = _264 + (-1.0);
        float _268 = abs(_262);
        float _270 = log2(_268);
        float _272 = _264 * _254;
        float _274 = _270 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _276 = exp2(_274);
        float _278 = fma(_266, _276, 1.0);
        float _280 = 1.0 / _278;
        float _282 = _272 * _280;
        float _284 = fma(_250, _282, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _242 = _284;
    }
    float _286 = _242;
    float _288 = -_156;
    float _290 = _288 + _286;
    float _292 = exp2(_236);
    float _294 = _238 * 0.586600005626678466796875;
    float _296 = _290 + 1.0;
    float _298 = fma(_234, 0.29890000820159912109375, _294);
    float _300 = abs(_296);
    float _302 = log2(_300);
    float _304 = fma(_292, 0.1143999993801116943359375, _298);
    float _306 = spvFAdd(_304, 9.9999999747524270787835121154785e-07);
    float _308 = _302 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _310 = 1.0 / _306;
    float _312 = exp2(_308);
    float _314 = fma(_234, _310, -1.0);
    float _316 = fma(_238, _310, -1.0);
    float _318 = fma(_292, _310, -1.0);
    float _320 = fma(_312, _314, 1.0);
    float _322 = fma(_312, _316, 1.0);
    float _324 = fma(_312, _318, 1.0);
    float _326 = _320 * _286;
    float _328 = _322 * _286;
    float _330 = _324 * _286;
    float _332 = precise::max(0.0, _326);
    float _334 = precise::max(0.0, _328);
    float _336 = precise::max(0.0, _330);
    float _338 = precise::min(_332, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _340 = precise::min(_334, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _342 = precise::min(_336, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _338;
    out.m_36.y = _340;
    out.m_36.z = _342;
    out.m_36.w = _82;
    return out;
}

