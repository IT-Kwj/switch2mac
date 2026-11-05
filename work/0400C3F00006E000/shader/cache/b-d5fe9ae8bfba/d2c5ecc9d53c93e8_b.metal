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
    float _92 = abs(_67);
    float _94 = log2(_92);
    float _96 = abs(_69);
    float _98 = log2(_96);
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _102 = abs(_71);
    float _104 = log2(_102);
    float _106 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = exp2(_100);
    float _110 = exp2(_106);
    float _112 = _104 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _114 = _76 + _108;
    float _116 = exp2(_112);
    float _118 = _114 * _90;
    float _120 = _78 + _110;
    float _122 = fma(_118, 6.19999980926513671875, 1.7000000476837158203125);
    float _124 = _120 * _90;
    float _126 = fma(_118, _122, 0.0599999986588954925537109375);
    float _128 = fma(_118, 6.19999980926513671875, 0.5);
    float _130 = fma(_124, 6.19999980926513671875, 1.7000000476837158203125);
    float _132 = _80 + _116;
    float _134 = _118 * _128;
    float _136 = 1.0 / _126;
    float _138 = fma(_124, _130, 0.0599999986588954925537109375);
    float _140 = _132 * _90;
    float _142 = fma(_124, 6.19999980926513671875, 0.5);
    float _144 = fma(_140, 6.19999980926513671875, 1.7000000476837158203125);
    float _146 = _124 * _142;
    float _148 = 1.0 / _138;
    float _150 = _124 * 0.586600005626678466796875;
    float _152 = fma(_140, _144, 0.0599999986588954925537109375);
    float _154 = fma(_118, 0.29890000820159912109375, _150);
    float _156 = 1.0 / _152;
    float _158 = _134 * _136;
    float _160 = fma(_140, 6.19999980926513671875, 0.5);
    float _162 = fma(_140, 0.1143999993801116943359375, _154);
    float _164 = _140 * _160;
    float _166 = _162 * (-1.44269502162933349609375);
    float _168 = _146 * _148;
    float _170 = abs(_158);
    float _172 = log2(_170);
    float _174 = _164 * _156;
    float _176 = abs(_168);
    float _178 = log2(_176);
    float _180 = abs(_174);
    float _182 = log2(_180);
    float _184 = _172 * 2.2000000476837158203125;
    float _186 = _178 * 2.2000000476837158203125;
    float _188 = exp2(_184);
    float _190 = _182 * 2.2000000476837158203125;
    float _192 = exp2(_186);
    float _194 = exp2(_166);
    float _196 = exp2(_190);
    float _198 = abs(_188);
    float _200 = log2(_198);
    float _202 = -_194;
    float _204 = _202 + 1.0;
    bool _208 = _204 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _210 = isnan(_204);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _216 = _212 || _214;
    float _218 = abs(_192);
    float _220 = log2(_218);
    float _222 = abs(_196);
    float _224 = log2(_222);
    float _226 = _200 * 0.4545454680919647216796875;
    float _228 = _200;
    if (!_216)
    {
        _228 = _204;
    }
    float _230 = _228;
    float _232 = _220 * 0.4545454680919647216796875;
    float _234 = exp2(_226);
    float _236 = _224 * 0.4545454680919647216796875;
    float _238 = exp2(_232);
    bool _240 = !_216;
    float _242 = _230;
    if (!_240)
    {
        float _244 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _246 = _204 + _244;
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
    float _288 = -_204;
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

