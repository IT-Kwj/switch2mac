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
    float4 m_46 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
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
    float2 _352 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_352, float2(0.0), isnan(_352))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_352, float2(0.0), isnan(_352))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_35.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_37.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_39.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _67 * _88;
    float _104 = _67 * _94;
    float _106 = in.m_35.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_35.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_37.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_35.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_37.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = _67 * _122;
    float _138 = _67 * _128;
    float _140 = -_102;
    float _142 = _82 + _140;
    float _144 = _142 * 4.0;
    float _146 = precise::clamp(_144, 0.0, 1.0);
    float _148 = _104 * _146;
    float _150 = _67 * _100;
    float _152 = 0.0 + _148;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _154 * _150;
    bool _160 = _156 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _162 = isnan(_156);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _168 = _164 || _166;
    float _170 = in.m_37.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    if (!_168)
    {
        discard_fragment();
    }
    float _176 = _67 * _116;
    float _178 = _67 * _110;
    float _180 = _67 * _134;
    float _182 = _76 * _76;
    float _184 = _78 * _78;
    float _186 = -_136;
    float _188 = _178 + _186;
    float _190 = -_180;
    float _192 = _138 + _190;
    float _194 = fma(_184, _188, _136);
    float _196 = _67 * _174;
    float _198 = -_196;
    float _200 = _176 + _198;
    float _202 = _80 * _80;
    float _204 = fma(_182, _200, _196);
    float _206 = fma(_202, _192, _180);
    if (!_168)
    {
        out.m_42.x = _204;
        out.m_42.y = _194;
        out.m_42.z = _206;
        out.m_42.w = _148;
        return out;
    }
    float _208 = _194 * 0.715200006961822509765625;
    float _210 = in.m_44.w;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_44.z;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_44.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = fma(_204, 0.2125999927520751953125, _208);
    float _230 = in.m_44.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = fma(_206, 0.072200000286102294921875, _228);
    bool _238 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _240 = 1.0 / _236;
    float _242 = _240 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _67 * _214;
    float _248 = fma(_244, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _250 = _67 * _220;
    float _252 = _248 * _246;
    float _254 = 0.0 + _156;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _67 * _226;
    float _260 = _67 * _234;
    float _262 = fma(_206, _252, _250);
    float _264 = fma(_204, _252, _258);
    float _266 = fma(_194, _252, _260);
    float _268 = _250;
    if (!_238)
    {
        _268 = _256;
    }
    float _270 = _268;
    bool _272 = !_238;
    float _274 = _270;
    if (!_272)
    {
        float _276 = in.m_46.w;
        float _278 = gl_FragCoord.w;
        float _280 = _276 * _278;
        float _282 = in.m_46.z;
        float _284 = gl_FragCoord.w;
        float _286 = _282 * _284;
        float _288 = _67 * _280;
        float _290 = _67 * _286;
        float _292 = 1.0 / _288;
        float _294 = _290 * _292;
        float _296 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _298 = fma(_294, (*spvDescriptorSet0.fp_c8)._m0[30].w, _296);
        float _300 = 1.0 / _298;
        float _302 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _304 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _306 = fma(_300, _302, _304);
        float _308 = _306 * 8.0;
        float _310 = precise::clamp(_308, 0.0, 1.0);
        float _312 = _256 * _310;
        _274 = _312;
    }
    float _314 = _274;
    float _316 = 0.0 + _314;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    out.m_42.x = _264;
    out.m_42.y = _266;
    out.m_42.z = _262;
    out.m_42.w = _318;
    return out;
}

