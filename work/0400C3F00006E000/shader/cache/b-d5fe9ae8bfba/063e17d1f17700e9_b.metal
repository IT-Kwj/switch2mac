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
    float _92 = _76 + _67;
    float _94 = _78 + _69;
    float _96 = _80 + _71;
    float _98 = _92 * _90;
    float _100 = _94 * _90;
    float _102 = _96 * _90;
    float _104 = fma(_98, 6.19999980926513671875, 1.7000000476837158203125);
    float _106 = fma(_100, 6.19999980926513671875, 1.7000000476837158203125);
    float _108 = fma(_98, 6.19999980926513671875, 0.5);
    float _110 = fma(_98, _104, 0.0599999986588954925537109375);
    float _112 = fma(_100, _106, 0.0599999986588954925537109375);
    float _114 = fma(_102, 6.19999980926513671875, 1.7000000476837158203125);
    float _116 = fma(_100, 6.19999980926513671875, 0.5);
    float _118 = _98 * _108;
    float _120 = 1.0 / _112;
    float _122 = fma(_102, _114, 0.0599999986588954925537109375);
    float _124 = _100 * _116;
    float _126 = _100 * 0.586600005626678466796875;
    float _128 = fma(_98, 0.29890000820159912109375, _126);
    float _130 = 1.0 / _110;
    float _132 = fma(_102, 0.1143999993801116943359375, _128);
    float _134 = _132 * (-1.44269502162933349609375);
    float _136 = 1.0 / _122;
    float _138 = _124 * _120;
    float _140 = _118 * _130;
    float _142 = abs(_138);
    float _144 = log2(_142);
    float _146 = fma(_102, 6.19999980926513671875, 0.5);
    float _148 = _102 * _146;
    float _150 = abs(_140);
    float _152 = log2(_150);
    float _154 = _148 * _136;
    float _156 = abs(_154);
    float _158 = log2(_156);
    float _160 = _144 * 2.2000000476837158203125;
    float _162 = _152 * 2.2000000476837158203125;
    float _164 = exp2(_160);
    float _166 = _158 * 2.2000000476837158203125;
    float _168 = exp2(_162);
    float _170 = exp2(_134);
    float _172 = exp2(_166);
    float _174 = abs(_168);
    float _176 = log2(_174);
    float _178 = -_170;
    float _180 = _178 + 1.0;
    bool _184 = _180 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _186 = isnan(_180);
    bool _188 = _184 || _186;
    bool _190 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _192 = _188 || _190;
    float _194 = abs(_164);
    float _196 = log2(_194);
    float _198 = abs(_172);
    float _200 = log2(_198);
    float _202 = _176 * 2.2000000476837158203125;
    float _204 = _176;
    if (!_192)
    {
        _204 = _180;
    }
    float _206 = _204;
    float _208 = _196 * 2.2000000476837158203125;
    float _210 = exp2(_202);
    float _212 = _200 * 2.2000000476837158203125;
    float _214 = exp2(_208);
    bool _216 = !_192;
    float _218 = _206;
    if (!_216)
    {
        float _220 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _222 = _180 + _220;
        float _224 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _226 = spvFAdd(_224, 1.00000095367431640625);
        float _228 = 1.0 / _226;
        float _230 = _222 * _228;
        float _232 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _234 = _232 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _236 = -_230;
        float _238 = _236 + 1.0;
        float _240 = _234 * _228;
        float _242 = _240 + (-1.0);
        float _244 = abs(_238);
        float _246 = log2(_244);
        float _248 = _240 * _230;
        float _250 = _246 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _252 = exp2(_250);
        float _254 = fma(_242, _252, 1.0);
        float _256 = 1.0 / _254;
        float _258 = _248 * _256;
        float _260 = fma(_226, _258, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _218 = _260;
    }
    float _262 = _218;
    float _264 = -_180;
    float _266 = _264 + _262;
    float _268 = exp2(_212);
    float _270 = _214 * 0.586600005626678466796875;
    float _272 = _266 + 1.0;
    float _274 = fma(_210, 0.29890000820159912109375, _270);
    float _276 = abs(_272);
    float _278 = log2(_276);
    float _280 = fma(_268, 0.1143999993801116943359375, _274);
    float _282 = spvFAdd(_280, 9.9999999747524270787835121154785e-07);
    float _284 = _278 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _286 = 1.0 / _282;
    float _288 = exp2(_284);
    float _290 = fma(_210, _286, -1.0);
    float _292 = fma(_214, _286, -1.0);
    float _294 = fma(_268, _286, -1.0);
    float _296 = fma(_288, _290, 1.0);
    float _298 = fma(_288, _292, 1.0);
    float _300 = fma(_288, _294, 1.0);
    float _302 = _296 * _262;
    float _304 = _298 * _262;
    float _306 = _300 * _262;
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

