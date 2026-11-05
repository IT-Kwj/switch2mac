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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_105 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_97 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 m_103 [[user(locn15)]];
    float4 m_101 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_89 [[attribute(8)]];
    float4 m_87 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
    float4 m_67 [[attribute(11)]];
    float4 m_91 [[attribute(12)]];
    float4 m_55 [[attribute(13)]];
    float4 m_73 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3790 = false;
    bool _572 = false;
    bool _368 = false;
    bool _256 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_44.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_47.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4087 = as_type<float>(_140);
        out.gl_Position.z = _4087;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.w;
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    bool _148 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_142);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_142;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _144;
    out.m_53.y = _146;
    float _162 = 0.0;
    float _164 = _160;
    if (_156)
    {
        float _166 = float(_124);
        _162 = _166;
    }
    float _168 = _162;
    bool _170 = _160 >= _168;
    bool _172 = !_156;
    bool _174 = _170 || _172;
    float _176 = in.m_51.z;
    if (_174)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _132;
    if (_174)
    {
        out.m_47.x = 0.0;
    }
    int _180 = 0;
    if (_174)
    {
        float _182 = _178 * 5.0;
        _180 = as_type<int>(_182);
    }
    int _184 = _180;
    if (_174)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4166 = as_type<float>(_184);
        out.gl_Position.z = _4166;
    }
    out.m_53.z = _176;
    if (_174)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _186 = in.m_55.x;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = in.m_55.y;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = in.m_63.x;
    float _212 = in.m_63.y;
    float _214 = in.m_63.z;
    out.m_65.x = _186;
    out.m_65.y = _190;
    float _216 = _194 * _200;
    float _218 = _194 * _206;
    float _220 = fma(_192, _198, _216);
    float _222 = _194 * _212;
    float _224 = fma(_192, _204, _218);
    float _226 = fma(_192, _210, _222);
    float _228 = fma(_196, _202, _220);
    float _230 = fma(_196, _208, _224);
    float _232 = fma(_196, _214, _226);
    bool _234 = !_188;
    float _236 = _190;
    float _238 = _186;
    float _254;
    if (!_234)
    {
        float _240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _242 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _244 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _246 = _244 * _240;
        float _248 = floor(_246);
        float _250 = -_248;
        float _252 = _246 + _250;
        _254 = _252;
        _256 = true;
    }
    else
    {
        float _258 = float(_124);
        float _260 = 1.0 / _258;
        float _262 = _160 * _260;
        _254 = _262;
    }
    _256 = false;
    float _264 = _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _264 + _266;
    bool _270 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_264);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    bool _286 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _288 = isnan(_264);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_280;
    float _300 = _298 + 1.0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = 1.0 / _284;
    bool _308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _310 = _296 * _300;
    float _312 = -_296;
    float _314 = _312 + 1.0;
    float _316 = _268 * _306;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    float _322 = fma(_304, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = fma(_320, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = _322 * _310;
    float _332 = fma(_326, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _334 = _328 * _310;
    float _336 = _332 * _310;
    float _338 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].x, _330);
    float _340 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].y, _336);
    float _342 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _344 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[144].x, _338);
    float _346 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[144].y, _340);
    float _348 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[144].z, _342);
    bool _350 = !_308;
    float _366;
    if (!_350)
    {
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_124);
        float _372 = 1.0 / _370;
        float _374 = _160 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _380 = _376 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _386 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _388 = isnan(_376);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _406 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_376);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = 1.0 / _384;
    float _420 = -_396;
    float _422 = _420 + 1.0;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _424;
    bool _428 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _430 = isnan(_376);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = _416 * _422;
    float _442 = -_416;
    float _444 = _442 + 1.0;
    float _446 = 1.0 / _400;
    float _448 = _438 * _444;
    float _450 = -_438;
    float _452 = _450 + 1.0;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _458 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _460 = 1.0 / _404;
    float _462 = _426 * _418;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _470 = fma(_462, _380, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _472 = _454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = _466 * _446;
    bool _478 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = isnan(_376);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _376 + _494;
    float _498 = _470 * _448;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _502 = _376 + _500;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    float _508 = fma(_476, _496, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _510 = _492 * _460;
    float _512 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[115].x, _498);
    float _514 = _396 * _506;
    float _516 = fma(_510, _502, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _518 = fma(_508, _440, _512);
    float _520 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _522 = fma(_516, _514, _518);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _528 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[118].x, _522);
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _534 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = in.m_67.x;
    float _544 = in.m_67.y;
    float _546 = in.m_67.z;
    out.m_69.x = _534;
    out.m_69.y = _536;
    out.m_69.z = _540;
    out.m_69.w = _530;
    out.m_71.x = _472;
    out.m_71.y = _474;
    out.m_71.z = _520;
    out.m_71.w = _538;
    float _548 = _348 * _546;
    float _550 = _346 * _544;
    float _552 = _344 * _542;
    bool _554 = !_458;
    float _570;
    if (!_554)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _558 = _144 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        float _574 = float(_124);
        float _576 = 1.0 / _574;
        float _578 = _160 * _576;
        _570 = _578;
    }
    _572 = false;
    float _580 = _570;
    float _582 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _584 = int(_582);
    float _586 = float(_124);
    float _588 = in.m_73.w;
    float _590 = in.m_59.w;
    float _592 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _594 = int(_592);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _620 = float(_584);
    float _622 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _624 = int(_622);
    float _626 = in.m_61.w;
    float _628 = float(_594);
    float _630 = 1.0 / _620;
    out.m_75.w = _588;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _640 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _642 = isnan(_580);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    bool _652 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _654 = isnan(_580);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _666 = int(_664);
    float _668 = float(uint(_624));
    int _670 = ~_624;
    int _672 = _670 + 1;
    bool _674 = _624 == 0;
    float _676 = 1.0 / _628;
    float _678 = _630 * _160;
    bool _680 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _682 = isnan(_580);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _692;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _698 = _696 != 0;
    float _700 = float(uint(_666));
    float _702 = 1.0 / _668;
    int _704 = ~_666;
    int _706 = _704 + 1;
    bool _708 = _666 == 0;
    int _710 = ~_666;
    int _712 = _710 + 1;
    float _714 = _676 * _160;
    float _716 = trunc(_678);
    int _718 = int(_716);
    float _720 = 1.0 / _700;
    int _722 = as_type<int>(_702) + (-2);
    float _724 = trunc(_714);
    int _726 = int(_724);
    float _728 = float(uint(_718));
    float _730 = as_type<float>(_722) * _728;
    int _732 = as_type<int>(_720) + (-2);
    float _734 = 1.0 / _586;
    float _736 = float(uint(_726));
    float _738 = trunc(_730);
    float _740 = precise::max(_738, 0.0);
    uint _743 = uint(_740);
    float _745 = as_type<float>(_732) * _736;
    int _747 = ~_624;
    int _749 = _747 + 1;
    float _751 = trunc(_745);
    float _753 = precise::max(_751, 0.0);
    uint _755 = uint(_753);
    float _757 = _734 * _160;
    int _759 = _749 * int(_743);
    int _761 = _759 + _718;
    float _763 = 1.0 / _602;
    float _765 = float(uint(_761));
    int _767 = _706 * int(_755);
    int _769 = _767 + _726;
    float _771 = 1.0 / _598;
    float _773 = as_type<float>(_722) * _765;
    float _775 = _765;
    float _777 = as_type<float>(_769);
    if (_698)
    {
        _775 = 1.0;
    }
    float _779 = _775;
    float _781 = float(uint(_769));
    float _783 = _779;
    float _785 = _781;
    if (!_698)
    {
        _783 = 7.345489978790283203125;
    }
    float _787 = _783;
    float _789 = trunc(_773);
    float _791 = precise::max(_789, 0.0);
    uint _793 = uint(_791);
    float _795 = as_type<float>(_732) * _781;
    if (_698)
    {
        _785 = _144;
    }
    float _797 = _785;
    float _799 = _787 * _144;
    float _801 = _797;
    if (_698)
    {
        _777 = 1.0;
    }
    float _803 = _777;
    float _805 = _803;
    if (!_698)
    {
        _801 = _146;
    }
    float _807 = _801;
    float _809 = trunc(_795);
    float _811 = precise::max(_809, 0.0);
    uint _813 = uint(_811);
    if (!_698)
    {
        _805 = 1.2345600128173828125;
    }
    float _815 = _805;
    float _817 = _807 * _815;
    float _819 = float(_624);
    float _821 = floor(_799);
    int _823 = int(_743) + int(_793);
    int _825 = ~_666;
    int _827 = _825 + 1;
    float _829 = float(_718);
    int _831 = _672 * _823;
    int _833 = _831 + _718;
    float _835 = floor(_817);
    int _837 = int(_755) + int(_813);
    bool _839 = _829 >= _819;
    bool _841 = isnan(_829);
    bool _843 = _839 || _841;
    bool _845 = isnan(_819);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    bool _851 = uint(_833) >= uint(_624);
    int _853 = _827 * _837;
    int _855 = _853 + _726;
    float _857 = -_821;
    float _859 = _799 + _857;
    float _861 = float(_666);
    float _863 = trunc(_849);
    int _865 = int(_863);
    bool _867 = uint(_855) >= uint(_666);
    float _869 = _819 * _859;
    float _871 = float(_726);
    float _873 = -_835;
    float _875 = _817 + _873;
    bool _877 = !_851;
    int _879 = _877 ? 0 : (-1);
    float _881 = _819 * _757;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _885 = _883 != 0;
    float _887 = trunc(_869);
    int _889 = int(_887);
    int _891 = ~_823;
    int _893 = _891 + _879;
    int _895 = _893 + 1;
    float _897 = _861 * _875;
    bool _899 = _871 >= _861;
    bool _901 = isnan(_871);
    bool _903 = _899 || _901;
    bool _905 = isnan(_861);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    bool _911 = !_885;
    int _913 = _911 ? 0 : 1;
    int _915 = _624 * _895;
    int _917 = _915 + _718;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _921 = _919 != 0;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _925 = _923 != 0;
    float _927 = 1.0 / _610;
    int _929 = abs(_913);
    float _931 = _861 * _757;
    bool _933 = !_867;
    int _935 = _933 ? 0 : (-1);
    bool _937 = !_674;
    int _939 = _937 ? _917 : (-1);
    int _941 = ~_837;
    int _943 = _941 + _935;
    int _945 = _943 + 1;
    float _947 = trunc(_909);
    int _949 = int(_947);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _953 = _951 != 0;
    int _955 = _889 * _929;
    int _957 = _955 + _718;
    int _959 = ~_865;
    int _961 = _959 + 1;
    int _963 = _961 + 1;
    int _965 = _666 * _945;
    int _967 = _965 + _726;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _975 = _973 != 0;
    int _977 = _963 * _939;
    bool _979 = !_708;
    int _981 = _979 ? _967 : (-1);
    float _983 = trunc(_897);
    int _985 = int(_983);
    int _987 = _624 + (-1);
    int _989 = ~_949;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    int _995 = _865 * _987;
    int _997 = _995 + _977;
    bool _999 = !_953;
    int _1001 = _999 ? 0 : 1;
    float _1003 = 1.0 / _606;
    bool _1005 = !_925;
    int _1007 = _1005 ? 0 : 1;
    int _1009 = _993 * _981;
    bool _1011 = !_975;
    int _1013 = _1011 ? 0 : 1;
    int _1015 = abs(_1001);
    int _1017 = abs(_1013);
    float _1019 = 1.0 / _614;
    int _1021 = abs(_1007);
    bool _1023 = !_921;
    int _1025 = _1023 ? 0 : 1;
    int _1027 = _985 * _1015;
    int _1029 = _1027 + _726;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1033 = _1031 != 0;
    float _1035 = trunc(_881);
    int _1037 = int(_1035);
    int _1039 = abs(_1025);
    int _1041 = _997 * _1021;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1045 = _1043 != 0;
    int _1047 = _666 + (-1);
    bool _1049 = !_1033;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = trunc(_931);
    int _1055 = int(_1053);
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1059 = _1057 != 0;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1063 = _1061 != 0;
    int _1065 = _949 * _1047;
    int _1067 = _1065 + _1009;
    bool _1069 = !_971;
    int _1071 = _1069 ? 0 : 1;
    bool _1073 = _624 == 0;
    int _1075 = _1067 * _1017;
    int _1077 = abs(_1071);
    int _1079 = _1037 * _1039;
    int _1081 = _1079 + _1041;
    bool _1083 = !_1045;
    int _1085 = _1083 ? 0 : 1;
    float _1087 = _144 * 2.0;
    int _1089 = abs(_1051);
    float _1091 = 1.0 / _618;
    bool _1093 = !_1059;
    int _1095 = _1093 ? 0 : 1;
    int _1097 = abs(_1085);
    int _1099 = _1055 * _1077;
    int _1101 = _1099 + _1075;
    int _1103 = abs(_1095);
    float _1105 = floor(_1087);
    int _1107 = _957 * _1089;
    int _1109 = _1107 + _1081;
    bool _1111 = !_1063;
    int _1113 = _1111 ? 0 : 1;
    int _1115 = _889 * _1097;
    int _1117 = _1115 + _1109;
    int _1119 = abs(_1113);
    int _1121 = ~_666;
    int _1123 = _1121 + 1;
    int _1125 = _1029 * _1103;
    int _1127 = _1125 + _1101;
    float _1129 = float(uint(_1117));
    int _1131 = ~_624;
    int _1133 = _1131 + 1;
    int _1135 = _985 * _1119;
    int _1137 = _1135 + _1127;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1141 = _1139 != 0;
    float _1143 = as_type<float>(_722) * _1129;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1147 = _1145 != 0;
    float _1149 = float(uint(_1137));
    float _1151 = trunc(_1143);
    float _1153 = precise::max(_1151, 0.0);
    uint _1155 = uint(_1153);
    float _1157 = as_type<float>(_732) * _1149;
    int _1159 = ~_624;
    int _1161 = _1159 + 1;
    bool _1163 = _971;
    float _1165 = as_type<float>(_1137);
    if (_1141)
    {
        bool _1167 = _144 > 0.5;
        _1163 = _1167;
    }
    bool _1169 = _1163;
    float _1171 = trunc(_1157);
    float _1173 = precise::max(_1171, 0.0);
    uint _1175 = uint(_1173);
    int _1177 = _1161 * int(_1155);
    int _1179 = _1177 + _1117;
    float _1181 = float(uint(_1179));
    int _1183 = _1123 * int(_1175);
    int _1185 = _1183 + _1137;
    float _1187 = as_type<float>(_722) * _1181;
    float _1189 = float(uint(_1185));
    float _1191 = trunc(_1187);
    float _1193 = precise::max(_1191, 0.0);
    uint _1195 = uint(_1193);
    float _1197 = as_type<float>(_732) * _1189;
    float _1199 = trunc(_1197);
    float _1201 = precise::max(_1199, 0.0);
    uint _1203 = uint(_1201);
    int _1205 = int(_1155) + int(_1195);
    int _1207 = ~_666;
    int _1209 = _1207 + 1;
    int _1211 = _1133 * _1205;
    int _1213 = _1211 + _1117;
    int _1215 = int(_1175) + int(_1203);
    int _1217 = _1209;
    float _1219 = as_type<float>(_1175);
    if (_1141)
    {
        float _1221 = -_186;
        float _1223 = _1221 + 1.0;
        _1217 = as_type<int>(_1223);
    }
    int _1225 = _1217;
    bool _1227 = uint(_1213) >= uint(_624);
    if (!_1141)
    {
        _1219 = _186;
    }
    float _1229 = _1219;
    int _1231 = _1209 * _1215;
    int _1233 = _1231 + _1137;
    bool _1235 = !_1227;
    int _1237 = _1235 ? 0 : (-1);
    float _1239 = _1229;
    if (_1141)
    {
        float _1241 = _1169 ? as_type<float>(_1225) : _186;
        _1239 = _1241;
    }
    float _1243 = _1239;
    float _1245 = -_190;
    float _1247 = _1245 + 1.0;
    int _1249 = ~_1205;
    int _1251 = _1249 + _1237;
    int _1253 = _1251 + 1;
    bool _1255 = _146 > 0.5;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1259 = _1257 != 0;
    int _1261 = _624 * _1253;
    int _1263 = _1261 + _1117;
    bool _1265 = uint(_1233) >= uint(_666);
    int _1267 = _1255 ? as_type<int>(_1247) : as_type<int>(_190);
    bool _1269 = _146 > 0.5;
    bool _1271 = _1269 && _1259;
    bool _1273 = !_1265;
    int _1275 = _1273 ? 0 : (-1);
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1279 = _1277 != 0;
    bool _1281 = _176 > 0.5;
    bool _1283 = !_1073;
    int _1285 = _1283 ? _1263 : (-1);
    int _1287 = ~_1215;
    int _1289 = _1287 + _1275;
    int _1291 = _1289 + 1;
    float _1293 = _1279 ? as_type<float>(_1267) : _190;
    if (_1147)
    {
        float _1295 = _1281 ? _1247 : _190;
        _236 = _1295;
    }
    float _1297 = _236;
    int _1299 = _666 * _1291;
    int _1301 = _1299 + _1137;
    int _1303 = _1285 & 3;
    float _1305 = in.m_44.x;
    float _1307 = in.m_44.y;
    float _1309 = in.m_44.z;
    if (!_1259)
    {
        _1165 = _186;
    }
    float _1311 = _1165;
    float _1313 = _1311;
    if (_1271)
    {
        float _1315 = -_186;
        float _1317 = _1315 + 1.0;
        _238 = _1317;
    }
    float _1319 = _238;
    bool _1321 = _1303 != 3;
    float _1323 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1325 = uint(_1303) >= 2u;
    float _1327 = float(uint(_957));
    bool _1329 = !_708;
    int _1331 = _1329 ? _1301 : (-1);
    if (_1259)
    {
        _1313 = _1319;
    }
    float _1333 = _1313;
    float _1335 = as_type<float>(_722) * _1327;
    int _1337 = _1325 ? 0 : 1;
    float _1339 = float(uint(_1029));
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1343 = _1341 != 0;
    float _1345 = trunc(_1335);
    float _1347 = precise::max(_1345, 0.0);
    uint _1349 = uint(_1347);
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1353 = _1351 != 0;
    float _1355 = as_type<float>(_732) * _1339;
    int _1357 = _1331 & 3;
    int _1359 = ~_1337;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    float _1365 = _206 * _1307;
    int _1367 = _1363;
    if (_1321)
    {
        int _1369 = ~_1337;
        int _1371 = _1369 + 1;
        _1367 = _1371;
    }
    int _1373 = _1367;
    float _1375 = trunc(_1355);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    bool _1381 = uint(_1357) >= 2u;
    float _1383 = _200 * _1307;
    bool _1385 = uint(_1303) > 1u;
    float _1387 = _212 * _1307;
    int _1389 = _1285 & 3;
    bool _1391 = _1389 != 0;
    float _1393 = fma(_204, _1305, _1365);
    int _1395 = _1381 ? 0 : 1;
    float _1397 = fma(_210, _1305, _1387);
    bool _1399 = _1357 != 3;
    float _1401 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1403 = _1391 ? 0 : 1;
    float _1405 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1407 = ~_624;
    int _1409 = _1407 + 1;
    float _1411 = fma(_214, _1309, _1397);
    int _1413 = ~_1403;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    int _1419 = _1417;
    if (!_1385)
    {
        int _1421 = ~_1403;
        int _1423 = _1421 + 1;
        _1419 = _1423;
    }
    int _1425 = _1419;
    int _1427 = ~_1395;
    int _1429 = _1427 + 1;
    int _1431 = _1429 + 1;
    int _1433 = _1431;
    if (_1399)
    {
        int _1435 = ~_1395;
        int _1437 = _1435 + 1;
        _1433 = _1437;
    }
    int _1439 = _1433;
    int _1441 = _1409 * int(_1349);
    int _1443 = _1441 + _957;
    bool _1445 = uint(_1357) > 1u;
    float _1447 = fma(_198, _1305, _1383);
    int _1449 = _712 * int(_1379);
    int _1451 = _1449 + _1029;
    int _1453 = _1331 & 3;
    bool _1455 = _1453 != 0;
    float _1457 = _146 * 2.0;
    float _1459 = float(uint(_1443));
    float _1461 = fma(_202, _1309, _1447);
    float _1463 = float(uint(_1451));
    float _1465 = floor(_1457);
    int _1467 = _1455 ? 0 : 1;
    float _1469 = as_type<float>(_722) * _1459;
    float _1471 = as_type<float>(_732) * _1463;
    int _1473 = ~_1467;
    int _1475 = _1473 + 1;
    int _1477 = _1475 + 1;
    float _1479 = fma(_208, _1309, _1393);
    int _1481 = _1477;
    if (!_1445)
    {
        int _1483 = ~_1467;
        int _1485 = _1483 + 1;
        _1481 = _1485;
    }
    int _1487 = _1481;
    float _1489 = trunc(_1469);
    float _1491 = precise::max(_1489, 0.0);
    uint _1493 = uint(_1491);
    bool _1495 = _1105 >= 0.0;
    bool _1497 = isnan(_1105);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.0);
    bool _1503 = _1499 || _1501;
    float _1505 = _176 * 2.0;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1509 = _1503 ? 0 : 1;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1513 = _580 + _1511;
    bool _1515 = _1105 > 0.0;
    float _1517 = trunc(_1471);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    bool _1523 = !_1343;
    int _1525 = _1523 ? 0 : 1;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1529 = ~_1509;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = -_1507;
    float _1537 = fma(_1401, 2.0, _1535);
    bool _1539 = _1465 > 0.0;
    float _1541 = fma(_1405, -2.0, _1527);
    int _1543 = ~_624;
    int _1545 = _1543 + 1;
    float _1547 = floor(_1505);
    int _1549 = int(_1349) + int(_1493);
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1553 = _580 + _1551;
    float _1555 = _1513 * _763;
    int _1557 = _1533;
    if (!_1515)
    {
        int _1559 = ~_1509;
        int _1561 = _1559 + 1;
        _1557 = _1561;
    }
    int _1563 = _1557;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1567 = _580 + _1565;
    bool _1569 = _1465 >= 0.0;
    bool _1571 = isnan(_1465);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.0);
    bool _1577 = _1573 || _1575;
    int _1579 = _1545 * _1549;
    int _1581 = _1579 + _957;
    int _1583 = ~_666;
    int _1585 = _1583 + 1;
    float _1587 = _1553 * _771;
    int _1589 = int(_1379) + int(_1521);
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1593 = _580 + _1591;
    int _1595 = _1577 ? 0 : 1;
    float _1597 = _1567 * _927;
    int _1599 = _1585 * _1589;
    int _1601 = _1599 + _1029;
    int _1603 = ~_1595;
    int _1605 = _1603 + 1;
    int _1607 = _1605 + 1;
    float _1609 = _1593 * _1003;
    bool _1611 = !_1353;
    int _1613 = _1611 ? 0 : 1;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1617 = _580 + _1615;
    bool _1619 = uint(_1601) >= uint(_666);
    float _1621 = _146 + _176;
    int _1623 = _1607;
    if (!_1539)
    {
        int _1625 = ~_1595;
        int _1627 = _1625 + 1;
        _1623 = _1627;
    }
    int _1629 = _1623;
    float _1631 = _144 + _146;
    bool _1633 = uint(_1581) >= uint(_624);
    float _1635 = _1621 + (-1.0);
    bool _1637 = !_1619;
    int _1639 = _1637 ? 0 : (-1);
    float _1641 = _1631 + (-1.0);
    int _1643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1645 = _1643 != 0;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1649 = _1647 != 0;
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1653 = _1651 != 0;
    float _1655 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1657 = _1547 >= 0.0;
    bool _1659 = isnan(_1547);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan(0.0);
    bool _1665 = _1661 || _1663;
    float _1667 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1671 = _580 + _1669;
    int _1673 = _1665 ? 0 : 1;
    float _1675 = _1617 * _1019;
    bool _1677 = _1547 > 0.0;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1681 = fma(_634, _1587, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1683 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1679);
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1687 = _580 + _1685;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1689;
    float _1693 = fma(_638, _1555, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1695 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1697 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1683);
    float _1699 = 1.0 / _1691;
    float _1701 = _1687 * _1091;
    float _1703 = _1461 + _590;
    float _1705 = _1479 + _626;
    float _1707 = -_160;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1537);
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1713 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1711;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1719 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1541);
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1723 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1725 = -_1719;
    float _1727 = fma(_1697, _1695, _1725);
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1729;
    float _1733 = _1671 * _1699;
    float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1737 = _1735 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1739 = fma(_1731, _1587, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1741 = !_1649;
    int _1743 = _1741 ? 0 : 1;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1745;
    float _1749 = fma(_1737, _1555, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1753 = _1751 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1755;
    float _1759 = fma(_1747, _1609, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1761;
    float _1765 = fma(_1753, _1597, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1767 = fma(_1717, _1597, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1769 = fma(_1757, _1675, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1775 = fma(_1763, _1675, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1779 = _1777 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _1781 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1783 = isnan(_580);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    float _1793 = fma(_1773, _1701, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1795 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1797 = isnan(_580);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    float _1807 = fma(_1779, _1701, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1809 = fma(_1713, _1609, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1811 = -_1791;
    float _1813 = _1811 + 1.0;
    bool _1815 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1817 = isnan(_580);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    float _1827 = -_1805;
    float _1829 = _1827 + 1.0;
    float _1831 = _1805 * _1813;
    bool _1833 = !_1633;
    int _1835 = _1833 ? 0 : (-1);
    float _1837 = in.m_63.w;
    float _1839 = -_1825;
    float _1841 = _1839 + 1.0;
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1843;
    int _1847 = abs(_1425);
    float _1849 = _1791 * _1841;
    float _1851 = _650 * _1829;
    float _1853 = -_650;
    float _1855 = _1853 + 1.0;
    float _1857 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1859 = log2(_1857);
    float _1861 = fma(_1845, _1733, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1863 = fma(_694, _1733, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1865 = _662 * _1855;
    float _1867 = -_662;
    float _1869 = _1867 + 1.0;
    bool _1871 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1873 = isnan(_580);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1879 = _1875 || _1877;
    float _1881 = float(_1879);
    bool _1883 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1885 = isnan(_580);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1891 = _1887 || _1889;
    float _1893 = float(_1891);
    float _1895 = _690 * _1869;
    float _1897 = -_690;
    float _1899 = _1897 + 1.0;
    int _1901 = ~_1589;
    int _1903 = _1901 + _1639;
    int _1905 = _1903 + 1;
    float _1907 = -_1893;
    float _1909 = _1907 + 1.0;
    float _1911 = _1881 * _1899;
    float _1913 = -_1881;
    float _1915 = _1913 + 1.0;
    int _1917 = abs(_1487);
    float _1919 = _1411 + _1837;
    float _1921 = _1859 * _160;
    float _1923 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1721);
    float _1925 = _1893 * _1915;
    int _1927 = ~_1673;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    int _1933 = _666 * _1905;
    int _1935 = _1933 + _1029;
    float _1937 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1923);
    int _1939 = _1931;
    if (!_1677)
    {
        int _1941 = ~_1673;
        int _1943 = _1941 + 1;
        _1939 = _1943;
    }
    int _1945 = _1939;
    float _1947 = exp2(_1921);
    int _1949 = _1285 >> 31;
    float _1951 = fma(_1937, _1723, _1709);
    float _1953 = _1681 * _1925;
    float _1955 = _1739 * _1925;
    int _1957 = _1949 & 3;
    int _1959 = _1331 >> 31;
    float _1961 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1953);
    int _1963 = _1285 + _1957;
    float _1965 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1955);
    int _1967 = _1959 & 3;
    float _1969 = fma(_1693, _1911, _1961);
    int _1971 = _1963 >> 2;
    float _1973 = fma(_1749, _1911, _1965);
    bool _1975 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1977 = isnan(0.0);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1983 = _1979 || _1981;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1987 = _1971 << 4;
    int _1989 = _1987 + 368;
    float _1991 = -_1947;
    float _1993 = _1991 + 1.0;
    int _1995 = _1331 + _1967;
    float _1997 = fma(_1759, _1895, _1969);
    uint _1999 = uint(int(uint(_1989) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    float _2015 = _1727 + 0.5;
    float _2017 = _1983 ? _1993 : 0.0;
    float _2019 = fma(_1809, _1895, _1973);
    int _2021 = _1995 >> 2;
    float _2023 = _1951 + 0.5;
    float _2025 = fma(_1765, _1865, _1997);
    int _2027 = abs(_1743);
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2031 = _1705 + _2029;
    int _2033 = _2021 << 4;
    int _2035 = _2033 + 512;
    float _2037 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2039 = _1323 * _1985;
    out.m_77.x = _2023;
    out.m_77.y = _2015;
    uint _2041 = uint(int(uint(_2035) >> uint(2)));
    uint _2043 = uint(int(uint(int(_2041)) >> uint(2)));
    int _2045 = int(_2041) & 3;
    float _2047 = (*spvDescriptorSet0.vp_c9)._m0[int(_2043)][_2045];
    int _2049 = int(_2041) + 1;
    uint _2051 = uint(int(uint(_2049) >> uint(2)));
    int _2053 = _2049 & 3;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[int(_2051)][_2053];
    float _2057 = fma(_1767, _1865, _2019);
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2061 = _1703 + _2059;
    float _2063 = float(_1563);
    float _2065 = fma(_1769, _1851, _2025);
    float _2067 = float(_2027);
    float _2069 = fma(_1775, _1851, _2057);
    int _2071 = _1989 + 8;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
    int _2077 = int(_2073) & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_2073) + 1;
    uint _2083 = uint(int(uint(_2081) >> uint(2)));
    int _2085 = _2081 & 3;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[int(_2083)][_2085];
    float _2089 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2091 = ~_1549;
    int _2093 = _2091 + _1835;
    int _2095 = _2093 + 1;
    float _2097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2099 = !_1391;
    int _2101 = _2099 ? 0 : 1;
    float _2103 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2089);
    int _2105 = _624 * _2095;
    int _2107 = _2105 + _957;
    int _2109 = _2035 + 8;
    uint _2111 = uint(int(uint(_2109) >> uint(2)));
    uint _2113 = uint(int(uint(int(_2111)) >> uint(2)));
    int _2115 = int(_2111) & 3;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[int(_2113)][_2115];
    int _2119 = int(_2111) + 1;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    int _2123 = _2119 & 3;
    float _2125 = (*spvDescriptorSet0.vp_c9)._m0[int(_2121)][_2123];
    bool _2127 = !_1455;
    int _2129 = _2127 ? 0 : 1;
    float _2131 = fma(_1793, _1831, _2065);
    bool _2133 = _1303 != 3;
    float _2135 = fma(_1807, _1831, _2069);
    int _2137 = abs(_2101);
    float _2139 = fma(_1861, _1849, _2131);
    int _2141 = ~_1847;
    int _2143 = _2141 + 1;
    int _2145 = _2143 + 1;
    float _2147 = fma(_1863, _1849, _2135);
    int _2149 = ~_2137;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    float _2155 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2139);
    int _2157 = abs(_2129);
    float _2159 = _2037 * _2097;
    float _2161 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2147);
    int _2163 = abs(_1373);
    int _2165 = ~_1917;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    out.m_79.x = _2159;
    out.m_79.y = _2039;
    int _2171 = _2145 * as_type<int>(_2013);
    int _2173 = abs(_1439);
    int _2175 = _2153 * as_type<int>(_2005);
    int _2177 = _2175 + _2171;
    bool _2179 = !_2133;
    int _2181 = _2179 ? 0 : (-1);
    out.m_81.x = _2155;
    out.m_81.y = _2161;
    bool _2183 = _1357 != 3;
    int _2185 = abs(_2181);
    float _2187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2189 = _1919 + _2187;
    int _2191 = ~_2157;
    int _2193 = _2191 + 1;
    int _2195 = _2193 + 1;
    float _2197 = _2067 * _2063;
    int _2199 = _2169 * as_type<int>(_2055);
    int _2201 = ~_2163;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2103);
    bool _2209 = !_2183;
    int _2211 = _2209 ? 0 : (-1);
    int _2213 = _2195 * as_type<int>(_2047);
    int _2215 = _2213 + _2199;
    int _2217 = ~_2173;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    int _2223 = abs(_1525);
    int _2225 = _2205 * as_type<int>(_2079);
    int _2227 = _2225 + _2177;
    int _2229 = abs(_2211);
    int _2231 = abs(_1613);
    int _2233 = ~_2185;
    int _2235 = _2233 + 1;
    int _2237 = _2235 + 1;
    int _2239 = _2221 * as_type<int>(_2117);
    int _2241 = _2239 + _2215;
    int _2243 = ~_2229;
    int _2245 = _2243 + 1;
    int _2247 = _2245 + 1;
    int _2249 = _2237 * as_type<int>(_2087);
    int _2251 = _2249 + _2227;
    int _2253 = ~_2223;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = _2247 * as_type<int>(_2125);
    int _2261 = _2259 + _2241;
    bool _2263 = _624 == 0;
    int _2265 = ~_2231;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    int _2271 = _2257 * _2251;
    bool _2273 = !_2263;
    int _2275 = _2273 ? _2107 : (-1);
    float _2277 = _2031 * _2031;
    bool _2279 = _666 == 0;
    int _2281 = _2269 * _2261;
    int _2283 = _2275 * _2223;
    int _2285 = _2283 + _2271;
    bool _2287 = _2207 >= 0.0;
    float _2289 = fma(_2061, _2061, _2277);
    bool _2291 = !_2279;
    int _2293 = _2291 ? _1935 : (-1);
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2297 = 1.0 + _2295;
    bool _2299 = !_1645;
    int _2301 = _2299 ? 0 : 1;
    float _2303 = fma(_2189, _2189, _2289);
    bool _2305 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2307 = isnan(1.0);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2313 = _2309 || _2311;
    int _2315 = _2293 * _2231;
    int _2317 = _2315 + _2281;
    int _2319 = abs(_2301);
    float _2321 = 1.0 / _2297;
    float _2323 = float(_2285);
    float _2325 = in.m_83.x;
    float _2327 = in.m_83.y;
    float _2329 = in.m_83.z;
    float _2331 = as_type<float>(_2157);
    float _2333 = _2131;
    if (_2287)
    {
        _2331 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2335 = _2331;
    float _2337 = float(_2317);
    int _2339 = as_type<int>(_2335);
    if (_2287)
    {
        out.m_47.x = 0.0;
    }
    float _2341 = rsqrt(_2303);
    if (_2287)
    {
        float _2343 = _2335 * 5.0;
        _2339 = as_type<int>(_2343);
    }
    int _2345 = _2339;
    bool _2347 = !_1653;
    int _2349 = _2347 ? 0 : 1;
    out.m_85.x = _2323;
    out.m_85.y = _2337;
    float _2351 = float(_1945);
    float _2353 = float(_2319);
    if (_2287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7362 = as_type<float>(_2345);
        out.gl_Position.z = _7362;
    }
    if (_2313)
    {
        float _2355 = _2017 * _2321;
        _164 = _2355;
    }
    float _2357 = _164;
    float _2359 = _2031 * _2341;
    float _2361 = _2061 * _2341;
    if (_2287)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2363 = -_2359;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1705);
    float _2367 = _2353 * _2351;
    float _2369 = _2189 * _2341;
    float _2371 = -_2361;
    float _2373 = fma(_2371, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1703);
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2377 = _2365 + _2375;
    float _2379 = _2367 * (-2.0);
    float _2381 = -_2369;
    float _2383 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1919);
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2387 = _2373 + _2385;
    float _2389 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2391 = fma(_2379, _2325, _2325);
    float _2393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2395 = _2383 + _2393;
    float _2397 = _144 + (-0.5);
    float _2399 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2389);
    float _2401 = _2197 * (-2.0);
    float _2403 = fma(_1667, _2379, _1667);
    float _2405 = fma(_2397, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2391);
    float _2407 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2399);
    float _2409 = _146 + (-0.5);
    float _2411 = fma(_2401, _2327, _2327);
    float _2413 = fma(_2403, _2357, _2405);
    float _2415 = fma(_1655, _2401, _1655);
    bool _2417 = _2407 >= 0.0;
    float _2419 = fma(_2409, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2411);
    float _2421 = _2413 * 0.15915493667125701904296875;
    int _2423 = abs(_2349);
    float _2425 = -_2359;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2031);
    float _2429 = fma(_2415, _2357, _2419);
    float _2431 = _2421 * 6.283185482025146484375;
    float _2433 = sin(_2431);
    float _2435 = float(_2423);
    float _2437 = -_2361;
    float _2439 = fma(_2437, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2061);
    float _2441 = _2429 * 0.15915493667125701904296875;
    float _2443 = _2427 * _2427;
    float _2445 = float(_1629);
    float _2447 = -_2369;
    float _2449 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2189);
    float _2451 = _2401;
    float _2453 = _2369;
    float _2455 = _2439;
    if (_2417)
    {
        _2451 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2457 = _2451;
    float _2459 = _2421 * 6.283185482025146484375;
    float _2461 = cos(_2459);
    float _2463 = fma(_2439, _2439, _2443);
    int _2465 = as_type<int>(_2457);
    if (_2417)
    {
        out.m_47.x = 0.0;
    }
    float _2467 = _2435 * _2445;
    if (_2417)
    {
        float _2469 = _2457 * 5.0;
        _2465 = as_type<int>(_2469);
    }
    int _2471 = _2465;
    float _2473 = fma(_2449, _2449, _2463);
    float _2475 = _2441 * 6.283185482025146484375;
    float _2477 = sin(_2475);
    float _2479 = _2473;
    if (_2417)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7575 = as_type<float>(_2471);
        out.gl_Position.z = _7575;
    }
    if (_2417)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2481 = -_1705;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2485 = -_1703;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2489 = -_1919;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2493 = sqrt(_2473);
    float _2495 = _2483 * _2483;
    float _2497 = _144 + _176;
    float _2499 = _2467 * (-2.0);
    float _2501 = fma(_2487, _2487, _2495);
    float _2503 = _2497 + (-1.0);
    float _2505 = _176 + (-0.5);
    float _2507 = fma(_2499, _2329, _2329);
    float _2509 = fma(_2491, _2491, _2501);
    float _2511 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2513 = _2441 * 6.283185482025146484375;
    float _2515 = cos(_2513);
    float _2517 = fma(_2505, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2507);
    float _2519 = _2433 * _2477;
    float _2521 = fma(_2511, _2499, _2511);
    float _2523 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2525 = _2341 * _2493;
    float _2527 = fma(_2521, _2357, _2517);
    float _2529 = rsqrt(_2509);
    float _2531 = _2525 * _2523;
    float _2533 = _2527 * 0.15915493667125701904296875;
    float _2535 = in.m_87.x;
    float _2537 = in.m_87.y;
    float _2539 = in.m_87.z;
    float _2541 = _2533 * 6.283185482025146484375;
    float _2543 = sin(_2541);
    float _2545 = _2461 * _2515;
    float _2547 = _2433 * _2515;
    float _2549 = _2487 * _2529;
    float _2551 = _2491 * _2529;
    float _2553 = _2483 * _2529;
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2557 = _2549 * _2555;
    float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2561 = _2551 * _2559;
    float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2565 = _2553 * _2563;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2569 = -_2557;
    float _2571 = fma(_2551, _2567, _2569);
    float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2575 = -_2561;
    float _2577 = fma(_2553, _2573, _2575);
    float _2579 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2581 = -_2565;
    float _2583 = fma(_2549, _2579, _2581);
    float _2585 = _2533 * 6.283185482025146484375;
    float _2587 = cos(_2585);
    float _2589 = _2571 * _2571;
    float _2591 = fma(_2543, _2545, _2519);
    float _2593 = fma(_2543, _2519, _2545);
    float _2595 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2537);
    float _2597 = fma(_2577, _2577, _2589);
    float _2599 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2601 = _2461 * _2477;
    float _2603 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2605 = fma(_2583, _2583, _2597);
    float _2607 = _2595 * _2531;
    float _2609 = _2525 * _2599;
    float _2611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2535);
    float _2613 = _2525 * _2603;
    float _2615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2539);
    float _2617 = rsqrt(_2605);
    float _2619 = _2461 * _2587;
    float _2621 = _2515 * _2587;
    float _2623 = _2611 * _2609;
    float _2625 = _2433 * _2587;
    float _2627 = _2619 * _2607;
    float _2629 = -_2601;
    float _2631 = fma(_2543, _2547, _2629);
    float _2633 = -_2547;
    float _2635 = fma(_2543, _2601, _2633);
    float _2637 = _2615 * _2613;
    float _2639 = fma(_2591, _2623, _2627);
    float _2641 = -_2607;
    float _2643 = _2543 * _2641;
    float _2645 = _2625 * _2607;
    float _2647 = _2477 * _2587;
    float _2649 = fma(_2635, _2637, _2639);
    float _2651 = fma(_2621, _2623, _2643);
    float _2653 = fma(_2631, _2623, _2645);
    float _2655 = _2577 * _2617;
    float _2657 = _2571 * _2617;
    float _2659 = _2583 * _2617;
    float _2661 = fma(_2647, _2637, _2651);
    float _2663 = _2553 * _2655;
    float _2665 = _2551 * _2657;
    float _2667 = fma(_2593, _2637, _2653);
    float _2669 = -_2663;
    float _2671 = fma(_2549, _2657, _2669);
    float _2673 = -_2665;
    float _2675 = fma(_2553, _2659, _2673);
    float _2677 = _2671 * _2649;
    float _2679 = _2675 * _2649;
    float _2681 = fma(_2659, _2661, _2677);
    float _2683 = fma(_2655, _2661, _2679);
    float _2685 = fma(_2551, _2667, _2681);
    float _2687 = fma(_2549, _2667, _2683);
    float _2689 = _1919 + _2685;
    float _2691 = _1703 + _2687;
    float _2693 = _2549 * _2659;
    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2697 = _2689 + _2695;
    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2701 = _2691 + _2699;
    float _2703 = -_2693;
    float _2705 = fma(_2551, _2655, _2703);
    float _2707 = _2697 * _2697;
    float _2709 = fma(_2701, _2701, _2707);
    float _2711 = _2705 * _2649;
    float _2713 = sqrt(_2709);
    float _2715 = fma(_2657, _2661, _2711);
    float _2717 = fma(_2553, _2667, _2715);
    float _2719 = _1705 + _2717;
    bool _2721 = _2713 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2723 = _2717;
    float _2725 = _2711;
    float _2727 = _2715;
    if (!_2721)
    {
        _2723 = _2691;
    }
    float _2729 = _2723;
    float _2731 = _2729;
    if (!_2721)
    {
        _2725 = _2689;
    }
    float _2733 = _2725;
    float _2735 = _2733;
    if (!_2721)
    {
        _2727 = _2719;
    }
    float _2737 = _2727;
    bool _2739 = !_2721;
    float _2741 = _2737;
    if (!_2739)
    {
        float _2743 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2747 = _2713 + _2745;
        float _2749 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2751 = rsqrt(_2709);
        float _2753 = _2747 * _2743;
        float _2755 = _2753 * 0.15915493667125701904296875;
        float _2757 = _2755 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2755 * 6.283185482025146484375;
        float _2763 = sin(_2761);
        float _2765 = _2759 + (-1.0);
        float _2767 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2769 = fma(_2763, _2749, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2771 = fma(_2719, _2759, _2767);
        float _2773 = _2751 * _2769;
        float _2775 = fma(_2701, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2777 = fma(_2697, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2741 = _2771;
        _2731 = _2775;
        _2735 = _2777;
    }
    float _2779 = _2741;
    float _2781 = _2731;
    float _2783 = _2735;
    float _2785 = -_1705;
    float _2787 = _2785 + _2779;
    float _2789 = -_1703;
    float _2791 = _2789 + _2781;
    float _2793 = -_1919;
    float _2795 = _2793 + _2783;
    float _2797 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2799 = _2787 * _2787;
    bool _2801 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2803 = isnan(0.5);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2809 = _2805 || _2807;
    float _2811 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2797);
    float _2813 = fma(_2791, _2791, _2799);
    float _2815 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2819 = isnan(0.5);
    bool _2821 = _2817 || _2819;
    bool _2823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2825 = _2821 || _2823;
    float _2827 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2811);
    float _2829 = fma(_2795, _2795, _2813);
    float _2831 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2815);
    float _2833 = _2827 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2835 = sqrt(_2829);
    float _2837 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2831);
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2841 = _2839 + _2833;
    bool _2843 = _2835 > 0.0;
    float _2845 = 1.0 / _2833;
    float _2847 = _2839;
    float _2849 = _2783;
    float _2851 = _2779;
    float _2853 = _2795;
    float _2855 = _2781;
    if (!_2843)
    {
        _2847 = _2781;
    }
    float _2857 = _2847;
    bool _2859 = !_2843;
    float _2861 = _2857;
    if (!_2859)
    {
        float _2863 = _230 * _230;
        float _2865 = rsqrt(_2829);
        float _2867 = fma(_228, _228, _2863);
        float _2869 = fma(_232, _232, _2867);
        float _2871 = sqrt(_2869);
        float _2873 = _2791 * _2865;
        float _2875 = _2787 * _2865;
        float _2877 = _2795 * _2865;
        bool _2879 = _2871 > 0.0;
        float _2881 = _2865;
        _2853 = _2877;
        if (!_2879)
        {
            _2881 = _2781;
        }
        float _2883 = _2881;
        bool _2885 = !_2879;
        _2861 = _2883;
        if (!_2885)
        {
            float _2887 = rsqrt(_2869);
            float _2889 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2891 = _230 * _2887;
            float _2893 = _228 * _2887;
            float _2895 = _2875 * _2891;
            float _2897 = _232 * _2887;
            float _2899 = fma(_2873, _2893, _2895);
            float _2901 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2903 = fma(_2877, _2897, _2899);
            float _2905 = _2903 * _2901;
            float _2907 = fma(_228, _2905, _2781);
            float _2909 = fma(_230, _2905, _2779);
            float _2911 = fma(_232, _2905, _2783);
            _2861 = _2907;
            _2849 = _2911;
            _2851 = _2909;
        }
    }
    float _2913 = _2861;
    float _2915 = _2849;
    float _2917 = _2851;
    float _2919 = _2853;
    float _2921 = -_2361;
    float _2923 = fma(_2921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2913);
    float _2925 = -_2369;
    float _2927 = fma(_2925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2915);
    float _2929 = -_2359;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2917);
    float _2933 = _2841 * _2845;
    float _2935 = _2933 * 0.5;
    float _2937 = _2931;
    float _2939 = _2927;
    float _2941 = _2935;
    float _2943 = _2917;
    float _2945 = _2919;
    if (_2825)
    {
        _2855 = 1.0;
    }
    float _2947 = _2855;
    float _2949 = _2947;
    if (_2809)
    {
        _2453 = _2923;
    }
    float _2951 = _2453;
    float _2953 = _2951;
    if (!_2809)
    {
        float _2955 = _2377 * _2377;
        float _2957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2959 = -_1703;
        float _2961 = _2959 + _2913;
        float _2963 = -_1705;
        float _2965 = _2963 + _2917;
        float _2967 = fma(_2387, _2387, _2955);
        float _2969 = -_1919;
        float _2971 = _2969 + _2915;
        float _2973 = fma(_2395, _2395, _2967);
        float _2975 = 1.0 / _2525;
        float _2977 = sqrt(_2973);
        float _2979 = precise::min(_2977, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2981 = _2979 * _2957;
        float _2983 = _2981 * _2975;
        float _2985 = fma(_2961, _2983, _2373);
        float _2987 = fma(_2965, _2983, _2365);
        float _2989 = fma(_2971, _2983, _2383);
        _2937 = _2987;
        _2953 = _2985;
        _2939 = _2989;
    }
    float _2991 = _2937;
    float _2993 = _2953;
    float _2995 = _2939;
    if (!_2825)
    {
        float _2997 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2999 = _2997 * 0.15915493667125701904296875;
        float _3001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3003 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3005 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3003);
        float _3007 = _2999 * 6.283185482025146484375;
        float _3009 = cos(_3007);
        float _3011 = _3001 * 0.15915493667125701904296875;
        float _3013 = _2999 * 6.283185482025146484375;
        float _3015 = sin(_3013);
        float _3017 = 1.0 / _3009;
        float _3019 = _3011 * 6.283185482025146484375;
        float _3021 = cos(_3019);
        float _3023 = _3015 * _3017;
        float _3025 = _3011 * 6.283185482025146484375;
        float _3027 = sin(_3025);
        float _3029 = _3021 * _3023;
        float _3031 = 1.0 / _3005;
        float _3033 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3035 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3033;
        float _3037 = 1.0 / _3029;
        float _3039 = 1.0 / _3035;
        float _3041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3043 = _3031 * _3041;
        float _3045 = _3027 * _3037;
        float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3049 = fma(_3045, _3043, _3047);
        float _3051 = _3049 * _3039;
        float _3053 = precise::clamp(_3051, 0.0, 1.0);
        _2941 = _3031;
        _2943 = _3039;
        _2949 = _3053;
    }
    float _3055 = _2941;
    float _3057 = _2943;
    float _3059 = _2949;
    float _3061 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3063 = _2991 + _3061;
    float _3065 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3067 = _2993 + _3065;
    float _3069 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3071 = _2995 + _3069;
    float _3073 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3075 = _3063 * _3063;
    float _3077 = fma(_3067, _3067, _3075);
    float _3079 = fma(_3071, _3071, _3077);
    float _3081 = rsqrt(_3079);
    float _3083 = sqrt(_3079);
    float _3085 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3087 = _3067 * _3085;
    float _3089 = _3071 * _3085;
    float _3091 = _3087 * _3087;
    float _3093 = _3089 * _3089;
    float _3095 = _3091 + _3093;
    float _3097 = sqrt(_3095);
    bool _3099 = _3097 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3103 = _3097 + _3101;
    float _3105 = _3081;
    float _3107 = _3103;
    float _3109 = _3055;
    float _3111 = _3063;
    float _3113 = _3085;
    if (_3099)
    {
        float _3115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3105 = _3115;
    }
    float _3117 = _3105;
    float _3119 = _3117;
    if (_3099)
    {
        float _3121 = _3103 * _3117;
        _3107 = _3121;
    }
    float _3123 = _3107;
    if (_3099)
    {
        float _3125 = rsqrt(_3095);
        _3119 = _3125;
    }
    float _3127 = _3119;
    float _3129 = _3127;
    if (_3099)
    {
        float _3131 = _3123 * 0.15915493667125701904296875;
        _3109 = _3131;
    }
    float _3133 = _3109;
    float _3135 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3137 = _3071;
    float _3139 = _3133;
    if (_3099)
    {
        float _3141 = _3133 * 6.283185482025146484375;
        float _3143 = sin(_3141);
        _3137 = _3143;
    }
    float _3145 = _3137;
    float _3147 = precise::max(0.0, _3135);
    float _3149 = _3057;
    float _3151 = _3147;
    if (_3099)
    {
        float _3153 = _3133 * 6.283185482025146484375;
        float _3155 = cos(_3153);
        _3149 = _3155;
    }
    float _3157 = _3149;
    float _3159 = -_3085;
    float _3161 = -_3147;
    float _3163 = fma(_3063, _3159, _3161);
    if (_3099)
    {
        float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3111 = _3165;
    }
    float _3167 = _3111;
    float _3169 = _3145;
    float _3171 = _3167;
    if (_3099)
    {
        float _3173 = fma(_3145, _3167, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3169 = _3173;
    }
    float _3175 = _3169;
    float _3177 = _3175;
    if (!_3099)
    {
        _3171 = _3163;
    }
    float _3179 = _3171;
    float _3181 = _3179;
    if (_3099)
    {
        float _3183 = _3127 * _3175;
        _3113 = _3183;
    }
    float _3185 = _3113;
    if (!_3099)
    {
        _3129 = _3087;
    }
    float _3187 = _3129;
    float _3189 = _3187;
    float _3191 = _3157;
    if (_3099)
    {
        float _3193 = _3157 + (-1.0);
        _3151 = _3193;
    }
    float _3195 = _3151;
    float _3197 = _3195;
    if (_3099)
    {
        float _3199 = _3087 * _3185;
        _3189 = _3199;
    }
    float _3201 = _3189;
    if (!_3099)
    {
        _3177 = _3091;
    }
    float _3203 = _3177;
    float _3205 = _3203;
    if (_3099)
    {
        float _3207 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3139 = _3207;
    }
    float _3209 = _3139;
    if (!_3099)
    {
        _3197 = _3089;
    }
    float _3211 = _3197;
    float _3213 = _3211;
    if (_3099)
    {
        float _3215 = _3089 * _3185;
        _3213 = _3215;
    }
    float _3217 = _3213;
    if (_3099)
    {
        float _3219 = _3201 * _3201;
        _3205 = _3219;
    }
    float _3221 = _3205;
    if (_3099)
    {
        float _3223 = fma(_3163, _3157, _3209);
        _3181 = _3223;
    }
    float _3225 = _3181;
    if (!_3099)
    {
        _3191 = _3093;
    }
    float _3227 = _3191;
    float _3229 = _3227;
    if (_3099)
    {
        float _3231 = _3217 * _3217;
        _3229 = _3231;
    }
    float _3233 = _3229;
    float _3235 = fma(_3225, _3225, _3221);
    float _3237 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3239 = _3235 + _3233;
    float _3241 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3237);
    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3245 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3243);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3251 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3241);
    float _3253 = rsqrt(_3239);
    float _3255 = -_3247;
    float _3257 = _3255 + 1.0;
    float _3259 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3261 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3249);
    float _3263 = _3251 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3265 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3267 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3259);
    float _3269 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3261);
    float _3271 = abs(_3257);
    float _3273 = log2(_3271);
    float _3275 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3277 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3267);
    float _3279 = _3269 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3281 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3265);
    float _3283 = -_3275;
    float _3285 = fma(_3283, _3073, 1.0);
    float _3287 = _3277 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3291 = _3253 * _3201;
    float _3293 = _3253 * _3225;
    float _3295 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3281);
    float _3297 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3289);
    float _3299 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3301 = _3253 * _3217;
    float _3303 = _3295 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3305 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3297);
    float _3307 = -_3299;
    float _3309 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3307);
    float _3311 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3313 = log2(_3285);
    float _3315 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3305);
    float _3317 = -_3301;
    float _3319 = fma(_3317, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3309);
    float _3321 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3323 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3325 = _3293 + 1.0;
    float _3327 = fma(_3319, -0.5, 0.5);
    float _3329 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3321);
    float _3331 = 1.0 / _3315;
    float _3333 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3323);
    float _3335 = fma(_3319, 0.5, 0.5);
    float _3337 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3329);
    float _3339 = fma(_3335, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3341 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3337);
    float _3343 = exp2(_3311);
    float _3345 = _3313 * 0.693147182464599609375;
    float _3347 = fma(_3335, _3339, -0.212114393711090087890625);
    float _3349 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3351 = fma(_3335, _3347, 1.570728778839111328125);
    float _3353 = sqrt(_3327);
    float _3355 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3333);
    float _3357 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3355);
    float _3359 = _3341 * _3331;
    float _3361 = -_3293;
    float _3363 = fma(_3343, _3325, _3361);
    float _3365 = _3357 * _3331;
    float _3367 = fma(_3359, 0.5, 0.5);
    float _3369 = fma(_3363, 0.5, 0.5);
    float _3371 = fma(_3365, -0.5, 0.5);
    float _3373 = _3353 * 0.636619746685028076171875;
    float3 _8981 = float3(_3367, _3371, _3349);
    float _3375 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8981, float3(0.0), isnan(_8981)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8981, float3(0.0), isnan(_8981)), level(0.0)).x;
    float3 _8992 = float3(_3367, _3371, _3349);
    float4 _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8992, float3(0.0), isnan(_8992)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8992, float3(0.0), isnan(_8992)), level(0.0)).xyzw;
    float _3380 = _3378.x;
    float _3382 = _3378.y;
    float _3384 = _3378.z;
    float _3386 = _3378.w;
    float _3388 = -_3351;
    float _3390 = fma(_3373, _3388, 1.0);
    float2 _9014 = float2(_3390, _3369);
    float3 _3394 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9014, float2(0.0), isnan(_9014)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9014, float2(0.0), isnan(_9014)), level(0.0)).xyz;
    float _3396 = _3394.x;
    float _3398 = _3394.y;
    float _3400 = _3394.z;
    float _3402 = in.m_89.x;
    float _3404 = in.m_89.y;
    float _3406 = in.m_89.z;
    bool _3408 = _2537 != 0.0;
    bool _3410 = isnan(_2537);
    bool _3412 = _3408 || _3410;
    bool _3414 = isnan(0.0);
    bool _3416 = _3412 || _3414;
    float _3418 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3420 = in.m_91.x;
    float _3422 = in.m_91.y;
    float _3424 = in.m_91.z;
    float _3426 = in.m_91.w;
    bool _3428 = _2535 == 0.0;
    bool _3430 = !_3416;
    bool _3432 = _3428 && _3430;
    float _3434 = _2619 * _2675;
    float _3436 = exp2(_3418);
    bool _3438 = _2539 == 0.0;
    bool _3440 = _3438 && _3432;
    float _3442 = -_2543;
    float _3444 = fma(_3442, _2655, _3434);
    float _3446 = fma(_2625, _2549, _3444);
    float _3448 = _3402;
    float _3450 = _3406;
    float _3452 = _3315;
    float _3454 = _3341;
    float _3456 = _3357;
    if (_3440)
    {
        _2479 = _3402;
    }
    float _3458 = _2479;
    float _3460 = -_3436;
    float _3462 = _3460 + 1.0;
    float _3464 = _3458;
    if (_3440)
    {
        _2333 = _3406;
    }
    float _3466 = _2333;
    float _3468 = _3466;
    if (_3440)
    {
        _2455 = _3404;
    }
    float _3470 = _2455;
    float _3472 = _3470;
    if (_3440)
    {
        _2945 = _3458;
    }
    float _3474 = _2945;
    float _3476 = _3474;
    if (!_3440)
    {
        _3464 = _3402;
    }
    float _3478 = _3464;
    if (_3440)
    {
        _3448 = _3466;
    }
    float _3480 = _3448;
    float _3482 = _3480;
    if (!_3440)
    {
        _3468 = _3406;
    }
    float _3484 = _3468;
    if (!_3440)
    {
        float _3486 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3478);
        _3476 = _3486;
    }
    float _3488 = _3476;
    if (_3440)
    {
        _3450 = _3470;
    }
    float _3490 = _3450;
    float _3492 = _3424 * _3478;
    float _3494 = _3490;
    if (!_3440)
    {
        _3472 = _3404;
    }
    float _3496 = _3472;
    float _3498 = _3422 * _3484;
    if (!_3440)
    {
        float _3500 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3484);
        _3482 = _3500;
    }
    float _3502 = _3482;
    float _3504 = -_3492;
    float _3506 = fma(_3420, _3484, _3504);
    float _3508 = _2591 * _2671;
    float _3510 = _3420 * _3496;
    if (!_3440)
    {
        float _3512 = fma(_2537, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3496);
        _3494 = _3512;
    }
    float _3514 = _3494;
    float _3516 = -_3498;
    float _3518 = fma(_3424, _3496, _3516);
    float _3520 = _2591 * _2675;
    float _3522 = -_3510;
    float _3524 = fma(_3422, _3478, _3522);
    float _3526 = _2619 * _2705;
    float _3528 = _3506 * _3426;
    float _3530 = _3518 * _3426;
    float _3532 = _3524 * _3426;
    float _3534 = _2619 * _2671;
    float _3536 = _2591 * _2705;
    float _3538 = _2635 * _2675;
    float _3540 = _2635 * _2705;
    float _3542 = _2635 * _2671;
    float _3544 = -_2543;
    float _3546 = fma(_3544, _2657, _3526);
    float _3548 = -_2543;
    float _3550 = fma(_3548, _2659, _3534);
    float _3552 = fma(_2621, _2655, _3520);
    float _3554 = fma(_2621, _2657, _3536);
    float _3556 = fma(_2621, _2659, _3508);
    float _3558 = fma(_2647, _2655, _3538);
    float _3560 = fma(_2647, _2657, _3540);
    float _3562 = fma(_2647, _2659, _3542);
    float _3564 = fma(_2625, _2553, _3546);
    float _3566 = fma(_2625, _2551, _3550);
    float _3568 = fma(_2631, _2551, _3556);
    float _3570 = fma(_2631, _2553, _3554);
    float _3572 = _3564 * _3422;
    float _3574 = fma(_2631, _2549, _3552);
    float _3576 = _3446 * _3422;
    float _3578 = _3566 * _3422;
    float _3580 = fma(_2593, _2549, _3558);
    float _3582 = fma(_2593, _2551, _3562);
    float _3584 = _3446 * _3514;
    float _3586 = fma(_2593, _2553, _3560);
    float _3588 = _3528 * _3446;
    float _3590 = _3528 * _3564;
    float _3592 = _3528 * _3566;
    float _3594 = fma(_3570, _3420, _3572);
    float _3596 = fma(_3574, _3420, _3576);
    float _3598 = fma(_3568, _3420, _3578);
    float _3600 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3602 = fma(_3574, _3488, _3584);
    float _3604 = fma(_3586, _3424, _3594);
    float _3606 = _3564 * _3514;
    float _3608 = _3566 * _3514;
    float _3610 = _3315 * 0.5;
    float _3612 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3600);
    float _3614 = fma(_3530, _3574, _3588);
    float _3616 = fma(_3570, _3488, _3606);
    float _3618 = fma(_3568, _3488, _3608);
    float _3620 = fma(_3357, -0.5, _3610);
    float _3622 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3612);
    float _3624 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3626 = fma(_3580, _3424, _3596);
    float _3628 = fma(_3532, _3580, _3614);
    float _3630 = fma(_3580, _3502, _3602);
    float _3632 = fma(_3530, _3570, _3590);
    float _3634 = fma(_3586, _3502, _3616);
    float _3636 = fma(_3582, _3502, _3618);
    float _3638 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3622);
    float _3640 = fma(_3530, _3568, _3592);
    float _3642 = fma(_3582, _3424, _3598);
    float _3644 = fma(_3532, _3586, _3632);
    float _3646 = _3638 + _3315;
    float _3648 = _3341 + _3315;
    float _3650 = fma(_3532, _3582, _3640);
    out.m_93.x = _3626;
    out.m_93.y = _3604;
    out.m_93.z = _3642;
    float _3652 = _3646 * 0.5;
    float _3654 = _3648 * 0.5;
    out.m_95.x = _3630;
    out.m_95.y = _3634;
    out.m_95.z = _3636;
    bool _3656 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3658 = isnan(_3083);
    bool _3660 = _3656 || _3658;
    bool _3662 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3664 = _3660 || _3662;
    out.m_97.x = _3654;
    out.m_97.y = _3620;
    out.m_97.z = _3652;
    out.m_97.w = _3315;
    out.m_99.x = _3628;
    out.m_99.y = _3644;
    out.m_99.z = _3650;
    out.gl_Position.x = _3341;
    out.gl_Position.y = _3357;
    out.gl_Position.z = _3638;
    out.gl_Position.w = _3315;
    float _3666 = _3650;
    float _3668 = _3644;
    float _3670 = _3628;
    if (!_3664)
    {
        _3666 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3672 = _3666;
    float _3674 = _3672;
    float _3676 = _3672;
    if (!_3664)
    {
        _3668 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3678 = _3668;
    float _3680 = _3678;
    float _3682 = _3678;
    if (!_3664)
    {
        _3670 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3684 = _3670;
    float _3686 = _3059 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3688 = _3684;
    float _3690 = _3684;
    if (!_3664)
    {
        _3452 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3692 = _3452;
    float _3694 = _3692;
    float _3696 = _3692;
    if (!_3664)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3698 = _3454;
    float _3700 = _3698;
    float _3702 = _3698;
    if (!_3664)
    {
        _3456 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3704 = _3456;
    float _3706 = _3624 * _3375;
    float _3708 = -_3624;
    float _3710 = _3708 + 1.0;
    float _3712 = _3386 * _3706;
    float _3714 = _3386 * _3710;
    float _3716 = _3400 * _3706;
    float _3718 = fma(_3396, _3712, _3380);
    float _3720 = fma(_3398, _3712, _3382);
    float _3722 = fma(_3386, _3716, _3384);
    out.m_101.x = _3718;
    out.m_101.y = _3720;
    out.m_101.z = _3722;
    out.m_101.w = _3714;
    bool _3724 = !_3664;
    float _3726 = _3704;
    float _3728 = _3704;
    if (!_3724)
    {
        bool _3730 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3732 = isnan(_3083);
        bool _3734 = _3730 || _3732;
        bool _3736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3738 = _3734 || _3736;
        if (!_3738)
        {
            float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3742 = _3083 + _3740;
            float _3744 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3746 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3744;
            float _3748 = 1.0 / _3746;
            float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3756 = _3754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3758 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3760 = _3758 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3764 = _3762 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3768 = _3766 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3770 = _3742 * _3748;
            float _3772 = precise::clamp(_3770, 0.0, 1.0);
            float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3776 = _3774 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3778 = fma(_3772, _3752, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3780 = fma(_3772, _3776, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3782 = fma(_3772, _3756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3784 = fma(_3772, _3760, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3786 = fma(_3772, _3764, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3788 = fma(_3772, _3768, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3702 = _3780;
            _3682 = _3786;
            _3696 = _3778;
            _3676 = _3784;
            _3728 = _3782;
            _3690 = _3788;
            _3790 = true;
        }
        else
        {
            bool _3792 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3794 = isnan(_3083);
            bool _3796 = _3792 || _3794;
            bool _3798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3800 = _3796 || _3798;
            if (!_3800)
            {
                _3694 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3802 = _3694;
            _3696 = _3802;
            if (!_3800)
            {
                _3700 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3804 = _3700;
            _3702 = _3804;
            if (!_3800)
            {
                _3726 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3806 = _3726;
            _3728 = _3806;
            if (!_3800)
            {
                _3674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3808 = _3674;
            _3676 = _3808;
            if (!_3800)
            {
                _3680 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3810 = _3680;
            _3682 = _3810;
            if (!_3800)
            {
                _3688 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3812 = _3688;
            bool _3814 = !_3800;
            _3690 = _3812;
            if (!_3814)
            {
                bool _3816 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3818 = isnan(_3083);
                bool _3820 = _3816 || _3818;
                bool _3822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3824 = _3820 || _3822;
                if (!_3824)
                {
                    float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3828 = _3083 + _3826;
                    float _3830 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3832 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3830;
                    float _3834 = 1.0 / _3832;
                    float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3840 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3842 = _3840 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3844 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3846 = _3844 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3848 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3850 = _3848 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3854 = _3852 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3856 = _3828 * _3834;
                    float _3858 = precise::clamp(_3856, 0.0, 1.0);
                    float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3864 = fma(_3858, _3838, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3866 = fma(_3858, _3862, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3868 = fma(_3858, _3842, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3870 = fma(_3858, _3846, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3872 = fma(_3858, _3850, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3874 = fma(_3858, _3854, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3702 = _3866;
                    _3682 = _3872;
                    _3696 = _3864;
                    _3676 = _3870;
                    _3728 = _3868;
                    _3690 = _3874;
                    _3790 = true;
                }
                else
                {
                    _3702 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3682 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3696 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3728 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3690 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3790 = false;
    float _3876 = _3702;
    float _3878 = _3682;
    float _3880 = _3696;
    float _3882 = _3676;
    float _3884 = _3728;
    float _3886 = _3690;
    float _3888 = fma(_3634, -0.5, 0.5);
    float _3890 = precise::clamp(_3888, 0.0, 1.0);
    float _3892 = -_3876;
    float _3894 = _3892 + _3878;
    float _3896 = -_3880;
    float _3898 = _3896 + _3882;
    out.m_103.x = 0.0;
    float _3900 = fma(_3890, _3894, _3876);
    float _3902 = -_3884;
    float _3904 = _3902 + _3886;
    float _3906 = fma(_3890, _3898, _3880);
    float _3908 = _3900 * 0.586610972881317138671875;
    bool _3910 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3912 = fma(_3890, _3904, _3884);
    float _3914 = _3686 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3916 = fma(_3906, 0.298911988735198974609375, _3908);
    bool _3918 = _3059 > 0.0;
    bool _3920 = isnan(_3059);
    bool _3922 = _3918 || _3920;
    bool _3924 = isnan(0.0);
    bool _3926 = _3922 || _3924;
    float _3928 = fma(_3912, 0.114477999508380889892578125, _3916);
    out.m_47.x = _3914;
    float _3930 = -_3928;
    float _3932 = _3906 + _3930;
    float _3934 = -_3928;
    float _3936 = _3900 + _3934;
    float _3938 = -_3928;
    float _3940 = _3912 + _3938;
    float _3942 = fma(_3932, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3928);
    float _3944 = fma(_3936, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3928);
    float _3946 = fma(_3940, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3928);
    bool _3948 = !_3910;
    if (!_3948)
    {
        float _3950 = -_2991;
        float _3952 = _3950 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3954 = -_2993;
        float _3956 = _3954 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3958 = -_2995;
        float _3960 = _3958 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3962 = _3952 * _3952;
        float _3964 = fma(_3956, _3956, _3962);
        float _3966 = fma(_3960, _3960, _3964);
        float _3968 = sqrt(_3966);
        float _3970 = rsqrt(_3966);
        float _3972 = -_3968;
        float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3976 = _3974 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3978 = precise::clamp(_3976, 0.0, 1.0);
        float _3980 = _3956 * _3970;
        float _3982 = _3952 * _3970;
        float _3984 = abs(_3978);
        float _3986 = log2(_3984);
        float _3988 = _3960 * _3970;
        float _3990 = _3980 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3992 = _3634 * _3982;
        float _3994 = -_3982;
        float _3996 = -_3990;
        float _3998 = fma(_3994, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3996);
        float _4000 = fma(_3630, _3980, _3992);
        float _4002 = -_3988;
        float _4004 = fma(_4002, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3998);
        float _4006 = fma(_3636, _3988, _4000);
        float _4008 = precise::clamp(_4006, 0.0, 1.0);
        float _4010 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4012 = _4004 + _4010;
        float _4014 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4016 = _4012 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4018 = precise::clamp(_4016, 0.0, 1.0);
        float _4020 = exp2(_4014);
        float _4022 = _4020 * _4018;
        float _4024 = _4008 * _4022;
        float _4026 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4028 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4030 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _4026;
        out.m_103.y = _4028;
        out.m_103.z = _4030;
    }
    out.m_105.x = _3942;
    out.m_105.y = _3944;
    out.m_105.z = _3946;
    if (_3926)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4032 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4032;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3790 = false;
    bool _572 = false;
    bool _368 = false;
    bool _256 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_44.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_47.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4087 = as_type<float>(_140);
        out.gl_Position.z = _4087;
    }
    if (!_128)
    {
        return out;
    }
    float _142 = in.m_49.w;
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    bool _148 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_142);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_142;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _144;
    out.m_53.y = _146;
    float _162 = 0.0;
    float _164 = _160;
    if (_156)
    {
        float _166 = float(_124);
        _162 = _166;
    }
    float _168 = _162;
    bool _170 = _160 >= _168;
    bool _172 = !_156;
    bool _174 = _170 || _172;
    float _176 = in.m_51.z;
    if (_174)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _132;
    if (_174)
    {
        out.m_47.x = 0.0;
    }
    int _180 = 0;
    if (_174)
    {
        float _182 = _178 * 5.0;
        _180 = as_type<int>(_182);
    }
    int _184 = _180;
    if (_174)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4166 = as_type<float>(_184);
        out.gl_Position.z = _4166;
    }
    out.m_53.z = _176;
    if (_174)
    {
        return out;
    }
    float _186 = in.m_55.x;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = in.m_55.y;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = in.m_63.x;
    float _212 = in.m_63.y;
    float _214 = in.m_63.z;
    out.m_65.x = _186;
    out.m_65.y = _190;
    float _216 = _194 * _200;
    float _218 = _194 * _206;
    float _220 = fma(_192, _198, _216);
    float _222 = _194 * _212;
    float _224 = fma(_192, _204, _218);
    float _226 = fma(_192, _210, _222);
    float _228 = fma(_196, _202, _220);
    float _230 = fma(_196, _208, _224);
    float _232 = fma(_196, _214, _226);
    bool _234 = !_188;
    float _236 = _190;
    float _238 = _186;
    float _254;
    if (!_234)
    {
        float _240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _242 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _244 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _246 = _244 * _240;
        float _248 = floor(_246);
        float _250 = -_248;
        float _252 = _246 + _250;
        _254 = _252;
        _256 = true;
    }
    else
    {
        float _258 = float(_124);
        float _260 = 1.0 / _258;
        float _262 = _160 * _260;
        _254 = _262;
    }
    _256 = false;
    float _264 = _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _264 + _266;
    bool _270 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_264);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    bool _286 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _288 = isnan(_264);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_280;
    float _300 = _298 + 1.0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = 1.0 / _284;
    bool _308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _310 = _296 * _300;
    float _312 = -_296;
    float _314 = _312 + 1.0;
    float _316 = _268 * _306;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    float _322 = fma(_304, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = fma(_320, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = _322 * _310;
    float _332 = fma(_326, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _334 = _328 * _310;
    float _336 = _332 * _310;
    float _338 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].x, _330);
    float _340 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].y, _336);
    float _342 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _344 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[144].x, _338);
    float _346 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[144].y, _340);
    float _348 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[144].z, _342);
    bool _350 = !_308;
    float _366;
    if (!_350)
    {
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_124);
        float _372 = 1.0 / _370;
        float _374 = _160 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _380 = _376 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _386 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _388 = isnan(_376);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _406 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_376);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = 1.0 / _384;
    float _420 = -_396;
    float _422 = _420 + 1.0;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _424;
    bool _428 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _430 = isnan(_376);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = _416 * _422;
    float _442 = -_416;
    float _444 = _442 + 1.0;
    float _446 = 1.0 / _400;
    float _448 = _438 * _444;
    float _450 = -_438;
    float _452 = _450 + 1.0;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _458 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _460 = 1.0 / _404;
    float _462 = _426 * _418;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _470 = fma(_462, _380, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _472 = _454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = _466 * _446;
    bool _478 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = isnan(_376);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _376 + _494;
    float _498 = _470 * _448;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _502 = _376 + _500;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    float _508 = fma(_476, _496, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _510 = _492 * _460;
    float _512 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[115].x, _498);
    float _514 = _396 * _506;
    float _516 = fma(_510, _502, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _518 = fma(_508, _440, _512);
    float _520 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _522 = fma(_516, _514, _518);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _528 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[118].x, _522);
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _534 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = in.m_67.x;
    float _544 = in.m_67.y;
    float _546 = in.m_67.z;
    out.m_69.x = _534;
    out.m_69.y = _536;
    out.m_69.z = _540;
    out.m_69.w = _530;
    out.m_71.x = _472;
    out.m_71.y = _474;
    out.m_71.z = _520;
    out.m_71.w = _538;
    float _548 = _348 * _546;
    float _550 = _346 * _544;
    float _552 = _344 * _542;
    bool _554 = !_458;
    float _570;
    if (!_554)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _558 = _144 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        float _574 = float(_124);
        float _576 = 1.0 / _574;
        float _578 = _160 * _576;
        _570 = _578;
    }
    _572 = false;
    float _580 = _570;
    float _582 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _584 = int(_582);
    float _586 = float(_124);
    float _588 = in.m_73.w;
    float _590 = in.m_59.w;
    float _592 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _594 = int(_592);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _620 = float(_584);
    float _622 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _624 = int(_622);
    float _626 = in.m_61.w;
    float _628 = float(_594);
    float _630 = 1.0 / _620;
    out.m_75.w = _588;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _640 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _642 = isnan(_580);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    bool _652 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _654 = isnan(_580);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _666 = int(_664);
    float _668 = float(uint(_624));
    int _670 = ~_624;
    int _672 = _670 + 1;
    bool _674 = _624 == 0;
    float _676 = 1.0 / _628;
    float _678 = _630 * _160;
    bool _680 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _682 = isnan(_580);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _692;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _698 = _696 != 0;
    float _700 = float(uint(_666));
    float _702 = 1.0 / _668;
    int _704 = ~_666;
    int _706 = _704 + 1;
    bool _708 = _666 == 0;
    int _710 = ~_666;
    int _712 = _710 + 1;
    float _714 = _676 * _160;
    float _716 = trunc(_678);
    int _718 = int(_716);
    float _720 = 1.0 / _700;
    int _722 = as_type<int>(_702) + (-2);
    float _724 = trunc(_714);
    int _726 = int(_724);
    float _728 = float(uint(_718));
    float _730 = as_type<float>(_722) * _728;
    int _732 = as_type<int>(_720) + (-2);
    float _734 = 1.0 / _586;
    float _736 = float(uint(_726));
    float _738 = trunc(_730);
    float _740 = precise::max(_738, 0.0);
    uint _743 = uint(_740);
    float _745 = as_type<float>(_732) * _736;
    int _747 = ~_624;
    int _749 = _747 + 1;
    float _751 = trunc(_745);
    float _753 = precise::max(_751, 0.0);
    uint _755 = uint(_753);
    float _757 = _734 * _160;
    int _759 = _749 * int(_743);
    int _761 = _759 + _718;
    float _763 = 1.0 / _602;
    float _765 = float(uint(_761));
    int _767 = _706 * int(_755);
    int _769 = _767 + _726;
    float _771 = 1.0 / _598;
    float _773 = as_type<float>(_722) * _765;
    float _775 = _765;
    float _777 = as_type<float>(_769);
    if (_698)
    {
        _775 = 1.0;
    }
    float _779 = _775;
    float _781 = float(uint(_769));
    float _783 = _779;
    float _785 = _781;
    if (!_698)
    {
        _783 = 7.345489978790283203125;
    }
    float _787 = _783;
    float _789 = trunc(_773);
    float _791 = precise::max(_789, 0.0);
    uint _793 = uint(_791);
    float _795 = as_type<float>(_732) * _781;
    if (_698)
    {
        _785 = _144;
    }
    float _797 = _785;
    float _799 = _787 * _144;
    float _801 = _797;
    if (_698)
    {
        _777 = 1.0;
    }
    float _803 = _777;
    float _805 = _803;
    if (!_698)
    {
        _801 = _146;
    }
    float _807 = _801;
    float _809 = trunc(_795);
    float _811 = precise::max(_809, 0.0);
    uint _813 = uint(_811);
    if (!_698)
    {
        _805 = 1.2345600128173828125;
    }
    float _815 = _805;
    float _817 = _807 * _815;
    float _819 = float(_624);
    float _821 = floor(_799);
    int _823 = int(_743) + int(_793);
    int _825 = ~_666;
    int _827 = _825 + 1;
    float _829 = float(_718);
    int _831 = _672 * _823;
    int _833 = _831 + _718;
    float _835 = floor(_817);
    int _837 = int(_755) + int(_813);
    bool _839 = _829 >= _819;
    bool _841 = isnan(_829);
    bool _843 = _839 || _841;
    bool _845 = isnan(_819);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    bool _851 = uint(_833) >= uint(_624);
    int _853 = _827 * _837;
    int _855 = _853 + _726;
    float _857 = -_821;
    float _859 = _799 + _857;
    float _861 = float(_666);
    float _863 = trunc(_849);
    int _865 = int(_863);
    bool _867 = uint(_855) >= uint(_666);
    float _869 = _819 * _859;
    float _871 = float(_726);
    float _873 = -_835;
    float _875 = _817 + _873;
    bool _877 = !_851;
    int _879 = _877 ? 0 : (-1);
    float _881 = _819 * _757;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _885 = _883 != 0;
    float _887 = trunc(_869);
    int _889 = int(_887);
    int _891 = ~_823;
    int _893 = _891 + _879;
    int _895 = _893 + 1;
    float _897 = _861 * _875;
    bool _899 = _871 >= _861;
    bool _901 = isnan(_871);
    bool _903 = _899 || _901;
    bool _905 = isnan(_861);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    bool _911 = !_885;
    int _913 = _911 ? 0 : 1;
    int _915 = _624 * _895;
    int _917 = _915 + _718;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _921 = _919 != 0;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _925 = _923 != 0;
    float _927 = 1.0 / _610;
    int _929 = abs(_913);
    float _931 = _861 * _757;
    bool _933 = !_867;
    int _935 = _933 ? 0 : (-1);
    bool _937 = !_674;
    int _939 = _937 ? _917 : (-1);
    int _941 = ~_837;
    int _943 = _941 + _935;
    int _945 = _943 + 1;
    float _947 = trunc(_909);
    int _949 = int(_947);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _953 = _951 != 0;
    int _955 = _889 * _929;
    int _957 = _955 + _718;
    int _959 = ~_865;
    int _961 = _959 + 1;
    int _963 = _961 + 1;
    int _965 = _666 * _945;
    int _967 = _965 + _726;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _975 = _973 != 0;
    int _977 = _963 * _939;
    bool _979 = !_708;
    int _981 = _979 ? _967 : (-1);
    float _983 = trunc(_897);
    int _985 = int(_983);
    int _987 = _624 + (-1);
    int _989 = ~_949;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    int _995 = _865 * _987;
    int _997 = _995 + _977;
    bool _999 = !_953;
    int _1001 = _999 ? 0 : 1;
    float _1003 = 1.0 / _606;
    bool _1005 = !_925;
    int _1007 = _1005 ? 0 : 1;
    int _1009 = _993 * _981;
    bool _1011 = !_975;
    int _1013 = _1011 ? 0 : 1;
    int _1015 = abs(_1001);
    int _1017 = abs(_1013);
    float _1019 = 1.0 / _614;
    int _1021 = abs(_1007);
    bool _1023 = !_921;
    int _1025 = _1023 ? 0 : 1;
    int _1027 = _985 * _1015;
    int _1029 = _1027 + _726;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1033 = _1031 != 0;
    float _1035 = trunc(_881);
    int _1037 = int(_1035);
    int _1039 = abs(_1025);
    int _1041 = _997 * _1021;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1045 = _1043 != 0;
    int _1047 = _666 + (-1);
    bool _1049 = !_1033;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = trunc(_931);
    int _1055 = int(_1053);
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1059 = _1057 != 0;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1063 = _1061 != 0;
    int _1065 = _949 * _1047;
    int _1067 = _1065 + _1009;
    bool _1069 = !_971;
    int _1071 = _1069 ? 0 : 1;
    bool _1073 = _624 == 0;
    int _1075 = _1067 * _1017;
    int _1077 = abs(_1071);
    int _1079 = _1037 * _1039;
    int _1081 = _1079 + _1041;
    bool _1083 = !_1045;
    int _1085 = _1083 ? 0 : 1;
    float _1087 = _144 * 2.0;
    int _1089 = abs(_1051);
    float _1091 = 1.0 / _618;
    bool _1093 = !_1059;
    int _1095 = _1093 ? 0 : 1;
    int _1097 = abs(_1085);
    int _1099 = _1055 * _1077;
    int _1101 = _1099 + _1075;
    int _1103 = abs(_1095);
    float _1105 = floor(_1087);
    int _1107 = _957 * _1089;
    int _1109 = _1107 + _1081;
    bool _1111 = !_1063;
    int _1113 = _1111 ? 0 : 1;
    int _1115 = _889 * _1097;
    int _1117 = _1115 + _1109;
    int _1119 = abs(_1113);
    int _1121 = ~_666;
    int _1123 = _1121 + 1;
    int _1125 = _1029 * _1103;
    int _1127 = _1125 + _1101;
    float _1129 = float(uint(_1117));
    int _1131 = ~_624;
    int _1133 = _1131 + 1;
    int _1135 = _985 * _1119;
    int _1137 = _1135 + _1127;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1141 = _1139 != 0;
    float _1143 = as_type<float>(_722) * _1129;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1147 = _1145 != 0;
    float _1149 = float(uint(_1137));
    float _1151 = trunc(_1143);
    float _1153 = precise::max(_1151, 0.0);
    uint _1155 = uint(_1153);
    float _1157 = as_type<float>(_732) * _1149;
    int _1159 = ~_624;
    int _1161 = _1159 + 1;
    bool _1163 = _971;
    float _1165 = as_type<float>(_1137);
    if (_1141)
    {
        bool _1167 = _144 > 0.5;
        _1163 = _1167;
    }
    bool _1169 = _1163;
    float _1171 = trunc(_1157);
    float _1173 = precise::max(_1171, 0.0);
    uint _1175 = uint(_1173);
    int _1177 = _1161 * int(_1155);
    int _1179 = _1177 + _1117;
    float _1181 = float(uint(_1179));
    int _1183 = _1123 * int(_1175);
    int _1185 = _1183 + _1137;
    float _1187 = as_type<float>(_722) * _1181;
    float _1189 = float(uint(_1185));
    float _1191 = trunc(_1187);
    float _1193 = precise::max(_1191, 0.0);
    uint _1195 = uint(_1193);
    float _1197 = as_type<float>(_732) * _1189;
    float _1199 = trunc(_1197);
    float _1201 = precise::max(_1199, 0.0);
    uint _1203 = uint(_1201);
    int _1205 = int(_1155) + int(_1195);
    int _1207 = ~_666;
    int _1209 = _1207 + 1;
    int _1211 = _1133 * _1205;
    int _1213 = _1211 + _1117;
    int _1215 = int(_1175) + int(_1203);
    int _1217 = _1209;
    float _1219 = as_type<float>(_1175);
    if (_1141)
    {
        float _1221 = -_186;
        float _1223 = _1221 + 1.0;
        _1217 = as_type<int>(_1223);
    }
    int _1225 = _1217;
    bool _1227 = uint(_1213) >= uint(_624);
    if (!_1141)
    {
        _1219 = _186;
    }
    float _1229 = _1219;
    int _1231 = _1209 * _1215;
    int _1233 = _1231 + _1137;
    bool _1235 = !_1227;
    int _1237 = _1235 ? 0 : (-1);
    float _1239 = _1229;
    if (_1141)
    {
        float _1241 = _1169 ? as_type<float>(_1225) : _186;
        _1239 = _1241;
    }
    float _1243 = _1239;
    float _1245 = -_190;
    float _1247 = _1245 + 1.0;
    int _1249 = ~_1205;
    int _1251 = _1249 + _1237;
    int _1253 = _1251 + 1;
    bool _1255 = _146 > 0.5;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1259 = _1257 != 0;
    int _1261 = _624 * _1253;
    int _1263 = _1261 + _1117;
    bool _1265 = uint(_1233) >= uint(_666);
    int _1267 = _1255 ? as_type<int>(_1247) : as_type<int>(_190);
    bool _1269 = _146 > 0.5;
    bool _1271 = _1269 && _1259;
    bool _1273 = !_1265;
    int _1275 = _1273 ? 0 : (-1);
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1279 = _1277 != 0;
    bool _1281 = _176 > 0.5;
    bool _1283 = !_1073;
    int _1285 = _1283 ? _1263 : (-1);
    int _1287 = ~_1215;
    int _1289 = _1287 + _1275;
    int _1291 = _1289 + 1;
    float _1293 = _1279 ? as_type<float>(_1267) : _190;
    if (_1147)
    {
        float _1295 = _1281 ? _1247 : _190;
        _236 = _1295;
    }
    float _1297 = _236;
    int _1299 = _666 * _1291;
    int _1301 = _1299 + _1137;
    int _1303 = _1285 & 3;
    float _1305 = in.m_44.x;
    float _1307 = in.m_44.y;
    float _1309 = in.m_44.z;
    if (!_1259)
    {
        _1165 = _186;
    }
    float _1311 = _1165;
    float _1313 = _1311;
    if (_1271)
    {
        float _1315 = -_186;
        float _1317 = _1315 + 1.0;
        _238 = _1317;
    }
    float _1319 = _238;
    bool _1321 = _1303 != 3;
    float _1323 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1325 = uint(_1303) >= 2u;
    float _1327 = float(uint(_957));
    bool _1329 = !_708;
    int _1331 = _1329 ? _1301 : (-1);
    if (_1259)
    {
        _1313 = _1319;
    }
    float _1333 = _1313;
    float _1335 = as_type<float>(_722) * _1327;
    int _1337 = _1325 ? 0 : 1;
    float _1339 = float(uint(_1029));
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1343 = _1341 != 0;
    float _1345 = trunc(_1335);
    float _1347 = precise::max(_1345, 0.0);
    uint _1349 = uint(_1347);
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1353 = _1351 != 0;
    float _1355 = as_type<float>(_732) * _1339;
    int _1357 = _1331 & 3;
    int _1359 = ~_1337;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    float _1365 = _206 * _1307;
    int _1367 = _1363;
    if (_1321)
    {
        int _1369 = ~_1337;
        int _1371 = _1369 + 1;
        _1367 = _1371;
    }
    int _1373 = _1367;
    float _1375 = trunc(_1355);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    bool _1381 = uint(_1357) >= 2u;
    float _1383 = _200 * _1307;
    bool _1385 = uint(_1303) > 1u;
    float _1387 = _212 * _1307;
    int _1389 = _1285 & 3;
    bool _1391 = _1389 != 0;
    float _1393 = fma(_204, _1305, _1365);
    int _1395 = _1381 ? 0 : 1;
    float _1397 = fma(_210, _1305, _1387);
    bool _1399 = _1357 != 3;
    float _1401 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1403 = _1391 ? 0 : 1;
    float _1405 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1407 = ~_624;
    int _1409 = _1407 + 1;
    float _1411 = fma(_214, _1309, _1397);
    int _1413 = ~_1403;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    int _1419 = _1417;
    if (!_1385)
    {
        int _1421 = ~_1403;
        int _1423 = _1421 + 1;
        _1419 = _1423;
    }
    int _1425 = _1419;
    int _1427 = ~_1395;
    int _1429 = _1427 + 1;
    int _1431 = _1429 + 1;
    int _1433 = _1431;
    if (_1399)
    {
        int _1435 = ~_1395;
        int _1437 = _1435 + 1;
        _1433 = _1437;
    }
    int _1439 = _1433;
    int _1441 = _1409 * int(_1349);
    int _1443 = _1441 + _957;
    bool _1445 = uint(_1357) > 1u;
    float _1447 = fma(_198, _1305, _1383);
    int _1449 = _712 * int(_1379);
    int _1451 = _1449 + _1029;
    int _1453 = _1331 & 3;
    bool _1455 = _1453 != 0;
    float _1457 = _146 * 2.0;
    float _1459 = float(uint(_1443));
    float _1461 = fma(_202, _1309, _1447);
    float _1463 = float(uint(_1451));
    float _1465 = floor(_1457);
    int _1467 = _1455 ? 0 : 1;
    float _1469 = as_type<float>(_722) * _1459;
    float _1471 = as_type<float>(_732) * _1463;
    int _1473 = ~_1467;
    int _1475 = _1473 + 1;
    int _1477 = _1475 + 1;
    float _1479 = fma(_208, _1309, _1393);
    int _1481 = _1477;
    if (!_1445)
    {
        int _1483 = ~_1467;
        int _1485 = _1483 + 1;
        _1481 = _1485;
    }
    int _1487 = _1481;
    float _1489 = trunc(_1469);
    float _1491 = precise::max(_1489, 0.0);
    uint _1493 = uint(_1491);
    bool _1495 = _1105 >= 0.0;
    bool _1497 = isnan(_1105);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.0);
    bool _1503 = _1499 || _1501;
    float _1505 = _176 * 2.0;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1509 = _1503 ? 0 : 1;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1513 = _580 + _1511;
    bool _1515 = _1105 > 0.0;
    float _1517 = trunc(_1471);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    bool _1523 = !_1343;
    int _1525 = _1523 ? 0 : 1;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1529 = ~_1509;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = -_1507;
    float _1537 = fma(_1401, 2.0, _1535);
    bool _1539 = _1465 > 0.0;
    float _1541 = fma(_1405, -2.0, _1527);
    int _1543 = ~_624;
    int _1545 = _1543 + 1;
    float _1547 = floor(_1505);
    int _1549 = int(_1349) + int(_1493);
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1553 = _580 + _1551;
    float _1555 = _1513 * _763;
    int _1557 = _1533;
    if (!_1515)
    {
        int _1559 = ~_1509;
        int _1561 = _1559 + 1;
        _1557 = _1561;
    }
    int _1563 = _1557;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1567 = _580 + _1565;
    bool _1569 = _1465 >= 0.0;
    bool _1571 = isnan(_1465);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.0);
    bool _1577 = _1573 || _1575;
    int _1579 = _1545 * _1549;
    int _1581 = _1579 + _957;
    int _1583 = ~_666;
    int _1585 = _1583 + 1;
    float _1587 = _1553 * _771;
    int _1589 = int(_1379) + int(_1521);
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1593 = _580 + _1591;
    int _1595 = _1577 ? 0 : 1;
    float _1597 = _1567 * _927;
    int _1599 = _1585 * _1589;
    int _1601 = _1599 + _1029;
    int _1603 = ~_1595;
    int _1605 = _1603 + 1;
    int _1607 = _1605 + 1;
    float _1609 = _1593 * _1003;
    bool _1611 = !_1353;
    int _1613 = _1611 ? 0 : 1;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1617 = _580 + _1615;
    bool _1619 = uint(_1601) >= uint(_666);
    float _1621 = _146 + _176;
    int _1623 = _1607;
    if (!_1539)
    {
        int _1625 = ~_1595;
        int _1627 = _1625 + 1;
        _1623 = _1627;
    }
    int _1629 = _1623;
    float _1631 = _144 + _146;
    bool _1633 = uint(_1581) >= uint(_624);
    float _1635 = _1621 + (-1.0);
    bool _1637 = !_1619;
    int _1639 = _1637 ? 0 : (-1);
    float _1641 = _1631 + (-1.0);
    int _1643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1645 = _1643 != 0;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1649 = _1647 != 0;
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1653 = _1651 != 0;
    float _1655 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1657 = _1547 >= 0.0;
    bool _1659 = isnan(_1547);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan(0.0);
    bool _1665 = _1661 || _1663;
    float _1667 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1671 = _580 + _1669;
    int _1673 = _1665 ? 0 : 1;
    float _1675 = _1617 * _1019;
    bool _1677 = _1547 > 0.0;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1681 = fma(_634, _1587, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1683 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1679);
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1687 = _580 + _1685;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1689;
    float _1693 = fma(_638, _1555, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1695 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1697 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1683);
    float _1699 = 1.0 / _1691;
    float _1701 = _1687 * _1091;
    float _1703 = _1461 + _590;
    float _1705 = _1479 + _626;
    float _1707 = -_160;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1537);
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1713 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1711;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1719 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1541);
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1723 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1725 = -_1719;
    float _1727 = fma(_1697, _1695, _1725);
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1729;
    float _1733 = _1671 * _1699;
    float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1737 = _1735 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1739 = fma(_1731, _1587, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1741 = !_1649;
    int _1743 = _1741 ? 0 : 1;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1745;
    float _1749 = fma(_1737, _1555, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1753 = _1751 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1755;
    float _1759 = fma(_1747, _1609, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1761;
    float _1765 = fma(_1753, _1597, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1767 = fma(_1717, _1597, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1769 = fma(_1757, _1675, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1775 = fma(_1763, _1675, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1779 = _1777 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _1781 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1783 = isnan(_580);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    float _1793 = fma(_1773, _1701, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1795 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1797 = isnan(_580);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    float _1807 = fma(_1779, _1701, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1809 = fma(_1713, _1609, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1811 = -_1791;
    float _1813 = _1811 + 1.0;
    bool _1815 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1817 = isnan(_580);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    float _1827 = -_1805;
    float _1829 = _1827 + 1.0;
    float _1831 = _1805 * _1813;
    bool _1833 = !_1633;
    int _1835 = _1833 ? 0 : (-1);
    float _1837 = in.m_63.w;
    float _1839 = -_1825;
    float _1841 = _1839 + 1.0;
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1843;
    int _1847 = abs(_1425);
    float _1849 = _1791 * _1841;
    float _1851 = _650 * _1829;
    float _1853 = -_650;
    float _1855 = _1853 + 1.0;
    float _1857 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1859 = log2(_1857);
    float _1861 = fma(_1845, _1733, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1863 = fma(_694, _1733, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1865 = _662 * _1855;
    float _1867 = -_662;
    float _1869 = _1867 + 1.0;
    bool _1871 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1873 = isnan(_580);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1879 = _1875 || _1877;
    float _1881 = float(_1879);
    bool _1883 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1885 = isnan(_580);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1891 = _1887 || _1889;
    float _1893 = float(_1891);
    float _1895 = _690 * _1869;
    float _1897 = -_690;
    float _1899 = _1897 + 1.0;
    int _1901 = ~_1589;
    int _1903 = _1901 + _1639;
    int _1905 = _1903 + 1;
    float _1907 = -_1893;
    float _1909 = _1907 + 1.0;
    float _1911 = _1881 * _1899;
    float _1913 = -_1881;
    float _1915 = _1913 + 1.0;
    int _1917 = abs(_1487);
    float _1919 = _1411 + _1837;
    float _1921 = _1859 * _160;
    float _1923 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1721);
    float _1925 = _1893 * _1915;
    int _1927 = ~_1673;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    int _1933 = _666 * _1905;
    int _1935 = _1933 + _1029;
    float _1937 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1923);
    int _1939 = _1931;
    if (!_1677)
    {
        int _1941 = ~_1673;
        int _1943 = _1941 + 1;
        _1939 = _1943;
    }
    int _1945 = _1939;
    float _1947 = exp2(_1921);
    int _1949 = _1285 >> 31;
    float _1951 = fma(_1937, _1723, _1709);
    float _1953 = _1681 * _1925;
    float _1955 = _1739 * _1925;
    int _1957 = _1949 & 3;
    int _1959 = _1331 >> 31;
    float _1961 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1953);
    int _1963 = _1285 + _1957;
    float _1965 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1955);
    int _1967 = _1959 & 3;
    float _1969 = fma(_1693, _1911, _1961);
    int _1971 = _1963 >> 2;
    float _1973 = fma(_1749, _1911, _1965);
    bool _1975 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1977 = isnan(0.0);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1983 = _1979 || _1981;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1987 = _1971 << 4;
    int _1989 = _1987 + 368;
    float _1991 = -_1947;
    float _1993 = _1991 + 1.0;
    int _1995 = _1331 + _1967;
    float _1997 = fma(_1759, _1895, _1969);
    uint _1999 = uint(int(uint(_1989) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    float _2015 = _1727 + 0.5;
    float _2017 = _1983 ? _1993 : 0.0;
    float _2019 = fma(_1809, _1895, _1973);
    int _2021 = _1995 >> 2;
    float _2023 = _1951 + 0.5;
    float _2025 = fma(_1765, _1865, _1997);
    int _2027 = abs(_1743);
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2031 = _1705 + _2029;
    int _2033 = _2021 << 4;
    int _2035 = _2033 + 512;
    float _2037 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2039 = _1323 * _1985;
    out.m_77.x = _2023;
    out.m_77.y = _2015;
    uint _2041 = uint(int(uint(_2035) >> uint(2)));
    uint _2043 = uint(int(uint(int(_2041)) >> uint(2)));
    int _2045 = int(_2041) & 3;
    float _2047 = (*spvDescriptorSet0.vp_c9)._m0[int(_2043)][_2045];
    int _2049 = int(_2041) + 1;
    uint _2051 = uint(int(uint(_2049) >> uint(2)));
    int _2053 = _2049 & 3;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[int(_2051)][_2053];
    float _2057 = fma(_1767, _1865, _2019);
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2061 = _1703 + _2059;
    float _2063 = float(_1563);
    float _2065 = fma(_1769, _1851, _2025);
    float _2067 = float(_2027);
    float _2069 = fma(_1775, _1851, _2057);
    int _2071 = _1989 + 8;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
    int _2077 = int(_2073) & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_2073) + 1;
    uint _2083 = uint(int(uint(_2081) >> uint(2)));
    int _2085 = _2081 & 3;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[int(_2083)][_2085];
    float _2089 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2091 = ~_1549;
    int _2093 = _2091 + _1835;
    int _2095 = _2093 + 1;
    float _2097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2099 = !_1391;
    int _2101 = _2099 ? 0 : 1;
    float _2103 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2089);
    int _2105 = _624 * _2095;
    int _2107 = _2105 + _957;
    int _2109 = _2035 + 8;
    uint _2111 = uint(int(uint(_2109) >> uint(2)));
    uint _2113 = uint(int(uint(int(_2111)) >> uint(2)));
    int _2115 = int(_2111) & 3;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[int(_2113)][_2115];
    int _2119 = int(_2111) + 1;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    int _2123 = _2119 & 3;
    float _2125 = (*spvDescriptorSet0.vp_c9)._m0[int(_2121)][_2123];
    bool _2127 = !_1455;
    int _2129 = _2127 ? 0 : 1;
    float _2131 = fma(_1793, _1831, _2065);
    bool _2133 = _1303 != 3;
    float _2135 = fma(_1807, _1831, _2069);
    int _2137 = abs(_2101);
    float _2139 = fma(_1861, _1849, _2131);
    int _2141 = ~_1847;
    int _2143 = _2141 + 1;
    int _2145 = _2143 + 1;
    float _2147 = fma(_1863, _1849, _2135);
    int _2149 = ~_2137;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    float _2155 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2139);
    int _2157 = abs(_2129);
    float _2159 = _2037 * _2097;
    float _2161 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2147);
    int _2163 = abs(_1373);
    int _2165 = ~_1917;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    out.m_79.x = _2159;
    out.m_79.y = _2039;
    int _2171 = _2145 * as_type<int>(_2013);
    int _2173 = abs(_1439);
    int _2175 = _2153 * as_type<int>(_2005);
    int _2177 = _2175 + _2171;
    bool _2179 = !_2133;
    int _2181 = _2179 ? 0 : (-1);
    out.m_81.x = _2155;
    out.m_81.y = _2161;
    bool _2183 = _1357 != 3;
    int _2185 = abs(_2181);
    float _2187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2189 = _1919 + _2187;
    int _2191 = ~_2157;
    int _2193 = _2191 + 1;
    int _2195 = _2193 + 1;
    float _2197 = _2067 * _2063;
    int _2199 = _2169 * as_type<int>(_2055);
    int _2201 = ~_2163;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2103);
    bool _2209 = !_2183;
    int _2211 = _2209 ? 0 : (-1);
    int _2213 = _2195 * as_type<int>(_2047);
    int _2215 = _2213 + _2199;
    int _2217 = ~_2173;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    int _2223 = abs(_1525);
    int _2225 = _2205 * as_type<int>(_2079);
    int _2227 = _2225 + _2177;
    int _2229 = abs(_2211);
    int _2231 = abs(_1613);
    int _2233 = ~_2185;
    int _2235 = _2233 + 1;
    int _2237 = _2235 + 1;
    int _2239 = _2221 * as_type<int>(_2117);
    int _2241 = _2239 + _2215;
    int _2243 = ~_2229;
    int _2245 = _2243 + 1;
    int _2247 = _2245 + 1;
    int _2249 = _2237 * as_type<int>(_2087);
    int _2251 = _2249 + _2227;
    int _2253 = ~_2223;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = _2247 * as_type<int>(_2125);
    int _2261 = _2259 + _2241;
    bool _2263 = _624 == 0;
    int _2265 = ~_2231;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    int _2271 = _2257 * _2251;
    bool _2273 = !_2263;
    int _2275 = _2273 ? _2107 : (-1);
    float _2277 = _2031 * _2031;
    bool _2279 = _666 == 0;
    int _2281 = _2269 * _2261;
    int _2283 = _2275 * _2223;
    int _2285 = _2283 + _2271;
    bool _2287 = _2207 >= 0.0;
    float _2289 = fma(_2061, _2061, _2277);
    bool _2291 = !_2279;
    int _2293 = _2291 ? _1935 : (-1);
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2297 = 1.0 + _2295;
    bool _2299 = !_1645;
    int _2301 = _2299 ? 0 : 1;
    float _2303 = fma(_2189, _2189, _2289);
    bool _2305 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2307 = isnan(1.0);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2313 = _2309 || _2311;
    int _2315 = _2293 * _2231;
    int _2317 = _2315 + _2281;
    int _2319 = abs(_2301);
    float _2321 = 1.0 / _2297;
    float _2323 = float(_2285);
    float _2325 = in.m_83.x;
    float _2327 = in.m_83.y;
    float _2329 = in.m_83.z;
    float _2331 = as_type<float>(_2157);
    float _2333 = _2131;
    if (_2287)
    {
        _2331 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2335 = _2331;
    float _2337 = float(_2317);
    int _2339 = as_type<int>(_2335);
    if (_2287)
    {
        out.m_47.x = 0.0;
    }
    float _2341 = rsqrt(_2303);
    if (_2287)
    {
        float _2343 = _2335 * 5.0;
        _2339 = as_type<int>(_2343);
    }
    int _2345 = _2339;
    bool _2347 = !_1653;
    int _2349 = _2347 ? 0 : 1;
    out.m_85.x = _2323;
    out.m_85.y = _2337;
    float _2351 = float(_1945);
    float _2353 = float(_2319);
    if (_2287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7362 = as_type<float>(_2345);
        out.gl_Position.z = _7362;
    }
    if (_2313)
    {
        float _2355 = _2017 * _2321;
        _164 = _2355;
    }
    float _2357 = _164;
    float _2359 = _2031 * _2341;
    float _2361 = _2061 * _2341;
    if (_2287)
    {
        return out;
    }
    float _2363 = -_2359;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1705);
    float _2367 = _2353 * _2351;
    float _2369 = _2189 * _2341;
    float _2371 = -_2361;
    float _2373 = fma(_2371, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1703);
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2377 = _2365 + _2375;
    float _2379 = _2367 * (-2.0);
    float _2381 = -_2369;
    float _2383 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1919);
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2387 = _2373 + _2385;
    float _2389 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2391 = fma(_2379, _2325, _2325);
    float _2393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2395 = _2383 + _2393;
    float _2397 = _144 + (-0.5);
    float _2399 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2389);
    float _2401 = _2197 * (-2.0);
    float _2403 = fma(_1667, _2379, _1667);
    float _2405 = fma(_2397, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2391);
    float _2407 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2399);
    float _2409 = _146 + (-0.5);
    float _2411 = fma(_2401, _2327, _2327);
    float _2413 = fma(_2403, _2357, _2405);
    float _2415 = fma(_1655, _2401, _1655);
    bool _2417 = _2407 >= 0.0;
    float _2419 = fma(_2409, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2411);
    float _2421 = _2413 * 0.15915493667125701904296875;
    int _2423 = abs(_2349);
    float _2425 = -_2359;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2031);
    float _2429 = fma(_2415, _2357, _2419);
    float _2431 = _2421 * 6.283185482025146484375;
    float _2433 = sin(_2431);
    float _2435 = float(_2423);
    float _2437 = -_2361;
    float _2439 = fma(_2437, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2061);
    float _2441 = _2429 * 0.15915493667125701904296875;
    float _2443 = _2427 * _2427;
    float _2445 = float(_1629);
    float _2447 = -_2369;
    float _2449 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2189);
    float _2451 = _2401;
    float _2453 = _2369;
    float _2455 = _2439;
    if (_2417)
    {
        _2451 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2457 = _2451;
    float _2459 = _2421 * 6.283185482025146484375;
    float _2461 = cos(_2459);
    float _2463 = fma(_2439, _2439, _2443);
    int _2465 = as_type<int>(_2457);
    if (_2417)
    {
        out.m_47.x = 0.0;
    }
    float _2467 = _2435 * _2445;
    if (_2417)
    {
        float _2469 = _2457 * 5.0;
        _2465 = as_type<int>(_2469);
    }
    int _2471 = _2465;
    float _2473 = fma(_2449, _2449, _2463);
    float _2475 = _2441 * 6.283185482025146484375;
    float _2477 = sin(_2475);
    float _2479 = _2473;
    if (_2417)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7575 = as_type<float>(_2471);
        out.gl_Position.z = _7575;
    }
    if (_2417)
    {
        return out;
    }
    float _2481 = -_1705;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2485 = -_1703;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2489 = -_1919;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2493 = sqrt(_2473);
    float _2495 = _2483 * _2483;
    float _2497 = _144 + _176;
    float _2499 = _2467 * (-2.0);
    float _2501 = fma(_2487, _2487, _2495);
    float _2503 = _2497 + (-1.0);
    float _2505 = _176 + (-0.5);
    float _2507 = fma(_2499, _2329, _2329);
    float _2509 = fma(_2491, _2491, _2501);
    float _2511 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2513 = _2441 * 6.283185482025146484375;
    float _2515 = cos(_2513);
    float _2517 = fma(_2505, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2507);
    float _2519 = _2433 * _2477;
    float _2521 = fma(_2511, _2499, _2511);
    float _2523 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2525 = _2341 * _2493;
    float _2527 = fma(_2521, _2357, _2517);
    float _2529 = rsqrt(_2509);
    float _2531 = _2525 * _2523;
    float _2533 = _2527 * 0.15915493667125701904296875;
    float _2535 = in.m_87.x;
    float _2537 = in.m_87.y;
    float _2539 = in.m_87.z;
    float _2541 = _2533 * 6.283185482025146484375;
    float _2543 = sin(_2541);
    float _2545 = _2461 * _2515;
    float _2547 = _2433 * _2515;
    float _2549 = _2487 * _2529;
    float _2551 = _2491 * _2529;
    float _2553 = _2483 * _2529;
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2557 = _2549 * _2555;
    float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2561 = _2551 * _2559;
    float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2565 = _2553 * _2563;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2569 = -_2557;
    float _2571 = fma(_2551, _2567, _2569);
    float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2575 = -_2561;
    float _2577 = fma(_2553, _2573, _2575);
    float _2579 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2581 = -_2565;
    float _2583 = fma(_2549, _2579, _2581);
    float _2585 = _2533 * 6.283185482025146484375;
    float _2587 = cos(_2585);
    float _2589 = _2571 * _2571;
    float _2591 = fma(_2543, _2545, _2519);
    float _2593 = fma(_2543, _2519, _2545);
    float _2595 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2537);
    float _2597 = fma(_2577, _2577, _2589);
    float _2599 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2601 = _2461 * _2477;
    float _2603 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2605 = fma(_2583, _2583, _2597);
    float _2607 = _2595 * _2531;
    float _2609 = _2525 * _2599;
    float _2611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2535);
    float _2613 = _2525 * _2603;
    float _2615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2539);
    float _2617 = rsqrt(_2605);
    float _2619 = _2461 * _2587;
    float _2621 = _2515 * _2587;
    float _2623 = _2611 * _2609;
    float _2625 = _2433 * _2587;
    float _2627 = _2619 * _2607;
    float _2629 = -_2601;
    float _2631 = fma(_2543, _2547, _2629);
    float _2633 = -_2547;
    float _2635 = fma(_2543, _2601, _2633);
    float _2637 = _2615 * _2613;
    float _2639 = fma(_2591, _2623, _2627);
    float _2641 = -_2607;
    float _2643 = _2543 * _2641;
    float _2645 = _2625 * _2607;
    float _2647 = _2477 * _2587;
    float _2649 = fma(_2635, _2637, _2639);
    float _2651 = fma(_2621, _2623, _2643);
    float _2653 = fma(_2631, _2623, _2645);
    float _2655 = _2577 * _2617;
    float _2657 = _2571 * _2617;
    float _2659 = _2583 * _2617;
    float _2661 = fma(_2647, _2637, _2651);
    float _2663 = _2553 * _2655;
    float _2665 = _2551 * _2657;
    float _2667 = fma(_2593, _2637, _2653);
    float _2669 = -_2663;
    float _2671 = fma(_2549, _2657, _2669);
    float _2673 = -_2665;
    float _2675 = fma(_2553, _2659, _2673);
    float _2677 = _2671 * _2649;
    float _2679 = _2675 * _2649;
    float _2681 = fma(_2659, _2661, _2677);
    float _2683 = fma(_2655, _2661, _2679);
    float _2685 = fma(_2551, _2667, _2681);
    float _2687 = fma(_2549, _2667, _2683);
    float _2689 = _1919 + _2685;
    float _2691 = _1703 + _2687;
    float _2693 = _2549 * _2659;
    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2697 = _2689 + _2695;
    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2701 = _2691 + _2699;
    float _2703 = -_2693;
    float _2705 = fma(_2551, _2655, _2703);
    float _2707 = _2697 * _2697;
    float _2709 = fma(_2701, _2701, _2707);
    float _2711 = _2705 * _2649;
    float _2713 = sqrt(_2709);
    float _2715 = fma(_2657, _2661, _2711);
    float _2717 = fma(_2553, _2667, _2715);
    float _2719 = _1705 + _2717;
    bool _2721 = _2713 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2723 = _2717;
    float _2725 = _2711;
    float _2727 = _2715;
    if (!_2721)
    {
        _2723 = _2691;
    }
    float _2729 = _2723;
    float _2731 = _2729;
    if (!_2721)
    {
        _2725 = _2689;
    }
    float _2733 = _2725;
    float _2735 = _2733;
    if (!_2721)
    {
        _2727 = _2719;
    }
    float _2737 = _2727;
    bool _2739 = !_2721;
    float _2741 = _2737;
    if (!_2739)
    {
        float _2743 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2747 = _2713 + _2745;
        float _2749 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2751 = rsqrt(_2709);
        float _2753 = _2747 * _2743;
        float _2755 = _2753 * 0.15915493667125701904296875;
        float _2757 = _2755 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2755 * 6.283185482025146484375;
        float _2763 = sin(_2761);
        float _2765 = _2759 + (-1.0);
        float _2767 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2769 = fma(_2763, _2749, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2771 = fma(_2719, _2759, _2767);
        float _2773 = _2751 * _2769;
        float _2775 = fma(_2701, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2777 = fma(_2697, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2741 = _2771;
        _2731 = _2775;
        _2735 = _2777;
    }
    float _2779 = _2741;
    float _2781 = _2731;
    float _2783 = _2735;
    float _2785 = -_1705;
    float _2787 = _2785 + _2779;
    float _2789 = -_1703;
    float _2791 = _2789 + _2781;
    float _2793 = -_1919;
    float _2795 = _2793 + _2783;
    float _2797 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2799 = _2787 * _2787;
    bool _2801 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2803 = isnan(0.5);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2809 = _2805 || _2807;
    float _2811 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2797);
    float _2813 = fma(_2791, _2791, _2799);
    float _2815 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2819 = isnan(0.5);
    bool _2821 = _2817 || _2819;
    bool _2823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2825 = _2821 || _2823;
    float _2827 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2811);
    float _2829 = fma(_2795, _2795, _2813);
    float _2831 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2815);
    float _2833 = _2827 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2835 = sqrt(_2829);
    float _2837 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2831);
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2841 = _2839 + _2833;
    bool _2843 = _2835 > 0.0;
    float _2845 = 1.0 / _2833;
    float _2847 = _2839;
    float _2849 = _2783;
    float _2851 = _2779;
    float _2853 = _2795;
    float _2855 = _2781;
    if (!_2843)
    {
        _2847 = _2781;
    }
    float _2857 = _2847;
    bool _2859 = !_2843;
    float _2861 = _2857;
    if (!_2859)
    {
        float _2863 = _230 * _230;
        float _2865 = rsqrt(_2829);
        float _2867 = fma(_228, _228, _2863);
        float _2869 = fma(_232, _232, _2867);
        float _2871 = sqrt(_2869);
        float _2873 = _2791 * _2865;
        float _2875 = _2787 * _2865;
        float _2877 = _2795 * _2865;
        bool _2879 = _2871 > 0.0;
        float _2881 = _2865;
        _2853 = _2877;
        if (!_2879)
        {
            _2881 = _2781;
        }
        float _2883 = _2881;
        bool _2885 = !_2879;
        _2861 = _2883;
        if (!_2885)
        {
            float _2887 = rsqrt(_2869);
            float _2889 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2891 = _230 * _2887;
            float _2893 = _228 * _2887;
            float _2895 = _2875 * _2891;
            float _2897 = _232 * _2887;
            float _2899 = fma(_2873, _2893, _2895);
            float _2901 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2903 = fma(_2877, _2897, _2899);
            float _2905 = _2903 * _2901;
            float _2907 = fma(_228, _2905, _2781);
            float _2909 = fma(_230, _2905, _2779);
            float _2911 = fma(_232, _2905, _2783);
            _2861 = _2907;
            _2849 = _2911;
            _2851 = _2909;
        }
    }
    float _2913 = _2861;
    float _2915 = _2849;
    float _2917 = _2851;
    float _2919 = _2853;
    float _2921 = -_2361;
    float _2923 = fma(_2921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2913);
    float _2925 = -_2369;
    float _2927 = fma(_2925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2915);
    float _2929 = -_2359;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2917);
    float _2933 = _2841 * _2845;
    float _2935 = _2933 * 0.5;
    float _2937 = _2931;
    float _2939 = _2927;
    float _2941 = _2935;
    float _2943 = _2917;
    float _2945 = _2919;
    if (_2825)
    {
        _2855 = 1.0;
    }
    float _2947 = _2855;
    float _2949 = _2947;
    if (_2809)
    {
        _2453 = _2923;
    }
    float _2951 = _2453;
    float _2953 = _2951;
    if (!_2809)
    {
        float _2955 = _2377 * _2377;
        float _2957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2959 = -_1703;
        float _2961 = _2959 + _2913;
        float _2963 = -_1705;
        float _2965 = _2963 + _2917;
        float _2967 = fma(_2387, _2387, _2955);
        float _2969 = -_1919;
        float _2971 = _2969 + _2915;
        float _2973 = fma(_2395, _2395, _2967);
        float _2975 = 1.0 / _2525;
        float _2977 = sqrt(_2973);
        float _2979 = precise::min(_2977, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2981 = _2979 * _2957;
        float _2983 = _2981 * _2975;
        float _2985 = fma(_2961, _2983, _2373);
        float _2987 = fma(_2965, _2983, _2365);
        float _2989 = fma(_2971, _2983, _2383);
        _2937 = _2987;
        _2953 = _2985;
        _2939 = _2989;
    }
    float _2991 = _2937;
    float _2993 = _2953;
    float _2995 = _2939;
    if (!_2825)
    {
        float _2997 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2999 = _2997 * 0.15915493667125701904296875;
        float _3001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3003 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3005 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3003);
        float _3007 = _2999 * 6.283185482025146484375;
        float _3009 = cos(_3007);
        float _3011 = _3001 * 0.15915493667125701904296875;
        float _3013 = _2999 * 6.283185482025146484375;
        float _3015 = sin(_3013);
        float _3017 = 1.0 / _3009;
        float _3019 = _3011 * 6.283185482025146484375;
        float _3021 = cos(_3019);
        float _3023 = _3015 * _3017;
        float _3025 = _3011 * 6.283185482025146484375;
        float _3027 = sin(_3025);
        float _3029 = _3021 * _3023;
        float _3031 = 1.0 / _3005;
        float _3033 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3035 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3033;
        float _3037 = 1.0 / _3029;
        float _3039 = 1.0 / _3035;
        float _3041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3043 = _3031 * _3041;
        float _3045 = _3027 * _3037;
        float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3049 = fma(_3045, _3043, _3047);
        float _3051 = _3049 * _3039;
        float _3053 = precise::clamp(_3051, 0.0, 1.0);
        _2941 = _3031;
        _2943 = _3039;
        _2949 = _3053;
    }
    float _3055 = _2941;
    float _3057 = _2943;
    float _3059 = _2949;
    float _3061 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3063 = _2991 + _3061;
    float _3065 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3067 = _2993 + _3065;
    float _3069 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3071 = _2995 + _3069;
    float _3073 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3075 = _3063 * _3063;
    float _3077 = fma(_3067, _3067, _3075);
    float _3079 = fma(_3071, _3071, _3077);
    float _3081 = rsqrt(_3079);
    float _3083 = sqrt(_3079);
    float _3085 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3087 = _3067 * _3085;
    float _3089 = _3071 * _3085;
    float _3091 = _3087 * _3087;
    float _3093 = _3089 * _3089;
    float _3095 = _3091 + _3093;
    float _3097 = sqrt(_3095);
    bool _3099 = _3097 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3103 = _3097 + _3101;
    float _3105 = _3081;
    float _3107 = _3103;
    float _3109 = _3055;
    float _3111 = _3063;
    float _3113 = _3085;
    if (_3099)
    {
        float _3115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3105 = _3115;
    }
    float _3117 = _3105;
    float _3119 = _3117;
    if (_3099)
    {
        float _3121 = _3103 * _3117;
        _3107 = _3121;
    }
    float _3123 = _3107;
    if (_3099)
    {
        float _3125 = rsqrt(_3095);
        _3119 = _3125;
    }
    float _3127 = _3119;
    float _3129 = _3127;
    if (_3099)
    {
        float _3131 = _3123 * 0.15915493667125701904296875;
        _3109 = _3131;
    }
    float _3133 = _3109;
    float _3135 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3137 = _3071;
    float _3139 = _3133;
    if (_3099)
    {
        float _3141 = _3133 * 6.283185482025146484375;
        float _3143 = sin(_3141);
        _3137 = _3143;
    }
    float _3145 = _3137;
    float _3147 = precise::max(0.0, _3135);
    float _3149 = _3057;
    float _3151 = _3147;
    if (_3099)
    {
        float _3153 = _3133 * 6.283185482025146484375;
        float _3155 = cos(_3153);
        _3149 = _3155;
    }
    float _3157 = _3149;
    float _3159 = -_3085;
    float _3161 = -_3147;
    float _3163 = fma(_3063, _3159, _3161);
    if (_3099)
    {
        float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3111 = _3165;
    }
    float _3167 = _3111;
    float _3169 = _3145;
    float _3171 = _3167;
    if (_3099)
    {
        float _3173 = fma(_3145, _3167, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3169 = _3173;
    }
    float _3175 = _3169;
    float _3177 = _3175;
    if (!_3099)
    {
        _3171 = _3163;
    }
    float _3179 = _3171;
    float _3181 = _3179;
    if (_3099)
    {
        float _3183 = _3127 * _3175;
        _3113 = _3183;
    }
    float _3185 = _3113;
    if (!_3099)
    {
        _3129 = _3087;
    }
    float _3187 = _3129;
    float _3189 = _3187;
    float _3191 = _3157;
    if (_3099)
    {
        float _3193 = _3157 + (-1.0);
        _3151 = _3193;
    }
    float _3195 = _3151;
    float _3197 = _3195;
    if (_3099)
    {
        float _3199 = _3087 * _3185;
        _3189 = _3199;
    }
    float _3201 = _3189;
    if (!_3099)
    {
        _3177 = _3091;
    }
    float _3203 = _3177;
    float _3205 = _3203;
    if (_3099)
    {
        float _3207 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3139 = _3207;
    }
    float _3209 = _3139;
    if (!_3099)
    {
        _3197 = _3089;
    }
    float _3211 = _3197;
    float _3213 = _3211;
    if (_3099)
    {
        float _3215 = _3089 * _3185;
        _3213 = _3215;
    }
    float _3217 = _3213;
    if (_3099)
    {
        float _3219 = _3201 * _3201;
        _3205 = _3219;
    }
    float _3221 = _3205;
    if (_3099)
    {
        float _3223 = fma(_3163, _3157, _3209);
        _3181 = _3223;
    }
    float _3225 = _3181;
    if (!_3099)
    {
        _3191 = _3093;
    }
    float _3227 = _3191;
    float _3229 = _3227;
    if (_3099)
    {
        float _3231 = _3217 * _3217;
        _3229 = _3231;
    }
    float _3233 = _3229;
    float _3235 = fma(_3225, _3225, _3221);
    float _3237 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3239 = _3235 + _3233;
    float _3241 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3237);
    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3245 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3243);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3251 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3241);
    float _3253 = rsqrt(_3239);
    float _3255 = -_3247;
    float _3257 = _3255 + 1.0;
    float _3259 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3261 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3249);
    float _3263 = _3251 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3265 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3267 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3259);
    float _3269 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3261);
    float _3271 = abs(_3257);
    float _3273 = log2(_3271);
    float _3275 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3277 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3267);
    float _3279 = _3269 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3281 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3265);
    float _3283 = -_3275;
    float _3285 = fma(_3283, _3073, 1.0);
    float _3287 = _3277 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3291 = _3253 * _3201;
    float _3293 = _3253 * _3225;
    float _3295 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3281);
    float _3297 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3289);
    float _3299 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3301 = _3253 * _3217;
    float _3303 = _3295 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3305 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3297);
    float _3307 = -_3299;
    float _3309 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3307);
    float _3311 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3313 = log2(_3285);
    float _3315 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3305);
    float _3317 = -_3301;
    float _3319 = fma(_3317, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3309);
    float _3321 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3323 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3325 = _3293 + 1.0;
    float _3327 = fma(_3319, -0.5, 0.5);
    float _3329 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3321);
    float _3331 = 1.0 / _3315;
    float _3333 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3323);
    float _3335 = fma(_3319, 0.5, 0.5);
    float _3337 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3329);
    float _3339 = fma(_3335, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3341 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3337);
    float _3343 = exp2(_3311);
    float _3345 = _3313 * 0.693147182464599609375;
    float _3347 = fma(_3335, _3339, -0.212114393711090087890625);
    float _3349 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3351 = fma(_3335, _3347, 1.570728778839111328125);
    float _3353 = sqrt(_3327);
    float _3355 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3333);
    float _3357 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3355);
    float _3359 = _3341 * _3331;
    float _3361 = -_3293;
    float _3363 = fma(_3343, _3325, _3361);
    float _3365 = _3357 * _3331;
    float _3367 = fma(_3359, 0.5, 0.5);
    float _3369 = fma(_3363, 0.5, 0.5);
    float _3371 = fma(_3365, -0.5, 0.5);
    float _3373 = _3353 * 0.636619746685028076171875;
    float3 _8981 = float3(_3367, _3371, _3349);
    float _3375 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8981, float3(0.0), isnan(_8981)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8981, float3(0.0), isnan(_8981)), level(0.0)).x;
    float3 _8992 = float3(_3367, _3371, _3349);
    float4 _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8992, float3(0.0), isnan(_8992)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8992, float3(0.0), isnan(_8992)), level(0.0)).xyzw;
    float _3380 = _3378.x;
    float _3382 = _3378.y;
    float _3384 = _3378.z;
    float _3386 = _3378.w;
    float _3388 = -_3351;
    float _3390 = fma(_3373, _3388, 1.0);
    float2 _9014 = float2(_3390, _3369);
    float3 _3394 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9014, float2(0.0), isnan(_9014)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9014, float2(0.0), isnan(_9014)), level(0.0)).xyz;
    float _3396 = _3394.x;
    float _3398 = _3394.y;
    float _3400 = _3394.z;
    float _3402 = in.m_89.x;
    float _3404 = in.m_89.y;
    float _3406 = in.m_89.z;
    bool _3408 = _2537 != 0.0;
    bool _3410 = isnan(_2537);
    bool _3412 = _3408 || _3410;
    bool _3414 = isnan(0.0);
    bool _3416 = _3412 || _3414;
    float _3418 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3420 = in.m_91.x;
    float _3422 = in.m_91.y;
    float _3424 = in.m_91.z;
    float _3426 = in.m_91.w;
    bool _3428 = _2535 == 0.0;
    bool _3430 = !_3416;
    bool _3432 = _3428 && _3430;
    float _3434 = _2619 * _2675;
    float _3436 = exp2(_3418);
    bool _3438 = _2539 == 0.0;
    bool _3440 = _3438 && _3432;
    float _3442 = -_2543;
    float _3444 = fma(_3442, _2655, _3434);
    float _3446 = fma(_2625, _2549, _3444);
    float _3448 = _3402;
    float _3450 = _3406;
    float _3452 = _3315;
    float _3454 = _3341;
    float _3456 = _3357;
    if (_3440)
    {
        _2479 = _3402;
    }
    float _3458 = _2479;
    float _3460 = -_3436;
    float _3462 = _3460 + 1.0;
    float _3464 = _3458;
    if (_3440)
    {
        _2333 = _3406;
    }
    float _3466 = _2333;
    float _3468 = _3466;
    if (_3440)
    {
        _2455 = _3404;
    }
    float _3470 = _2455;
    float _3472 = _3470;
    if (_3440)
    {
        _2945 = _3458;
    }
    float _3474 = _2945;
    float _3476 = _3474;
    if (!_3440)
    {
        _3464 = _3402;
    }
    float _3478 = _3464;
    if (_3440)
    {
        _3448 = _3466;
    }
    float _3480 = _3448;
    float _3482 = _3480;
    if (!_3440)
    {
        _3468 = _3406;
    }
    float _3484 = _3468;
    if (!_3440)
    {
        float _3486 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3478);
        _3476 = _3486;
    }
    float _3488 = _3476;
    if (_3440)
    {
        _3450 = _3470;
    }
    float _3490 = _3450;
    float _3492 = _3424 * _3478;
    float _3494 = _3490;
    if (!_3440)
    {
        _3472 = _3404;
    }
    float _3496 = _3472;
    float _3498 = _3422 * _3484;
    if (!_3440)
    {
        float _3500 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3484);
        _3482 = _3500;
    }
    float _3502 = _3482;
    float _3504 = -_3492;
    float _3506 = fma(_3420, _3484, _3504);
    float _3508 = _2591 * _2671;
    float _3510 = _3420 * _3496;
    if (!_3440)
    {
        float _3512 = fma(_2537, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3496);
        _3494 = _3512;
    }
    float _3514 = _3494;
    float _3516 = -_3498;
    float _3518 = fma(_3424, _3496, _3516);
    float _3520 = _2591 * _2675;
    float _3522 = -_3510;
    float _3524 = fma(_3422, _3478, _3522);
    float _3526 = _2619 * _2705;
    float _3528 = _3506 * _3426;
    float _3530 = _3518 * _3426;
    float _3532 = _3524 * _3426;
    float _3534 = _2619 * _2671;
    float _3536 = _2591 * _2705;
    float _3538 = _2635 * _2675;
    float _3540 = _2635 * _2705;
    float _3542 = _2635 * _2671;
    float _3544 = -_2543;
    float _3546 = fma(_3544, _2657, _3526);
    float _3548 = -_2543;
    float _3550 = fma(_3548, _2659, _3534);
    float _3552 = fma(_2621, _2655, _3520);
    float _3554 = fma(_2621, _2657, _3536);
    float _3556 = fma(_2621, _2659, _3508);
    float _3558 = fma(_2647, _2655, _3538);
    float _3560 = fma(_2647, _2657, _3540);
    float _3562 = fma(_2647, _2659, _3542);
    float _3564 = fma(_2625, _2553, _3546);
    float _3566 = fma(_2625, _2551, _3550);
    float _3568 = fma(_2631, _2551, _3556);
    float _3570 = fma(_2631, _2553, _3554);
    float _3572 = _3564 * _3422;
    float _3574 = fma(_2631, _2549, _3552);
    float _3576 = _3446 * _3422;
    float _3578 = _3566 * _3422;
    float _3580 = fma(_2593, _2549, _3558);
    float _3582 = fma(_2593, _2551, _3562);
    float _3584 = _3446 * _3514;
    float _3586 = fma(_2593, _2553, _3560);
    float _3588 = _3528 * _3446;
    float _3590 = _3528 * _3564;
    float _3592 = _3528 * _3566;
    float _3594 = fma(_3570, _3420, _3572);
    float _3596 = fma(_3574, _3420, _3576);
    float _3598 = fma(_3568, _3420, _3578);
    float _3600 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3602 = fma(_3574, _3488, _3584);
    float _3604 = fma(_3586, _3424, _3594);
    float _3606 = _3564 * _3514;
    float _3608 = _3566 * _3514;
    float _3610 = _3315 * 0.5;
    float _3612 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3600);
    float _3614 = fma(_3530, _3574, _3588);
    float _3616 = fma(_3570, _3488, _3606);
    float _3618 = fma(_3568, _3488, _3608);
    float _3620 = fma(_3357, -0.5, _3610);
    float _3622 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3612);
    float _3624 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3626 = fma(_3580, _3424, _3596);
    float _3628 = fma(_3532, _3580, _3614);
    float _3630 = fma(_3580, _3502, _3602);
    float _3632 = fma(_3530, _3570, _3590);
    float _3634 = fma(_3586, _3502, _3616);
    float _3636 = fma(_3582, _3502, _3618);
    float _3638 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3622);
    float _3640 = fma(_3530, _3568, _3592);
    float _3642 = fma(_3582, _3424, _3598);
    float _3644 = fma(_3532, _3586, _3632);
    float _3646 = _3638 + _3315;
    float _3648 = _3341 + _3315;
    float _3650 = fma(_3532, _3582, _3640);
    out.m_93.x = _3626;
    out.m_93.y = _3604;
    out.m_93.z = _3642;
    float _3652 = _3646 * 0.5;
    float _3654 = _3648 * 0.5;
    out.m_95.x = _3630;
    out.m_95.y = _3634;
    out.m_95.z = _3636;
    bool _3656 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3658 = isnan(_3083);
    bool _3660 = _3656 || _3658;
    bool _3662 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3664 = _3660 || _3662;
    out.m_97.x = _3654;
    out.m_97.y = _3620;
    out.m_97.z = _3652;
    out.m_97.w = _3315;
    out.m_99.x = _3628;
    out.m_99.y = _3644;
    out.m_99.z = _3650;
    out.gl_Position.x = _3341;
    out.gl_Position.y = _3357;
    out.gl_Position.z = _3638;
    out.gl_Position.w = _3315;
    float _3666 = _3650;
    float _3668 = _3644;
    float _3670 = _3628;
    if (!_3664)
    {
        _3666 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3672 = _3666;
    float _3674 = _3672;
    float _3676 = _3672;
    if (!_3664)
    {
        _3668 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3678 = _3668;
    float _3680 = _3678;
    float _3682 = _3678;
    if (!_3664)
    {
        _3670 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3684 = _3670;
    float _3686 = _3059 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3688 = _3684;
    float _3690 = _3684;
    if (!_3664)
    {
        _3452 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3692 = _3452;
    float _3694 = _3692;
    float _3696 = _3692;
    if (!_3664)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3698 = _3454;
    float _3700 = _3698;
    float _3702 = _3698;
    if (!_3664)
    {
        _3456 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3704 = _3456;
    float _3706 = _3624 * _3375;
    float _3708 = -_3624;
    float _3710 = _3708 + 1.0;
    float _3712 = _3386 * _3706;
    float _3714 = _3386 * _3710;
    float _3716 = _3400 * _3706;
    float _3718 = fma(_3396, _3712, _3380);
    float _3720 = fma(_3398, _3712, _3382);
    float _3722 = fma(_3386, _3716, _3384);
    out.m_101.x = _3718;
    out.m_101.y = _3720;
    out.m_101.z = _3722;
    out.m_101.w = _3714;
    bool _3724 = !_3664;
    float _3726 = _3704;
    float _3728 = _3704;
    if (!_3724)
    {
        bool _3730 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3732 = isnan(_3083);
        bool _3734 = _3730 || _3732;
        bool _3736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3738 = _3734 || _3736;
        if (!_3738)
        {
            float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3742 = _3083 + _3740;
            float _3744 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3746 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3744;
            float _3748 = 1.0 / _3746;
            float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3756 = _3754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3758 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3760 = _3758 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3764 = _3762 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3768 = _3766 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3770 = _3742 * _3748;
            float _3772 = precise::clamp(_3770, 0.0, 1.0);
            float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3776 = _3774 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3778 = fma(_3772, _3752, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3780 = fma(_3772, _3776, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3782 = fma(_3772, _3756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3784 = fma(_3772, _3760, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3786 = fma(_3772, _3764, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3788 = fma(_3772, _3768, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3702 = _3780;
            _3682 = _3786;
            _3696 = _3778;
            _3676 = _3784;
            _3728 = _3782;
            _3690 = _3788;
            _3790 = true;
        }
        else
        {
            bool _3792 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3794 = isnan(_3083);
            bool _3796 = _3792 || _3794;
            bool _3798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3800 = _3796 || _3798;
            if (!_3800)
            {
                _3694 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3802 = _3694;
            _3696 = _3802;
            if (!_3800)
            {
                _3700 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3804 = _3700;
            _3702 = _3804;
            if (!_3800)
            {
                _3726 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3806 = _3726;
            _3728 = _3806;
            if (!_3800)
            {
                _3674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3808 = _3674;
            _3676 = _3808;
            if (!_3800)
            {
                _3680 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3810 = _3680;
            _3682 = _3810;
            if (!_3800)
            {
                _3688 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3812 = _3688;
            bool _3814 = !_3800;
            _3690 = _3812;
            if (!_3814)
            {
                bool _3816 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3818 = isnan(_3083);
                bool _3820 = _3816 || _3818;
                bool _3822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3824 = _3820 || _3822;
                if (!_3824)
                {
                    float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3828 = _3083 + _3826;
                    float _3830 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3832 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3830;
                    float _3834 = 1.0 / _3832;
                    float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3840 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3842 = _3840 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3844 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3846 = _3844 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3848 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3850 = _3848 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3854 = _3852 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3856 = _3828 * _3834;
                    float _3858 = precise::clamp(_3856, 0.0, 1.0);
                    float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3864 = fma(_3858, _3838, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3866 = fma(_3858, _3862, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3868 = fma(_3858, _3842, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3870 = fma(_3858, _3846, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3872 = fma(_3858, _3850, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3874 = fma(_3858, _3854, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3702 = _3866;
                    _3682 = _3872;
                    _3696 = _3864;
                    _3676 = _3870;
                    _3728 = _3868;
                    _3690 = _3874;
                    _3790 = true;
                }
                else
                {
                    _3702 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3682 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3696 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3728 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3690 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3790 = false;
    float _3876 = _3702;
    float _3878 = _3682;
    float _3880 = _3696;
    float _3882 = _3676;
    float _3884 = _3728;
    float _3886 = _3690;
    float _3888 = fma(_3634, -0.5, 0.5);
    float _3890 = precise::clamp(_3888, 0.0, 1.0);
    float _3892 = -_3876;
    float _3894 = _3892 + _3878;
    float _3896 = -_3880;
    float _3898 = _3896 + _3882;
    out.m_103.x = 0.0;
    float _3900 = fma(_3890, _3894, _3876);
    float _3902 = -_3884;
    float _3904 = _3902 + _3886;
    float _3906 = fma(_3890, _3898, _3880);
    float _3908 = _3900 * 0.586610972881317138671875;
    bool _3910 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3912 = fma(_3890, _3904, _3884);
    float _3914 = _3686 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3916 = fma(_3906, 0.298911988735198974609375, _3908);
    bool _3918 = _3059 > 0.0;
    bool _3920 = isnan(_3059);
    bool _3922 = _3918 || _3920;
    bool _3924 = isnan(0.0);
    bool _3926 = _3922 || _3924;
    float _3928 = fma(_3912, 0.114477999508380889892578125, _3916);
    out.m_47.x = _3914;
    float _3930 = -_3928;
    float _3932 = _3906 + _3930;
    float _3934 = -_3928;
    float _3936 = _3900 + _3934;
    float _3938 = -_3928;
    float _3940 = _3912 + _3938;
    float _3942 = fma(_3932, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3928);
    float _3944 = fma(_3936, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3928);
    float _3946 = fma(_3940, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3928);
    bool _3948 = !_3910;
    if (!_3948)
    {
        float _3950 = -_2991;
        float _3952 = _3950 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3954 = -_2993;
        float _3956 = _3954 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3958 = -_2995;
        float _3960 = _3958 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3962 = _3952 * _3952;
        float _3964 = fma(_3956, _3956, _3962);
        float _3966 = fma(_3960, _3960, _3964);
        float _3968 = sqrt(_3966);
        float _3970 = rsqrt(_3966);
        float _3972 = -_3968;
        float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3976 = _3974 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3978 = precise::clamp(_3976, 0.0, 1.0);
        float _3980 = _3956 * _3970;
        float _3982 = _3952 * _3970;
        float _3984 = abs(_3978);
        float _3986 = log2(_3984);
        float _3988 = _3960 * _3970;
        float _3990 = _3980 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3992 = _3634 * _3982;
        float _3994 = -_3982;
        float _3996 = -_3990;
        float _3998 = fma(_3994, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3996);
        float _4000 = fma(_3630, _3980, _3992);
        float _4002 = -_3988;
        float _4004 = fma(_4002, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3998);
        float _4006 = fma(_3636, _3988, _4000);
        float _4008 = precise::clamp(_4006, 0.0, 1.0);
        float _4010 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4012 = _4004 + _4010;
        float _4014 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4016 = _4012 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4018 = precise::clamp(_4016, 0.0, 1.0);
        float _4020 = exp2(_4014);
        float _4022 = _4020 * _4018;
        float _4024 = _4008 * _4022;
        float _4026 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4028 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4030 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _4026;
        out.m_103.y = _4028;
        out.m_103.z = _4030;
    }
    out.m_105.x = _3942;
    out.m_105.y = _3944;
    out.m_105.z = _3946;
    if (_3926)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4032 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4032;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3790 = false;
    bool _572 = false;
    bool _368 = false;
    bool _256 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_44.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_47.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4087 = as_type<float>(_140);
        out.gl_Position.z = _4087;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.w;
    float _144 = in.m_51.x;
    float _146 = in.m_51.y;
    bool _148 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_142);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_142;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _144;
    out.m_53.y = _146;
    float _162 = 0.0;
    float _164 = _160;
    if (_156)
    {
        float _166 = float(_124);
        _162 = _166;
    }
    float _168 = _162;
    bool _170 = _160 >= _168;
    bool _172 = !_156;
    bool _174 = _170 || _172;
    float _176 = in.m_51.z;
    if (_174)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _132;
    if (_174)
    {
        out.m_47.x = 0.0;
    }
    int _180 = 0;
    if (_174)
    {
        float _182 = _178 * 5.0;
        _180 = as_type<int>(_182);
    }
    int _184 = _180;
    if (_174)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4166 = as_type<float>(_184);
        out.gl_Position.z = _4166;
    }
    out.m_53.z = _176;
    if (_174)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _186 = in.m_55.x;
    bool _188 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _190 = in.m_55.y;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = in.m_63.x;
    float _212 = in.m_63.y;
    float _214 = in.m_63.z;
    out.m_65.x = _186;
    out.m_65.y = _190;
    float _216 = _194 * _200;
    float _218 = _194 * _206;
    float _220 = fma(_192, _198, _216);
    float _222 = _194 * _212;
    float _224 = fma(_192, _204, _218);
    float _226 = fma(_192, _210, _222);
    float _228 = fma(_196, _202, _220);
    float _230 = fma(_196, _208, _224);
    float _232 = fma(_196, _214, _226);
    bool _234 = !_188;
    float _236 = _190;
    float _238 = _186;
    float _254;
    if (!_234)
    {
        float _240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _242 = _144 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _244 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _246 = _244 * _240;
        float _248 = floor(_246);
        float _250 = -_248;
        float _252 = _246 + _250;
        _254 = _252;
        _256 = true;
    }
    else
    {
        float _258 = float(_124);
        float _260 = 1.0 / _258;
        float _262 = _160 * _260;
        _254 = _262;
    }
    _256 = false;
    float _264 = _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _264 + _266;
    bool _270 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_264);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    bool _286 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _288 = isnan(_264);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_280;
    float _300 = _298 + 1.0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = 1.0 / _284;
    bool _308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _310 = _296 * _300;
    float _312 = -_296;
    float _314 = _312 + 1.0;
    float _316 = _268 * _306;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    float _322 = fma(_304, _316, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = fma(_320, _316, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = _322 * _310;
    float _332 = fma(_326, _316, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _334 = _328 * _310;
    float _336 = _332 * _310;
    float _338 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].x, _330);
    float _340 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].y, _336);
    float _342 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _344 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[144].x, _338);
    float _346 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[144].y, _340);
    float _348 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[144].z, _342);
    bool _350 = !_308;
    float _366;
    if (!_350)
    {
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _144 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_124);
        float _372 = 1.0 / _370;
        float _374 = _160 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _380 = _376 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _386 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _388 = isnan(_376);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _406 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _408 = isnan(_376);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = 1.0 / _384;
    float _420 = -_396;
    float _422 = _420 + 1.0;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _424;
    bool _428 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _430 = isnan(_376);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = _416 * _422;
    float _442 = -_416;
    float _444 = _442 + 1.0;
    float _446 = 1.0 / _400;
    float _448 = _438 * _444;
    float _450 = -_438;
    float _452 = _450 + 1.0;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _458 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _460 = 1.0 / _404;
    float _462 = _426 * _418;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _470 = fma(_462, _380, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _472 = _454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = _466 * _446;
    bool _478 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = isnan(_376);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _376 + _494;
    float _498 = _470 * _448;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _502 = _376 + _500;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    float _508 = fma(_476, _496, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _510 = _492 * _460;
    float _512 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[115].x, _498);
    float _514 = _396 * _506;
    float _516 = fma(_510, _502, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _518 = fma(_508, _440, _512);
    float _520 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _522 = fma(_516, _514, _518);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _528 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[118].x, _522);
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _534 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = in.m_67.x;
    float _544 = in.m_67.y;
    float _546 = in.m_67.z;
    out.m_69.x = _534;
    out.m_69.y = _536;
    out.m_69.z = _540;
    out.m_69.w = _530;
    out.m_71.x = _472;
    out.m_71.y = _474;
    out.m_71.z = _520;
    out.m_71.w = _538;
    float _548 = _348 * _546;
    float _550 = _346 * _544;
    float _552 = _344 * _542;
    bool _554 = !_458;
    float _570;
    if (!_554)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _558 = _144 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        float _574 = float(_124);
        float _576 = 1.0 / _574;
        float _578 = _160 * _576;
        _570 = _578;
    }
    _572 = false;
    float _580 = _570;
    float _582 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _584 = int(_582);
    float _586 = float(_124);
    float _588 = in.m_73.w;
    float _590 = in.m_59.w;
    float _592 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _594 = int(_592);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _620 = float(_584);
    float _622 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _624 = int(_622);
    float _626 = in.m_61.w;
    float _628 = float(_594);
    float _630 = 1.0 / _620;
    out.m_75.w = _588;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _640 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _642 = isnan(_580);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    bool _652 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _654 = isnan(_580);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _666 = int(_664);
    float _668 = float(uint(_624));
    int _670 = ~_624;
    int _672 = _670 + 1;
    bool _674 = _624 == 0;
    float _676 = 1.0 / _628;
    float _678 = _630 * _160;
    bool _680 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _682 = isnan(_580);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _692;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _698 = _696 != 0;
    float _700 = float(uint(_666));
    float _702 = 1.0 / _668;
    int _704 = ~_666;
    int _706 = _704 + 1;
    bool _708 = _666 == 0;
    int _710 = ~_666;
    int _712 = _710 + 1;
    float _714 = _676 * _160;
    float _716 = trunc(_678);
    int _718 = int(_716);
    float _720 = 1.0 / _700;
    int _722 = as_type<int>(_702) + (-2);
    float _724 = trunc(_714);
    int _726 = int(_724);
    float _728 = float(uint(_718));
    float _730 = as_type<float>(_722) * _728;
    int _732 = as_type<int>(_720) + (-2);
    float _734 = 1.0 / _586;
    float _736 = float(uint(_726));
    float _738 = trunc(_730);
    float _740 = precise::max(_738, 0.0);
    uint _743 = uint(_740);
    float _745 = as_type<float>(_732) * _736;
    int _747 = ~_624;
    int _749 = _747 + 1;
    float _751 = trunc(_745);
    float _753 = precise::max(_751, 0.0);
    uint _755 = uint(_753);
    float _757 = _734 * _160;
    int _759 = _749 * int(_743);
    int _761 = _759 + _718;
    float _763 = 1.0 / _602;
    float _765 = float(uint(_761));
    int _767 = _706 * int(_755);
    int _769 = _767 + _726;
    float _771 = 1.0 / _598;
    float _773 = as_type<float>(_722) * _765;
    float _775 = _765;
    float _777 = as_type<float>(_769);
    if (_698)
    {
        _775 = 1.0;
    }
    float _779 = _775;
    float _781 = float(uint(_769));
    float _783 = _779;
    float _785 = _781;
    if (!_698)
    {
        _783 = 7.345489978790283203125;
    }
    float _787 = _783;
    float _789 = trunc(_773);
    float _791 = precise::max(_789, 0.0);
    uint _793 = uint(_791);
    float _795 = as_type<float>(_732) * _781;
    if (_698)
    {
        _785 = _144;
    }
    float _797 = _785;
    float _799 = _787 * _144;
    float _801 = _797;
    if (_698)
    {
        _777 = 1.0;
    }
    float _803 = _777;
    float _805 = _803;
    if (!_698)
    {
        _801 = _146;
    }
    float _807 = _801;
    float _809 = trunc(_795);
    float _811 = precise::max(_809, 0.0);
    uint _813 = uint(_811);
    if (!_698)
    {
        _805 = 1.2345600128173828125;
    }
    float _815 = _805;
    float _817 = _807 * _815;
    float _819 = float(_624);
    float _821 = floor(_799);
    int _823 = int(_743) + int(_793);
    int _825 = ~_666;
    int _827 = _825 + 1;
    float _829 = float(_718);
    int _831 = _672 * _823;
    int _833 = _831 + _718;
    float _835 = floor(_817);
    int _837 = int(_755) + int(_813);
    bool _839 = _829 >= _819;
    bool _841 = isnan(_829);
    bool _843 = _839 || _841;
    bool _845 = isnan(_819);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    bool _851 = uint(_833) >= uint(_624);
    int _853 = _827 * _837;
    int _855 = _853 + _726;
    float _857 = -_821;
    float _859 = _799 + _857;
    float _861 = float(_666);
    float _863 = trunc(_849);
    int _865 = int(_863);
    bool _867 = uint(_855) >= uint(_666);
    float _869 = _819 * _859;
    float _871 = float(_726);
    float _873 = -_835;
    float _875 = _817 + _873;
    bool _877 = !_851;
    int _879 = _877 ? 0 : (-1);
    float _881 = _819 * _757;
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _885 = _883 != 0;
    float _887 = trunc(_869);
    int _889 = int(_887);
    int _891 = ~_823;
    int _893 = _891 + _879;
    int _895 = _893 + 1;
    float _897 = _861 * _875;
    bool _899 = _871 >= _861;
    bool _901 = isnan(_871);
    bool _903 = _899 || _901;
    bool _905 = isnan(_861);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    bool _911 = !_885;
    int _913 = _911 ? 0 : 1;
    int _915 = _624 * _895;
    int _917 = _915 + _718;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _921 = _919 != 0;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _925 = _923 != 0;
    float _927 = 1.0 / _610;
    int _929 = abs(_913);
    float _931 = _861 * _757;
    bool _933 = !_867;
    int _935 = _933 ? 0 : (-1);
    bool _937 = !_674;
    int _939 = _937 ? _917 : (-1);
    int _941 = ~_837;
    int _943 = _941 + _935;
    int _945 = _943 + 1;
    float _947 = trunc(_909);
    int _949 = int(_947);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _953 = _951 != 0;
    int _955 = _889 * _929;
    int _957 = _955 + _718;
    int _959 = ~_865;
    int _961 = _959 + 1;
    int _963 = _961 + 1;
    int _965 = _666 * _945;
    int _967 = _965 + _726;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _975 = _973 != 0;
    int _977 = _963 * _939;
    bool _979 = !_708;
    int _981 = _979 ? _967 : (-1);
    float _983 = trunc(_897);
    int _985 = int(_983);
    int _987 = _624 + (-1);
    int _989 = ~_949;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    int _995 = _865 * _987;
    int _997 = _995 + _977;
    bool _999 = !_953;
    int _1001 = _999 ? 0 : 1;
    float _1003 = 1.0 / _606;
    bool _1005 = !_925;
    int _1007 = _1005 ? 0 : 1;
    int _1009 = _993 * _981;
    bool _1011 = !_975;
    int _1013 = _1011 ? 0 : 1;
    int _1015 = abs(_1001);
    int _1017 = abs(_1013);
    float _1019 = 1.0 / _614;
    int _1021 = abs(_1007);
    bool _1023 = !_921;
    int _1025 = _1023 ? 0 : 1;
    int _1027 = _985 * _1015;
    int _1029 = _1027 + _726;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1033 = _1031 != 0;
    float _1035 = trunc(_881);
    int _1037 = int(_1035);
    int _1039 = abs(_1025);
    int _1041 = _997 * _1021;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1045 = _1043 != 0;
    int _1047 = _666 + (-1);
    bool _1049 = !_1033;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = trunc(_931);
    int _1055 = int(_1053);
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1059 = _1057 != 0;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1063 = _1061 != 0;
    int _1065 = _949 * _1047;
    int _1067 = _1065 + _1009;
    bool _1069 = !_971;
    int _1071 = _1069 ? 0 : 1;
    bool _1073 = _624 == 0;
    int _1075 = _1067 * _1017;
    int _1077 = abs(_1071);
    int _1079 = _1037 * _1039;
    int _1081 = _1079 + _1041;
    bool _1083 = !_1045;
    int _1085 = _1083 ? 0 : 1;
    float _1087 = _144 * 2.0;
    int _1089 = abs(_1051);
    float _1091 = 1.0 / _618;
    bool _1093 = !_1059;
    int _1095 = _1093 ? 0 : 1;
    int _1097 = abs(_1085);
    int _1099 = _1055 * _1077;
    int _1101 = _1099 + _1075;
    int _1103 = abs(_1095);
    float _1105 = floor(_1087);
    int _1107 = _957 * _1089;
    int _1109 = _1107 + _1081;
    bool _1111 = !_1063;
    int _1113 = _1111 ? 0 : 1;
    int _1115 = _889 * _1097;
    int _1117 = _1115 + _1109;
    int _1119 = abs(_1113);
    int _1121 = ~_666;
    int _1123 = _1121 + 1;
    int _1125 = _1029 * _1103;
    int _1127 = _1125 + _1101;
    float _1129 = float(uint(_1117));
    int _1131 = ~_624;
    int _1133 = _1131 + 1;
    int _1135 = _985 * _1119;
    int _1137 = _1135 + _1127;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1141 = _1139 != 0;
    float _1143 = as_type<float>(_722) * _1129;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1147 = _1145 != 0;
    float _1149 = float(uint(_1137));
    float _1151 = trunc(_1143);
    float _1153 = precise::max(_1151, 0.0);
    uint _1155 = uint(_1153);
    float _1157 = as_type<float>(_732) * _1149;
    int _1159 = ~_624;
    int _1161 = _1159 + 1;
    bool _1163 = _971;
    float _1165 = as_type<float>(_1137);
    if (_1141)
    {
        bool _1167 = _144 > 0.5;
        _1163 = _1167;
    }
    bool _1169 = _1163;
    float _1171 = trunc(_1157);
    float _1173 = precise::max(_1171, 0.0);
    uint _1175 = uint(_1173);
    int _1177 = _1161 * int(_1155);
    int _1179 = _1177 + _1117;
    float _1181 = float(uint(_1179));
    int _1183 = _1123 * int(_1175);
    int _1185 = _1183 + _1137;
    float _1187 = as_type<float>(_722) * _1181;
    float _1189 = float(uint(_1185));
    float _1191 = trunc(_1187);
    float _1193 = precise::max(_1191, 0.0);
    uint _1195 = uint(_1193);
    float _1197 = as_type<float>(_732) * _1189;
    float _1199 = trunc(_1197);
    float _1201 = precise::max(_1199, 0.0);
    uint _1203 = uint(_1201);
    int _1205 = int(_1155) + int(_1195);
    int _1207 = ~_666;
    int _1209 = _1207 + 1;
    int _1211 = _1133 * _1205;
    int _1213 = _1211 + _1117;
    int _1215 = int(_1175) + int(_1203);
    int _1217 = _1209;
    float _1219 = as_type<float>(_1175);
    if (_1141)
    {
        float _1221 = -_186;
        float _1223 = _1221 + 1.0;
        _1217 = as_type<int>(_1223);
    }
    int _1225 = _1217;
    bool _1227 = uint(_1213) >= uint(_624);
    if (!_1141)
    {
        _1219 = _186;
    }
    float _1229 = _1219;
    int _1231 = _1209 * _1215;
    int _1233 = _1231 + _1137;
    bool _1235 = !_1227;
    int _1237 = _1235 ? 0 : (-1);
    float _1239 = _1229;
    if (_1141)
    {
        float _1241 = _1169 ? as_type<float>(_1225) : _186;
        _1239 = _1241;
    }
    float _1243 = _1239;
    float _1245 = -_190;
    float _1247 = _1245 + 1.0;
    int _1249 = ~_1205;
    int _1251 = _1249 + _1237;
    int _1253 = _1251 + 1;
    bool _1255 = _146 > 0.5;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1259 = _1257 != 0;
    int _1261 = _624 * _1253;
    int _1263 = _1261 + _1117;
    bool _1265 = uint(_1233) >= uint(_666);
    int _1267 = _1255 ? as_type<int>(_1247) : as_type<int>(_190);
    bool _1269 = _146 > 0.5;
    bool _1271 = _1269 && _1259;
    bool _1273 = !_1265;
    int _1275 = _1273 ? 0 : (-1);
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1279 = _1277 != 0;
    bool _1281 = _176 > 0.5;
    bool _1283 = !_1073;
    int _1285 = _1283 ? _1263 : (-1);
    int _1287 = ~_1215;
    int _1289 = _1287 + _1275;
    int _1291 = _1289 + 1;
    float _1293 = _1279 ? as_type<float>(_1267) : _190;
    if (_1147)
    {
        float _1295 = _1281 ? _1247 : _190;
        _236 = _1295;
    }
    float _1297 = _236;
    int _1299 = _666 * _1291;
    int _1301 = _1299 + _1137;
    int _1303 = _1285 & 3;
    float _1305 = in.m_44.x;
    float _1307 = in.m_44.y;
    float _1309 = in.m_44.z;
    if (!_1259)
    {
        _1165 = _186;
    }
    float _1311 = _1165;
    float _1313 = _1311;
    if (_1271)
    {
        float _1315 = -_186;
        float _1317 = _1315 + 1.0;
        _238 = _1317;
    }
    float _1319 = _238;
    bool _1321 = _1303 != 3;
    float _1323 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1325 = uint(_1303) >= 2u;
    float _1327 = float(uint(_957));
    bool _1329 = !_708;
    int _1331 = _1329 ? _1301 : (-1);
    if (_1259)
    {
        _1313 = _1319;
    }
    float _1333 = _1313;
    float _1335 = as_type<float>(_722) * _1327;
    int _1337 = _1325 ? 0 : 1;
    float _1339 = float(uint(_1029));
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1343 = _1341 != 0;
    float _1345 = trunc(_1335);
    float _1347 = precise::max(_1345, 0.0);
    uint _1349 = uint(_1347);
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1353 = _1351 != 0;
    float _1355 = as_type<float>(_732) * _1339;
    int _1357 = _1331 & 3;
    int _1359 = ~_1337;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    float _1365 = _206 * _1307;
    int _1367 = _1363;
    if (_1321)
    {
        int _1369 = ~_1337;
        int _1371 = _1369 + 1;
        _1367 = _1371;
    }
    int _1373 = _1367;
    float _1375 = trunc(_1355);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    bool _1381 = uint(_1357) >= 2u;
    float _1383 = _200 * _1307;
    bool _1385 = uint(_1303) > 1u;
    float _1387 = _212 * _1307;
    int _1389 = _1285 & 3;
    bool _1391 = _1389 != 0;
    float _1393 = fma(_204, _1305, _1365);
    int _1395 = _1381 ? 0 : 1;
    float _1397 = fma(_210, _1305, _1387);
    bool _1399 = _1357 != 3;
    float _1401 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1403 = _1391 ? 0 : 1;
    float _1405 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1407 = ~_624;
    int _1409 = _1407 + 1;
    float _1411 = fma(_214, _1309, _1397);
    int _1413 = ~_1403;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    int _1419 = _1417;
    if (!_1385)
    {
        int _1421 = ~_1403;
        int _1423 = _1421 + 1;
        _1419 = _1423;
    }
    int _1425 = _1419;
    int _1427 = ~_1395;
    int _1429 = _1427 + 1;
    int _1431 = _1429 + 1;
    int _1433 = _1431;
    if (_1399)
    {
        int _1435 = ~_1395;
        int _1437 = _1435 + 1;
        _1433 = _1437;
    }
    int _1439 = _1433;
    int _1441 = _1409 * int(_1349);
    int _1443 = _1441 + _957;
    bool _1445 = uint(_1357) > 1u;
    float _1447 = fma(_198, _1305, _1383);
    int _1449 = _712 * int(_1379);
    int _1451 = _1449 + _1029;
    int _1453 = _1331 & 3;
    bool _1455 = _1453 != 0;
    float _1457 = _146 * 2.0;
    float _1459 = float(uint(_1443));
    float _1461 = fma(_202, _1309, _1447);
    float _1463 = float(uint(_1451));
    float _1465 = floor(_1457);
    int _1467 = _1455 ? 0 : 1;
    float _1469 = as_type<float>(_722) * _1459;
    float _1471 = as_type<float>(_732) * _1463;
    int _1473 = ~_1467;
    int _1475 = _1473 + 1;
    int _1477 = _1475 + 1;
    float _1479 = fma(_208, _1309, _1393);
    int _1481 = _1477;
    if (!_1445)
    {
        int _1483 = ~_1467;
        int _1485 = _1483 + 1;
        _1481 = _1485;
    }
    int _1487 = _1481;
    float _1489 = trunc(_1469);
    float _1491 = precise::max(_1489, 0.0);
    uint _1493 = uint(_1491);
    bool _1495 = _1105 >= 0.0;
    bool _1497 = isnan(_1105);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.0);
    bool _1503 = _1499 || _1501;
    float _1505 = _176 * 2.0;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1509 = _1503 ? 0 : 1;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1513 = _580 + _1511;
    bool _1515 = _1105 > 0.0;
    float _1517 = trunc(_1471);
    float _1519 = precise::max(_1517, 0.0);
    uint _1521 = uint(_1519);
    bool _1523 = !_1343;
    int _1525 = _1523 ? 0 : 1;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1529 = ~_1509;
    int _1531 = _1529 + 1;
    int _1533 = _1531 + 1;
    float _1535 = -_1507;
    float _1537 = fma(_1401, 2.0, _1535);
    bool _1539 = _1465 > 0.0;
    float _1541 = fma(_1405, -2.0, _1527);
    int _1543 = ~_624;
    int _1545 = _1543 + 1;
    float _1547 = floor(_1505);
    int _1549 = int(_1349) + int(_1493);
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1553 = _580 + _1551;
    float _1555 = _1513 * _763;
    int _1557 = _1533;
    if (!_1515)
    {
        int _1559 = ~_1509;
        int _1561 = _1559 + 1;
        _1557 = _1561;
    }
    int _1563 = _1557;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1567 = _580 + _1565;
    bool _1569 = _1465 >= 0.0;
    bool _1571 = isnan(_1465);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.0);
    bool _1577 = _1573 || _1575;
    int _1579 = _1545 * _1549;
    int _1581 = _1579 + _957;
    int _1583 = ~_666;
    int _1585 = _1583 + 1;
    float _1587 = _1553 * _771;
    int _1589 = int(_1379) + int(_1521);
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1593 = _580 + _1591;
    int _1595 = _1577 ? 0 : 1;
    float _1597 = _1567 * _927;
    int _1599 = _1585 * _1589;
    int _1601 = _1599 + _1029;
    int _1603 = ~_1595;
    int _1605 = _1603 + 1;
    int _1607 = _1605 + 1;
    float _1609 = _1593 * _1003;
    bool _1611 = !_1353;
    int _1613 = _1611 ? 0 : 1;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1617 = _580 + _1615;
    bool _1619 = uint(_1601) >= uint(_666);
    float _1621 = _146 + _176;
    int _1623 = _1607;
    if (!_1539)
    {
        int _1625 = ~_1595;
        int _1627 = _1625 + 1;
        _1623 = _1627;
    }
    int _1629 = _1623;
    float _1631 = _144 + _146;
    bool _1633 = uint(_1581) >= uint(_624);
    float _1635 = _1621 + (-1.0);
    bool _1637 = !_1619;
    int _1639 = _1637 ? 0 : (-1);
    float _1641 = _1631 + (-1.0);
    int _1643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1645 = _1643 != 0;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1649 = _1647 != 0;
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1653 = _1651 != 0;
    float _1655 = fma(_1635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1657 = _1547 >= 0.0;
    bool _1659 = isnan(_1547);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan(0.0);
    bool _1665 = _1661 || _1663;
    float _1667 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1671 = _580 + _1669;
    int _1673 = _1665 ? 0 : 1;
    float _1675 = _1617 * _1019;
    bool _1677 = _1547 > 0.0;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1681 = fma(_634, _1587, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1683 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1679);
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1687 = _580 + _1685;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1689;
    float _1693 = fma(_638, _1555, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1695 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1697 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1683);
    float _1699 = 1.0 / _1691;
    float _1701 = _1687 * _1091;
    float _1703 = _1461 + _590;
    float _1705 = _1479 + _626;
    float _1707 = -_160;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1537);
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1713 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1711;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1719 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1541);
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1723 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1725 = -_1719;
    float _1727 = fma(_1697, _1695, _1725);
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1729;
    float _1733 = _1671 * _1699;
    float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1737 = _1735 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1739 = fma(_1731, _1587, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1741 = !_1649;
    int _1743 = _1741 ? 0 : 1;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1745;
    float _1749 = fma(_1737, _1555, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1753 = _1751 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1755;
    float _1759 = fma(_1747, _1609, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1761;
    float _1765 = fma(_1753, _1597, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1767 = fma(_1717, _1597, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1769 = fma(_1757, _1675, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1773 = _1771 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1775 = fma(_1763, _1675, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1779 = _1777 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _1781 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1783 = isnan(_580);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    float _1793 = fma(_1773, _1701, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1795 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1797 = isnan(_580);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    float _1807 = fma(_1779, _1701, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1809 = fma(_1713, _1609, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1811 = -_1791;
    float _1813 = _1811 + 1.0;
    bool _1815 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1817 = isnan(_580);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    float _1827 = -_1805;
    float _1829 = _1827 + 1.0;
    float _1831 = _1805 * _1813;
    bool _1833 = !_1633;
    int _1835 = _1833 ? 0 : (-1);
    float _1837 = in.m_63.w;
    float _1839 = -_1825;
    float _1841 = _1839 + 1.0;
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1843;
    int _1847 = abs(_1425);
    float _1849 = _1791 * _1841;
    float _1851 = _650 * _1829;
    float _1853 = -_650;
    float _1855 = _1853 + 1.0;
    float _1857 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1859 = log2(_1857);
    float _1861 = fma(_1845, _1733, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1863 = fma(_694, _1733, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1865 = _662 * _1855;
    float _1867 = -_662;
    float _1869 = _1867 + 1.0;
    bool _1871 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1873 = isnan(_580);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1879 = _1875 || _1877;
    float _1881 = float(_1879);
    bool _1883 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1885 = isnan(_580);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1891 = _1887 || _1889;
    float _1893 = float(_1891);
    float _1895 = _690 * _1869;
    float _1897 = -_690;
    float _1899 = _1897 + 1.0;
    int _1901 = ~_1589;
    int _1903 = _1901 + _1639;
    int _1905 = _1903 + 1;
    float _1907 = -_1893;
    float _1909 = _1907 + 1.0;
    float _1911 = _1881 * _1899;
    float _1913 = -_1881;
    float _1915 = _1913 + 1.0;
    int _1917 = abs(_1487);
    float _1919 = _1411 + _1837;
    float _1921 = _1859 * _160;
    float _1923 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1721);
    float _1925 = _1893 * _1915;
    int _1927 = ~_1673;
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    int _1933 = _666 * _1905;
    int _1935 = _1933 + _1029;
    float _1937 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1923);
    int _1939 = _1931;
    if (!_1677)
    {
        int _1941 = ~_1673;
        int _1943 = _1941 + 1;
        _1939 = _1943;
    }
    int _1945 = _1939;
    float _1947 = exp2(_1921);
    int _1949 = _1285 >> 31;
    float _1951 = fma(_1937, _1723, _1709);
    float _1953 = _1681 * _1925;
    float _1955 = _1739 * _1925;
    int _1957 = _1949 & 3;
    int _1959 = _1331 >> 31;
    float _1961 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1953);
    int _1963 = _1285 + _1957;
    float _1965 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1955);
    int _1967 = _1959 & 3;
    float _1969 = fma(_1693, _1911, _1961);
    int _1971 = _1963 >> 2;
    float _1973 = fma(_1749, _1911, _1965);
    bool _1975 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1977 = isnan(0.0);
    bool _1979 = _1975 || _1977;
    bool _1981 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1983 = _1979 || _1981;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1987 = _1971 << 4;
    int _1989 = _1987 + 368;
    float _1991 = -_1947;
    float _1993 = _1991 + 1.0;
    int _1995 = _1331 + _1967;
    float _1997 = fma(_1759, _1895, _1969);
    uint _1999 = uint(int(uint(_1989) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    float _2015 = _1727 + 0.5;
    float _2017 = _1983 ? _1993 : 0.0;
    float _2019 = fma(_1809, _1895, _1973);
    int _2021 = _1995 >> 2;
    float _2023 = _1951 + 0.5;
    float _2025 = fma(_1765, _1865, _1997);
    int _2027 = abs(_1743);
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2031 = _1705 + _2029;
    int _2033 = _2021 << 4;
    int _2035 = _2033 + 512;
    float _2037 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2039 = _1323 * _1985;
    out.m_77.x = _2023;
    out.m_77.y = _2015;
    uint _2041 = uint(int(uint(_2035) >> uint(2)));
    uint _2043 = uint(int(uint(int(_2041)) >> uint(2)));
    int _2045 = int(_2041) & 3;
    float _2047 = (*spvDescriptorSet0.vp_c9)._m0[int(_2043)][_2045];
    int _2049 = int(_2041) + 1;
    uint _2051 = uint(int(uint(_2049) >> uint(2)));
    int _2053 = _2049 & 3;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[int(_2051)][_2053];
    float _2057 = fma(_1767, _1865, _2019);
    float _2059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2061 = _1703 + _2059;
    float _2063 = float(_1563);
    float _2065 = fma(_1769, _1851, _2025);
    float _2067 = float(_2027);
    float _2069 = fma(_1775, _1851, _2057);
    int _2071 = _1989 + 8;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
    int _2077 = int(_2073) & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_2073) + 1;
    uint _2083 = uint(int(uint(_2081) >> uint(2)));
    int _2085 = _2081 & 3;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[int(_2083)][_2085];
    float _2089 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2091 = ~_1549;
    int _2093 = _2091 + _1835;
    int _2095 = _2093 + 1;
    float _2097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2099 = !_1391;
    int _2101 = _2099 ? 0 : 1;
    float _2103 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2089);
    int _2105 = _624 * _2095;
    int _2107 = _2105 + _957;
    int _2109 = _2035 + 8;
    uint _2111 = uint(int(uint(_2109) >> uint(2)));
    uint _2113 = uint(int(uint(int(_2111)) >> uint(2)));
    int _2115 = int(_2111) & 3;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[int(_2113)][_2115];
    int _2119 = int(_2111) + 1;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    int _2123 = _2119 & 3;
    float _2125 = (*spvDescriptorSet0.vp_c9)._m0[int(_2121)][_2123];
    bool _2127 = !_1455;
    int _2129 = _2127 ? 0 : 1;
    float _2131 = fma(_1793, _1831, _2065);
    bool _2133 = _1303 != 3;
    float _2135 = fma(_1807, _1831, _2069);
    int _2137 = abs(_2101);
    float _2139 = fma(_1861, _1849, _2131);
    int _2141 = ~_1847;
    int _2143 = _2141 + 1;
    int _2145 = _2143 + 1;
    float _2147 = fma(_1863, _1849, _2135);
    int _2149 = ~_2137;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    float _2155 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2139);
    int _2157 = abs(_2129);
    float _2159 = _2037 * _2097;
    float _2161 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2147);
    int _2163 = abs(_1373);
    int _2165 = ~_1917;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    out.m_79.x = _2159;
    out.m_79.y = _2039;
    int _2171 = _2145 * as_type<int>(_2013);
    int _2173 = abs(_1439);
    int _2175 = _2153 * as_type<int>(_2005);
    int _2177 = _2175 + _2171;
    bool _2179 = !_2133;
    int _2181 = _2179 ? 0 : (-1);
    out.m_81.x = _2155;
    out.m_81.y = _2161;
    bool _2183 = _1357 != 3;
    int _2185 = abs(_2181);
    float _2187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2189 = _1919 + _2187;
    int _2191 = ~_2157;
    int _2193 = _2191 + 1;
    int _2195 = _2193 + 1;
    float _2197 = _2067 * _2063;
    int _2199 = _2169 * as_type<int>(_2055);
    int _2201 = ~_2163;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2103);
    bool _2209 = !_2183;
    int _2211 = _2209 ? 0 : (-1);
    int _2213 = _2195 * as_type<int>(_2047);
    int _2215 = _2213 + _2199;
    int _2217 = ~_2173;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    int _2223 = abs(_1525);
    int _2225 = _2205 * as_type<int>(_2079);
    int _2227 = _2225 + _2177;
    int _2229 = abs(_2211);
    int _2231 = abs(_1613);
    int _2233 = ~_2185;
    int _2235 = _2233 + 1;
    int _2237 = _2235 + 1;
    int _2239 = _2221 * as_type<int>(_2117);
    int _2241 = _2239 + _2215;
    int _2243 = ~_2229;
    int _2245 = _2243 + 1;
    int _2247 = _2245 + 1;
    int _2249 = _2237 * as_type<int>(_2087);
    int _2251 = _2249 + _2227;
    int _2253 = ~_2223;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = _2247 * as_type<int>(_2125);
    int _2261 = _2259 + _2241;
    bool _2263 = _624 == 0;
    int _2265 = ~_2231;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    int _2271 = _2257 * _2251;
    bool _2273 = !_2263;
    int _2275 = _2273 ? _2107 : (-1);
    float _2277 = _2031 * _2031;
    bool _2279 = _666 == 0;
    int _2281 = _2269 * _2261;
    int _2283 = _2275 * _2223;
    int _2285 = _2283 + _2271;
    bool _2287 = _2207 >= 0.0;
    float _2289 = fma(_2061, _2061, _2277);
    bool _2291 = !_2279;
    int _2293 = _2291 ? _1935 : (-1);
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2297 = 1.0 + _2295;
    bool _2299 = !_1645;
    int _2301 = _2299 ? 0 : 1;
    float _2303 = fma(_2189, _2189, _2289);
    bool _2305 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2307 = isnan(1.0);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2313 = _2309 || _2311;
    int _2315 = _2293 * _2231;
    int _2317 = _2315 + _2281;
    int _2319 = abs(_2301);
    float _2321 = 1.0 / _2297;
    float _2323 = float(_2285);
    float _2325 = in.m_83.x;
    float _2327 = in.m_83.y;
    float _2329 = in.m_83.z;
    float _2331 = as_type<float>(_2157);
    float _2333 = _2131;
    if (_2287)
    {
        _2331 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2335 = _2331;
    float _2337 = float(_2317);
    int _2339 = as_type<int>(_2335);
    if (_2287)
    {
        out.m_47.x = 0.0;
    }
    float _2341 = rsqrt(_2303);
    if (_2287)
    {
        float _2343 = _2335 * 5.0;
        _2339 = as_type<int>(_2343);
    }
    int _2345 = _2339;
    bool _2347 = !_1653;
    int _2349 = _2347 ? 0 : 1;
    out.m_85.x = _2323;
    out.m_85.y = _2337;
    float _2351 = float(_1945);
    float _2353 = float(_2319);
    if (_2287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7362 = as_type<float>(_2345);
        out.gl_Position.z = _7362;
    }
    if (_2313)
    {
        float _2355 = _2017 * _2321;
        _164 = _2355;
    }
    float _2357 = _164;
    float _2359 = _2031 * _2341;
    float _2361 = _2061 * _2341;
    if (_2287)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2363 = -_2359;
    float _2365 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1705);
    float _2367 = _2353 * _2351;
    float _2369 = _2189 * _2341;
    float _2371 = -_2361;
    float _2373 = fma(_2371, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1703);
    float _2375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2377 = _2365 + _2375;
    float _2379 = _2367 * (-2.0);
    float _2381 = -_2369;
    float _2383 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1919);
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2387 = _2373 + _2385;
    float _2389 = _2377 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2391 = fma(_2379, _2325, _2325);
    float _2393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2395 = _2383 + _2393;
    float _2397 = _144 + (-0.5);
    float _2399 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2389);
    float _2401 = _2197 * (-2.0);
    float _2403 = fma(_1667, _2379, _1667);
    float _2405 = fma(_2397, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2391);
    float _2407 = fma(_2395, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2399);
    float _2409 = _146 + (-0.5);
    float _2411 = fma(_2401, _2327, _2327);
    float _2413 = fma(_2403, _2357, _2405);
    float _2415 = fma(_1655, _2401, _1655);
    bool _2417 = _2407 >= 0.0;
    float _2419 = fma(_2409, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2411);
    float _2421 = _2413 * 0.15915493667125701904296875;
    int _2423 = abs(_2349);
    float _2425 = -_2359;
    float _2427 = fma(_2425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2031);
    float _2429 = fma(_2415, _2357, _2419);
    float _2431 = _2421 * 6.283185482025146484375;
    float _2433 = sin(_2431);
    float _2435 = float(_2423);
    float _2437 = -_2361;
    float _2439 = fma(_2437, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2061);
    float _2441 = _2429 * 0.15915493667125701904296875;
    float _2443 = _2427 * _2427;
    float _2445 = float(_1629);
    float _2447 = -_2369;
    float _2449 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2189);
    float _2451 = _2401;
    float _2453 = _2369;
    float _2455 = _2439;
    if (_2417)
    {
        _2451 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2457 = _2451;
    float _2459 = _2421 * 6.283185482025146484375;
    float _2461 = cos(_2459);
    float _2463 = fma(_2439, _2439, _2443);
    int _2465 = as_type<int>(_2457);
    if (_2417)
    {
        out.m_47.x = 0.0;
    }
    float _2467 = _2435 * _2445;
    if (_2417)
    {
        float _2469 = _2457 * 5.0;
        _2465 = as_type<int>(_2469);
    }
    int _2471 = _2465;
    float _2473 = fma(_2449, _2449, _2463);
    float _2475 = _2441 * 6.283185482025146484375;
    float _2477 = sin(_2475);
    float _2479 = _2473;
    if (_2417)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7575 = as_type<float>(_2471);
        out.gl_Position.z = _7575;
    }
    if (_2417)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2481 = -_1705;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2485 = -_1703;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2489 = -_1919;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2493 = sqrt(_2473);
    float _2495 = _2483 * _2483;
    float _2497 = _144 + _176;
    float _2499 = _2467 * (-2.0);
    float _2501 = fma(_2487, _2487, _2495);
    float _2503 = _2497 + (-1.0);
    float _2505 = _176 + (-0.5);
    float _2507 = fma(_2499, _2329, _2329);
    float _2509 = fma(_2491, _2491, _2501);
    float _2511 = fma(_2503, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2513 = _2441 * 6.283185482025146484375;
    float _2515 = cos(_2513);
    float _2517 = fma(_2505, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2507);
    float _2519 = _2433 * _2477;
    float _2521 = fma(_2511, _2499, _2511);
    float _2523 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2525 = _2341 * _2493;
    float _2527 = fma(_2521, _2357, _2517);
    float _2529 = rsqrt(_2509);
    float _2531 = _2525 * _2523;
    float _2533 = _2527 * 0.15915493667125701904296875;
    float _2535 = in.m_87.x;
    float _2537 = in.m_87.y;
    float _2539 = in.m_87.z;
    float _2541 = _2533 * 6.283185482025146484375;
    float _2543 = sin(_2541);
    float _2545 = _2461 * _2515;
    float _2547 = _2433 * _2515;
    float _2549 = _2487 * _2529;
    float _2551 = _2491 * _2529;
    float _2553 = _2483 * _2529;
    float _2555 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2557 = _2549 * _2555;
    float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2561 = _2551 * _2559;
    float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2565 = _2553 * _2563;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2569 = -_2557;
    float _2571 = fma(_2551, _2567, _2569);
    float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2575 = -_2561;
    float _2577 = fma(_2553, _2573, _2575);
    float _2579 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2581 = -_2565;
    float _2583 = fma(_2549, _2579, _2581);
    float _2585 = _2533 * 6.283185482025146484375;
    float _2587 = cos(_2585);
    float _2589 = _2571 * _2571;
    float _2591 = fma(_2543, _2545, _2519);
    float _2593 = fma(_2543, _2519, _2545);
    float _2595 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2537);
    float _2597 = fma(_2577, _2577, _2589);
    float _2599 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2601 = _2461 * _2477;
    float _2603 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2605 = fma(_2583, _2583, _2597);
    float _2607 = _2595 * _2531;
    float _2609 = _2525 * _2599;
    float _2611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2535);
    float _2613 = _2525 * _2603;
    float _2615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2539);
    float _2617 = rsqrt(_2605);
    float _2619 = _2461 * _2587;
    float _2621 = _2515 * _2587;
    float _2623 = _2611 * _2609;
    float _2625 = _2433 * _2587;
    float _2627 = _2619 * _2607;
    float _2629 = -_2601;
    float _2631 = fma(_2543, _2547, _2629);
    float _2633 = -_2547;
    float _2635 = fma(_2543, _2601, _2633);
    float _2637 = _2615 * _2613;
    float _2639 = fma(_2591, _2623, _2627);
    float _2641 = -_2607;
    float _2643 = _2543 * _2641;
    float _2645 = _2625 * _2607;
    float _2647 = _2477 * _2587;
    float _2649 = fma(_2635, _2637, _2639);
    float _2651 = fma(_2621, _2623, _2643);
    float _2653 = fma(_2631, _2623, _2645);
    float _2655 = _2577 * _2617;
    float _2657 = _2571 * _2617;
    float _2659 = _2583 * _2617;
    float _2661 = fma(_2647, _2637, _2651);
    float _2663 = _2553 * _2655;
    float _2665 = _2551 * _2657;
    float _2667 = fma(_2593, _2637, _2653);
    float _2669 = -_2663;
    float _2671 = fma(_2549, _2657, _2669);
    float _2673 = -_2665;
    float _2675 = fma(_2553, _2659, _2673);
    float _2677 = _2671 * _2649;
    float _2679 = _2675 * _2649;
    float _2681 = fma(_2659, _2661, _2677);
    float _2683 = fma(_2655, _2661, _2679);
    float _2685 = fma(_2551, _2667, _2681);
    float _2687 = fma(_2549, _2667, _2683);
    float _2689 = _1919 + _2685;
    float _2691 = _1703 + _2687;
    float _2693 = _2549 * _2659;
    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2697 = _2689 + _2695;
    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2701 = _2691 + _2699;
    float _2703 = -_2693;
    float _2705 = fma(_2551, _2655, _2703);
    float _2707 = _2697 * _2697;
    float _2709 = fma(_2701, _2701, _2707);
    float _2711 = _2705 * _2649;
    float _2713 = sqrt(_2709);
    float _2715 = fma(_2657, _2661, _2711);
    float _2717 = fma(_2553, _2667, _2715);
    float _2719 = _1705 + _2717;
    bool _2721 = _2713 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2723 = _2717;
    float _2725 = _2711;
    float _2727 = _2715;
    if (!_2721)
    {
        _2723 = _2691;
    }
    float _2729 = _2723;
    float _2731 = _2729;
    if (!_2721)
    {
        _2725 = _2689;
    }
    float _2733 = _2725;
    float _2735 = _2733;
    if (!_2721)
    {
        _2727 = _2719;
    }
    float _2737 = _2727;
    bool _2739 = !_2721;
    float _2741 = _2737;
    if (!_2739)
    {
        float _2743 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2747 = _2713 + _2745;
        float _2749 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2751 = rsqrt(_2709);
        float _2753 = _2747 * _2743;
        float _2755 = _2753 * 0.15915493667125701904296875;
        float _2757 = _2755 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2755 * 6.283185482025146484375;
        float _2763 = sin(_2761);
        float _2765 = _2759 + (-1.0);
        float _2767 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2769 = fma(_2763, _2749, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2771 = fma(_2719, _2759, _2767);
        float _2773 = _2751 * _2769;
        float _2775 = fma(_2701, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2777 = fma(_2697, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2741 = _2771;
        _2731 = _2775;
        _2735 = _2777;
    }
    float _2779 = _2741;
    float _2781 = _2731;
    float _2783 = _2735;
    float _2785 = -_1705;
    float _2787 = _2785 + _2779;
    float _2789 = -_1703;
    float _2791 = _2789 + _2781;
    float _2793 = -_1919;
    float _2795 = _2793 + _2783;
    float _2797 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2799 = _2787 * _2787;
    bool _2801 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2803 = isnan(0.5);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2809 = _2805 || _2807;
    float _2811 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2797);
    float _2813 = fma(_2791, _2791, _2799);
    float _2815 = _2365 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2819 = isnan(0.5);
    bool _2821 = _2817 || _2819;
    bool _2823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2825 = _2821 || _2823;
    float _2827 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2811);
    float _2829 = fma(_2795, _2795, _2813);
    float _2831 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2815);
    float _2833 = _2827 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2835 = sqrt(_2829);
    float _2837 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2831);
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2841 = _2839 + _2833;
    bool _2843 = _2835 > 0.0;
    float _2845 = 1.0 / _2833;
    float _2847 = _2839;
    float _2849 = _2783;
    float _2851 = _2779;
    float _2853 = _2795;
    float _2855 = _2781;
    if (!_2843)
    {
        _2847 = _2781;
    }
    float _2857 = _2847;
    bool _2859 = !_2843;
    float _2861 = _2857;
    if (!_2859)
    {
        float _2863 = _230 * _230;
        float _2865 = rsqrt(_2829);
        float _2867 = fma(_228, _228, _2863);
        float _2869 = fma(_232, _232, _2867);
        float _2871 = sqrt(_2869);
        float _2873 = _2791 * _2865;
        float _2875 = _2787 * _2865;
        float _2877 = _2795 * _2865;
        bool _2879 = _2871 > 0.0;
        float _2881 = _2865;
        _2853 = _2877;
        if (!_2879)
        {
            _2881 = _2781;
        }
        float _2883 = _2881;
        bool _2885 = !_2879;
        _2861 = _2883;
        if (!_2885)
        {
            float _2887 = rsqrt(_2869);
            float _2889 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2891 = _230 * _2887;
            float _2893 = _228 * _2887;
            float _2895 = _2875 * _2891;
            float _2897 = _232 * _2887;
            float _2899 = fma(_2873, _2893, _2895);
            float _2901 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2903 = fma(_2877, _2897, _2899);
            float _2905 = _2903 * _2901;
            float _2907 = fma(_228, _2905, _2781);
            float _2909 = fma(_230, _2905, _2779);
            float _2911 = fma(_232, _2905, _2783);
            _2861 = _2907;
            _2849 = _2911;
            _2851 = _2909;
        }
    }
    float _2913 = _2861;
    float _2915 = _2849;
    float _2917 = _2851;
    float _2919 = _2853;
    float _2921 = -_2361;
    float _2923 = fma(_2921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2913);
    float _2925 = -_2369;
    float _2927 = fma(_2925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2915);
    float _2929 = -_2359;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2917);
    float _2933 = _2841 * _2845;
    float _2935 = _2933 * 0.5;
    float _2937 = _2931;
    float _2939 = _2927;
    float _2941 = _2935;
    float _2943 = _2917;
    float _2945 = _2919;
    if (_2825)
    {
        _2855 = 1.0;
    }
    float _2947 = _2855;
    float _2949 = _2947;
    if (_2809)
    {
        _2453 = _2923;
    }
    float _2951 = _2453;
    float _2953 = _2951;
    if (!_2809)
    {
        float _2955 = _2377 * _2377;
        float _2957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2959 = -_1703;
        float _2961 = _2959 + _2913;
        float _2963 = -_1705;
        float _2965 = _2963 + _2917;
        float _2967 = fma(_2387, _2387, _2955);
        float _2969 = -_1919;
        float _2971 = _2969 + _2915;
        float _2973 = fma(_2395, _2395, _2967);
        float _2975 = 1.0 / _2525;
        float _2977 = sqrt(_2973);
        float _2979 = precise::min(_2977, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2981 = _2979 * _2957;
        float _2983 = _2981 * _2975;
        float _2985 = fma(_2961, _2983, _2373);
        float _2987 = fma(_2965, _2983, _2365);
        float _2989 = fma(_2971, _2983, _2383);
        _2937 = _2987;
        _2953 = _2985;
        _2939 = _2989;
    }
    float _2991 = _2937;
    float _2993 = _2953;
    float _2995 = _2939;
    if (!_2825)
    {
        float _2997 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2999 = _2997 * 0.15915493667125701904296875;
        float _3001 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3003 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3005 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3003);
        float _3007 = _2999 * 6.283185482025146484375;
        float _3009 = cos(_3007);
        float _3011 = _3001 * 0.15915493667125701904296875;
        float _3013 = _2999 * 6.283185482025146484375;
        float _3015 = sin(_3013);
        float _3017 = 1.0 / _3009;
        float _3019 = _3011 * 6.283185482025146484375;
        float _3021 = cos(_3019);
        float _3023 = _3015 * _3017;
        float _3025 = _3011 * 6.283185482025146484375;
        float _3027 = sin(_3025);
        float _3029 = _3021 * _3023;
        float _3031 = 1.0 / _3005;
        float _3033 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3035 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3033;
        float _3037 = 1.0 / _3029;
        float _3039 = 1.0 / _3035;
        float _3041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3043 = _3031 * _3041;
        float _3045 = _3027 * _3037;
        float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3049 = fma(_3045, _3043, _3047);
        float _3051 = _3049 * _3039;
        float _3053 = precise::clamp(_3051, 0.0, 1.0);
        _2941 = _3031;
        _2943 = _3039;
        _2949 = _3053;
    }
    float _3055 = _2941;
    float _3057 = _2943;
    float _3059 = _2949;
    float _3061 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3063 = _2991 + _3061;
    float _3065 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3067 = _2993 + _3065;
    float _3069 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3071 = _2995 + _3069;
    float _3073 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3075 = _3063 * _3063;
    float _3077 = fma(_3067, _3067, _3075);
    float _3079 = fma(_3071, _3071, _3077);
    float _3081 = rsqrt(_3079);
    float _3083 = sqrt(_3079);
    float _3085 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3087 = _3067 * _3085;
    float _3089 = _3071 * _3085;
    float _3091 = _3087 * _3087;
    float _3093 = _3089 * _3089;
    float _3095 = _3091 + _3093;
    float _3097 = sqrt(_3095);
    bool _3099 = _3097 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3103 = _3097 + _3101;
    float _3105 = _3081;
    float _3107 = _3103;
    float _3109 = _3055;
    float _3111 = _3063;
    float _3113 = _3085;
    if (_3099)
    {
        float _3115 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3105 = _3115;
    }
    float _3117 = _3105;
    float _3119 = _3117;
    if (_3099)
    {
        float _3121 = _3103 * _3117;
        _3107 = _3121;
    }
    float _3123 = _3107;
    if (_3099)
    {
        float _3125 = rsqrt(_3095);
        _3119 = _3125;
    }
    float _3127 = _3119;
    float _3129 = _3127;
    if (_3099)
    {
        float _3131 = _3123 * 0.15915493667125701904296875;
        _3109 = _3131;
    }
    float _3133 = _3109;
    float _3135 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3137 = _3071;
    float _3139 = _3133;
    if (_3099)
    {
        float _3141 = _3133 * 6.283185482025146484375;
        float _3143 = sin(_3141);
        _3137 = _3143;
    }
    float _3145 = _3137;
    float _3147 = precise::max(0.0, _3135);
    float _3149 = _3057;
    float _3151 = _3147;
    if (_3099)
    {
        float _3153 = _3133 * 6.283185482025146484375;
        float _3155 = cos(_3153);
        _3149 = _3155;
    }
    float _3157 = _3149;
    float _3159 = -_3085;
    float _3161 = -_3147;
    float _3163 = fma(_3063, _3159, _3161);
    if (_3099)
    {
        float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3111 = _3165;
    }
    float _3167 = _3111;
    float _3169 = _3145;
    float _3171 = _3167;
    if (_3099)
    {
        float _3173 = fma(_3145, _3167, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3169 = _3173;
    }
    float _3175 = _3169;
    float _3177 = _3175;
    if (!_3099)
    {
        _3171 = _3163;
    }
    float _3179 = _3171;
    float _3181 = _3179;
    if (_3099)
    {
        float _3183 = _3127 * _3175;
        _3113 = _3183;
    }
    float _3185 = _3113;
    if (!_3099)
    {
        _3129 = _3087;
    }
    float _3187 = _3129;
    float _3189 = _3187;
    float _3191 = _3157;
    if (_3099)
    {
        float _3193 = _3157 + (-1.0);
        _3151 = _3193;
    }
    float _3195 = _3151;
    float _3197 = _3195;
    if (_3099)
    {
        float _3199 = _3087 * _3185;
        _3189 = _3199;
    }
    float _3201 = _3189;
    if (!_3099)
    {
        _3177 = _3091;
    }
    float _3203 = _3177;
    float _3205 = _3203;
    if (_3099)
    {
        float _3207 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3139 = _3207;
    }
    float _3209 = _3139;
    if (!_3099)
    {
        _3197 = _3089;
    }
    float _3211 = _3197;
    float _3213 = _3211;
    if (_3099)
    {
        float _3215 = _3089 * _3185;
        _3213 = _3215;
    }
    float _3217 = _3213;
    if (_3099)
    {
        float _3219 = _3201 * _3201;
        _3205 = _3219;
    }
    float _3221 = _3205;
    if (_3099)
    {
        float _3223 = fma(_3163, _3157, _3209);
        _3181 = _3223;
    }
    float _3225 = _3181;
    if (!_3099)
    {
        _3191 = _3093;
    }
    float _3227 = _3191;
    float _3229 = _3227;
    if (_3099)
    {
        float _3231 = _3217 * _3217;
        _3229 = _3231;
    }
    float _3233 = _3229;
    float _3235 = fma(_3225, _3225, _3221);
    float _3237 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3239 = _3235 + _3233;
    float _3241 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3237);
    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3245 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3243);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3251 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3241);
    float _3253 = rsqrt(_3239);
    float _3255 = -_3247;
    float _3257 = _3255 + 1.0;
    float _3259 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3261 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3249);
    float _3263 = _3251 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3265 = _2991 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3267 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3259);
    float _3269 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3261);
    float _3271 = abs(_3257);
    float _3273 = log2(_3271);
    float _3275 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3277 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3267);
    float _3279 = _3269 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3281 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3265);
    float _3283 = -_3275;
    float _3285 = fma(_3283, _3073, 1.0);
    float _3287 = _3277 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3291 = _3253 * _3201;
    float _3293 = _3253 * _3225;
    float _3295 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3281);
    float _3297 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3289);
    float _3299 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3301 = _3253 * _3217;
    float _3303 = _3295 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3305 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3297);
    float _3307 = -_3299;
    float _3309 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3307);
    float _3311 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3313 = log2(_3285);
    float _3315 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3305);
    float _3317 = -_3301;
    float _3319 = fma(_3317, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3309);
    float _3321 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3323 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3325 = _3293 + 1.0;
    float _3327 = fma(_3319, -0.5, 0.5);
    float _3329 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3321);
    float _3331 = 1.0 / _3315;
    float _3333 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3323);
    float _3335 = fma(_3319, 0.5, 0.5);
    float _3337 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3329);
    float _3339 = fma(_3335, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3341 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3337);
    float _3343 = exp2(_3311);
    float _3345 = _3313 * 0.693147182464599609375;
    float _3347 = fma(_3335, _3339, -0.212114393711090087890625);
    float _3349 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3351 = fma(_3335, _3347, 1.570728778839111328125);
    float _3353 = sqrt(_3327);
    float _3355 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3333);
    float _3357 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3355);
    float _3359 = _3341 * _3331;
    float _3361 = -_3293;
    float _3363 = fma(_3343, _3325, _3361);
    float _3365 = _3357 * _3331;
    float _3367 = fma(_3359, 0.5, 0.5);
    float _3369 = fma(_3363, 0.5, 0.5);
    float _3371 = fma(_3365, -0.5, 0.5);
    float _3373 = _3353 * 0.636619746685028076171875;
    float3 _8981 = float3(_3367, _3371, _3349);
    float _3375 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8981, float3(0.0), isnan(_8981)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8981, float3(0.0), isnan(_8981)), level(0.0)).x;
    float3 _8992 = float3(_3367, _3371, _3349);
    float4 _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8992, float3(0.0), isnan(_8992)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8992, float3(0.0), isnan(_8992)), level(0.0)).xyzw;
    float _3380 = _3378.x;
    float _3382 = _3378.y;
    float _3384 = _3378.z;
    float _3386 = _3378.w;
    float _3388 = -_3351;
    float _3390 = fma(_3373, _3388, 1.0);
    float2 _9014 = float2(_3390, _3369);
    float3 _3394 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9014, float2(0.0), isnan(_9014)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9014, float2(0.0), isnan(_9014)), level(0.0)).xyz;
    float _3396 = _3394.x;
    float _3398 = _3394.y;
    float _3400 = _3394.z;
    float _3402 = in.m_89.x;
    float _3404 = in.m_89.y;
    float _3406 = in.m_89.z;
    bool _3408 = _2537 != 0.0;
    bool _3410 = isnan(_2537);
    bool _3412 = _3408 || _3410;
    bool _3414 = isnan(0.0);
    bool _3416 = _3412 || _3414;
    float _3418 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3420 = in.m_91.x;
    float _3422 = in.m_91.y;
    float _3424 = in.m_91.z;
    float _3426 = in.m_91.w;
    bool _3428 = _2535 == 0.0;
    bool _3430 = !_3416;
    bool _3432 = _3428 && _3430;
    float _3434 = _2619 * _2675;
    float _3436 = exp2(_3418);
    bool _3438 = _2539 == 0.0;
    bool _3440 = _3438 && _3432;
    float _3442 = -_2543;
    float _3444 = fma(_3442, _2655, _3434);
    float _3446 = fma(_2625, _2549, _3444);
    float _3448 = _3402;
    float _3450 = _3406;
    float _3452 = _3315;
    float _3454 = _3341;
    float _3456 = _3357;
    if (_3440)
    {
        _2479 = _3402;
    }
    float _3458 = _2479;
    float _3460 = -_3436;
    float _3462 = _3460 + 1.0;
    float _3464 = _3458;
    if (_3440)
    {
        _2333 = _3406;
    }
    float _3466 = _2333;
    float _3468 = _3466;
    if (_3440)
    {
        _2455 = _3404;
    }
    float _3470 = _2455;
    float _3472 = _3470;
    if (_3440)
    {
        _2945 = _3458;
    }
    float _3474 = _2945;
    float _3476 = _3474;
    if (!_3440)
    {
        _3464 = _3402;
    }
    float _3478 = _3464;
    if (_3440)
    {
        _3448 = _3466;
    }
    float _3480 = _3448;
    float _3482 = _3480;
    if (!_3440)
    {
        _3468 = _3406;
    }
    float _3484 = _3468;
    if (!_3440)
    {
        float _3486 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3478);
        _3476 = _3486;
    }
    float _3488 = _3476;
    if (_3440)
    {
        _3450 = _3470;
    }
    float _3490 = _3450;
    float _3492 = _3424 * _3478;
    float _3494 = _3490;
    if (!_3440)
    {
        _3472 = _3404;
    }
    float _3496 = _3472;
    float _3498 = _3422 * _3484;
    if (!_3440)
    {
        float _3500 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3484);
        _3482 = _3500;
    }
    float _3502 = _3482;
    float _3504 = -_3492;
    float _3506 = fma(_3420, _3484, _3504);
    float _3508 = _2591 * _2671;
    float _3510 = _3420 * _3496;
    if (!_3440)
    {
        float _3512 = fma(_2537, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3496);
        _3494 = _3512;
    }
    float _3514 = _3494;
    float _3516 = -_3498;
    float _3518 = fma(_3424, _3496, _3516);
    float _3520 = _2591 * _2675;
    float _3522 = -_3510;
    float _3524 = fma(_3422, _3478, _3522);
    float _3526 = _2619 * _2705;
    float _3528 = _3506 * _3426;
    float _3530 = _3518 * _3426;
    float _3532 = _3524 * _3426;
    float _3534 = _2619 * _2671;
    float _3536 = _2591 * _2705;
    float _3538 = _2635 * _2675;
    float _3540 = _2635 * _2705;
    float _3542 = _2635 * _2671;
    float _3544 = -_2543;
    float _3546 = fma(_3544, _2657, _3526);
    float _3548 = -_2543;
    float _3550 = fma(_3548, _2659, _3534);
    float _3552 = fma(_2621, _2655, _3520);
    float _3554 = fma(_2621, _2657, _3536);
    float _3556 = fma(_2621, _2659, _3508);
    float _3558 = fma(_2647, _2655, _3538);
    float _3560 = fma(_2647, _2657, _3540);
    float _3562 = fma(_2647, _2659, _3542);
    float _3564 = fma(_2625, _2553, _3546);
    float _3566 = fma(_2625, _2551, _3550);
    float _3568 = fma(_2631, _2551, _3556);
    float _3570 = fma(_2631, _2553, _3554);
    float _3572 = _3564 * _3422;
    float _3574 = fma(_2631, _2549, _3552);
    float _3576 = _3446 * _3422;
    float _3578 = _3566 * _3422;
    float _3580 = fma(_2593, _2549, _3558);
    float _3582 = fma(_2593, _2551, _3562);
    float _3584 = _3446 * _3514;
    float _3586 = fma(_2593, _2553, _3560);
    float _3588 = _3528 * _3446;
    float _3590 = _3528 * _3564;
    float _3592 = _3528 * _3566;
    float _3594 = fma(_3570, _3420, _3572);
    float _3596 = fma(_3574, _3420, _3576);
    float _3598 = fma(_3568, _3420, _3578);
    float _3600 = _3279 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3602 = fma(_3574, _3488, _3584);
    float _3604 = fma(_3586, _3424, _3594);
    float _3606 = _3564 * _3514;
    float _3608 = _3566 * _3514;
    float _3610 = _3315 * 0.5;
    float _3612 = fma(_3287, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3600);
    float _3614 = fma(_3530, _3574, _3588);
    float _3616 = fma(_3570, _3488, _3606);
    float _3618 = fma(_3568, _3488, _3608);
    float _3620 = fma(_3357, -0.5, _3610);
    float _3622 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3612);
    float _3624 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3626 = fma(_3580, _3424, _3596);
    float _3628 = fma(_3532, _3580, _3614);
    float _3630 = fma(_3580, _3502, _3602);
    float _3632 = fma(_3530, _3570, _3590);
    float _3634 = fma(_3586, _3502, _3616);
    float _3636 = fma(_3582, _3502, _3618);
    float _3638 = fma(_3303, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3622);
    float _3640 = fma(_3530, _3568, _3592);
    float _3642 = fma(_3582, _3424, _3598);
    float _3644 = fma(_3532, _3586, _3632);
    float _3646 = _3638 + _3315;
    float _3648 = _3341 + _3315;
    float _3650 = fma(_3532, _3582, _3640);
    out.m_93.x = _3626;
    out.m_93.y = _3604;
    out.m_93.z = _3642;
    float _3652 = _3646 * 0.5;
    float _3654 = _3648 * 0.5;
    out.m_95.x = _3630;
    out.m_95.y = _3634;
    out.m_95.z = _3636;
    bool _3656 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3658 = isnan(_3083);
    bool _3660 = _3656 || _3658;
    bool _3662 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3664 = _3660 || _3662;
    out.m_97.x = _3654;
    out.m_97.y = _3620;
    out.m_97.z = _3652;
    out.m_97.w = _3315;
    out.m_99.x = _3628;
    out.m_99.y = _3644;
    out.m_99.z = _3650;
    out.gl_Position.x = _3341;
    out.gl_Position.y = _3357;
    out.gl_Position.z = _3638;
    out.gl_Position.w = _3315;
    float _3666 = _3650;
    float _3668 = _3644;
    float _3670 = _3628;
    if (!_3664)
    {
        _3666 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3672 = _3666;
    float _3674 = _3672;
    float _3676 = _3672;
    if (!_3664)
    {
        _3668 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3678 = _3668;
    float _3680 = _3678;
    float _3682 = _3678;
    if (!_3664)
    {
        _3670 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3684 = _3670;
    float _3686 = _3059 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3688 = _3684;
    float _3690 = _3684;
    if (!_3664)
    {
        _3452 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3692 = _3452;
    float _3694 = _3692;
    float _3696 = _3692;
    if (!_3664)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3698 = _3454;
    float _3700 = _3698;
    float _3702 = _3698;
    if (!_3664)
    {
        _3456 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3704 = _3456;
    float _3706 = _3624 * _3375;
    float _3708 = -_3624;
    float _3710 = _3708 + 1.0;
    float _3712 = _3386 * _3706;
    float _3714 = _3386 * _3710;
    float _3716 = _3400 * _3706;
    float _3718 = fma(_3396, _3712, _3380);
    float _3720 = fma(_3398, _3712, _3382);
    float _3722 = fma(_3386, _3716, _3384);
    out.m_101.x = _3718;
    out.m_101.y = _3720;
    out.m_101.z = _3722;
    out.m_101.w = _3714;
    bool _3724 = !_3664;
    float _3726 = _3704;
    float _3728 = _3704;
    if (!_3724)
    {
        bool _3730 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3732 = isnan(_3083);
        bool _3734 = _3730 || _3732;
        bool _3736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3738 = _3734 || _3736;
        if (!_3738)
        {
            float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3742 = _3083 + _3740;
            float _3744 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3746 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3744;
            float _3748 = 1.0 / _3746;
            float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3756 = _3754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3758 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3760 = _3758 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3764 = _3762 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3768 = _3766 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3770 = _3742 * _3748;
            float _3772 = precise::clamp(_3770, 0.0, 1.0);
            float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3776 = _3774 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3778 = fma(_3772, _3752, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3780 = fma(_3772, _3776, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3782 = fma(_3772, _3756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3784 = fma(_3772, _3760, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3786 = fma(_3772, _3764, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3788 = fma(_3772, _3768, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3702 = _3780;
            _3682 = _3786;
            _3696 = _3778;
            _3676 = _3784;
            _3728 = _3782;
            _3690 = _3788;
            _3790 = true;
        }
        else
        {
            bool _3792 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3794 = isnan(_3083);
            bool _3796 = _3792 || _3794;
            bool _3798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3800 = _3796 || _3798;
            if (!_3800)
            {
                _3694 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3802 = _3694;
            _3696 = _3802;
            if (!_3800)
            {
                _3700 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3804 = _3700;
            _3702 = _3804;
            if (!_3800)
            {
                _3726 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3806 = _3726;
            _3728 = _3806;
            if (!_3800)
            {
                _3674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3808 = _3674;
            _3676 = _3808;
            if (!_3800)
            {
                _3680 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3810 = _3680;
            _3682 = _3810;
            if (!_3800)
            {
                _3688 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3812 = _3688;
            bool _3814 = !_3800;
            _3690 = _3812;
            if (!_3814)
            {
                bool _3816 = _3083 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3818 = isnan(_3083);
                bool _3820 = _3816 || _3818;
                bool _3822 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3824 = _3820 || _3822;
                if (!_3824)
                {
                    float _3826 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3828 = _3083 + _3826;
                    float _3830 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3832 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3830;
                    float _3834 = 1.0 / _3832;
                    float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3838 = _3836 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3840 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3842 = _3840 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3844 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3846 = _3844 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3848 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3850 = _3848 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3854 = _3852 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3856 = _3828 * _3834;
                    float _3858 = precise::clamp(_3856, 0.0, 1.0);
                    float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3864 = fma(_3858, _3838, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3866 = fma(_3858, _3862, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3868 = fma(_3858, _3842, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3870 = fma(_3858, _3846, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3872 = fma(_3858, _3850, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3874 = fma(_3858, _3854, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3702 = _3866;
                    _3682 = _3872;
                    _3696 = _3864;
                    _3676 = _3870;
                    _3728 = _3868;
                    _3690 = _3874;
                    _3790 = true;
                }
                else
                {
                    _3702 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3682 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3696 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3728 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3690 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3790 = false;
    float _3876 = _3702;
    float _3878 = _3682;
    float _3880 = _3696;
    float _3882 = _3676;
    float _3884 = _3728;
    float _3886 = _3690;
    float _3888 = fma(_3634, -0.5, 0.5);
    float _3890 = precise::clamp(_3888, 0.0, 1.0);
    float _3892 = -_3876;
    float _3894 = _3892 + _3878;
    float _3896 = -_3880;
    float _3898 = _3896 + _3882;
    out.m_103.x = 0.0;
    float _3900 = fma(_3890, _3894, _3876);
    float _3902 = -_3884;
    float _3904 = _3902 + _3886;
    float _3906 = fma(_3890, _3898, _3880);
    float _3908 = _3900 * 0.586610972881317138671875;
    bool _3910 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3912 = fma(_3890, _3904, _3884);
    float _3914 = _3686 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3916 = fma(_3906, 0.298911988735198974609375, _3908);
    bool _3918 = _3059 > 0.0;
    bool _3920 = isnan(_3059);
    bool _3922 = _3918 || _3920;
    bool _3924 = isnan(0.0);
    bool _3926 = _3922 || _3924;
    float _3928 = fma(_3912, 0.114477999508380889892578125, _3916);
    out.m_47.x = _3914;
    float _3930 = -_3928;
    float _3932 = _3906 + _3930;
    float _3934 = -_3928;
    float _3936 = _3900 + _3934;
    float _3938 = -_3928;
    float _3940 = _3912 + _3938;
    float _3942 = fma(_3932, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3928);
    float _3944 = fma(_3936, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3928);
    float _3946 = fma(_3940, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3928);
    bool _3948 = !_3910;
    if (!_3948)
    {
        float _3950 = -_2991;
        float _3952 = _3950 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3954 = -_2993;
        float _3956 = _3954 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3958 = -_2995;
        float _3960 = _3958 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3962 = _3952 * _3952;
        float _3964 = fma(_3956, _3956, _3962);
        float _3966 = fma(_3960, _3960, _3964);
        float _3968 = sqrt(_3966);
        float _3970 = rsqrt(_3966);
        float _3972 = -_3968;
        float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3976 = _3974 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3978 = precise::clamp(_3976, 0.0, 1.0);
        float _3980 = _3956 * _3970;
        float _3982 = _3952 * _3970;
        float _3984 = abs(_3978);
        float _3986 = log2(_3984);
        float _3988 = _3960 * _3970;
        float _3990 = _3980 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3992 = _3634 * _3982;
        float _3994 = -_3982;
        float _3996 = -_3990;
        float _3998 = fma(_3994, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3996);
        float _4000 = fma(_3630, _3980, _3992);
        float _4002 = -_3988;
        float _4004 = fma(_4002, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3998);
        float _4006 = fma(_3636, _3988, _4000);
        float _4008 = precise::clamp(_4006, 0.0, 1.0);
        float _4010 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4012 = _4004 + _4010;
        float _4014 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4016 = _4012 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4018 = precise::clamp(_4016, 0.0, 1.0);
        float _4020 = exp2(_4014);
        float _4022 = _4020 * _4018;
        float _4024 = _4008 * _4022;
        float _4026 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4028 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4030 = _4024 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _4026;
        out.m_103.y = _4028;
        out.m_103.z = _4030;
    }
    out.m_105.x = _3942;
    out.m_105.y = _3944;
    out.m_105.z = _3946;
    if (_3926)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4032 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4032;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

