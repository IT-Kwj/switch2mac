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
    float2 _340 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_340, float2(0.0), isnan(_340))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_340, float2(0.0), isnan(_340))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _357 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_357, float2(0.0), isnan(_357))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_357, float2(0.0), isnan(_357))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _57 * _88;
    float _92 = abs(_67);
    float _94 = log2(_92);
    float _96 = abs(_69);
    float _98 = log2(_96);
    float _100 = abs(_71);
    float _102 = log2(_100);
    float _104 = _94 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _106 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = exp2(_104);
    float _110 = _102 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _112 = exp2(_106);
    float _114 = exp2(_110);
    float _116 = _76 + _108;
    float _118 = _116 * _90;
    float _120 = _78 + _112;
    float _122 = _118 * (-1.44269502162933349609375);
    float _124 = _120 * _90;
    float _126 = exp2(_122);
    float _128 = _80 + _114;
    float _130 = _124 * (-1.44269502162933349609375);
    float _132 = _124 * 0.586600005626678466796875;
    float _134 = _128 * _90;
    float _136 = fma(_118, 0.29890000820159912109375, _132);
    float _138 = exp2(_130);
    float _140 = _134 * (-1.44269502162933349609375);
    float _142 = fma(_134, 0.1143999993801116943359375, _136);
    float _144 = _142 * (-1.44269502162933349609375);
    float _146 = exp2(_140);
    float _148 = -_126;
    float _150 = _148 + 1.0;
    float _152 = -_138;
    float _154 = _152 + 1.0;
    float _156 = abs(_150);
    float _158 = log2(_156);
    float _160 = -_146;
    float _162 = _160 + 1.0;
    float _164 = exp2(_144);
    float _166 = abs(_154);
    float _168 = log2(_166);
    float _170 = _158 * 2.2000000476837158203125;
    float _172 = abs(_162);
    float _174 = log2(_172);
    float _176 = -_164;
    float _178 = _176 + 1.0;
    bool _182 = _178 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _184 = isnan(_178);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _190 = _186 || _188;
    float _192 = _168 * 2.2000000476837158203125;
    float _194 = exp2(_170);
    float _196 = _174 * 2.2000000476837158203125;
    float _198 = exp2(_192);
    float _200 = _168;
    if (!_190)
    {
        _200 = _178;
    }
    float _202 = _200;
    float _204 = exp2(_196);
    bool _206 = !_190;
    float _208 = _202;
    if (!_206)
    {
        float _210 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _212 = _178 + _210;
        float _214 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _216 = spvFAdd(_214, 1.00000095367431640625);
        float _218 = 1.0 / _216;
        float _220 = _212 * _218;
        float _222 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _226 = -_220;
        float _228 = _226 + 1.0;
        float _230 = _224 * _218;
        float _232 = _230 + (-1.0);
        float _234 = abs(_228);
        float _236 = log2(_234);
        float _238 = _230 * _220;
        float _240 = _236 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _242 = exp2(_240);
        float _244 = fma(_232, _242, 1.0);
        float _246 = 1.0 / _244;
        float _248 = _238 * _246;
        float _250 = fma(_216, _248, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _208 = _250;
    }
    float _252 = _208;
    float _254 = -_178;
    float _256 = _254 + _252;
    float _258 = _198 * 0.586600005626678466796875;
    float _260 = _256 + 1.0;
    float _262 = fma(_194, 0.29890000820159912109375, _258);
    float _264 = fma(_204, 0.1143999993801116943359375, _262);
    float _266 = abs(_260);
    float _268 = log2(_266);
    float _270 = spvFAdd(_264, 9.9999999747524270787835121154785e-07);
    float _272 = 1.0 / _270;
    float _274 = _268 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _276 = exp2(_274);
    float _278 = fma(_194, _272, -1.0);
    float _280 = fma(_198, _272, -1.0);
    float _282 = fma(_204, _272, -1.0);
    float _284 = fma(_276, _278, 1.0);
    float _286 = fma(_276, _280, 1.0);
    float _288 = fma(_276, _282, 1.0);
    float _290 = _284 * _252;
    float _292 = _286 * _252;
    float _294 = _288 * _252;
    float _296 = precise::max(0.0, _290);
    float _298 = precise::max(0.0, _292);
    float _300 = precise::max(0.0, _294);
    float _302 = precise::min(_296, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _304 = precise::min(_298, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _306 = precise::min(_300, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _302;
    out.m_36.y = _304;
    out.m_36.z = _306;
    out.m_36.w = _82;
    return out;
}

