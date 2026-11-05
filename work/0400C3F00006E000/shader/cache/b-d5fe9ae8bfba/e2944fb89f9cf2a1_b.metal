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
    float2 _334 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_334, float2(0.0), isnan(_334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_334, float2(0.0), isnan(_334))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _351 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_351, float2(0.0), isnan(_351))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_351, float2(0.0), isnan(_351))).xyzw;
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
    float _122 = fma(_118, 2.4300000667572021484375, 0.589999973773956298828125);
    float _124 = _120 * _90;
    float _126 = fma(_118, _122, 0.14000000059604644775390625);
    float _128 = fma(_118, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _130 = _80 + _114;
    float _132 = _118 * 0.586600005626678466796875;
    float _134 = 1.0 / _126;
    float _136 = _130 * _90;
    float _138 = fma(_124, 0.29890000820159912109375, _132);
    float _140 = fma(_124, 2.4300000667572021484375, 0.589999973773956298828125);
    float _142 = fma(_136, 0.1143999993801116943359375, _138);
    float _144 = fma(_124, _140, 0.14000000059604644775390625);
    float _146 = _142 * (-1.44269502162933349609375);
    float _148 = fma(_136, 2.4300000667572021484375, 0.589999973773956298828125);
    float _150 = 1.0 / _144;
    float _152 = fma(_136, _148, 0.14000000059604644775390625);
    float _154 = _118 * _128;
    float _156 = exp2(_146);
    float _158 = 1.0 / _152;
    float _160 = -_156;
    float _162 = _160 + 1.0;
    float _164 = fma(_124, 2.5099999904632568359375, 0.02999999932944774627685546875);
    bool _168 = _162 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _170 = isnan(_162);
    bool _172 = _168 || _170;
    bool _174 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _176 = _172 || _174;
    float _178 = _128;
    if (!_176)
    {
        _178 = _162;
    }
    float _180 = _178;
    bool _182 = !_176;
    float _184 = _180;
    if (!_182)
    {
        float _186 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _188 = _162 + _186;
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
    float _230 = -_162;
    float _232 = _230 + _228;
    float _234 = fma(_136, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _236 = _124 * _164;
    float _238 = _154 * _134;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _232 + 1.0;
    float _244 = _136 * _234;
    float _246 = _236 * _150;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _240 * 0.586600005626678466796875;
    float _252 = _244 * _158;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = abs(_242);
    float _258 = log2(_256);
    float _260 = fma(_248, 0.29890000820159912109375, _250);
    float _262 = fma(_254, 0.1143999993801116943359375, _260);
    float _264 = spvFAdd(_262, 9.9999999747524270787835121154785e-07);
    float _266 = 1.0 / _264;
    float _268 = _258 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _270 = exp2(_268);
    float _272 = fma(_248, _266, -1.0);
    float _274 = fma(_240, _266, -1.0);
    float _276 = fma(_254, _266, -1.0);
    float _278 = fma(_270, _272, 1.0);
    float _280 = fma(_270, _274, 1.0);
    float _282 = fma(_270, _276, 1.0);
    float _284 = _278 * _228;
    float _286 = _280 * _228;
    float _288 = _282 * _228;
    float _290 = precise::max(0.0, _284);
    float _292 = precise::max(0.0, _286);
    float _294 = precise::max(0.0, _288);
    float _296 = precise::min(_290, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _298 = precise::min(_292, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _300 = precise::min(_294, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _296;
    out.m_36.y = _298;
    out.m_36.z = _300;
    out.m_36.w = _82;
    return out;
}

