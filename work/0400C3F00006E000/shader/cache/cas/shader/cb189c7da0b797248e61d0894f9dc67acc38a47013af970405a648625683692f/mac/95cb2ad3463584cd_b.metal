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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _310 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_310, float2(0.0), isnan(_310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_310, float2(0.0), isnan(_310))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = in.m_31.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = _55 * _76;
    float _80 = _64 * _78;
    float _82 = _66 * _78;
    float _84 = _68 * _78;
    float _86 = fma(_80, 6.19999980926513671875, 1.7000000476837158203125);
    float _88 = fma(_82, 6.19999980926513671875, 1.7000000476837158203125);
    float _90 = fma(_84, 6.19999980926513671875, 1.7000000476837158203125);
    float _92 = fma(_80, _86, 0.0599999986588954925537109375);
    float _94 = _82 * 0.586600005626678466796875;
    float _96 = fma(_82, _88, 0.0599999986588954925537109375);
    float _98 = fma(_84, _90, 0.0599999986588954925537109375);
    float _100 = fma(_80, 0.29890000820159912109375, _94);
    float _102 = fma(_80, 6.19999980926513671875, 0.5);
    float _104 = 1.0 / _92;
    float _106 = fma(_84, 0.1143999993801116943359375, _100);
    float _108 = _80 * _102;
    float _110 = fma(_82, 6.19999980926513671875, 0.5);
    float _112 = _106 * (-1.44269502162933349609375);
    float _114 = 1.0 / _96;
    float _116 = _82 * _110;
    float _118 = fma(_84, 6.19999980926513671875, 0.5);
    float _120 = _84 * _118;
    float _122 = 1.0 / _98;
    float _124 = _108 * _104;
    float _126 = _116 * _114;
    float _128 = exp2(_112);
    float _130 = _120 * _122;
    float _132 = abs(_124);
    float _134 = log2(_132);
    float _136 = abs(_126);
    float _138 = log2(_136);
    float _140 = -_128;
    float _142 = _140 + 1.0;
    bool _146 = _142 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _148 = isnan(_142);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _154 = _150 || _152;
    float _156 = abs(_130);
    float _158 = log2(_156);
    float _160 = _134 * 2.2000000476837158203125;
    float _162 = _138 * 2.2000000476837158203125;
    float _164 = exp2(_160);
    float _166 = _120;
    if (!_154)
    {
        _166 = _142;
    }
    float _168 = _166;
    float _170 = _158 * 2.2000000476837158203125;
    float _172 = exp2(_162);
    float _174 = exp2(_170);
    bool _176 = !_154;
    float _178 = _168;
    if (!_176)
    {
        float _180 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _182 = _142 + _180;
        float _184 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _186 = spvFAdd(_184, 1.00000095367431640625);
        float _188 = 1.0 / _186;
        float _190 = _182 * _188;
        float _192 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _194 = _192 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _196 = -_190;
        float _198 = _196 + 1.0;
        float _200 = _194 * _188;
        float _202 = _200 + (-1.0);
        float _204 = abs(_198);
        float _206 = log2(_204);
        float _208 = _200 * _190;
        float _210 = _206 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _212 = exp2(_210);
        float _214 = fma(_202, _212, 1.0);
        float _216 = 1.0 / _214;
        float _218 = _208 * _216;
        float _220 = fma(_186, _218, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _178 = _220;
    }
    float _222 = _178;
    float _224 = -_142;
    float _226 = _224 + _222;
    float _228 = _172 * 0.586600005626678466796875;
    float _230 = _226 + 1.0;
    float _232 = fma(_164, 0.29890000820159912109375, _228);
    float _234 = fma(_174, 0.1143999993801116943359375, _232);
    float _236 = abs(_230);
    float _238 = log2(_236);
    float _240 = spvFAdd(_234, 9.9999999747524270787835121154785e-07);
    float _242 = 1.0 / _240;
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _246 = exp2(_244);
    float _248 = fma(_164, _242, -1.0);
    float _250 = fma(_172, _242, -1.0);
    float _252 = fma(_174, _242, -1.0);
    float _254 = fma(_246, _248, 1.0);
    float _256 = fma(_246, _250, 1.0);
    float _258 = fma(_246, _252, 1.0);
    float _260 = _254 * _222;
    float _262 = _256 * _222;
    float _264 = _258 * _222;
    float _266 = precise::max(0.0, _260);
    float _268 = precise::max(0.0, _262);
    float _270 = precise::max(0.0, _264);
    float _272 = precise::min(_266, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _274 = precise::min(_268, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _276 = precise::min(_270, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_34.x = _272;
    out.m_34.y = _274;
    out.m_34.z = _276;
    out.m_34.w = _70;
    return out;
}

