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
    float2 _310 = float2(_67, _69);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_310, float2(0.0), isnan(_310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_310, float2(0.0), isnan(_310))).xyzw;
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
    float _134 = _80 * _100;
    float _136 = _102 * _134;
    float _138 = 0.0 + _136;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = _140 * _104;
    bool _146 = _142 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _148 = isnan(_142);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _154 = _150 || _152;
    float _156 = in.m_35.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_35.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    if (!_154)
    {
        discard_fragment();
    }
    float _168 = _74 * _74;
    float _170 = _76 * _76;
    float _172 = _65 * _160;
    float _174 = _65 * _166;
    float _176 = _65 * _110;
    float _178 = _65 * _128;
    float _180 = -_130;
    float _182 = _172 + _180;
    float _184 = -_132;
    float _186 = _174 + _184;
    float _188 = _78 * _78;
    float _190 = -_178;
    float _192 = _176 + _190;
    float _194 = fma(_168, _182, _130);
    float _196 = fma(_170, _186, _132);
    float _198 = fma(_188, _192, _178);
    if (!_154)
    {
        out.m_42.x = _194;
        out.m_42.y = _196;
        out.m_42.z = _198;
        out.m_42.w = _136;
        return out;
    }
    float _200 = _196 * 0.715200006961822509765625;
    float _202 = 0.0 + _142;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = fma(_194, 0.2125999927520751953125, _200);
    bool _208 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _210 = fma(_198, 0.072200000286102294921875, _206);
    float _212 = 1.0 / _210;
    float _214 = _212 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = fma(_216, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _220 = _194 * _218;
    float _222 = _196 * _218;
    float _224 = _198 * _218;
    float _226 = _218;
    if (!_208)
    {
        _226 = _204;
    }
    float _228 = _226;
    bool _230 = !_208;
    float _232 = _228;
    if (!_230)
    {
        float _234 = in.m_44.w;
        float _236 = gl_FragCoord.w;
        float _238 = _234 * _236;
        float _240 = in.m_44.z;
        float _242 = gl_FragCoord.w;
        float _244 = _240 * _242;
        float _246 = _65 * _238;
        float _248 = _65 * _244;
        float _250 = 1.0 / _246;
        float _252 = _248 * _250;
        float _254 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _256 = fma(_252, (*spvDescriptorSet0.fp_c8)._m0[30].w, _254);
        float _258 = 1.0 / _256;
        float _260 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _262 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _264 = fma(_258, _260, _262);
        float _266 = _264 * 8.0;
        float _268 = precise::clamp(_266, 0.0, 1.0);
        float _270 = _204 * _268;
        _232 = _270;
    }
    float _272 = _232;
    float _274 = 0.0 + _272;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    out.m_42.x = _220;
    out.m_42.y = _222;
    out.m_42.z = _224;
    out.m_42.w = _276;
    return out;
}

