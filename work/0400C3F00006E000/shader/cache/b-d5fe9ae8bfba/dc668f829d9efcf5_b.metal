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
    float2 _330 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_330, float2(0.0), isnan(_330))).xyzw;
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
    float _162 = _67 * _160;
    float _164 = _67 * _108;
    float _166 = _67 * _126;
    float _168 = -_128;
    float _170 = _162 + _168;
    float _172 = -_130;
    float _174 = _164 + _172;
    float _176 = -_166;
    float _178 = _132 + _176;
    float _180 = fma(_76, _170, _128);
    float _182 = fma(_78, _174, _130);
    float _184 = fma(_80, _178, _166);
    if (!_154)
    {
        out.m_42.x = _180;
        out.m_42.y = _182;
        out.m_42.z = _184;
        out.m_42.w = _134;
        return out;
    }
    float _186 = _182 * 0.715200006961822509765625;
    float _188 = in.m_44.w;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_44.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_44.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = fma(_180, 0.2125999927520751953125, _186);
    float _208 = in.m_44.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = fma(_184, 0.072200000286102294921875, _206);
    bool _216 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _218 = 1.0 / _214;
    float _220 = _218 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _67 * _192;
    float _226 = fma(_222, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _228 = _67 * _198;
    float _230 = _226 * _224;
    float _232 = 0.0 + _142;
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _67 * _204;
    float _238 = _67 * _212;
    float _240 = fma(_184, _230, _228);
    float _242 = fma(_180, _230, _236);
    float _244 = fma(_182, _230, _238);
    float _246 = _228;
    if (!_216)
    {
        _246 = _234;
    }
    float _248 = _246;
    bool _250 = !_216;
    float _252 = _248;
    if (!_250)
    {
        float _254 = in.m_46.w;
        float _256 = gl_FragCoord.w;
        float _258 = _254 * _256;
        float _260 = in.m_46.z;
        float _262 = gl_FragCoord.w;
        float _264 = _260 * _262;
        float _266 = _67 * _258;
        float _268 = _67 * _264;
        float _270 = 1.0 / _266;
        float _272 = _268 * _270;
        float _274 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _276 = fma(_272, (*spvDescriptorSet0.fp_c8)._m0[30].w, _274);
        float _278 = 1.0 / _276;
        float _280 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _282 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _284 = fma(_278, _280, _282);
        float _286 = _284 * 8.0;
        float _288 = precise::clamp(_286, 0.0, 1.0);
        float _290 = _234 * _288;
        _252 = _290;
    }
    float _292 = _252;
    float _294 = 0.0 + _292;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    out.m_42.x = _242;
    out.m_42.y = _244;
    out.m_42.z = _240;
    out.m_42.w = _296;
    return out;
}

