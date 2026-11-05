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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
    float4 m_58 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _65;
    float _81 = _79 * _71;
    float _83 = _79 * _77;
    float2 _573 = float2(_81, _83);
    float2 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_573, float2(0.0), isnan(_573))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_573, float2(0.0), isnan(_573))).xy;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = in.m_39.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_37.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_37.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_39.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _79 * _97;
    float _125 = _79 * _103;
    float _127 = _79 * _109;
    float _129 = _79 * _115;
    float _131 = _79 * _121;
    float _133 = 1.0 / _123;
    float _135 = _125 * _133;
    float _137 = _131 * _133;
    float2 _647 = float2(_135, _137);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_647, float2(0.0), isnan(_647))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_647, float2(0.0), isnan(_647))).x;
    float _141 = fma(_89, (*spvDescriptorSet0.fp_c9)._m0[191].x, _127);
    float _143 = fma(_91, (*spvDescriptorSet0.fp_c9)._m0[191].x, _129);
    float2 _668 = float2(_141, _143);
    float4 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_668, float2(0.0), isnan(_668))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_668, float2(0.0), isnan(_668))).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    float _156 = in.m_41.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_41.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_41.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_43.y;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_43.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_43.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_39.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_45.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_47.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = _79 * _160;
    float _212 = _79 * _166;
    float _214 = _79 * _172;
    float _216 = _210 * _210;
    float _218 = fma(_212, _212, _216);
    float _220 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _222 = _220 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _224 = fma(_214, _214, _218);
    float _226 = _79 * _178;
    float _228 = 1.0 / _222;
    float _230 = rsqrt(_224);
    float _232 = in.m_49.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = _210 * _230;
    float _240 = _79 * _184;
    float _242 = _226 * _238;
    float _244 = _212 * _230;
    float _246 = _214 * _230;
    float _248 = _79 * _190;
    float _250 = _79 * _196;
    float _252 = fma(_240, _244, _242);
    float _254 = in.m_51.w;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = _79 * _208;
    float _262 = _250 * _133;
    float _264 = fma(_248, _246, _252);
    float _266 = _79 * _202;
    float _268 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _270 = fma(_262, (*spvDescriptorSet0.fp_c8)._m0[30].w, _268);
    float _272 = abs(_264);
    float _274 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _280 = fma(_139, (*spvDescriptorSet0.fp_c8)._m0[30].w, _278);
    float _282 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _284 = _276 * _228;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = fma(_286, -2.0, 3.0);
    float _290 = _286 * _286;
    float _292 = -_266;
    float _294 = _292 + 1.0;
    float _296 = 1.0 / _270;
    float _298 = -_266;
    float _300 = _298 + 1.39999997615814208984375;
    float _302 = _288 * _290;
    float _304 = 1.0 / _280;
    float _306 = in.m_45.x;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_51.y;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_45.y;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_51.z;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_45.z;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = _154 * _260;
    float _338 = precise::max(_336, _294);
    float _340 = precise::min(_300, _338);
    float _342 = -_294;
    float _344 = _342 + _340;
    float _346 = _79 * _258;
    float _348 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _350 = _296 * _348;
    float _352 = _344 * 2.5000002384185791015625;
    float _354 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _356 = -_350;
    float _358 = fma(_304, _354, _356);
    float _360 = _346 * _352;
    float _362 = _358 * _282;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = 0.0 + _360;
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _368 * _364;
    float _372 = _79 * _236;
    float _374 = _370 * _302;
    float _376 = _374 * _372;
    bool _380 = _376 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _382 = isnan(_376);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _388 = _384 || _386;
    float _390 = in.m_53.y;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = _376;
    if (!_388)
    {
        discard_fragment();
    }
    float _398 = in.m_51.x;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = _148 * _148;
    float _406 = _150 * _150;
    float _408 = _152 * _152;
    float _410 = _79 * _334;
    float _412 = _79 * _394;
    float _414 = _260 * _412;
    float _416 = _79 * _316;
    float _418 = _404 * _414;
    float _420 = _79 * _322;
    float _422 = precise::max(_418, 0.4000000059604644775390625);
    float _424 = -_416;
    float _426 = _424 + _420;
    float _428 = precise::min(_422, 0.60000002384185791015625);
    float _430 = fma(_428, 9.99999904632568359375, -3.9999997615814208984375);
    float _432 = _79 * _402;
    float _434 = fma(_406, _414, _430);
    float _436 = fma(_408, _414, _430);
    float _438 = _79 * _310;
    float _440 = _79 * _328;
    float _442 = _418 + _430;
    float _444 = fma(_434, _426, _416);
    float _446 = -_432;
    float _448 = _446 + _438;
    float _450 = -_440;
    float _452 = _450 + _410;
    float _454 = fma(_442, _448, _432);
    float _456 = fma(_436, _452, _440);
    if (!_388)
    {
        out.m_56.x = _454;
        out.m_56.y = _444;
        out.m_56.z = _456;
        out.m_56.w = _360;
        return out;
    }
    float _458 = _444 * 0.715200006961822509765625;
    float _460 = in.m_58.w;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_58.x;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_58.y;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = fma(_454, 0.2125999927520751953125, _458);
    float _480 = in.m_58.z;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = fma(_456, 0.072200000286102294921875, _478);
    bool _488 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _490 = 1.0 / _486;
    float _492 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_488)
    {
        float _494 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _496 = _350 + _494;
        _492 = _496;
    }
    float _498 = _492;
    float _500 = _490 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _502 = precise::clamp(_500, 0.0, 1.0);
    float _504 = fma(_502, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _506 = _79 * _464;
    float _508 = _79 * _476;
    float _510 = _504 * _506;
    float _512 = 0.0 + _376;
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = _514;
    if (_488)
    {
        float _518 = _498 * 8.0;
        float _520 = precise::clamp(_518, 0.0, 1.0);
        _396 = _520;
    }
    float _522 = _396;
    float _524 = _79 * _470;
    float _526 = _79 * _484;
    float _528 = fma(_444, _510, _508);
    if (_488)
    {
        float _530 = _514 * _522;
        _516 = _530;
    }
    float _532 = _516;
    float _534 = fma(_454, _510, _524);
    float _536 = fma(_456, _510, _526);
    float _538 = 0.0 + _532;
    float _540 = precise::clamp(_538, 0.0, 1.0);
    out.m_56.x = _534;
    out.m_56.y = _528;
    out.m_56.z = _536;
    out.m_56.w = _540;
    return out;
}

