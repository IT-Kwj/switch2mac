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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
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
    float4 m_39 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_43 [[user(locn6), flat]];
    float4 m_37 [[user(locn7)]];
    float4 m_45 [[user(locn8)]];
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
    float2 _526 = float2(_91, _97);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_526, float2(0.0), isnan(_526))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_526, float2(0.0), isnan(_526))).w;
    float2 _537 = float2(_93, _95);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_537, float2(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_537, float2(0.0), isnan(_537))).xyzw;
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
    float _132 = in.m_43.x;
    float _134 = in.m_43.z;
    float _136 = in.m_45.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_45.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_45.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = _89 * _116;
    float _156 = _89 * _122;
    float _158 = _89 * _128;
    float _160 = -_130;
    float _162 = _160 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _164 = _154 * _154;
    float _166 = -_132;
    float _168 = _166 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _170 = -_134;
    float _172 = _170 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _174 = _162 * _162;
    float _176 = fma(_156, _156, _164);
    float _178 = fma(_168, _168, _174);
    float _180 = fma(_158, _158, _176);
    float _182 = _89 * _140;
    float _184 = _89 * _146;
    float _186 = fma(_172, _172, _178);
    float _188 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _190 = _188 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _192 = rsqrt(_180);
    float _194 = sqrt(_186);
    float _196 = _154 * _192;
    float _198 = _156 * _192;
    float _200 = _158 * _192;
    float _202 = 1.0 / _190;
    float _204 = _182 * _196;
    float _206 = in.m_47.w;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = fma(_184, _198, _204);
    float _214 = _89 * _152;
    float _216 = fma(_194, 0.00999999977648258209228515625, -3.0);
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = fma(_194, -0.0199999995529651641845703125, 12.0);
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = fma(_214, _200, _212);
    float _226 = in.m_49.x;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = abs(_224);
    float _234 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _236 = _232 + _234;
    float _238 = fma(_218, -2.0, 3.0);
    float _240 = fma(_222, -2.0, 3.0);
    float _242 = _218 * _218;
    float _244 = _222 * _222;
    float _246 = _236 * _202;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _238 * _242;
    float _252 = _240 * _244;
    float _254 = fma(_248, -2.0, 3.0);
    float _256 = _248 * _248;
    float _258 = _250 * _252;
    float _260 = _254 * _256;
    float _262 = _89 * _210;
    float _264 = in.m_39.w;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = _110 * _99;
    float _272 = _262 * _270;
    float _274 = _89 * _230;
    float _276 = _272 * _258;
    float _278 = 0.0 + _276;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _280 * _260;
    float _284 = _282 * _274;
    bool _288 = _284 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _290 = isnan(_284);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _296 = _292 || _294;
    float _298 = in.m_39.z;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    if (!_296)
    {
        discard_fragment();
    }
    float _304 = _89 * _302;
    float _306 = _89 * _268;
    float2 _830 = float2(_304, _306);
    float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_830, float2(0.0), isnan(_830))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_830, float2(0.0), isnan(_830))).xyz;
    float _312 = _310.x;
    float _314 = _310.y;
    float _316 = _310.z;
    float _318 = in.m_51.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_51.y;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_51.z;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_47.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_47.y;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_47.z;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = _89 * _322;
    float _356 = _106 * _314;
    float _358 = _108 * _316;
    float _360 = _104 * _312;
    float _362 = _89 * _328;
    float _364 = -_356;
    float _366 = _364 + 1.0;
    float _368 = _89 * _334;
    float _370 = -_358;
    float _372 = _370 + 1.0;
    float _374 = -_360;
    float _376 = _374 + 1.0;
    float _378 = _362 * _366;
    float _380 = _368 * _372;
    float _382 = _354 * _376;
    float _384 = _89 * _340;
    float _386 = _89 * _346;
    float _388 = _89 * _352;
    float _390 = fma(_360, _384, _382);
    float _392 = fma(_356, _386, _378);
    float _394 = fma(_358, _388, _380);
    if (!_296)
    {
        out.m_54.x = _390;
        out.m_54.y = _392;
        out.m_54.z = _394;
        out.m_54.w = _276;
        return out;
    }
    float _396 = _392 * 0.715200006961822509765625;
    float _398 = 0.0 + _284;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = fma(_390, 0.2125999927520751953125, _396);
    bool _404 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _406 = fma(_394, 0.072200000286102294921875, _402);
    float _408 = 1.0 / _406;
    float _410 = _408 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = fma(_412, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _416 = _390 * _414;
    float _418 = _392 * _414;
    float _420 = _394 * _414;
    float _422 = _414;
    if (!_404)
    {
        _422 = _400;
    }
    float _424 = _422;
    bool _426 = !_404;
    float _428 = _424;
    if (!_426)
    {
        float _430 = in.m_56.w;
        float _432 = gl_FragCoord.w;
        float _434 = _430 * _432;
        float _436 = in.m_56.z;
        float _438 = gl_FragCoord.w;
        float _440 = _436 * _438;
        float _442 = _89 * _434;
        float _444 = _89 * _440;
        float _446 = 1.0 / _442;
        float _448 = _444 * _446;
        float _450 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _452 = fma(_448, (*spvDescriptorSet0.fp_c8)._m0[30].w, _450);
        float _454 = 1.0 / _452;
        float _456 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _458 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _460 = fma(_454, _456, _458);
        float _462 = _460 * 8.0;
        float _464 = precise::clamp(_462, 0.0, 1.0);
        float _466 = _400 * _464;
        _428 = _466;
    }
    float _468 = _428;
    float _470 = 0.0 + _468;
    float _472 = precise::clamp(_470, 0.0, 1.0);
    out.m_54.x = _416;
    out.m_54.y = _418;
    out.m_54.z = _420;
    out.m_54.w = _472;
    return out;
}

