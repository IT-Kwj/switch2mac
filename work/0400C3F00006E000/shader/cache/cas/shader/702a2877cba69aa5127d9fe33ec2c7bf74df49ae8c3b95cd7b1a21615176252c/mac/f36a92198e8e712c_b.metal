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
    float2 _320 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_320, float2(0.0), isnan(_320))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_320, float2(0.0), isnan(_320))).xyzw;
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
    float _98 = _67 * _94;
    float _100 = in.m_39.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_35.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_39.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_39.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = _67 * _104;
    float _126 = _67 * _116;
    float _128 = _82 * _96;
    float _130 = 0.0 + _128;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = _132 * _98;
    bool _138 = _134 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _140 = isnan(_134);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _146 = _142 || _144;
    float _148 = in.m_35.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_35.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    if (!_146)
    {
        discard_fragment();
    }
    float _160 = _76 * _76;
    float _162 = _78 * _78;
    float _164 = _67 * _152;
    float _166 = _67 * _158;
    float _168 = _67 * _110;
    float _170 = _67 * _122;
    float _172 = -_124;
    float _174 = _164 + _172;
    float _176 = -_126;
    float _178 = _166 + _176;
    float _180 = _80 * _80;
    float _182 = -_170;
    float _184 = _168 + _182;
    float _186 = fma(_160, _174, _124);
    float _188 = fma(_162, _178, _126);
    float _190 = fma(_180, _184, _170);
    if (!_146)
    {
        out.m_42.x = _186;
        out.m_42.y = _188;
        out.m_42.z = _190;
        out.m_42.w = _128;
        return out;
    }
    float _192 = in.m_44.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_44.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_44.y;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_44.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = 0.0 + _134;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    bool _220 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _222 = _67 * _196;
    float _224 = _67 * _202;
    float _226 = _67 * _208;
    float _228 = _67 * _214;
    float _230 = fma(_186, _224, _222);
    float _232 = fma(_188, _224, _226);
    float _234 = fma(_190, _224, _228);
    float _236 = _222;
    if (!_220)
    {
        _236 = _218;
    }
    float _238 = _236;
    bool _240 = !_220;
    float _242 = _238;
    if (!_240)
    {
        float _244 = in.m_46.w;
        float _246 = gl_FragCoord.w;
        float _248 = _244 * _246;
        float _250 = in.m_46.z;
        float _252 = gl_FragCoord.w;
        float _254 = _250 * _252;
        float _256 = _67 * _248;
        float _258 = _67 * _254;
        float _260 = 1.0 / _256;
        float _262 = _258 * _260;
        float _264 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _266 = fma(_262, (*spvDescriptorSet0.fp_c8)._m0[30].w, _264);
        float _268 = 1.0 / _266;
        float _270 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _272 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _274 = fma(_268, _270, _272);
        float _276 = _274 * 8.0;
        float _278 = precise::clamp(_276, 0.0, 1.0);
        float _280 = _218 * _278;
        _242 = _280;
    }
    float _282 = _242;
    float _284 = 0.0 + _282;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    out.m_42.x = _230;
    out.m_42.y = _232;
    out.m_42.z = _234;
    out.m_42.w = _286;
    return out;
}

