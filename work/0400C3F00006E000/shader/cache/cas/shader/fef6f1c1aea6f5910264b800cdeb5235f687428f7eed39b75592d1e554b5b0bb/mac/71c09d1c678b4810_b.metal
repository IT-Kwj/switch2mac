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
    float2 _324 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_324, float2(0.0), isnan(_324))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_324, float2(0.0), isnan(_324))).xyzw;
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
    float _96 = in.m_35.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _67 * _88;
    float _104 = in.m_35.z;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_39.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_39.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_39.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = _67 * _100;
    float _130 = _67 * _108;
    float _132 = _67 * _114;
    float _134 = _67 * _120;
    float _136 = _67 * _126;
    float _138 = _82 * _102;
    float _140 = _67 * _94;
    float _142 = 0.0 + _138;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _144 * _140;
    bool _150 = _146 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _152 = isnan(_146);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _158 = _154 || _156;
    float _160 = in.m_35.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    if (!_158)
    {
        discard_fragment();
    }
    float _166 = _76 * _76;
    float _168 = _78 * _78;
    float _170 = _80 * _80;
    float _172 = fma(_168, _128, _134);
    float _174 = fma(_170, _130, _136);
    float _176 = _67 * _164;
    float _178 = fma(_166, _176, _132);
    if (!_158)
    {
        out.m_42.x = _178;
        out.m_42.y = _172;
        out.m_42.z = _174;
        out.m_42.w = _138;
        return out;
    }
    float _180 = _172 * 0.715200006961822509765625;
    float _182 = in.m_44.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_44.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_44.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = fma(_178, 0.2125999927520751953125, _180);
    float _202 = in.m_44.y;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = fma(_174, 0.072200000286102294921875, _200);
    bool _210 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _212 = 1.0 / _208;
    float _214 = _212 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = _67 * _186;
    float _220 = fma(_216, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _222 = _67 * _192;
    float _224 = _220 * _218;
    float _226 = 0.0 + _146;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = _67 * _198;
    float _232 = _67 * _206;
    float _234 = fma(_174, _224, _222);
    float _236 = fma(_178, _224, _230);
    float _238 = fma(_172, _224, _232);
    float _240 = _222;
    if (!_210)
    {
        _240 = _228;
    }
    float _242 = _240;
    bool _244 = !_210;
    float _246 = _242;
    if (!_244)
    {
        float _248 = in.m_46.w;
        float _250 = gl_FragCoord.w;
        float _252 = _248 * _250;
        float _254 = in.m_46.z;
        float _256 = gl_FragCoord.w;
        float _258 = _254 * _256;
        float _260 = _67 * _252;
        float _262 = _67 * _258;
        float _264 = 1.0 / _260;
        float _266 = _262 * _264;
        float _268 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _270 = fma(_266, (*spvDescriptorSet0.fp_c8)._m0[30].w, _268);
        float _272 = 1.0 / _270;
        float _274 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _276 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _278 = fma(_272, _274, _276);
        float _280 = _278 * 8.0;
        float _282 = precise::clamp(_280, 0.0, 1.0);
        float _284 = _228 * _282;
        _246 = _284;
    }
    float _286 = _246;
    float _288 = 0.0 + _286;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    out.m_42.x = _236;
    out.m_42.y = _238;
    out.m_42.z = _234;
    out.m_42.w = _290;
    return out;
}

