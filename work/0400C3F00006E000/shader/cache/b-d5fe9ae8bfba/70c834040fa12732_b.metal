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
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
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
    float _96 = in.m_39.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_41.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _67 * _88;
    float _110 = in.m_39.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_39.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_37.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_39.z;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_35.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_35.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_35.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _67 * _114;
    float _154 = _67 * _120;
    float _156 = _67 * _126;
    float _158 = _82 * _108;
    float _160 = _67 * _94;
    float _162 = _67 * _100;
    float _164 = _160 * _158;
    float _166 = _162 * _164;
    float _168 = _67 * _106;
    float _170 = 0.0 + _166;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = _172 * _168;
    bool _178 = _174 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _180 = isnan(_174);
    bool _182 = _178 || _180;
    bool _184 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _186 = _182 || _184;
    float _188 = in.m_37.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_37.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    if (!_186)
    {
        discard_fragment();
    }
    float _200 = _67 * _192;
    float _202 = _67 * _198;
    float _204 = _67 * _132;
    float _206 = -_154;
    float _208 = _200 + _206;
    float _210 = -_152;
    float _212 = _202 + _210;
    float _214 = -_204;
    float _216 = _156 + _214;
    float _218 = fma(_76, _208, _154);
    float _220 = fma(_78, _212, _152);
    float _222 = fma(_80, _216, _204);
    float _224 = _67 * _138;
    float _226 = _67 * _144;
    float _228 = _67 * _150;
    float _230 = _218 * _224;
    float _232 = _220 * _226;
    float _234 = _222 * _228;
    if (!_186)
    {
        out.m_44.x = _230;
        out.m_44.y = _232;
        out.m_44.z = _234;
        out.m_44.w = _166;
        return out;
    }
    float _236 = _232 * 0.715200006961822509765625;
    float _238 = 0.0 + _174;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = fma(_230, 0.2125999927520751953125, _236);
    bool _244 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _246 = fma(_234, 0.072200000286102294921875, _242);
    float _248 = 1.0 / _246;
    float _250 = _248 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = fma(_252, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _256 = _230 * _254;
    float _258 = _232 * _254;
    float _260 = _234 * _254;
    float _262 = _254;
    if (!_244)
    {
        _262 = _240;
    }
    float _264 = _262;
    bool _266 = !_244;
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
        float _306 = _240 * _304;
        _268 = _306;
    }
    float _308 = _268;
    float _310 = 0.0 + _308;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    out.m_44.x = _256;
    out.m_44.y = _258;
    out.m_44.z = _260;
    out.m_44.w = _312;
    return out;
}

