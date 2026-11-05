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
    float2 _352 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_352, float2(0.0), isnan(_352))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_352, float2(0.0), isnan(_352))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _369 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_369, float2(0.0), isnan(_369))).xyzw;
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
    float _148 = -_134;
    float _150 = _148 + 1.0;
    float _152 = 1.0 / _138;
    float _154 = -_146;
    float _156 = _154 + 1.0;
    float _158 = exp2(_140);
    float _160 = -_142;
    float _162 = _160 + 1.0;
    bool _166 = _156 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _168 = isnan(_156);
    bool _170 = _166 || _168;
    bool _172 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _174 = _170 || _172;
    float _176 = _156 * _152;
    float _178 = _118 * _176;
    float _180 = _126 * _176;
    float _182 = _136 * _176;
    float _184 = _156 * _156;
    float _186 = -_178;
    float _188 = _150 + _186;
    float _190 = _142;
    if (!_174)
    {
        _190 = _156;
    }
    float _192 = _190;
    bool _194 = !_174;
    float _196 = _192;
    if (!_194)
    {
        float _198 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _200 = _156 + _198;
        float _202 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _204 = spvFAdd(_202, 1.00000095367431640625);
        float _206 = 1.0 / _204;
        float _208 = _200 * _206;
        float _210 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _212 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _214 = -_208;
        float _216 = _214 + 1.0;
        float _218 = _212 * _206;
        float _220 = _218 + (-1.0);
        float _222 = abs(_216);
        float _224 = log2(_222);
        float _226 = _218 * _208;
        float _228 = _224 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _230 = exp2(_228);
        float _232 = fma(_220, _230, 1.0);
        float _234 = 1.0 / _232;
        float _236 = _226 * _234;
        float _238 = fma(_204, _236, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _196 = _238;
    }
    float _240 = _196;
    float _242 = -_156;
    float _244 = _242 + _240;
    float _246 = -_180;
    float _248 = _162 + _246;
    float _250 = -_158;
    float _252 = _250 + 1.0;
    float _254 = fma(_184, _188, _178);
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _244 + 1.0;
    float _260 = fma(_184, _248, _180);
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = -_182;
    float _266 = _252 + _264;
    float _268 = _256 * 0.586600005626678466796875;
    float _270 = abs(_258);
    float _272 = log2(_270);
    float _274 = fma(_184, _266, _182);
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = fma(_262, 0.29890000820159912109375, _268);
    float _280 = fma(_276, 0.1143999993801116943359375, _278);
    float _282 = spvFAdd(_280, 9.9999999747524270787835121154785e-07);
    float _284 = _272 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _286 = 1.0 / _282;
    float _288 = exp2(_284);
    float _290 = fma(_262, _286, -1.0);
    float _292 = fma(_256, _286, -1.0);
    float _294 = fma(_276, _286, -1.0);
    float _296 = fma(_288, _290, 1.0);
    float _298 = fma(_288, _292, 1.0);
    float _300 = fma(_288, _294, 1.0);
    float _302 = _296 * _240;
    float _304 = _298 * _240;
    float _306 = _300 * _240;
    float _308 = precise::max(0.0, _302);
    float _310 = precise::max(0.0, _304);
    float _312 = precise::max(0.0, _306);
    float _314 = precise::min(_308, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _316 = precise::min(_310, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _318 = precise::min(_312, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _314;
    out.m_36.y = _316;
    out.m_36.z = _318;
    out.m_36.w = _82;
    return out;
}

