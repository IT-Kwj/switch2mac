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
    float2 _358 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_358, float2(0.0), isnan(_358))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_358, float2(0.0), isnan(_358))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _375 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_375, float2(0.0), isnan(_375))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_375, float2(0.0), isnan(_375))).xyzw;
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
    float _106 = exp2(_104);
    float _108 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _110 = _102 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _112 = exp2(_108);
    float _114 = exp2(_110);
    float _116 = _76 + _106;
    float _118 = _116 * _90;
    float _120 = _78 + _112;
    float _122 = fma(_118, 2.4300000667572021484375, 0.589999973773956298828125);
    float _124 = _120 * _90;
    float _126 = fma(_118, _122, 0.14000000059604644775390625);
    float _128 = _80 + _114;
    float _130 = fma(_124, 2.4300000667572021484375, 0.589999973773956298828125);
    float _132 = _124 * 0.586600005626678466796875;
    float _134 = 1.0 / _126;
    float _136 = _128 * _90;
    float _138 = fma(_124, _130, 0.14000000059604644775390625);
    float _140 = fma(_118, 0.29890000820159912109375, _132);
    float _142 = fma(_136, 2.4300000667572021484375, 0.589999973773956298828125);
    float _144 = 1.0 / _138;
    float _146 = fma(_136, _142, 0.14000000059604644775390625);
    float _148 = fma(_118, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _150 = fma(_136, 0.1143999993801116943359375, _140);
    float _152 = _118 * _148;
    float _154 = _150 * (-1.44269502162933349609375);
    float _156 = 1.0 / _146;
    float _158 = fma(_124, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _160 = _152 * _134;
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = fma(_136, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _166 = _124 * _158;
    float _168 = _136 * _164;
    float _170 = exp2(_154);
    float _172 = _166 * _144;
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = _168 * _156;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = abs(_162);
    float _182 = log2(_180);
    float _184 = -_170;
    float _186 = _184 + 1.0;
    float _188 = abs(_174);
    float _190 = log2(_188);
    bool _194 = _186 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _196 = isnan(_186);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _202 = _198 || _200;
    float _204 = abs(_178);
    float _206 = log2(_204);
    float _208 = _182 * 0.4545454680919647216796875;
    float _210 = _190 * 0.4545454680919647216796875;
    float _212 = exp2(_208);
    float _214 = _190;
    if (!_202)
    {
        _214 = _186;
    }
    float _216 = _214;
    float _218 = _206 * 0.4545454680919647216796875;
    float _220 = exp2(_210);
    float _222 = exp2(_218);
    bool _224 = !_202;
    float _226 = _216;
    if (!_224)
    {
        float _228 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _230 = _186 + _228;
        float _232 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _234 = spvFAdd(_232, 1.00000095367431640625);
        float _236 = 1.0 / _234;
        float _238 = _230 * _236;
        float _240 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _244 = -_238;
        float _246 = _244 + 1.0;
        float _248 = _242 * _236;
        float _250 = _248 + (-1.0);
        float _252 = abs(_246);
        float _254 = log2(_252);
        float _256 = _248 * _238;
        float _258 = _254 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _260 = exp2(_258);
        float _262 = fma(_250, _260, 1.0);
        float _264 = 1.0 / _262;
        float _266 = _256 * _264;
        float _268 = fma(_234, _266, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _226 = _268;
    }
    float _270 = _226;
    float _272 = -_186;
    float _274 = _272 + _270;
    float _276 = _220 * 0.586600005626678466796875;
    float _278 = _274 + 1.0;
    float _280 = fma(_212, 0.29890000820159912109375, _276);
    float _282 = fma(_222, 0.1143999993801116943359375, _280);
    float _284 = abs(_278);
    float _286 = log2(_284);
    float _288 = spvFAdd(_282, 9.9999999747524270787835121154785e-07);
    float _290 = 1.0 / _288;
    float _292 = _286 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _294 = exp2(_292);
    float _296 = fma(_212, _290, -1.0);
    float _298 = fma(_220, _290, -1.0);
    float _300 = fma(_222, _290, -1.0);
    float _302 = fma(_294, _296, 1.0);
    float _304 = fma(_294, _298, 1.0);
    float _306 = fma(_294, _300, 1.0);
    float _308 = _302 * _270;
    float _310 = _304 * _270;
    float _312 = _306 * _270;
    float _314 = precise::max(0.0, _308);
    float _316 = precise::max(0.0, _310);
    float _318 = precise::max(0.0, _312);
    float _320 = precise::min(_314, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _322 = precise::min(_316, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _324 = precise::min(_318, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _320;
    out.m_36.y = _322;
    out.m_36.z = _324;
    out.m_36.w = _82;
    return out;
}

