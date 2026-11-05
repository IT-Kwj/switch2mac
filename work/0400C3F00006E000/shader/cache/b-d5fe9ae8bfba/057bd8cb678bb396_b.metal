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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _59;
    float _99 = _97 * _65;
    float _101 = _97 * _71;
    float _103 = _97 * _77;
    float _105 = _97 * _83;
    float _107 = _97 * _89;
    float _109 = _97 * _95;
    float2 _455 = float2(_99, _101);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_455, float2(0.0), isnan(_455))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_455, float2(0.0), isnan(_455))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _474 = float2(_103, _105);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_474, float2(0.0), isnan(_474))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float2 _490 = float2(_107, _109);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_490, float2(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_490, float2(0.0), isnan(_490))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float _142 = in.m_41.w;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_43.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_45.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _97 * _146;
    float _162 = in.m_41.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_41.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _97 * _166;
    float _176 = _97 * _172;
    float _178 = _120 * _130;
    float _180 = _97 * _152;
    float _182 = -_160;
    float _184 = fma(_178, _140, _182);
    float _186 = _180 * _184;
    float _188 = _97 * _158;
    float _190 = 0.0 + _186;
    float _192 = precise::clamp(_190, 0.0, 1.0);
    float _194 = _192 * _188;
    bool _198 = _194 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _200 = isnan(_194);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _206 = _202 || _204;
    float _208 = in.m_43.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_43.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_41.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_43.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    if (!_206)
    {
        discard_fragment();
    }
    float _232 = _114 * _114;
    float _234 = _116 * _116;
    float _236 = fma(_232, _124, _134);
    float _238 = _118 * _118;
    float _240 = fma(_234, _126, _136);
    float _242 = fma(_238, _128, _138);
    float _244 = _97 * _212;
    float _246 = _97 * _218;
    float _248 = _97 * _224;
    float _250 = _97 * _230;
    float _252 = -_244;
    float _254 = _174 + _252;
    float _256 = -_246;
    float _258 = _176 + _256;
    float _260 = -_250;
    float _262 = _248 + _260;
    float _264 = fma(_240, _254, _244);
    float _266 = fma(_236, _258, _246);
    float _268 = fma(_242, _262, _250);
    if (!_206)
    {
        out.m_48.x = _266;
        out.m_48.y = _264;
        out.m_48.z = _268;
        out.m_48.w = _186;
        return out;
    }
    float _270 = _264 * 0.715200006961822509765625;
    float _272 = in.m_50.w;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_50.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_50.x;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = fma(_266, 0.2125999927520751953125, _270);
    float _292 = in.m_50.y;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = fma(_268, 0.072200000286102294921875, _290);
    bool _300 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _302 = 1.0 / _298;
    float _304 = _302 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = fma(_306, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _310 = _97 * _276;
    float _312 = _97 * _282;
    float _314 = _308 * _310;
    float _316 = 0.0 + _194;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    float _320 = _97 * _288;
    float _322 = _97 * _296;
    float _324 = fma(_268, _314, _312);
    float _326 = fma(_266, _314, _320);
    float _328 = fma(_264, _314, _322);
    float _330 = _312;
    if (!_300)
    {
        _330 = _318;
    }
    float _332 = _330;
    bool _334 = !_300;
    float _336 = _332;
    if (!_334)
    {
        float _338 = in.m_52.w;
        float _340 = gl_FragCoord.w;
        float _342 = _338 * _340;
        float _344 = in.m_52.z;
        float _346 = gl_FragCoord.w;
        float _348 = _344 * _346;
        float _350 = _97 * _342;
        float _352 = _97 * _348;
        float _354 = 1.0 / _350;
        float _356 = _352 * _354;
        float _358 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _360 = fma(_356, (*spvDescriptorSet0.fp_c8)._m0[30].w, _358);
        float _362 = 1.0 / _360;
        float _364 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _366 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _368 = fma(_362, _364, _366);
        float _370 = _368 * 8.0;
        float _372 = precise::clamp(_370, 0.0, 1.0);
        float _374 = _318 * _372;
        _336 = _374;
    }
    float _376 = _336;
    float _378 = 0.0 + _376;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    out.m_48.x = _326;
    out.m_48.y = _328;
    out.m_48.z = _324;
    out.m_48.w = _380;
    return out;
}

