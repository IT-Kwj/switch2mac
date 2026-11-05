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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c10 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_36 [[id(7)]];
    sampler fp_t_tcb_36Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_38 [[id(9)]];
    sampler fp_t_tcb_38Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_36Smplr_w [[id(14)]];
    sampler fp_t_tcb_38Smplr_w [[id(15)]];
    sampler fp_t_tcb_34Smplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_66 [[color(0)]];
};

struct main0_in
{
    float4 m_63 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_53 [[user(locn4), flat]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_47 [[user(locn6), flat]];
    float4 m_49 [[user(locn7), flat]];
    float4 m_55 [[user(locn8), flat]];
    float4 m_57 [[user(locn9)]];
    float4 m_43 [[user(locn10)]];
    float4 m_68 [[user(locn11)]];
    float4 m_70 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _79 = in.m_39.y;
    float _81 = in.m_39.x;
    float _83 = in.m_39.z;
    float _85 = gl_FragCoord.w;
    float _87 = in.m_43.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_43.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_43.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = -_79;
    float _107 = _105 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _109 = -_81;
    float _111 = _109 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _113 = -_83;
    float _115 = _113 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _117 = _107 * _107;
    float _119 = fma(_111, _111, _117);
    float _121 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _123 = fma(_115, _115, _119);
    float _125 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _121);
    float _127 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _125);
    float _129 = rsqrt(_123);
    float _131 = in.m_45.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = rsqrt(_127);
    float _139 = 1.0 / _85;
    float _141 = _111 * _129;
    float _143 = _107 * _129;
    float _145 = _115 * _129;
    float _147 = in.m_45.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_47.y;
    float _155 = _137 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _157 = _137 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _159 = _137 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _161 = _155 * _141;
    float _163 = _157 * _143;
    float _165 = _159 * _145;
    float _167 = -_161;
    float _169 = fma(_159, _143, _167);
    float _171 = -_163;
    float _173 = fma(_155, _145, _171);
    float _175 = -_165;
    float _177 = fma(_157, _141, _175);
    float _179 = _139 * _91;
    float _181 = _141 * _169;
    float _183 = _139 * _97;
    float _185 = _145 * _177;
    float _187 = _139 * _135;
    float _189 = -_181;
    float _191 = fma(_145, _173, _189);
    float _193 = -_79;
    float _195 = _193 + _179;
    float _197 = -_185;
    float _199 = fma(_143, _169, _197);
    float _201 = -_81;
    float _203 = _201 + _183;
    float _205 = _143 * _173;
    float _207 = _177 * _195;
    float _209 = _139 * _103;
    float _211 = _195 * _191;
    float _213 = -_205;
    float _215 = fma(_141, _177, _213);
    float _217 = fma(_173, _203, _207);
    float _219 = -_83;
    float _221 = _219 + _209;
    float _223 = fma(_203, _199, _211);
    float _225 = fma(_169, _221, _217);
    float _227 = fma(_221, _215, _223);
    float _229 = _139 * _151;
    float _231 = fma(_225, _153, 0.5);
    float _233 = -_227;
    float _235 = fma(_233, _153, 0.5);
    float2 _928 = float2(_229, _187);
    float _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_928, float2(0.0), isnan(_928))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_928, float2(0.0), isnan(_928))).w;
    float2 _939 = float2(_231, _235);
    float _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_939, float2(0.0), isnan(_939))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_939, float2(0.0), isnan(_939))).w;
    float _241 = in.m_49.x;
    float _243 = in.m_51.x;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = _225 + 0.5;
    float _251 = -_227;
    float _253 = _251 + 0.5;
    float _255 = _139 * _247;
    float _257 = -_239;
    float _259 = _237 + _257;
    bool _262 = _259 >= _241;
    bool _264 = isnan(_259);
    bool _266 = _262 || _264;
    bool _268 = isnan(_241);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = 0.0 + _272;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _276 * _255;
    bool _280 = _278 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _282 = isnan(_278);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _288 = _284 || _286;
    if (!_288)
    {
        discard_fragment();
    }
    float2 _1012 = float2(_249, _253);
    float2 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_38.sample(spvDescriptorSet0.fp_t_tcb_38Smplr, select(_1012, float2(0.0), isnan(_1012))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_38, spvDescriptorSet0.fp_t_tcb_38Smplr_w, select(_1012, float2(0.0), isnan(_1012))).xy;
    float _294 = _292.x;
    float _296 = _292.y;
    float _298 = in.m_53.x;
    float _300 = in.m_55.x;
    float _302 = _298 * 2.0;
    float _304 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.02999999932944774627685546875, _302);
    float _306 = _304 + _249;
    float _308 = fma(_227, -0.4000000059604644775390625, 0.20000000298023223876953125);
    float _310 = _294 * _300;
    float _312 = fma(_296, _300, _308);
    float _314 = fma(_306, 0.4000000059604644775390625, _310);
    float2 _1054 = float2(_314, _312);
    float3 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1054, float2(0.0), isnan(_1054))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1054, float2(0.0), isnan(_1054))).xyz;
    float _320 = _318.x;
    float _322 = _318.y;
    float _324 = _318.z;
    float _326 = in.m_57.y;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _334 = in.m_57.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_57.z;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = -_179;
    float _348 = _346 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _350 = -_183;
    float _352 = _350 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _354 = -_209;
    float _356 = _354 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _358 = in.m_63.z;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_63.w;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = _139 * _330;
    bool _372 = as_type<int>(_332) != 0;
    float _374 = _139 * _338;
    float _376 = in.m_63.x;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    bool _382 = !_372;
    float _384 = -_370;
    float _386 = _382 ? _384 : _370;
    float _388 = _139 * _344;
    bool _390 = !_372;
    float _392 = -_374;
    float _394 = _390 ? _392 : _374;
    float _396 = in.m_63.y;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = _386 * _386;
    bool _404 = !_372;
    float _406 = -_388;
    float _408 = _404 ? _406 : _388;
    float _410 = fma(_394, _394, _402);
    float _412 = _348 * _348;
    float _414 = fma(_408, _408, _410);
    float _416 = fma(_352, _352, _412);
    float _418 = fma(_356, _356, _416);
    float _420 = rsqrt(_414);
    float _422 = rsqrt(_418);
    float _424 = _386 * _420;
    float _426 = _394 * _420;
    float _428 = _408 * _420;
    float _430 = _424 * _424;
    float _432 = fma(_426, _426, _430);
    float _434 = _348 * _422;
    float _436 = _352 * _422;
    float _438 = _356 * _422;
    float _440 = fma(_428, _428, _432);
    float _442 = rsqrt(_440);
    float _444 = _424 * _442;
    float _446 = _426 * _442;
    float _448 = _428 * _442;
    float _450 = _434 * _444;
    float _452 = fma(_436, _446, _450);
    float _454 = _139 * _380;
    float _456 = fma(_438, _448, _452);
    float _458 = _139 * _368;
    float _460 = fma(_456, 0.5, 0.5);
    float _462 = _320 * _320;
    float _464 = _322 * _322;
    float _466 = _324 * _324;
    float _468 = fma(_462, (*spvDescriptorSet0.fp_c9)._m0[106].x, _454);
    float _470 = _139 * _400;
    float _472 = _139 * _362;
    float _474 = fma(_464, (*spvDescriptorSet0.fp_c9)._m0[106].x, _470);
    float _476 = fma(_466, (*spvDescriptorSet0.fp_c9)._m0[106].x, _472);
    float _478 = fma(_458, _460, _468);
    float _480 = fma(_458, _460, _474);
    float _482 = fma(_458, _460, _476);
    float _484 = _478 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _486 = _480 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _488 = _482 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    if (!_288)
    {
        out.m_66.x = _484;
        out.m_66.y = _486;
        out.m_66.z = _488;
        out.m_66.w = _272;
        return out;
    }
    float _490 = in.m_68.w;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = _139 * _494;
    bool _498 = _496 != 1.0;
    bool _500 = isnan(_496);
    bool _502 = _498 || _500;
    bool _504 = isnan(1.0);
    bool _506 = _502 || _504;
    bool _508 = !_506;
    if (!_508)
    {
        float _510 = gl_FragCoord.x;
        float _512 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _514 = _510 / _512;
        float _516 = gl_FragCoord.y;
        float _518 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _520 = _516 / _518;
        float _522 = _496 * 256.0;
        float _524 = trunc(_522);
        int _527 = int(_524);
        float _529 = trunc(_514);
        int _531 = int(_529);
        float _533 = trunc(_520);
        int _535 = int(_533);
        int _537 = _531 + 2;
        int _539 = _537 >> 1;
        uint _542 = uint(int(uint(_535) >> uint(1)));
        int _544 = _539 ^ int(_542);
        int _546 = _544 << 16;
        int _548 = _546 ^ _539;
        int _550 = 983055 & _548;
        int _552 = _550 << 6;
        int _554 = _552 + _550;
        int _556 = _554 & 13369548;
        uint _558 = uint(int(uint(_556) >> uint(3)));
        int _560 = _556 | int(_558);
        uint _562 = uint(int(uint(_527) >> uint(7)));
        int _564 = int(_562) + _527;
        int _566 = _560 & 5570560;
        int _568 = _560 & 85;
        uint _570 = uint(int(uint(_566) >> uint(15)));
        int _572 = int(_570) + _568;
        bool _574 = uint(_564) > uint(_572);
        if (!_574)
        {
            discard_fragment();
        }
        if (!_574)
        {
            out.m_66.x = _484;
            out.m_66.y = _486;
            out.m_66.z = _488;
            out.m_66.w = _278;
            return out;
        }
    }
    float _576 = _486 * 0.715200006961822509765625;
    float _578 = in.m_70.w;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    float _584 = in.m_70.x;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = in.m_70.y;
    float _592 = gl_FragCoord.w;
    float _594 = _590 * _592;
    float _596 = fma(_484, 0.2125999927520751953125, _576);
    float _598 = in.m_70.z;
    float _600 = gl_FragCoord.w;
    float _602 = _598 * _600;
    float _604 = fma(_488, 0.072200000286102294921875, _596);
    bool _606 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _608 = 1.0 / _604;
    float _610 = _608 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = 0.0 + _278;
    float _616 = precise::clamp(_614, 0.0, 1.0);
    float _618 = fma(_612, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _620 = _139 * _582;
    float _622 = _139 * _594;
    float _624 = _139 * _602;
    float _626 = _618 * _620;
    float _628 = _139 * _588;
    float _630 = fma(_486, _626, _622);
    float _632 = fma(_484, _626, _628);
    float _634 = fma(_488, _626, _624);
    bool _636 = !_606;
    float _638 = _616;
    if (!_636)
    {
        float _640 = in.m_72.w;
        float _642 = gl_FragCoord.w;
        float _644 = _640 * _642;
        float _646 = in.m_72.z;
        float _648 = gl_FragCoord.w;
        float _650 = _646 * _648;
        float _652 = _139 * _644;
        float _654 = _139 * _650;
        float _656 = 1.0 / _652;
        float _658 = _654 * _656;
        float _660 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _662 = fma(_658, (*spvDescriptorSet0.fp_c8)._m0[30].w, _660);
        float _664 = 1.0 / _662;
        float _666 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _668 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _670 = fma(_664, _666, _668);
        float _672 = _670 * 8.0;
        float _674 = precise::clamp(_672, 0.0, 1.0);
        float _676 = _616 * _674;
        _638 = _676;
    }
    float _678 = _638;
    float _680 = 0.0 + _678;
    float _682 = precise::clamp(_680, 0.0, 1.0);
    out.m_66.x = _632;
    out.m_66.y = _630;
    out.m_66.z = _634;
    out.m_66.w = _682;
    return out;
}

