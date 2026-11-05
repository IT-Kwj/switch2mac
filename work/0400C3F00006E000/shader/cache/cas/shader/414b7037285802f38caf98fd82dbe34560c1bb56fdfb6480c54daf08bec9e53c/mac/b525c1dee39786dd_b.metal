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
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2), flat]];
    float4 m_48 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_46 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _348 = float2(_71, _73);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_348, float2(0.0), isnan(_348))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_348, float2(0.0), isnan(_348))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_35.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_37.y;
    float _94 = _69 * _90;
    float _96 = in.m_37.z;
    float _98 = _92 * _92;
    float _100 = in.m_39.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_39.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_39.z;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_41.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_41.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_41.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = 0.0 + _84;
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = _138 * _94;
    bool _144 = _140 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _146 = isnan(_140);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _152 = _148 || _150;
    float _154 = in.m_37.x;
    if (!_152)
    {
        discard_fragment();
    }
    float _156 = fma(_154, _154, _98);
    float _158 = precise::max(0.0, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _160 = fma(_96, _96, _156);
    float _162 = _69 * _110;
    float _164 = spvFAdd(_158, 0.001000000047497451305389404296875);
    float _166 = _80 * _162;
    float _168 = sqrt(_160);
    float _170 = _69 * _128;
    float _172 = precise::max(0.0, _168);
    float _174 = _69 * _104;
    float _176 = _69 * _116;
    float _178 = precise::min(_164, _172);
    float _180 = _78 * _174;
    float _182 = 1.0 / _164;
    float _184 = _82 * _176;
    float _186 = _69 * _122;
    float _188 = _69 * _134;
    float _190 = -_178;
    float _192 = fma(_190, _182, 1.0);
    float _194 = _192 * _192;
    float _196 = _194 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _198 = fma(_186, _196, _180);
    float _200 = fma(_170, _196, _166);
    float _202 = fma(_188, _196, _184);
    if (!_152)
    {
        out.m_44.x = _198;
        out.m_44.y = _200;
        out.m_44.z = _202;
        out.m_44.w = _84;
        return out;
    }
    float _204 = _200 * 0.715200006961822509765625;
    float _206 = in.m_46.w;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_46.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_46.x;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = fma(_198, 0.2125999927520751953125, _204);
    float _226 = in.m_46.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = fma(_202, 0.072200000286102294921875, _224);
    bool _234 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _236 = 1.0 / _232;
    float _238 = _236 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _69 * _210;
    float _244 = fma(_240, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _246 = _69 * _216;
    float _248 = _244 * _242;
    float _250 = 0.0 + _140;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _69 * _222;
    float _256 = _69 * _230;
    float _258 = fma(_202, _248, _246);
    float _260 = fma(_198, _248, _254);
    float _262 = fma(_200, _248, _256);
    float _264 = _246;
    if (!_234)
    {
        _264 = _252;
    }
    float _266 = _264;
    bool _268 = !_234;
    float _270 = _266;
    if (!_268)
    {
        float _272 = in.m_48.w;
        float _274 = gl_FragCoord.w;
        float _276 = _272 * _274;
        float _278 = in.m_48.z;
        float _280 = gl_FragCoord.w;
        float _282 = _278 * _280;
        float _284 = _69 * _276;
        float _286 = _69 * _282;
        float _288 = 1.0 / _284;
        float _290 = _286 * _288;
        float _292 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _294 = fma(_290, (*spvDescriptorSet0.fp_c8)._m0[30].w, _292);
        float _296 = 1.0 / _294;
        float _298 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _300 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _302 = fma(_296, _298, _300);
        float _304 = _302 * 8.0;
        float _306 = precise::clamp(_304, 0.0, 1.0);
        float _308 = _252 * _306;
        _270 = _308;
    }
    float _310 = _270;
    float _312 = 0.0 + _310;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    out.m_44.x = _260;
    out.m_44.y = _262;
    out.m_44.z = _258;
    out.m_44.w = _314;
    return out;
}

