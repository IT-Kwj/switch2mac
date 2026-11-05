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
    texture2d<float> fp_t_tcb_34 [[id(9)]];
    sampler fp_t_tcb_34Smplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_34Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_60 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
    float4 m_47 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_41.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_41.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_43.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_43.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = 1.0 / _67;
    float _119 = _117 * _73;
    float _121 = _117 * _79;
    float _123 = _117 * _85;
    float _125 = _117 * _91;
    float _127 = _117 * _97;
    float _129 = _117 * _103;
    float _131 = _117 * _109;
    float _133 = _117 * _115;
    float2 _605 = float2(_119, _121);
    float4 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_605, float2(0.0), isnan(_605))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_605, float2(0.0), isnan(_605))).xyzw;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = _136.w;
    float2 _624 = float2(_123, _125);
    float4 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_624, float2(0.0), isnan(_624))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_624, float2(0.0), isnan(_624))).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    float2 _640 = float2(_127, _129);
    float4 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_640, float2(0.0), isnan(_640))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_640, float2(0.0), isnan(_640))).xyzw;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _156.w;
    float2 _656 = float2(_131, _133);
    float4 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_656, float2(0.0), isnan(_656))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_656, float2(0.0), isnan(_656))).xyzw;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float _176 = in.m_45.y;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_45.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_45.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_47.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_47.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_47.z;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = _117 * _180;
    float _214 = _117 * _186;
    float _216 = _117 * _192;
    float _218 = _212 * _212;
    float _220 = fma(_214, _214, _218);
    float _222 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _224 = _222 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _226 = fma(_216, _216, _220);
    float _228 = _117 * _198;
    float _230 = 1.0 / _224;
    float _232 = in.m_49.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = rsqrt(_226);
    float _240 = in.m_51.w;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = _212 * _238;
    float _248 = _214 * _238;
    float _250 = _216 * _238;
    float _252 = _228 * _246;
    float _254 = _117 * _204;
    float _256 = in.m_53.w;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = fma(_254, _248, _252);
    float _264 = _117 * _210;
    float _266 = _117 * _236;
    float _268 = fma(_264, _250, _262);
    float _270 = abs(_268);
    float _272 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _274 = _270 + _272;
    float _276 = _274 * _230;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = fma(_278, -2.0, 3.0);
    float _282 = _278 * _278;
    float _284 = _280 * _282;
    float _286 = _117 * _260;
    float _288 = in.m_55.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_51.y;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_55.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_51.z;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_55.z;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = _144 + _154;
    float _320 = _117 * _244;
    float _322 = _318 + _164;
    float _324 = _322 * _174;
    float _326 = _324 * _286;
    float _328 = _320 * _326;
    float _330 = 0.0 + _328;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _332 * _284;
    float _336 = _334 * _266;
    bool _340 = _336 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _342 = isnan(_336);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _348 = _344 || _346;
    float _350 = in.m_51.x;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_53.x;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_53.y;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_53.z;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    if (!_348)
    {
        discard_fragment();
    }
    float _374 = _140 + _150;
    float _376 = _138 + _148;
    float _378 = _142 + _152;
    float _380 = _117 * _298;
    float _382 = _374 + _160;
    float _384 = _376 + _158;
    float _386 = _117 * _292;
    float _388 = _378 + _162;
    float _390 = _382 * _170;
    float _392 = _117 * _304;
    float _394 = _117 * _310;
    float _396 = _117 * _316;
    float _398 = _384 * _168;
    float _400 = _388 * _172;
    float _402 = -_392;
    float _404 = _380 + _402;
    float _406 = _117 * _354;
    float _408 = -_396;
    float _410 = _394 + _408;
    float _412 = _117 * _360;
    float _414 = fma(_390, _404, _392);
    float _416 = -_386;
    float _418 = _406 + _416;
    float _420 = fma(_400, _410, _396);
    float _422 = _117 * _366;
    float _424 = fma(_398, _418, _386);
    float _426 = _117 * _372;
    float _428 = _414 * _422;
    float _430 = _424 * _412;
    float _432 = _420 * _426;
    if (!_348)
    {
        out.m_58.x = _430;
        out.m_58.y = _428;
        out.m_58.z = _432;
        out.m_58.w = _328;
        return out;
    }
    float _434 = _428 * 0.715200006961822509765625;
    float _436 = 0.0 + _336;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = fma(_430, 0.2125999927520751953125, _434);
    bool _442 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _444 = fma(_432, 0.072200000286102294921875, _440);
    float _446 = 1.0 / _444;
    float _448 = _446 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = fma(_450, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _454 = _430 * _452;
    float _456 = _428 * _452;
    float _458 = _432 * _452;
    float _460 = _452;
    if (!_442)
    {
        _460 = _438;
    }
    float _462 = _460;
    bool _464 = !_442;
    float _466 = _462;
    if (!_464)
    {
        float _468 = in.m_60.w;
        float _470 = gl_FragCoord.w;
        float _472 = _468 * _470;
        float _474 = in.m_60.z;
        float _476 = gl_FragCoord.w;
        float _478 = _474 * _476;
        float _480 = _117 * _472;
        float _482 = _117 * _478;
        float _484 = 1.0 / _480;
        float _486 = _482 * _484;
        float _488 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _490 = fma(_486, (*spvDescriptorSet0.fp_c8)._m0[30].w, _488);
        float _492 = 1.0 / _490;
        float _494 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _496 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _498 = fma(_492, _494, _496);
        float _500 = _498 * 8.0;
        float _502 = precise::clamp(_500, 0.0, 1.0);
        float _504 = _438 * _502;
        _466 = _504;
    }
    float _506 = _466;
    float _508 = 0.0 + _506;
    float _510 = precise::clamp(_508, 0.0, 1.0);
    out.m_58.x = _454;
    out.m_58.y = _456;
    out.m_58.z = _458;
    out.m_58.w = _510;
    return out;
}

