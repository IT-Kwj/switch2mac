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
    texture2d<float> fp_t_tcb_38 [[id(5)]];
    sampler fp_t_tcb_38Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_34 [[id(9)]];
    sampler fp_t_tcb_34Smplr [[id(10)]];
    sampler fp_t_tcb_38Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_34Smplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_51 [[user(locn4), flat]];
    float4 m_37 [[user(locn5), flat]];
    float4 m_47 [[user(locn6), flat]];
    float4 m_45 [[user(locn7), flat]];
    float4 m_53 [[user(locn8)]];
    float4 m_41 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
    float4 m_66 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _75 = in.m_37.y;
    float _77 = in.m_37.x;
    float _79 = in.m_37.z;
    float _81 = gl_FragCoord.w;
    float _83 = in.m_41.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _91 = in.m_41.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_41.z;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _89);
    float _105 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _103);
    float _107 = rsqrt(_105);
    float _109 = -_75;
    float _111 = _109 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _113 = -_77;
    float _115 = _113 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _117 = -_79;
    float _119 = _117 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _121 = _111 * _111;
    float _123 = 1.0 / _81;
    float _125 = fma(_115, _115, _121);
    float _127 = _107 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _129 = fma(_119, _119, _125);
    float _131 = rsqrt(_129);
    float _133 = _115 * _131;
    float _135 = _107 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _137 = _111 * _131;
    float _139 = _107 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _141 = _127 * _133;
    float _143 = _119 * _131;
    float _145 = _135 * _137;
    float _147 = -_141;
    float _149 = fma(_139, _137, _147);
    float _151 = _139 * _143;
    float _153 = -_145;
    float _155 = fma(_127, _143, _153);
    float _157 = _123 * _87;
    float _159 = _133 * _149;
    float _161 = -_151;
    float _163 = fma(_135, _133, _161);
    float _165 = _123 * _95;
    float _167 = -_159;
    float _169 = fma(_143, _155, _167);
    float _171 = _143 * _163;
    float _173 = -_75;
    float _175 = _157 + _173;
    float _177 = -_77;
    float _179 = _165 + _177;
    float _181 = _123 * _101;
    float _183 = -_171;
    float _185 = fma(_137, _149, _183);
    float _187 = _163 * _175;
    float _189 = _137 * _155;
    float _191 = _175 * _169;
    float _193 = -_79;
    float _195 = _181 + _193;
    float _197 = fma(_155, _179, _187);
    float _199 = -_189;
    float _201 = fma(_133, _163, _199);
    float _203 = fma(_179, _185, _191);
    float _205 = fma(_149, _195, _197);
    float _207 = fma(_195, _201, _203);
    float _209 = _205 + 0.5;
    float _211 = -_207;
    float _213 = _211 + 0.5;
    float2 _894 = float2(_209, _213);
    float2 _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_38.sample(spvDescriptorSet0.fp_t_tcb_38Smplr, select(_894, float2(0.0), isnan(_894))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_38, spvDescriptorSet0.fp_t_tcb_38Smplr_w, select(_894, float2(0.0), isnan(_894))).xy;
    float _219 = _217.x;
    float _221 = _217.y;
    float _223 = in.m_43.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_45.x;
    float _231 = in.m_43.y;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _123 * _227;
    float _239 = _123 * _235;
    float _241 = _219 * _229;
    float _243 = fma(_221, _229, _239);
    float _245 = _241 + _237;
    float2 _941 = float2(_245, _243);
    float _247 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_941, float2(0.0), isnan(_941))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_941, float2(0.0), isnan(_941))).w;
    float _249 = in.m_47.x;
    float _251 = in.m_49.x;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_51.x;
    float _259 = _123 * _255;
    float _261 = _257 * 2.0;
    float _263 = fma(_207, -0.4000000059604644775390625, 0.20000000298023223876953125);
    float _265 = fma(_221, _229, _263);
    bool _268 = _247 >= _249;
    bool _270 = isnan(_247);
    bool _272 = _268 || _270;
    bool _274 = isnan(_249);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = 0.0 + _278;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _282 * _259;
    bool _286 = _284 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _288 = isnan(_284);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _294 = _290 || _292;
    if (!_294)
    {
        discard_fragment();
    }
    float _296 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.02999999932944774627685546875, _261);
    float _298 = _296 + _209;
    float _300 = fma(_298, 0.4000000059604644775390625, _241);
    float2 _1028 = float2(_300, _265);
    float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1028, float2(0.0), isnan(_1028))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1028, float2(0.0), isnan(_1028))).xyz;
    float _306 = _304.x;
    float _308 = _304.y;
    float _310 = _304.z;
    float _312 = in.m_53.y;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _320 = in.m_53.x;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_53.z;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = -_157;
    float _334 = _332 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _336 = -_165;
    float _338 = _336 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _340 = -_181;
    float _342 = _340 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _344 = in.m_59.y;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = in.m_59.z;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_59.w;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = _123 * _316;
    bool _364 = as_type<int>(_318) != 0;
    float _366 = _123 * _324;
    bool _368 = !_364;
    float _370 = -_362;
    float _372 = _368 ? _370 : _362;
    float _374 = _123 * _330;
    bool _376 = !_364;
    float _378 = -_366;
    float _380 = _376 ? _378 : _366;
    float _382 = in.m_59.x;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = _372 * _372;
    bool _390 = !_364;
    float _392 = -_374;
    float _394 = _390 ? _392 : _374;
    float _396 = _334 * _334;
    float _398 = fma(_380, _380, _388);
    float _400 = fma(_338, _338, _396);
    float _402 = fma(_394, _394, _398);
    float _404 = fma(_342, _342, _400);
    float _406 = rsqrt(_402);
    float _408 = rsqrt(_404);
    float _410 = _372 * _406;
    float _412 = _380 * _406;
    float _414 = _394 * _406;
    float _416 = _410 * _410;
    float _418 = fma(_412, _412, _416);
    float _420 = _334 * _408;
    float _422 = _338 * _408;
    float _424 = _342 * _408;
    float _426 = fma(_414, _414, _418);
    float _428 = rsqrt(_426);
    float _430 = _410 * _428;
    float _432 = _414 * _428;
    float _434 = _420 * _430;
    float _436 = _412 * _428;
    float _438 = _123 * _386;
    float _440 = fma(_422, _436, _434);
    float _442 = fma(_424, _432, _440);
    float _444 = _123 * _348;
    float _446 = fma(_442, 0.5, 0.5);
    float _448 = _306 * _306;
    float _450 = _308 * _308;
    float _452 = _123 * _354;
    float _454 = _310 * _310;
    float _456 = fma(_448, (*spvDescriptorSet0.fp_c9)._m0[106].x, _438);
    float _458 = _123 * _360;
    float _460 = fma(_450, (*spvDescriptorSet0.fp_c9)._m0[106].x, _444);
    float _462 = fma(_454, (*spvDescriptorSet0.fp_c9)._m0[106].x, _452);
    float _464 = fma(_446, _458, _456);
    float _466 = fma(_446, _458, _460);
    float _468 = fma(_446, _458, _462);
    float _470 = _464 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _472 = _466 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _474 = _468 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    if (!_294)
    {
        out.m_62.x = _470;
        out.m_62.y = _472;
        out.m_62.z = _474;
        out.m_62.w = _278;
        return out;
    }
    float _476 = in.m_64.w;
    float _478 = gl_FragCoord.w;
    float _480 = _476 * _478;
    float _482 = _123 * _480;
    bool _484 = _482 != 1.0;
    bool _486 = isnan(_482);
    bool _488 = _484 || _486;
    bool _490 = isnan(1.0);
    bool _492 = _488 || _490;
    bool _494 = !_492;
    if (!_494)
    {
        float _496 = gl_FragCoord.x;
        float _498 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _500 = _496 / _498;
        float _502 = gl_FragCoord.y;
        float _504 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _506 = _502 / _504;
        float _508 = _482 * 256.0;
        float _510 = trunc(_508);
        int _513 = int(_510);
        uint _516 = uint(int(uint(_513) >> uint(7)));
        int _518 = int(_516) + _513;
        float _520 = trunc(_500);
        int _522 = int(_520);
        float _524 = trunc(_506);
        int _526 = int(_524);
        int _528 = _522 + 2;
        int _530 = _528 >> 1;
        uint _532 = uint(int(uint(_526) >> uint(1)));
        int _534 = _530 ^ int(_532);
        int _536 = _534 << 16;
        int _538 = _536 ^ _530;
        int _540 = 983055 & _538;
        int _542 = _540 << 6;
        int _544 = _542 + _540;
        int _546 = _544 & 13369548;
        uint _548 = uint(int(uint(_546) >> uint(3)));
        int _550 = _546 | int(_548);
        int _552 = _550 & 5570560;
        int _554 = _550 & 85;
        uint _556 = uint(int(uint(_552) >> uint(15)));
        int _558 = int(_556) + _554;
        bool _560 = uint(_518) > uint(_558);
        if (!_560)
        {
            discard_fragment();
        }
        if (!_560)
        {
            out.m_62.x = _470;
            out.m_62.y = _472;
            out.m_62.z = _474;
            out.m_62.w = _284;
            return out;
        }
    }
    float _562 = _472 * 0.715200006961822509765625;
    float _564 = in.m_66.w;
    float _566 = gl_FragCoord.w;
    float _568 = _564 * _566;
    float _570 = in.m_66.z;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = in.m_66.x;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = fma(_470, 0.2125999927520751953125, _562);
    float _584 = in.m_66.y;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = fma(_474, 0.072200000286102294921875, _582);
    bool _592 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _594 = 1.0 / _590;
    float _596 = _594 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _598 = precise::clamp(_596, 0.0, 1.0);
    float _600 = fma(_598, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _602 = _123 * _568;
    float _604 = 0.0 + _284;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float _608 = _123 * _574;
    float _610 = _123 * _588;
    float _612 = _600 * _602;
    float _614 = _123 * _580;
    float _616 = fma(_474, _612, _608);
    float _618 = fma(_470, _612, _614);
    float _620 = fma(_472, _612, _610);
    float _622 = _608;
    if (!_592)
    {
        _622 = _606;
    }
    float _624 = _622;
    bool _626 = !_592;
    float _628 = _624;
    if (!_626)
    {
        float _630 = in.m_68.w;
        float _632 = gl_FragCoord.w;
        float _634 = _630 * _632;
        float _636 = in.m_68.z;
        float _638 = gl_FragCoord.w;
        float _640 = _636 * _638;
        float _642 = _123 * _634;
        float _644 = _123 * _640;
        float _646 = 1.0 / _642;
        float _648 = _644 * _646;
        float _650 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _652 = fma(_648, (*spvDescriptorSet0.fp_c8)._m0[30].w, _650);
        float _654 = 1.0 / _652;
        float _656 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _658 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _660 = fma(_654, _656, _658);
        float _662 = _660 * 8.0;
        float _664 = precise::clamp(_662, 0.0, 1.0);
        float _666 = _606 * _664;
        _628 = _666;
    }
    float _668 = _628;
    float _670 = 0.0 + _668;
    float _672 = precise::clamp(_670, 0.0, 1.0);
    out.m_62.x = _618;
    out.m_62.y = _620;
    out.m_62.z = _616;
    out.m_62.w = _672;
    return out;
}

