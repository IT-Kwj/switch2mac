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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_83 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_93 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_65 [[user(locn13)]];
    float4 m_89 [[user(locn14)]];
    float4 m_85 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_87 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_79 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_73 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2696 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_118);
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3013 = as_type<float>(_140);
        out.gl_Position.z = _3013;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3068 = as_type<float>(_166);
        out.gl_Position.z = _3068;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _122 * _174;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_176;
    float _200 = _178;
    float _218;
    if (!_198)
    {
        float _202 = in.m_57.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        _218 = _178;
    }
    _220 = false;
    float _222 = _218;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _222 + _224;
    bool _228 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_222);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -_238;
    float _246 = _244 + 1.0;
    bool _248 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _250 = isnan(_222);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = 1.0 / _242;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = _226 * _260;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = in.m_59.x;
    float _280 = in.m_59.y;
    float _282 = in.m_59.z;
    float _284 = _258 * _246;
    float _286 = fma(_264, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_276, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_268, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = -_258;
    float _294 = _292 + 1.0;
    float _296 = _286 * _284;
    float _298 = _288 * _284;
    float _300 = _290 * _284;
    float _302 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _302);
    float _310 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _304);
    float _312 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _306);
    float _314 = _308 * _278;
    float _316 = _310 * _280;
    float _318 = _312 * _282;
    bool _320 = !_270;
    if (!_320)
    {
        float _322 = in.m_57.x;
        float _324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _330 = _328 * _324;
        float _332 = floor(_330);
        float _334 = -_332;
        float _336 = _330 + _334;
        _200 = _336;
    }
    float _338 = _200;
    float _340 = in.m_57.x;
    float _342 = in.m_57.y;
    float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _346 = log2(_344);
    float _348 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = in.m_46.x;
    float _352 = in.m_46.y;
    float _354 = in.m_46.z;
    float _356 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _360 = in.m_57.z;
    float _362 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _364 = int(_362);
    float _366 = _348 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _368 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = _346 * _122;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _382 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _384 = int(_382);
    float _386 = _342 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _388 = _340 * 2.0;
    float _390 = _340 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _392 = _342 * 2.0;
    float _394 = fma(_386, -2.0, _358);
    float _396 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = floor(_388);
    float _400 = -_380;
    float _402 = fma(_390, 2.0, _400);
    float _404 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _406 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _408 = _342 + _340;
    float _410 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _412 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _404);
    float _414 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _406);
    float _416 = exp2(_378);
    float _418 = _342 + _360;
    float _420 = _360 * 2.0;
    float _422 = float(_364);
    float _424 = _408 + (-1.0);
    float _426 = _418 + (-1.0);
    float _428 = float(_384);
    float _430 = floor(_392);
    float _432 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _434 = _398 > 0.0;
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _438 = _398 >= 0.0;
    bool _440 = isnan(_398);
    bool _442 = _438 || _440;
    bool _444 = isnan(0.0);
    bool _446 = _442 || _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _450 = 1.0 + _448;
    float _452 = floor(_420);
    float _454 = -_416;
    float _456 = _454 + 1.0;
    bool _458 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _460 = isnan(1.0);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _466 = _462 || _464;
    float _468 = _428 * _122;
    float _470 = -_122;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[76].x, _402);
    float _474 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _410);
    float _476 = _376 ? _456 : 0.0;
    float _478 = 1.0 / _422;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _484 = _430 > 0.0;
    float _486 = _474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _488 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[78].z, _480);
    float _490 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    int _492 = _446 ? 0 : 1;
    float _494 = 1.0 / _450;
    bool _496 = _430 >= 0.0;
    bool _498 = isnan(_430);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    float _506 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _488);
    bool _508 = _452 > 0.0;
    float _510 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _490);
    bool _512 = _452 >= 0.0;
    bool _514 = isnan(_452);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    float _522 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    int _524 = ~_492;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = _478 * _122;
    int _532 = _528;
    if (!_434)
    {
        int _534 = ~_492;
        int _536 = _534 + 1;
        _532 = _536;
    }
    int _538 = _532;
    float _540 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    int _542 = _504 ? 0 : 1;
    float _544 = float(_538);
    float _546 = _540 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _548 = ~_542;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    int _554 = _552;
    if (_466)
    {
        float _556 = _476 * _494;
        _132 = _556;
    }
    float _558 = _132;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _570 = _568 != 0;
    float _572 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    if (!_484)
    {
        int _574 = ~_542;
        int _576 = _574 + 1;
        _554 = _576;
    }
    int _578 = _554;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _582 = _546 + _580;
    float _584 = in.m_61.x;
    float _586 = in.m_61.y;
    float _588 = in.m_61.z;
    bool _590 = !_566;
    int _592 = _590 ? 0 : 1;
    float _594 = _572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _596 = !_562;
    int _598 = _596 ? 0 : 1;
    bool _600 = !_570;
    int _602 = _600 ? 0 : 1;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    int _616 = _520 ? 0 : 1;
    bool _618 = !_610;
    int _620 = _618 ? 0 : 1;
    bool _622 = !_606;
    int _624 = _622 ? 0 : 1;
    int _626 = abs(_620);
    int _628 = abs(_624);
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _632 = _486 + _630;
    float _634 = float(_626);
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _638 = _594 + _636;
    int _640 = ~_616;
    int _642 = _640 + 1;
    int _644 = _642 + 1;
    float _646 = _632 * _632;
    int _648 = _644;
    if (!_508)
    {
        int _650 = ~_616;
        int _652 = _650 + 1;
        _648 = _652;
    }
    int _654 = _648;
    float _656 = _634 * _544;
    float _658 = float(_628);
    float _660 = fma(_582, _582, _646);
    float _662 = float(_654);
    float _664 = _656 * (-2.0);
    bool _666 = !_614;
    int _668 = _666 ? 0 : 1;
    float _670 = fma(_638, _638, _660);
    float _672 = _342 + (-0.5);
    float _674 = fma(_664, _586, _586);
    int _676 = abs(_668);
    float _678 = sqrt(_670);
    float _680 = _658 * _662;
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _684 = _360 + _340;
    float _686 = float(_578);
    float _688 = fma(_436, _664, _436);
    float _690 = float(_676);
    float _692 = _684 + (-1.0);
    float _694 = rsqrt(_670);
    float _696 = _680 * (-2.0);
    float _698 = _690 * _686;
    float _700 = _360 + (-0.5);
    float _702 = fma(_688, _558, _682);
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _706 = _678 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _708 = _340 + (-0.5);
    float _710 = fma(_696, _584, _584);
    float _712 = fma(_432, _696, _432);
    float _714 = _698 * (-2.0);
    float _716 = precise::min(_366, _706);
    float _718 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _710);
    float _720 = _702 * 0.15915493667125701904296875;
    float _722 = fma(_704, _714, _704);
    float _724 = fma(_714, _588, _588);
    float _726 = _694 * _716;
    float _728 = fma(_712, _558, _718);
    float _730 = _720 * 6.283185482025146484375;
    float _732 = sin(_730);
    float _734 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].z, _724);
    float _736 = _632 * _726;
    float _738 = _582 * _726;
    float _740 = _638 * _726;
    float _742 = _728 * 0.15915493667125701904296875;
    float _744 = -_736;
    float _746 = _632 + _744;
    float _748 = -_738;
    float _750 = _582 + _748;
    float _752 = -_740;
    float _754 = _638 + _752;
    float _756 = fma(_722, _558, _734);
    float _758 = _746 * _746;
    float _760 = _720 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _766 = fma(_750, _750, _758);
    float _768 = _756 * 0.15915493667125701904296875;
    float _770 = fma(_754, _754, _766);
    float _772 = _742 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = in.m_63.x;
    float _778 = in.m_63.y;
    float _780 = in.m_63.z;
    float _782 = sqrt(_770);
    float _784 = _742 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _774 * _732;
    float _790 = _774 * _762;
    float _792 = _768 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = _694 * _782;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _778);
    float _800 = _764 * _796;
    float _802 = _348 * _796;
    float _804 = _356 * _796;
    float _806 = _768 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _786 * _762;
    float _812 = _786 * _732;
    float _814 = _800 * _798;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _818 = _774 * _794;
    float _820 = _762 * _794;
    float _822 = _786 * _794;
    float _824 = _732 * _794;
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _828 = _804 * _816;
    float _830 = _818 * _814;
    float _832 = _802 * _826;
    float _834 = fma(_808, _810, _788);
    float _836 = _822 * _814;
    float _838 = -_790;
    float _840 = fma(_808, _812, _838);
    float _842 = -_814;
    float _844 = _808 * _842;
    float _846 = -_812;
    float _848 = fma(_808, _790, _846);
    float _850 = fma(_834, _832, _836);
    float _852 = fma(_808, _788, _810);
    float _854 = fma(_820, _832, _844);
    float _856 = fma(_848, _832, _830);
    float _858 = fma(_840, _828, _850);
    float _860 = fma(_824, _828, _854);
    float _862 = fma(_852, _828, _856);
    float _864 = _858 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _866 = _858 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _868 = _858 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _870 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _864);
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _866);
    float _874 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _868);
    float _876 = -_736;
    float _878 = _486 + _876;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _870);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _872);
    float _884 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _886 = -_738;
    float _888 = _546 + _886;
    float _890 = _880 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _894 = _884 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _896 = -_740;
    float _898 = _594 + _896;
    float _900 = _594 + _890;
    float _902 = _546 + _892;
    float _904 = _486 + _894;
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _908 = _900 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _912 = _902 + _910;
    float _914 = _908 * _908;
    float _916 = fma(_912, _912, _914);
    float _918 = _878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _920 = sqrt(_916);
    float _922 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].x, _918);
    float _924 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _922);
    bool _926 = _920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _894;
    float _930 = _902;
    float _932 = _884;
    float _934 = _736;
    float _936 = _738;
    if (!_926)
    {
        _928 = _902;
    }
    float _938 = _928;
    float _940 = _938;
    if (!_926)
    {
        _930 = _900;
    }
    float _942 = _930;
    float _944 = _942;
    if (!_926)
    {
        _932 = _904;
    }
    float _946 = _932;
    bool _948 = !_926;
    float _950 = _946;
    if (!_948)
    {
        float _952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _956 = _920 + _954;
        float _958 = _904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = rsqrt(_916);
        float _962 = _956 * _952;
        float _964 = _962 * 0.15915493667125701904296875;
        float _966 = _964 * 6.283185482025146484375;
        float _968 = cos(_966);
        float _970 = _964 * 6.283185482025146484375;
        float _972 = sin(_970);
        float _974 = _968 + (-1.0);
        float _976 = _974 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = fma(_972, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _980 = fma(_904, _968, _976);
        float _982 = _960 * _978;
        float _984 = fma(_912, _982, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _986 = fma(_908, _982, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _950 = _980;
        _940 = _984;
        _944 = _986;
    }
    float _988 = _950;
    float _990 = _940;
    float _992 = _944;
    float _994 = -_486;
    float _996 = _994 + _988;
    float _998 = -_546;
    float _1000 = _998 + _990;
    float _1002 = _924 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1004 = _878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1006 = _996 * _996;
    float _1008 = -_594;
    float _1010 = _1008 + _992;
    float _1012 = 1.0 / _1002;
    float _1014 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1004);
    float _1016 = fma(_1000, _1000, _1006);
    float _1018 = -_738;
    float _1020 = _1018 + _990;
    float _1022 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1014);
    float _1024 = fma(_1010, _1010, _1016);
    float _1026 = -_736;
    float _1028 = _1026 + _988;
    float _1030 = -_740;
    float _1032 = _1030 + _992;
    float _1034 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1036 = sqrt(_1024);
    bool _1038 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1040 = isnan(0.5);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1046 = _1042 || _1044;
    float _1048 = _1034 + _1002;
    bool _1050 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1052 = isnan(0.5);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1058 = _1054 || _1056;
    float _1060 = _1048 * _1012;
    float _1062 = _1060 * 0.5;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1066 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1064);
    float _1068 = 1.0 / _1066;
    bool _1070 = _1036 > 0.0;
    float _1072 = _1036;
    float _1074 = _992;
    float _1076 = _1000;
    float _1078 = _1002;
    float _1080 = _1032;
    float _1082 = _1066;
    float _1084 = _988;
    if (!_1070)
    {
        _934 = _1020;
    }
    float _1086 = _934;
    float _1088 = _1086;
    if (!_1070)
    {
        _936 = _1028;
    }
    float _1090 = _936;
    float _1092 = _1090;
    if (!_1070)
    {
        _1072 = _1032;
    }
    float _1094 = _1072;
    bool _1096 = !_1070;
    float _1098 = _1094;
    float _1100 = _1094;
    if (!_1096)
    {
        float _1102 = _194 * _194;
        float _1104 = rsqrt(_1024);
        float _1106 = fma(_192, _192, _1102);
        float _1108 = fma(_196, _196, _1106);
        float _1110 = sqrt(_1108);
        float _1112 = _996 * _1104;
        float _1114 = _1000 * _1104;
        float _1116 = _1010 * _1104;
        bool _1118 = _1110 > 0.0;
        float _1120 = _1104;
        float _1122 = _1110;
        _1074 = _1114;
        if (!_1118)
        {
            _1120 = _1020;
        }
        float _1124 = _1120;
        _1088 = _1124;
        if (!_1118)
        {
            _1122 = _1028;
        }
        float _1126 = _1122;
        _1092 = _1126;
        if (!_1118)
        {
            _1098 = _1032;
        }
        float _1128 = _1098;
        bool _1130 = !_1118;
        _1100 = _1128;
        if (!_1130)
        {
            float _1132 = rsqrt(_1108);
            float _1134 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1136 = _194 * _1132;
            float _1138 = _192 * _1132;
            float _1140 = _1112 * _1136;
            float _1142 = _196 * _1132;
            float _1144 = fma(_1114, _1138, _1140);
            float _1146 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1148 = fma(_1116, _1142, _1144);
            float _1150 = _1148 * _1146;
            float _1152 = fma(_192, _1150, _1020);
            float _1154 = fma(_194, _1150, _1028);
            float _1156 = fma(_196, _1150, _1032);
            _1088 = _1152;
            _1092 = _1154;
            _1100 = _1156;
            _1076 = _1150;
        }
    }
    float _1158 = _1088;
    float _1160 = _1092;
    float _1162 = _1100;
    float _1164 = _1074;
    float _1166 = _1076;
    float _1168 = _1166;
    float _1170 = _1160;
    float _1172 = _1158;
    float _1174 = _1162;
    float _1176 = _1164;
    if (_1058)
    {
        _1168 = 1.0;
    }
    float _1178 = _1168;
    float _1180 = _1178;
    if (!_1046)
    {
        float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1184 = _878 + _1182;
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1188 = _888 + _1186;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1192 = _1184 * _1184;
        float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1196 = _898 + _1194;
        float _1198 = fma(_1188, _1188, _1192);
        float _1200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1202 = fma(_1196, _1196, _1198);
        float _1204 = sqrt(_1202);
        float _1206 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1208 = precise::min(_1204, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1210 = _1208 * _1200;
        float _1212 = -_888;
        float _1214 = _1212 + _1158;
        float _1216 = _1206 * _1210;
        float _1218 = -_878;
        float _1220 = _1218 + _1160;
        float _1222 = -_898;
        float _1224 = _1222 + _1162;
        float _1226 = fma(_1214, _1216, _888);
        float _1228 = fma(_1220, _1216, _878);
        float _1230 = fma(_1224, _1216, _898);
        _1170 = _1228;
        _1172 = _1226;
        _1174 = _1230;
    }
    float _1232 = _1170;
    float _1234 = _1172;
    float _1236 = _1174;
    if (_1058)
    {
        _1078 = 1.0;
    }
    float _1238 = _1078;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1242 = _1068 * _1240;
    float _1244 = _1238;
    if (!_1058)
    {
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1248 = _1246 * 0.15915493667125701904296875;
        float _1250 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1252 = _1248 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = _1250 * 0.15915493667125701904296875;
        float _1258 = _1248 * 6.283185482025146484375;
        float _1260 = sin(_1258);
        float _1262 = 1.0 / _1254;
        float _1264 = _1256 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        float _1268 = _1260 * _1262;
        float _1270 = _1256 * 6.283185482025146484375;
        float _1272 = sin(_1270);
        float _1274 = _1266 * _1268;
        float _1276 = 1.0 / _1274;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1280 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1278;
        float _1282 = 1.0 / _1280;
        float _1284 = _1272 * _1276;
        float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1288 = fma(_1242, _1284, _1286);
        float _1290 = _1288 * _1282;
        float _1292 = precise::clamp(_1290, 0.0, 1.0);
        _1180 = _1292;
    }
    float _1294 = _1180;
    if (!_1058)
    {
        float _1296 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1298 = _1296 * 0.15915493667125701904296875;
        float _1300 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1302 = _1298 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        float _1306 = _1300 * 0.15915493667125701904296875;
        float _1308 = _1298 * 6.283185482025146484375;
        float _1310 = sin(_1308);
        float _1312 = 1.0 / _1304;
        float _1314 = _1306 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = _1310 * _1312;
        float _1320 = _1306 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = _1316 * _1318;
        float _1326 = 1.0 / _1324;
        float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1330 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1328;
        float _1332 = 1.0 / _1330;
        float _1334 = _1322 * _1326;
        float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1338 = fma(_1242, _1334, _1336);
        float _1340 = _1338 * _1332;
        float _1342 = precise::clamp(_1340, 0.0, 1.0);
        float _1344 = -_1342;
        float _1346 = _1344 + 1.0;
        _1080 = _1326;
        _1244 = _1346;
    }
    float _1348 = _1080;
    float _1350 = _1244;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1354 = _1232 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1358 = _1234 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1362 = _1236 + _1360;
    float _1364 = _1354 * _1354;
    float _1366 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1368 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1370 = fma(_1358, _1358, _1364);
    float _1372 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1366);
    float _1374 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1368);
    float _1376 = fma(_1362, _1362, _1370);
    float _1378 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1372);
    float _1380 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1374);
    float _1382 = rsqrt(_1376);
    float _1384 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1386 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1388 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1390 = sqrt(_1376);
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1394 = _1358 * _1392;
    float _1396 = _1362 * _1392;
    float _1398 = _1394 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 + _1400;
    float _1404 = sqrt(_1402);
    bool _1406 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = _1404 + _1408;
    float _1412 = _1028;
    float _1414 = _1402;
    float _1416 = _1410;
    float _1418 = _1394;
    float _1420 = _1396;
    float _1422 = _1398;
    float _1424 = _1400;
    if (_1406)
    {
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1426;
    }
    float _1428 = _1412;
    if (_1406)
    {
        float _1430 = rsqrt(_1402);
        _1414 = _1430;
    }
    float _1432 = _1414;
    if (_1406)
    {
        float _1434 = _1410 * _1428;
        _1416 = _1434;
    }
    float _1436 = _1416;
    if (_1406)
    {
        float _1438 = _1436 * 0.15915493667125701904296875;
        _1082 = _1438;
    }
    float _1440 = _1082;
    float _1442 = _1428;
    if (_1406)
    {
        float _1444 = _1440 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        _1442 = _1446;
    }
    float _1448 = _1442;
    float _1450 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1452 = precise::max(0.0, _1450);
    float _1454 = _1348;
    if (_1406)
    {
        float _1456 = _1440 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        _1454 = _1458;
    }
    float _1460 = _1454;
    float _1462 = -_1392;
    float _1464 = -_1452;
    float _1466 = fma(_1354, _1462, _1464);
    if (_1406)
    {
        float _1468 = _1466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1084 = _1468;
    }
    float _1470 = _1084;
    float _1472 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1474 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1476 = _1470;
    float _1478 = _1448;
    if (_1406)
    {
        float _1480 = fma(_1448, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1476 = _1480;
    }
    float _1482 = _1476;
    float _1484 = _1482;
    if (!_1406)
    {
        _1478 = _1466;
    }
    float _1486 = _1478;
    float _1488 = floor(_1474);
    float _1490 = _1486;
    if (_1406)
    {
        float _1492 = _1460 + (-1.0);
        _1176 = _1492;
    }
    float _1494 = _1176;
    float _1496 = _1494;
    if (_1406)
    {
        float _1498 = _1432 * _1482;
        _1484 = _1498;
    }
    float _1500 = _1484;
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1504 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1502);
    float _1506 = precise::clamp(_1504, 0.0, 1.0);
    if (_1406)
    {
        float _1508 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1508;
    }
    float _1510 = _1496;
    if (_1406)
    {
        float _1512 = _1394 * _1500;
        _1418 = _1512;
    }
    float _1514 = _1418;
    if (_1406)
    {
        float _1516 = _1396 * _1500;
        _1420 = _1516;
    }
    float _1518 = _1420;
    if (_1406)
    {
        float _1520 = fma(_1466, _1460, _1510);
        _1490 = _1520;
    }
    float _1522 = _1490;
    if (_1406)
    {
        float _1524 = _1514 * _1514;
        _1422 = _1524;
    }
    float _1526 = _1422;
    if (_1406)
    {
        float _1528 = _1518 * _1518;
        _1424 = _1528;
    }
    float _1530 = _1424;
    float _1532 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1472);
    float _1534 = -_1506;
    float _1536 = _1534 + 1.0;
    float _1538 = fma(_1522, _1522, _1526);
    float _1540 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1542 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1544 = _1538 + _1530;
    float _1546 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1532);
    float _1548 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1542);
    float _1550 = abs(_1536);
    float _1552 = log2(_1550);
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1556 = _1546 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1558 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1548);
    float _1560 = -_1388;
    float _1562 = fma(_1560, _1554, 1.0);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1566 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1568 = rsqrt(_1544);
    float _1570 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1572 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1570);
    float _1574 = floor(_1540);
    float _1576 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1572);
    float _1578 = _1568 * _1514;
    float _1580 = _1568 * _1522;
    float _1582 = _1568 * _1518;
    float _1584 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1576);
    float _1586 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1588 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1590 = log2(_1562);
    float _1592 = _1580 + 1.0;
    float _1594 = -_1586;
    float _1596 = fma(_1580, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1594);
    float _1598 = -_1574;
    float _1600 = _1540 + _1598;
    float _1602 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1564);
    float _1604 = -_1582;
    float _1606 = fma(_1604, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1596);
    float _1608 = -_1488;
    float _1610 = _1474 + _1608;
    float _1612 = 1.0 / _1584;
    float _1614 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1616 = fma(_1606, -0.5, 0.5);
    float _1618 = fma(_1606, 0.5, 0.5);
    float _1620 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1602);
    float _1622 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1614);
    float _1624 = fma(_1618, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1626 = exp2(_1588);
    float _1628 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1622);
    float _1630 = _1590 * 0.693147182464599609375;
    float _1632 = fma(_1618, _1624, -0.212114393711090087890625);
    float _1634 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1628);
    float _1636 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1638 = fma(_1618, _1632, 1.570728778839111328125);
    float _1640 = sqrt(_1616);
    float _1642 = _1634 * _1612;
    float _1644 = _1636 * _1612;
    float _1646 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1648 = fma(_1644, -0.5, 0.5);
    float _1650 = -_1580;
    float _1652 = fma(_1626, _1592, _1650);
    float2 _5375 = float2(_1610, _1600);
    float _1654 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5375, float2(0.0), isnan(_5375)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5375, float2(0.0), isnan(_5375)), level(0.0)).x;
    float _1656 = fma(_1652, 0.5, 0.5);
    float _1658 = _1640 * 0.636619746685028076171875;
    float _1660 = fma(_1642, 0.5, 0.5);
    float _1662 = -_1638;
    float _1664 = fma(_1658, _1662, 1.0);
    float3 _5398 = float3(_1660, _1648, _1646);
    float _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float3 _5409 = float3(_1660, _1648, _1646);
    float4 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5409, float3(0.0), isnan(_5409)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5409, float3(0.0), isnan(_5409)), level(0.0)).xyzw;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = _1669.w;
    float2 _5425 = float2(_1664, _1656);
    float3 _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5425, float2(0.0), isnan(_5425)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5425, float2(0.0), isnan(_5425)), level(0.0)).xyz;
    float _1683 = _1681.x;
    float _1685 = _1681.y;
    float _1687 = _1681.z;
    float _1689 = float(uint(_384));
    float _1691 = trunc(_530);
    int _1693 = int(_1691);
    float _1695 = _468 * _174;
    bool _1697 = _384 == 0;
    out.m_65.x = _888;
    out.m_65.y = _878;
    out.m_65.z = _898;
    int _1699 = abs(_598);
    float _1701 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1703 = abs(_602);
    out.m_67.w = _716;
    float _1705 = 1.0 / _1689;
    int _1707 = ~_384;
    int _1709 = _1707 + 1;
    int _1711 = ~_384;
    int _1713 = _1711 + 1;
    out.m_69.x = _802;
    float _1715 = _840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1717 = float(uint(_1693));
    float _1719 = trunc(_1695);
    int _1721 = int(_1719);
    out.m_71.x = _1234;
    out.m_71.y = _1232;
    out.m_71.z = _1236;
    float _1723 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1715);
    float _1725 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1723);
    int _1727 = as_type<int>(_1705) + (-2);
    float _1729 = exp2(_1701);
    float _1731 = as_type<float>(_1727) * _1717;
    int _1733 = ~_384;
    int _1735 = _1733 + 1;
    float _1737 = trunc(_1731);
    float _1739 = precise::max(_1737, 0.0);
    uint _1742 = uint(_1739);
    float _1744 = -_1729;
    float _1746 = _1744 + 1.0;
    float _1748 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1750 = _1709 * int(_1742);
    int _1752 = _1750 + _1693;
    float _1754 = float(uint(_1752));
    float _1756 = as_type<float>(_1727) * _1754;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1760 = _1758 != 0;
    float _1762 = trunc(_1756);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    bool _1768 = !_1760;
    float _1770 = _1768 ? 7.345489978790283203125 : 1.0;
    float _1772 = _1770 * _340;
    float _1774 = float(_1693);
    float _1776 = floor(_1772);
    bool _1778 = _1774 >= _428;
    bool _1780 = isnan(_1774);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(_428);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    int _1790 = int(_1742) + int(_1766);
    float _1792 = trunc(_1788);
    int _1794 = int(_1792);
    int _1796 = _1735 * _1790;
    int _1798 = _1796 + _1693;
    bool _1800 = uint(_1798) >= uint(_384);
    float _1802 = -_1776;
    float _1804 = _1772 + _1802;
    bool _1806 = !_1800;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = _1804 * _428;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1814 = _1812 != 0;
    int _1816 = ~_1790;
    int _1818 = _1816 + _1808;
    int _1820 = _1818 + 1;
    bool _1822 = !_1814;
    int _1824 = _1822 ? 0 : 1;
    float _1826 = trunc(_1810);
    int _1828 = int(_1826);
    int _1830 = _384 + (-1);
    int _1832 = _384 * _1820;
    int _1834 = _1832 + _1693;
    int _1836 = ~_1794;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1844 = _1842 != 0;
    bool _1846 = !_1697;
    int _1848 = _1846 ? _1834 : (-1);
    int _1850 = abs(_1824);
    int _1852 = abs(_592);
    int _1854 = _1848 * _1840;
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1858 = _1856 != 0;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1862 = _1860 != 0;
    int _1864 = _1794 * _1830;
    int _1866 = _1864 + _1854;
    bool _1868 = !_1844;
    int _1870 = _1868 ? 0 : 1;
    int _1872 = _1866 * _1852;
    int _1874 = _1828 * _1850;
    int _1876 = _1874 + _1693;
    int _1878 = abs(_1870);
    int _1880 = _1721 * _1699;
    int _1882 = _1880 + _1872;
    float _1884 = as_type<float>(_1699);
    float _1886 = _1584;
    float _1888 = _1636;
    if (_1858)
    {
        float _1890 = in.m_57.x;
        _1884 = _1890;
    }
    float _1892 = _1884;
    bool _1894 = _342 > 0.5;
    int _1896 = _1876 * _1703;
    int _1898 = _1896 + _1882;
    float _1900 = in.m_73.y;
    int _1902 = _1828 * _1878;
    int _1904 = _1902 + _1898;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1910 = float(uint(_1904));
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1914 = _1912 != 0;
    float _1916 = 1.0 / _1908;
    float _1918 = as_type<float>(_1727) * _1910;
    float _1920 = trunc(_1918);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    bool _1926 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1928 = isnan(_338);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1934 = _1930 || _1932;
    float _1936 = float(_1934);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1940 = in.m_73.x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1946 = _1944 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1948 = -_1900;
    float _1950 = _1948 + 1.0;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1956;
    float _1960 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1962 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1966 = _1958 * _1916;
    float _1968 = _1900;
    float _1970 = _1964;
    if (_1862)
    {
        float _1972 = _1894 ? _1950 : _1900;
        _1968 = _1972;
    }
    float _1974 = _1968;
    int _1976 = _1713 * int(_1924);
    int _1978 = _1976 + _1904;
    float _1980 = 1.0 / _1946;
    out.m_77.x = _1960;
    out.m_77.y = _1962;
    out.m_77.z = _1964;
    out.m_77.w = _1954;
    bool _1982 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1984 = isnan(_338);
    bool _1986 = _1982 || _1984;
    bool _1988 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1990 = _1986 || _1988;
    float _1992 = float(_1990);
    float _1994 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1996 = float(uint(_1978));
    bool _1998 = _1892 > 0.5;
    bool _2000 = _1998 && _1858;
    float _2002 = -_1992;
    float _2004 = _2002 + 1.0;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2010 = as_type<float>(_1727) * _1996;
    float _2012 = float(uint(_1876));
    float _2014 = -_522;
    float _2016 = fma(_510, _1994, _2014);
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2020 = _338 + _2018;
    float _2022 = _2008;
    if (_1858)
    {
        _1970 = _1940;
    }
    float _2024 = _1970;
    float _2026 = _1936 * _2004;
    bool _2028 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2030 = isnan(_338);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2036 = _2032 || _2034;
    float _2038 = float(_2036);
    float _2040 = fma(_1966, _2020, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2042 = -_1936;
    float _2044 = _2042 + 1.0;
    float _2046 = trunc(_2010);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    float _2052 = as_type<float>(_1727) * _2012;
    float _2054 = _2008 * _1980;
    float _2056 = _2024;
    if (_2000)
    {
        float _2058 = -_2024;
        float _2060 = _2058 + 1.0;
        _2056 = _2060;
    }
    float _2062 = _2056;
    if (!_1858)
    {
        _2022 = _1940;
    }
    float _2064 = _2022;
    float _2066 = _2038 * _2044;
    float _2068 = -_2038;
    float _2070 = _2068 + 1.0;
    bool _2072 = _778 != 0.0;
    bool _2074 = isnan(_778);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = trunc(_2052);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    float _2088 = _2040 * _2066;
    float _2090 = _2064;
    if (_1858)
    {
        _2090 = _2062;
    }
    float _2092 = _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2096 = _338 + _2094;
    int _2098 = ~_384;
    int _2100 = _2098 + 1;
    float _2102 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2088);
    int _2104 = ~_384;
    int _2106 = _2104 + 1;
    float _2108 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2110 = int(_1924) + int(_2050);
    float _2112 = fma(_2054, _2096, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2114 = fma(_506, _2108, _472);
    bool _2116 = _776 == 0.0;
    bool _2118 = !_2080;
    bool _2120 = _2116 && _2118;
    float _2122 = fma(_2112, _2026, _2102);
    int _2124 = _2106 * _2110;
    int _2126 = _2124 + _1904;
    float _2128 = in.m_79.x;
    float _2130 = in.m_79.y;
    float _2132 = in.m_79.z;
    int _2134 = _2100 * int(_2086);
    int _2136 = _2134 + _1876;
    float _2138 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2122);
    bool _2140 = uint(_2126) >= uint(_384);
    float _2142 = _2114 + 0.5;
    bool _2144 = _780 == 0.0;
    bool _2146 = _2144 && _2120;
    float _2148 = float(uint(_2136));
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2152 = !_2140;
    int _2154 = _2152 ? 0 : (-1);
    float _2156 = as_type<float>(_1727) * _2148;
    int _2158 = ~_2110;
    int _2160 = _2158 + _2154;
    int _2162 = _2160 + 1;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2166 = _2016 + 0.5;
    float _2168 = trunc(_2156);
    float _2170 = precise::max(_2168, 0.0);
    uint _2172 = uint(_2170);
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2176 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2178 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2180 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2182 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_81.x = _2142;
    out.m_81.y = _2166;
    float _2184 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = _2128;
    float _2188 = _2132;
    float _2190 = _2130;
    if (!_2146)
    {
        float _2192 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2128);
        _2186 = _2192;
    }
    float _2194 = _2186;
    int _2196 = _384 * _2162;
    int _2198 = _2196 + _1904;
    if (!_2146)
    {
        float _2200 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2188 = _2200;
    }
    float _2202 = _2188;
    int _2204 = ~_384;
    int _2206 = _2204 + 1;
    if (!_2146)
    {
        float _2208 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2130);
        _2190 = _2208;
    }
    float _2210 = _2190;
    float _2212 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2214 = !_1697;
    int _2216 = _2214 ? _2198 : (-1);
    out.m_83.x = _2176;
    out.m_83.y = _2178;
    out.m_83.z = _2182;
    out.m_83.w = _2180;
    int _2218 = int(_2086) + int(_2172);
    float _2220 = -_808;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    int _2224 = _2216 >> 31;
    float _2226 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2228 = _834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2230 = _2216 & 3;
    bool _2232 = _2230 != 0;
    float _2234 = _840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2236 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2234);
    int _2238 = _2206 * _2218;
    int _2240 = _2238 + _1876;
    float _2242 = -_808;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2212);
    int _2246 = _2224 & 3;
    float _2248 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    float _2250 = -_808;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2254 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    int _2256 = _2216 + _2246;
    float _2258 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2228);
    float _2260 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2252);
    bool _2262 = uint(_2240) >= uint(_384);
    float _2264 = abs(_1242);
    float _2266 = log2(_2264);
    int _2268 = _2256 >> 2;
    float _2270 = _834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2272 = _2254 * _2210;
    float _2274 = _2248 * _2210;
    int _2276 = _2268 << 4;
    int _2278 = _2276 + 368;
    float _2280 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2270);
    float _2282 = _2260 * _2210;
    bool _2284 = !_2262;
    int _2286 = _2284 ? 0 : (-1);
    uint _2288 = uint(int(uint(_2278) >> uint(2)));
    uint _2290 = uint(int(uint(int(_2288)) >> uint(2)));
    int _2292 = int(_2288) & 3;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[int(_2290)][_2292];
    int _2296 = int(_2288) + 1;
    uint _2298 = uint(int(uint(_2296) >> uint(2)));
    int _2300 = _2296 & 3;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[int(_2298)][_2300];
    float _2304 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2280);
    int _2306 = _2216 & 3;
    bool _2308 = _2306 != 0;
    float _2310 = _834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2312 = ~_2218;
    int _2314 = _2312 + _2286;
    int _2316 = _2314 + 1;
    float _2318 = fma(_2304, _2194, _2272);
    bool _2320 = uint(_2306) > 1u;
    float _2322 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2324 = _2278 + 8;
    uint _2326 = uint(int(uint(_2324) >> uint(2)));
    uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
    int _2330 = int(_2326) & 3;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[int(_2328)][_2330];
    int _2334 = int(_2326) + 1;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    int _2338 = _2334 & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = _2232 ? 0 : 1;
    float _2344 = _840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2346 = uint(_2306) >= 2u;
    float _2348 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2310);
    int _2350 = ~_2342;
    int _2352 = _2350 + 1;
    int _2354 = _2352 + 1;
    float _2356 = exp2(_2322);
    float _2358 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2344);
    float _2360 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2258);
    bool _2362 = !_2308;
    int _2364 = _2362 ? 0 : 1;
    float _2366 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2348);
    int _2368 = _2354;
    if (!_2320)
    {
        int _2370 = ~_2342;
        int _2372 = _2370 + 1;
        _2368 = _2372;
    }
    int _2374 = _2368;
    float _2376 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2358);
    bool _2378 = _2306 != 3;
    float _2380 = fma(_2360, _2194, _2274);
    int _2382 = abs(_2374);
    float _2384 = fma(_2366, _2194, _2282);
    int _2386 = _2346 ? 0 : 1;
    float _2388 = fma(_2376, _2202, _2318);
    int _2390 = abs(_2364);
    float _2392 = -_1654;
    float _2394 = _2392 + 1.0;
    int _2396 = ~_2386;
    int _2398 = _2396 + 1;
    int _2400 = _2398 + 1;
    int _2402 = _384 * _2316;
    int _2404 = _2402 + _1876;
    bool _2406 = _2306 != 3;
    float _2408 = _1748 * _1666;
    int _2410 = ~_2382;
    int _2412 = _2410 + 1;
    int _2414 = _2412 + 1;
    float _2416 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2236);
    int _2418 = _2400;
    if (_2378)
    {
        int _2420 = ~_2386;
        int _2422 = _2420 + 1;
        _2418 = _2422;
    }
    int _2424 = _2418;
    bool _2426 = !_2406;
    int _2428 = _2426 ? 0 : (-1);
    bool _2430 = _1242 <= 8000.0;
    bool _2432 = isnan(_1242);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan(8000.0);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = fma(_2356, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    bool _2446 = !_1697;
    int _2448 = _2446 ? _2404 : (-1);
    float _2450 = _1687 * _2408;
    int _2452 = abs(_2424);
    int _2454 = _2414 * as_type<int>(_2302);
    int _2456 = ~_2390;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    float _2462 = fma(_2416, _2202, _2380);
    bool _2464 = !_1914;
    int _2466 = _2464 ? 0 : 1;
    float _2468 = fma(_1725, _2202, _2384);
    int _2470 = abs(_2428);
    int _2472 = _2460 * as_type<int>(_2294);
    int _2474 = _2472 + _2454;
    float _2476 = _1634 + _1584;
    float _2478 = fma(_1677, _2450, _1675);
    int _2480 = abs(_2466);
    float _2482 = _2476 * 0.5;
    out.m_85.x = _2388;
    out.m_85.y = _2462;
    out.m_85.z = _2468;
    int _2484 = ~_2452;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2444, -2.0, 3.0);
    float _2492 = _2444 * _2444;
    int _2494 = ~_2470;
    int _2496 = _2494 + 1;
    int _2498 = _2496 + 1;
    int _2500 = _2488 * as_type<int>(_2332);
    int _2502 = _2500 + _2474;
    float _2504 = _2492 * _2490;
    float _2506 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2508 = _2498 * as_type<int>(_2340);
    int _2510 = _2508 + _2502;
    float _2512 = -_2504;
    float _2514 = _2512 + 1.0;
    int _2516 = ~_2480;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    float _2522 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2506);
    float _2524 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2504);
    float _2526 = in.m_87.x;
    float _2528 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2522);
    float _2530 = _2440 * _2524;
    int _2532 = _2510 * _2520;
    float _2534 = _1584 * 0.5;
    float _2536 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2528);
    float _2538 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2540 = _2448 * _2480;
    int _2542 = _2540 + _2532;
    float _2544 = fma(_1636, -0.5, _2534);
    float _2546 = _2536 + _1584;
    float _2548 = _2394 * _2538;
    float _2550 = precise::clamp(_2548, 0.0, 1.0);
    out.gl_Position.x = _1634;
    out.gl_Position.y = _1636;
    out.gl_Position.z = _2536;
    out.gl_Position.w = _1584;
    float _2552 = _1677 * _2408;
    float _2554 = float(_2542);
    float _2556 = -_2550;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2560 = _2546 * 0.5;
    float _2562 = fma(_1683, _2552, _1671);
    float _2564 = fma(_1685, _2552, _1673);
    out.m_89.x = _2554;
    bool _2566 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2568 = isnan(_1390);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2574 = _2570 || _2572;
    out.m_91.x = _2482;
    out.m_91.y = _2544;
    out.m_91.z = _2560;
    out.m_91.w = _1584;
    float _2576 = _2558 * _2526;
    float _2578 = -_1748;
    float _2580 = _2578 + 1.0;
    float _2582 = _2576 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2584 = _1677 * _2580;
    float _2586 = _1294 * _1350;
    float _2588 = _2526;
    float _2590 = _2552;
    float _2592 = _2536;
    float _2594 = _2586;
    if (!_2574)
    {
        _2588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2596 = _2588;
    out.m_93.x = _2582;
    float _2598 = _2586 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2600 = _2596;
    float _2602 = _2596;
    if (!_2574)
    {
        _2590 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2604 = _2590;
    out.m_95.x = _2562;
    out.m_95.y = _2564;
    out.m_95.z = _2478;
    out.m_95.w = _2584;
    float _2606 = _2604;
    float _2608 = _2604;
    if (!_2574)
    {
        _1886 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2610 = _1886;
    float _2612 = _2610;
    float _2614 = _2610;
    if (!_2574)
    {
        _2592 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2616 = _2592;
    float _2618 = _2616;
    float _2620 = _2616;
    if (!_2574)
    {
        _1888 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2622 = _1888;
    float _2624 = _2622;
    float _2626 = _2622;
    if (!_2574)
    {
        _2594 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2628 = _2594;
    bool _2630 = !_2574;
    float _2632 = _2628;
    float _2634 = _2628;
    if (!_2630)
    {
        bool _2636 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2638 = isnan(_1390);
        bool _2640 = _2636 || _2638;
        bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2644 = _2640 || _2642;
        if (!_2644)
        {
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2648 = _1390 + _2646;
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2652 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2650;
            float _2654 = 1.0 / _2652;
            float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2676 = _2648 * _2654;
            float _2678 = precise::clamp(_2676, 0.0, 1.0);
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2684 = fma(_2678, _2658, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2686 = fma(_2678, _2682, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2688 = fma(_2678, _2662, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2690 = fma(_2678, _2666, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2692 = fma(_2678, _2670, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2694 = fma(_2678, _2674, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2608 = _2686;
            _2626 = _2692;
            _2602 = _2684;
            _2620 = _2690;
            _2614 = _2688;
            _2634 = _2694;
            _2696 = true;
        }
        else
        {
            bool _2698 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2700 = isnan(_1390);
            bool _2702 = _2698 || _2700;
            bool _2704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2706 = _2702 || _2704;
            if (!_2706)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2708 = _2600;
            _2602 = _2708;
            if (!_2706)
            {
                _2606 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2710 = _2606;
            _2608 = _2710;
            if (!_2706)
            {
                _2612 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2712 = _2612;
            _2614 = _2712;
            if (!_2706)
            {
                _2618 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2714 = _2618;
            _2620 = _2714;
            if (!_2706)
            {
                _2624 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2716 = _2624;
            _2626 = _2716;
            if (!_2706)
            {
                _2632 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2718 = _2632;
            bool _2720 = !_2706;
            _2634 = _2718;
            if (!_2720)
            {
                bool _2722 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2724 = isnan(_1390);
                bool _2726 = _2722 || _2724;
                bool _2728 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2730 = _2726 || _2728;
                if (!_2730)
                {
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2734 = _1390 + _2732;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2738 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2736;
                    float _2740 = 1.0 / _2738;
                    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2762 = _2734 * _2740;
                    float _2764 = precise::clamp(_2762, 0.0, 1.0);
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2770 = fma(_2764, _2744, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2772 = fma(_2764, _2768, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2774 = fma(_2764, _2748, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2776 = fma(_2764, _2752, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2778 = fma(_2764, _2756, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2780 = fma(_2764, _2760, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2608 = _2772;
                    _2626 = _2778;
                    _2602 = _2770;
                    _2620 = _2776;
                    _2614 = _2774;
                    _2634 = _2780;
                    _2696 = true;
                }
                else
                {
                    _2608 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2626 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2620 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2614 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2634 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2696 = false;
    float _2782 = _2608;
    float _2784 = _2626;
    float _2786 = _2602;
    float _2788 = _2620;
    float _2790 = _2614;
    float _2792 = _2634;
    float _2794 = _2598 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2796 = fma(_2462, -0.5, 0.5);
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = -_2782;
    float _2802 = _2800 + _2784;
    float _2804 = -_2786;
    float _2806 = _2804 + _2788;
    out.m_53.x = _2794;
    float _2808 = fma(_2798, _2802, _2782);
    float _2810 = -_2790;
    float _2812 = _2810 + _2792;
    float _2814 = fma(_2798, _2806, _2786);
    float _2816 = _2808 * 0.586610972881317138671875;
    bool _2818 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2820 = fma(_2798, _2812, _2790);
    out.m_97.x = 0.0;
    float _2822 = fma(_2814, 0.298911988735198974609375, _2816);
    bool _2824 = _1294 > 0.0;
    bool _2826 = isnan(_1294);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan(0.0);
    bool _2832 = _2828 || _2830;
    float _2834 = fma(_2820, 0.114477999508380889892578125, _2822);
    bool _2836 = _1350 <= 0.0;
    bool _2838 = !_2832;
    bool _2840 = _2836 || _2838;
    float _2842 = -_2834;
    float _2844 = _2814 + _2842;
    float _2846 = -_2834;
    float _2848 = _2808 + _2846;
    float _2850 = -_2834;
    float _2852 = _2820 + _2850;
    float _2854 = fma(_2844, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2834);
    float _2856 = fma(_2848, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2834);
    float _2858 = fma(_2852, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2834);
    bool _2860 = !_2818;
    if (!_2860)
    {
        float _2862 = -_1232;
        float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2866 = -_1234;
        float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2870 = -_1236;
        float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2874 = _2864 * _2864;
        float _2876 = fma(_2868, _2868, _2874);
        float _2878 = fma(_2872, _2872, _2876);
        float _2880 = sqrt(_2878);
        float _2882 = rsqrt(_2878);
        float _2884 = -_2880;
        float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2888 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2890 = precise::clamp(_2888, 0.0, 1.0);
        float _2892 = _2868 * _2882;
        float _2894 = _2864 * _2882;
        float _2896 = abs(_2890);
        float _2898 = log2(_2896);
        float _2900 = _2872 * _2882;
        float _2902 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2904 = _2462 * _2894;
        float _2906 = -_2894;
        float _2908 = -_2902;
        float _2910 = fma(_2906, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2908);
        float _2912 = fma(_2388, _2892, _2904);
        float _2914 = -_2900;
        float _2916 = fma(_2914, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2910);
        float _2918 = fma(_2468, _2900, _2912);
        float _2920 = precise::clamp(_2918, 0.0, 1.0);
        float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2924 = _2916 + _2922;
        float _2926 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2928 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2930 = precise::clamp(_2928, 0.0, 1.0);
        float _2932 = exp2(_2926);
        float _2934 = _2932 * _2930;
        float _2936 = _2920 * _2934;
        float _2938 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2940 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2942 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2938;
        out.m_97.y = _2940;
        out.m_97.z = _2942;
    }
    out.m_67.x = _2854;
    out.m_67.y = _2856;
    out.m_67.z = _2858;
    if (!_2840)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2944 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2944;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2696 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_118);
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3013 = as_type<float>(_140);
        out.gl_Position.z = _3013;
    }
    if (!_126)
    {
        return out;
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3068 = as_type<float>(_166);
        out.gl_Position.z = _3068;
    }
    if (_160)
    {
        return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _122 * _174;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_176;
    float _200 = _178;
    float _218;
    if (!_198)
    {
        float _202 = in.m_57.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        _218 = _178;
    }
    _220 = false;
    float _222 = _218;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _222 + _224;
    bool _228 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_222);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -_238;
    float _246 = _244 + 1.0;
    bool _248 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _250 = isnan(_222);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = 1.0 / _242;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = _226 * _260;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = in.m_59.x;
    float _280 = in.m_59.y;
    float _282 = in.m_59.z;
    float _284 = _258 * _246;
    float _286 = fma(_264, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_276, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_268, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = -_258;
    float _294 = _292 + 1.0;
    float _296 = _286 * _284;
    float _298 = _288 * _284;
    float _300 = _290 * _284;
    float _302 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _302);
    float _310 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _304);
    float _312 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _306);
    float _314 = _308 * _278;
    float _316 = _310 * _280;
    float _318 = _312 * _282;
    bool _320 = !_270;
    if (!_320)
    {
        float _322 = in.m_57.x;
        float _324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _330 = _328 * _324;
        float _332 = floor(_330);
        float _334 = -_332;
        float _336 = _330 + _334;
        _200 = _336;
    }
    float _338 = _200;
    float _340 = in.m_57.x;
    float _342 = in.m_57.y;
    float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _346 = log2(_344);
    float _348 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = in.m_46.x;
    float _352 = in.m_46.y;
    float _354 = in.m_46.z;
    float _356 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _360 = in.m_57.z;
    float _362 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _364 = int(_362);
    float _366 = _348 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _368 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = _346 * _122;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _382 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _384 = int(_382);
    float _386 = _342 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _388 = _340 * 2.0;
    float _390 = _340 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _392 = _342 * 2.0;
    float _394 = fma(_386, -2.0, _358);
    float _396 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = floor(_388);
    float _400 = -_380;
    float _402 = fma(_390, 2.0, _400);
    float _404 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _406 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _408 = _342 + _340;
    float _410 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _412 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _404);
    float _414 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _406);
    float _416 = exp2(_378);
    float _418 = _342 + _360;
    float _420 = _360 * 2.0;
    float _422 = float(_364);
    float _424 = _408 + (-1.0);
    float _426 = _418 + (-1.0);
    float _428 = float(_384);
    float _430 = floor(_392);
    float _432 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _434 = _398 > 0.0;
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _438 = _398 >= 0.0;
    bool _440 = isnan(_398);
    bool _442 = _438 || _440;
    bool _444 = isnan(0.0);
    bool _446 = _442 || _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _450 = 1.0 + _448;
    float _452 = floor(_420);
    float _454 = -_416;
    float _456 = _454 + 1.0;
    bool _458 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _460 = isnan(1.0);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _466 = _462 || _464;
    float _468 = _428 * _122;
    float _470 = -_122;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[76].x, _402);
    float _474 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _410);
    float _476 = _376 ? _456 : 0.0;
    float _478 = 1.0 / _422;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _484 = _430 > 0.0;
    float _486 = _474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _488 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[78].z, _480);
    float _490 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    int _492 = _446 ? 0 : 1;
    float _494 = 1.0 / _450;
    bool _496 = _430 >= 0.0;
    bool _498 = isnan(_430);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    float _506 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _488);
    bool _508 = _452 > 0.0;
    float _510 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _490);
    bool _512 = _452 >= 0.0;
    bool _514 = isnan(_452);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    float _522 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    int _524 = ~_492;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = _478 * _122;
    int _532 = _528;
    if (!_434)
    {
        int _534 = ~_492;
        int _536 = _534 + 1;
        _532 = _536;
    }
    int _538 = _532;
    float _540 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    int _542 = _504 ? 0 : 1;
    float _544 = float(_538);
    float _546 = _540 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _548 = ~_542;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    int _554 = _552;
    if (_466)
    {
        float _556 = _476 * _494;
        _132 = _556;
    }
    float _558 = _132;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _570 = _568 != 0;
    float _572 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    if (!_484)
    {
        int _574 = ~_542;
        int _576 = _574 + 1;
        _554 = _576;
    }
    int _578 = _554;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _582 = _546 + _580;
    float _584 = in.m_61.x;
    float _586 = in.m_61.y;
    float _588 = in.m_61.z;
    bool _590 = !_566;
    int _592 = _590 ? 0 : 1;
    float _594 = _572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _596 = !_562;
    int _598 = _596 ? 0 : 1;
    bool _600 = !_570;
    int _602 = _600 ? 0 : 1;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    int _616 = _520 ? 0 : 1;
    bool _618 = !_610;
    int _620 = _618 ? 0 : 1;
    bool _622 = !_606;
    int _624 = _622 ? 0 : 1;
    int _626 = abs(_620);
    int _628 = abs(_624);
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _632 = _486 + _630;
    float _634 = float(_626);
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _638 = _594 + _636;
    int _640 = ~_616;
    int _642 = _640 + 1;
    int _644 = _642 + 1;
    float _646 = _632 * _632;
    int _648 = _644;
    if (!_508)
    {
        int _650 = ~_616;
        int _652 = _650 + 1;
        _648 = _652;
    }
    int _654 = _648;
    float _656 = _634 * _544;
    float _658 = float(_628);
    float _660 = fma(_582, _582, _646);
    float _662 = float(_654);
    float _664 = _656 * (-2.0);
    bool _666 = !_614;
    int _668 = _666 ? 0 : 1;
    float _670 = fma(_638, _638, _660);
    float _672 = _342 + (-0.5);
    float _674 = fma(_664, _586, _586);
    int _676 = abs(_668);
    float _678 = sqrt(_670);
    float _680 = _658 * _662;
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _684 = _360 + _340;
    float _686 = float(_578);
    float _688 = fma(_436, _664, _436);
    float _690 = float(_676);
    float _692 = _684 + (-1.0);
    float _694 = rsqrt(_670);
    float _696 = _680 * (-2.0);
    float _698 = _690 * _686;
    float _700 = _360 + (-0.5);
    float _702 = fma(_688, _558, _682);
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _706 = _678 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _708 = _340 + (-0.5);
    float _710 = fma(_696, _584, _584);
    float _712 = fma(_432, _696, _432);
    float _714 = _698 * (-2.0);
    float _716 = precise::min(_366, _706);
    float _718 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _710);
    float _720 = _702 * 0.15915493667125701904296875;
    float _722 = fma(_704, _714, _704);
    float _724 = fma(_714, _588, _588);
    float _726 = _694 * _716;
    float _728 = fma(_712, _558, _718);
    float _730 = _720 * 6.283185482025146484375;
    float _732 = sin(_730);
    float _734 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].z, _724);
    float _736 = _632 * _726;
    float _738 = _582 * _726;
    float _740 = _638 * _726;
    float _742 = _728 * 0.15915493667125701904296875;
    float _744 = -_736;
    float _746 = _632 + _744;
    float _748 = -_738;
    float _750 = _582 + _748;
    float _752 = -_740;
    float _754 = _638 + _752;
    float _756 = fma(_722, _558, _734);
    float _758 = _746 * _746;
    float _760 = _720 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _766 = fma(_750, _750, _758);
    float _768 = _756 * 0.15915493667125701904296875;
    float _770 = fma(_754, _754, _766);
    float _772 = _742 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = in.m_63.x;
    float _778 = in.m_63.y;
    float _780 = in.m_63.z;
    float _782 = sqrt(_770);
    float _784 = _742 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _774 * _732;
    float _790 = _774 * _762;
    float _792 = _768 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = _694 * _782;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _778);
    float _800 = _764 * _796;
    float _802 = _348 * _796;
    float _804 = _356 * _796;
    float _806 = _768 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _786 * _762;
    float _812 = _786 * _732;
    float _814 = _800 * _798;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _818 = _774 * _794;
    float _820 = _762 * _794;
    float _822 = _786 * _794;
    float _824 = _732 * _794;
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _828 = _804 * _816;
    float _830 = _818 * _814;
    float _832 = _802 * _826;
    float _834 = fma(_808, _810, _788);
    float _836 = _822 * _814;
    float _838 = -_790;
    float _840 = fma(_808, _812, _838);
    float _842 = -_814;
    float _844 = _808 * _842;
    float _846 = -_812;
    float _848 = fma(_808, _790, _846);
    float _850 = fma(_834, _832, _836);
    float _852 = fma(_808, _788, _810);
    float _854 = fma(_820, _832, _844);
    float _856 = fma(_848, _832, _830);
    float _858 = fma(_840, _828, _850);
    float _860 = fma(_824, _828, _854);
    float _862 = fma(_852, _828, _856);
    float _864 = _858 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _866 = _858 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _868 = _858 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _870 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _864);
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _866);
    float _874 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _868);
    float _876 = -_736;
    float _878 = _486 + _876;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _870);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _872);
    float _884 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _886 = -_738;
    float _888 = _546 + _886;
    float _890 = _880 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _894 = _884 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _896 = -_740;
    float _898 = _594 + _896;
    float _900 = _594 + _890;
    float _902 = _546 + _892;
    float _904 = _486 + _894;
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _908 = _900 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _912 = _902 + _910;
    float _914 = _908 * _908;
    float _916 = fma(_912, _912, _914);
    float _918 = _878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _920 = sqrt(_916);
    float _922 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].x, _918);
    float _924 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _922);
    bool _926 = _920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _894;
    float _930 = _902;
    float _932 = _884;
    float _934 = _736;
    float _936 = _738;
    if (!_926)
    {
        _928 = _902;
    }
    float _938 = _928;
    float _940 = _938;
    if (!_926)
    {
        _930 = _900;
    }
    float _942 = _930;
    float _944 = _942;
    if (!_926)
    {
        _932 = _904;
    }
    float _946 = _932;
    bool _948 = !_926;
    float _950 = _946;
    if (!_948)
    {
        float _952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _956 = _920 + _954;
        float _958 = _904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = rsqrt(_916);
        float _962 = _956 * _952;
        float _964 = _962 * 0.15915493667125701904296875;
        float _966 = _964 * 6.283185482025146484375;
        float _968 = cos(_966);
        float _970 = _964 * 6.283185482025146484375;
        float _972 = sin(_970);
        float _974 = _968 + (-1.0);
        float _976 = _974 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = fma(_972, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _980 = fma(_904, _968, _976);
        float _982 = _960 * _978;
        float _984 = fma(_912, _982, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _986 = fma(_908, _982, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _950 = _980;
        _940 = _984;
        _944 = _986;
    }
    float _988 = _950;
    float _990 = _940;
    float _992 = _944;
    float _994 = -_486;
    float _996 = _994 + _988;
    float _998 = -_546;
    float _1000 = _998 + _990;
    float _1002 = _924 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1004 = _878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1006 = _996 * _996;
    float _1008 = -_594;
    float _1010 = _1008 + _992;
    float _1012 = 1.0 / _1002;
    float _1014 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1004);
    float _1016 = fma(_1000, _1000, _1006);
    float _1018 = -_738;
    float _1020 = _1018 + _990;
    float _1022 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1014);
    float _1024 = fma(_1010, _1010, _1016);
    float _1026 = -_736;
    float _1028 = _1026 + _988;
    float _1030 = -_740;
    float _1032 = _1030 + _992;
    float _1034 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1036 = sqrt(_1024);
    bool _1038 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1040 = isnan(0.5);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1046 = _1042 || _1044;
    float _1048 = _1034 + _1002;
    bool _1050 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1052 = isnan(0.5);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1058 = _1054 || _1056;
    float _1060 = _1048 * _1012;
    float _1062 = _1060 * 0.5;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1066 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1064);
    float _1068 = 1.0 / _1066;
    bool _1070 = _1036 > 0.0;
    float _1072 = _1036;
    float _1074 = _992;
    float _1076 = _1000;
    float _1078 = _1002;
    float _1080 = _1032;
    float _1082 = _1066;
    float _1084 = _988;
    if (!_1070)
    {
        _934 = _1020;
    }
    float _1086 = _934;
    float _1088 = _1086;
    if (!_1070)
    {
        _936 = _1028;
    }
    float _1090 = _936;
    float _1092 = _1090;
    if (!_1070)
    {
        _1072 = _1032;
    }
    float _1094 = _1072;
    bool _1096 = !_1070;
    float _1098 = _1094;
    float _1100 = _1094;
    if (!_1096)
    {
        float _1102 = _194 * _194;
        float _1104 = rsqrt(_1024);
        float _1106 = fma(_192, _192, _1102);
        float _1108 = fma(_196, _196, _1106);
        float _1110 = sqrt(_1108);
        float _1112 = _996 * _1104;
        float _1114 = _1000 * _1104;
        float _1116 = _1010 * _1104;
        bool _1118 = _1110 > 0.0;
        float _1120 = _1104;
        float _1122 = _1110;
        _1074 = _1114;
        if (!_1118)
        {
            _1120 = _1020;
        }
        float _1124 = _1120;
        _1088 = _1124;
        if (!_1118)
        {
            _1122 = _1028;
        }
        float _1126 = _1122;
        _1092 = _1126;
        if (!_1118)
        {
            _1098 = _1032;
        }
        float _1128 = _1098;
        bool _1130 = !_1118;
        _1100 = _1128;
        if (!_1130)
        {
            float _1132 = rsqrt(_1108);
            float _1134 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1136 = _194 * _1132;
            float _1138 = _192 * _1132;
            float _1140 = _1112 * _1136;
            float _1142 = _196 * _1132;
            float _1144 = fma(_1114, _1138, _1140);
            float _1146 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1148 = fma(_1116, _1142, _1144);
            float _1150 = _1148 * _1146;
            float _1152 = fma(_192, _1150, _1020);
            float _1154 = fma(_194, _1150, _1028);
            float _1156 = fma(_196, _1150, _1032);
            _1088 = _1152;
            _1092 = _1154;
            _1100 = _1156;
            _1076 = _1150;
        }
    }
    float _1158 = _1088;
    float _1160 = _1092;
    float _1162 = _1100;
    float _1164 = _1074;
    float _1166 = _1076;
    float _1168 = _1166;
    float _1170 = _1160;
    float _1172 = _1158;
    float _1174 = _1162;
    float _1176 = _1164;
    if (_1058)
    {
        _1168 = 1.0;
    }
    float _1178 = _1168;
    float _1180 = _1178;
    if (!_1046)
    {
        float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1184 = _878 + _1182;
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1188 = _888 + _1186;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1192 = _1184 * _1184;
        float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1196 = _898 + _1194;
        float _1198 = fma(_1188, _1188, _1192);
        float _1200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1202 = fma(_1196, _1196, _1198);
        float _1204 = sqrt(_1202);
        float _1206 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1208 = precise::min(_1204, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1210 = _1208 * _1200;
        float _1212 = -_888;
        float _1214 = _1212 + _1158;
        float _1216 = _1206 * _1210;
        float _1218 = -_878;
        float _1220 = _1218 + _1160;
        float _1222 = -_898;
        float _1224 = _1222 + _1162;
        float _1226 = fma(_1214, _1216, _888);
        float _1228 = fma(_1220, _1216, _878);
        float _1230 = fma(_1224, _1216, _898);
        _1170 = _1228;
        _1172 = _1226;
        _1174 = _1230;
    }
    float _1232 = _1170;
    float _1234 = _1172;
    float _1236 = _1174;
    if (_1058)
    {
        _1078 = 1.0;
    }
    float _1238 = _1078;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1242 = _1068 * _1240;
    float _1244 = _1238;
    if (!_1058)
    {
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1248 = _1246 * 0.15915493667125701904296875;
        float _1250 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1252 = _1248 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = _1250 * 0.15915493667125701904296875;
        float _1258 = _1248 * 6.283185482025146484375;
        float _1260 = sin(_1258);
        float _1262 = 1.0 / _1254;
        float _1264 = _1256 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        float _1268 = _1260 * _1262;
        float _1270 = _1256 * 6.283185482025146484375;
        float _1272 = sin(_1270);
        float _1274 = _1266 * _1268;
        float _1276 = 1.0 / _1274;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1280 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1278;
        float _1282 = 1.0 / _1280;
        float _1284 = _1272 * _1276;
        float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1288 = fma(_1242, _1284, _1286);
        float _1290 = _1288 * _1282;
        float _1292 = precise::clamp(_1290, 0.0, 1.0);
        _1180 = _1292;
    }
    float _1294 = _1180;
    if (!_1058)
    {
        float _1296 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1298 = _1296 * 0.15915493667125701904296875;
        float _1300 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1302 = _1298 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        float _1306 = _1300 * 0.15915493667125701904296875;
        float _1308 = _1298 * 6.283185482025146484375;
        float _1310 = sin(_1308);
        float _1312 = 1.0 / _1304;
        float _1314 = _1306 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = _1310 * _1312;
        float _1320 = _1306 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = _1316 * _1318;
        float _1326 = 1.0 / _1324;
        float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1330 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1328;
        float _1332 = 1.0 / _1330;
        float _1334 = _1322 * _1326;
        float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1338 = fma(_1242, _1334, _1336);
        float _1340 = _1338 * _1332;
        float _1342 = precise::clamp(_1340, 0.0, 1.0);
        float _1344 = -_1342;
        float _1346 = _1344 + 1.0;
        _1080 = _1326;
        _1244 = _1346;
    }
    float _1348 = _1080;
    float _1350 = _1244;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1354 = _1232 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1358 = _1234 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1362 = _1236 + _1360;
    float _1364 = _1354 * _1354;
    float _1366 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1368 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1370 = fma(_1358, _1358, _1364);
    float _1372 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1366);
    float _1374 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1368);
    float _1376 = fma(_1362, _1362, _1370);
    float _1378 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1372);
    float _1380 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1374);
    float _1382 = rsqrt(_1376);
    float _1384 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1386 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1388 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1390 = sqrt(_1376);
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1394 = _1358 * _1392;
    float _1396 = _1362 * _1392;
    float _1398 = _1394 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 + _1400;
    float _1404 = sqrt(_1402);
    bool _1406 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = _1404 + _1408;
    float _1412 = _1028;
    float _1414 = _1402;
    float _1416 = _1410;
    float _1418 = _1394;
    float _1420 = _1396;
    float _1422 = _1398;
    float _1424 = _1400;
    if (_1406)
    {
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1426;
    }
    float _1428 = _1412;
    if (_1406)
    {
        float _1430 = rsqrt(_1402);
        _1414 = _1430;
    }
    float _1432 = _1414;
    if (_1406)
    {
        float _1434 = _1410 * _1428;
        _1416 = _1434;
    }
    float _1436 = _1416;
    if (_1406)
    {
        float _1438 = _1436 * 0.15915493667125701904296875;
        _1082 = _1438;
    }
    float _1440 = _1082;
    float _1442 = _1428;
    if (_1406)
    {
        float _1444 = _1440 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        _1442 = _1446;
    }
    float _1448 = _1442;
    float _1450 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1452 = precise::max(0.0, _1450);
    float _1454 = _1348;
    if (_1406)
    {
        float _1456 = _1440 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        _1454 = _1458;
    }
    float _1460 = _1454;
    float _1462 = -_1392;
    float _1464 = -_1452;
    float _1466 = fma(_1354, _1462, _1464);
    if (_1406)
    {
        float _1468 = _1466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1084 = _1468;
    }
    float _1470 = _1084;
    float _1472 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1474 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1476 = _1470;
    float _1478 = _1448;
    if (_1406)
    {
        float _1480 = fma(_1448, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1476 = _1480;
    }
    float _1482 = _1476;
    float _1484 = _1482;
    if (!_1406)
    {
        _1478 = _1466;
    }
    float _1486 = _1478;
    float _1488 = floor(_1474);
    float _1490 = _1486;
    if (_1406)
    {
        float _1492 = _1460 + (-1.0);
        _1176 = _1492;
    }
    float _1494 = _1176;
    float _1496 = _1494;
    if (_1406)
    {
        float _1498 = _1432 * _1482;
        _1484 = _1498;
    }
    float _1500 = _1484;
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1504 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1502);
    float _1506 = precise::clamp(_1504, 0.0, 1.0);
    if (_1406)
    {
        float _1508 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1508;
    }
    float _1510 = _1496;
    if (_1406)
    {
        float _1512 = _1394 * _1500;
        _1418 = _1512;
    }
    float _1514 = _1418;
    if (_1406)
    {
        float _1516 = _1396 * _1500;
        _1420 = _1516;
    }
    float _1518 = _1420;
    if (_1406)
    {
        float _1520 = fma(_1466, _1460, _1510);
        _1490 = _1520;
    }
    float _1522 = _1490;
    if (_1406)
    {
        float _1524 = _1514 * _1514;
        _1422 = _1524;
    }
    float _1526 = _1422;
    if (_1406)
    {
        float _1528 = _1518 * _1518;
        _1424 = _1528;
    }
    float _1530 = _1424;
    float _1532 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1472);
    float _1534 = -_1506;
    float _1536 = _1534 + 1.0;
    float _1538 = fma(_1522, _1522, _1526);
    float _1540 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1542 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1544 = _1538 + _1530;
    float _1546 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1532);
    float _1548 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1542);
    float _1550 = abs(_1536);
    float _1552 = log2(_1550);
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1556 = _1546 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1558 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1548);
    float _1560 = -_1388;
    float _1562 = fma(_1560, _1554, 1.0);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1566 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1568 = rsqrt(_1544);
    float _1570 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1572 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1570);
    float _1574 = floor(_1540);
    float _1576 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1572);
    float _1578 = _1568 * _1514;
    float _1580 = _1568 * _1522;
    float _1582 = _1568 * _1518;
    float _1584 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1576);
    float _1586 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1588 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1590 = log2(_1562);
    float _1592 = _1580 + 1.0;
    float _1594 = -_1586;
    float _1596 = fma(_1580, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1594);
    float _1598 = -_1574;
    float _1600 = _1540 + _1598;
    float _1602 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1564);
    float _1604 = -_1582;
    float _1606 = fma(_1604, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1596);
    float _1608 = -_1488;
    float _1610 = _1474 + _1608;
    float _1612 = 1.0 / _1584;
    float _1614 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1616 = fma(_1606, -0.5, 0.5);
    float _1618 = fma(_1606, 0.5, 0.5);
    float _1620 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1602);
    float _1622 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1614);
    float _1624 = fma(_1618, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1626 = exp2(_1588);
    float _1628 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1622);
    float _1630 = _1590 * 0.693147182464599609375;
    float _1632 = fma(_1618, _1624, -0.212114393711090087890625);
    float _1634 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1628);
    float _1636 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1638 = fma(_1618, _1632, 1.570728778839111328125);
    float _1640 = sqrt(_1616);
    float _1642 = _1634 * _1612;
    float _1644 = _1636 * _1612;
    float _1646 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1648 = fma(_1644, -0.5, 0.5);
    float _1650 = -_1580;
    float _1652 = fma(_1626, _1592, _1650);
    float2 _5375 = float2(_1610, _1600);
    float _1654 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5375, float2(0.0), isnan(_5375)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5375, float2(0.0), isnan(_5375)), level(0.0)).x;
    float _1656 = fma(_1652, 0.5, 0.5);
    float _1658 = _1640 * 0.636619746685028076171875;
    float _1660 = fma(_1642, 0.5, 0.5);
    float _1662 = -_1638;
    float _1664 = fma(_1658, _1662, 1.0);
    float3 _5398 = float3(_1660, _1648, _1646);
    float _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float3 _5409 = float3(_1660, _1648, _1646);
    float4 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5409, float3(0.0), isnan(_5409)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5409, float3(0.0), isnan(_5409)), level(0.0)).xyzw;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = _1669.w;
    float2 _5425 = float2(_1664, _1656);
    float3 _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5425, float2(0.0), isnan(_5425)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5425, float2(0.0), isnan(_5425)), level(0.0)).xyz;
    float _1683 = _1681.x;
    float _1685 = _1681.y;
    float _1687 = _1681.z;
    float _1689 = float(uint(_384));
    float _1691 = trunc(_530);
    int _1693 = int(_1691);
    float _1695 = _468 * _174;
    bool _1697 = _384 == 0;
    out.m_65.x = _888;
    out.m_65.y = _878;
    out.m_65.z = _898;
    int _1699 = abs(_598);
    float _1701 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1703 = abs(_602);
    out.m_67.w = _716;
    float _1705 = 1.0 / _1689;
    int _1707 = ~_384;
    int _1709 = _1707 + 1;
    int _1711 = ~_384;
    int _1713 = _1711 + 1;
    out.m_69.x = _802;
    float _1715 = _840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1717 = float(uint(_1693));
    float _1719 = trunc(_1695);
    int _1721 = int(_1719);
    out.m_71.x = _1234;
    out.m_71.y = _1232;
    out.m_71.z = _1236;
    float _1723 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1715);
    float _1725 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1723);
    int _1727 = as_type<int>(_1705) + (-2);
    float _1729 = exp2(_1701);
    float _1731 = as_type<float>(_1727) * _1717;
    int _1733 = ~_384;
    int _1735 = _1733 + 1;
    float _1737 = trunc(_1731);
    float _1739 = precise::max(_1737, 0.0);
    uint _1742 = uint(_1739);
    float _1744 = -_1729;
    float _1746 = _1744 + 1.0;
    float _1748 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1750 = _1709 * int(_1742);
    int _1752 = _1750 + _1693;
    float _1754 = float(uint(_1752));
    float _1756 = as_type<float>(_1727) * _1754;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1760 = _1758 != 0;
    float _1762 = trunc(_1756);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    bool _1768 = !_1760;
    float _1770 = _1768 ? 7.345489978790283203125 : 1.0;
    float _1772 = _1770 * _340;
    float _1774 = float(_1693);
    float _1776 = floor(_1772);
    bool _1778 = _1774 >= _428;
    bool _1780 = isnan(_1774);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(_428);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    int _1790 = int(_1742) + int(_1766);
    float _1792 = trunc(_1788);
    int _1794 = int(_1792);
    int _1796 = _1735 * _1790;
    int _1798 = _1796 + _1693;
    bool _1800 = uint(_1798) >= uint(_384);
    float _1802 = -_1776;
    float _1804 = _1772 + _1802;
    bool _1806 = !_1800;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = _1804 * _428;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1814 = _1812 != 0;
    int _1816 = ~_1790;
    int _1818 = _1816 + _1808;
    int _1820 = _1818 + 1;
    bool _1822 = !_1814;
    int _1824 = _1822 ? 0 : 1;
    float _1826 = trunc(_1810);
    int _1828 = int(_1826);
    int _1830 = _384 + (-1);
    int _1832 = _384 * _1820;
    int _1834 = _1832 + _1693;
    int _1836 = ~_1794;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1844 = _1842 != 0;
    bool _1846 = !_1697;
    int _1848 = _1846 ? _1834 : (-1);
    int _1850 = abs(_1824);
    int _1852 = abs(_592);
    int _1854 = _1848 * _1840;
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1858 = _1856 != 0;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1862 = _1860 != 0;
    int _1864 = _1794 * _1830;
    int _1866 = _1864 + _1854;
    bool _1868 = !_1844;
    int _1870 = _1868 ? 0 : 1;
    int _1872 = _1866 * _1852;
    int _1874 = _1828 * _1850;
    int _1876 = _1874 + _1693;
    int _1878 = abs(_1870);
    int _1880 = _1721 * _1699;
    int _1882 = _1880 + _1872;
    float _1884 = as_type<float>(_1699);
    float _1886 = _1584;
    float _1888 = _1636;
    if (_1858)
    {
        float _1890 = in.m_57.x;
        _1884 = _1890;
    }
    float _1892 = _1884;
    bool _1894 = _342 > 0.5;
    int _1896 = _1876 * _1703;
    int _1898 = _1896 + _1882;
    float _1900 = in.m_73.y;
    int _1902 = _1828 * _1878;
    int _1904 = _1902 + _1898;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1910 = float(uint(_1904));
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1914 = _1912 != 0;
    float _1916 = 1.0 / _1908;
    float _1918 = as_type<float>(_1727) * _1910;
    float _1920 = trunc(_1918);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    bool _1926 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1928 = isnan(_338);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1934 = _1930 || _1932;
    float _1936 = float(_1934);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1940 = in.m_73.x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1946 = _1944 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1948 = -_1900;
    float _1950 = _1948 + 1.0;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1956;
    float _1960 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1962 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1966 = _1958 * _1916;
    float _1968 = _1900;
    float _1970 = _1964;
    if (_1862)
    {
        float _1972 = _1894 ? _1950 : _1900;
        _1968 = _1972;
    }
    float _1974 = _1968;
    int _1976 = _1713 * int(_1924);
    int _1978 = _1976 + _1904;
    float _1980 = 1.0 / _1946;
    out.m_77.x = _1960;
    out.m_77.y = _1962;
    out.m_77.z = _1964;
    out.m_77.w = _1954;
    bool _1982 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1984 = isnan(_338);
    bool _1986 = _1982 || _1984;
    bool _1988 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1990 = _1986 || _1988;
    float _1992 = float(_1990);
    float _1994 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1996 = float(uint(_1978));
    bool _1998 = _1892 > 0.5;
    bool _2000 = _1998 && _1858;
    float _2002 = -_1992;
    float _2004 = _2002 + 1.0;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2010 = as_type<float>(_1727) * _1996;
    float _2012 = float(uint(_1876));
    float _2014 = -_522;
    float _2016 = fma(_510, _1994, _2014);
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2020 = _338 + _2018;
    float _2022 = _2008;
    if (_1858)
    {
        _1970 = _1940;
    }
    float _2024 = _1970;
    float _2026 = _1936 * _2004;
    bool _2028 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2030 = isnan(_338);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2036 = _2032 || _2034;
    float _2038 = float(_2036);
    float _2040 = fma(_1966, _2020, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2042 = -_1936;
    float _2044 = _2042 + 1.0;
    float _2046 = trunc(_2010);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    float _2052 = as_type<float>(_1727) * _2012;
    float _2054 = _2008 * _1980;
    float _2056 = _2024;
    if (_2000)
    {
        float _2058 = -_2024;
        float _2060 = _2058 + 1.0;
        _2056 = _2060;
    }
    float _2062 = _2056;
    if (!_1858)
    {
        _2022 = _1940;
    }
    float _2064 = _2022;
    float _2066 = _2038 * _2044;
    float _2068 = -_2038;
    float _2070 = _2068 + 1.0;
    bool _2072 = _778 != 0.0;
    bool _2074 = isnan(_778);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = trunc(_2052);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    float _2088 = _2040 * _2066;
    float _2090 = _2064;
    if (_1858)
    {
        _2090 = _2062;
    }
    float _2092 = _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2096 = _338 + _2094;
    int _2098 = ~_384;
    int _2100 = _2098 + 1;
    float _2102 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2088);
    int _2104 = ~_384;
    int _2106 = _2104 + 1;
    float _2108 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2110 = int(_1924) + int(_2050);
    float _2112 = fma(_2054, _2096, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2114 = fma(_506, _2108, _472);
    bool _2116 = _776 == 0.0;
    bool _2118 = !_2080;
    bool _2120 = _2116 && _2118;
    float _2122 = fma(_2112, _2026, _2102);
    int _2124 = _2106 * _2110;
    int _2126 = _2124 + _1904;
    float _2128 = in.m_79.x;
    float _2130 = in.m_79.y;
    float _2132 = in.m_79.z;
    int _2134 = _2100 * int(_2086);
    int _2136 = _2134 + _1876;
    float _2138 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2122);
    bool _2140 = uint(_2126) >= uint(_384);
    float _2142 = _2114 + 0.5;
    bool _2144 = _780 == 0.0;
    bool _2146 = _2144 && _2120;
    float _2148 = float(uint(_2136));
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2152 = !_2140;
    int _2154 = _2152 ? 0 : (-1);
    float _2156 = as_type<float>(_1727) * _2148;
    int _2158 = ~_2110;
    int _2160 = _2158 + _2154;
    int _2162 = _2160 + 1;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2166 = _2016 + 0.5;
    float _2168 = trunc(_2156);
    float _2170 = precise::max(_2168, 0.0);
    uint _2172 = uint(_2170);
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2176 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2178 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2180 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2182 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_81.x = _2142;
    out.m_81.y = _2166;
    float _2184 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = _2128;
    float _2188 = _2132;
    float _2190 = _2130;
    if (!_2146)
    {
        float _2192 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2128);
        _2186 = _2192;
    }
    float _2194 = _2186;
    int _2196 = _384 * _2162;
    int _2198 = _2196 + _1904;
    if (!_2146)
    {
        float _2200 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2188 = _2200;
    }
    float _2202 = _2188;
    int _2204 = ~_384;
    int _2206 = _2204 + 1;
    if (!_2146)
    {
        float _2208 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2130);
        _2190 = _2208;
    }
    float _2210 = _2190;
    float _2212 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2214 = !_1697;
    int _2216 = _2214 ? _2198 : (-1);
    out.m_83.x = _2176;
    out.m_83.y = _2178;
    out.m_83.z = _2182;
    out.m_83.w = _2180;
    int _2218 = int(_2086) + int(_2172);
    float _2220 = -_808;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    int _2224 = _2216 >> 31;
    float _2226 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2228 = _834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2230 = _2216 & 3;
    bool _2232 = _2230 != 0;
    float _2234 = _840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2236 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2234);
    int _2238 = _2206 * _2218;
    int _2240 = _2238 + _1876;
    float _2242 = -_808;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2212);
    int _2246 = _2224 & 3;
    float _2248 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    float _2250 = -_808;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2254 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    int _2256 = _2216 + _2246;
    float _2258 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2228);
    float _2260 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2252);
    bool _2262 = uint(_2240) >= uint(_384);
    float _2264 = abs(_1242);
    float _2266 = log2(_2264);
    int _2268 = _2256 >> 2;
    float _2270 = _834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2272 = _2254 * _2210;
    float _2274 = _2248 * _2210;
    int _2276 = _2268 << 4;
    int _2278 = _2276 + 368;
    float _2280 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2270);
    float _2282 = _2260 * _2210;
    bool _2284 = !_2262;
    int _2286 = _2284 ? 0 : (-1);
    uint _2288 = uint(int(uint(_2278) >> uint(2)));
    uint _2290 = uint(int(uint(int(_2288)) >> uint(2)));
    int _2292 = int(_2288) & 3;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[int(_2290)][_2292];
    int _2296 = int(_2288) + 1;
    uint _2298 = uint(int(uint(_2296) >> uint(2)));
    int _2300 = _2296 & 3;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[int(_2298)][_2300];
    float _2304 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2280);
    int _2306 = _2216 & 3;
    bool _2308 = _2306 != 0;
    float _2310 = _834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2312 = ~_2218;
    int _2314 = _2312 + _2286;
    int _2316 = _2314 + 1;
    float _2318 = fma(_2304, _2194, _2272);
    bool _2320 = uint(_2306) > 1u;
    float _2322 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2324 = _2278 + 8;
    uint _2326 = uint(int(uint(_2324) >> uint(2)));
    uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
    int _2330 = int(_2326) & 3;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[int(_2328)][_2330];
    int _2334 = int(_2326) + 1;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    int _2338 = _2334 & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = _2232 ? 0 : 1;
    float _2344 = _840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2346 = uint(_2306) >= 2u;
    float _2348 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2310);
    int _2350 = ~_2342;
    int _2352 = _2350 + 1;
    int _2354 = _2352 + 1;
    float _2356 = exp2(_2322);
    float _2358 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2344);
    float _2360 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2258);
    bool _2362 = !_2308;
    int _2364 = _2362 ? 0 : 1;
    float _2366 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2348);
    int _2368 = _2354;
    if (!_2320)
    {
        int _2370 = ~_2342;
        int _2372 = _2370 + 1;
        _2368 = _2372;
    }
    int _2374 = _2368;
    float _2376 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2358);
    bool _2378 = _2306 != 3;
    float _2380 = fma(_2360, _2194, _2274);
    int _2382 = abs(_2374);
    float _2384 = fma(_2366, _2194, _2282);
    int _2386 = _2346 ? 0 : 1;
    float _2388 = fma(_2376, _2202, _2318);
    int _2390 = abs(_2364);
    float _2392 = -_1654;
    float _2394 = _2392 + 1.0;
    int _2396 = ~_2386;
    int _2398 = _2396 + 1;
    int _2400 = _2398 + 1;
    int _2402 = _384 * _2316;
    int _2404 = _2402 + _1876;
    bool _2406 = _2306 != 3;
    float _2408 = _1748 * _1666;
    int _2410 = ~_2382;
    int _2412 = _2410 + 1;
    int _2414 = _2412 + 1;
    float _2416 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2236);
    int _2418 = _2400;
    if (_2378)
    {
        int _2420 = ~_2386;
        int _2422 = _2420 + 1;
        _2418 = _2422;
    }
    int _2424 = _2418;
    bool _2426 = !_2406;
    int _2428 = _2426 ? 0 : (-1);
    bool _2430 = _1242 <= 8000.0;
    bool _2432 = isnan(_1242);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan(8000.0);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = fma(_2356, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    bool _2446 = !_1697;
    int _2448 = _2446 ? _2404 : (-1);
    float _2450 = _1687 * _2408;
    int _2452 = abs(_2424);
    int _2454 = _2414 * as_type<int>(_2302);
    int _2456 = ~_2390;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    float _2462 = fma(_2416, _2202, _2380);
    bool _2464 = !_1914;
    int _2466 = _2464 ? 0 : 1;
    float _2468 = fma(_1725, _2202, _2384);
    int _2470 = abs(_2428);
    int _2472 = _2460 * as_type<int>(_2294);
    int _2474 = _2472 + _2454;
    float _2476 = _1634 + _1584;
    float _2478 = fma(_1677, _2450, _1675);
    int _2480 = abs(_2466);
    float _2482 = _2476 * 0.5;
    out.m_85.x = _2388;
    out.m_85.y = _2462;
    out.m_85.z = _2468;
    int _2484 = ~_2452;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2444, -2.0, 3.0);
    float _2492 = _2444 * _2444;
    int _2494 = ~_2470;
    int _2496 = _2494 + 1;
    int _2498 = _2496 + 1;
    int _2500 = _2488 * as_type<int>(_2332);
    int _2502 = _2500 + _2474;
    float _2504 = _2492 * _2490;
    float _2506 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2508 = _2498 * as_type<int>(_2340);
    int _2510 = _2508 + _2502;
    float _2512 = -_2504;
    float _2514 = _2512 + 1.0;
    int _2516 = ~_2480;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    float _2522 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2506);
    float _2524 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2504);
    float _2526 = in.m_87.x;
    float _2528 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2522);
    float _2530 = _2440 * _2524;
    int _2532 = _2510 * _2520;
    float _2534 = _1584 * 0.5;
    float _2536 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2528);
    float _2538 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2540 = _2448 * _2480;
    int _2542 = _2540 + _2532;
    float _2544 = fma(_1636, -0.5, _2534);
    float _2546 = _2536 + _1584;
    float _2548 = _2394 * _2538;
    float _2550 = precise::clamp(_2548, 0.0, 1.0);
    out.gl_Position.x = _1634;
    out.gl_Position.y = _1636;
    out.gl_Position.z = _2536;
    out.gl_Position.w = _1584;
    float _2552 = _1677 * _2408;
    float _2554 = float(_2542);
    float _2556 = -_2550;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2560 = _2546 * 0.5;
    float _2562 = fma(_1683, _2552, _1671);
    float _2564 = fma(_1685, _2552, _1673);
    out.m_89.x = _2554;
    bool _2566 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2568 = isnan(_1390);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2574 = _2570 || _2572;
    out.m_91.x = _2482;
    out.m_91.y = _2544;
    out.m_91.z = _2560;
    out.m_91.w = _1584;
    float _2576 = _2558 * _2526;
    float _2578 = -_1748;
    float _2580 = _2578 + 1.0;
    float _2582 = _2576 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2584 = _1677 * _2580;
    float _2586 = _1294 * _1350;
    float _2588 = _2526;
    float _2590 = _2552;
    float _2592 = _2536;
    float _2594 = _2586;
    if (!_2574)
    {
        _2588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2596 = _2588;
    out.m_93.x = _2582;
    float _2598 = _2586 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2600 = _2596;
    float _2602 = _2596;
    if (!_2574)
    {
        _2590 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2604 = _2590;
    out.m_95.x = _2562;
    out.m_95.y = _2564;
    out.m_95.z = _2478;
    out.m_95.w = _2584;
    float _2606 = _2604;
    float _2608 = _2604;
    if (!_2574)
    {
        _1886 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2610 = _1886;
    float _2612 = _2610;
    float _2614 = _2610;
    if (!_2574)
    {
        _2592 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2616 = _2592;
    float _2618 = _2616;
    float _2620 = _2616;
    if (!_2574)
    {
        _1888 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2622 = _1888;
    float _2624 = _2622;
    float _2626 = _2622;
    if (!_2574)
    {
        _2594 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2628 = _2594;
    bool _2630 = !_2574;
    float _2632 = _2628;
    float _2634 = _2628;
    if (!_2630)
    {
        bool _2636 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2638 = isnan(_1390);
        bool _2640 = _2636 || _2638;
        bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2644 = _2640 || _2642;
        if (!_2644)
        {
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2648 = _1390 + _2646;
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2652 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2650;
            float _2654 = 1.0 / _2652;
            float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2676 = _2648 * _2654;
            float _2678 = precise::clamp(_2676, 0.0, 1.0);
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2684 = fma(_2678, _2658, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2686 = fma(_2678, _2682, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2688 = fma(_2678, _2662, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2690 = fma(_2678, _2666, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2692 = fma(_2678, _2670, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2694 = fma(_2678, _2674, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2608 = _2686;
            _2626 = _2692;
            _2602 = _2684;
            _2620 = _2690;
            _2614 = _2688;
            _2634 = _2694;
            _2696 = true;
        }
        else
        {
            bool _2698 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2700 = isnan(_1390);
            bool _2702 = _2698 || _2700;
            bool _2704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2706 = _2702 || _2704;
            if (!_2706)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2708 = _2600;
            _2602 = _2708;
            if (!_2706)
            {
                _2606 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2710 = _2606;
            _2608 = _2710;
            if (!_2706)
            {
                _2612 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2712 = _2612;
            _2614 = _2712;
            if (!_2706)
            {
                _2618 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2714 = _2618;
            _2620 = _2714;
            if (!_2706)
            {
                _2624 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2716 = _2624;
            _2626 = _2716;
            if (!_2706)
            {
                _2632 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2718 = _2632;
            bool _2720 = !_2706;
            _2634 = _2718;
            if (!_2720)
            {
                bool _2722 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2724 = isnan(_1390);
                bool _2726 = _2722 || _2724;
                bool _2728 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2730 = _2726 || _2728;
                if (!_2730)
                {
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2734 = _1390 + _2732;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2738 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2736;
                    float _2740 = 1.0 / _2738;
                    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2762 = _2734 * _2740;
                    float _2764 = precise::clamp(_2762, 0.0, 1.0);
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2770 = fma(_2764, _2744, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2772 = fma(_2764, _2768, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2774 = fma(_2764, _2748, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2776 = fma(_2764, _2752, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2778 = fma(_2764, _2756, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2780 = fma(_2764, _2760, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2608 = _2772;
                    _2626 = _2778;
                    _2602 = _2770;
                    _2620 = _2776;
                    _2614 = _2774;
                    _2634 = _2780;
                    _2696 = true;
                }
                else
                {
                    _2608 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2626 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2620 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2614 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2634 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2696 = false;
    float _2782 = _2608;
    float _2784 = _2626;
    float _2786 = _2602;
    float _2788 = _2620;
    float _2790 = _2614;
    float _2792 = _2634;
    float _2794 = _2598 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2796 = fma(_2462, -0.5, 0.5);
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = -_2782;
    float _2802 = _2800 + _2784;
    float _2804 = -_2786;
    float _2806 = _2804 + _2788;
    out.m_53.x = _2794;
    float _2808 = fma(_2798, _2802, _2782);
    float _2810 = -_2790;
    float _2812 = _2810 + _2792;
    float _2814 = fma(_2798, _2806, _2786);
    float _2816 = _2808 * 0.586610972881317138671875;
    bool _2818 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2820 = fma(_2798, _2812, _2790);
    out.m_97.x = 0.0;
    float _2822 = fma(_2814, 0.298911988735198974609375, _2816);
    bool _2824 = _1294 > 0.0;
    bool _2826 = isnan(_1294);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan(0.0);
    bool _2832 = _2828 || _2830;
    float _2834 = fma(_2820, 0.114477999508380889892578125, _2822);
    bool _2836 = _1350 <= 0.0;
    bool _2838 = !_2832;
    bool _2840 = _2836 || _2838;
    float _2842 = -_2834;
    float _2844 = _2814 + _2842;
    float _2846 = -_2834;
    float _2848 = _2808 + _2846;
    float _2850 = -_2834;
    float _2852 = _2820 + _2850;
    float _2854 = fma(_2844, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2834);
    float _2856 = fma(_2848, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2834);
    float _2858 = fma(_2852, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2834);
    bool _2860 = !_2818;
    if (!_2860)
    {
        float _2862 = -_1232;
        float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2866 = -_1234;
        float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2870 = -_1236;
        float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2874 = _2864 * _2864;
        float _2876 = fma(_2868, _2868, _2874);
        float _2878 = fma(_2872, _2872, _2876);
        float _2880 = sqrt(_2878);
        float _2882 = rsqrt(_2878);
        float _2884 = -_2880;
        float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2888 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2890 = precise::clamp(_2888, 0.0, 1.0);
        float _2892 = _2868 * _2882;
        float _2894 = _2864 * _2882;
        float _2896 = abs(_2890);
        float _2898 = log2(_2896);
        float _2900 = _2872 * _2882;
        float _2902 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2904 = _2462 * _2894;
        float _2906 = -_2894;
        float _2908 = -_2902;
        float _2910 = fma(_2906, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2908);
        float _2912 = fma(_2388, _2892, _2904);
        float _2914 = -_2900;
        float _2916 = fma(_2914, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2910);
        float _2918 = fma(_2468, _2900, _2912);
        float _2920 = precise::clamp(_2918, 0.0, 1.0);
        float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2924 = _2916 + _2922;
        float _2926 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2928 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2930 = precise::clamp(_2928, 0.0, 1.0);
        float _2932 = exp2(_2926);
        float _2934 = _2932 * _2930;
        float _2936 = _2920 * _2934;
        float _2938 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2940 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2942 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2938;
        out.m_97.y = _2940;
        out.m_97.z = _2942;
    }
    out.m_67.x = _2854;
    out.m_67.y = _2856;
    out.m_67.z = _2858;
    if (!_2840)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2944 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2944;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2696 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_118);
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3013 = as_type<float>(_140);
        out.gl_Position.z = _3013;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3068 = as_type<float>(_166);
        out.gl_Position.z = _3068;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _122 * _174;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_176;
    float _200 = _178;
    float _218;
    if (!_198)
    {
        float _202 = in.m_57.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        _218 = _178;
    }
    _220 = false;
    float _222 = _218;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _222 + _224;
    bool _228 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_222);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -_238;
    float _246 = _244 + 1.0;
    bool _248 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _250 = isnan(_222);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = 1.0 / _242;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = _226 * _260;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = in.m_59.x;
    float _280 = in.m_59.y;
    float _282 = in.m_59.z;
    float _284 = _258 * _246;
    float _286 = fma(_264, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_276, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_268, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = -_258;
    float _294 = _292 + 1.0;
    float _296 = _286 * _284;
    float _298 = _288 * _284;
    float _300 = _290 * _284;
    float _302 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _302);
    float _310 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _304);
    float _312 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _306);
    float _314 = _308 * _278;
    float _316 = _310 * _280;
    float _318 = _312 * _282;
    bool _320 = !_270;
    if (!_320)
    {
        float _322 = in.m_57.x;
        float _324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _330 = _328 * _324;
        float _332 = floor(_330);
        float _334 = -_332;
        float _336 = _330 + _334;
        _200 = _336;
    }
    float _338 = _200;
    float _340 = in.m_57.x;
    float _342 = in.m_57.y;
    float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _346 = log2(_344);
    float _348 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = in.m_46.x;
    float _352 = in.m_46.y;
    float _354 = in.m_46.z;
    float _356 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _360 = in.m_57.z;
    float _362 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _364 = int(_362);
    float _366 = _348 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _368 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = _346 * _122;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _382 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _384 = int(_382);
    float _386 = _342 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _388 = _340 * 2.0;
    float _390 = _340 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _392 = _342 * 2.0;
    float _394 = fma(_386, -2.0, _358);
    float _396 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = floor(_388);
    float _400 = -_380;
    float _402 = fma(_390, 2.0, _400);
    float _404 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _406 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _408 = _342 + _340;
    float _410 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _412 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _404);
    float _414 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _406);
    float _416 = exp2(_378);
    float _418 = _342 + _360;
    float _420 = _360 * 2.0;
    float _422 = float(_364);
    float _424 = _408 + (-1.0);
    float _426 = _418 + (-1.0);
    float _428 = float(_384);
    float _430 = floor(_392);
    float _432 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _434 = _398 > 0.0;
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _438 = _398 >= 0.0;
    bool _440 = isnan(_398);
    bool _442 = _438 || _440;
    bool _444 = isnan(0.0);
    bool _446 = _442 || _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _450 = 1.0 + _448;
    float _452 = floor(_420);
    float _454 = -_416;
    float _456 = _454 + 1.0;
    bool _458 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _460 = isnan(1.0);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _466 = _462 || _464;
    float _468 = _428 * _122;
    float _470 = -_122;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[76].x, _402);
    float _474 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _410);
    float _476 = _376 ? _456 : 0.0;
    float _478 = 1.0 / _422;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _484 = _430 > 0.0;
    float _486 = _474 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _488 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[78].z, _480);
    float _490 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    int _492 = _446 ? 0 : 1;
    float _494 = 1.0 / _450;
    bool _496 = _430 >= 0.0;
    bool _498 = isnan(_430);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    float _506 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _488);
    bool _508 = _452 > 0.0;
    float _510 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _490);
    bool _512 = _452 >= 0.0;
    bool _514 = isnan(_452);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    float _522 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    int _524 = ~_492;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = _478 * _122;
    int _532 = _528;
    if (!_434)
    {
        int _534 = ~_492;
        int _536 = _534 + 1;
        _532 = _536;
    }
    int _538 = _532;
    float _540 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    int _542 = _504 ? 0 : 1;
    float _544 = float(_538);
    float _546 = _540 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _548 = ~_542;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    int _554 = _552;
    if (_466)
    {
        float _556 = _476 * _494;
        _132 = _556;
    }
    float _558 = _132;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _570 = _568 != 0;
    float _572 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    if (!_484)
    {
        int _574 = ~_542;
        int _576 = _574 + 1;
        _554 = _576;
    }
    int _578 = _554;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _582 = _546 + _580;
    float _584 = in.m_61.x;
    float _586 = in.m_61.y;
    float _588 = in.m_61.z;
    bool _590 = !_566;
    int _592 = _590 ? 0 : 1;
    float _594 = _572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _596 = !_562;
    int _598 = _596 ? 0 : 1;
    bool _600 = !_570;
    int _602 = _600 ? 0 : 1;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    int _616 = _520 ? 0 : 1;
    bool _618 = !_610;
    int _620 = _618 ? 0 : 1;
    bool _622 = !_606;
    int _624 = _622 ? 0 : 1;
    int _626 = abs(_620);
    int _628 = abs(_624);
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _632 = _486 + _630;
    float _634 = float(_626);
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _638 = _594 + _636;
    int _640 = ~_616;
    int _642 = _640 + 1;
    int _644 = _642 + 1;
    float _646 = _632 * _632;
    int _648 = _644;
    if (!_508)
    {
        int _650 = ~_616;
        int _652 = _650 + 1;
        _648 = _652;
    }
    int _654 = _648;
    float _656 = _634 * _544;
    float _658 = float(_628);
    float _660 = fma(_582, _582, _646);
    float _662 = float(_654);
    float _664 = _656 * (-2.0);
    bool _666 = !_614;
    int _668 = _666 ? 0 : 1;
    float _670 = fma(_638, _638, _660);
    float _672 = _342 + (-0.5);
    float _674 = fma(_664, _586, _586);
    int _676 = abs(_668);
    float _678 = sqrt(_670);
    float _680 = _658 * _662;
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[196].y, _674);
    float _684 = _360 + _340;
    float _686 = float(_578);
    float _688 = fma(_436, _664, _436);
    float _690 = float(_676);
    float _692 = _684 + (-1.0);
    float _694 = rsqrt(_670);
    float _696 = _680 * (-2.0);
    float _698 = _690 * _686;
    float _700 = _360 + (-0.5);
    float _702 = fma(_688, _558, _682);
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _706 = _678 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _708 = _340 + (-0.5);
    float _710 = fma(_696, _584, _584);
    float _712 = fma(_432, _696, _432);
    float _714 = _698 * (-2.0);
    float _716 = precise::min(_366, _706);
    float _718 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _710);
    float _720 = _702 * 0.15915493667125701904296875;
    float _722 = fma(_704, _714, _704);
    float _724 = fma(_714, _588, _588);
    float _726 = _694 * _716;
    float _728 = fma(_712, _558, _718);
    float _730 = _720 * 6.283185482025146484375;
    float _732 = sin(_730);
    float _734 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].z, _724);
    float _736 = _632 * _726;
    float _738 = _582 * _726;
    float _740 = _638 * _726;
    float _742 = _728 * 0.15915493667125701904296875;
    float _744 = -_736;
    float _746 = _632 + _744;
    float _748 = -_738;
    float _750 = _582 + _748;
    float _752 = -_740;
    float _754 = _638 + _752;
    float _756 = fma(_722, _558, _734);
    float _758 = _746 * _746;
    float _760 = _720 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _766 = fma(_750, _750, _758);
    float _768 = _756 * 0.15915493667125701904296875;
    float _770 = fma(_754, _754, _766);
    float _772 = _742 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = in.m_63.x;
    float _778 = in.m_63.y;
    float _780 = in.m_63.z;
    float _782 = sqrt(_770);
    float _784 = _742 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _774 * _732;
    float _790 = _774 * _762;
    float _792 = _768 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = _694 * _782;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _778);
    float _800 = _764 * _796;
    float _802 = _348 * _796;
    float _804 = _356 * _796;
    float _806 = _768 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _786 * _762;
    float _812 = _786 * _732;
    float _814 = _800 * _798;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _818 = _774 * _794;
    float _820 = _762 * _794;
    float _822 = _786 * _794;
    float _824 = _732 * _794;
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _828 = _804 * _816;
    float _830 = _818 * _814;
    float _832 = _802 * _826;
    float _834 = fma(_808, _810, _788);
    float _836 = _822 * _814;
    float _838 = -_790;
    float _840 = fma(_808, _812, _838);
    float _842 = -_814;
    float _844 = _808 * _842;
    float _846 = -_812;
    float _848 = fma(_808, _790, _846);
    float _850 = fma(_834, _832, _836);
    float _852 = fma(_808, _788, _810);
    float _854 = fma(_820, _832, _844);
    float _856 = fma(_848, _832, _830);
    float _858 = fma(_840, _828, _850);
    float _860 = fma(_824, _828, _854);
    float _862 = fma(_852, _828, _856);
    float _864 = _858 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _866 = _858 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _868 = _858 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _870 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _864);
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _866);
    float _874 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _868);
    float _876 = -_736;
    float _878 = _486 + _876;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _870);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _872);
    float _884 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _886 = -_738;
    float _888 = _546 + _886;
    float _890 = _880 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _894 = _884 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _896 = -_740;
    float _898 = _594 + _896;
    float _900 = _594 + _890;
    float _902 = _546 + _892;
    float _904 = _486 + _894;
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _908 = _900 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _912 = _902 + _910;
    float _914 = _908 * _908;
    float _916 = fma(_912, _912, _914);
    float _918 = _878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _920 = sqrt(_916);
    float _922 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].x, _918);
    float _924 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _922);
    bool _926 = _920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _894;
    float _930 = _902;
    float _932 = _884;
    float _934 = _736;
    float _936 = _738;
    if (!_926)
    {
        _928 = _902;
    }
    float _938 = _928;
    float _940 = _938;
    if (!_926)
    {
        _930 = _900;
    }
    float _942 = _930;
    float _944 = _942;
    if (!_926)
    {
        _932 = _904;
    }
    float _946 = _932;
    bool _948 = !_926;
    float _950 = _946;
    if (!_948)
    {
        float _952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _956 = _920 + _954;
        float _958 = _904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = rsqrt(_916);
        float _962 = _956 * _952;
        float _964 = _962 * 0.15915493667125701904296875;
        float _966 = _964 * 6.283185482025146484375;
        float _968 = cos(_966);
        float _970 = _964 * 6.283185482025146484375;
        float _972 = sin(_970);
        float _974 = _968 + (-1.0);
        float _976 = _974 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = fma(_972, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _980 = fma(_904, _968, _976);
        float _982 = _960 * _978;
        float _984 = fma(_912, _982, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _986 = fma(_908, _982, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _950 = _980;
        _940 = _984;
        _944 = _986;
    }
    float _988 = _950;
    float _990 = _940;
    float _992 = _944;
    float _994 = -_486;
    float _996 = _994 + _988;
    float _998 = -_546;
    float _1000 = _998 + _990;
    float _1002 = _924 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1004 = _878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1006 = _996 * _996;
    float _1008 = -_594;
    float _1010 = _1008 + _992;
    float _1012 = 1.0 / _1002;
    float _1014 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1004);
    float _1016 = fma(_1000, _1000, _1006);
    float _1018 = -_738;
    float _1020 = _1018 + _990;
    float _1022 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1014);
    float _1024 = fma(_1010, _1010, _1016);
    float _1026 = -_736;
    float _1028 = _1026 + _988;
    float _1030 = -_740;
    float _1032 = _1030 + _992;
    float _1034 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1036 = sqrt(_1024);
    bool _1038 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1040 = isnan(0.5);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1046 = _1042 || _1044;
    float _1048 = _1034 + _1002;
    bool _1050 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1052 = isnan(0.5);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1058 = _1054 || _1056;
    float _1060 = _1048 * _1012;
    float _1062 = _1060 * 0.5;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1066 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1064);
    float _1068 = 1.0 / _1066;
    bool _1070 = _1036 > 0.0;
    float _1072 = _1036;
    float _1074 = _992;
    float _1076 = _1000;
    float _1078 = _1002;
    float _1080 = _1032;
    float _1082 = _1066;
    float _1084 = _988;
    if (!_1070)
    {
        _934 = _1020;
    }
    float _1086 = _934;
    float _1088 = _1086;
    if (!_1070)
    {
        _936 = _1028;
    }
    float _1090 = _936;
    float _1092 = _1090;
    if (!_1070)
    {
        _1072 = _1032;
    }
    float _1094 = _1072;
    bool _1096 = !_1070;
    float _1098 = _1094;
    float _1100 = _1094;
    if (!_1096)
    {
        float _1102 = _194 * _194;
        float _1104 = rsqrt(_1024);
        float _1106 = fma(_192, _192, _1102);
        float _1108 = fma(_196, _196, _1106);
        float _1110 = sqrt(_1108);
        float _1112 = _996 * _1104;
        float _1114 = _1000 * _1104;
        float _1116 = _1010 * _1104;
        bool _1118 = _1110 > 0.0;
        float _1120 = _1104;
        float _1122 = _1110;
        _1074 = _1114;
        if (!_1118)
        {
            _1120 = _1020;
        }
        float _1124 = _1120;
        _1088 = _1124;
        if (!_1118)
        {
            _1122 = _1028;
        }
        float _1126 = _1122;
        _1092 = _1126;
        if (!_1118)
        {
            _1098 = _1032;
        }
        float _1128 = _1098;
        bool _1130 = !_1118;
        _1100 = _1128;
        if (!_1130)
        {
            float _1132 = rsqrt(_1108);
            float _1134 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1136 = _194 * _1132;
            float _1138 = _192 * _1132;
            float _1140 = _1112 * _1136;
            float _1142 = _196 * _1132;
            float _1144 = fma(_1114, _1138, _1140);
            float _1146 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1148 = fma(_1116, _1142, _1144);
            float _1150 = _1148 * _1146;
            float _1152 = fma(_192, _1150, _1020);
            float _1154 = fma(_194, _1150, _1028);
            float _1156 = fma(_196, _1150, _1032);
            _1088 = _1152;
            _1092 = _1154;
            _1100 = _1156;
            _1076 = _1150;
        }
    }
    float _1158 = _1088;
    float _1160 = _1092;
    float _1162 = _1100;
    float _1164 = _1074;
    float _1166 = _1076;
    float _1168 = _1166;
    float _1170 = _1160;
    float _1172 = _1158;
    float _1174 = _1162;
    float _1176 = _1164;
    if (_1058)
    {
        _1168 = 1.0;
    }
    float _1178 = _1168;
    float _1180 = _1178;
    if (!_1046)
    {
        float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1184 = _878 + _1182;
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1188 = _888 + _1186;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1192 = _1184 * _1184;
        float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1196 = _898 + _1194;
        float _1198 = fma(_1188, _1188, _1192);
        float _1200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1202 = fma(_1196, _1196, _1198);
        float _1204 = sqrt(_1202);
        float _1206 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1208 = precise::min(_1204, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1210 = _1208 * _1200;
        float _1212 = -_888;
        float _1214 = _1212 + _1158;
        float _1216 = _1206 * _1210;
        float _1218 = -_878;
        float _1220 = _1218 + _1160;
        float _1222 = -_898;
        float _1224 = _1222 + _1162;
        float _1226 = fma(_1214, _1216, _888);
        float _1228 = fma(_1220, _1216, _878);
        float _1230 = fma(_1224, _1216, _898);
        _1170 = _1228;
        _1172 = _1226;
        _1174 = _1230;
    }
    float _1232 = _1170;
    float _1234 = _1172;
    float _1236 = _1174;
    if (_1058)
    {
        _1078 = 1.0;
    }
    float _1238 = _1078;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1242 = _1068 * _1240;
    float _1244 = _1238;
    if (!_1058)
    {
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1248 = _1246 * 0.15915493667125701904296875;
        float _1250 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1252 = _1248 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = _1250 * 0.15915493667125701904296875;
        float _1258 = _1248 * 6.283185482025146484375;
        float _1260 = sin(_1258);
        float _1262 = 1.0 / _1254;
        float _1264 = _1256 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        float _1268 = _1260 * _1262;
        float _1270 = _1256 * 6.283185482025146484375;
        float _1272 = sin(_1270);
        float _1274 = _1266 * _1268;
        float _1276 = 1.0 / _1274;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1280 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1278;
        float _1282 = 1.0 / _1280;
        float _1284 = _1272 * _1276;
        float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1288 = fma(_1242, _1284, _1286);
        float _1290 = _1288 * _1282;
        float _1292 = precise::clamp(_1290, 0.0, 1.0);
        _1180 = _1292;
    }
    float _1294 = _1180;
    if (!_1058)
    {
        float _1296 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1298 = _1296 * 0.15915493667125701904296875;
        float _1300 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1302 = _1298 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        float _1306 = _1300 * 0.15915493667125701904296875;
        float _1308 = _1298 * 6.283185482025146484375;
        float _1310 = sin(_1308);
        float _1312 = 1.0 / _1304;
        float _1314 = _1306 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = _1310 * _1312;
        float _1320 = _1306 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = _1316 * _1318;
        float _1326 = 1.0 / _1324;
        float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1330 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1328;
        float _1332 = 1.0 / _1330;
        float _1334 = _1322 * _1326;
        float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1338 = fma(_1242, _1334, _1336);
        float _1340 = _1338 * _1332;
        float _1342 = precise::clamp(_1340, 0.0, 1.0);
        float _1344 = -_1342;
        float _1346 = _1344 + 1.0;
        _1080 = _1326;
        _1244 = _1346;
    }
    float _1348 = _1080;
    float _1350 = _1244;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1354 = _1232 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1358 = _1234 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1362 = _1236 + _1360;
    float _1364 = _1354 * _1354;
    float _1366 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1368 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1370 = fma(_1358, _1358, _1364);
    float _1372 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1366);
    float _1374 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1368);
    float _1376 = fma(_1362, _1362, _1370);
    float _1378 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1372);
    float _1380 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1374);
    float _1382 = rsqrt(_1376);
    float _1384 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1386 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1388 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1390 = sqrt(_1376);
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1394 = _1358 * _1392;
    float _1396 = _1362 * _1392;
    float _1398 = _1394 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 + _1400;
    float _1404 = sqrt(_1402);
    bool _1406 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = _1404 + _1408;
    float _1412 = _1028;
    float _1414 = _1402;
    float _1416 = _1410;
    float _1418 = _1394;
    float _1420 = _1396;
    float _1422 = _1398;
    float _1424 = _1400;
    if (_1406)
    {
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1426;
    }
    float _1428 = _1412;
    if (_1406)
    {
        float _1430 = rsqrt(_1402);
        _1414 = _1430;
    }
    float _1432 = _1414;
    if (_1406)
    {
        float _1434 = _1410 * _1428;
        _1416 = _1434;
    }
    float _1436 = _1416;
    if (_1406)
    {
        float _1438 = _1436 * 0.15915493667125701904296875;
        _1082 = _1438;
    }
    float _1440 = _1082;
    float _1442 = _1428;
    if (_1406)
    {
        float _1444 = _1440 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        _1442 = _1446;
    }
    float _1448 = _1442;
    float _1450 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1452 = precise::max(0.0, _1450);
    float _1454 = _1348;
    if (_1406)
    {
        float _1456 = _1440 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        _1454 = _1458;
    }
    float _1460 = _1454;
    float _1462 = -_1392;
    float _1464 = -_1452;
    float _1466 = fma(_1354, _1462, _1464);
    if (_1406)
    {
        float _1468 = _1466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1084 = _1468;
    }
    float _1470 = _1084;
    float _1472 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1474 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1476 = _1470;
    float _1478 = _1448;
    if (_1406)
    {
        float _1480 = fma(_1448, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1476 = _1480;
    }
    float _1482 = _1476;
    float _1484 = _1482;
    if (!_1406)
    {
        _1478 = _1466;
    }
    float _1486 = _1478;
    float _1488 = floor(_1474);
    float _1490 = _1486;
    if (_1406)
    {
        float _1492 = _1460 + (-1.0);
        _1176 = _1492;
    }
    float _1494 = _1176;
    float _1496 = _1494;
    if (_1406)
    {
        float _1498 = _1432 * _1482;
        _1484 = _1498;
    }
    float _1500 = _1484;
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1504 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1502);
    float _1506 = precise::clamp(_1504, 0.0, 1.0);
    if (_1406)
    {
        float _1508 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1508;
    }
    float _1510 = _1496;
    if (_1406)
    {
        float _1512 = _1394 * _1500;
        _1418 = _1512;
    }
    float _1514 = _1418;
    if (_1406)
    {
        float _1516 = _1396 * _1500;
        _1420 = _1516;
    }
    float _1518 = _1420;
    if (_1406)
    {
        float _1520 = fma(_1466, _1460, _1510);
        _1490 = _1520;
    }
    float _1522 = _1490;
    if (_1406)
    {
        float _1524 = _1514 * _1514;
        _1422 = _1524;
    }
    float _1526 = _1422;
    if (_1406)
    {
        float _1528 = _1518 * _1518;
        _1424 = _1528;
    }
    float _1530 = _1424;
    float _1532 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1472);
    float _1534 = -_1506;
    float _1536 = _1534 + 1.0;
    float _1538 = fma(_1522, _1522, _1526);
    float _1540 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1542 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1544 = _1538 + _1530;
    float _1546 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1532);
    float _1548 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1542);
    float _1550 = abs(_1536);
    float _1552 = log2(_1550);
    float _1554 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1556 = _1546 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1558 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1548);
    float _1560 = -_1388;
    float _1562 = fma(_1560, _1554, 1.0);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1566 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1568 = rsqrt(_1544);
    float _1570 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1572 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1570);
    float _1574 = floor(_1540);
    float _1576 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1572);
    float _1578 = _1568 * _1514;
    float _1580 = _1568 * _1522;
    float _1582 = _1568 * _1518;
    float _1584 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1576);
    float _1586 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1588 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1590 = log2(_1562);
    float _1592 = _1580 + 1.0;
    float _1594 = -_1586;
    float _1596 = fma(_1580, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1594);
    float _1598 = -_1574;
    float _1600 = _1540 + _1598;
    float _1602 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1564);
    float _1604 = -_1582;
    float _1606 = fma(_1604, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1596);
    float _1608 = -_1488;
    float _1610 = _1474 + _1608;
    float _1612 = 1.0 / _1584;
    float _1614 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1616 = fma(_1606, -0.5, 0.5);
    float _1618 = fma(_1606, 0.5, 0.5);
    float _1620 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1602);
    float _1622 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1614);
    float _1624 = fma(_1618, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1626 = exp2(_1588);
    float _1628 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1622);
    float _1630 = _1590 * 0.693147182464599609375;
    float _1632 = fma(_1618, _1624, -0.212114393711090087890625);
    float _1634 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1628);
    float _1636 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1638 = fma(_1618, _1632, 1.570728778839111328125);
    float _1640 = sqrt(_1616);
    float _1642 = _1634 * _1612;
    float _1644 = _1636 * _1612;
    float _1646 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1648 = fma(_1644, -0.5, 0.5);
    float _1650 = -_1580;
    float _1652 = fma(_1626, _1592, _1650);
    float2 _5375 = float2(_1610, _1600);
    float _1654 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5375, float2(0.0), isnan(_5375)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5375, float2(0.0), isnan(_5375)), level(0.0)).x;
    float _1656 = fma(_1652, 0.5, 0.5);
    float _1658 = _1640 * 0.636619746685028076171875;
    float _1660 = fma(_1642, 0.5, 0.5);
    float _1662 = -_1638;
    float _1664 = fma(_1658, _1662, 1.0);
    float3 _5398 = float3(_1660, _1648, _1646);
    float _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float3 _5409 = float3(_1660, _1648, _1646);
    float4 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5409, float3(0.0), isnan(_5409)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5409, float3(0.0), isnan(_5409)), level(0.0)).xyzw;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = _1669.w;
    float2 _5425 = float2(_1664, _1656);
    float3 _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5425, float2(0.0), isnan(_5425)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5425, float2(0.0), isnan(_5425)), level(0.0)).xyz;
    float _1683 = _1681.x;
    float _1685 = _1681.y;
    float _1687 = _1681.z;
    float _1689 = float(uint(_384));
    float _1691 = trunc(_530);
    int _1693 = int(_1691);
    float _1695 = _468 * _174;
    bool _1697 = _384 == 0;
    out.m_65.x = _888;
    out.m_65.y = _878;
    out.m_65.z = _898;
    int _1699 = abs(_598);
    float _1701 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1703 = abs(_602);
    out.m_67.w = _716;
    float _1705 = 1.0 / _1689;
    int _1707 = ~_384;
    int _1709 = _1707 + 1;
    int _1711 = ~_384;
    int _1713 = _1711 + 1;
    out.m_69.x = _802;
    float _1715 = _840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1717 = float(uint(_1693));
    float _1719 = trunc(_1695);
    int _1721 = int(_1719);
    out.m_71.x = _1234;
    out.m_71.y = _1232;
    out.m_71.z = _1236;
    float _1723 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1715);
    float _1725 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1723);
    int _1727 = as_type<int>(_1705) + (-2);
    float _1729 = exp2(_1701);
    float _1731 = as_type<float>(_1727) * _1717;
    int _1733 = ~_384;
    int _1735 = _1733 + 1;
    float _1737 = trunc(_1731);
    float _1739 = precise::max(_1737, 0.0);
    uint _1742 = uint(_1739);
    float _1744 = -_1729;
    float _1746 = _1744 + 1.0;
    float _1748 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1750 = _1709 * int(_1742);
    int _1752 = _1750 + _1693;
    float _1754 = float(uint(_1752));
    float _1756 = as_type<float>(_1727) * _1754;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1760 = _1758 != 0;
    float _1762 = trunc(_1756);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    bool _1768 = !_1760;
    float _1770 = _1768 ? 7.345489978790283203125 : 1.0;
    float _1772 = _1770 * _340;
    float _1774 = float(_1693);
    float _1776 = floor(_1772);
    bool _1778 = _1774 >= _428;
    bool _1780 = isnan(_1774);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(_428);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    int _1790 = int(_1742) + int(_1766);
    float _1792 = trunc(_1788);
    int _1794 = int(_1792);
    int _1796 = _1735 * _1790;
    int _1798 = _1796 + _1693;
    bool _1800 = uint(_1798) >= uint(_384);
    float _1802 = -_1776;
    float _1804 = _1772 + _1802;
    bool _1806 = !_1800;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = _1804 * _428;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1814 = _1812 != 0;
    int _1816 = ~_1790;
    int _1818 = _1816 + _1808;
    int _1820 = _1818 + 1;
    bool _1822 = !_1814;
    int _1824 = _1822 ? 0 : 1;
    float _1826 = trunc(_1810);
    int _1828 = int(_1826);
    int _1830 = _384 + (-1);
    int _1832 = _384 * _1820;
    int _1834 = _1832 + _1693;
    int _1836 = ~_1794;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1844 = _1842 != 0;
    bool _1846 = !_1697;
    int _1848 = _1846 ? _1834 : (-1);
    int _1850 = abs(_1824);
    int _1852 = abs(_592);
    int _1854 = _1848 * _1840;
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1858 = _1856 != 0;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1862 = _1860 != 0;
    int _1864 = _1794 * _1830;
    int _1866 = _1864 + _1854;
    bool _1868 = !_1844;
    int _1870 = _1868 ? 0 : 1;
    int _1872 = _1866 * _1852;
    int _1874 = _1828 * _1850;
    int _1876 = _1874 + _1693;
    int _1878 = abs(_1870);
    int _1880 = _1721 * _1699;
    int _1882 = _1880 + _1872;
    float _1884 = as_type<float>(_1699);
    float _1886 = _1584;
    float _1888 = _1636;
    if (_1858)
    {
        float _1890 = in.m_57.x;
        _1884 = _1890;
    }
    float _1892 = _1884;
    bool _1894 = _342 > 0.5;
    int _1896 = _1876 * _1703;
    int _1898 = _1896 + _1882;
    float _1900 = in.m_73.y;
    int _1902 = _1828 * _1878;
    int _1904 = _1902 + _1898;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1910 = float(uint(_1904));
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1914 = _1912 != 0;
    float _1916 = 1.0 / _1908;
    float _1918 = as_type<float>(_1727) * _1910;
    float _1920 = trunc(_1918);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    bool _1926 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1928 = isnan(_338);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1934 = _1930 || _1932;
    float _1936 = float(_1934);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1940 = in.m_73.x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1946 = _1944 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1948 = -_1900;
    float _1950 = _1948 + 1.0;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1956;
    float _1960 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1962 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1966 = _1958 * _1916;
    float _1968 = _1900;
    float _1970 = _1964;
    if (_1862)
    {
        float _1972 = _1894 ? _1950 : _1900;
        _1968 = _1972;
    }
    float _1974 = _1968;
    int _1976 = _1713 * int(_1924);
    int _1978 = _1976 + _1904;
    float _1980 = 1.0 / _1946;
    out.m_77.x = _1960;
    out.m_77.y = _1962;
    out.m_77.z = _1964;
    out.m_77.w = _1954;
    bool _1982 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1984 = isnan(_338);
    bool _1986 = _1982 || _1984;
    bool _1988 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1990 = _1986 || _1988;
    float _1992 = float(_1990);
    float _1994 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1996 = float(uint(_1978));
    bool _1998 = _1892 > 0.5;
    bool _2000 = _1998 && _1858;
    float _2002 = -_1992;
    float _2004 = _2002 + 1.0;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2010 = as_type<float>(_1727) * _1996;
    float _2012 = float(uint(_1876));
    float _2014 = -_522;
    float _2016 = fma(_510, _1994, _2014);
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2020 = _338 + _2018;
    float _2022 = _2008;
    if (_1858)
    {
        _1970 = _1940;
    }
    float _2024 = _1970;
    float _2026 = _1936 * _2004;
    bool _2028 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2030 = isnan(_338);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2036 = _2032 || _2034;
    float _2038 = float(_2036);
    float _2040 = fma(_1966, _2020, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2042 = -_1936;
    float _2044 = _2042 + 1.0;
    float _2046 = trunc(_2010);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    float _2052 = as_type<float>(_1727) * _2012;
    float _2054 = _2008 * _1980;
    float _2056 = _2024;
    if (_2000)
    {
        float _2058 = -_2024;
        float _2060 = _2058 + 1.0;
        _2056 = _2060;
    }
    float _2062 = _2056;
    if (!_1858)
    {
        _2022 = _1940;
    }
    float _2064 = _2022;
    float _2066 = _2038 * _2044;
    float _2068 = -_2038;
    float _2070 = _2068 + 1.0;
    bool _2072 = _778 != 0.0;
    bool _2074 = isnan(_778);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = trunc(_2052);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    float _2088 = _2040 * _2066;
    float _2090 = _2064;
    if (_1858)
    {
        _2090 = _2062;
    }
    float _2092 = _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2096 = _338 + _2094;
    int _2098 = ~_384;
    int _2100 = _2098 + 1;
    float _2102 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2088);
    int _2104 = ~_384;
    int _2106 = _2104 + 1;
    float _2108 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2110 = int(_1924) + int(_2050);
    float _2112 = fma(_2054, _2096, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2114 = fma(_506, _2108, _472);
    bool _2116 = _776 == 0.0;
    bool _2118 = !_2080;
    bool _2120 = _2116 && _2118;
    float _2122 = fma(_2112, _2026, _2102);
    int _2124 = _2106 * _2110;
    int _2126 = _2124 + _1904;
    float _2128 = in.m_79.x;
    float _2130 = in.m_79.y;
    float _2132 = in.m_79.z;
    int _2134 = _2100 * int(_2086);
    int _2136 = _2134 + _1876;
    float _2138 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2122);
    bool _2140 = uint(_2126) >= uint(_384);
    float _2142 = _2114 + 0.5;
    bool _2144 = _780 == 0.0;
    bool _2146 = _2144 && _2120;
    float _2148 = float(uint(_2136));
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2152 = !_2140;
    int _2154 = _2152 ? 0 : (-1);
    float _2156 = as_type<float>(_1727) * _2148;
    int _2158 = ~_2110;
    int _2160 = _2158 + _2154;
    int _2162 = _2160 + 1;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2166 = _2016 + 0.5;
    float _2168 = trunc(_2156);
    float _2170 = precise::max(_2168, 0.0);
    uint _2172 = uint(_2170);
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2176 = _2150 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2178 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2180 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2182 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_81.x = _2142;
    out.m_81.y = _2166;
    float _2184 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = _2128;
    float _2188 = _2132;
    float _2190 = _2130;
    if (!_2146)
    {
        float _2192 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2128);
        _2186 = _2192;
    }
    float _2194 = _2186;
    int _2196 = _384 * _2162;
    int _2198 = _2196 + _1904;
    if (!_2146)
    {
        float _2200 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2188 = _2200;
    }
    float _2202 = _2188;
    int _2204 = ~_384;
    int _2206 = _2204 + 1;
    if (!_2146)
    {
        float _2208 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2130);
        _2190 = _2208;
    }
    float _2210 = _2190;
    float _2212 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2214 = !_1697;
    int _2216 = _2214 ? _2198 : (-1);
    out.m_83.x = _2176;
    out.m_83.y = _2178;
    out.m_83.z = _2182;
    out.m_83.w = _2180;
    int _2218 = int(_2086) + int(_2172);
    float _2220 = -_808;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    int _2224 = _2216 >> 31;
    float _2226 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2228 = _834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2230 = _2216 & 3;
    bool _2232 = _2230 != 0;
    float _2234 = _840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2236 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2234);
    int _2238 = _2206 * _2218;
    int _2240 = _2238 + _1876;
    float _2242 = -_808;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2212);
    int _2246 = _2224 & 3;
    float _2248 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    float _2250 = -_808;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2254 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2244);
    int _2256 = _2216 + _2246;
    float _2258 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2228);
    float _2260 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2252);
    bool _2262 = uint(_2240) >= uint(_384);
    float _2264 = abs(_1242);
    float _2266 = log2(_2264);
    int _2268 = _2256 >> 2;
    float _2270 = _834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2272 = _2254 * _2210;
    float _2274 = _2248 * _2210;
    int _2276 = _2268 << 4;
    int _2278 = _2276 + 368;
    float _2280 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2270);
    float _2282 = _2260 * _2210;
    bool _2284 = !_2262;
    int _2286 = _2284 ? 0 : (-1);
    uint _2288 = uint(int(uint(_2278) >> uint(2)));
    uint _2290 = uint(int(uint(int(_2288)) >> uint(2)));
    int _2292 = int(_2288) & 3;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[int(_2290)][_2292];
    int _2296 = int(_2288) + 1;
    uint _2298 = uint(int(uint(_2296) >> uint(2)));
    int _2300 = _2296 & 3;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[int(_2298)][_2300];
    float _2304 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2280);
    int _2306 = _2216 & 3;
    bool _2308 = _2306 != 0;
    float _2310 = _834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2312 = ~_2218;
    int _2314 = _2312 + _2286;
    int _2316 = _2314 + 1;
    float _2318 = fma(_2304, _2194, _2272);
    bool _2320 = uint(_2306) > 1u;
    float _2322 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2324 = _2278 + 8;
    uint _2326 = uint(int(uint(_2324) >> uint(2)));
    uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
    int _2330 = int(_2326) & 3;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[int(_2328)][_2330];
    int _2334 = int(_2326) + 1;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    int _2338 = _2334 & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = _2232 ? 0 : 1;
    float _2344 = _840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2346 = uint(_2306) >= 2u;
    float _2348 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2310);
    int _2350 = ~_2342;
    int _2352 = _2350 + 1;
    int _2354 = _2352 + 1;
    float _2356 = exp2(_2322);
    float _2358 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2344);
    float _2360 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2258);
    bool _2362 = !_2308;
    int _2364 = _2362 ? 0 : 1;
    float _2366 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2348);
    int _2368 = _2354;
    if (!_2320)
    {
        int _2370 = ~_2342;
        int _2372 = _2370 + 1;
        _2368 = _2372;
    }
    int _2374 = _2368;
    float _2376 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2358);
    bool _2378 = _2306 != 3;
    float _2380 = fma(_2360, _2194, _2274);
    int _2382 = abs(_2374);
    float _2384 = fma(_2366, _2194, _2282);
    int _2386 = _2346 ? 0 : 1;
    float _2388 = fma(_2376, _2202, _2318);
    int _2390 = abs(_2364);
    float _2392 = -_1654;
    float _2394 = _2392 + 1.0;
    int _2396 = ~_2386;
    int _2398 = _2396 + 1;
    int _2400 = _2398 + 1;
    int _2402 = _384 * _2316;
    int _2404 = _2402 + _1876;
    bool _2406 = _2306 != 3;
    float _2408 = _1748 * _1666;
    int _2410 = ~_2382;
    int _2412 = _2410 + 1;
    int _2414 = _2412 + 1;
    float _2416 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2236);
    int _2418 = _2400;
    if (_2378)
    {
        int _2420 = ~_2386;
        int _2422 = _2420 + 1;
        _2418 = _2422;
    }
    int _2424 = _2418;
    bool _2426 = !_2406;
    int _2428 = _2426 ? 0 : (-1);
    bool _2430 = _1242 <= 8000.0;
    bool _2432 = isnan(_1242);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan(8000.0);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = fma(_2356, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    bool _2446 = !_1697;
    int _2448 = _2446 ? _2404 : (-1);
    float _2450 = _1687 * _2408;
    int _2452 = abs(_2424);
    int _2454 = _2414 * as_type<int>(_2302);
    int _2456 = ~_2390;
    int _2458 = _2456 + 1;
    int _2460 = _2458 + 1;
    float _2462 = fma(_2416, _2202, _2380);
    bool _2464 = !_1914;
    int _2466 = _2464 ? 0 : 1;
    float _2468 = fma(_1725, _2202, _2384);
    int _2470 = abs(_2428);
    int _2472 = _2460 * as_type<int>(_2294);
    int _2474 = _2472 + _2454;
    float _2476 = _1634 + _1584;
    float _2478 = fma(_1677, _2450, _1675);
    int _2480 = abs(_2466);
    float _2482 = _2476 * 0.5;
    out.m_85.x = _2388;
    out.m_85.y = _2462;
    out.m_85.z = _2468;
    int _2484 = ~_2452;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2444, -2.0, 3.0);
    float _2492 = _2444 * _2444;
    int _2494 = ~_2470;
    int _2496 = _2494 + 1;
    int _2498 = _2496 + 1;
    int _2500 = _2488 * as_type<int>(_2332);
    int _2502 = _2500 + _2474;
    float _2504 = _2492 * _2490;
    float _2506 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2508 = _2498 * as_type<int>(_2340);
    int _2510 = _2508 + _2502;
    float _2512 = -_2504;
    float _2514 = _2512 + 1.0;
    int _2516 = ~_2480;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    float _2522 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2506);
    float _2524 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2504);
    float _2526 = in.m_87.x;
    float _2528 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2522);
    float _2530 = _2440 * _2524;
    int _2532 = _2510 * _2520;
    float _2534 = _1584 * 0.5;
    float _2536 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2528);
    float _2538 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2540 = _2448 * _2480;
    int _2542 = _2540 + _2532;
    float _2544 = fma(_1636, -0.5, _2534);
    float _2546 = _2536 + _1584;
    float _2548 = _2394 * _2538;
    float _2550 = precise::clamp(_2548, 0.0, 1.0);
    out.gl_Position.x = _1634;
    out.gl_Position.y = _1636;
    out.gl_Position.z = _2536;
    out.gl_Position.w = _1584;
    float _2552 = _1677 * _2408;
    float _2554 = float(_2542);
    float _2556 = -_2550;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2560 = _2546 * 0.5;
    float _2562 = fma(_1683, _2552, _1671);
    float _2564 = fma(_1685, _2552, _1673);
    out.m_89.x = _2554;
    bool _2566 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2568 = isnan(_1390);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2574 = _2570 || _2572;
    out.m_91.x = _2482;
    out.m_91.y = _2544;
    out.m_91.z = _2560;
    out.m_91.w = _1584;
    float _2576 = _2558 * _2526;
    float _2578 = -_1748;
    float _2580 = _2578 + 1.0;
    float _2582 = _2576 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2584 = _1677 * _2580;
    float _2586 = _1294 * _1350;
    float _2588 = _2526;
    float _2590 = _2552;
    float _2592 = _2536;
    float _2594 = _2586;
    if (!_2574)
    {
        _2588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2596 = _2588;
    out.m_93.x = _2582;
    float _2598 = _2586 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2600 = _2596;
    float _2602 = _2596;
    if (!_2574)
    {
        _2590 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2604 = _2590;
    out.m_95.x = _2562;
    out.m_95.y = _2564;
    out.m_95.z = _2478;
    out.m_95.w = _2584;
    float _2606 = _2604;
    float _2608 = _2604;
    if (!_2574)
    {
        _1886 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2610 = _1886;
    float _2612 = _2610;
    float _2614 = _2610;
    if (!_2574)
    {
        _2592 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2616 = _2592;
    float _2618 = _2616;
    float _2620 = _2616;
    if (!_2574)
    {
        _1888 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2622 = _1888;
    float _2624 = _2622;
    float _2626 = _2622;
    if (!_2574)
    {
        _2594 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2628 = _2594;
    bool _2630 = !_2574;
    float _2632 = _2628;
    float _2634 = _2628;
    if (!_2630)
    {
        bool _2636 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2638 = isnan(_1390);
        bool _2640 = _2636 || _2638;
        bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2644 = _2640 || _2642;
        if (!_2644)
        {
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2648 = _1390 + _2646;
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2652 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2650;
            float _2654 = 1.0 / _2652;
            float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2676 = _2648 * _2654;
            float _2678 = precise::clamp(_2676, 0.0, 1.0);
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2684 = fma(_2678, _2658, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2686 = fma(_2678, _2682, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2688 = fma(_2678, _2662, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2690 = fma(_2678, _2666, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2692 = fma(_2678, _2670, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2694 = fma(_2678, _2674, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2608 = _2686;
            _2626 = _2692;
            _2602 = _2684;
            _2620 = _2690;
            _2614 = _2688;
            _2634 = _2694;
            _2696 = true;
        }
        else
        {
            bool _2698 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2700 = isnan(_1390);
            bool _2702 = _2698 || _2700;
            bool _2704 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2706 = _2702 || _2704;
            if (!_2706)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2708 = _2600;
            _2602 = _2708;
            if (!_2706)
            {
                _2606 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2710 = _2606;
            _2608 = _2710;
            if (!_2706)
            {
                _2612 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2712 = _2612;
            _2614 = _2712;
            if (!_2706)
            {
                _2618 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2714 = _2618;
            _2620 = _2714;
            if (!_2706)
            {
                _2624 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2716 = _2624;
            _2626 = _2716;
            if (!_2706)
            {
                _2632 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2718 = _2632;
            bool _2720 = !_2706;
            _2634 = _2718;
            if (!_2720)
            {
                bool _2722 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2724 = isnan(_1390);
                bool _2726 = _2722 || _2724;
                bool _2728 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2730 = _2726 || _2728;
                if (!_2730)
                {
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2734 = _1390 + _2732;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2738 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2736;
                    float _2740 = 1.0 / _2738;
                    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2762 = _2734 * _2740;
                    float _2764 = precise::clamp(_2762, 0.0, 1.0);
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2770 = fma(_2764, _2744, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2772 = fma(_2764, _2768, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2774 = fma(_2764, _2748, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2776 = fma(_2764, _2752, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2778 = fma(_2764, _2756, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2780 = fma(_2764, _2760, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2608 = _2772;
                    _2626 = _2778;
                    _2602 = _2770;
                    _2620 = _2776;
                    _2614 = _2774;
                    _2634 = _2780;
                    _2696 = true;
                }
                else
                {
                    _2608 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2626 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2620 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2614 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2634 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2696 = false;
    float _2782 = _2608;
    float _2784 = _2626;
    float _2786 = _2602;
    float _2788 = _2620;
    float _2790 = _2614;
    float _2792 = _2634;
    float _2794 = _2598 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2796 = fma(_2462, -0.5, 0.5);
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = -_2782;
    float _2802 = _2800 + _2784;
    float _2804 = -_2786;
    float _2806 = _2804 + _2788;
    out.m_53.x = _2794;
    float _2808 = fma(_2798, _2802, _2782);
    float _2810 = -_2790;
    float _2812 = _2810 + _2792;
    float _2814 = fma(_2798, _2806, _2786);
    float _2816 = _2808 * 0.586610972881317138671875;
    bool _2818 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2820 = fma(_2798, _2812, _2790);
    out.m_97.x = 0.0;
    float _2822 = fma(_2814, 0.298911988735198974609375, _2816);
    bool _2824 = _1294 > 0.0;
    bool _2826 = isnan(_1294);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan(0.0);
    bool _2832 = _2828 || _2830;
    float _2834 = fma(_2820, 0.114477999508380889892578125, _2822);
    bool _2836 = _1350 <= 0.0;
    bool _2838 = !_2832;
    bool _2840 = _2836 || _2838;
    float _2842 = -_2834;
    float _2844 = _2814 + _2842;
    float _2846 = -_2834;
    float _2848 = _2808 + _2846;
    float _2850 = -_2834;
    float _2852 = _2820 + _2850;
    float _2854 = fma(_2844, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2834);
    float _2856 = fma(_2848, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2834);
    float _2858 = fma(_2852, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2834);
    bool _2860 = !_2818;
    if (!_2860)
    {
        float _2862 = -_1232;
        float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2866 = -_1234;
        float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2870 = -_1236;
        float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2874 = _2864 * _2864;
        float _2876 = fma(_2868, _2868, _2874);
        float _2878 = fma(_2872, _2872, _2876);
        float _2880 = sqrt(_2878);
        float _2882 = rsqrt(_2878);
        float _2884 = -_2880;
        float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2888 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2890 = precise::clamp(_2888, 0.0, 1.0);
        float _2892 = _2868 * _2882;
        float _2894 = _2864 * _2882;
        float _2896 = abs(_2890);
        float _2898 = log2(_2896);
        float _2900 = _2872 * _2882;
        float _2902 = _2892 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2904 = _2462 * _2894;
        float _2906 = -_2894;
        float _2908 = -_2902;
        float _2910 = fma(_2906, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2908);
        float _2912 = fma(_2388, _2892, _2904);
        float _2914 = -_2900;
        float _2916 = fma(_2914, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2910);
        float _2918 = fma(_2468, _2900, _2912);
        float _2920 = precise::clamp(_2918, 0.0, 1.0);
        float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2924 = _2916 + _2922;
        float _2926 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2928 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2930 = precise::clamp(_2928, 0.0, 1.0);
        float _2932 = exp2(_2926);
        float _2934 = _2932 * _2930;
        float _2936 = _2920 * _2934;
        float _2938 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2940 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2942 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2938;
        out.m_97.y = _2940;
        out.m_97.z = _2942;
    }
    out.m_67.x = _2854;
    out.m_67.y = _2856;
    out.m_67.z = _2858;
    if (!_2840)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2944 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2944;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

