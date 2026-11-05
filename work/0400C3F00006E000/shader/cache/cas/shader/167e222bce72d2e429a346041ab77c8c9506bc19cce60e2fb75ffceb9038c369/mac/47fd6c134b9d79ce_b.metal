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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_44 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _336 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_336, float2(0.0), isnan(_336))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_336, float2(0.0), isnan(_336))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_35.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_37.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = _67 * _88;
    float _98 = in.m_39.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_35.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_39.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_35.z;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_39.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = _67 * _102;
    float _130 = _67 * _114;
    float _132 = _67 * _120;
    float _134 = _82 * _96;
    float _136 = _67 * _94;
    float _138 = 0.0 + _134;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = _140 * _136;
    bool _146 = _142 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _148 = isnan(_142);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _154 = _150 || _152;
    float _156 = in.m_35.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    if (!_154)
    {
        discard_fragment();
    }
    float _162 = _76 * _76;
    float _164 = _78 * _78;
    float _166 = _67 * _160;
    float _168 = _67 * _108;
    float _170 = _67 * _126;
    float _172 = -_128;
    float _174 = _166 + _172;
    float _176 = -_130;
    float _178 = _168 + _176;
    float _180 = -_170;
    float _182 = _132 + _180;
    float _184 = _80 * _80;
    float _186 = fma(_162, _174, _128);
    float _188 = fma(_164, _178, _130);
    float _190 = fma(_184, _182, _170);
    if (!_154)
    {
        out.m_42.x = _186;
        out.m_42.y = _188;
        out.m_42.z = _190;
        out.m_42.w = _134;
        return out;
    }
    float _192 = _188 * 0.715200006961822509765625;
    float _194 = in.m_44.w;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_44.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_44.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = fma(_186, 0.2125999927520751953125, _192);
    float _214 = in.m_44.y;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = fma(_190, 0.072200000286102294921875, _212);
    bool _222 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _224 = 1.0 / _220;
    float _226 = _224 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = _67 * _198;
    float _232 = fma(_228, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _234 = _67 * _204;
    float _236 = _232 * _230;
    float _238 = 0.0 + _142;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _67 * _210;
    float _244 = _67 * _218;
    float _246 = fma(_190, _236, _234);
    float _248 = fma(_186, _236, _242);
    float _250 = fma(_188, _236, _244);
    float _252 = _234;
    if (!_222)
    {
        _252 = _240;
    }
    float _254 = _252;
    bool _256 = !_222;
    float _258 = _254;
    if (!_256)
    {
        float _260 = in.m_46.w;
        float _262 = gl_FragCoord.w;
        float _264 = _260 * _262;
        float _266 = in.m_46.z;
        float _268 = gl_FragCoord.w;
        float _270 = _266 * _268;
        float _272 = _67 * _264;
        float _274 = _67 * _270;
        float _276 = 1.0 / _272;
        float _278 = _274 * _276;
        float _280 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _282 = fma(_278, (*spvDescriptorSet0.fp_c8)._m0[30].w, _280);
        float _284 = 1.0 / _282;
        float _286 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _288 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _290 = fma(_284, _286, _288);
        float _292 = _290 * 8.0;
        float _294 = precise::clamp(_292, 0.0, 1.0);
        float _296 = _240 * _294;
        _258 = _296;
    }
    float _298 = _258;
    float _300 = 0.0 + _298;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    out.m_42.x = _248;
    out.m_42.y = _250;
    out.m_42.z = _246;
    out.m_42.w = _302;
    return out;
}

