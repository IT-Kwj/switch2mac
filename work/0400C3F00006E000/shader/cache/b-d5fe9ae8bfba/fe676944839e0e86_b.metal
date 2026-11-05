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
    float4 m_44 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_33.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _312 = float2(_67, _69);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_312, float2(0.0), isnan(_312))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_312, float2(0.0), isnan(_312))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = in.m_35.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_37.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_39.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = _65 * _86;
    float _102 = _65 * _92;
    float _104 = _65 * _98;
    float _106 = in.m_35.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_37.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_37.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_37.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _65 * _116;
    float _132 = _65 * _122;
    float _134 = -_100;
    float _136 = _80 + _134;
    float _138 = _102 * _136;
    float _140 = 0.0 + _138;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _142 * _104;
    bool _148 = _144 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _150 = isnan(_144);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _156 = _152 || _154;
    float _158 = in.m_35.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_35.y;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    if (!_156)
    {
        discard_fragment();
    }
    float _170 = _74 * _74;
    float _172 = _76 * _76;
    float _174 = _65 * _162;
    float _176 = _65 * _168;
    float _178 = _65 * _110;
    float _180 = _65 * _128;
    float _182 = -_130;
    float _184 = _174 + _182;
    float _186 = -_132;
    float _188 = _176 + _186;
    float _190 = _78 * _78;
    float _192 = -_180;
    float _194 = _178 + _192;
    float _196 = fma(_170, _184, _130);
    float _198 = fma(_172, _188, _132);
    float _200 = fma(_190, _194, _180);
    if (!_156)
    {
        out.m_42.x = _196;
        out.m_42.y = _198;
        out.m_42.z = _200;
        out.m_42.w = _138;
        return out;
    }
    float _202 = _198 * 0.715200006961822509765625;
    float _204 = 0.0 + _144;
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = fma(_196, 0.2125999927520751953125, _202);
    bool _210 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _212 = fma(_200, 0.072200000286102294921875, _208);
    float _214 = 1.0 / _212;
    float _216 = _214 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = fma(_218, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _222 = _196 * _220;
    float _224 = _198 * _220;
    float _226 = _200 * _220;
    float _228 = _220;
    if (!_210)
    {
        _228 = _206;
    }
    float _230 = _228;
    bool _232 = !_210;
    float _234 = _230;
    if (!_232)
    {
        float _236 = in.m_44.w;
        float _238 = gl_FragCoord.w;
        float _240 = _236 * _238;
        float _242 = in.m_44.z;
        float _244 = gl_FragCoord.w;
        float _246 = _242 * _244;
        float _248 = _65 * _240;
        float _250 = _65 * _246;
        float _252 = 1.0 / _248;
        float _254 = _250 * _252;
        float _256 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _258 = fma(_254, (*spvDescriptorSet0.fp_c8)._m0[30].w, _256);
        float _260 = 1.0 / _258;
        float _262 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _264 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _266 = fma(_260, _262, _264);
        float _268 = _266 * 8.0;
        float _270 = precise::clamp(_268, 0.0, 1.0);
        float _272 = _206 * _270;
        _234 = _272;
    }
    float _274 = _234;
    float _276 = 0.0 + _274;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    out.m_42.x = _222;
    out.m_42.y = _224;
    out.m_42.z = _226;
    out.m_42.w = _278;
    return out;
}

