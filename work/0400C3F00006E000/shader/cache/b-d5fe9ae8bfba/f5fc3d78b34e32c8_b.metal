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
    float4 m_89 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_65 [[user(locn13)]];
    float4 m_87 [[user(locn14)]];
    float4 m_91 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2734 = false;
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
        float _3051 = as_type<float>(_140);
        out.gl_Position.z = _3051;
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
        float _3106 = as_type<float>(_166);
        out.gl_Position.z = _3106;
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
    float _388 = _340 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _390 = _340 * 2.0;
    float _392 = exp2(_378);
    float _394 = fma(_386, -2.0, _358);
    float _396 = _342 * 2.0;
    float _398 = -_380;
    float _400 = fma(_388, 2.0, _398);
    float _402 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _404 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _406 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _408 = _342 + _340;
    float _410 = floor(_396);
    float _412 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _402);
    float _414 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _406);
    float _416 = _408 + (-1.0);
    float _418 = _360 * 2.0;
    float _420 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _404);
    float _422 = _342 + _360;
    float _424 = floor(_390);
    float _426 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _428 = float(_364);
    float _430 = _422 + (-1.0);
    float _432 = -_392;
    float _434 = _432 + 1.0;
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = -_122;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _400);
    float _450 = floor(_418);
    bool _452 = _410 > 0.0;
    float _454 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _456 = _410 >= 0.0;
    bool _458 = isnan(_410);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _468 = 1.0 + _466;
    float _470 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    float _472 = _376 ? _434 : 0.0;
    float _474 = 1.0 / _428;
    bool _476 = _424 > 0.0;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _480 = _424 >= 0.0;
    bool _482 = isnan(_424);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _420);
    float _492 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[78].z, _478);
    float _494 = float(_384);
    float _496 = 1.0 / _468;
    bool _498 = _450 > 0.0;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _502 = _450 >= 0.0;
    bool _504 = isnan(_450);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = _494 * _122;
    float _514 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _492);
    float _516 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _500);
    int _518 = _488 ? 0 : 1;
    float _520 = _474 * _122;
    float _522 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _524 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _516);
    int _526 = ~_518;
    int _528 = _526 + 1;
    int _530 = _528 + 1;
    float _532 = _490 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _534 = _530;
    float _536 = _338;
    if (!_476)
    {
        int _538 = ~_518;
        int _540 = _538 + 1;
        _534 = _540;
    }
    int _542 = _534;
    float _544 = _522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _546 = _464 ? 0 : 1;
    if (_444)
    {
        float _548 = _472 * _496;
        _132 = _548;
    }
    float _550 = _132;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _558 = _556 != 0;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _562 = _560 != 0;
    float _564 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    int _566 = ~_546;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _574 = _544 + _572;
    int _576 = _570;
    if (!_452)
    {
        int _578 = ~_546;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = _564 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _586 = !_558;
    int _588 = _586 ? 0 : 1;
    float _590 = in.m_61.x;
    float _592 = in.m_61.y;
    float _594 = in.m_61.z;
    bool _596 = !_554;
    int _598 = _596 ? 0 : 1;
    bool _600 = !_562;
    int _602 = _600 ? 0 : 1;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = float(_542);
    int _618 = _510 ? 0 : 1;
    bool _620 = !_606;
    int _622 = _620 ? 0 : 1;
    bool _624 = !_610;
    int _626 = _624 ? 0 : 1;
    int _628 = abs(_622);
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _632 = _532 + _630;
    int _634 = abs(_626);
    int _636 = ~_618;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = _632 * _632;
    float _644 = float(_634);
    float _646 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _648 = _584 + _646;
    int _650 = _640;
    if (!_498)
    {
        int _652 = ~_618;
        int _654 = _652 + 1;
        _650 = _654;
    }
    int _656 = _650;
    float _658 = fma(_574, _574, _642);
    float _660 = _644 * _616;
    float _662 = float(_628);
    float _664 = fma(_648, _648, _658);
    float _666 = float(_656);
    float _668 = _660 * (-2.0);
    bool _670 = !_614;
    int _672 = _670 ? 0 : 1;
    float _674 = sqrt(_664);
    float _676 = _342 + (-0.5);
    float _678 = fma(_668, _592, _592);
    float _680 = fma(_454, _668, _454);
    int _682 = abs(_672);
    float _684 = _662 * _666;
    float _686 = float(_582);
    float _688 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].y, _678);
    float _690 = rsqrt(_664);
    float _692 = _360 + _340;
    float _694 = _684 * (-2.0);
    float _696 = float(_682);
    float _698 = _692 + (-1.0);
    float _700 = fma(_680, _550, _688);
    float _702 = _674 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _704 = fma(_694, _590, _590);
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _708 = _696 * _686;
    float _710 = _340 + (-0.5);
    float _712 = precise::min(_366, _702);
    float _714 = fma(_426, _694, _426);
    float _716 = _708 * (-2.0);
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].x, _704);
    float _720 = _360 + (-0.5);
    float _722 = _690 * _712;
    float _724 = fma(_706, _716, _706);
    float _726 = fma(_716, _594, _594);
    float _728 = fma(_714, _550, _718);
    float _730 = _632 * _722;
    float _732 = _574 * _722;
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[196].z, _726);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = -_730;
    float _740 = _632 + _738;
    float _742 = -_732;
    float _744 = _574 + _742;
    float _746 = fma(_724, _550, _734);
    float _748 = _648 * _722;
    float _750 = _740 * _740;
    float _752 = _700 * 0.15915493667125701904296875;
    float _754 = _736 * 6.283185482025146484375;
    float _756 = sin(_754);
    float _758 = -_748;
    float _760 = _648 + _758;
    float _762 = fma(_744, _744, _750);
    float _764 = fma(_760, _760, _762);
    float _766 = in.m_63.x;
    float _768 = in.m_63.y;
    float _770 = in.m_63.z;
    float _772 = _752 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = sqrt(_764);
    float _778 = _752 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = _736 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _746 * 0.15915493667125701904296875;
    float _788 = _690 * _776;
    float _790 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _792 = _756 * _774;
    float _794 = _348 * _788;
    float _796 = _790 * _788;
    float _798 = _786 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _768);
    float _804 = _756 * _780;
    float _806 = _356 * _788;
    float _808 = _796 * _802;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _770);
    float _812 = _786 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _784 * _780;
    float _818 = _784 * _774;
    float _820 = _756 * _800;
    float _822 = _780 * _800;
    float _824 = _784 * _800;
    float _826 = _774 * _800;
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _766);
    float _830 = _806 * _810;
    float _832 = _820 * _808;
    float _834 = _794 * _828;
    float _836 = fma(_814, _816, _792);
    float _838 = _824 * _808;
    float _840 = -_804;
    float _842 = fma(_814, _818, _840);
    float _844 = -_808;
    float _846 = _814 * _844;
    float _848 = -_818;
    float _850 = fma(_814, _804, _848);
    float _852 = fma(_836, _834, _838);
    float _854 = fma(_814, _792, _816);
    float _856 = fma(_822, _834, _846);
    float _858 = fma(_850, _834, _832);
    float _860 = fma(_842, _830, _852);
    float _862 = fma(_826, _830, _856);
    float _864 = fma(_854, _830, _858);
    float _866 = _860 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _868 = _860 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _870 = _860 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _872 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].x, _866);
    float _874 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].x, _868);
    float _876 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].x, _870);
    float _878 = -_730;
    float _880 = _532 + _878;
    float _882 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _872);
    float _884 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _874);
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _876);
    float _888 = -_732;
    float _890 = _544 + _888;
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _894 = _884 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _896 = _886 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _898 = -_748;
    float _900 = _584 + _898;
    float _902 = _584 + _892;
    float _904 = _544 + _894;
    float _906 = _532 + _896;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _910 = _902 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _904 + _912;
    float _916 = _910 * _910;
    float _918 = fma(_914, _914, _916);
    float _920 = _880 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _922 = sqrt(_918);
    float _924 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[11].x, _920);
    float _926 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[11].z, _924);
    bool _928 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = _896;
    float _932 = _886;
    float _934 = _904;
    float _936 = _730;
    float _938 = _732;
    float _940 = _748;
    if (!_928)
    {
        _930 = _904;
    }
    float _942 = _930;
    float _944 = _942;
    if (!_928)
    {
        _932 = _902;
    }
    float _946 = _932;
    float _948 = _946;
    if (!_928)
    {
        _934 = _906;
    }
    float _950 = _934;
    bool _952 = !_928;
    float _954 = _950;
    if (!_952)
    {
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _960 = _922 + _958;
        float _962 = rsqrt(_918);
        float _964 = _960 * _956;
        float _966 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _968 = _964 * 0.15915493667125701904296875;
        float _970 = _968 * 6.283185482025146484375;
        float _972 = cos(_970);
        float _974 = _968 * 6.283185482025146484375;
        float _976 = sin(_974);
        float _978 = _972 + (-1.0);
        float _980 = fma(_976, _966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _982 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = _962 * _980;
        float _986 = fma(_906, _972, _982);
        float _988 = fma(_914, _984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _990 = fma(_910, _984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _954 = _986;
        _944 = _988;
        _948 = _990;
    }
    float _992 = _954;
    float _994 = _944;
    float _996 = _948;
    float _998 = -_532;
    float _1000 = _998 + _992;
    float _1002 = -_544;
    float _1004 = _1002 + _994;
    float _1006 = _926 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1008 = _880 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1010 = _1000 * _1000;
    float _1012 = -_584;
    float _1014 = _1012 + _996;
    float _1016 = 1.0 / _1006;
    float _1018 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1008);
    float _1020 = fma(_1004, _1004, _1010);
    float _1022 = -_732;
    float _1024 = _1022 + _994;
    float _1026 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1018);
    float _1028 = fma(_1014, _1014, _1020);
    float _1030 = -_730;
    float _1032 = _1030 + _992;
    float _1034 = -_748;
    float _1036 = _1034 + _996;
    float _1038 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1040 = sqrt(_1028);
    bool _1042 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1044 = isnan(0.5);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1050 = _1046 || _1048;
    float _1052 = _1038 + _1006;
    bool _1054 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1062 = _1058 || _1060;
    float _1064 = _1052 * _1016;
    float _1066 = _1064 * 0.5;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1070 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1068);
    float _1072 = 1.0 / _1070;
    bool _1074 = _1040 > 0.0;
    float _1076 = _1040;
    float _1078 = _994;
    float _1080 = _1004;
    float _1082 = _1016;
    float _1084 = _1036;
    float _1086 = _1070;
    float _1088 = _1032;
    if (!_1074)
    {
        _936 = _1024;
    }
    float _1090 = _936;
    float _1092 = _1090;
    if (!_1074)
    {
        _938 = _1032;
    }
    float _1094 = _938;
    float _1096 = _1094;
    if (!_1074)
    {
        _1076 = _1036;
    }
    float _1098 = _1076;
    bool _1100 = !_1074;
    float _1102 = _1098;
    float _1104 = _1098;
    if (!_1100)
    {
        float _1106 = _194 * _194;
        float _1108 = rsqrt(_1028);
        float _1110 = fma(_192, _192, _1106);
        float _1112 = fma(_196, _196, _1110);
        float _1114 = sqrt(_1112);
        float _1116 = _1000 * _1108;
        float _1118 = _1004 * _1108;
        float _1120 = _1014 * _1108;
        bool _1122 = _1114 > 0.0;
        float _1124 = _1108;
        float _1126 = _1114;
        _1078 = _1118;
        if (!_1122)
        {
            _1124 = _1024;
        }
        float _1128 = _1124;
        _1092 = _1128;
        if (!_1122)
        {
            _1126 = _1032;
        }
        float _1130 = _1126;
        _1096 = _1130;
        if (!_1122)
        {
            _1102 = _1036;
        }
        float _1132 = _1102;
        bool _1134 = !_1122;
        _1104 = _1132;
        if (!_1134)
        {
            float _1136 = rsqrt(_1112);
            float _1138 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1140 = _194 * _1136;
            float _1142 = _192 * _1136;
            float _1144 = _1116 * _1140;
            float _1146 = _196 * _1136;
            float _1148 = fma(_1118, _1142, _1144);
            float _1150 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1152 = fma(_1120, _1146, _1148);
            float _1154 = _1152 * _1150;
            float _1156 = fma(_192, _1154, _1024);
            float _1158 = fma(_194, _1154, _1032);
            float _1160 = fma(_196, _1154, _1036);
            _1092 = _1156;
            _1096 = _1158;
            _1104 = _1160;
            _1080 = _1154;
        }
    }
    float _1162 = _1092;
    float _1164 = _1096;
    float _1166 = _1104;
    float _1168 = _1078;
    float _1170 = _1080;
    float _1172 = _1170;
    float _1174 = _1164;
    float _1176 = _1162;
    float _1178 = _1166;
    if (_1062)
    {
        _1172 = 1.0;
    }
    float _1180 = _1172;
    float _1182 = _1180;
    if (!_1050)
    {
        float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1186 = _880 + _1184;
        float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1190 = _890 + _1188;
        float _1192 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1194 = _1186 * _1186;
        float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1198 = _900 + _1196;
        float _1200 = fma(_1190, _1190, _1194);
        float _1202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1204 = fma(_1198, _1198, _1200);
        float _1206 = sqrt(_1204);
        float _1208 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1210 = precise::min(_1206, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1212 = _1210 * _1202;
        float _1214 = -_890;
        float _1216 = _1214 + _1162;
        float _1218 = _1208 * _1212;
        float _1220 = -_880;
        float _1222 = _1220 + _1164;
        float _1224 = -_900;
        float _1226 = _1224 + _1166;
        float _1228 = fma(_1216, _1218, _890);
        float _1230 = fma(_1222, _1218, _880);
        float _1232 = fma(_1226, _1218, _900);
        _1174 = _1230;
        _1176 = _1228;
        _1178 = _1232;
    }
    float _1234 = _1174;
    float _1236 = _1176;
    float _1238 = _1178;
    if (_1062)
    {
        _1082 = 1.0;
    }
    float _1240 = _1082;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1244 = _1072 * _1242;
    float _1246 = _1240;
    if (!_1062)
    {
        float _1248 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = _1248 * 0.15915493667125701904296875;
        float _1252 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1254 = _1250 * 6.283185482025146484375;
        float _1256 = cos(_1254);
        float _1258 = _1252 * 0.15915493667125701904296875;
        float _1260 = _1250 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        float _1264 = 1.0 / _1256;
        float _1266 = _1258 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        float _1270 = _1262 * _1264;
        float _1272 = _1258 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = 1.0 / _1276;
        float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1282 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1280;
        float _1284 = 1.0 / _1282;
        float _1286 = _1274 * _1278;
        float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1290 = fma(_1244, _1286, _1288);
        float _1292 = _1290 * _1284;
        float _1294 = precise::clamp(_1292, 0.0, 1.0);
        _1182 = _1294;
    }
    float _1296 = _1182;
    if (!_1062)
    {
        float _1298 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1300 = _1298 * 0.15915493667125701904296875;
        float _1302 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = cos(_1304);
        float _1308 = _1302 * 0.15915493667125701904296875;
        float _1310 = _1300 * 6.283185482025146484375;
        float _1312 = sin(_1310);
        float _1314 = 1.0 / _1306;
        float _1316 = _1308 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        float _1320 = _1312 * _1314;
        float _1322 = _1308 * 6.283185482025146484375;
        float _1324 = sin(_1322);
        float _1326 = _1318 * _1320;
        float _1328 = 1.0 / _1326;
        float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1332 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1330;
        float _1334 = 1.0 / _1332;
        float _1336 = _1324 * _1328;
        float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1340 = fma(_1244, _1336, _1338);
        float _1342 = _1340 * _1334;
        float _1344 = precise::clamp(_1342, 0.0, 1.0);
        float _1346 = -_1344;
        float _1348 = _1346 + 1.0;
        _1084 = _1328;
        _1246 = _1348;
    }
    float _1350 = _1084;
    float _1352 = _1246;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1356 = _1234 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1360 = _1236 + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1364 = _1238 + _1362;
    float _1366 = _1356 * _1356;
    float _1368 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1370 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1372 = fma(_1360, _1360, _1366);
    float _1374 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1368);
    float _1376 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1370);
    float _1378 = fma(_1364, _1364, _1372);
    float _1380 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1374);
    float _1382 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1376);
    float _1384 = rsqrt(_1378);
    float _1386 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1388 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1390 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1392 = sqrt(_1378);
    float _1394 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1360 * _1394;
    float _1398 = _1364 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 + _1402;
    float _1406 = sqrt(_1404);
    bool _1408 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1406 + _1410;
    float _1414 = _1168;
    float _1416 = _1404;
    float _1418 = _1412;
    float _1420 = _1396;
    float _1422 = _1398;
    float _1424 = _1400;
    float _1426 = _1402;
    if (_1408)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1428;
    }
    float _1430 = _1414;
    if (_1408)
    {
        float _1432 = rsqrt(_1404);
        _1416 = _1432;
    }
    float _1434 = _1416;
    if (_1408)
    {
        float _1436 = _1412 * _1430;
        _1418 = _1436;
    }
    float _1438 = _1418;
    if (_1408)
    {
        float _1440 = _1438 * 0.15915493667125701904296875;
        _1086 = _1440;
    }
    float _1442 = _1086;
    float _1444 = _1430;
    if (_1408)
    {
        float _1446 = _1442 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1454 = precise::max(0.0, _1452);
    float _1456 = _1350;
    if (_1408)
    {
        float _1458 = _1442 * 6.283185482025146484375;
        float _1460 = cos(_1458);
        _1456 = _1460;
    }
    float _1462 = _1456;
    float _1464 = -_1394;
    float _1466 = -_1454;
    float _1468 = fma(_1356, _1464, _1466);
    if (_1408)
    {
        float _1470 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _940 = _1470;
    }
    float _1472 = _940;
    float _1474 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1476 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1478 = _1472;
    float _1480 = _1450;
    if (_1408)
    {
        float _1482 = fma(_1450, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1482;
    }
    float _1484 = _1478;
    float _1486 = _1484;
    if (!_1408)
    {
        _1480 = _1468;
    }
    float _1488 = _1480;
    float _1490 = floor(_1476);
    float _1492 = _1488;
    if (_1408)
    {
        float _1494 = _1462 + (-1.0);
        _1088 = _1494;
    }
    float _1496 = _1088;
    float _1498 = _1496;
    if (_1408)
    {
        float _1500 = _1434 * _1484;
        _1486 = _1500;
    }
    float _1502 = _1486;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1506 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1504);
    float _1508 = precise::clamp(_1506, 0.0, 1.0);
    if (_1408)
    {
        float _1510 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1498 = _1510;
    }
    float _1512 = _1498;
    if (_1408)
    {
        float _1514 = _1396 * _1502;
        _1420 = _1514;
    }
    float _1516 = _1420;
    if (_1408)
    {
        float _1518 = _1398 * _1502;
        _1422 = _1518;
    }
    float _1520 = _1422;
    if (_1408)
    {
        float _1522 = fma(_1468, _1462, _1512);
        _1492 = _1522;
    }
    float _1524 = _1492;
    if (_1408)
    {
        float _1526 = _1516 * _1516;
        _1424 = _1526;
    }
    float _1528 = _1424;
    if (_1408)
    {
        float _1530 = _1520 * _1520;
        _1426 = _1530;
    }
    float _1532 = _1426;
    float _1534 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1474);
    float _1536 = -_1508;
    float _1538 = _1536 + 1.0;
    float _1540 = fma(_1524, _1524, _1528);
    float _1542 = fma(_900, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1544 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1546 = _1540 + _1532;
    float _1548 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1534);
    float _1550 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1544);
    float _1552 = abs(_1538);
    float _1554 = log2(_1552);
    float _1556 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1558 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1560 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1550);
    float _1562 = -_1390;
    float _1564 = fma(_1562, _1556, 1.0);
    float _1566 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1568 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1570 = rsqrt(_1546);
    float _1572 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1574 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1572);
    float _1576 = floor(_1542);
    float _1578 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1574);
    float _1580 = _1570 * _1516;
    float _1582 = _1570 * _1524;
    float _1584 = _1570 * _1520;
    float _1586 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1578);
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1590 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1592 = log2(_1564);
    float _1594 = _1582 + 1.0;
    float _1596 = -_1588;
    float _1598 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1596);
    float _1600 = -_1576;
    float _1602 = _1542 + _1600;
    float _1604 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1566);
    float _1606 = -_1584;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1598);
    float _1610 = -_1490;
    float _1612 = _1476 + _1610;
    float _1614 = 1.0 / _1586;
    float _1616 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1618 = fma(_1608, -0.5, 0.5);
    float _1620 = fma(_1608, 0.5, 0.5);
    float _1622 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1624 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1616);
    float _1626 = fma(_1620, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1628 = exp2(_1590);
    float _1630 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1624);
    float _1632 = _1592 * 0.693147182464599609375;
    float _1634 = fma(_1620, _1626, -0.212114393711090087890625);
    float _1636 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1638 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1622);
    float _1640 = fma(_1620, _1634, 1.570728778839111328125);
    float _1642 = sqrt(_1618);
    float _1644 = _1636 * _1614;
    float _1646 = _1638 * _1614;
    float _1648 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1650 = fma(_1646, -0.5, 0.5);
    float _1652 = -_1582;
    float _1654 = fma(_1628, _1594, _1652);
    float2 _5414 = float2(_1612, _1602);
    float _1656 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5414, float2(0.0), isnan(_5414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5414, float2(0.0), isnan(_5414)), level(0.0)).x;
    float _1658 = fma(_1654, 0.5, 0.5);
    float _1660 = _1642 * 0.636619746685028076171875;
    float _1662 = fma(_1644, 0.5, 0.5);
    float _1664 = -_1640;
    float _1666 = fma(_1660, _1664, 1.0);
    float3 _5437 = float3(_1662, _1650, _1648);
    float _1668 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5437, float3(0.0), isnan(_5437)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5437, float3(0.0), isnan(_5437)), level(0.0)).x;
    float3 _5448 = float3(_1662, _1650, _1648);
    float4 _1671 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5448, float3(0.0), isnan(_5448)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5448, float3(0.0), isnan(_5448)), level(0.0)).xyzw;
    float _1673 = _1671.x;
    float _1675 = _1671.y;
    float _1677 = _1671.z;
    float _1679 = _1671.w;
    float2 _5464 = float2(_1666, _1658);
    float3 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5464, float2(0.0), isnan(_5464)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5464, float2(0.0), isnan(_5464)), level(0.0)).xyz;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = float(uint(_384));
    float _1693 = trunc(_520);
    int _1695 = int(_1693);
    bool _1697 = _384 == 0;
    float _1699 = _512 * _174;
    int _1701 = abs(_588);
    out.m_65.x = _890;
    out.m_65.y = _880;
    out.m_65.z = _900;
    int _1703 = abs(_598);
    float _1705 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1707 = 1.0 / _1691;
    int _1709 = ~_384;
    int _1711 = _1709 + 1;
    out.m_67.w = _712;
    int _1713 = _384 + (-1);
    out.m_69.x = _794;
    float _1715 = float(uint(_1695));
    float _1717 = trunc(_1699);
    int _1719 = int(_1717);
    out.m_71.x = _1236;
    out.m_71.y = _1234;
    out.m_71.z = _1238;
    int _1721 = as_type<int>(_1707) + (-2);
    float _1723 = abs(_1244);
    float _1725 = log2(_1723);
    float _1727 = as_type<float>(_1721) * _1715;
    int _1729 = ~_384;
    int _1731 = _1729 + 1;
    float _1733 = exp2(_1705);
    bool _1735 = _1244 <= 8000.0;
    bool _1737 = isnan(_1244);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan(8000.0);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = trunc(_1727);
    float _1749 = precise::max(_1747, 0.0);
    uint _1752 = uint(_1749);
    float _1754 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1756 = exp2(_1754);
    float _1758 = -_1733;
    float _1760 = _1758 + 1.0;
    float _1762 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1764 = _1711 * int(_1752);
    int _1766 = _1764 + _1695;
    float _1768 = float(uint(_1766));
    float _1770 = as_type<float>(_1721) * _1768;
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1774 = _1772 != 0;
    float _1776 = trunc(_1770);
    float _1778 = precise::max(_1776, 0.0);
    uint _1780 = uint(_1778);
    bool _1782 = !_1774;
    float _1784 = _1782 ? 7.345489978790283203125 : 1.0;
    float _1786 = _1784 * _340;
    float _1788 = float(_1695);
    float _1790 = floor(_1786);
    bool _1792 = _1788 >= _494;
    bool _1794 = isnan(_1788);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan(_494);
    bool _1800 = _1796 || _1798;
    float _1802 = float(_1800);
    int _1804 = int(_1752) + int(_1780);
    float _1806 = trunc(_1802);
    int _1808 = int(_1806);
    int _1810 = _1731 * _1804;
    int _1812 = _1810 + _1695;
    bool _1814 = uint(_1812) >= uint(_384);
    float _1816 = -_1790;
    float _1818 = _1786 + _1816;
    bool _1820 = !_1814;
    int _1822 = _1820 ? 0 : (-1);
    float _1824 = _1818 * _494;
    int _1826 = ~_1804;
    int _1828 = _1826 + _1822;
    int _1830 = _1828 + 1;
    int _1832 = ~_1808;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    float _1838 = trunc(_1824);
    int _1840 = int(_1838);
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1844 = _1842 != 0;
    int _1846 = _384 * _1830;
    int _1848 = _1846 + _1695;
    int _1850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1852 = _1850 != 0;
    bool _1854 = !_1844;
    int _1856 = _1854 ? 0 : 1;
    bool _1858 = !_1697;
    int _1860 = _1858 ? _1848 : (-1);
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1864 = _1862 != 0;
    int _1866 = abs(_1856);
    int _1868 = _1860 * _1836;
    int _1870 = _1808 * _1713;
    int _1872 = _1870 + _1868;
    int _1874 = _1840 * _1866;
    int _1876 = _1874 + _1695;
    bool _1878 = !_1864;
    int _1880 = _1878 ? 0 : 1;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1884 = _1882 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1886 = abs(_602);
    int _1888 = _1872 * _1701;
    int _1890 = _1719 * _1703;
    int _1892 = _1890 + _1888;
    int _1894 = abs(_1880);
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1900 = _1876 * _1886;
    int _1902 = _1900 + _1892;
    float _1904 = 1.0 / _1884;
    float _1906 = in.m_73.y;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1912 = _1840 * _1894;
    int _1914 = _1912 + _1902;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1916 = 1.0 / _1898;
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1920 = _1918 != 0;
    bool _1922 = _342 > 0.5;
    float _1924 = 1.0 / _1910;
    float _1926 = float(uint(_1914));
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1932 = _1586;
    float _1934 = _1638;
    if (_1852)
    {
        float _1936 = in.m_57.x;
        _1930 = _1936;
    }
    float _1938 = _1930;
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1942 = _1940 != 0;
    float _1944 = as_type<float>(_1721) * _1926;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1948;
    float _1952 = in.m_73.x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1956 = -_1906;
    float _1958 = _1956 + 1.0;
    float _1960 = trunc(_1944);
    float _1962 = precise::max(_1960, 0.0);
    uint _1964 = uint(_1962);
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1968 = _1950 * _1904;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1972 = _1970 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1974 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1906;
    if (_1920)
    {
        float _1982 = _1922 ? _1958 : _1906;
        _1980 = _1982;
    }
    float _1984 = _1980;
    float _1986 = _1972 * _1916;
    int _1988 = ~_384;
    int _1990 = _1988 + 1;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1992;
    bool _1996 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1998 = isnan(_338);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    out.m_77.x = _1974;
    out.m_77.y = _1976;
    out.m_77.z = _1978;
    out.m_77.w = _1966;
    bool _2008 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2010 = isnan(_338);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2016 = _2012 || _2014;
    float _2018 = float(_2016);
    float _2020 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2022 = _1938 > 0.5;
    bool _2024 = _2022 && _1852;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2028 = _338 + _2026;
    float _2030 = float(uint(_1876));
    float _2032 = -_470;
    float _2034 = fma(_524, _2020, _2032);
    float _2036 = as_type<float>(_1721) * _2030;
    int _2038 = _1990 * int(_1964);
    int _2040 = _2038 + _1914;
    float _2042 = _1994 * _1924;
    bool _2044 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2046 = isnan(_338);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    float _2056 = -_2006;
    float _2058 = _2056 + 1.0;
    bool _2060 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2062 = isnan(_338);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2068 = _2064 || _2066;
    float _2070 = float(_2068);
    float _2072 = -_2018;
    float _2074 = _2072 + 1.0;
    float _2076 = float(uint(_2040));
    float _2078 = _2054 * _2058;
    float _2080 = -_2054;
    float _2082 = _2080 + 1.0;
    float _2084 = fma(_1968, _2028, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2086 = _2028;
    if (_1852)
    {
        _2086 = _1952;
    }
    float _2088 = _2086;
    float _2090 = as_type<float>(_1721) * _2076;
    float _2092 = _2070 * _2082;
    float _2094 = _2006 * _2074;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2098 = _338 + _2096;
    float _2100 = -_2070;
    float _2102 = _2100 + 1.0;
    float _2104 = trunc(_2090);
    float _2106 = precise::max(_2104, 0.0);
    uint _2108 = uint(_2106);
    float _2110 = _2084 * _2092;
    float _2112 = _2088;
    if (_2024)
    {
        float _2114 = -_2088;
        float _2116 = _2114 + 1.0;
        _2112 = _2116;
    }
    float _2118 = _2112;
    float _2120 = fma(_1986, _2098, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2122 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2124 = _338 + _2122;
    float _2126 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2110);
    if (!_1852)
    {
        _536 = _1952;
    }
    float _2128 = _536;
    float _2130 = trunc(_2036);
    float _2132 = precise::max(_2130, 0.0);
    uint _2134 = uint(_2132);
    float _2136 = _2128;
    if (_1852)
    {
        _2136 = _2118;
    }
    float _2138 = _2136;
    float _2140 = fma(_2042, _2124, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _2142 = ~_384;
    int _2144 = _2142 + 1;
    float _2146 = fma(_2120, _2078, _2126);
    int _2148 = ~_384;
    int _2150 = _2148 + 1;
    float _2152 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2154 = _768 != 0.0;
    bool _2156 = isnan(_768);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan(0.0);
    bool _2162 = _2158 || _2160;
    float _2164 = fma(_2140, _2094, _2146);
    int _2166 = int(_1964) + int(_2108);
    float _2168 = fma(_514, _2152, _448);
    float _2170 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2164);
    bool _2172 = _766 == 0.0;
    bool _2174 = !_2162;
    bool _2176 = _2172 && _2174;
    int _2178 = _2150 * _2166;
    int _2180 = _2178 + _1914;
    int _2182 = _2144 * int(_2134);
    int _2184 = _2182 + _1876;
    float _2186 = in.m_79.x;
    float _2188 = in.m_79.y;
    float _2190 = in.m_79.z;
    bool _2192 = _770 == 0.0;
    bool _2194 = _2192 && _2176;
    float _2196 = _2168 + 0.5;
    bool _2198 = uint(_2180) >= uint(_384);
    float _2200 = float(uint(_2184));
    bool _2202 = !_2198;
    int _2204 = _2202 ? 0 : (-1);
    float _2206 = as_type<float>(_1721) * _2200;
    int _2208 = ~_2166;
    int _2210 = _2208 + _2204;
    int _2212 = _2210 + 1;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2218 = _2034 + 0.5;
    float _2220 = trunc(_2206);
    float _2222 = precise::max(_2220, 0.0);
    uint _2224 = uint(_2222);
    float _2226 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2230 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2232 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_81.x = _2196;
    out.m_81.y = _2218;
    float _2234 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2236 = _2186;
    float _2238 = _2190;
    float _2240 = _2188;
    if (!_2194)
    {
        float _2242 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2186);
        _2236 = _2242;
    }
    float _2244 = _2236;
    int _2246 = _384 * _2212;
    int _2248 = _2246 + _1914;
    if (!_2194)
    {
        float _2250 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2190);
        _2238 = _2250;
    }
    float _2252 = _2238;
    int _2254 = ~_384;
    int _2256 = _2254 + 1;
    if (!_2194)
    {
        float _2258 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2188);
        _2240 = _2258;
    }
    float _2260 = _2240;
    float _2262 = _824 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2264 = !_1697;
    int _2266 = _2264 ? _2248 : (-1);
    out.m_83.x = _2226;
    out.m_83.y = _2230;
    out.m_83.z = _2234;
    out.m_83.w = _2232;
    int _2268 = int(_2134) + int(_2224);
    float _2270 = _824 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2272 = _2266 >> 31;
    float _2274 = _824 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2276 = _2266 & 3;
    bool _2278 = _2276 != 0;
    float _2280 = -_814;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2284 = -_1656;
    float _2286 = _2284 + 1.0;
    int _2288 = _2256 * _2268;
    int _2290 = _2288 + _1876;
    float _2292 = -_814;
    float _2294 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2262);
    int _2296 = _2272 & 3;
    float _2298 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2282);
    float _2300 = _836 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2302 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2294);
    int _2304 = _2266 + _2296;
    float _2306 = _842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2308 = uint(_2290) >= uint(_384);
    float _2310 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2312 = _2304 >> 2;
    float _2314 = _836 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2316 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2306);
    float _2318 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2310);
    int _2320 = _2312 << 4;
    int _2322 = _2320 + 368;
    float _2324 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2326 = -_814;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2274);
    bool _2330 = !_2308;
    int _2332 = _2330 ? 0 : (-1);
    uint _2334 = uint(int(uint(_2322) >> uint(2)));
    uint _2336 = uint(int(uint(int(_2334)) >> uint(2)));
    int _2338 = int(_2334) & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = int(_2334) + 1;
    uint _2344 = uint(int(uint(_2342) >> uint(2)));
    int _2346 = _2342 & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    float _2350 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2324);
    int _2352 = _2266 & 3;
    bool _2354 = _2352 != 0;
    float _2356 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2328);
    float _2358 = _2302 * _2260;
    float _2360 = _2298 * _2260;
    bool _2362 = uint(_2352) > 1u;
    float _2364 = _2356 * _2260;
    int _2366 = _2322 + 8;
    uint _2368 = uint(int(uint(_2366) >> uint(2)));
    uint _2370 = uint(int(uint(int(_2368)) >> uint(2)));
    int _2372 = int(_2368) & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    int _2376 = int(_2368) + 1;
    uint _2378 = uint(int(uint(_2376) >> uint(2)));
    int _2380 = _2376 & 3;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[int(_2378)][_2380];
    int _2384 = _2278 ? 0 : 1;
    float _2386 = fma(_2350, _2244, _2358);
    int _2388 = ~_2268;
    int _2390 = _2388 + _2332;
    int _2392 = _2390 + 1;
    float _2394 = fma(_2318, _2244, _2360);
    int _2396 = ~_2384;
    int _2398 = _2396 + 1;
    int _2400 = _2398 + 1;
    float _2402 = _836 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2404 = uint(_2352) >= 2u;
    int _2406 = _384 * _2392;
    int _2408 = _2406 + _1876;
    bool _2410 = !_2354;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2402);
    int _2416 = _2400;
    if (!_2362)
    {
        int _2418 = ~_2384;
        int _2420 = _2418 + 1;
        _2416 = _2420;
    }
    int _2422 = _2416;
    float _2424 = _842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2426 = _2352 != 3;
    float _2428 = _842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2430 = abs(_2422);
    float _2432 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2414);
    int _2434 = _2404 ? 0 : 1;
    float _2436 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2424);
    int _2438 = abs(_2412);
    float _2440 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    int _2442 = ~_2434;
    int _2444 = _2442 + 1;
    int _2446 = _2444 + 1;
    float _2448 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2428);
    bool _2450 = _2352 != 3;
    float _2452 = _1762 * _1668;
    int _2454 = ~_2430;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    float _2460 = fma(_2432, _2244, _2364);
    int _2462 = _2446;
    if (_2426)
    {
        int _2464 = ~_2434;
        int _2466 = _2464 + 1;
        _2462 = _2466;
    }
    int _2468 = _2462;
    float _2470 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2436);
    float _2472 = fma(_2440, _2252, _2386);
    float _2474 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2448);
    bool _2476 = !_2450;
    int _2478 = _2476 ? 0 : (-1);
    float _2480 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    int _2484 = abs(_2468);
    bool _2486 = !_1697;
    int _2488 = _2486 ? _2408 : (-1);
    float _2490 = _1689 * _2452;
    int _2492 = ~_2438;
    int _2494 = _2492 + 1;
    int _2496 = _2494 + 1;
    int _2498 = _2458 * as_type<int>(_2348);
    bool _2500 = !_1942;
    int _2502 = _2500 ? 0 : 1;
    float _2504 = fma(_2470, _2252, _2394);
    int _2506 = abs(_2478);
    int _2508 = _2496 * as_type<int>(_2340);
    int _2510 = _2508 + _2498;
    float _2512 = _1636 + _1586;
    float _2514 = fma(_2474, _2252, _2460);
    int _2516 = abs(_2502);
    float _2518 = _2512 * 0.5;
    int _2520 = ~_2484;
    int _2522 = _2520 + 1;
    int _2524 = _2522 + 1;
    float _2526 = fma(_2482, -2.0, 3.0);
    float _2528 = _2482 * _2482;
    int _2530 = _2524 * as_type<int>(_2374);
    int _2532 = _2530 + _2510;
    int _2534 = ~_2506;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    float _2540 = _2528 * _2526;
    float _2542 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2544 = ~_2516;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    float _2550 = fma(_1679, _2490, _1677);
    int _2552 = _2538 * as_type<int>(_2382);
    int _2554 = _2552 + _2532;
    float _2556 = -_2540;
    float _2558 = _2556 + 1.0;
    float _2560 = in.m_85.x;
    float _2562 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2542);
    int _2564 = _2554 * _2548;
    float _2566 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2540);
    float _2568 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2562);
    int _2570 = _2488 * _2516;
    int _2572 = _2570 + _2564;
    float _2574 = _1745 * _2566;
    float _2576 = _1586 * 0.5;
    float _2578 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2568);
    float _2580 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2582 = float(_2572);
    float _2584 = _2578 + _1586;
    out.gl_Position.x = _1636;
    out.gl_Position.y = _1638;
    out.gl_Position.z = _2578;
    out.gl_Position.w = _1586;
    float _2586 = _2286 * _2580;
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = fma(_1638, -0.5, _2576);
    float _2592 = _2584 * 0.5;
    out.m_87.x = _2582;
    float _2594 = -_2588;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2598 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2600 = isnan(_1392);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2606 = _2602 || _2604;
    out.m_89.x = _2518;
    out.m_89.y = _2590;
    out.m_89.z = _2592;
    out.m_89.w = _1586;
    float _2608 = _2596 * _2560;
    float _2610 = _1679 * _2452;
    out.m_91.x = _2472;
    out.m_91.y = _2504;
    out.m_91.z = _2514;
    float _2612 = -_1762;
    float _2614 = _2612 + 1.0;
    float _2616 = _2608 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2618 = fma(_1685, _2610, _1673);
    float _2620 = fma(_1687, _2610, _1675);
    float _2622 = _1679 * _2614;
    float _2624 = _1296 * _1352;
    out.m_93.x = _2616;
    float _2626 = _2560;
    float _2628 = _2610;
    float _2630 = _2578;
    float _2632 = _2624;
    if (!_2606)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2634 = _2626;
    float _2636 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2618;
    out.m_95.y = _2620;
    out.m_95.z = _2550;
    out.m_95.w = _2622;
    float _2638 = _2634;
    float _2640 = _2634;
    if (!_2606)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2642 = _2628;
    float _2644 = _2642;
    float _2646 = _2642;
    if (!_2606)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2648 = _1932;
    float _2650 = _2648;
    float _2652 = _2648;
    if (!_2606)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2654 = _2630;
    float _2656 = _2654;
    float _2658 = _2654;
    if (!_2606)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2660 = _1934;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2606)
    {
        _2632 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2666 = _2632;
    bool _2668 = !_2606;
    float _2670 = _2666;
    float _2672 = _2666;
    if (!_2668)
    {
        bool _2674 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2676 = isnan(_1392);
        bool _2678 = _2674 || _2676;
        bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2682 = _2678 || _2680;
        if (!_2682)
        {
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2686 = _1392 + _2684;
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2690 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2688;
            float _2692 = 1.0 / _2690;
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2714 = _2686 * _2692;
            float _2716 = precise::clamp(_2714, 0.0, 1.0);
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2722 = fma(_2716, _2696, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2724 = fma(_2716, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2726 = fma(_2716, _2700, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2728 = fma(_2716, _2704, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2730 = fma(_2716, _2708, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2732 = fma(_2716, _2712, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2646 = _2724;
            _2664 = _2730;
            _2640 = _2722;
            _2658 = _2728;
            _2652 = _2726;
            _2672 = _2732;
            _2734 = true;
        }
        else
        {
            bool _2736 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2738 = isnan(_1392);
            bool _2740 = _2736 || _2738;
            bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2744 = _2740 || _2742;
            if (!_2744)
            {
                _2638 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2746 = _2638;
            _2640 = _2746;
            if (!_2744)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2748 = _2644;
            _2646 = _2748;
            if (!_2744)
            {
                _2650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2750 = _2650;
            _2652 = _2750;
            if (!_2744)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2752 = _2656;
            _2658 = _2752;
            if (!_2744)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2754 = _2662;
            _2664 = _2754;
            if (!_2744)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2756 = _2670;
            bool _2758 = !_2744;
            _2672 = _2756;
            if (!_2758)
            {
                bool _2760 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2762 = isnan(_1392);
                bool _2764 = _2760 || _2762;
                bool _2766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2768 = _2764 || _2766;
                if (!_2768)
                {
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2772 = _1392 + _2770;
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2774;
                    float _2778 = 1.0 / _2776;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2800 = _2772 * _2778;
                    float _2802 = precise::clamp(_2800, 0.0, 1.0);
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2808 = fma(_2802, _2782, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2810 = fma(_2802, _2806, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2812 = fma(_2802, _2786, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2814 = fma(_2802, _2790, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2816 = fma(_2802, _2794, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2818 = fma(_2802, _2798, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2646 = _2810;
                    _2664 = _2816;
                    _2640 = _2808;
                    _2658 = _2814;
                    _2652 = _2812;
                    _2672 = _2818;
                    _2734 = true;
                }
                else
                {
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2640 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2734 = false;
    float _2820 = _2646;
    float _2822 = _2664;
    float _2824 = _2640;
    float _2826 = _2658;
    float _2828 = _2652;
    float _2830 = _2672;
    float _2832 = fma(_2504, -0.5, 0.5);
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = -_2820;
    float _2838 = _2836 + _2822;
    float _2840 = _2636 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2842 = -_2824;
    float _2844 = _2842 + _2826;
    float _2846 = fma(_2834, _2838, _2820);
    out.m_97.x = 0.0;
    float _2848 = -_2828;
    float _2850 = _2848 + _2830;
    float _2852 = fma(_2834, _2844, _2824);
    float _2854 = _2846 * 0.586610972881317138671875;
    out.m_53.x = _2840;
    bool _2856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2858 = fma(_2834, _2850, _2828);
    float _2860 = fma(_2852, 0.298911988735198974609375, _2854);
    bool _2862 = _1296 > 0.0;
    bool _2864 = isnan(_1296);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan(0.0);
    bool _2870 = _2866 || _2868;
    float _2872 = fma(_2858, 0.114477999508380889892578125, _2860);
    bool _2874 = _1352 <= 0.0;
    bool _2876 = !_2870;
    bool _2878 = _2874 || _2876;
    float _2880 = -_2872;
    float _2882 = _2852 + _2880;
    float _2884 = -_2872;
    float _2886 = _2846 + _2884;
    float _2888 = -_2872;
    float _2890 = _2858 + _2888;
    float _2892 = fma(_2882, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2894 = fma(_2886, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2896 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    bool _2898 = !_2856;
    if (!_2898)
    {
        float _2900 = -_1234;
        float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2904 = -_1236;
        float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2908 = -_1238;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2912 = _2902 * _2902;
        float _2914 = fma(_2906, _2906, _2912);
        float _2916 = fma(_2910, _2910, _2914);
        float _2918 = sqrt(_2916);
        float _2920 = rsqrt(_2916);
        float _2922 = -_2918;
        float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2926 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2928 = precise::clamp(_2926, 0.0, 1.0);
        float _2930 = _2906 * _2920;
        float _2932 = _2902 * _2920;
        float _2934 = abs(_2928);
        float _2936 = log2(_2934);
        float _2938 = _2910 * _2920;
        float _2940 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2942 = _2504 * _2932;
        float _2944 = -_2932;
        float _2946 = -_2940;
        float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2946);
        float _2950 = fma(_2472, _2930, _2942);
        float _2952 = -_2938;
        float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2948);
        float _2956 = fma(_2514, _2938, _2950);
        float _2958 = precise::clamp(_2956, 0.0, 1.0);
        float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2962 = _2954 + _2960;
        float _2964 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2966 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = exp2(_2964);
        float _2972 = _2970 * _2968;
        float _2974 = _2958 * _2972;
        float _2976 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2978 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2980 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2976;
        out.m_97.y = _2978;
        out.m_97.z = _2980;
    }
    out.m_67.x = _2892;
    out.m_67.y = _2894;
    out.m_67.z = _2896;
    if (!_2878)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2982 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2982;
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2734 = false;
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
        float _3051 = as_type<float>(_140);
        out.gl_Position.z = _3051;
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
        float _3106 = as_type<float>(_166);
        out.gl_Position.z = _3106;
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
    float _388 = _340 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _390 = _340 * 2.0;
    float _392 = exp2(_378);
    float _394 = fma(_386, -2.0, _358);
    float _396 = _342 * 2.0;
    float _398 = -_380;
    float _400 = fma(_388, 2.0, _398);
    float _402 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _404 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _406 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _408 = _342 + _340;
    float _410 = floor(_396);
    float _412 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _402);
    float _414 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _406);
    float _416 = _408 + (-1.0);
    float _418 = _360 * 2.0;
    float _420 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _404);
    float _422 = _342 + _360;
    float _424 = floor(_390);
    float _426 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _428 = float(_364);
    float _430 = _422 + (-1.0);
    float _432 = -_392;
    float _434 = _432 + 1.0;
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = -_122;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _400);
    float _450 = floor(_418);
    bool _452 = _410 > 0.0;
    float _454 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _456 = _410 >= 0.0;
    bool _458 = isnan(_410);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _468 = 1.0 + _466;
    float _470 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    float _472 = _376 ? _434 : 0.0;
    float _474 = 1.0 / _428;
    bool _476 = _424 > 0.0;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _480 = _424 >= 0.0;
    bool _482 = isnan(_424);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _420);
    float _492 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[78].z, _478);
    float _494 = float(_384);
    float _496 = 1.0 / _468;
    bool _498 = _450 > 0.0;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _502 = _450 >= 0.0;
    bool _504 = isnan(_450);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = _494 * _122;
    float _514 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _492);
    float _516 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _500);
    int _518 = _488 ? 0 : 1;
    float _520 = _474 * _122;
    float _522 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _524 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _516);
    int _526 = ~_518;
    int _528 = _526 + 1;
    int _530 = _528 + 1;
    float _532 = _490 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _534 = _530;
    float _536 = _338;
    if (!_476)
    {
        int _538 = ~_518;
        int _540 = _538 + 1;
        _534 = _540;
    }
    int _542 = _534;
    float _544 = _522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _546 = _464 ? 0 : 1;
    if (_444)
    {
        float _548 = _472 * _496;
        _132 = _548;
    }
    float _550 = _132;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _558 = _556 != 0;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _562 = _560 != 0;
    float _564 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    int _566 = ~_546;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _574 = _544 + _572;
    int _576 = _570;
    if (!_452)
    {
        int _578 = ~_546;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = _564 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _586 = !_558;
    int _588 = _586 ? 0 : 1;
    float _590 = in.m_61.x;
    float _592 = in.m_61.y;
    float _594 = in.m_61.z;
    bool _596 = !_554;
    int _598 = _596 ? 0 : 1;
    bool _600 = !_562;
    int _602 = _600 ? 0 : 1;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = float(_542);
    int _618 = _510 ? 0 : 1;
    bool _620 = !_606;
    int _622 = _620 ? 0 : 1;
    bool _624 = !_610;
    int _626 = _624 ? 0 : 1;
    int _628 = abs(_622);
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _632 = _532 + _630;
    int _634 = abs(_626);
    int _636 = ~_618;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = _632 * _632;
    float _644 = float(_634);
    float _646 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _648 = _584 + _646;
    int _650 = _640;
    if (!_498)
    {
        int _652 = ~_618;
        int _654 = _652 + 1;
        _650 = _654;
    }
    int _656 = _650;
    float _658 = fma(_574, _574, _642);
    float _660 = _644 * _616;
    float _662 = float(_628);
    float _664 = fma(_648, _648, _658);
    float _666 = float(_656);
    float _668 = _660 * (-2.0);
    bool _670 = !_614;
    int _672 = _670 ? 0 : 1;
    float _674 = sqrt(_664);
    float _676 = _342 + (-0.5);
    float _678 = fma(_668, _592, _592);
    float _680 = fma(_454, _668, _454);
    int _682 = abs(_672);
    float _684 = _662 * _666;
    float _686 = float(_582);
    float _688 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].y, _678);
    float _690 = rsqrt(_664);
    float _692 = _360 + _340;
    float _694 = _684 * (-2.0);
    float _696 = float(_682);
    float _698 = _692 + (-1.0);
    float _700 = fma(_680, _550, _688);
    float _702 = _674 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _704 = fma(_694, _590, _590);
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _708 = _696 * _686;
    float _710 = _340 + (-0.5);
    float _712 = precise::min(_366, _702);
    float _714 = fma(_426, _694, _426);
    float _716 = _708 * (-2.0);
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].x, _704);
    float _720 = _360 + (-0.5);
    float _722 = _690 * _712;
    float _724 = fma(_706, _716, _706);
    float _726 = fma(_716, _594, _594);
    float _728 = fma(_714, _550, _718);
    float _730 = _632 * _722;
    float _732 = _574 * _722;
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[196].z, _726);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = -_730;
    float _740 = _632 + _738;
    float _742 = -_732;
    float _744 = _574 + _742;
    float _746 = fma(_724, _550, _734);
    float _748 = _648 * _722;
    float _750 = _740 * _740;
    float _752 = _700 * 0.15915493667125701904296875;
    float _754 = _736 * 6.283185482025146484375;
    float _756 = sin(_754);
    float _758 = -_748;
    float _760 = _648 + _758;
    float _762 = fma(_744, _744, _750);
    float _764 = fma(_760, _760, _762);
    float _766 = in.m_63.x;
    float _768 = in.m_63.y;
    float _770 = in.m_63.z;
    float _772 = _752 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = sqrt(_764);
    float _778 = _752 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = _736 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _746 * 0.15915493667125701904296875;
    float _788 = _690 * _776;
    float _790 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _792 = _756 * _774;
    float _794 = _348 * _788;
    float _796 = _790 * _788;
    float _798 = _786 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _768);
    float _804 = _756 * _780;
    float _806 = _356 * _788;
    float _808 = _796 * _802;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _770);
    float _812 = _786 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _784 * _780;
    float _818 = _784 * _774;
    float _820 = _756 * _800;
    float _822 = _780 * _800;
    float _824 = _784 * _800;
    float _826 = _774 * _800;
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _766);
    float _830 = _806 * _810;
    float _832 = _820 * _808;
    float _834 = _794 * _828;
    float _836 = fma(_814, _816, _792);
    float _838 = _824 * _808;
    float _840 = -_804;
    float _842 = fma(_814, _818, _840);
    float _844 = -_808;
    float _846 = _814 * _844;
    float _848 = -_818;
    float _850 = fma(_814, _804, _848);
    float _852 = fma(_836, _834, _838);
    float _854 = fma(_814, _792, _816);
    float _856 = fma(_822, _834, _846);
    float _858 = fma(_850, _834, _832);
    float _860 = fma(_842, _830, _852);
    float _862 = fma(_826, _830, _856);
    float _864 = fma(_854, _830, _858);
    float _866 = _860 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _868 = _860 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _870 = _860 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _872 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].x, _866);
    float _874 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].x, _868);
    float _876 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].x, _870);
    float _878 = -_730;
    float _880 = _532 + _878;
    float _882 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _872);
    float _884 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _874);
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _876);
    float _888 = -_732;
    float _890 = _544 + _888;
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _894 = _884 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _896 = _886 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _898 = -_748;
    float _900 = _584 + _898;
    float _902 = _584 + _892;
    float _904 = _544 + _894;
    float _906 = _532 + _896;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _910 = _902 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _904 + _912;
    float _916 = _910 * _910;
    float _918 = fma(_914, _914, _916);
    float _920 = _880 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _922 = sqrt(_918);
    float _924 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[11].x, _920);
    float _926 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[11].z, _924);
    bool _928 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = _896;
    float _932 = _886;
    float _934 = _904;
    float _936 = _730;
    float _938 = _732;
    float _940 = _748;
    if (!_928)
    {
        _930 = _904;
    }
    float _942 = _930;
    float _944 = _942;
    if (!_928)
    {
        _932 = _902;
    }
    float _946 = _932;
    float _948 = _946;
    if (!_928)
    {
        _934 = _906;
    }
    float _950 = _934;
    bool _952 = !_928;
    float _954 = _950;
    if (!_952)
    {
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _960 = _922 + _958;
        float _962 = rsqrt(_918);
        float _964 = _960 * _956;
        float _966 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _968 = _964 * 0.15915493667125701904296875;
        float _970 = _968 * 6.283185482025146484375;
        float _972 = cos(_970);
        float _974 = _968 * 6.283185482025146484375;
        float _976 = sin(_974);
        float _978 = _972 + (-1.0);
        float _980 = fma(_976, _966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _982 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = _962 * _980;
        float _986 = fma(_906, _972, _982);
        float _988 = fma(_914, _984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _990 = fma(_910, _984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _954 = _986;
        _944 = _988;
        _948 = _990;
    }
    float _992 = _954;
    float _994 = _944;
    float _996 = _948;
    float _998 = -_532;
    float _1000 = _998 + _992;
    float _1002 = -_544;
    float _1004 = _1002 + _994;
    float _1006 = _926 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1008 = _880 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1010 = _1000 * _1000;
    float _1012 = -_584;
    float _1014 = _1012 + _996;
    float _1016 = 1.0 / _1006;
    float _1018 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1008);
    float _1020 = fma(_1004, _1004, _1010);
    float _1022 = -_732;
    float _1024 = _1022 + _994;
    float _1026 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1018);
    float _1028 = fma(_1014, _1014, _1020);
    float _1030 = -_730;
    float _1032 = _1030 + _992;
    float _1034 = -_748;
    float _1036 = _1034 + _996;
    float _1038 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1040 = sqrt(_1028);
    bool _1042 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1044 = isnan(0.5);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1050 = _1046 || _1048;
    float _1052 = _1038 + _1006;
    bool _1054 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1062 = _1058 || _1060;
    float _1064 = _1052 * _1016;
    float _1066 = _1064 * 0.5;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1070 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1068);
    float _1072 = 1.0 / _1070;
    bool _1074 = _1040 > 0.0;
    float _1076 = _1040;
    float _1078 = _994;
    float _1080 = _1004;
    float _1082 = _1016;
    float _1084 = _1036;
    float _1086 = _1070;
    float _1088 = _1032;
    if (!_1074)
    {
        _936 = _1024;
    }
    float _1090 = _936;
    float _1092 = _1090;
    if (!_1074)
    {
        _938 = _1032;
    }
    float _1094 = _938;
    float _1096 = _1094;
    if (!_1074)
    {
        _1076 = _1036;
    }
    float _1098 = _1076;
    bool _1100 = !_1074;
    float _1102 = _1098;
    float _1104 = _1098;
    if (!_1100)
    {
        float _1106 = _194 * _194;
        float _1108 = rsqrt(_1028);
        float _1110 = fma(_192, _192, _1106);
        float _1112 = fma(_196, _196, _1110);
        float _1114 = sqrt(_1112);
        float _1116 = _1000 * _1108;
        float _1118 = _1004 * _1108;
        float _1120 = _1014 * _1108;
        bool _1122 = _1114 > 0.0;
        float _1124 = _1108;
        float _1126 = _1114;
        _1078 = _1118;
        if (!_1122)
        {
            _1124 = _1024;
        }
        float _1128 = _1124;
        _1092 = _1128;
        if (!_1122)
        {
            _1126 = _1032;
        }
        float _1130 = _1126;
        _1096 = _1130;
        if (!_1122)
        {
            _1102 = _1036;
        }
        float _1132 = _1102;
        bool _1134 = !_1122;
        _1104 = _1132;
        if (!_1134)
        {
            float _1136 = rsqrt(_1112);
            float _1138 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1140 = _194 * _1136;
            float _1142 = _192 * _1136;
            float _1144 = _1116 * _1140;
            float _1146 = _196 * _1136;
            float _1148 = fma(_1118, _1142, _1144);
            float _1150 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1152 = fma(_1120, _1146, _1148);
            float _1154 = _1152 * _1150;
            float _1156 = fma(_192, _1154, _1024);
            float _1158 = fma(_194, _1154, _1032);
            float _1160 = fma(_196, _1154, _1036);
            _1092 = _1156;
            _1096 = _1158;
            _1104 = _1160;
            _1080 = _1154;
        }
    }
    float _1162 = _1092;
    float _1164 = _1096;
    float _1166 = _1104;
    float _1168 = _1078;
    float _1170 = _1080;
    float _1172 = _1170;
    float _1174 = _1164;
    float _1176 = _1162;
    float _1178 = _1166;
    if (_1062)
    {
        _1172 = 1.0;
    }
    float _1180 = _1172;
    float _1182 = _1180;
    if (!_1050)
    {
        float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1186 = _880 + _1184;
        float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1190 = _890 + _1188;
        float _1192 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1194 = _1186 * _1186;
        float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1198 = _900 + _1196;
        float _1200 = fma(_1190, _1190, _1194);
        float _1202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1204 = fma(_1198, _1198, _1200);
        float _1206 = sqrt(_1204);
        float _1208 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1210 = precise::min(_1206, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1212 = _1210 * _1202;
        float _1214 = -_890;
        float _1216 = _1214 + _1162;
        float _1218 = _1208 * _1212;
        float _1220 = -_880;
        float _1222 = _1220 + _1164;
        float _1224 = -_900;
        float _1226 = _1224 + _1166;
        float _1228 = fma(_1216, _1218, _890);
        float _1230 = fma(_1222, _1218, _880);
        float _1232 = fma(_1226, _1218, _900);
        _1174 = _1230;
        _1176 = _1228;
        _1178 = _1232;
    }
    float _1234 = _1174;
    float _1236 = _1176;
    float _1238 = _1178;
    if (_1062)
    {
        _1082 = 1.0;
    }
    float _1240 = _1082;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1244 = _1072 * _1242;
    float _1246 = _1240;
    if (!_1062)
    {
        float _1248 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = _1248 * 0.15915493667125701904296875;
        float _1252 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1254 = _1250 * 6.283185482025146484375;
        float _1256 = cos(_1254);
        float _1258 = _1252 * 0.15915493667125701904296875;
        float _1260 = _1250 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        float _1264 = 1.0 / _1256;
        float _1266 = _1258 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        float _1270 = _1262 * _1264;
        float _1272 = _1258 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = 1.0 / _1276;
        float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1282 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1280;
        float _1284 = 1.0 / _1282;
        float _1286 = _1274 * _1278;
        float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1290 = fma(_1244, _1286, _1288);
        float _1292 = _1290 * _1284;
        float _1294 = precise::clamp(_1292, 0.0, 1.0);
        _1182 = _1294;
    }
    float _1296 = _1182;
    if (!_1062)
    {
        float _1298 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1300 = _1298 * 0.15915493667125701904296875;
        float _1302 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = cos(_1304);
        float _1308 = _1302 * 0.15915493667125701904296875;
        float _1310 = _1300 * 6.283185482025146484375;
        float _1312 = sin(_1310);
        float _1314 = 1.0 / _1306;
        float _1316 = _1308 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        float _1320 = _1312 * _1314;
        float _1322 = _1308 * 6.283185482025146484375;
        float _1324 = sin(_1322);
        float _1326 = _1318 * _1320;
        float _1328 = 1.0 / _1326;
        float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1332 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1330;
        float _1334 = 1.0 / _1332;
        float _1336 = _1324 * _1328;
        float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1340 = fma(_1244, _1336, _1338);
        float _1342 = _1340 * _1334;
        float _1344 = precise::clamp(_1342, 0.0, 1.0);
        float _1346 = -_1344;
        float _1348 = _1346 + 1.0;
        _1084 = _1328;
        _1246 = _1348;
    }
    float _1350 = _1084;
    float _1352 = _1246;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1356 = _1234 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1360 = _1236 + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1364 = _1238 + _1362;
    float _1366 = _1356 * _1356;
    float _1368 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1370 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1372 = fma(_1360, _1360, _1366);
    float _1374 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1368);
    float _1376 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1370);
    float _1378 = fma(_1364, _1364, _1372);
    float _1380 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1374);
    float _1382 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1376);
    float _1384 = rsqrt(_1378);
    float _1386 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1388 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1390 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1392 = sqrt(_1378);
    float _1394 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1360 * _1394;
    float _1398 = _1364 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 + _1402;
    float _1406 = sqrt(_1404);
    bool _1408 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1406 + _1410;
    float _1414 = _1168;
    float _1416 = _1404;
    float _1418 = _1412;
    float _1420 = _1396;
    float _1422 = _1398;
    float _1424 = _1400;
    float _1426 = _1402;
    if (_1408)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1428;
    }
    float _1430 = _1414;
    if (_1408)
    {
        float _1432 = rsqrt(_1404);
        _1416 = _1432;
    }
    float _1434 = _1416;
    if (_1408)
    {
        float _1436 = _1412 * _1430;
        _1418 = _1436;
    }
    float _1438 = _1418;
    if (_1408)
    {
        float _1440 = _1438 * 0.15915493667125701904296875;
        _1086 = _1440;
    }
    float _1442 = _1086;
    float _1444 = _1430;
    if (_1408)
    {
        float _1446 = _1442 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1454 = precise::max(0.0, _1452);
    float _1456 = _1350;
    if (_1408)
    {
        float _1458 = _1442 * 6.283185482025146484375;
        float _1460 = cos(_1458);
        _1456 = _1460;
    }
    float _1462 = _1456;
    float _1464 = -_1394;
    float _1466 = -_1454;
    float _1468 = fma(_1356, _1464, _1466);
    if (_1408)
    {
        float _1470 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _940 = _1470;
    }
    float _1472 = _940;
    float _1474 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1476 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1478 = _1472;
    float _1480 = _1450;
    if (_1408)
    {
        float _1482 = fma(_1450, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1482;
    }
    float _1484 = _1478;
    float _1486 = _1484;
    if (!_1408)
    {
        _1480 = _1468;
    }
    float _1488 = _1480;
    float _1490 = floor(_1476);
    float _1492 = _1488;
    if (_1408)
    {
        float _1494 = _1462 + (-1.0);
        _1088 = _1494;
    }
    float _1496 = _1088;
    float _1498 = _1496;
    if (_1408)
    {
        float _1500 = _1434 * _1484;
        _1486 = _1500;
    }
    float _1502 = _1486;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1506 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1504);
    float _1508 = precise::clamp(_1506, 0.0, 1.0);
    if (_1408)
    {
        float _1510 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1498 = _1510;
    }
    float _1512 = _1498;
    if (_1408)
    {
        float _1514 = _1396 * _1502;
        _1420 = _1514;
    }
    float _1516 = _1420;
    if (_1408)
    {
        float _1518 = _1398 * _1502;
        _1422 = _1518;
    }
    float _1520 = _1422;
    if (_1408)
    {
        float _1522 = fma(_1468, _1462, _1512);
        _1492 = _1522;
    }
    float _1524 = _1492;
    if (_1408)
    {
        float _1526 = _1516 * _1516;
        _1424 = _1526;
    }
    float _1528 = _1424;
    if (_1408)
    {
        float _1530 = _1520 * _1520;
        _1426 = _1530;
    }
    float _1532 = _1426;
    float _1534 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1474);
    float _1536 = -_1508;
    float _1538 = _1536 + 1.0;
    float _1540 = fma(_1524, _1524, _1528);
    float _1542 = fma(_900, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1544 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1546 = _1540 + _1532;
    float _1548 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1534);
    float _1550 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1544);
    float _1552 = abs(_1538);
    float _1554 = log2(_1552);
    float _1556 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1558 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1560 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1550);
    float _1562 = -_1390;
    float _1564 = fma(_1562, _1556, 1.0);
    float _1566 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1568 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1570 = rsqrt(_1546);
    float _1572 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1574 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1572);
    float _1576 = floor(_1542);
    float _1578 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1574);
    float _1580 = _1570 * _1516;
    float _1582 = _1570 * _1524;
    float _1584 = _1570 * _1520;
    float _1586 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1578);
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1590 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1592 = log2(_1564);
    float _1594 = _1582 + 1.0;
    float _1596 = -_1588;
    float _1598 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1596);
    float _1600 = -_1576;
    float _1602 = _1542 + _1600;
    float _1604 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1566);
    float _1606 = -_1584;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1598);
    float _1610 = -_1490;
    float _1612 = _1476 + _1610;
    float _1614 = 1.0 / _1586;
    float _1616 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1618 = fma(_1608, -0.5, 0.5);
    float _1620 = fma(_1608, 0.5, 0.5);
    float _1622 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1624 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1616);
    float _1626 = fma(_1620, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1628 = exp2(_1590);
    float _1630 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1624);
    float _1632 = _1592 * 0.693147182464599609375;
    float _1634 = fma(_1620, _1626, -0.212114393711090087890625);
    float _1636 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1638 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1622);
    float _1640 = fma(_1620, _1634, 1.570728778839111328125);
    float _1642 = sqrt(_1618);
    float _1644 = _1636 * _1614;
    float _1646 = _1638 * _1614;
    float _1648 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1650 = fma(_1646, -0.5, 0.5);
    float _1652 = -_1582;
    float _1654 = fma(_1628, _1594, _1652);
    float2 _5414 = float2(_1612, _1602);
    float _1656 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5414, float2(0.0), isnan(_5414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5414, float2(0.0), isnan(_5414)), level(0.0)).x;
    float _1658 = fma(_1654, 0.5, 0.5);
    float _1660 = _1642 * 0.636619746685028076171875;
    float _1662 = fma(_1644, 0.5, 0.5);
    float _1664 = -_1640;
    float _1666 = fma(_1660, _1664, 1.0);
    float3 _5437 = float3(_1662, _1650, _1648);
    float _1668 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5437, float3(0.0), isnan(_5437)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5437, float3(0.0), isnan(_5437)), level(0.0)).x;
    float3 _5448 = float3(_1662, _1650, _1648);
    float4 _1671 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5448, float3(0.0), isnan(_5448)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5448, float3(0.0), isnan(_5448)), level(0.0)).xyzw;
    float _1673 = _1671.x;
    float _1675 = _1671.y;
    float _1677 = _1671.z;
    float _1679 = _1671.w;
    float2 _5464 = float2(_1666, _1658);
    float3 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5464, float2(0.0), isnan(_5464)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5464, float2(0.0), isnan(_5464)), level(0.0)).xyz;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = float(uint(_384));
    float _1693 = trunc(_520);
    int _1695 = int(_1693);
    bool _1697 = _384 == 0;
    float _1699 = _512 * _174;
    int _1701 = abs(_588);
    out.m_65.x = _890;
    out.m_65.y = _880;
    out.m_65.z = _900;
    int _1703 = abs(_598);
    float _1705 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1707 = 1.0 / _1691;
    int _1709 = ~_384;
    int _1711 = _1709 + 1;
    out.m_67.w = _712;
    int _1713 = _384 + (-1);
    out.m_69.x = _794;
    float _1715 = float(uint(_1695));
    float _1717 = trunc(_1699);
    int _1719 = int(_1717);
    out.m_71.x = _1236;
    out.m_71.y = _1234;
    out.m_71.z = _1238;
    int _1721 = as_type<int>(_1707) + (-2);
    float _1723 = abs(_1244);
    float _1725 = log2(_1723);
    float _1727 = as_type<float>(_1721) * _1715;
    int _1729 = ~_384;
    int _1731 = _1729 + 1;
    float _1733 = exp2(_1705);
    bool _1735 = _1244 <= 8000.0;
    bool _1737 = isnan(_1244);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan(8000.0);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = trunc(_1727);
    float _1749 = precise::max(_1747, 0.0);
    uint _1752 = uint(_1749);
    float _1754 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1756 = exp2(_1754);
    float _1758 = -_1733;
    float _1760 = _1758 + 1.0;
    float _1762 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1764 = _1711 * int(_1752);
    int _1766 = _1764 + _1695;
    float _1768 = float(uint(_1766));
    float _1770 = as_type<float>(_1721) * _1768;
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1774 = _1772 != 0;
    float _1776 = trunc(_1770);
    float _1778 = precise::max(_1776, 0.0);
    uint _1780 = uint(_1778);
    bool _1782 = !_1774;
    float _1784 = _1782 ? 7.345489978790283203125 : 1.0;
    float _1786 = _1784 * _340;
    float _1788 = float(_1695);
    float _1790 = floor(_1786);
    bool _1792 = _1788 >= _494;
    bool _1794 = isnan(_1788);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan(_494);
    bool _1800 = _1796 || _1798;
    float _1802 = float(_1800);
    int _1804 = int(_1752) + int(_1780);
    float _1806 = trunc(_1802);
    int _1808 = int(_1806);
    int _1810 = _1731 * _1804;
    int _1812 = _1810 + _1695;
    bool _1814 = uint(_1812) >= uint(_384);
    float _1816 = -_1790;
    float _1818 = _1786 + _1816;
    bool _1820 = !_1814;
    int _1822 = _1820 ? 0 : (-1);
    float _1824 = _1818 * _494;
    int _1826 = ~_1804;
    int _1828 = _1826 + _1822;
    int _1830 = _1828 + 1;
    int _1832 = ~_1808;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    float _1838 = trunc(_1824);
    int _1840 = int(_1838);
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1844 = _1842 != 0;
    int _1846 = _384 * _1830;
    int _1848 = _1846 + _1695;
    int _1850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1852 = _1850 != 0;
    bool _1854 = !_1844;
    int _1856 = _1854 ? 0 : 1;
    bool _1858 = !_1697;
    int _1860 = _1858 ? _1848 : (-1);
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1864 = _1862 != 0;
    int _1866 = abs(_1856);
    int _1868 = _1860 * _1836;
    int _1870 = _1808 * _1713;
    int _1872 = _1870 + _1868;
    int _1874 = _1840 * _1866;
    int _1876 = _1874 + _1695;
    bool _1878 = !_1864;
    int _1880 = _1878 ? 0 : 1;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1884 = _1882 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1886 = abs(_602);
    int _1888 = _1872 * _1701;
    int _1890 = _1719 * _1703;
    int _1892 = _1890 + _1888;
    int _1894 = abs(_1880);
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1900 = _1876 * _1886;
    int _1902 = _1900 + _1892;
    float _1904 = 1.0 / _1884;
    float _1906 = in.m_73.y;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1912 = _1840 * _1894;
    int _1914 = _1912 + _1902;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1916 = 1.0 / _1898;
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1920 = _1918 != 0;
    bool _1922 = _342 > 0.5;
    float _1924 = 1.0 / _1910;
    float _1926 = float(uint(_1914));
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1932 = _1586;
    float _1934 = _1638;
    if (_1852)
    {
        float _1936 = in.m_57.x;
        _1930 = _1936;
    }
    float _1938 = _1930;
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1942 = _1940 != 0;
    float _1944 = as_type<float>(_1721) * _1926;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1948;
    float _1952 = in.m_73.x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1956 = -_1906;
    float _1958 = _1956 + 1.0;
    float _1960 = trunc(_1944);
    float _1962 = precise::max(_1960, 0.0);
    uint _1964 = uint(_1962);
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1968 = _1950 * _1904;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1972 = _1970 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1974 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1906;
    if (_1920)
    {
        float _1982 = _1922 ? _1958 : _1906;
        _1980 = _1982;
    }
    float _1984 = _1980;
    float _1986 = _1972 * _1916;
    int _1988 = ~_384;
    int _1990 = _1988 + 1;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1992;
    bool _1996 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1998 = isnan(_338);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    out.m_77.x = _1974;
    out.m_77.y = _1976;
    out.m_77.z = _1978;
    out.m_77.w = _1966;
    bool _2008 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2010 = isnan(_338);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2016 = _2012 || _2014;
    float _2018 = float(_2016);
    float _2020 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2022 = _1938 > 0.5;
    bool _2024 = _2022 && _1852;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2028 = _338 + _2026;
    float _2030 = float(uint(_1876));
    float _2032 = -_470;
    float _2034 = fma(_524, _2020, _2032);
    float _2036 = as_type<float>(_1721) * _2030;
    int _2038 = _1990 * int(_1964);
    int _2040 = _2038 + _1914;
    float _2042 = _1994 * _1924;
    bool _2044 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2046 = isnan(_338);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    float _2056 = -_2006;
    float _2058 = _2056 + 1.0;
    bool _2060 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2062 = isnan(_338);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2068 = _2064 || _2066;
    float _2070 = float(_2068);
    float _2072 = -_2018;
    float _2074 = _2072 + 1.0;
    float _2076 = float(uint(_2040));
    float _2078 = _2054 * _2058;
    float _2080 = -_2054;
    float _2082 = _2080 + 1.0;
    float _2084 = fma(_1968, _2028, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2086 = _2028;
    if (_1852)
    {
        _2086 = _1952;
    }
    float _2088 = _2086;
    float _2090 = as_type<float>(_1721) * _2076;
    float _2092 = _2070 * _2082;
    float _2094 = _2006 * _2074;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2098 = _338 + _2096;
    float _2100 = -_2070;
    float _2102 = _2100 + 1.0;
    float _2104 = trunc(_2090);
    float _2106 = precise::max(_2104, 0.0);
    uint _2108 = uint(_2106);
    float _2110 = _2084 * _2092;
    float _2112 = _2088;
    if (_2024)
    {
        float _2114 = -_2088;
        float _2116 = _2114 + 1.0;
        _2112 = _2116;
    }
    float _2118 = _2112;
    float _2120 = fma(_1986, _2098, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2122 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2124 = _338 + _2122;
    float _2126 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2110);
    if (!_1852)
    {
        _536 = _1952;
    }
    float _2128 = _536;
    float _2130 = trunc(_2036);
    float _2132 = precise::max(_2130, 0.0);
    uint _2134 = uint(_2132);
    float _2136 = _2128;
    if (_1852)
    {
        _2136 = _2118;
    }
    float _2138 = _2136;
    float _2140 = fma(_2042, _2124, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _2142 = ~_384;
    int _2144 = _2142 + 1;
    float _2146 = fma(_2120, _2078, _2126);
    int _2148 = ~_384;
    int _2150 = _2148 + 1;
    float _2152 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2154 = _768 != 0.0;
    bool _2156 = isnan(_768);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan(0.0);
    bool _2162 = _2158 || _2160;
    float _2164 = fma(_2140, _2094, _2146);
    int _2166 = int(_1964) + int(_2108);
    float _2168 = fma(_514, _2152, _448);
    float _2170 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2164);
    bool _2172 = _766 == 0.0;
    bool _2174 = !_2162;
    bool _2176 = _2172 && _2174;
    int _2178 = _2150 * _2166;
    int _2180 = _2178 + _1914;
    int _2182 = _2144 * int(_2134);
    int _2184 = _2182 + _1876;
    float _2186 = in.m_79.x;
    float _2188 = in.m_79.y;
    float _2190 = in.m_79.z;
    bool _2192 = _770 == 0.0;
    bool _2194 = _2192 && _2176;
    float _2196 = _2168 + 0.5;
    bool _2198 = uint(_2180) >= uint(_384);
    float _2200 = float(uint(_2184));
    bool _2202 = !_2198;
    int _2204 = _2202 ? 0 : (-1);
    float _2206 = as_type<float>(_1721) * _2200;
    int _2208 = ~_2166;
    int _2210 = _2208 + _2204;
    int _2212 = _2210 + 1;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2218 = _2034 + 0.5;
    float _2220 = trunc(_2206);
    float _2222 = precise::max(_2220, 0.0);
    uint _2224 = uint(_2222);
    float _2226 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2230 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2232 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_81.x = _2196;
    out.m_81.y = _2218;
    float _2234 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2236 = _2186;
    float _2238 = _2190;
    float _2240 = _2188;
    if (!_2194)
    {
        float _2242 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2186);
        _2236 = _2242;
    }
    float _2244 = _2236;
    int _2246 = _384 * _2212;
    int _2248 = _2246 + _1914;
    if (!_2194)
    {
        float _2250 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2190);
        _2238 = _2250;
    }
    float _2252 = _2238;
    int _2254 = ~_384;
    int _2256 = _2254 + 1;
    if (!_2194)
    {
        float _2258 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2188);
        _2240 = _2258;
    }
    float _2260 = _2240;
    float _2262 = _824 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2264 = !_1697;
    int _2266 = _2264 ? _2248 : (-1);
    out.m_83.x = _2226;
    out.m_83.y = _2230;
    out.m_83.z = _2234;
    out.m_83.w = _2232;
    int _2268 = int(_2134) + int(_2224);
    float _2270 = _824 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2272 = _2266 >> 31;
    float _2274 = _824 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2276 = _2266 & 3;
    bool _2278 = _2276 != 0;
    float _2280 = -_814;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2284 = -_1656;
    float _2286 = _2284 + 1.0;
    int _2288 = _2256 * _2268;
    int _2290 = _2288 + _1876;
    float _2292 = -_814;
    float _2294 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2262);
    int _2296 = _2272 & 3;
    float _2298 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2282);
    float _2300 = _836 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2302 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2294);
    int _2304 = _2266 + _2296;
    float _2306 = _842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2308 = uint(_2290) >= uint(_384);
    float _2310 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2312 = _2304 >> 2;
    float _2314 = _836 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2316 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2306);
    float _2318 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2310);
    int _2320 = _2312 << 4;
    int _2322 = _2320 + 368;
    float _2324 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2326 = -_814;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2274);
    bool _2330 = !_2308;
    int _2332 = _2330 ? 0 : (-1);
    uint _2334 = uint(int(uint(_2322) >> uint(2)));
    uint _2336 = uint(int(uint(int(_2334)) >> uint(2)));
    int _2338 = int(_2334) & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = int(_2334) + 1;
    uint _2344 = uint(int(uint(_2342) >> uint(2)));
    int _2346 = _2342 & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    float _2350 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2324);
    int _2352 = _2266 & 3;
    bool _2354 = _2352 != 0;
    float _2356 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2328);
    float _2358 = _2302 * _2260;
    float _2360 = _2298 * _2260;
    bool _2362 = uint(_2352) > 1u;
    float _2364 = _2356 * _2260;
    int _2366 = _2322 + 8;
    uint _2368 = uint(int(uint(_2366) >> uint(2)));
    uint _2370 = uint(int(uint(int(_2368)) >> uint(2)));
    int _2372 = int(_2368) & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    int _2376 = int(_2368) + 1;
    uint _2378 = uint(int(uint(_2376) >> uint(2)));
    int _2380 = _2376 & 3;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[int(_2378)][_2380];
    int _2384 = _2278 ? 0 : 1;
    float _2386 = fma(_2350, _2244, _2358);
    int _2388 = ~_2268;
    int _2390 = _2388 + _2332;
    int _2392 = _2390 + 1;
    float _2394 = fma(_2318, _2244, _2360);
    int _2396 = ~_2384;
    int _2398 = _2396 + 1;
    int _2400 = _2398 + 1;
    float _2402 = _836 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2404 = uint(_2352) >= 2u;
    int _2406 = _384 * _2392;
    int _2408 = _2406 + _1876;
    bool _2410 = !_2354;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2402);
    int _2416 = _2400;
    if (!_2362)
    {
        int _2418 = ~_2384;
        int _2420 = _2418 + 1;
        _2416 = _2420;
    }
    int _2422 = _2416;
    float _2424 = _842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2426 = _2352 != 3;
    float _2428 = _842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2430 = abs(_2422);
    float _2432 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2414);
    int _2434 = _2404 ? 0 : 1;
    float _2436 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2424);
    int _2438 = abs(_2412);
    float _2440 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    int _2442 = ~_2434;
    int _2444 = _2442 + 1;
    int _2446 = _2444 + 1;
    float _2448 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2428);
    bool _2450 = _2352 != 3;
    float _2452 = _1762 * _1668;
    int _2454 = ~_2430;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    float _2460 = fma(_2432, _2244, _2364);
    int _2462 = _2446;
    if (_2426)
    {
        int _2464 = ~_2434;
        int _2466 = _2464 + 1;
        _2462 = _2466;
    }
    int _2468 = _2462;
    float _2470 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2436);
    float _2472 = fma(_2440, _2252, _2386);
    float _2474 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2448);
    bool _2476 = !_2450;
    int _2478 = _2476 ? 0 : (-1);
    float _2480 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    int _2484 = abs(_2468);
    bool _2486 = !_1697;
    int _2488 = _2486 ? _2408 : (-1);
    float _2490 = _1689 * _2452;
    int _2492 = ~_2438;
    int _2494 = _2492 + 1;
    int _2496 = _2494 + 1;
    int _2498 = _2458 * as_type<int>(_2348);
    bool _2500 = !_1942;
    int _2502 = _2500 ? 0 : 1;
    float _2504 = fma(_2470, _2252, _2394);
    int _2506 = abs(_2478);
    int _2508 = _2496 * as_type<int>(_2340);
    int _2510 = _2508 + _2498;
    float _2512 = _1636 + _1586;
    float _2514 = fma(_2474, _2252, _2460);
    int _2516 = abs(_2502);
    float _2518 = _2512 * 0.5;
    int _2520 = ~_2484;
    int _2522 = _2520 + 1;
    int _2524 = _2522 + 1;
    float _2526 = fma(_2482, -2.0, 3.0);
    float _2528 = _2482 * _2482;
    int _2530 = _2524 * as_type<int>(_2374);
    int _2532 = _2530 + _2510;
    int _2534 = ~_2506;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    float _2540 = _2528 * _2526;
    float _2542 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2544 = ~_2516;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    float _2550 = fma(_1679, _2490, _1677);
    int _2552 = _2538 * as_type<int>(_2382);
    int _2554 = _2552 + _2532;
    float _2556 = -_2540;
    float _2558 = _2556 + 1.0;
    float _2560 = in.m_85.x;
    float _2562 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2542);
    int _2564 = _2554 * _2548;
    float _2566 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2540);
    float _2568 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2562);
    int _2570 = _2488 * _2516;
    int _2572 = _2570 + _2564;
    float _2574 = _1745 * _2566;
    float _2576 = _1586 * 0.5;
    float _2578 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2568);
    float _2580 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2582 = float(_2572);
    float _2584 = _2578 + _1586;
    out.gl_Position.x = _1636;
    out.gl_Position.y = _1638;
    out.gl_Position.z = _2578;
    out.gl_Position.w = _1586;
    float _2586 = _2286 * _2580;
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = fma(_1638, -0.5, _2576);
    float _2592 = _2584 * 0.5;
    out.m_87.x = _2582;
    float _2594 = -_2588;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2598 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2600 = isnan(_1392);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2606 = _2602 || _2604;
    out.m_89.x = _2518;
    out.m_89.y = _2590;
    out.m_89.z = _2592;
    out.m_89.w = _1586;
    float _2608 = _2596 * _2560;
    float _2610 = _1679 * _2452;
    out.m_91.x = _2472;
    out.m_91.y = _2504;
    out.m_91.z = _2514;
    float _2612 = -_1762;
    float _2614 = _2612 + 1.0;
    float _2616 = _2608 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2618 = fma(_1685, _2610, _1673);
    float _2620 = fma(_1687, _2610, _1675);
    float _2622 = _1679 * _2614;
    float _2624 = _1296 * _1352;
    out.m_93.x = _2616;
    float _2626 = _2560;
    float _2628 = _2610;
    float _2630 = _2578;
    float _2632 = _2624;
    if (!_2606)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2634 = _2626;
    float _2636 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2618;
    out.m_95.y = _2620;
    out.m_95.z = _2550;
    out.m_95.w = _2622;
    float _2638 = _2634;
    float _2640 = _2634;
    if (!_2606)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2642 = _2628;
    float _2644 = _2642;
    float _2646 = _2642;
    if (!_2606)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2648 = _1932;
    float _2650 = _2648;
    float _2652 = _2648;
    if (!_2606)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2654 = _2630;
    float _2656 = _2654;
    float _2658 = _2654;
    if (!_2606)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2660 = _1934;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2606)
    {
        _2632 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2666 = _2632;
    bool _2668 = !_2606;
    float _2670 = _2666;
    float _2672 = _2666;
    if (!_2668)
    {
        bool _2674 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2676 = isnan(_1392);
        bool _2678 = _2674 || _2676;
        bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2682 = _2678 || _2680;
        if (!_2682)
        {
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2686 = _1392 + _2684;
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2690 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2688;
            float _2692 = 1.0 / _2690;
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2714 = _2686 * _2692;
            float _2716 = precise::clamp(_2714, 0.0, 1.0);
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2722 = fma(_2716, _2696, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2724 = fma(_2716, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2726 = fma(_2716, _2700, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2728 = fma(_2716, _2704, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2730 = fma(_2716, _2708, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2732 = fma(_2716, _2712, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2646 = _2724;
            _2664 = _2730;
            _2640 = _2722;
            _2658 = _2728;
            _2652 = _2726;
            _2672 = _2732;
            _2734 = true;
        }
        else
        {
            bool _2736 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2738 = isnan(_1392);
            bool _2740 = _2736 || _2738;
            bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2744 = _2740 || _2742;
            if (!_2744)
            {
                _2638 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2746 = _2638;
            _2640 = _2746;
            if (!_2744)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2748 = _2644;
            _2646 = _2748;
            if (!_2744)
            {
                _2650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2750 = _2650;
            _2652 = _2750;
            if (!_2744)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2752 = _2656;
            _2658 = _2752;
            if (!_2744)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2754 = _2662;
            _2664 = _2754;
            if (!_2744)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2756 = _2670;
            bool _2758 = !_2744;
            _2672 = _2756;
            if (!_2758)
            {
                bool _2760 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2762 = isnan(_1392);
                bool _2764 = _2760 || _2762;
                bool _2766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2768 = _2764 || _2766;
                if (!_2768)
                {
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2772 = _1392 + _2770;
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2774;
                    float _2778 = 1.0 / _2776;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2800 = _2772 * _2778;
                    float _2802 = precise::clamp(_2800, 0.0, 1.0);
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2808 = fma(_2802, _2782, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2810 = fma(_2802, _2806, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2812 = fma(_2802, _2786, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2814 = fma(_2802, _2790, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2816 = fma(_2802, _2794, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2818 = fma(_2802, _2798, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2646 = _2810;
                    _2664 = _2816;
                    _2640 = _2808;
                    _2658 = _2814;
                    _2652 = _2812;
                    _2672 = _2818;
                    _2734 = true;
                }
                else
                {
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2640 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2734 = false;
    float _2820 = _2646;
    float _2822 = _2664;
    float _2824 = _2640;
    float _2826 = _2658;
    float _2828 = _2652;
    float _2830 = _2672;
    float _2832 = fma(_2504, -0.5, 0.5);
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = -_2820;
    float _2838 = _2836 + _2822;
    float _2840 = _2636 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2842 = -_2824;
    float _2844 = _2842 + _2826;
    float _2846 = fma(_2834, _2838, _2820);
    out.m_97.x = 0.0;
    float _2848 = -_2828;
    float _2850 = _2848 + _2830;
    float _2852 = fma(_2834, _2844, _2824);
    float _2854 = _2846 * 0.586610972881317138671875;
    out.m_53.x = _2840;
    bool _2856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2858 = fma(_2834, _2850, _2828);
    float _2860 = fma(_2852, 0.298911988735198974609375, _2854);
    bool _2862 = _1296 > 0.0;
    bool _2864 = isnan(_1296);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan(0.0);
    bool _2870 = _2866 || _2868;
    float _2872 = fma(_2858, 0.114477999508380889892578125, _2860);
    bool _2874 = _1352 <= 0.0;
    bool _2876 = !_2870;
    bool _2878 = _2874 || _2876;
    float _2880 = -_2872;
    float _2882 = _2852 + _2880;
    float _2884 = -_2872;
    float _2886 = _2846 + _2884;
    float _2888 = -_2872;
    float _2890 = _2858 + _2888;
    float _2892 = fma(_2882, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2894 = fma(_2886, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2896 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    bool _2898 = !_2856;
    if (!_2898)
    {
        float _2900 = -_1234;
        float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2904 = -_1236;
        float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2908 = -_1238;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2912 = _2902 * _2902;
        float _2914 = fma(_2906, _2906, _2912);
        float _2916 = fma(_2910, _2910, _2914);
        float _2918 = sqrt(_2916);
        float _2920 = rsqrt(_2916);
        float _2922 = -_2918;
        float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2926 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2928 = precise::clamp(_2926, 0.0, 1.0);
        float _2930 = _2906 * _2920;
        float _2932 = _2902 * _2920;
        float _2934 = abs(_2928);
        float _2936 = log2(_2934);
        float _2938 = _2910 * _2920;
        float _2940 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2942 = _2504 * _2932;
        float _2944 = -_2932;
        float _2946 = -_2940;
        float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2946);
        float _2950 = fma(_2472, _2930, _2942);
        float _2952 = -_2938;
        float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2948);
        float _2956 = fma(_2514, _2938, _2950);
        float _2958 = precise::clamp(_2956, 0.0, 1.0);
        float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2962 = _2954 + _2960;
        float _2964 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2966 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = exp2(_2964);
        float _2972 = _2970 * _2968;
        float _2974 = _2958 * _2972;
        float _2976 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2978 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2980 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2976;
        out.m_97.y = _2978;
        out.m_97.z = _2980;
    }
    out.m_67.x = _2892;
    out.m_67.y = _2894;
    out.m_67.z = _2896;
    if (!_2878)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2982 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2982;
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2734 = false;
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
        float _3051 = as_type<float>(_140);
        out.gl_Position.z = _3051;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3106 = as_type<float>(_166);
        out.gl_Position.z = _3106;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _388 = _340 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _390 = _340 * 2.0;
    float _392 = exp2(_378);
    float _394 = fma(_386, -2.0, _358);
    float _396 = _342 * 2.0;
    float _398 = -_380;
    float _400 = fma(_388, 2.0, _398);
    float _402 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _404 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _406 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _408 = _342 + _340;
    float _410 = floor(_396);
    float _412 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _402);
    float _414 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _406);
    float _416 = _408 + (-1.0);
    float _418 = _360 * 2.0;
    float _420 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _404);
    float _422 = _342 + _360;
    float _424 = floor(_390);
    float _426 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _428 = float(_364);
    float _430 = _422 + (-1.0);
    float _432 = -_392;
    float _434 = _432 + 1.0;
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = -_122;
    float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[76].x, _400);
    float _450 = floor(_418);
    bool _452 = _410 > 0.0;
    float _454 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _456 = _410 >= 0.0;
    bool _458 = isnan(_410);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _468 = 1.0 + _466;
    float _470 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _394);
    float _472 = _376 ? _434 : 0.0;
    float _474 = 1.0 / _428;
    bool _476 = _424 > 0.0;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _480 = _424 >= 0.0;
    bool _482 = isnan(_424);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _420);
    float _492 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[78].z, _478);
    float _494 = float(_384);
    float _496 = 1.0 / _468;
    bool _498 = _450 > 0.0;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _502 = _450 >= 0.0;
    bool _504 = isnan(_450);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = _494 * _122;
    float _514 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _492);
    float _516 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _500);
    int _518 = _488 ? 0 : 1;
    float _520 = _474 * _122;
    float _522 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _524 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _516);
    int _526 = ~_518;
    int _528 = _526 + 1;
    int _530 = _528 + 1;
    float _532 = _490 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _534 = _530;
    float _536 = _338;
    if (!_476)
    {
        int _538 = ~_518;
        int _540 = _538 + 1;
        _534 = _540;
    }
    int _542 = _534;
    float _544 = _522 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _546 = _464 ? 0 : 1;
    if (_444)
    {
        float _548 = _472 * _496;
        _132 = _548;
    }
    float _550 = _132;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _558 = _556 != 0;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _562 = _560 != 0;
    float _564 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    int _566 = ~_546;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _574 = _544 + _572;
    int _576 = _570;
    if (!_452)
    {
        int _578 = ~_546;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = _564 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _586 = !_558;
    int _588 = _586 ? 0 : 1;
    float _590 = in.m_61.x;
    float _592 = in.m_61.y;
    float _594 = in.m_61.z;
    bool _596 = !_554;
    int _598 = _596 ? 0 : 1;
    bool _600 = !_562;
    int _602 = _600 ? 0 : 1;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = float(_542);
    int _618 = _510 ? 0 : 1;
    bool _620 = !_606;
    int _622 = _620 ? 0 : 1;
    bool _624 = !_610;
    int _626 = _624 ? 0 : 1;
    int _628 = abs(_622);
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _632 = _532 + _630;
    int _634 = abs(_626);
    int _636 = ~_618;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = _632 * _632;
    float _644 = float(_634);
    float _646 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _648 = _584 + _646;
    int _650 = _640;
    if (!_498)
    {
        int _652 = ~_618;
        int _654 = _652 + 1;
        _650 = _654;
    }
    int _656 = _650;
    float _658 = fma(_574, _574, _642);
    float _660 = _644 * _616;
    float _662 = float(_628);
    float _664 = fma(_648, _648, _658);
    float _666 = float(_656);
    float _668 = _660 * (-2.0);
    bool _670 = !_614;
    int _672 = _670 ? 0 : 1;
    float _674 = sqrt(_664);
    float _676 = _342 + (-0.5);
    float _678 = fma(_668, _592, _592);
    float _680 = fma(_454, _668, _454);
    int _682 = abs(_672);
    float _684 = _662 * _666;
    float _686 = float(_582);
    float _688 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].y, _678);
    float _690 = rsqrt(_664);
    float _692 = _360 + _340;
    float _694 = _684 * (-2.0);
    float _696 = float(_682);
    float _698 = _692 + (-1.0);
    float _700 = fma(_680, _550, _688);
    float _702 = _674 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _704 = fma(_694, _590, _590);
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _708 = _696 * _686;
    float _710 = _340 + (-0.5);
    float _712 = precise::min(_366, _702);
    float _714 = fma(_426, _694, _426);
    float _716 = _708 * (-2.0);
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].x, _704);
    float _720 = _360 + (-0.5);
    float _722 = _690 * _712;
    float _724 = fma(_706, _716, _706);
    float _726 = fma(_716, _594, _594);
    float _728 = fma(_714, _550, _718);
    float _730 = _632 * _722;
    float _732 = _574 * _722;
    float _734 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[196].z, _726);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = -_730;
    float _740 = _632 + _738;
    float _742 = -_732;
    float _744 = _574 + _742;
    float _746 = fma(_724, _550, _734);
    float _748 = _648 * _722;
    float _750 = _740 * _740;
    float _752 = _700 * 0.15915493667125701904296875;
    float _754 = _736 * 6.283185482025146484375;
    float _756 = sin(_754);
    float _758 = -_748;
    float _760 = _648 + _758;
    float _762 = fma(_744, _744, _750);
    float _764 = fma(_760, _760, _762);
    float _766 = in.m_63.x;
    float _768 = in.m_63.y;
    float _770 = in.m_63.z;
    float _772 = _752 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = sqrt(_764);
    float _778 = _752 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = _736 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _746 * 0.15915493667125701904296875;
    float _788 = _690 * _776;
    float _790 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _792 = _756 * _774;
    float _794 = _348 * _788;
    float _796 = _790 * _788;
    float _798 = _786 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _768);
    float _804 = _756 * _780;
    float _806 = _356 * _788;
    float _808 = _796 * _802;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _770);
    float _812 = _786 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _784 * _780;
    float _818 = _784 * _774;
    float _820 = _756 * _800;
    float _822 = _780 * _800;
    float _824 = _784 * _800;
    float _826 = _774 * _800;
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _766);
    float _830 = _806 * _810;
    float _832 = _820 * _808;
    float _834 = _794 * _828;
    float _836 = fma(_814, _816, _792);
    float _838 = _824 * _808;
    float _840 = -_804;
    float _842 = fma(_814, _818, _840);
    float _844 = -_808;
    float _846 = _814 * _844;
    float _848 = -_818;
    float _850 = fma(_814, _804, _848);
    float _852 = fma(_836, _834, _838);
    float _854 = fma(_814, _792, _816);
    float _856 = fma(_822, _834, _846);
    float _858 = fma(_850, _834, _832);
    float _860 = fma(_842, _830, _852);
    float _862 = fma(_826, _830, _856);
    float _864 = fma(_854, _830, _858);
    float _866 = _860 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _868 = _860 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _870 = _860 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _872 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].x, _866);
    float _874 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].x, _868);
    float _876 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].x, _870);
    float _878 = -_730;
    float _880 = _532 + _878;
    float _882 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _872);
    float _884 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _874);
    float _886 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _876);
    float _888 = -_732;
    float _890 = _544 + _888;
    float _892 = _882 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _894 = _884 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _896 = _886 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _898 = -_748;
    float _900 = _584 + _898;
    float _902 = _584 + _892;
    float _904 = _544 + _894;
    float _906 = _532 + _896;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _910 = _902 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _904 + _912;
    float _916 = _910 * _910;
    float _918 = fma(_914, _914, _916);
    float _920 = _880 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _922 = sqrt(_918);
    float _924 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[11].x, _920);
    float _926 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[11].z, _924);
    bool _928 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = _896;
    float _932 = _886;
    float _934 = _904;
    float _936 = _730;
    float _938 = _732;
    float _940 = _748;
    if (!_928)
    {
        _930 = _904;
    }
    float _942 = _930;
    float _944 = _942;
    if (!_928)
    {
        _932 = _902;
    }
    float _946 = _932;
    float _948 = _946;
    if (!_928)
    {
        _934 = _906;
    }
    float _950 = _934;
    bool _952 = !_928;
    float _954 = _950;
    if (!_952)
    {
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _960 = _922 + _958;
        float _962 = rsqrt(_918);
        float _964 = _960 * _956;
        float _966 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _968 = _964 * 0.15915493667125701904296875;
        float _970 = _968 * 6.283185482025146484375;
        float _972 = cos(_970);
        float _974 = _968 * 6.283185482025146484375;
        float _976 = sin(_974);
        float _978 = _972 + (-1.0);
        float _980 = fma(_976, _966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _982 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = _962 * _980;
        float _986 = fma(_906, _972, _982);
        float _988 = fma(_914, _984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _990 = fma(_910, _984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _954 = _986;
        _944 = _988;
        _948 = _990;
    }
    float _992 = _954;
    float _994 = _944;
    float _996 = _948;
    float _998 = -_532;
    float _1000 = _998 + _992;
    float _1002 = -_544;
    float _1004 = _1002 + _994;
    float _1006 = _926 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1008 = _880 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1010 = _1000 * _1000;
    float _1012 = -_584;
    float _1014 = _1012 + _996;
    float _1016 = 1.0 / _1006;
    float _1018 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1008);
    float _1020 = fma(_1004, _1004, _1010);
    float _1022 = -_732;
    float _1024 = _1022 + _994;
    float _1026 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1018);
    float _1028 = fma(_1014, _1014, _1020);
    float _1030 = -_730;
    float _1032 = _1030 + _992;
    float _1034 = -_748;
    float _1036 = _1034 + _996;
    float _1038 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1040 = sqrt(_1028);
    bool _1042 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1044 = isnan(0.5);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1050 = _1046 || _1048;
    float _1052 = _1038 + _1006;
    bool _1054 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1062 = _1058 || _1060;
    float _1064 = _1052 * _1016;
    float _1066 = _1064 * 0.5;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1070 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1068);
    float _1072 = 1.0 / _1070;
    bool _1074 = _1040 > 0.0;
    float _1076 = _1040;
    float _1078 = _994;
    float _1080 = _1004;
    float _1082 = _1016;
    float _1084 = _1036;
    float _1086 = _1070;
    float _1088 = _1032;
    if (!_1074)
    {
        _936 = _1024;
    }
    float _1090 = _936;
    float _1092 = _1090;
    if (!_1074)
    {
        _938 = _1032;
    }
    float _1094 = _938;
    float _1096 = _1094;
    if (!_1074)
    {
        _1076 = _1036;
    }
    float _1098 = _1076;
    bool _1100 = !_1074;
    float _1102 = _1098;
    float _1104 = _1098;
    if (!_1100)
    {
        float _1106 = _194 * _194;
        float _1108 = rsqrt(_1028);
        float _1110 = fma(_192, _192, _1106);
        float _1112 = fma(_196, _196, _1110);
        float _1114 = sqrt(_1112);
        float _1116 = _1000 * _1108;
        float _1118 = _1004 * _1108;
        float _1120 = _1014 * _1108;
        bool _1122 = _1114 > 0.0;
        float _1124 = _1108;
        float _1126 = _1114;
        _1078 = _1118;
        if (!_1122)
        {
            _1124 = _1024;
        }
        float _1128 = _1124;
        _1092 = _1128;
        if (!_1122)
        {
            _1126 = _1032;
        }
        float _1130 = _1126;
        _1096 = _1130;
        if (!_1122)
        {
            _1102 = _1036;
        }
        float _1132 = _1102;
        bool _1134 = !_1122;
        _1104 = _1132;
        if (!_1134)
        {
            float _1136 = rsqrt(_1112);
            float _1138 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1140 = _194 * _1136;
            float _1142 = _192 * _1136;
            float _1144 = _1116 * _1140;
            float _1146 = _196 * _1136;
            float _1148 = fma(_1118, _1142, _1144);
            float _1150 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1152 = fma(_1120, _1146, _1148);
            float _1154 = _1152 * _1150;
            float _1156 = fma(_192, _1154, _1024);
            float _1158 = fma(_194, _1154, _1032);
            float _1160 = fma(_196, _1154, _1036);
            _1092 = _1156;
            _1096 = _1158;
            _1104 = _1160;
            _1080 = _1154;
        }
    }
    float _1162 = _1092;
    float _1164 = _1096;
    float _1166 = _1104;
    float _1168 = _1078;
    float _1170 = _1080;
    float _1172 = _1170;
    float _1174 = _1164;
    float _1176 = _1162;
    float _1178 = _1166;
    if (_1062)
    {
        _1172 = 1.0;
    }
    float _1180 = _1172;
    float _1182 = _1180;
    if (!_1050)
    {
        float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1186 = _880 + _1184;
        float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1190 = _890 + _1188;
        float _1192 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1194 = _1186 * _1186;
        float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1198 = _900 + _1196;
        float _1200 = fma(_1190, _1190, _1194);
        float _1202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1204 = fma(_1198, _1198, _1200);
        float _1206 = sqrt(_1204);
        float _1208 = _1192 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1210 = precise::min(_1206, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1212 = _1210 * _1202;
        float _1214 = -_890;
        float _1216 = _1214 + _1162;
        float _1218 = _1208 * _1212;
        float _1220 = -_880;
        float _1222 = _1220 + _1164;
        float _1224 = -_900;
        float _1226 = _1224 + _1166;
        float _1228 = fma(_1216, _1218, _890);
        float _1230 = fma(_1222, _1218, _880);
        float _1232 = fma(_1226, _1218, _900);
        _1174 = _1230;
        _1176 = _1228;
        _1178 = _1232;
    }
    float _1234 = _1174;
    float _1236 = _1176;
    float _1238 = _1178;
    if (_1062)
    {
        _1082 = 1.0;
    }
    float _1240 = _1082;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1244 = _1072 * _1242;
    float _1246 = _1240;
    if (!_1062)
    {
        float _1248 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1250 = _1248 * 0.15915493667125701904296875;
        float _1252 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1254 = _1250 * 6.283185482025146484375;
        float _1256 = cos(_1254);
        float _1258 = _1252 * 0.15915493667125701904296875;
        float _1260 = _1250 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        float _1264 = 1.0 / _1256;
        float _1266 = _1258 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        float _1270 = _1262 * _1264;
        float _1272 = _1258 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = 1.0 / _1276;
        float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1282 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1280;
        float _1284 = 1.0 / _1282;
        float _1286 = _1274 * _1278;
        float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1290 = fma(_1244, _1286, _1288);
        float _1292 = _1290 * _1284;
        float _1294 = precise::clamp(_1292, 0.0, 1.0);
        _1182 = _1294;
    }
    float _1296 = _1182;
    if (!_1062)
    {
        float _1298 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1300 = _1298 * 0.15915493667125701904296875;
        float _1302 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = cos(_1304);
        float _1308 = _1302 * 0.15915493667125701904296875;
        float _1310 = _1300 * 6.283185482025146484375;
        float _1312 = sin(_1310);
        float _1314 = 1.0 / _1306;
        float _1316 = _1308 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        float _1320 = _1312 * _1314;
        float _1322 = _1308 * 6.283185482025146484375;
        float _1324 = sin(_1322);
        float _1326 = _1318 * _1320;
        float _1328 = 1.0 / _1326;
        float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1332 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1330;
        float _1334 = 1.0 / _1332;
        float _1336 = _1324 * _1328;
        float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1340 = fma(_1244, _1336, _1338);
        float _1342 = _1340 * _1334;
        float _1344 = precise::clamp(_1342, 0.0, 1.0);
        float _1346 = -_1344;
        float _1348 = _1346 + 1.0;
        _1084 = _1328;
        _1246 = _1348;
    }
    float _1350 = _1084;
    float _1352 = _1246;
    float _1354 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1356 = _1234 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1360 = _1236 + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1364 = _1238 + _1362;
    float _1366 = _1356 * _1356;
    float _1368 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1370 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1372 = fma(_1360, _1360, _1366);
    float _1374 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1368);
    float _1376 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1370);
    float _1378 = fma(_1364, _1364, _1372);
    float _1380 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1374);
    float _1382 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1376);
    float _1384 = rsqrt(_1378);
    float _1386 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1388 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1390 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1392 = sqrt(_1378);
    float _1394 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1360 * _1394;
    float _1398 = _1364 * _1394;
    float _1400 = _1396 * _1396;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 + _1402;
    float _1406 = sqrt(_1404);
    bool _1408 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1406 + _1410;
    float _1414 = _1168;
    float _1416 = _1404;
    float _1418 = _1412;
    float _1420 = _1396;
    float _1422 = _1398;
    float _1424 = _1400;
    float _1426 = _1402;
    if (_1408)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1428;
    }
    float _1430 = _1414;
    if (_1408)
    {
        float _1432 = rsqrt(_1404);
        _1416 = _1432;
    }
    float _1434 = _1416;
    if (_1408)
    {
        float _1436 = _1412 * _1430;
        _1418 = _1436;
    }
    float _1438 = _1418;
    if (_1408)
    {
        float _1440 = _1438 * 0.15915493667125701904296875;
        _1086 = _1440;
    }
    float _1442 = _1086;
    float _1444 = _1430;
    if (_1408)
    {
        float _1446 = _1442 * 6.283185482025146484375;
        float _1448 = sin(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1454 = precise::max(0.0, _1452);
    float _1456 = _1350;
    if (_1408)
    {
        float _1458 = _1442 * 6.283185482025146484375;
        float _1460 = cos(_1458);
        _1456 = _1460;
    }
    float _1462 = _1456;
    float _1464 = -_1394;
    float _1466 = -_1454;
    float _1468 = fma(_1356, _1464, _1466);
    if (_1408)
    {
        float _1470 = _1468 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _940 = _1470;
    }
    float _1472 = _940;
    float _1474 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1476 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1478 = _1472;
    float _1480 = _1450;
    if (_1408)
    {
        float _1482 = fma(_1450, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1482;
    }
    float _1484 = _1478;
    float _1486 = _1484;
    if (!_1408)
    {
        _1480 = _1468;
    }
    float _1488 = _1480;
    float _1490 = floor(_1476);
    float _1492 = _1488;
    if (_1408)
    {
        float _1494 = _1462 + (-1.0);
        _1088 = _1494;
    }
    float _1496 = _1088;
    float _1498 = _1496;
    if (_1408)
    {
        float _1500 = _1434 * _1484;
        _1486 = _1500;
    }
    float _1502 = _1486;
    float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1506 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1504);
    float _1508 = precise::clamp(_1506, 0.0, 1.0);
    if (_1408)
    {
        float _1510 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1498 = _1510;
    }
    float _1512 = _1498;
    if (_1408)
    {
        float _1514 = _1396 * _1502;
        _1420 = _1514;
    }
    float _1516 = _1420;
    if (_1408)
    {
        float _1518 = _1398 * _1502;
        _1422 = _1518;
    }
    float _1520 = _1422;
    if (_1408)
    {
        float _1522 = fma(_1468, _1462, _1512);
        _1492 = _1522;
    }
    float _1524 = _1492;
    if (_1408)
    {
        float _1526 = _1516 * _1516;
        _1424 = _1526;
    }
    float _1528 = _1424;
    if (_1408)
    {
        float _1530 = _1520 * _1520;
        _1426 = _1530;
    }
    float _1532 = _1426;
    float _1534 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1474);
    float _1536 = -_1508;
    float _1538 = _1536 + 1.0;
    float _1540 = fma(_1524, _1524, _1528);
    float _1542 = fma(_900, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1544 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1546 = _1540 + _1532;
    float _1548 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1534);
    float _1550 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1544);
    float _1552 = abs(_1538);
    float _1554 = log2(_1552);
    float _1556 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1558 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1560 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1550);
    float _1562 = -_1390;
    float _1564 = fma(_1562, _1556, 1.0);
    float _1566 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1568 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1570 = rsqrt(_1546);
    float _1572 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1574 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1572);
    float _1576 = floor(_1542);
    float _1578 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1574);
    float _1580 = _1570 * _1516;
    float _1582 = _1570 * _1524;
    float _1584 = _1570 * _1520;
    float _1586 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1578);
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1590 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1592 = log2(_1564);
    float _1594 = _1582 + 1.0;
    float _1596 = -_1588;
    float _1598 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1596);
    float _1600 = -_1576;
    float _1602 = _1542 + _1600;
    float _1604 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1566);
    float _1606 = -_1584;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1598);
    float _1610 = -_1490;
    float _1612 = _1476 + _1610;
    float _1614 = 1.0 / _1586;
    float _1616 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1618 = fma(_1608, -0.5, 0.5);
    float _1620 = fma(_1608, 0.5, 0.5);
    float _1622 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1624 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1616);
    float _1626 = fma(_1620, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1628 = exp2(_1590);
    float _1630 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1624);
    float _1632 = _1592 * 0.693147182464599609375;
    float _1634 = fma(_1620, _1626, -0.212114393711090087890625);
    float _1636 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1630);
    float _1638 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1622);
    float _1640 = fma(_1620, _1634, 1.570728778839111328125);
    float _1642 = sqrt(_1618);
    float _1644 = _1636 * _1614;
    float _1646 = _1638 * _1614;
    float _1648 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1650 = fma(_1646, -0.5, 0.5);
    float _1652 = -_1582;
    float _1654 = fma(_1628, _1594, _1652);
    float2 _5414 = float2(_1612, _1602);
    float _1656 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5414, float2(0.0), isnan(_5414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5414, float2(0.0), isnan(_5414)), level(0.0)).x;
    float _1658 = fma(_1654, 0.5, 0.5);
    float _1660 = _1642 * 0.636619746685028076171875;
    float _1662 = fma(_1644, 0.5, 0.5);
    float _1664 = -_1640;
    float _1666 = fma(_1660, _1664, 1.0);
    float3 _5437 = float3(_1662, _1650, _1648);
    float _1668 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5437, float3(0.0), isnan(_5437)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5437, float3(0.0), isnan(_5437)), level(0.0)).x;
    float3 _5448 = float3(_1662, _1650, _1648);
    float4 _1671 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5448, float3(0.0), isnan(_5448)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5448, float3(0.0), isnan(_5448)), level(0.0)).xyzw;
    float _1673 = _1671.x;
    float _1675 = _1671.y;
    float _1677 = _1671.z;
    float _1679 = _1671.w;
    float2 _5464 = float2(_1666, _1658);
    float3 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5464, float2(0.0), isnan(_5464)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5464, float2(0.0), isnan(_5464)), level(0.0)).xyz;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = float(uint(_384));
    float _1693 = trunc(_520);
    int _1695 = int(_1693);
    bool _1697 = _384 == 0;
    float _1699 = _512 * _174;
    int _1701 = abs(_588);
    out.m_65.x = _890;
    out.m_65.y = _880;
    out.m_65.z = _900;
    int _1703 = abs(_598);
    float _1705 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1707 = 1.0 / _1691;
    int _1709 = ~_384;
    int _1711 = _1709 + 1;
    out.m_67.w = _712;
    int _1713 = _384 + (-1);
    out.m_69.x = _794;
    float _1715 = float(uint(_1695));
    float _1717 = trunc(_1699);
    int _1719 = int(_1717);
    out.m_71.x = _1236;
    out.m_71.y = _1234;
    out.m_71.z = _1238;
    int _1721 = as_type<int>(_1707) + (-2);
    float _1723 = abs(_1244);
    float _1725 = log2(_1723);
    float _1727 = as_type<float>(_1721) * _1715;
    int _1729 = ~_384;
    int _1731 = _1729 + 1;
    float _1733 = exp2(_1705);
    bool _1735 = _1244 <= 8000.0;
    bool _1737 = isnan(_1244);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan(8000.0);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = trunc(_1727);
    float _1749 = precise::max(_1747, 0.0);
    uint _1752 = uint(_1749);
    float _1754 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1756 = exp2(_1754);
    float _1758 = -_1733;
    float _1760 = _1758 + 1.0;
    float _1762 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1764 = _1711 * int(_1752);
    int _1766 = _1764 + _1695;
    float _1768 = float(uint(_1766));
    float _1770 = as_type<float>(_1721) * _1768;
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1774 = _1772 != 0;
    float _1776 = trunc(_1770);
    float _1778 = precise::max(_1776, 0.0);
    uint _1780 = uint(_1778);
    bool _1782 = !_1774;
    float _1784 = _1782 ? 7.345489978790283203125 : 1.0;
    float _1786 = _1784 * _340;
    float _1788 = float(_1695);
    float _1790 = floor(_1786);
    bool _1792 = _1788 >= _494;
    bool _1794 = isnan(_1788);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan(_494);
    bool _1800 = _1796 || _1798;
    float _1802 = float(_1800);
    int _1804 = int(_1752) + int(_1780);
    float _1806 = trunc(_1802);
    int _1808 = int(_1806);
    int _1810 = _1731 * _1804;
    int _1812 = _1810 + _1695;
    bool _1814 = uint(_1812) >= uint(_384);
    float _1816 = -_1790;
    float _1818 = _1786 + _1816;
    bool _1820 = !_1814;
    int _1822 = _1820 ? 0 : (-1);
    float _1824 = _1818 * _494;
    int _1826 = ~_1804;
    int _1828 = _1826 + _1822;
    int _1830 = _1828 + 1;
    int _1832 = ~_1808;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    float _1838 = trunc(_1824);
    int _1840 = int(_1838);
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1844 = _1842 != 0;
    int _1846 = _384 * _1830;
    int _1848 = _1846 + _1695;
    int _1850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1852 = _1850 != 0;
    bool _1854 = !_1844;
    int _1856 = _1854 ? 0 : 1;
    bool _1858 = !_1697;
    int _1860 = _1858 ? _1848 : (-1);
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1864 = _1862 != 0;
    int _1866 = abs(_1856);
    int _1868 = _1860 * _1836;
    int _1870 = _1808 * _1713;
    int _1872 = _1870 + _1868;
    int _1874 = _1840 * _1866;
    int _1876 = _1874 + _1695;
    bool _1878 = !_1864;
    int _1880 = _1878 ? 0 : 1;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1884 = _1882 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1886 = abs(_602);
    int _1888 = _1872 * _1701;
    int _1890 = _1719 * _1703;
    int _1892 = _1890 + _1888;
    int _1894 = abs(_1880);
    float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1898 = _1896 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1900 = _1876 * _1886;
    int _1902 = _1900 + _1892;
    float _1904 = 1.0 / _1884;
    float _1906 = in.m_73.y;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1910 = _1908 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1912 = _1840 * _1894;
    int _1914 = _1912 + _1902;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1916 = 1.0 / _1898;
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1920 = _1918 != 0;
    bool _1922 = _342 > 0.5;
    float _1924 = 1.0 / _1910;
    float _1926 = float(uint(_1914));
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1932 = _1586;
    float _1934 = _1638;
    if (_1852)
    {
        float _1936 = in.m_57.x;
        _1930 = _1936;
    }
    float _1938 = _1930;
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1942 = _1940 != 0;
    float _1944 = as_type<float>(_1721) * _1926;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1948;
    float _1952 = in.m_73.x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1956 = -_1906;
    float _1958 = _1956 + 1.0;
    float _1960 = trunc(_1944);
    float _1962 = precise::max(_1960, 0.0);
    uint _1964 = uint(_1962);
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1968 = _1950 * _1904;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1972 = _1970 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1974 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1906;
    if (_1920)
    {
        float _1982 = _1922 ? _1958 : _1906;
        _1980 = _1982;
    }
    float _1984 = _1980;
    float _1986 = _1972 * _1916;
    int _1988 = ~_384;
    int _1990 = _1988 + 1;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1992;
    bool _1996 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1998 = isnan(_338);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    out.m_77.x = _1974;
    out.m_77.y = _1976;
    out.m_77.z = _1978;
    out.m_77.w = _1966;
    bool _2008 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2010 = isnan(_338);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2016 = _2012 || _2014;
    float _2018 = float(_2016);
    float _2020 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2022 = _1938 > 0.5;
    bool _2024 = _2022 && _1852;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2028 = _338 + _2026;
    float _2030 = float(uint(_1876));
    float _2032 = -_470;
    float _2034 = fma(_524, _2020, _2032);
    float _2036 = as_type<float>(_1721) * _2030;
    int _2038 = _1990 * int(_1964);
    int _2040 = _2038 + _1914;
    float _2042 = _1994 * _1924;
    bool _2044 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2046 = isnan(_338);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    float _2056 = -_2006;
    float _2058 = _2056 + 1.0;
    bool _2060 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2062 = isnan(_338);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2068 = _2064 || _2066;
    float _2070 = float(_2068);
    float _2072 = -_2018;
    float _2074 = _2072 + 1.0;
    float _2076 = float(uint(_2040));
    float _2078 = _2054 * _2058;
    float _2080 = -_2054;
    float _2082 = _2080 + 1.0;
    float _2084 = fma(_1968, _2028, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2086 = _2028;
    if (_1852)
    {
        _2086 = _1952;
    }
    float _2088 = _2086;
    float _2090 = as_type<float>(_1721) * _2076;
    float _2092 = _2070 * _2082;
    float _2094 = _2006 * _2074;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2098 = _338 + _2096;
    float _2100 = -_2070;
    float _2102 = _2100 + 1.0;
    float _2104 = trunc(_2090);
    float _2106 = precise::max(_2104, 0.0);
    uint _2108 = uint(_2106);
    float _2110 = _2084 * _2092;
    float _2112 = _2088;
    if (_2024)
    {
        float _2114 = -_2088;
        float _2116 = _2114 + 1.0;
        _2112 = _2116;
    }
    float _2118 = _2112;
    float _2120 = fma(_1986, _2098, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2122 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2124 = _338 + _2122;
    float _2126 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2110);
    if (!_1852)
    {
        _536 = _1952;
    }
    float _2128 = _536;
    float _2130 = trunc(_2036);
    float _2132 = precise::max(_2130, 0.0);
    uint _2134 = uint(_2132);
    float _2136 = _2128;
    if (_1852)
    {
        _2136 = _2118;
    }
    float _2138 = _2136;
    float _2140 = fma(_2042, _2124, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _2142 = ~_384;
    int _2144 = _2142 + 1;
    float _2146 = fma(_2120, _2078, _2126);
    int _2148 = ~_384;
    int _2150 = _2148 + 1;
    float _2152 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2154 = _768 != 0.0;
    bool _2156 = isnan(_768);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan(0.0);
    bool _2162 = _2158 || _2160;
    float _2164 = fma(_2140, _2094, _2146);
    int _2166 = int(_1964) + int(_2108);
    float _2168 = fma(_514, _2152, _448);
    float _2170 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2164);
    bool _2172 = _766 == 0.0;
    bool _2174 = !_2162;
    bool _2176 = _2172 && _2174;
    int _2178 = _2150 * _2166;
    int _2180 = _2178 + _1914;
    int _2182 = _2144 * int(_2134);
    int _2184 = _2182 + _1876;
    float _2186 = in.m_79.x;
    float _2188 = in.m_79.y;
    float _2190 = in.m_79.z;
    bool _2192 = _770 == 0.0;
    bool _2194 = _2192 && _2176;
    float _2196 = _2168 + 0.5;
    bool _2198 = uint(_2180) >= uint(_384);
    float _2200 = float(uint(_2184));
    bool _2202 = !_2198;
    int _2204 = _2202 ? 0 : (-1);
    float _2206 = as_type<float>(_1721) * _2200;
    int _2208 = ~_2166;
    int _2210 = _2208 + _2204;
    int _2212 = _2210 + 1;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2218 = _2034 + 0.5;
    float _2220 = trunc(_2206);
    float _2222 = precise::max(_2220, 0.0);
    uint _2224 = uint(_2222);
    float _2226 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2230 = _2216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2232 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_81.x = _2196;
    out.m_81.y = _2218;
    float _2234 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2236 = _2186;
    float _2238 = _2190;
    float _2240 = _2188;
    if (!_2194)
    {
        float _2242 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2186);
        _2236 = _2242;
    }
    float _2244 = _2236;
    int _2246 = _384 * _2212;
    int _2248 = _2246 + _1914;
    if (!_2194)
    {
        float _2250 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2190);
        _2238 = _2250;
    }
    float _2252 = _2238;
    int _2254 = ~_384;
    int _2256 = _2254 + 1;
    if (!_2194)
    {
        float _2258 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2188);
        _2240 = _2258;
    }
    float _2260 = _2240;
    float _2262 = _824 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2264 = !_1697;
    int _2266 = _2264 ? _2248 : (-1);
    out.m_83.x = _2226;
    out.m_83.y = _2230;
    out.m_83.z = _2234;
    out.m_83.w = _2232;
    int _2268 = int(_2134) + int(_2224);
    float _2270 = _824 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2272 = _2266 >> 31;
    float _2274 = _824 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2276 = _2266 & 3;
    bool _2278 = _2276 != 0;
    float _2280 = -_814;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2270);
    float _2284 = -_1656;
    float _2286 = _2284 + 1.0;
    int _2288 = _2256 * _2268;
    int _2290 = _2288 + _1876;
    float _2292 = -_814;
    float _2294 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2262);
    int _2296 = _2272 & 3;
    float _2298 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2282);
    float _2300 = _836 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2302 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2294);
    int _2304 = _2266 + _2296;
    float _2306 = _842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2308 = uint(_2290) >= uint(_384);
    float _2310 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2300);
    int _2312 = _2304 >> 2;
    float _2314 = _836 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2316 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2306);
    float _2318 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2310);
    int _2320 = _2312 << 4;
    int _2322 = _2320 + 368;
    float _2324 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2326 = -_814;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2274);
    bool _2330 = !_2308;
    int _2332 = _2330 ? 0 : (-1);
    uint _2334 = uint(int(uint(_2322) >> uint(2)));
    uint _2336 = uint(int(uint(int(_2334)) >> uint(2)));
    int _2338 = int(_2334) & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = int(_2334) + 1;
    uint _2344 = uint(int(uint(_2342) >> uint(2)));
    int _2346 = _2342 & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    float _2350 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2324);
    int _2352 = _2266 & 3;
    bool _2354 = _2352 != 0;
    float _2356 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2328);
    float _2358 = _2302 * _2260;
    float _2360 = _2298 * _2260;
    bool _2362 = uint(_2352) > 1u;
    float _2364 = _2356 * _2260;
    int _2366 = _2322 + 8;
    uint _2368 = uint(int(uint(_2366) >> uint(2)));
    uint _2370 = uint(int(uint(int(_2368)) >> uint(2)));
    int _2372 = int(_2368) & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    int _2376 = int(_2368) + 1;
    uint _2378 = uint(int(uint(_2376) >> uint(2)));
    int _2380 = _2376 & 3;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[int(_2378)][_2380];
    int _2384 = _2278 ? 0 : 1;
    float _2386 = fma(_2350, _2244, _2358);
    int _2388 = ~_2268;
    int _2390 = _2388 + _2332;
    int _2392 = _2390 + 1;
    float _2394 = fma(_2318, _2244, _2360);
    int _2396 = ~_2384;
    int _2398 = _2396 + 1;
    int _2400 = _2398 + 1;
    float _2402 = _836 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2404 = uint(_2352) >= 2u;
    int _2406 = _384 * _2392;
    int _2408 = _2406 + _1876;
    bool _2410 = !_2354;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2402);
    int _2416 = _2400;
    if (!_2362)
    {
        int _2418 = ~_2384;
        int _2420 = _2418 + 1;
        _2416 = _2420;
    }
    int _2422 = _2416;
    float _2424 = _842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2426 = _2352 != 3;
    float _2428 = _842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2430 = abs(_2422);
    float _2432 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2414);
    int _2434 = _2404 ? 0 : 1;
    float _2436 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2424);
    int _2438 = abs(_2412);
    float _2440 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    int _2442 = ~_2434;
    int _2444 = _2442 + 1;
    int _2446 = _2444 + 1;
    float _2448 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2428);
    bool _2450 = _2352 != 3;
    float _2452 = _1762 * _1668;
    int _2454 = ~_2430;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    float _2460 = fma(_2432, _2244, _2364);
    int _2462 = _2446;
    if (_2426)
    {
        int _2464 = ~_2434;
        int _2466 = _2464 + 1;
        _2462 = _2466;
    }
    int _2468 = _2462;
    float _2470 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2436);
    float _2472 = fma(_2440, _2252, _2386);
    float _2474 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2448);
    bool _2476 = !_2450;
    int _2478 = _2476 ? 0 : (-1);
    float _2480 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    int _2484 = abs(_2468);
    bool _2486 = !_1697;
    int _2488 = _2486 ? _2408 : (-1);
    float _2490 = _1689 * _2452;
    int _2492 = ~_2438;
    int _2494 = _2492 + 1;
    int _2496 = _2494 + 1;
    int _2498 = _2458 * as_type<int>(_2348);
    bool _2500 = !_1942;
    int _2502 = _2500 ? 0 : 1;
    float _2504 = fma(_2470, _2252, _2394);
    int _2506 = abs(_2478);
    int _2508 = _2496 * as_type<int>(_2340);
    int _2510 = _2508 + _2498;
    float _2512 = _1636 + _1586;
    float _2514 = fma(_2474, _2252, _2460);
    int _2516 = abs(_2502);
    float _2518 = _2512 * 0.5;
    int _2520 = ~_2484;
    int _2522 = _2520 + 1;
    int _2524 = _2522 + 1;
    float _2526 = fma(_2482, -2.0, 3.0);
    float _2528 = _2482 * _2482;
    int _2530 = _2524 * as_type<int>(_2374);
    int _2532 = _2530 + _2510;
    int _2534 = ~_2506;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    float _2540 = _2528 * _2526;
    float _2542 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2544 = ~_2516;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    float _2550 = fma(_1679, _2490, _1677);
    int _2552 = _2538 * as_type<int>(_2382);
    int _2554 = _2552 + _2532;
    float _2556 = -_2540;
    float _2558 = _2556 + 1.0;
    float _2560 = in.m_85.x;
    float _2562 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2542);
    int _2564 = _2554 * _2548;
    float _2566 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2540);
    float _2568 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2562);
    int _2570 = _2488 * _2516;
    int _2572 = _2570 + _2564;
    float _2574 = _1745 * _2566;
    float _2576 = _1586 * 0.5;
    float _2578 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2568);
    float _2580 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2582 = float(_2572);
    float _2584 = _2578 + _1586;
    out.gl_Position.x = _1636;
    out.gl_Position.y = _1638;
    out.gl_Position.z = _2578;
    out.gl_Position.w = _1586;
    float _2586 = _2286 * _2580;
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = fma(_1638, -0.5, _2576);
    float _2592 = _2584 * 0.5;
    out.m_87.x = _2582;
    float _2594 = -_2588;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2598 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2600 = isnan(_1392);
    bool _2602 = _2598 || _2600;
    bool _2604 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2606 = _2602 || _2604;
    out.m_89.x = _2518;
    out.m_89.y = _2590;
    out.m_89.z = _2592;
    out.m_89.w = _1586;
    float _2608 = _2596 * _2560;
    float _2610 = _1679 * _2452;
    out.m_91.x = _2472;
    out.m_91.y = _2504;
    out.m_91.z = _2514;
    float _2612 = -_1762;
    float _2614 = _2612 + 1.0;
    float _2616 = _2608 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2618 = fma(_1685, _2610, _1673);
    float _2620 = fma(_1687, _2610, _1675);
    float _2622 = _1679 * _2614;
    float _2624 = _1296 * _1352;
    out.m_93.x = _2616;
    float _2626 = _2560;
    float _2628 = _2610;
    float _2630 = _2578;
    float _2632 = _2624;
    if (!_2606)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2634 = _2626;
    float _2636 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2618;
    out.m_95.y = _2620;
    out.m_95.z = _2550;
    out.m_95.w = _2622;
    float _2638 = _2634;
    float _2640 = _2634;
    if (!_2606)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2642 = _2628;
    float _2644 = _2642;
    float _2646 = _2642;
    if (!_2606)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2648 = _1932;
    float _2650 = _2648;
    float _2652 = _2648;
    if (!_2606)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2654 = _2630;
    float _2656 = _2654;
    float _2658 = _2654;
    if (!_2606)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2660 = _1934;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2606)
    {
        _2632 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2666 = _2632;
    bool _2668 = !_2606;
    float _2670 = _2666;
    float _2672 = _2666;
    if (!_2668)
    {
        bool _2674 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2676 = isnan(_1392);
        bool _2678 = _2674 || _2676;
        bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2682 = _2678 || _2680;
        if (!_2682)
        {
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2686 = _1392 + _2684;
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2690 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2688;
            float _2692 = 1.0 / _2690;
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2714 = _2686 * _2692;
            float _2716 = precise::clamp(_2714, 0.0, 1.0);
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2722 = fma(_2716, _2696, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2724 = fma(_2716, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2726 = fma(_2716, _2700, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2728 = fma(_2716, _2704, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2730 = fma(_2716, _2708, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2732 = fma(_2716, _2712, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2646 = _2724;
            _2664 = _2730;
            _2640 = _2722;
            _2658 = _2728;
            _2652 = _2726;
            _2672 = _2732;
            _2734 = true;
        }
        else
        {
            bool _2736 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2738 = isnan(_1392);
            bool _2740 = _2736 || _2738;
            bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2744 = _2740 || _2742;
            if (!_2744)
            {
                _2638 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2746 = _2638;
            _2640 = _2746;
            if (!_2744)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2748 = _2644;
            _2646 = _2748;
            if (!_2744)
            {
                _2650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2750 = _2650;
            _2652 = _2750;
            if (!_2744)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2752 = _2656;
            _2658 = _2752;
            if (!_2744)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2754 = _2662;
            _2664 = _2754;
            if (!_2744)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2756 = _2670;
            bool _2758 = !_2744;
            _2672 = _2756;
            if (!_2758)
            {
                bool _2760 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2762 = isnan(_1392);
                bool _2764 = _2760 || _2762;
                bool _2766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2768 = _2764 || _2766;
                if (!_2768)
                {
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2772 = _1392 + _2770;
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2774;
                    float _2778 = 1.0 / _2776;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2800 = _2772 * _2778;
                    float _2802 = precise::clamp(_2800, 0.0, 1.0);
                    float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2808 = fma(_2802, _2782, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2810 = fma(_2802, _2806, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2812 = fma(_2802, _2786, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2814 = fma(_2802, _2790, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2816 = fma(_2802, _2794, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2818 = fma(_2802, _2798, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2646 = _2810;
                    _2664 = _2816;
                    _2640 = _2808;
                    _2658 = _2814;
                    _2652 = _2812;
                    _2672 = _2818;
                    _2734 = true;
                }
                else
                {
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2640 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2734 = false;
    float _2820 = _2646;
    float _2822 = _2664;
    float _2824 = _2640;
    float _2826 = _2658;
    float _2828 = _2652;
    float _2830 = _2672;
    float _2832 = fma(_2504, -0.5, 0.5);
    float _2834 = precise::clamp(_2832, 0.0, 1.0);
    float _2836 = -_2820;
    float _2838 = _2836 + _2822;
    float _2840 = _2636 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2842 = -_2824;
    float _2844 = _2842 + _2826;
    float _2846 = fma(_2834, _2838, _2820);
    out.m_97.x = 0.0;
    float _2848 = -_2828;
    float _2850 = _2848 + _2830;
    float _2852 = fma(_2834, _2844, _2824);
    float _2854 = _2846 * 0.586610972881317138671875;
    out.m_53.x = _2840;
    bool _2856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2858 = fma(_2834, _2850, _2828);
    float _2860 = fma(_2852, 0.298911988735198974609375, _2854);
    bool _2862 = _1296 > 0.0;
    bool _2864 = isnan(_1296);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan(0.0);
    bool _2870 = _2866 || _2868;
    float _2872 = fma(_2858, 0.114477999508380889892578125, _2860);
    bool _2874 = _1352 <= 0.0;
    bool _2876 = !_2870;
    bool _2878 = _2874 || _2876;
    float _2880 = -_2872;
    float _2882 = _2852 + _2880;
    float _2884 = -_2872;
    float _2886 = _2846 + _2884;
    float _2888 = -_2872;
    float _2890 = _2858 + _2888;
    float _2892 = fma(_2882, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2894 = fma(_2886, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    float _2896 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2872);
    bool _2898 = !_2856;
    if (!_2898)
    {
        float _2900 = -_1234;
        float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2904 = -_1236;
        float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2908 = -_1238;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2912 = _2902 * _2902;
        float _2914 = fma(_2906, _2906, _2912);
        float _2916 = fma(_2910, _2910, _2914);
        float _2918 = sqrt(_2916);
        float _2920 = rsqrt(_2916);
        float _2922 = -_2918;
        float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2926 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2928 = precise::clamp(_2926, 0.0, 1.0);
        float _2930 = _2906 * _2920;
        float _2932 = _2902 * _2920;
        float _2934 = abs(_2928);
        float _2936 = log2(_2934);
        float _2938 = _2910 * _2920;
        float _2940 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2942 = _2504 * _2932;
        float _2944 = -_2932;
        float _2946 = -_2940;
        float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2946);
        float _2950 = fma(_2472, _2930, _2942);
        float _2952 = -_2938;
        float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2948);
        float _2956 = fma(_2514, _2938, _2950);
        float _2958 = precise::clamp(_2956, 0.0, 1.0);
        float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2962 = _2954 + _2960;
        float _2964 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2966 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = exp2(_2964);
        float _2972 = _2970 * _2968;
        float _2974 = _2958 * _2972;
        float _2976 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2978 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2980 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2976;
        out.m_97.y = _2978;
        out.m_97.z = _2980;
    }
    out.m_67.x = _2892;
    out.m_67.y = _2894;
    out.m_67.z = _2896;
    if (!_2878)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2982 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2982;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

