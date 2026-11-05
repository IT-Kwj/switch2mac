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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_44 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_42 [[user(locn6)]];
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
    float2 _298 = float2(_67, _69);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_298, float2(0.0), isnan(_298))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_298, float2(0.0), isnan(_298))).xyzw;
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
    float _98 = in.m_35.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _80 * _94;
    float _106 = 0.0 + _104;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _108 * _96;
    bool _114 = _110 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _116 = isnan(_110);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _122 = _118 || _120;
    float _124 = in.m_35.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_35.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    if (!_122)
    {
        discard_fragment();
    }
    float _136 = _74 * _74;
    float _138 = _76 * _76;
    float _140 = _78 * _78;
    float _142 = _65 * _128;
    float _144 = _65 * _134;
    float _146 = _65 * _102;
    float _148 = _138 * _142;
    float _150 = _136 * _144;
    float _152 = _140 * _146;
    if (!_122)
    {
        out.m_40.x = _150;
        out.m_40.y = _148;
        out.m_40.z = _152;
        out.m_40.w = _104;
        return out;
    }
    float _154 = _148 * 0.715200006961822509765625;
    float _156 = in.m_42.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_42.z;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_42.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = fma(_150, 0.2125999927520751953125, _154);
    float _176 = in.m_42.y;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = 0.0 + _110;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = fma(_152, 0.072200000286102294921875, _174);
    bool _188 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _190 = 1.0 / _186;
    float _192 = _190 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = fma(_194, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _198 = _65 * _160;
    float _200 = _65 * _166;
    float _202 = _196 * _198;
    float _204 = _65 * _172;
    float _206 = _65 * _180;
    float _208 = fma(_152, _202, _200);
    float _210 = fma(_150, _202, _204);
    float _212 = fma(_148, _202, _206);
    float _214 = _200;
    if (!_188)
    {
        _214 = _184;
    }
    float _216 = _214;
    bool _218 = !_188;
    float _220 = _216;
    if (!_218)
    {
        float _222 = in.m_44.w;
        float _224 = gl_FragCoord.w;
        float _226 = _222 * _224;
        float _228 = in.m_44.z;
        float _230 = gl_FragCoord.w;
        float _232 = _228 * _230;
        float _234 = _65 * _226;
        float _236 = _65 * _232;
        float _238 = 1.0 / _234;
        float _240 = _236 * _238;
        float _242 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _244 = fma(_240, (*spvDescriptorSet0.fp_c8)._m0[30].w, _242);
        float _246 = 1.0 / _244;
        float _248 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _250 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _252 = fma(_246, _248, _250);
        float _254 = _252 * 8.0;
        float _256 = precise::clamp(_254, 0.0, 1.0);
        float _258 = _184 * _256;
        _220 = _258;
    }
    float _260 = _220;
    float _262 = 0.0 + _260;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    out.m_40.x = _210;
    out.m_40.y = _212;
    out.m_40.z = _208;
    out.m_40.w = _264;
    return out;
}

