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
    float _122 = fma(_118, 6.19999980926513671875, 1.7000000476837158203125);
    float _124 = _120 * _90;
    float _126 = fma(_118, _122, 0.0599999986588954925537109375);
    float _128 = _80 + _114;
    float _130 = fma(_124, 6.19999980926513671875, 1.7000000476837158203125);
    float _132 = _124 * 0.586600005626678466796875;
    float _134 = 1.0 / _126;
    float _136 = _128 * _90;
    float _138 = fma(_124, _130, 0.0599999986588954925537109375);
    float _140 = fma(_118, 0.29890000820159912109375, _132);
    float _142 = fma(_124, 6.19999980926513671875, 0.5);
    float _144 = fma(_136, 6.19999980926513671875, 1.7000000476837158203125);
    float _146 = fma(_136, 0.1143999993801116943359375, _140);
    float _148 = 1.0 / _138;
    float _150 = fma(_136, _144, 0.0599999986588954925537109375);
    float _152 = fma(_118, 6.19999980926513671875, 0.5);
    float _154 = _146 * (-1.44269502162933349609375);
    float _156 = _124 * _142;
    float _158 = _118 * _152;
    float _160 = 1.0 / _150;
    float _162 = _158 * _134;
    float _164 = fma(_136, 6.19999980926513671875, 0.5);
    float _166 = _136 * _164;
    float _168 = _156 * _148;
    float _170 = exp2(_154);
    float _172 = _166 * _160;
    float _174 = abs(_162);
    float _176 = log2(_174);
    float _178 = abs(_168);
    float _180 = log2(_178);
    float _182 = -_170;
    float _184 = _182 + 1.0;
    bool _188 = _184 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _190 = isnan(_184);
    bool _192 = _188 || _190;
    bool _194 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _196 = _192 || _194;
    float _198 = abs(_172);
    float _200 = log2(_198);
    float _202 = _176 * 2.2000000476837158203125;
    float _204 = _180 * 2.2000000476837158203125;
    float _206 = exp2(_202);
    float _208 = _180;
    if (!_196)
    {
        _208 = _184;
    }
    float _210 = _208;
    float _212 = _200 * 2.2000000476837158203125;
    float _214 = exp2(_204);
    float _216 = exp2(_212);
    bool _218 = !_196;
    float _220 = _210;
    if (!_218)
    {
        float _222 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _224 = _184 + _222;
        float _226 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _228 = spvFAdd(_226, 1.00000095367431640625);
        float _230 = 1.0 / _228;
        float _232 = _224 * _230;
        float _234 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _238 = -_232;
        float _240 = _238 + 1.0;
        float _242 = _236 * _230;
        float _244 = _242 + (-1.0);
        float _246 = abs(_240);
        float _248 = log2(_246);
        float _250 = _242 * _232;
        float _252 = _248 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _254 = exp2(_252);
        float _256 = fma(_244, _254, 1.0);
        float _258 = 1.0 / _256;
        float _260 = _250 * _258;
        float _262 = fma(_228, _260, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _220 = _262;
    }
    float _264 = _220;
    float _266 = -_184;
    float _268 = _266 + _264;
    float _270 = _214 * 0.586600005626678466796875;
    float _272 = _268 + 1.0;
    float _274 = fma(_206, 0.29890000820159912109375, _270);
    float _276 = fma(_216, 0.1143999993801116943359375, _274);
    float _278 = abs(_272);
    float _280 = log2(_278);
    float _282 = spvFAdd(_276, 9.9999999747524270787835121154785e-07);
    float _284 = 1.0 / _282;
    float _286 = _280 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _288 = exp2(_286);
    float _290 = fma(_206, _284, -1.0);
    float _292 = fma(_214, _284, -1.0);
    float _294 = fma(_216, _284, -1.0);
    float _296 = fma(_288, _290, 1.0);
    float _298 = fma(_288, _292, 1.0);
    float _300 = fma(_288, _294, 1.0);
    float _302 = _296 * _264;
    float _304 = _298 * _264;
    float _306 = _300 * _264;
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

