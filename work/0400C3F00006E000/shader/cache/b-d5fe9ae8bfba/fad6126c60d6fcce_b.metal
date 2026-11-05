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
    float4 m_37 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_42 [[user(locn10)]];
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
    float2 _288 = float2(_67, _69);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_288, float2(0.0), isnan(_288))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_288, float2(0.0), isnan(_288))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = in.m_35.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_37.z;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = _65 * _86;
    float _96 = _65 * _92;
    float _98 = 0.0 + _80;
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = _100 * _94;
    bool _106 = _102 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _108 = isnan(_102);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _114 = _110 || _112;
    float _116 = in.m_37.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_37.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    if (!_114)
    {
        discard_fragment();
    }
    float _128 = _65 * _120;
    float _130 = _74 * _74;
    float _132 = _76 * _76;
    float _134 = _65 * _126;
    float _136 = _78 * _78;
    float _138 = _128 * _130;
    float _140 = _134 * _132;
    float _142 = _96 * _136;
    if (!_114)
    {
        out.m_40.x = _138;
        out.m_40.y = _140;
        out.m_40.z = _142;
        out.m_40.w = _80;
        return out;
    }
    float _144 = _140 * 0.715200006961822509765625;
    float _146 = in.m_42.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_42.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_42.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = fma(_138, 0.2125999927520751953125, _144);
    float _166 = in.m_42.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = 0.0 + _102;
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = fma(_142, 0.072200000286102294921875, _164);
    bool _178 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _180 = 1.0 / _176;
    float _182 = _180 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _188 = _65 * _150;
    float _190 = _65 * _156;
    float _192 = _186 * _188;
    float _194 = _65 * _162;
    float _196 = _65 * _170;
    float _198 = fma(_142, _192, _190);
    float _200 = fma(_138, _192, _194);
    float _202 = fma(_140, _192, _196);
    float _204 = _190;
    if (!_178)
    {
        _204 = _174;
    }
    float _206 = _204;
    bool _208 = !_178;
    float _210 = _206;
    if (!_208)
    {
        float _212 = in.m_44.w;
        float _214 = gl_FragCoord.w;
        float _216 = _212 * _214;
        float _218 = in.m_44.z;
        float _220 = gl_FragCoord.w;
        float _222 = _218 * _220;
        float _224 = _65 * _216;
        float _226 = _65 * _222;
        float _228 = 1.0 / _224;
        float _230 = _226 * _228;
        float _232 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _234 = fma(_230, (*spvDescriptorSet0.fp_c8)._m0[30].w, _232);
        float _236 = 1.0 / _234;
        float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _240 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _242 = fma(_236, _238, _240);
        float _244 = _242 * 8.0;
        float _246 = precise::clamp(_244, 0.0, 1.0);
        float _248 = _174 * _246;
        _210 = _248;
    }
    float _250 = _210;
    float _252 = 0.0 + _250;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    out.m_40.x = _200;
    out.m_40.y = _202;
    out.m_40.z = _198;
    out.m_40.w = _254;
    return out;
}

