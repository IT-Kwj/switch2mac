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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _63;
    float _91 = _89 * _69;
    float _93 = _89 * _75;
    float _95 = _89 * _81;
    float _97 = _89 * _87;
    float2 _510 = float2(_91, _97);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_510, float2(0.0), isnan(_510))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_510, float2(0.0), isnan(_510))).w;
    float2 _521 = float2(_93, _95);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_521, float2(0.0), isnan(_521))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float _112 = in.m_41.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_41.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_41.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_43.y;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_43.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_43.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_45.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = _89 * _116;
    float _156 = _89 * _122;
    float _158 = _89 * _128;
    float _160 = _154 * _154;
    float _162 = fma(_156, _156, _160);
    float _164 = _89 * _134;
    float _166 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _168 = _166 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _170 = in.m_47.w;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = fma(_158, _158, _162);
    float _178 = 1.0 / _168;
    float _180 = rsqrt(_176);
    float _182 = _154 * _180;
    float _184 = _164 * _182;
    float _186 = _89 * _140;
    float _188 = _156 * _180;
    float _190 = _158 * _180;
    float _192 = in.m_49.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = fma(_186, _188, _184);
    float _200 = _89 * _146;
    float _202 = fma(_200, _190, _198);
    float _204 = abs(_202);
    float _206 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _208 = _204 + _206;
    float _210 = _208 * _178;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = fma(_212, -2.0, 3.0);
    float _216 = _212 * _212;
    float _218 = _89 * _152;
    float _220 = _214 * _216;
    float _222 = _89 * _196;
    float _224 = in.m_39.w;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = _110 * _99;
    float _232 = _89 * _174;
    float _234 = _230 * _218;
    float _236 = _232 * _234;
    float _238 = 0.0 + _236;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _240 * _220;
    float _244 = _242 * _222;
    bool _248 = _244 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _250 = isnan(_244);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _256 = _252 || _254;
    float _258 = in.m_39.z;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    if (!_256)
    {
        discard_fragment();
    }
    float _264 = _89 * _262;
    float _266 = _89 * _228;
    float2 _755 = float2(_264, _266);
    float3 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_755, float2(0.0), isnan(_755))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_755, float2(0.0), isnan(_755))).xyz;
    float _272 = _270.x;
    float _274 = _270.y;
    float _276 = _270.z;
    float _278 = in.m_47.x;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_51.x;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = in.m_47.y;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_51.y;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_47.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_51.z;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_45.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_45.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_45.z;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = _89 * _300;
    float _334 = _89 * _306;
    float _336 = _104 * _272;
    float _338 = _106 * _274;
    float _340 = _89 * _282;
    float _342 = _89 * _288;
    float _344 = _89 * _294;
    float _346 = _89 * _312;
    float _348 = _108 * _276;
    float _350 = -_342;
    float _352 = _340 + _350;
    float _354 = -_332;
    float _356 = _344 + _354;
    float _358 = -_346;
    float _360 = _334 + _358;
    float _362 = _89 * _330;
    float _364 = fma(_336, _352, _342);
    float _366 = fma(_338, _356, _332);
    float _368 = fma(_348, _360, _346);
    float _370 = _89 * _318;
    float _372 = _89 * _324;
    float _374 = _368 * _362;
    float _376 = _364 * _370;
    float _378 = _366 * _372;
    if (!_256)
    {
        out.m_54.x = _376;
        out.m_54.y = _378;
        out.m_54.z = _374;
        out.m_54.w = _236;
        return out;
    }
    float _380 = _378 * 0.715200006961822509765625;
    float _382 = 0.0 + _244;
    float _384 = precise::clamp(_382, 0.0, 1.0);
    float _386 = fma(_376, 0.2125999927520751953125, _380);
    bool _388 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _390 = fma(_374, 0.072200000286102294921875, _386);
    float _392 = 1.0 / _390;
    float _394 = _392 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = fma(_396, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _400 = _376 * _398;
    float _402 = _378 * _398;
    float _404 = _374 * _398;
    float _406 = _398;
    if (!_388)
    {
        _406 = _384;
    }
    float _408 = _406;
    bool _410 = !_388;
    float _412 = _408;
    if (!_410)
    {
        float _414 = in.m_56.w;
        float _416 = gl_FragCoord.w;
        float _418 = _414 * _416;
        float _420 = in.m_56.z;
        float _422 = gl_FragCoord.w;
        float _424 = _420 * _422;
        float _426 = _89 * _418;
        float _428 = _89 * _424;
        float _430 = 1.0 / _426;
        float _432 = _428 * _430;
        float _434 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _436 = fma(_432, (*spvDescriptorSet0.fp_c8)._m0[30].w, _434);
        float _438 = 1.0 / _436;
        float _440 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _442 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _444 = fma(_438, _440, _442);
        float _446 = _444 * 8.0;
        float _448 = precise::clamp(_446, 0.0, 1.0);
        float _450 = _384 * _448;
        _412 = _450;
    }
    float _452 = _412;
    float _454 = 0.0 + _452;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    out.m_54.x = _400;
    out.m_54.y = _402;
    out.m_54.z = _404;
    out.m_54.w = _456;
    return out;
}

