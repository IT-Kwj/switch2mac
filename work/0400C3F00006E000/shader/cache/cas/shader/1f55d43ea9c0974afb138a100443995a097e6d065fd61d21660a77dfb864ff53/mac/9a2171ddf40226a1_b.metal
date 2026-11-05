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
    float4 m_37 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
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
    float2 _346 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_346, float2(0.0), isnan(_346))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_346, float2(0.0), isnan(_346))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_35.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_37.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_39.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _67 * _88;
    float _104 = _67 * _94;
    float _106 = in.m_35.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_35.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_37.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_35.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_37.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = _67 * _122;
    float _138 = _67 * _128;
    float _140 = -_102;
    float _142 = _82 + _140;
    float _144 = _142 * 4.0;
    float _146 = precise::clamp(_144, 0.0, 1.0);
    float _148 = _104 * _146;
    float _150 = _67 * _100;
    float _152 = 0.0 + _148;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _154 * _150;
    bool _160 = _156 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _162 = isnan(_156);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _168 = _164 || _166;
    float _170 = in.m_37.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    if (!_168)
    {
        discard_fragment();
    }
    float _176 = _67 * _116;
    float _178 = _67 * _110;
    float _180 = _67 * _134;
    float _182 = -_136;
    float _184 = _178 + _182;
    float _186 = -_180;
    float _188 = _138 + _186;
    float _190 = fma(_78, _184, _136);
    float _192 = _67 * _174;
    float _194 = -_192;
    float _196 = _176 + _194;
    float _198 = fma(_76, _196, _192);
    float _200 = fma(_80, _188, _180);
    if (!_168)
    {
        out.m_42.x = _198;
        out.m_42.y = _190;
        out.m_42.z = _200;
        out.m_42.w = _148;
        return out;
    }
    float _202 = _190 * 0.715200006961822509765625;
    float _204 = in.m_44.w;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_44.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_44.x;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = fma(_198, 0.2125999927520751953125, _202);
    float _224 = in.m_44.y;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = fma(_200, 0.072200000286102294921875, _222);
    bool _232 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _234 = 1.0 / _230;
    float _236 = _234 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = _67 * _208;
    float _242 = fma(_238, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _244 = _67 * _214;
    float _246 = _242 * _240;
    float _248 = 0.0 + _156;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = _67 * _220;
    float _254 = _67 * _228;
    float _256 = fma(_200, _246, _244);
    float _258 = fma(_198, _246, _252);
    float _260 = fma(_190, _246, _254);
    float _262 = _244;
    if (!_232)
    {
        _262 = _250;
    }
    float _264 = _262;
    bool _266 = !_232;
    float _268 = _264;
    if (!_266)
    {
        float _270 = in.m_46.w;
        float _272 = gl_FragCoord.w;
        float _274 = _270 * _272;
        float _276 = in.m_46.z;
        float _278 = gl_FragCoord.w;
        float _280 = _276 * _278;
        float _282 = _67 * _274;
        float _284 = _67 * _280;
        float _286 = 1.0 / _282;
        float _288 = _284 * _286;
        float _290 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _292 = fma(_288, (*spvDescriptorSet0.fp_c8)._m0[30].w, _290);
        float _294 = 1.0 / _292;
        float _296 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _298 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _300 = fma(_294, _296, _298);
        float _302 = _300 * 8.0;
        float _304 = precise::clamp(_302, 0.0, 1.0);
        float _306 = _250 * _304;
        _268 = _306;
    }
    float _308 = _268;
    float _310 = 0.0 + _308;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    out.m_42.x = _258;
    out.m_42.y = _260;
    out.m_42.z = _256;
    out.m_42.w = _312;
    return out;
}

