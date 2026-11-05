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
    float4 m_44 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
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
    float2 _294 = float2(_67, _69);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_294, float2(0.0), isnan(_294))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_294, float2(0.0), isnan(_294))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = in.m_35.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_37.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = _65 * _86;
    float _96 = _65 * _92;
    float _98 = in.m_39.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_35.z;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_39.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_39.z;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = _65 * _102;
    float _124 = _65 * _114;
    float _126 = _80 * _94;
    float _128 = 0.0 + _126;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = _130 * _96;
    bool _136 = _132 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _138 = isnan(_132);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _144 = _140 || _142;
    float _146 = in.m_35.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_35.y;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    if (!_144)
    {
        discard_fragment();
    }
    float _158 = _65 * _150;
    float _160 = _65 * _156;
    float _162 = _65 * _108;
    float _164 = _65 * _120;
    float _166 = -_122;
    float _168 = _158 + _166;
    float _170 = -_124;
    float _172 = _160 + _170;
    float _174 = -_164;
    float _176 = _162 + _174;
    float _178 = fma(_74, _168, _122);
    float _180 = fma(_76, _172, _124);
    float _182 = fma(_78, _176, _164);
    if (!_144)
    {
        out.m_42.x = _178;
        out.m_42.y = _180;
        out.m_42.z = _182;
        out.m_42.w = _126;
        return out;
    }
    float _184 = _180 * 0.715200006961822509765625;
    float _186 = 0.0 + _132;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = fma(_178, 0.2125999927520751953125, _184);
    bool _192 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _194 = fma(_182, 0.072200000286102294921875, _190);
    float _196 = 1.0 / _194;
    float _198 = _196 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = fma(_200, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _204 = _178 * _202;
    float _206 = _180 * _202;
    float _208 = _182 * _202;
    float _210 = _202;
    if (!_192)
    {
        _210 = _188;
    }
    float _212 = _210;
    bool _214 = !_192;
    float _216 = _212;
    if (!_214)
    {
        float _218 = in.m_44.w;
        float _220 = gl_FragCoord.w;
        float _222 = _218 * _220;
        float _224 = in.m_44.z;
        float _226 = gl_FragCoord.w;
        float _228 = _224 * _226;
        float _230 = _65 * _222;
        float _232 = _65 * _228;
        float _234 = 1.0 / _230;
        float _236 = _232 * _234;
        float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _240 = fma(_236, (*spvDescriptorSet0.fp_c8)._m0[30].w, _238);
        float _242 = 1.0 / _240;
        float _244 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _246 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _248 = fma(_242, _244, _246);
        float _250 = _248 * 8.0;
        float _252 = precise::clamp(_250, 0.0, 1.0);
        float _254 = _188 * _252;
        _216 = _254;
    }
    float _256 = _216;
    float _258 = 0.0 + _256;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    out.m_42.x = _204;
    out.m_42.y = _206;
    out.m_42.z = _208;
    out.m_42.w = _260;
    return out;
}

