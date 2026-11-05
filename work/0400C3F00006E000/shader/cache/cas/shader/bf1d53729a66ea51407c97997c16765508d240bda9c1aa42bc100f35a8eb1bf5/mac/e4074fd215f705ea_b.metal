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
    float2 _328 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_328, float2(0.0), isnan(_328))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_328, float2(0.0), isnan(_328))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _345 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_345, float2(0.0), isnan(_345))).xyzw;
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
    float _108 = fma(_102, 6.19999980926513671875, 1.7000000476837158203125);
    float _110 = _100 * 0.586600005626678466796875;
    float _112 = fma(_98, _104, 0.0599999986588954925537109375);
    float _114 = fma(_100, _106, 0.0599999986588954925537109375);
    float _116 = fma(_102, _108, 0.0599999986588954925537109375);
    float _118 = fma(_98, 6.19999980926513671875, 0.5);
    float _120 = 1.0 / _112;
    float _122 = fma(_98, 0.29890000820159912109375, _110);
    float _124 = fma(_100, 6.19999980926513671875, 0.5);
    float _126 = _98 * _118;
    float _128 = fma(_102, 0.1143999993801116943359375, _122);
    float _130 = _100 * _124;
    float _132 = 1.0 / _114;
    float _134 = _128 * (-1.44269502162933349609375);
    float _136 = 1.0 / _116;
    float _138 = _126 * _120;
    float _140 = fma(_102, 6.19999980926513671875, 0.5);
    float _142 = _102 * _140;
    float _144 = _130 * _132;
    float _146 = exp2(_134);
    float _148 = _142 * _136;
    float _150 = abs(_138);
    float _152 = log2(_150);
    float _154 = abs(_144);
    float _156 = log2(_154);
    float _158 = -_146;
    float _160 = _158 + 1.0;
    bool _164 = _160 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _166 = isnan(_160);
    bool _168 = _164 || _166;
    bool _170 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _172 = _168 || _170;
    float _174 = abs(_148);
    float _176 = log2(_174);
    float _178 = _152 * 2.2000000476837158203125;
    float _180 = _156 * 2.2000000476837158203125;
    float _182 = exp2(_178);
    float _184 = _156;
    if (!_172)
    {
        _184 = _160;
    }
    float _186 = _184;
    float _188 = _176 * 2.2000000476837158203125;
    float _190 = exp2(_180);
    float _192 = exp2(_188);
    bool _194 = !_172;
    float _196 = _186;
    if (!_194)
    {
        float _198 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _200 = _160 + _198;
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
    float _242 = -_160;
    float _244 = _242 + _240;
    float _246 = _190 * 0.586600005626678466796875;
    float _248 = _244 + 1.0;
    float _250 = fma(_182, 0.29890000820159912109375, _246);
    float _252 = fma(_192, 0.1143999993801116943359375, _250);
    float _254 = abs(_248);
    float _256 = log2(_254);
    float _258 = spvFAdd(_252, 9.9999999747524270787835121154785e-07);
    float _260 = 1.0 / _258;
    float _262 = _256 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _264 = exp2(_262);
    float _266 = fma(_182, _260, -1.0);
    float _268 = fma(_190, _260, -1.0);
    float _270 = fma(_192, _260, -1.0);
    float _272 = fma(_264, _266, 1.0);
    float _274 = fma(_264, _268, 1.0);
    float _276 = fma(_264, _270, 1.0);
    float _278 = _272 * _240;
    float _280 = _274 * _240;
    float _282 = _276 * _240;
    float _284 = precise::max(0.0, _278);
    float _286 = precise::max(0.0, _280);
    float _288 = precise::max(0.0, _282);
    float _290 = precise::min(_284, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _292 = precise::min(_286, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _294 = precise::min(_288, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _290;
    out.m_36.y = _292;
    out.m_36.z = _294;
    out.m_36.w = _82;
    return out;
}

