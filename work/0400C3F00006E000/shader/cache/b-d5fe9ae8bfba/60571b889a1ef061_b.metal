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
    float2 _304 = float2(_67, _69);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_304, float2(0.0), isnan(_304))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_304, float2(0.0), isnan(_304))).xyzw;
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
    float _168 = _65 * _160;
    float _170 = _65 * _166;
    float _172 = _65 * _110;
    float _174 = _65 * _128;
    float _176 = -_130;
    float _178 = _168 + _176;
    float _180 = -_132;
    float _182 = _170 + _180;
    float _184 = -_174;
    float _186 = _172 + _184;
    float _188 = fma(_74, _178, _130);
    float _190 = fma(_76, _182, _132);
    float _192 = fma(_78, _186, _174);
    if (!_154)
    {
        out.m_42.x = _188;
        out.m_42.y = _190;
        out.m_42.z = _192;
        out.m_42.w = _136;
        return out;
    }
    float _194 = _190 * 0.715200006961822509765625;
    float _196 = 0.0 + _142;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = fma(_188, 0.2125999927520751953125, _194);
    bool _202 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _204 = fma(_192, 0.072200000286102294921875, _200);
    float _206 = 1.0 / _204;
    float _208 = _206 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = fma(_210, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _214 = _188 * _212;
    float _216 = _190 * _212;
    float _218 = _192 * _212;
    float _220 = _212;
    if (!_202)
    {
        _220 = _198;
    }
    float _222 = _220;
    bool _224 = !_202;
    float _226 = _222;
    if (!_224)
    {
        float _228 = in.m_44.w;
        float _230 = gl_FragCoord.w;
        float _232 = _228 * _230;
        float _234 = in.m_44.z;
        float _236 = gl_FragCoord.w;
        float _238 = _234 * _236;
        float _240 = _65 * _232;
        float _242 = _65 * _238;
        float _244 = 1.0 / _240;
        float _246 = _242 * _244;
        float _248 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _250 = fma(_246, (*spvDescriptorSet0.fp_c8)._m0[30].w, _248);
        float _252 = 1.0 / _250;
        float _254 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _256 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _258 = fma(_252, _254, _256);
        float _260 = _258 * 8.0;
        float _262 = precise::clamp(_260, 0.0, 1.0);
        float _264 = _198 * _262;
        _226 = _264;
    }
    float _266 = _226;
    float _268 = 0.0 + _266;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    out.m_42.x = _214;
    out.m_42.y = _216;
    out.m_42.z = _218;
    out.m_42.w = _270;
    return out;
}

