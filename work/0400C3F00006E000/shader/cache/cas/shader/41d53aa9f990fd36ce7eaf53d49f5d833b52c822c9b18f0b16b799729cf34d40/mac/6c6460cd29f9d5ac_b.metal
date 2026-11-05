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
    float4 m_41 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
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
    float2 _372 = float2(_71, _73);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_372, float2(0.0), isnan(_372))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_372, float2(0.0), isnan(_372))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_35.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_37.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_39.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _69 * _90;
    float _106 = _69 * _96;
    float _108 = in.m_37.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_41.y;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_37.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_41.z;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_35.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_35.y;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_35.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = _69 * _118;
    float _152 = _69 * _124;
    float _154 = _84 * _104;
    float _156 = _106 * _154;
    float _158 = _69 * _102;
    float _160 = 0.0 + _156;
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = _162 * _158;
    bool _168 = _164 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _170 = isnan(_164);
    bool _172 = _168 || _170;
    bool _174 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _176 = _172 || _174;
    float _178 = in.m_37.x;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_41.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    if (!_176)
    {
        discard_fragment();
    }
    float _190 = _69 * _182;
    float _192 = _69 * _188;
    float _194 = _69 * _112;
    float _196 = _69 * _130;
    float _198 = -_192;
    float _200 = _190 + _198;
    float _202 = -_150;
    float _204 = _194 + _202;
    float _206 = -_196;
    float _208 = _152 + _206;
    float _210 = fma(_78, _200, _192);
    float _212 = fma(_80, _204, _150);
    float _214 = fma(_82, _208, _196);
    float _216 = _69 * _136;
    float _218 = _69 * _142;
    float _220 = _69 * _148;
    float _222 = _210 * _216;
    float _224 = _212 * _218;
    float _226 = _214 * _220;
    if (!_176)
    {
        out.m_44.x = _222;
        out.m_44.y = _224;
        out.m_44.z = _226;
        out.m_44.w = _156;
        return out;
    }
    float _228 = _224 * 0.715200006961822509765625;
    float _230 = in.m_46.w;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_46.z;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_46.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = fma(_222, 0.2125999927520751953125, _228);
    float _250 = in.m_46.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = fma(_226, 0.072200000286102294921875, _248);
    bool _258 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _260 = 1.0 / _256;
    float _262 = _260 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _69 * _234;
    float _268 = fma(_264, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _270 = _69 * _240;
    float _272 = _268 * _266;
    float _274 = 0.0 + _164;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _69 * _246;
    float _280 = _69 * _254;
    float _282 = fma(_226, _272, _270);
    float _284 = fma(_222, _272, _278);
    float _286 = fma(_224, _272, _280);
    float _288 = _270;
    if (!_258)
    {
        _288 = _276;
    }
    float _290 = _288;
    bool _292 = !_258;
    float _294 = _290;
    if (!_292)
    {
        float _296 = in.m_48.w;
        float _298 = gl_FragCoord.w;
        float _300 = _296 * _298;
        float _302 = in.m_48.z;
        float _304 = gl_FragCoord.w;
        float _306 = _302 * _304;
        float _308 = _69 * _300;
        float _310 = _69 * _306;
        float _312 = 1.0 / _308;
        float _314 = _310 * _312;
        float _316 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _318 = fma(_314, (*spvDescriptorSet0.fp_c8)._m0[30].w, _316);
        float _320 = 1.0 / _318;
        float _322 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _324 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _326 = fma(_320, _322, _324);
        float _328 = _326 * 8.0;
        float _330 = precise::clamp(_328, 0.0, 1.0);
        float _332 = _276 * _330;
        _294 = _332;
    }
    float _334 = _294;
    float _336 = 0.0 + _334;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    out.m_44.x = _284;
    out.m_44.y = _286;
    out.m_44.z = _282;
    out.m_44.w = _338;
    return out;
}

