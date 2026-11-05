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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_45 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_37.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _71;
    float _99 = _97 * _77;
    float _101 = _97 * _83;
    float _103 = _97 * _89;
    float _105 = _97 * _95;
    float2 _725 = float2(_99, _101);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_725, float2(0.0), isnan(_725))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_725, float2(0.0), isnan(_725))).w;
    float2 _736 = float2(_103, _105);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_736, float2(0.0), isnan(_736))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_736, float2(0.0), isnan(_736))).w;
    float _111 = in.m_41.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_43.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = (*spvDescriptorSet0.fp_c10)._m0[13].z * (*spvDescriptorSet0.fp_c10)._m0[13].z;
    float _125 = fma(_123, 0.800000011920928955078125, -0.300000011920928955078125);
    float _127 = fma((*spvDescriptorSet0.fp_c10)._m0[13].y, -0.499999940395355224609375, 1.2999999523162841796875);
    float _129 = _97 * _121;
    float _131 = _107 + _125;
    float _133 = _97 * _115;
    float _135 = _133 + _109;
    bool _138 = _131 >= 0.5;
    bool _140 = isnan(_131);
    bool _142 = _138 || _140;
    bool _144 = isnan(0.5);
    bool _146 = _142 || _144;
    bool _148 = _135 >= _127;
    bool _150 = isnan(_135);
    bool _152 = _148 || _150;
    bool _154 = isnan(_127);
    bool _156 = _152 || _154;
    bool _158 = _156 && _146;
    float _160 = float(_158);
    float _162 = 0.0 + _160;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = _164 * _129;
    bool _168 = _166 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _170 = isnan(_166);
    bool _172 = _168 || _170;
    bool _174 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _176 = _172 || _174;
    float _178 = in.m_39.z;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_39.w;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    if (!_176)
    {
        discard_fragment();
    }
    float _190 = _97 * _182;
    float _192 = _97 * _188;
    float2 _865 = float2(_190, _192);
    float2 _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_865, float2(0.0), isnan(_865))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_865, float2(0.0), isnan(_865))).xy;
    float _198 = _196.x;
    float _200 = _196.y;
    float _202 = in.m_45.y;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_45.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_45.z;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_47.y;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _228 = in.m_47.x;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_47.z;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_53.y;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_53.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_55.y;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_53.z;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = _97 * _206;
    float _266 = _97 * _212;
    float _268 = _97 * _224;
    float _270 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _272 = _264 + _270;
    float _274 = _97 * _218;
    float _276 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _278 = _266 + _276;
    bool _280 = as_type<int>(_226) != 0;
    float _282 = _272 * _272;
    float _284 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _286 = _274 + _284;
    float _288 = in.m_55.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    bool _294 = !_280;
    float _296 = -_268;
    float _298 = _294 ? _296 : _268;
    float _300 = fma(_278, _278, _282);
    float _302 = _97 * _238;
    float _304 = in.m_55.z;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = _97 * _256;
    float _312 = fma(_286, _286, _300);
    float _314 = _97 * _232;
    float _316 = _298 * _298;
    bool _318 = !_280;
    float _320 = -_302;
    float _322 = _318 ? _320 : _302;
    float _324 = rsqrt(_312);
    bool _326 = !_280;
    float _328 = -_314;
    float _330 = _326 ? _328 : _314;
    float _332 = fma(_330, _330, _316);
    float _334 = _97 * _244;
    float _336 = _97 * _250;
    float _338 = fma(_322, _322, _332);
    float _340 = _334 * _334;
    float _342 = _272 * _324;
    float _344 = _342 * 0.5;
    float _346 = _278 * _324;
    float _348 = _286 * _324;
    float _350 = rsqrt(_338);
    float _352 = _344 * _344;
    float _354 = _97 * _292;
    float _356 = fma(_346, _346, _352);
    float _358 = _97 * _262;
    float _360 = fma(_336, _336, _340);
    float _362 = _310 * _310;
    float _364 = fma(_348, _348, _356);
    float _366 = _97 * _308;
    float _368 = fma(_358, _358, _360);
    float _370 = fma(_354, _354, _362);
    float _372 = rsqrt(_364);
    float _374 = _298 * _350;
    float _376 = _330 * _350;
    float _378 = _322 * _350;
    float _380 = fma(_366, _366, _370);
    float _382 = _374 * _374;
    float _384 = rsqrt(_368);
    float _386 = fma(_376, _376, _382);
    float _388 = _344 * _372;
    float _390 = _346 * _372;
    float _392 = _348 * _372;
    float _394 = rsqrt(_380);
    float _396 = _388 * _388;
    float _398 = fma(_378, _378, _386);
    float _400 = fma(_390, _390, _396);
    float _402 = rsqrt(_398);
    float _404 = fma(_392, _392, _400);
    float _406 = rsqrt(_404);
    float _408 = _366 * _394;
    float _410 = in.m_41.z;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = _390 * _406;
    float _418 = _392 * _406;
    float _420 = _97 * _414;
    float _422 = _200 * _200;
    float _424 = _200 * _394;
    float _426 = _198 * _384;
    float _428 = _388 * _406;
    float _430 = fma(_198, _198, _422);
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = _310 * _424;
    float _436 = _354 * _424;
    float _438 = _200 * _408;
    float _440 = -_432;
    float _442 = _440 + 1.0;
    float _444 = fma(_334, _426, _434);
    float _446 = fma(_336, _426, _436);
    float _448 = fma(_358, _426, _438);
    float _450 = in.m_57.x;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = in.m_59.y;
    float _458 = gl_FragCoord.w;
    float _460 = _456 * _458;
    float _462 = sqrt(_442);
    float _464 = in.m_59.z;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = _402 * _462;
    float _472 = in.m_57.z;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = fma(_374, _470, _444);
    float _480 = fma(_376, _470, _446);
    float _482 = fma(_378, _470, _448);
    float _484 = in.m_59.x;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = _478 * _428;
    float _492 = -_420;
    float _494 = _492 + 1.0;
    float _496 = fma(_480, _416, _490);
    float _498 = in.m_57.y;
    float _500 = gl_FragCoord.w;
    float _502 = _498 * _500;
    float _504 = fma((*spvDescriptorSet0.fp_c10)._m0[3].x, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _506 = fma(_482, _418, _496);
    float _508 = fma((*spvDescriptorSet0.fp_c10)._m0[3].x, 0.800000011920928955078125, 0.300000011920928955078125);
    float _510 = abs(_506);
    float _512 = 0.0 + _510;
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = fma(_514, -2.0, 3.0);
    float _518 = _514 * _514;
    float _520 = _516 * _518;
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = _420 + _109;
    float _526 = precise::max(_522, 0.5);
    float _528 = precise::max(_504, _524);
    float _530 = _97 * _460;
    float _532 = precise::min(_526, 1.0);
    float _534 = precise::min(_508, _528);
    float _536 = _97 * _454;
    float _538 = _97 * _468;
    float _540 = fma(_532, 2.0, -1.0);
    float _542 = _97 * _488;
    float _544 = _97 * _476;
    float _546 = _97 * _502;
    float _548 = _540 * _494;
    float _550 = -_542;
    float _552 = _550 + _536;
    float _554 = -_538;
    float _556 = _554 + _544;
    float _558 = -_530;
    float _560 = _558 + _546;
    float _562 = -_504;
    float _564 = _562 + _534;
    float _566 = fma(_548, _552, _542);
    float _568 = fma(_548, _556, _538);
    float _570 = fma(_548, _560, _530);
    float _572 = fma(_564, 2.4999997615814208984375, _566);
    float _574 = precise::clamp(_572, 0.0, 1.0);
    float _576 = fma(_564, 3.499999523162841796875, _568);
    float _578 = precise::clamp(_576, 0.0, 1.0);
    float _580 = fma(_564, 2.9999997615814208984375, _570);
    float _582 = precise::clamp(_580, 0.0, 1.0);
    if (!_176)
    {
        out.m_62.x = _574;
        out.m_62.y = _582;
        out.m_62.z = _578;
        out.m_62.w = _160;
        return out;
    }
    float _584 = in.m_64.w;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = _97 * _588;
    bool _592 = _590 != 1.0;
    bool _594 = isnan(_590);
    bool _596 = _592 || _594;
    bool _598 = isnan(1.0);
    bool _600 = _596 || _598;
    bool _602 = !_600;
    if (!_602)
    {
        float _604 = gl_FragCoord.x;
        float _606 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _608 = _604 / _606;
        float _610 = gl_FragCoord.y;
        float _612 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _614 = _610 / _612;
        float _616 = _590 * 256.0;
        float _618 = trunc(_616);
        int _621 = int(_618);
        float _623 = trunc(_608);
        int _625 = int(_623);
        float _627 = trunc(_614);
        int _629 = int(_627);
        int _631 = _625 + 2;
        int _633 = _631 >> 1;
        uint _636 = uint(int(uint(_629) >> uint(1)));
        int _638 = _633 ^ int(_636);
        int _640 = _638 << 16;
        int _642 = _640 ^ _633;
        int _644 = 983055 & _642;
        int _646 = _644 << 6;
        int _648 = _646 + _644;
        int _650 = _648 & 13369548;
        uint _652 = uint(int(uint(_650) >> uint(3)));
        int _654 = _650 | int(_652);
        uint _656 = uint(int(uint(_621) >> uint(7)));
        int _658 = int(_656) + _621;
        int _660 = _654 & 5570560;
        int _662 = _654 & 85;
        uint _664 = uint(int(uint(_660) >> uint(15)));
        int _666 = int(_664) + _662;
        bool _668 = uint(_658) > uint(_666);
        if (!_668)
        {
            discard_fragment();
        }
        if (!_668)
        {
            out.m_62.x = _574;
            out.m_62.y = _582;
            out.m_62.z = _578;
            out.m_62.w = _166;
            return out;
        }
    }
    float _670 = 0.0 + _166;
    float _672 = precise::clamp(_670, 0.0, 1.0);
    out.m_62.x = 1.0;
    out.m_62.y = 1.0;
    out.m_62.z = 1.0;
    out.m_62.w = _672;
    return out;
}

