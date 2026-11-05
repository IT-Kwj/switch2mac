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
    float2 _316 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_316, float2(0.0), isnan(_316))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_316, float2(0.0), isnan(_316))).xyzw;
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
    float _86 = fma(_80, 2.4300000667572021484375, 0.589999973773956298828125);
    float _88 = fma(_82, 2.4300000667572021484375, 0.589999973773956298828125);
    float _90 = fma(_84, 2.4300000667572021484375, 0.589999973773956298828125);
    float _92 = _82 * 0.586600005626678466796875;
    float _94 = fma(_80, _86, 0.14000000059604644775390625);
    float _96 = fma(_82, _88, 0.14000000059604644775390625);
    float _98 = fma(_84, _90, 0.14000000059604644775390625);
    float _100 = fma(_80, 0.29890000820159912109375, _92);
    float _102 = 1.0 / _94;
    float _104 = fma(_84, 0.1143999993801116943359375, _100);
    float _106 = _104 * (-1.44269502162933349609375);
    float _108 = 1.0 / _96;
    float _110 = fma(_80, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _112 = _80 * _110;
    float _114 = fma(_82, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _116 = 1.0 / _98;
    float _118 = _112 * _102;
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = _82 * _114;
    float _124 = fma(_84, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _126 = _84 * _124;
    float _128 = _122 * _108;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = exp2(_106);
    float _134 = _126 * _116;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = abs(_120);
    float _140 = log2(_138);
    float _142 = abs(_130);
    float _144 = log2(_142);
    float _146 = -_132;
    float _148 = _146 + 1.0;
    bool _152 = _148 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _154 = isnan(_148);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _160 = _156 || _158;
    float _162 = abs(_136);
    float _164 = log2(_162);
    float _166 = _140 * 2.2000000476837158203125;
    float _168 = _144 * 2.2000000476837158203125;
    float _170 = exp2(_166);
    float _172 = _126;
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
    float _234 = _178 * 0.586600005626678466796875;
    float _236 = _232 + 1.0;
    float _238 = fma(_170, 0.29890000820159912109375, _234);
    float _240 = fma(_180, 0.1143999993801116943359375, _238);
    float _242 = abs(_236);
    float _244 = log2(_242);
    float _246 = spvFAdd(_240, 9.9999999747524270787835121154785e-07);
    float _248 = 1.0 / _246;
    float _250 = _244 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _252 = exp2(_250);
    float _254 = fma(_170, _248, -1.0);
    float _256 = fma(_178, _248, -1.0);
    float _258 = fma(_180, _248, -1.0);
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
    out.m_34.x = _278;
    out.m_34.y = _280;
    out.m_34.z = _282;
    out.m_34.w = _70;
    return out;
}

