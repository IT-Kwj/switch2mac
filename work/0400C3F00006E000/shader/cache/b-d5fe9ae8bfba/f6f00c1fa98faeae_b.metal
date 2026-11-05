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
    float4 m_81 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_71 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_93 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_65 [[user(locn13)]];
    float4 m_87 [[user(locn14)]];
    float4 m_83 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad2 [[user(locn2)]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_73 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad2 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2740 = false;
    bool _218 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = as_type<float>(_116);
    float _130 = _120;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_124)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3057 = as_type<float>(_138);
        out.gl_Position.z = _3057;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _142 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_111);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_116);
    bool _154 = _120 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _128;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3112 = as_type<float>(_164);
        out.gl_Position.z = _3112;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    float _172 = 1.0 / _152;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _120 * _172;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_174;
    float _198 = _176;
    float _216;
    if (!_196)
    {
        float _200 = in.m_57.x;
        float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _206 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _208 = _206 * _202;
        float _210 = floor(_208);
        float _212 = -_210;
        float _214 = _208 + _212;
        _216 = _214;
        _218 = true;
    }
    else
    {
        _216 = _176;
    }
    _218 = false;
    float _220 = _216;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = 1.0 / _240;
    bool _244 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_220);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_236;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _264;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = _254 * _258;
    float _276 = -_254;
    float _278 = _276 + 1.0;
    float _280 = _224 * _242;
    float _282 = in.m_59.x;
    float _284 = in.m_59.y;
    float _286 = in.m_59.z;
    float _288 = fma(_262, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _290 = fma(_272, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _292 = fma(_266, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = _288 * _274;
    float _296 = _290 * _274;
    float _298 = _292 * _274;
    float _300 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _302 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _296);
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _306 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _300);
    float _308 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _302);
    float _310 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _304);
    float _312 = _306 * _282;
    float _314 = _308 * _284;
    float _316 = _310 * _286;
    bool _318 = !_268;
    if (!_318)
    {
        float _320 = in.m_57.x;
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _198 = _334;
    }
    float _336 = _198;
    float _338 = in.m_57.x;
    float _340 = in.m_57.y;
    float _342 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _344 = log2(_342);
    float _346 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _348 = in.m_46.x;
    float _350 = in.m_46.y;
    float _352 = in.m_46.z;
    float _354 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _358 = in.m_57.z;
    float _360 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _362 = int(_360);
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _366 = _346 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _368 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _380 = int(_378);
    float _382 = _338 * 2.0;
    float _384 = _340 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _386 = _338 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _388 = _340 * 2.0;
    float _390 = float(_362);
    float _392 = fma(_384, -2.0, _356);
    float _394 = floor(_382);
    float _396 = _344 * _120;
    float _398 = -_364;
    float _400 = fma(_386, 2.0, _398);
    float _402 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _404 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _406 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _408 = _340 + _338;
    float _410 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _402);
    float _412 = floor(_388);
    float _414 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _406);
    float _416 = _408 + (-1.0);
    float _418 = _358 * 2.0;
    float _420 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _404);
    float _422 = _340 + _358;
    float _424 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _426 = exp2(_396);
    bool _428 = _394 > 0.0;
    float _430 = _422 + (-1.0);
    bool _432 = _394 >= 0.0;
    bool _434 = isnan(_394);
    bool _436 = _432 || _434;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _444 = floor(_418);
    bool _446 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _448 = isnan(1.0);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _454 = _450 || _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _458 = 1.0 + _456;
    bool _460 = _412 > 0.0;
    bool _462 = _412 >= 0.0;
    bool _464 = isnan(_412);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = 1.0 / _390;
    float _474 = -_426;
    float _476 = _474 + 1.0;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _480 = float(_380);
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _484 = -_120;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _400);
    float _488 = _376 ? _476 : 0.0;
    float _490 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[78].z, _478);
    float _492 = 1.0 / _458;
    bool _494 = _444 > 0.0;
    float _496 = _480 * _120;
    bool _498 = _444 >= 0.0;
    bool _500 = isnan(_444);
    bool _502 = _498 || _500;
    bool _504 = isnan(0.0);
    bool _506 = _502 || _504;
    float _508 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    int _510 = _440 ? 0 : 1;
    float _512 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _490);
    int _514 = _506 ? 0 : 1;
    float _516 = _472 * _120;
    int _518 = ~_510;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _508);
    float _526 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _392);
    int _528 = _522;
    float _530 = _336;
    if (!_428)
    {
        int _532 = ~_510;
        int _534 = _532 + 1;
        _528 = _534;
    }
    int _536 = _528;
    float _538 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].z, _410);
    int _540 = _470 ? 0 : 1;
    float _542 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    if (_454)
    {
        float _544 = _488 * _492;
        _130 = _544;
    }
    float _546 = _130;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _558 = _556 != 0;
    float _560 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].z, _420);
    int _562 = ~_540;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    float _568 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _570 = _566;
    if (!_460)
    {
        int _572 = ~_540;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = _560 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _580 = !_554;
    int _582 = _580 ? 0 : 1;
    float _584 = in.m_61.x;
    float _586 = in.m_61.y;
    float _588 = in.m_61.z;
    bool _590 = !_550;
    int _592 = _590 ? 0 : 1;
    float _594 = _542 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _596 = !_558;
    int _598 = _596 ? 0 : 1;
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _602 = _568 + _600;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = float(_536);
    int _618 = ~_514;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    bool _624 = !_606;
    int _626 = _624 ? 0 : 1;
    bool _628 = !_610;
    int _630 = _628 ? 0 : 1;
    int _632 = abs(_626);
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _636 = _578 + _634;
    int _638 = abs(_630);
    float _640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _642 = _594 + _640;
    int _644 = _622;
    if (!_494)
    {
        int _646 = ~_514;
        int _648 = _646 + 1;
        _644 = _648;
    }
    int _650 = _644;
    float _652 = _636 * _636;
    float _654 = float(_638);
    float _656 = fma(_602, _602, _652);
    float _658 = _654 * _616;
    float _660 = float(_632);
    float _662 = fma(_642, _642, _656);
    float _664 = float(_650);
    float _666 = _658 * (-2.0);
    bool _668 = !_614;
    int _670 = _668 ? 0 : 1;
    float _672 = sqrt(_662);
    float _674 = _340 + (-0.5);
    float _676 = fma(_666, _586, _586);
    int _678 = abs(_670);
    float _680 = _660 * _664;
    float _682 = fma(_442, _666, _442);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _676);
    float _686 = _358 + _338;
    float _688 = float(_576);
    float _690 = _680 * (-2.0);
    float _692 = rsqrt(_662);
    float _694 = float(_678);
    float _696 = _686 + (-1.0);
    float _698 = fma(_690, _584, _584);
    float _700 = _672 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _702 = _694 * _688;
    float _704 = fma(_424, _690, _424);
    float _706 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _708 = _338 + (-0.5);
    float _710 = precise::min(_366, _700);
    float _712 = _702 * (-2.0);
    float _714 = _358 + (-0.5);
    float _716 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _698);
    float _718 = fma(_682, _546, _684);
    float _720 = fma(_706, _712, _706);
    float _722 = _692 * _710;
    float _724 = fma(_712, _588, _588);
    float _726 = fma(_704, _546, _716);
    float _728 = _718 * 0.15915493667125701904296875;
    float _730 = _636 * _722;
    float _732 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].z, _724);
    float _734 = _602 * _722;
    float _736 = _728 * 6.283185482025146484375;
    float _738 = sin(_736);
    float _740 = -_730;
    float _742 = _636 + _740;
    float _744 = fma(_720, _546, _732);
    float _746 = -_734;
    float _748 = _602 + _746;
    float _750 = _642 * _722;
    float _752 = _742 * _742;
    float _754 = _726 * 0.15915493667125701904296875;
    float _756 = _744 * 0.15915493667125701904296875;
    float _758 = _728 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = fma(_748, _748, _752);
    float _764 = -_750;
    float _766 = _642 + _764;
    float _768 = in.m_63.x;
    float _770 = in.m_63.y;
    float _772 = in.m_63.z;
    float _774 = _756 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_766, _766, _762);
    float _780 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = sqrt(_778);
    float _784 = _754 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _754 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _692 * _782;
    float _794 = _780 * _792;
    float _796 = _346 * _792;
    float _798 = _354 * _792;
    float _800 = _756 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _770);
    float _806 = _786 * _760;
    float _808 = _786 * _738;
    float _810 = _786 * _776;
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _768);
    float _814 = _794 * _804;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _772);
    float _818 = _790 * _738;
    float _820 = _790 * _760;
    float _822 = _790 * _776;
    float _824 = _760 * _776;
    float _826 = _738 * _776;
    float _828 = _796 * _812;
    float _830 = _810 * _814;
    float _832 = _798 * _816;
    float _834 = fma(_802, _806, _818);
    float _836 = -_820;
    float _838 = fma(_802, _808, _836);
    float _840 = -_814;
    float _842 = _802 * _840;
    float _844 = -_808;
    float _846 = fma(_802, _820, _844);
    float _848 = fma(_834, _828, _830);
    float _850 = _822 * _814;
    float _852 = fma(_824, _828, _842);
    float _854 = fma(_802, _818, _806);
    float _856 = fma(_838, _832, _848);
    float _858 = fma(_846, _828, _850);
    float _860 = fma(_826, _832, _852);
    float _862 = _856 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _864 = _856 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _866 = fma(_854, _832, _858);
    float _868 = _856 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _870 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _862);
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _864);
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _870);
    float _876 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _872);
    float _878 = _874 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _880 = _876 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _882 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _868);
    float _884 = -_730;
    float _886 = _578 + _884;
    float _888 = _594 + _878;
    float _890 = _568 + _880;
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _882);
    float _894 = -_734;
    float _896 = _568 + _894;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _900 = _888 + _898;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _904 = _890 + _902;
    float _906 = _886 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _908 = _892 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _910 = _900 * _900;
    float _912 = -_750;
    float _914 = _594 + _912;
    float _916 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[11].x, _906);
    float _918 = _578 + _908;
    float _920 = fma(_904, _904, _910);
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[11].z, _916);
    float _924 = sqrt(_920);
    bool _926 = _924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _908;
    float _930 = _910;
    float _932 = _916;
    float _934 = _730;
    float _936 = _750;
    float _938 = _734;
    if (!_926)
    {
        _928 = _890;
    }
    float _940 = _928;
    float _942 = _940;
    if (!_926)
    {
        _930 = _888;
    }
    float _944 = _930;
    float _946 = _944;
    if (!_926)
    {
        _932 = _918;
    }
    float _948 = _932;
    bool _950 = !_926;
    float _952 = _948;
    if (!_950)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _958 = _924 + _956;
        float _960 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = rsqrt(_920);
        float _964 = _958 * _954;
        float _966 = _964 * 0.15915493667125701904296875;
        float _968 = _966 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 * 6.283185482025146484375;
        float _974 = cos(_972);
        float _976 = fma(_970, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = _962 * _976;
        float _980 = _974 + (-1.0);
        float _982 = fma(_904, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_900, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _986 = _980 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = fma(_918, _974, _986);
        _952 = _988;
        _942 = _982;
        _946 = _984;
    }
    float _990 = _952;
    float _992 = _942;
    float _994 = _946;
    float _996 = -_578;
    float _998 = _996 + _990;
    float _1000 = -_568;
    float _1002 = _1000 + _992;
    float _1004 = _922 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1006 = _886 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1008 = _998 * _998;
    float _1010 = -_594;
    float _1012 = _1010 + _994;
    float _1014 = 1.0 / _1004;
    float _1016 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1006);
    float _1018 = fma(_1002, _1002, _1008);
    bool _1020 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1022 = isnan(0.5);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1028 = _1024 || _1026;
    float _1030 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1016);
    float _1032 = fma(_1012, _1012, _1018);
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1036 = sqrt(_1032);
    bool _1038 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1040 = isnan(0.5);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1046 = _1042 || _1044;
    float _1048 = _1034 + _1004;
    float _1050 = -_730;
    float _1052 = _1050 + _990;
    float _1054 = _1048 * _1014;
    float _1056 = _1054 * 0.5;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1060 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1058);
    float _1062 = -_734;
    float _1064 = _1062 + _992;
    float _1066 = -_750;
    float _1068 = _1066 + _994;
    float _1070 = 1.0 / _1060;
    bool _1072 = _1036 > 0.0;
    float _1074 = _1002;
    float _1076 = _990;
    float _1078 = _1060;
    float _1080 = _1014;
    float _1082 = _1068;
    float _1084 = _1032;
    if (!_1072)
    {
        _934 = _1064;
    }
    float _1086 = _934;
    float _1088 = _1086;
    if (!_1072)
    {
        _936 = _1052;
    }
    float _1090 = _936;
    float _1092 = _1090;
    if (!_1072)
    {
        _938 = _1068;
    }
    float _1094 = _938;
    bool _1096 = !_1072;
    float _1098 = _1094;
    float _1100 = _1094;
    if (!_1096)
    {
        float _1102 = _192 * _192;
        float _1104 = fma(_190, _190, _1102);
        float _1106 = rsqrt(_1032);
        float _1108 = fma(_194, _194, _1104);
        float _1110 = sqrt(_1108);
        float _1112 = _998 * _1106;
        float _1114 = _1002 * _1106;
        float _1116 = _1012 * _1106;
        bool _1118 = _1110 > 0.0;
        float _1120 = _1106;
        float _1122 = _1110;
        _1076 = _1114;
        _1078 = _1112;
        if (!_1118)
        {
            _1120 = _1064;
        }
        float _1124 = _1120;
        _1088 = _1124;
        if (!_1118)
        {
            _1122 = _1052;
        }
        float _1126 = _1122;
        _1092 = _1126;
        if (!_1118)
        {
            _1098 = _1068;
        }
        float _1128 = _1098;
        bool _1130 = !_1118;
        _1100 = _1128;
        if (!_1130)
        {
            float _1132 = rsqrt(_1108);
            float _1134 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1136 = _192 * _1132;
            float _1138 = _190 * _1132;
            float _1140 = _194 * _1132;
            float _1142 = _1112 * _1136;
            float _1144 = fma(_1114, _1138, _1142);
            float _1146 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1148 = fma(_1116, _1140, _1144);
            float _1150 = _1148 * _1146;
            float _1152 = fma(_190, _1150, _1064);
            float _1154 = fma(_192, _1150, _1052);
            float _1156 = fma(_194, _1150, _1068);
            _1088 = _1152;
            _1092 = _1154;
            _1100 = _1156;
            _1074 = _1150;
        }
    }
    float _1158 = _1088;
    float _1160 = _1092;
    float _1162 = _1100;
    float _1164 = _1074;
    float _1166 = _1076;
    float _1168 = _1078;
    float _1170 = _1164;
    float _1172 = _1160;
    float _1174 = _1158;
    float _1176 = _1162;
    float _1178 = _1166;
    float _1180 = _1168;
    if (_1046)
    {
        _1170 = 1.0;
    }
    float _1182 = _1170;
    float _1184 = _1182;
    if (!_1028)
    {
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1188 = _886 + _1186;
        float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1192 = _896 + _1190;
        float _1194 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1196 = _1188 * _1188;
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1200 = _914 + _1198;
        float _1202 = fma(_1192, _1192, _1196);
        float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1206 = fma(_1200, _1200, _1202);
        float _1208 = sqrt(_1206);
        float _1210 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1212 = precise::min(_1208, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1214 = _1212 * _1204;
        float _1216 = -_896;
        float _1218 = _1216 + _1158;
        float _1220 = _1210 * _1214;
        float _1222 = -_886;
        float _1224 = _1222 + _1160;
        float _1226 = -_914;
        float _1228 = _1226 + _1162;
        float _1230 = fma(_1218, _1220, _896);
        float _1232 = fma(_1224, _1220, _886);
        float _1234 = fma(_1228, _1220, _914);
        _1172 = _1232;
        _1174 = _1230;
        _1176 = _1234;
    }
    float _1236 = _1172;
    float _1238 = _1174;
    float _1240 = _1176;
    if (_1046)
    {
        _1080 = 1.0;
    }
    float _1242 = _1080;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1246 = _1070 * _1244;
    float _1248 = _1242;
    if (!_1046)
    {
        float _1250 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1250 * 0.15915493667125701904296875;
        float _1254 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1258 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1256;
        float _1260 = _1252 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1254 * 0.15915493667125701904296875;
        float _1266 = _1252 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = 1.0 / _1262;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = 1.0 / _1258;
        float _1286 = 1.0 / _1282;
        float _1288 = _1280 * _1286;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1292 = fma(_1246, _1288, _1290);
        float _1294 = _1292 * _1284;
        float _1296 = precise::clamp(_1294, 0.0, 1.0);
        _1184 = _1296;
    }
    float _1298 = _1184;
    if (!_1046)
    {
        float _1300 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1302 = _1300 * 0.15915493667125701904296875;
        float _1304 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1306 = _1302 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = _1304 * 0.15915493667125701904296875;
        float _1312 = _1302 * 6.283185482025146484375;
        float _1314 = sin(_1312);
        float _1316 = 1.0 / _1308;
        float _1318 = _1310 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = _1314 * _1316;
        float _1324 = _1310 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = _1320 * _1322;
        float _1330 = 1.0 / _1328;
        float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1334 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1332;
        float _1336 = 1.0 / _1334;
        float _1338 = _1326 * _1330;
        float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1342 = fma(_1246, _1338, _1340);
        float _1344 = _1342 * _1336;
        float _1346 = precise::clamp(_1344, 0.0, 1.0);
        float _1348 = -_1346;
        float _1350 = _1348 + 1.0;
        _1082 = _1338;
        _1248 = _1350;
    }
    float _1352 = _1082;
    float _1354 = _1248;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1358 = _1236 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1362 = _1238 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1366 = _1240 + _1364;
    float _1368 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1370 = _1358 * _1358;
    float _1372 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1368);
    float _1374 = fma(_1362, _1362, _1370);
    float _1376 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1372);
    float _1378 = fma(_1366, _1366, _1374);
    float _1380 = rsqrt(_1378);
    float _1382 = sqrt(_1378);
    float _1384 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1386 = _1362 * _1384;
    float _1388 = _1366 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 + _1392;
    float _1396 = sqrt(_1394);
    bool _1398 = _1396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1396 + _1400;
    float _1404 = _1370;
    float _1406 = _1394;
    float _1408 = _1402;
    float _1410 = _1386;
    float _1412 = _1388;
    float _1414 = _1390;
    if (_1398)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1404 = _1416;
    }
    float _1418 = _1404;
    if (_1398)
    {
        float _1420 = rsqrt(_1394);
        _1406 = _1420;
    }
    float _1422 = _1406;
    float _1424 = _1422;
    if (_1398)
    {
        float _1426 = _1402 * _1418;
        _1408 = _1426;
    }
    float _1428 = _1408;
    if (_1398)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1084 = _1430;
    }
    float _1432 = _1084;
    float _1434 = _1418;
    if (_1398)
    {
        float _1436 = _1432 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        _1434 = _1438;
    }
    float _1440 = _1434;
    float _1442 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1444 = precise::max(0.0, _1442);
    float _1446 = _1352;
    if (_1398)
    {
        float _1448 = _1432 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        _1446 = _1450;
    }
    float _1452 = _1446;
    float _1454 = -_1384;
    float _1456 = -_1444;
    float _1458 = fma(_1358, _1454, _1456);
    if (_1398)
    {
        float _1460 = _1458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1460;
    }
    float _1462 = _1178;
    float _1464 = fma(_896, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1466 = _1440;
    float _1468 = _1462;
    if (_1398)
    {
        float _1470 = fma(_1440, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1180 = _1470;
    }
    float _1472 = _1180;
    float _1474 = _1472;
    if (!_1398)
    {
        _1466 = _1458;
    }
    float _1476 = _1466;
    float _1478 = floor(_1464);
    float _1480 = _1476;
    float _1482 = _1452;
    if (_1398)
    {
        float _1484 = _1452 + (-1.0);
        _1468 = _1484;
    }
    float _1486 = _1468;
    if (_1398)
    {
        float _1488 = _1422 * _1472;
        _1474 = _1488;
    }
    float _1490 = _1474;
    if (_1398)
    {
        float _1492 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1424 = _1492;
    }
    float _1494 = _1424;
    if (_1398)
    {
        float _1496 = _1386 * _1490;
        _1410 = _1496;
    }
    float _1498 = _1410;
    if (_1398)
    {
        float _1500 = _1388 * _1490;
        _1412 = _1500;
    }
    float _1502 = _1412;
    if (_1398)
    {
        float _1504 = fma(_1458, _1452, _1494);
        _1480 = _1504;
    }
    float _1506 = _1480;
    if (_1398)
    {
        float _1508 = _1498 * _1498;
        _1414 = _1508;
    }
    float _1510 = _1414;
    if (!_1398)
    {
        _1482 = _1392;
    }
    float _1512 = _1482;
    float _1514 = _1512;
    if (_1398)
    {
        float _1516 = _1502 * _1502;
        _1514 = _1516;
    }
    float _1518 = _1514;
    float _1520 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1522 = fma(_1506, _1506, _1510);
    float _1524 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1526 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1520);
    float _1528 = _1522 + _1518;
    float _1530 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1532 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1534 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1526);
    float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1538 = fma(_1382, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1536);
    float _1540 = precise::clamp(_1538, 0.0, 1.0);
    float _1542 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1524);
    float _1544 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1532);
    float _1546 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1548 = rsqrt(_1528);
    float _1550 = -_1540;
    float _1552 = _1550 + 1.0;
    float _1554 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1544);
    float _1556 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1542);
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1560 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1562 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1564 = abs(_1552);
    float _1566 = log2(_1564);
    float _1568 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1570 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1558);
    float _1572 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1574 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1576 = -_1478;
    float _1578 = _1464 + _1576;
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1570);
    float _1582 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1584 = _1548 * _1498;
    float _1586 = floor(_1572);
    float _1588 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1580);
    float _1590 = _1548 * _1506;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1594 = _1548 * _1502;
    float _1596 = -_1574;
    float _1598 = fma(_1596, _1530, 1.0);
    float _1600 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1602 = -_1592;
    float _1604 = fma(_1590, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1602);
    float _1606 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1608 = 1.0 / _1588;
    float _1610 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1582);
    float _1612 = -_1594;
    float _1614 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1604);
    float _1616 = _1590 + 1.0;
    float _1618 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1610);
    float _1620 = fma(_1614, -0.5, 0.5);
    float _1622 = fma(_1614, 0.5, 0.5);
    float _1624 = log2(_1598);
    float _1626 = -_1586;
    float _1628 = _1572 + _1626;
    float _1630 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1600);
    float _1632 = fma(_1622, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1634 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1636 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1630);
    float _1638 = fma(_1622, _1632, -0.212114393711090087890625);
    float _1640 = exp2(_1606);
    float _1642 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1644 = _1634 * _1608;
    float _1646 = fma(_1622, _1638, 1.570728778839111328125);
    float _1648 = _1642 * _1608;
    float _1650 = sqrt(_1620);
    float _1652 = _1624 * 0.693147182464599609375;
    float _1654 = fma(_1648, -0.5, 0.5);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1658 = -_1590;
    float _1660 = fma(_1640, _1616, _1658);
    float2 _5430 = float2(_1578, _1628);
    float _1662 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5430, float2(0.0), isnan(_5430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5430, float2(0.0), isnan(_5430)), level(0.0)).x;
    float _1664 = fma(_1660, 0.5, 0.5);
    float _1666 = _1650 * 0.636619746685028076171875;
    float _1668 = fma(_1644, 0.5, 0.5);
    float _1670 = -_1646;
    float _1672 = fma(_1666, _1670, 1.0);
    float3 _5453 = float3(_1668, _1654, _1656);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5453, float3(0.0), isnan(_5453)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5453, float3(0.0), isnan(_5453)), level(0.0)).x;
    float3 _5464 = float3(_1668, _1654, _1656);
    float4 _1677 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5464, float3(0.0), isnan(_5464)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5464, float3(0.0), isnan(_5464)), level(0.0)).xyzw;
    float _1679 = _1677.x;
    float _1681 = _1677.y;
    float _1683 = _1677.z;
    float _1685 = _1677.w;
    float2 _5480 = float2(_1672, _1664);
    float3 _1689 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5480, float2(0.0), isnan(_5480)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5480, float2(0.0), isnan(_5480)), level(0.0)).xyz;
    float _1691 = _1689.x;
    float _1693 = _1689.y;
    float _1695 = _1689.z;
    float _1697 = float(uint(_380));
    float _1699 = trunc(_516);
    int _1701 = int(_1699);
    bool _1703 = _380 == 0;
    out.m_65.x = _896;
    out.m_65.y = _886;
    out.m_65.z = _914;
    int _1705 = abs(_582);
    float _1707 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1709 = abs(_592);
    out.m_67.w = _710;
    float _1711 = 1.0 / _1697;
    out.m_69.x = _796;
    out.m_71.x = _1238;
    out.m_71.y = _1236;
    out.m_71.z = _1240;
    float _1713 = float(uint(_1701));
    float _1715 = abs(_1246);
    float _1717 = log2(_1715);
    int _1719 = as_type<int>(_1711) + (-2);
    float _1721 = exp2(_1707);
    int _1723 = ~_380;
    int _1725 = _1723 + 1;
    float _1727 = as_type<float>(_1719) * _1713;
    bool _1729 = _1246 <= 8000.0;
    bool _1731 = isnan(_1246);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan(8000.0);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1743 = trunc(_1727);
    float _1745 = precise::max(_1743, 0.0);
    uint _1748 = uint(_1745);
    float _1750 = -_1721;
    float _1752 = _1750 + 1.0;
    float _1754 = exp2(_1741);
    float _1756 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1758 = _1725 * int(_1748);
    int _1760 = _1758 + _1701;
    float _1762 = float(uint(_1760));
    float _1764 = as_type<float>(_1719) * _1762;
    float _1766 = trunc(_1764);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1774 = _1772 != 0;
    int _1776 = ~_380;
    int _1778 = _1776 + 1;
    bool _1780 = !_1774;
    float _1782 = _1780 ? 7.345489978790283203125 : 1.0;
    float _1784 = _1782 * _338;
    float _1786 = floor(_1784);
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1790 = _1788 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1792 = int(_1748) + int(_1770);
    float _1794 = float(_1701);
    float _1796 = 1.0 / _1790;
    int _1798 = _1778 * _1792;
    int _1800 = _1798 + _1701;
    bool _1802 = _1794 >= _480;
    bool _1804 = isnan(_1794);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(_480);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    bool _1814 = uint(_1800) >= uint(_380);
    float _1816 = trunc(_1812);
    int _1818 = int(_1816);
    float _1820 = -_1786;
    float _1822 = _1784 + _1820;
    bool _1824 = !_1814;
    int _1826 = _1824 ? 0 : (-1);
    float _1828 = _496 * _172;
    int _1830 = _380 + (-1);
    float _1832 = _1822 * _480;
    int _1834 = ~_1792;
    int _1836 = _1834 + _1826;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1828);
    int _1842 = int(_1840);
    int _1844 = _380 * _1838;
    int _1846 = _1844 + _1701;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1850 = _1848 != 0;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1854 = _1852 != 0;
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1856;
    int _1860 = ~_1818;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = trunc(_1832);
    int _1868 = int(_1866);
    bool _1870 = !_1703;
    int _1872 = _1870 ? _1846 : (-1);
    bool _1874 = !_1850;
    int _1876 = _1874 ? 0 : 1;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1880 = _1878 != 0;
    int _1882 = _1872 * _1864;
    int _1884 = abs(_1876);
    int _1886 = _1818 * _1830;
    int _1888 = _1886 + _1882;
    int _1890 = abs(_598);
    int _1892 = _1888 * _1705;
    int _1894 = _1868 * _1884;
    int _1896 = _1894 + _1701;
    bool _1898 = !_1880;
    int _1900 = _1898 ? 0 : 1;
    int _1902 = _1842 * _1709;
    int _1904 = _1902 + _1892;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1910 = abs(_1900);
    int _1912 = _1896 * _1890;
    int _1914 = _1912 + _1904;
    float _1916 = in.m_73.y;
    int _1918 = _1868 * _1910;
    int _1920 = _1918 + _1914;
    float _1922 = 1.0 / _1908;
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1926 = _1924 != 0;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1932 = _340 > 0.5;
    float _1934 = float(uint(_1920));
    float _1936 = 1.0 / _1930;
    float _1938 = as_type<float>(_1719) * _1934;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1946 = _1588;
    if (_1854)
    {
        float _1948 = in.m_57.x;
        _1944 = _1948;
    }
    float _1950 = _1944;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1954 = trunc(_1938);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    float _1960 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1962;
    float _1966 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1970 = -_1916;
    float _1972 = _1970 + 1.0;
    float _1974 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1964 * _1922;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1984 = _1982 != 0;
    float _1986 = in.m_73.x;
    float _1988 = _1916;
    float _1990 = _1976;
    if (_1926)
    {
        float _1992 = _1932 ? _1972 : _1916;
        _1988 = _1992;
    }
    float _1994 = _1988;
    float _1996 = _1980 * _1796;
    int _1998 = ~_380;
    int _2000 = _1998 + 1;
    out.m_75.x = _1966;
    out.m_75.y = _1974;
    out.m_75.z = _1968;
    out.m_75.w = _1942;
    bool _2002 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2004 = isnan(_336);
    bool _2006 = _2002 || _2004;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2010 = _2006 || _2008;
    float _2012 = float(_2010);
    bool _2014 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2016 = isnan(_336);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2022 = _2018 || _2020;
    float _2024 = float(_2022);
    float _2026 = float(uint(_1896));
    bool _2028 = _1950 > 0.5;
    bool _2030 = _2028 && _1854;
    bool _2032 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2034 = isnan(_336);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2040 = _2036 || _2038;
    float _2042 = float(_2040);
    float _2044 = as_type<float>(_1719) * _2026;
    int _2046 = _2000 * int(_1958);
    int _2048 = _2046 + _1920;
    float _2050 = _1858 * _1936;
    bool _2052 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2054 = isnan(_336);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2060 = _2056 || _2058;
    float _2062 = float(_2060);
    float _2064 = -_2012;
    float _2066 = _2064 + 1.0;
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2070 = _336 + _2068;
    float _2072 = float(uint(_2048));
    float _2074 = -_2024;
    float _2076 = _2074 + 1.0;
    float _2078 = _2062 * _2066;
    float _2080 = -_2062;
    float _2082 = _2080 + 1.0;
    float _2084 = fma(_1976, _2070, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2086 = as_type<float>(_1719) * _2072;
    float _2088 = _2012 * _2076;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2092 = _336 + _2090;
    float _2094 = _2042 * _2082;
    float _2096 = trunc(_2086);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    float _2102 = -_2042;
    float _2104 = _2102 + 1.0;
    float _2106 = fma(_1996, _2092, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2108 = _2084 * _2094;
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2112 = _336 + _2110;
    if (_1854)
    {
        _1990 = _1986;
    }
    float _2114 = _1990;
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2108);
    float _2118 = _2114;
    if (!_1854)
    {
        _530 = _1986;
    }
    float _2120 = _530;
    float _2122 = trunc(_2044);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    float _2128 = fma(_2050, _2112, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _2130 = ~_380;
    int _2132 = _2130 + 1;
    float _2134 = _2120;
    if (_2030)
    {
        float _2136 = -_2114;
        float _2138 = _2136 + 1.0;
        _2118 = _2138;
    }
    float _2140 = _2118;
    float _2142 = fma(_2106, _2078, _2116);
    int _2144 = ~_380;
    int _2146 = _2144 + 1;
    int _2148 = int(_1958) + int(_2100);
    float _2150 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    if (_1854)
    {
        _2134 = _2140;
    }
    float _2152 = _2134;
    float _2154 = fma(_2128, _2088, _2142);
    bool _2156 = _770 != 0.0;
    bool _2158 = isnan(_770);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.0);
    bool _2164 = _2160 || _2162;
    float _2166 = -_526;
    float _2168 = fma(_524, _2150, _2166);
    int _2170 = _2146 * _2148;
    int _2172 = _2170 + _1920;
    float _2174 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2176 = in.m_77.x;
    float _2178 = in.m_77.y;
    float _2180 = in.m_77.z;
    bool _2182 = _768 == 0.0;
    bool _2184 = !_2164;
    bool _2186 = _2182 && _2184;
    int _2188 = _2132 * int(_2126);
    int _2190 = _2188 + _1896;
    float _2192 = fma(_512, _2174, _486);
    float _2194 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2154);
    float _2196 = float(uint(_2190));
    bool _2198 = _772 == 0.0;
    bool _2200 = _2198 && _2186;
    bool _2202 = uint(_2172) >= uint(_380);
    float _2204 = as_type<float>(_1719) * _2196;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2210 = !_2202;
    int _2212 = _2210 ? 0 : (-1);
    float _2214 = trunc(_2204);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    float _2220 = _2168 + 0.5;
    int _2222 = ~_2148;
    int _2224 = _2222 + _2212;
    int _2226 = _2224 + 1;
    float _2228 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2230 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2234 = _2176;
    float _2236 = _2180;
    float _2238 = _2178;
    if (!_2200)
    {
        float _2240 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2176);
        _2234 = _2240;
    }
    float _2242 = _2234;
    int _2244 = _380 * _2226;
    int _2246 = _2244 + _1920;
    float _2248 = _2192 + 0.5;
    float _2250 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2252 = _2194 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_2200)
    {
        float _2254 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2180);
        _2236 = _2254;
    }
    float _2256 = _2236;
    bool _2258 = !_1703;
    int _2260 = _2258 ? _2246 : (-1);
    if (!_2200)
    {
        float _2262 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2178);
        _2238 = _2262;
    }
    float _2264 = _2238;
    int _2266 = ~_380;
    int _2268 = _2266 + 1;
    out.m_79.x = _2248;
    out.m_79.y = _2220;
    int _2270 = int(_2126) + int(_2218);
    float _2272 = _810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = _810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_81.x = _2228;
    out.m_81.y = _2250;
    out.m_81.z = _2230;
    out.m_81.w = _2252;
    int _2276 = _2260 & 3;
    bool _2278 = _2276 != 0;
    float _2280 = -_802;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2284 = _834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2286 = _2260 >> 31;
    float _2288 = _838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2290 = _2268 * _2270;
    int _2292 = _2290 + _1896;
    float _2294 = -_802;
    float _2296 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    int _2298 = _2286 & 3;
    float _2300 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2282);
    float _2302 = _810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2304 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2296);
    int _2306 = _2260 + _2298;
    float _2308 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2284);
    float _2310 = -_802;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2302);
    bool _2314 = uint(_2292) >= uint(_380);
    float _2316 = _2304 * _2264;
    int _2318 = _2306 >> 2;
    float _2320 = _834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2322 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2312);
    float _2324 = _2300 * _2264;
    int _2326 = _2318 << 4;
    int _2328 = _2326 + 368;
    float _2330 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2320);
    float _2332 = _2322 * _2264;
    bool _2334 = !_2314;
    int _2336 = _2334 ? 0 : (-1);
    uint _2338 = uint(int(uint(_2328) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    float _2354 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2330);
    int _2356 = _2260 & 3;
    bool _2358 = _2356 != 0;
    float _2360 = _834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2362 = ~_2270;
    int _2364 = _2362 + _2336;
    int _2366 = _2364 + 1;
    float _2368 = fma(_2354, _2242, _2316);
    bool _2370 = uint(_2356) > 1u;
    float _2372 = _838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2374 = _2328 + 8;
    uint _2376 = uint(int(uint(_2374) >> uint(2)));
    uint _2378 = uint(int(uint(int(_2376)) >> uint(2)));
    int _2380 = int(_2376) & 3;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[int(_2378)][_2380];
    int _2384 = int(_2376) + 1;
    uint _2386 = uint(int(uint(_2384) >> uint(2)));
    int _2388 = _2384 & 3;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[int(_2386)][_2388];
    int _2392 = _2278 ? 0 : 1;
    float _2394 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2360);
    bool _2396 = uint(_2356) >= 2u;
    float _2398 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2372);
    int _2400 = ~_2392;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    float _2406 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2308);
    float _2408 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2394);
    bool _2410 = !_2358;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2398);
    float _2416 = fma(_2406, _2242, _2324);
    int _2418 = _2404;
    if (!_2370)
    {
        int _2420 = ~_2392;
        int _2422 = _2420 + 1;
        _2418 = _2422;
    }
    int _2424 = _2418;
    float _2426 = fma(_2408, _2242, _2332);
    bool _2428 = _2356 != 3;
    float _2430 = fma(_2414, _2256, _2368);
    int _2432 = abs(_2424);
    int _2434 = _380 * _2366;
    int _2436 = _2434 + _1896;
    int _2438 = _2396 ? 0 : 1;
    float _2440 = -_1662;
    float _2442 = _2440 + 1.0;
    int _2444 = abs(_2412);
    float _2446 = _838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2448 = ~_2438;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    float _2454 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    bool _2456 = _2356 != 3;
    float _2458 = _1756 * _1674;
    float _2460 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2446);
    int _2462 = _2452;
    if (_2428)
    {
        int _2464 = ~_2438;
        int _2466 = _2464 + 1;
        _2462 = _2466;
    }
    int _2468 = _2462;
    float _2470 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2454);
    int _2472 = ~_2432;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    float _2478 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2480 = precise::clamp(_2478, 0.0, 1.0);
    float _2482 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2460);
    bool _2484 = !_2456;
    int _2486 = _2484 ? 0 : (-1);
    bool _2488 = !_1703;
    int _2490 = _2488 ? _2436 : (-1);
    float _2492 = _1695 * _2458;
    int _2494 = abs(_2468);
    float _2496 = -_1756;
    float _2498 = _2496 + 1.0;
    int _2500 = ~_2444;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    int _2506 = _2476 * as_type<int>(_2352);
    bool _2508 = !_1984;
    int _2510 = _2508 ? 0 : 1;
    float _2512 = fma(_2470, _2256, _2416);
    int _2514 = abs(_2486);
    int _2516 = _2504 * as_type<int>(_2344);
    int _2518 = _2516 + _2506;
    float _2520 = fma(_2482, _2256, _2426);
    int _2522 = abs(_2510);
    float _2524 = fma(_2480, -2.0, 3.0);
    float _2526 = _2480 * _2480;
    int _2528 = ~_2494;
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    float _2534 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2536 = ~_2514;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    float _2542 = _2526 * _2524;
    int _2544 = _2532 * as_type<int>(_2382);
    int _2546 = _2544 + _2518;
    float _2548 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2534);
    out.m_83.x = _2430;
    out.m_83.y = _2512;
    out.m_83.z = _2520;
    int _2550 = _2540 * as_type<int>(_2390);
    int _2552 = _2550 + _2546;
    float _2554 = -_2542;
    float _2556 = _2554 + 1.0;
    int _2558 = ~_2522;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2548);
    float _2566 = in.m_85.x;
    float _2568 = fma(_2556, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2542);
    bool _2570 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2572 = isnan(_1382);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2578 = _2574 || _2576;
    int _2580 = _2552 * _2562;
    float _2582 = _1588 * 0.5;
    float _2584 = _1739 * _2568;
    int _2586 = _2490 * _2522;
    int _2588 = _2586 + _2580;
    float _2590 = fma(_1642, -0.5, _2582);
    float _2592 = _2584 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2594 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2564);
    float _2596 = _1634 + _1588;
    float _2598 = _2442 * _2592;
    float _2600 = precise::clamp(_2598, 0.0, 1.0);
    float _2602 = float(_2588);
    float _2604 = _2594 + _1588;
    float _2606 = _2596 * 0.5;
    float _2608 = -_2600;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2612 = _1685 * _2458;
    float _2614 = _2604 * 0.5;
    out.m_87.x = _2602;
    float _2616 = fma(_1691, _2612, _1679);
    float _2618 = fma(_1693, _2612, _1681);
    float _2620 = _1685 * _2498;
    float _2622 = fma(_1685, _2492, _1683);
    out.m_89.x = _2606;
    out.m_89.y = _2590;
    out.m_89.z = _2614;
    out.m_89.w = _1588;
    float _2624 = _2610 * _2566;
    float _2626 = _2612;
    float _2628 = _2624;
    float _2630 = _2594;
    if (!_2578)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2632 = _2626;
    out.m_91.x = _2616;
    out.m_91.y = _2618;
    out.m_91.z = _2622;
    out.m_91.w = _2620;
    out.gl_Position.x = _1634;
    out.gl_Position.y = _1642;
    out.gl_Position.z = _2594;
    out.gl_Position.w = _1588;
    float _2634 = _2624 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2636 = _1298 * _1354;
    float _2638 = _2636;
    float _2640 = _2634;
    float _2642 = _2632;
    float _2644 = _2632;
    if (!_2578)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2646 = _2628;
    float _2648 = _2646;
    float _2650 = _2646;
    if (!_2578)
    {
        _1946 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2652 = _1946;
    out.m_93.x = _2634;
    float _2654 = _2636 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2656 = _2652;
    float _2658 = _2652;
    if (!_2578)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2660 = _2630;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2578)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2666 = _2638;
    float _2668 = _2666;
    float _2670 = _2666;
    if (!_2578)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2672 = _2640;
    bool _2674 = !_2578;
    float _2676 = _2672;
    float _2678 = _2672;
    if (!_2674)
    {
        bool _2680 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2682 = isnan(_1382);
        bool _2684 = _2680 || _2682;
        bool _2686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2688 = _2684 || _2686;
        if (!_2688)
        {
            float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2692 = _1382 + _2690;
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2696 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2694;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2702 = 1.0 / _2696;
            float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2720 = _2692 * _2702;
            float _2722 = precise::clamp(_2720, 0.0, 1.0);
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2728 = fma(_2722, _2700, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2730 = fma(_2722, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2732 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2734 = fma(_2722, _2710, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2736 = fma(_2722, _2714, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2738 = fma(_2722, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2650 = _2732;
            _2678 = _2736;
            _2644 = _2728;
            _2664 = _2734;
            _2658 = _2730;
            _2670 = _2738;
            _2740 = true;
        }
        else
        {
            bool _2742 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2744 = isnan(_1382);
            bool _2746 = _2742 || _2744;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2750 = _2746 || _2748;
            if (!_2750)
            {
                _2642 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2752 = _2642;
            _2644 = _2752;
            if (!_2750)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2754 = _2648;
            _2650 = _2754;
            if (!_2750)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2756 = _2656;
            _2658 = _2756;
            if (!_2750)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2758 = _2662;
            _2664 = _2758;
            if (!_2750)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2760 = _2676;
            _2678 = _2760;
            if (!_2750)
            {
                _2668 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2762 = _2668;
            bool _2764 = !_2750;
            _2670 = _2762;
            if (!_2764)
            {
                bool _2766 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2768 = isnan(_1382);
                bool _2770 = _2766 || _2768;
                bool _2772 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2774 = _2770 || _2772;
                if (!_2774)
                {
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2778 = _1382 + _2776;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2780;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2788 = 1.0 / _2782;
                    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2806 = _2778 * _2788;
                    float _2808 = precise::clamp(_2806, 0.0, 1.0);
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2814 = fma(_2808, _2786, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2816 = fma(_2808, _2812, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2818 = fma(_2808, _2792, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2820 = fma(_2808, _2796, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2822 = fma(_2808, _2800, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2824 = fma(_2808, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2650 = _2818;
                    _2678 = _2822;
                    _2644 = _2814;
                    _2664 = _2820;
                    _2658 = _2816;
                    _2670 = _2824;
                    _2740 = true;
                }
                else
                {
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2644 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2670 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2740 = false;
    float _2826 = _2650;
    float _2828 = _2678;
    float _2830 = _2644;
    float _2832 = _2664;
    float _2834 = _2658;
    float _2836 = _2670;
    float _2838 = _2654 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2840 = fma(_2512, -0.5, 0.5);
    float _2842 = precise::clamp(_2840, 0.0, 1.0);
    float _2844 = -_2826;
    float _2846 = _2844 + _2828;
    float _2848 = -_2830;
    float _2850 = _2848 + _2832;
    out.m_53.x = _2838;
    float _2852 = fma(_2842, _2846, _2826);
    float _2854 = -_2834;
    float _2856 = _2854 + _2836;
    float _2858 = fma(_2842, _2850, _2830);
    float _2860 = _2852 * 0.586610972881317138671875;
    bool _2862 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2864 = fma(_2842, _2856, _2834);
    out.m_95.x = 0.0;
    float _2866 = fma(_2858, 0.298911988735198974609375, _2860);
    bool _2868 = _1298 > 0.0;
    bool _2870 = isnan(_1298);
    bool _2872 = _2868 || _2870;
    bool _2874 = isnan(0.0);
    bool _2876 = _2872 || _2874;
    float _2878 = fma(_2864, 0.114477999508380889892578125, _2866);
    bool _2880 = _1354 <= 0.0;
    bool _2882 = !_2876;
    bool _2884 = _2880 || _2882;
    float _2886 = -_2878;
    float _2888 = _2858 + _2886;
    float _2890 = -_2878;
    float _2892 = _2852 + _2890;
    float _2894 = -_2878;
    float _2896 = _2864 + _2894;
    float _2898 = fma(_2888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2900 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2902 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    bool _2904 = !_2862;
    if (!_2904)
    {
        float _2906 = -_1236;
        float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2910 = -_1238;
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2914 = -_1240;
        float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2918 = _2908 * _2908;
        float _2920 = fma(_2912, _2912, _2918);
        float _2922 = fma(_2916, _2916, _2920);
        float _2924 = sqrt(_2922);
        float _2926 = rsqrt(_2922);
        float _2928 = -_2924;
        float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2932 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2934 = precise::clamp(_2932, 0.0, 1.0);
        float _2936 = _2912 * _2926;
        float _2938 = _2908 * _2926;
        float _2940 = abs(_2934);
        float _2942 = log2(_2940);
        float _2944 = _2916 * _2926;
        float _2946 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2948 = _2512 * _2938;
        float _2950 = -_2938;
        float _2952 = -_2946;
        float _2954 = fma(_2950, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2952);
        float _2956 = fma(_2430, _2936, _2948);
        float _2958 = -_2944;
        float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2954);
        float _2962 = fma(_2520, _2944, _2956);
        float _2964 = precise::clamp(_2962, 0.0, 1.0);
        float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2968 = _2960 + _2966;
        float _2970 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2974 = precise::clamp(_2972, 0.0, 1.0);
        float _2976 = exp2(_2970);
        float _2978 = _2976 * _2974;
        float _2980 = _2964 * _2978;
        float _2982 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2984 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2986 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2982;
        out.m_95.y = _2984;
        out.m_95.z = _2986;
    }
    out.m_67.x = _2898;
    out.m_67.y = _2900;
    out.m_67.z = _2902;
    if (!_2884)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2988 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2988;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad2 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2740 = false;
    bool _218 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = as_type<float>(_116);
    float _130 = _120;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_124)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3057 = as_type<float>(_138);
        out.gl_Position.z = _3057;
    }
    if (!_124)
    {
        return out;
    }
    bool _142 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_111);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_116);
    bool _154 = _120 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _128;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3112 = as_type<float>(_164);
        out.gl_Position.z = _3112;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    float _172 = 1.0 / _152;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _120 * _172;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_174;
    float _198 = _176;
    float _216;
    if (!_196)
    {
        float _200 = in.m_57.x;
        float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _206 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _208 = _206 * _202;
        float _210 = floor(_208);
        float _212 = -_210;
        float _214 = _208 + _212;
        _216 = _214;
        _218 = true;
    }
    else
    {
        _216 = _176;
    }
    _218 = false;
    float _220 = _216;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = 1.0 / _240;
    bool _244 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_220);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_236;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _264;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = _254 * _258;
    float _276 = -_254;
    float _278 = _276 + 1.0;
    float _280 = _224 * _242;
    float _282 = in.m_59.x;
    float _284 = in.m_59.y;
    float _286 = in.m_59.z;
    float _288 = fma(_262, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _290 = fma(_272, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _292 = fma(_266, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = _288 * _274;
    float _296 = _290 * _274;
    float _298 = _292 * _274;
    float _300 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _302 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _296);
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _306 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _300);
    float _308 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _302);
    float _310 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _304);
    float _312 = _306 * _282;
    float _314 = _308 * _284;
    float _316 = _310 * _286;
    bool _318 = !_268;
    if (!_318)
    {
        float _320 = in.m_57.x;
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _198 = _334;
    }
    float _336 = _198;
    float _338 = in.m_57.x;
    float _340 = in.m_57.y;
    float _342 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _344 = log2(_342);
    float _346 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _348 = in.m_46.x;
    float _350 = in.m_46.y;
    float _352 = in.m_46.z;
    float _354 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _358 = in.m_57.z;
    float _360 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _362 = int(_360);
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _366 = _346 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _368 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _380 = int(_378);
    float _382 = _338 * 2.0;
    float _384 = _340 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _386 = _338 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _388 = _340 * 2.0;
    float _390 = float(_362);
    float _392 = fma(_384, -2.0, _356);
    float _394 = floor(_382);
    float _396 = _344 * _120;
    float _398 = -_364;
    float _400 = fma(_386, 2.0, _398);
    float _402 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _404 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _406 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _408 = _340 + _338;
    float _410 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _402);
    float _412 = floor(_388);
    float _414 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _406);
    float _416 = _408 + (-1.0);
    float _418 = _358 * 2.0;
    float _420 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _404);
    float _422 = _340 + _358;
    float _424 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _426 = exp2(_396);
    bool _428 = _394 > 0.0;
    float _430 = _422 + (-1.0);
    bool _432 = _394 >= 0.0;
    bool _434 = isnan(_394);
    bool _436 = _432 || _434;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _444 = floor(_418);
    bool _446 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _448 = isnan(1.0);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _454 = _450 || _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _458 = 1.0 + _456;
    bool _460 = _412 > 0.0;
    bool _462 = _412 >= 0.0;
    bool _464 = isnan(_412);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = 1.0 / _390;
    float _474 = -_426;
    float _476 = _474 + 1.0;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _480 = float(_380);
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _484 = -_120;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _400);
    float _488 = _376 ? _476 : 0.0;
    float _490 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[78].z, _478);
    float _492 = 1.0 / _458;
    bool _494 = _444 > 0.0;
    float _496 = _480 * _120;
    bool _498 = _444 >= 0.0;
    bool _500 = isnan(_444);
    bool _502 = _498 || _500;
    bool _504 = isnan(0.0);
    bool _506 = _502 || _504;
    float _508 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    int _510 = _440 ? 0 : 1;
    float _512 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _490);
    int _514 = _506 ? 0 : 1;
    float _516 = _472 * _120;
    int _518 = ~_510;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _508);
    float _526 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _392);
    int _528 = _522;
    float _530 = _336;
    if (!_428)
    {
        int _532 = ~_510;
        int _534 = _532 + 1;
        _528 = _534;
    }
    int _536 = _528;
    float _538 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].z, _410);
    int _540 = _470 ? 0 : 1;
    float _542 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    if (_454)
    {
        float _544 = _488 * _492;
        _130 = _544;
    }
    float _546 = _130;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _558 = _556 != 0;
    float _560 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].z, _420);
    int _562 = ~_540;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    float _568 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _570 = _566;
    if (!_460)
    {
        int _572 = ~_540;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = _560 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _580 = !_554;
    int _582 = _580 ? 0 : 1;
    float _584 = in.m_61.x;
    float _586 = in.m_61.y;
    float _588 = in.m_61.z;
    bool _590 = !_550;
    int _592 = _590 ? 0 : 1;
    float _594 = _542 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _596 = !_558;
    int _598 = _596 ? 0 : 1;
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _602 = _568 + _600;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = float(_536);
    int _618 = ~_514;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    bool _624 = !_606;
    int _626 = _624 ? 0 : 1;
    bool _628 = !_610;
    int _630 = _628 ? 0 : 1;
    int _632 = abs(_626);
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _636 = _578 + _634;
    int _638 = abs(_630);
    float _640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _642 = _594 + _640;
    int _644 = _622;
    if (!_494)
    {
        int _646 = ~_514;
        int _648 = _646 + 1;
        _644 = _648;
    }
    int _650 = _644;
    float _652 = _636 * _636;
    float _654 = float(_638);
    float _656 = fma(_602, _602, _652);
    float _658 = _654 * _616;
    float _660 = float(_632);
    float _662 = fma(_642, _642, _656);
    float _664 = float(_650);
    float _666 = _658 * (-2.0);
    bool _668 = !_614;
    int _670 = _668 ? 0 : 1;
    float _672 = sqrt(_662);
    float _674 = _340 + (-0.5);
    float _676 = fma(_666, _586, _586);
    int _678 = abs(_670);
    float _680 = _660 * _664;
    float _682 = fma(_442, _666, _442);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _676);
    float _686 = _358 + _338;
    float _688 = float(_576);
    float _690 = _680 * (-2.0);
    float _692 = rsqrt(_662);
    float _694 = float(_678);
    float _696 = _686 + (-1.0);
    float _698 = fma(_690, _584, _584);
    float _700 = _672 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _702 = _694 * _688;
    float _704 = fma(_424, _690, _424);
    float _706 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _708 = _338 + (-0.5);
    float _710 = precise::min(_366, _700);
    float _712 = _702 * (-2.0);
    float _714 = _358 + (-0.5);
    float _716 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _698);
    float _718 = fma(_682, _546, _684);
    float _720 = fma(_706, _712, _706);
    float _722 = _692 * _710;
    float _724 = fma(_712, _588, _588);
    float _726 = fma(_704, _546, _716);
    float _728 = _718 * 0.15915493667125701904296875;
    float _730 = _636 * _722;
    float _732 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].z, _724);
    float _734 = _602 * _722;
    float _736 = _728 * 6.283185482025146484375;
    float _738 = sin(_736);
    float _740 = -_730;
    float _742 = _636 + _740;
    float _744 = fma(_720, _546, _732);
    float _746 = -_734;
    float _748 = _602 + _746;
    float _750 = _642 * _722;
    float _752 = _742 * _742;
    float _754 = _726 * 0.15915493667125701904296875;
    float _756 = _744 * 0.15915493667125701904296875;
    float _758 = _728 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = fma(_748, _748, _752);
    float _764 = -_750;
    float _766 = _642 + _764;
    float _768 = in.m_63.x;
    float _770 = in.m_63.y;
    float _772 = in.m_63.z;
    float _774 = _756 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_766, _766, _762);
    float _780 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = sqrt(_778);
    float _784 = _754 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _754 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _692 * _782;
    float _794 = _780 * _792;
    float _796 = _346 * _792;
    float _798 = _354 * _792;
    float _800 = _756 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _770);
    float _806 = _786 * _760;
    float _808 = _786 * _738;
    float _810 = _786 * _776;
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _768);
    float _814 = _794 * _804;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _772);
    float _818 = _790 * _738;
    float _820 = _790 * _760;
    float _822 = _790 * _776;
    float _824 = _760 * _776;
    float _826 = _738 * _776;
    float _828 = _796 * _812;
    float _830 = _810 * _814;
    float _832 = _798 * _816;
    float _834 = fma(_802, _806, _818);
    float _836 = -_820;
    float _838 = fma(_802, _808, _836);
    float _840 = -_814;
    float _842 = _802 * _840;
    float _844 = -_808;
    float _846 = fma(_802, _820, _844);
    float _848 = fma(_834, _828, _830);
    float _850 = _822 * _814;
    float _852 = fma(_824, _828, _842);
    float _854 = fma(_802, _818, _806);
    float _856 = fma(_838, _832, _848);
    float _858 = fma(_846, _828, _850);
    float _860 = fma(_826, _832, _852);
    float _862 = _856 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _864 = _856 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _866 = fma(_854, _832, _858);
    float _868 = _856 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _870 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _862);
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _864);
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _870);
    float _876 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _872);
    float _878 = _874 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _880 = _876 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _882 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _868);
    float _884 = -_730;
    float _886 = _578 + _884;
    float _888 = _594 + _878;
    float _890 = _568 + _880;
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _882);
    float _894 = -_734;
    float _896 = _568 + _894;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _900 = _888 + _898;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _904 = _890 + _902;
    float _906 = _886 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _908 = _892 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _910 = _900 * _900;
    float _912 = -_750;
    float _914 = _594 + _912;
    float _916 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[11].x, _906);
    float _918 = _578 + _908;
    float _920 = fma(_904, _904, _910);
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[11].z, _916);
    float _924 = sqrt(_920);
    bool _926 = _924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _908;
    float _930 = _910;
    float _932 = _916;
    float _934 = _730;
    float _936 = _750;
    float _938 = _734;
    if (!_926)
    {
        _928 = _890;
    }
    float _940 = _928;
    float _942 = _940;
    if (!_926)
    {
        _930 = _888;
    }
    float _944 = _930;
    float _946 = _944;
    if (!_926)
    {
        _932 = _918;
    }
    float _948 = _932;
    bool _950 = !_926;
    float _952 = _948;
    if (!_950)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _958 = _924 + _956;
        float _960 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = rsqrt(_920);
        float _964 = _958 * _954;
        float _966 = _964 * 0.15915493667125701904296875;
        float _968 = _966 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 * 6.283185482025146484375;
        float _974 = cos(_972);
        float _976 = fma(_970, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = _962 * _976;
        float _980 = _974 + (-1.0);
        float _982 = fma(_904, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_900, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _986 = _980 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = fma(_918, _974, _986);
        _952 = _988;
        _942 = _982;
        _946 = _984;
    }
    float _990 = _952;
    float _992 = _942;
    float _994 = _946;
    float _996 = -_578;
    float _998 = _996 + _990;
    float _1000 = -_568;
    float _1002 = _1000 + _992;
    float _1004 = _922 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1006 = _886 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1008 = _998 * _998;
    float _1010 = -_594;
    float _1012 = _1010 + _994;
    float _1014 = 1.0 / _1004;
    float _1016 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1006);
    float _1018 = fma(_1002, _1002, _1008);
    bool _1020 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1022 = isnan(0.5);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1028 = _1024 || _1026;
    float _1030 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1016);
    float _1032 = fma(_1012, _1012, _1018);
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1036 = sqrt(_1032);
    bool _1038 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1040 = isnan(0.5);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1046 = _1042 || _1044;
    float _1048 = _1034 + _1004;
    float _1050 = -_730;
    float _1052 = _1050 + _990;
    float _1054 = _1048 * _1014;
    float _1056 = _1054 * 0.5;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1060 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1058);
    float _1062 = -_734;
    float _1064 = _1062 + _992;
    float _1066 = -_750;
    float _1068 = _1066 + _994;
    float _1070 = 1.0 / _1060;
    bool _1072 = _1036 > 0.0;
    float _1074 = _1002;
    float _1076 = _990;
    float _1078 = _1060;
    float _1080 = _1014;
    float _1082 = _1068;
    float _1084 = _1032;
    if (!_1072)
    {
        _934 = _1064;
    }
    float _1086 = _934;
    float _1088 = _1086;
    if (!_1072)
    {
        _936 = _1052;
    }
    float _1090 = _936;
    float _1092 = _1090;
    if (!_1072)
    {
        _938 = _1068;
    }
    float _1094 = _938;
    bool _1096 = !_1072;
    float _1098 = _1094;
    float _1100 = _1094;
    if (!_1096)
    {
        float _1102 = _192 * _192;
        float _1104 = fma(_190, _190, _1102);
        float _1106 = rsqrt(_1032);
        float _1108 = fma(_194, _194, _1104);
        float _1110 = sqrt(_1108);
        float _1112 = _998 * _1106;
        float _1114 = _1002 * _1106;
        float _1116 = _1012 * _1106;
        bool _1118 = _1110 > 0.0;
        float _1120 = _1106;
        float _1122 = _1110;
        _1076 = _1114;
        _1078 = _1112;
        if (!_1118)
        {
            _1120 = _1064;
        }
        float _1124 = _1120;
        _1088 = _1124;
        if (!_1118)
        {
            _1122 = _1052;
        }
        float _1126 = _1122;
        _1092 = _1126;
        if (!_1118)
        {
            _1098 = _1068;
        }
        float _1128 = _1098;
        bool _1130 = !_1118;
        _1100 = _1128;
        if (!_1130)
        {
            float _1132 = rsqrt(_1108);
            float _1134 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1136 = _192 * _1132;
            float _1138 = _190 * _1132;
            float _1140 = _194 * _1132;
            float _1142 = _1112 * _1136;
            float _1144 = fma(_1114, _1138, _1142);
            float _1146 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1148 = fma(_1116, _1140, _1144);
            float _1150 = _1148 * _1146;
            float _1152 = fma(_190, _1150, _1064);
            float _1154 = fma(_192, _1150, _1052);
            float _1156 = fma(_194, _1150, _1068);
            _1088 = _1152;
            _1092 = _1154;
            _1100 = _1156;
            _1074 = _1150;
        }
    }
    float _1158 = _1088;
    float _1160 = _1092;
    float _1162 = _1100;
    float _1164 = _1074;
    float _1166 = _1076;
    float _1168 = _1078;
    float _1170 = _1164;
    float _1172 = _1160;
    float _1174 = _1158;
    float _1176 = _1162;
    float _1178 = _1166;
    float _1180 = _1168;
    if (_1046)
    {
        _1170 = 1.0;
    }
    float _1182 = _1170;
    float _1184 = _1182;
    if (!_1028)
    {
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1188 = _886 + _1186;
        float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1192 = _896 + _1190;
        float _1194 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1196 = _1188 * _1188;
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1200 = _914 + _1198;
        float _1202 = fma(_1192, _1192, _1196);
        float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1206 = fma(_1200, _1200, _1202);
        float _1208 = sqrt(_1206);
        float _1210 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1212 = precise::min(_1208, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1214 = _1212 * _1204;
        float _1216 = -_896;
        float _1218 = _1216 + _1158;
        float _1220 = _1210 * _1214;
        float _1222 = -_886;
        float _1224 = _1222 + _1160;
        float _1226 = -_914;
        float _1228 = _1226 + _1162;
        float _1230 = fma(_1218, _1220, _896);
        float _1232 = fma(_1224, _1220, _886);
        float _1234 = fma(_1228, _1220, _914);
        _1172 = _1232;
        _1174 = _1230;
        _1176 = _1234;
    }
    float _1236 = _1172;
    float _1238 = _1174;
    float _1240 = _1176;
    if (_1046)
    {
        _1080 = 1.0;
    }
    float _1242 = _1080;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1246 = _1070 * _1244;
    float _1248 = _1242;
    if (!_1046)
    {
        float _1250 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1250 * 0.15915493667125701904296875;
        float _1254 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1258 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1256;
        float _1260 = _1252 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1254 * 0.15915493667125701904296875;
        float _1266 = _1252 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = 1.0 / _1262;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = 1.0 / _1258;
        float _1286 = 1.0 / _1282;
        float _1288 = _1280 * _1286;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1292 = fma(_1246, _1288, _1290);
        float _1294 = _1292 * _1284;
        float _1296 = precise::clamp(_1294, 0.0, 1.0);
        _1184 = _1296;
    }
    float _1298 = _1184;
    if (!_1046)
    {
        float _1300 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1302 = _1300 * 0.15915493667125701904296875;
        float _1304 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1306 = _1302 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = _1304 * 0.15915493667125701904296875;
        float _1312 = _1302 * 6.283185482025146484375;
        float _1314 = sin(_1312);
        float _1316 = 1.0 / _1308;
        float _1318 = _1310 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = _1314 * _1316;
        float _1324 = _1310 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = _1320 * _1322;
        float _1330 = 1.0 / _1328;
        float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1334 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1332;
        float _1336 = 1.0 / _1334;
        float _1338 = _1326 * _1330;
        float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1342 = fma(_1246, _1338, _1340);
        float _1344 = _1342 * _1336;
        float _1346 = precise::clamp(_1344, 0.0, 1.0);
        float _1348 = -_1346;
        float _1350 = _1348 + 1.0;
        _1082 = _1338;
        _1248 = _1350;
    }
    float _1352 = _1082;
    float _1354 = _1248;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1358 = _1236 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1362 = _1238 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1366 = _1240 + _1364;
    float _1368 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1370 = _1358 * _1358;
    float _1372 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1368);
    float _1374 = fma(_1362, _1362, _1370);
    float _1376 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1372);
    float _1378 = fma(_1366, _1366, _1374);
    float _1380 = rsqrt(_1378);
    float _1382 = sqrt(_1378);
    float _1384 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1386 = _1362 * _1384;
    float _1388 = _1366 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 + _1392;
    float _1396 = sqrt(_1394);
    bool _1398 = _1396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1396 + _1400;
    float _1404 = _1370;
    float _1406 = _1394;
    float _1408 = _1402;
    float _1410 = _1386;
    float _1412 = _1388;
    float _1414 = _1390;
    if (_1398)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1404 = _1416;
    }
    float _1418 = _1404;
    if (_1398)
    {
        float _1420 = rsqrt(_1394);
        _1406 = _1420;
    }
    float _1422 = _1406;
    float _1424 = _1422;
    if (_1398)
    {
        float _1426 = _1402 * _1418;
        _1408 = _1426;
    }
    float _1428 = _1408;
    if (_1398)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1084 = _1430;
    }
    float _1432 = _1084;
    float _1434 = _1418;
    if (_1398)
    {
        float _1436 = _1432 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        _1434 = _1438;
    }
    float _1440 = _1434;
    float _1442 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1444 = precise::max(0.0, _1442);
    float _1446 = _1352;
    if (_1398)
    {
        float _1448 = _1432 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        _1446 = _1450;
    }
    float _1452 = _1446;
    float _1454 = -_1384;
    float _1456 = -_1444;
    float _1458 = fma(_1358, _1454, _1456);
    if (_1398)
    {
        float _1460 = _1458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1460;
    }
    float _1462 = _1178;
    float _1464 = fma(_896, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1466 = _1440;
    float _1468 = _1462;
    if (_1398)
    {
        float _1470 = fma(_1440, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1180 = _1470;
    }
    float _1472 = _1180;
    float _1474 = _1472;
    if (!_1398)
    {
        _1466 = _1458;
    }
    float _1476 = _1466;
    float _1478 = floor(_1464);
    float _1480 = _1476;
    float _1482 = _1452;
    if (_1398)
    {
        float _1484 = _1452 + (-1.0);
        _1468 = _1484;
    }
    float _1486 = _1468;
    if (_1398)
    {
        float _1488 = _1422 * _1472;
        _1474 = _1488;
    }
    float _1490 = _1474;
    if (_1398)
    {
        float _1492 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1424 = _1492;
    }
    float _1494 = _1424;
    if (_1398)
    {
        float _1496 = _1386 * _1490;
        _1410 = _1496;
    }
    float _1498 = _1410;
    if (_1398)
    {
        float _1500 = _1388 * _1490;
        _1412 = _1500;
    }
    float _1502 = _1412;
    if (_1398)
    {
        float _1504 = fma(_1458, _1452, _1494);
        _1480 = _1504;
    }
    float _1506 = _1480;
    if (_1398)
    {
        float _1508 = _1498 * _1498;
        _1414 = _1508;
    }
    float _1510 = _1414;
    if (!_1398)
    {
        _1482 = _1392;
    }
    float _1512 = _1482;
    float _1514 = _1512;
    if (_1398)
    {
        float _1516 = _1502 * _1502;
        _1514 = _1516;
    }
    float _1518 = _1514;
    float _1520 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1522 = fma(_1506, _1506, _1510);
    float _1524 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1526 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1520);
    float _1528 = _1522 + _1518;
    float _1530 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1532 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1534 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1526);
    float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1538 = fma(_1382, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1536);
    float _1540 = precise::clamp(_1538, 0.0, 1.0);
    float _1542 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1524);
    float _1544 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1532);
    float _1546 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1548 = rsqrt(_1528);
    float _1550 = -_1540;
    float _1552 = _1550 + 1.0;
    float _1554 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1544);
    float _1556 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1542);
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1560 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1562 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1564 = abs(_1552);
    float _1566 = log2(_1564);
    float _1568 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1570 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1558);
    float _1572 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1574 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1576 = -_1478;
    float _1578 = _1464 + _1576;
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1570);
    float _1582 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1584 = _1548 * _1498;
    float _1586 = floor(_1572);
    float _1588 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1580);
    float _1590 = _1548 * _1506;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1594 = _1548 * _1502;
    float _1596 = -_1574;
    float _1598 = fma(_1596, _1530, 1.0);
    float _1600 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1602 = -_1592;
    float _1604 = fma(_1590, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1602);
    float _1606 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1608 = 1.0 / _1588;
    float _1610 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1582);
    float _1612 = -_1594;
    float _1614 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1604);
    float _1616 = _1590 + 1.0;
    float _1618 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1610);
    float _1620 = fma(_1614, -0.5, 0.5);
    float _1622 = fma(_1614, 0.5, 0.5);
    float _1624 = log2(_1598);
    float _1626 = -_1586;
    float _1628 = _1572 + _1626;
    float _1630 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1600);
    float _1632 = fma(_1622, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1634 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1636 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1630);
    float _1638 = fma(_1622, _1632, -0.212114393711090087890625);
    float _1640 = exp2(_1606);
    float _1642 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1644 = _1634 * _1608;
    float _1646 = fma(_1622, _1638, 1.570728778839111328125);
    float _1648 = _1642 * _1608;
    float _1650 = sqrt(_1620);
    float _1652 = _1624 * 0.693147182464599609375;
    float _1654 = fma(_1648, -0.5, 0.5);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1658 = -_1590;
    float _1660 = fma(_1640, _1616, _1658);
    float2 _5430 = float2(_1578, _1628);
    float _1662 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5430, float2(0.0), isnan(_5430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5430, float2(0.0), isnan(_5430)), level(0.0)).x;
    float _1664 = fma(_1660, 0.5, 0.5);
    float _1666 = _1650 * 0.636619746685028076171875;
    float _1668 = fma(_1644, 0.5, 0.5);
    float _1670 = -_1646;
    float _1672 = fma(_1666, _1670, 1.0);
    float3 _5453 = float3(_1668, _1654, _1656);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5453, float3(0.0), isnan(_5453)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5453, float3(0.0), isnan(_5453)), level(0.0)).x;
    float3 _5464 = float3(_1668, _1654, _1656);
    float4 _1677 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5464, float3(0.0), isnan(_5464)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5464, float3(0.0), isnan(_5464)), level(0.0)).xyzw;
    float _1679 = _1677.x;
    float _1681 = _1677.y;
    float _1683 = _1677.z;
    float _1685 = _1677.w;
    float2 _5480 = float2(_1672, _1664);
    float3 _1689 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5480, float2(0.0), isnan(_5480)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5480, float2(0.0), isnan(_5480)), level(0.0)).xyz;
    float _1691 = _1689.x;
    float _1693 = _1689.y;
    float _1695 = _1689.z;
    float _1697 = float(uint(_380));
    float _1699 = trunc(_516);
    int _1701 = int(_1699);
    bool _1703 = _380 == 0;
    out.m_65.x = _896;
    out.m_65.y = _886;
    out.m_65.z = _914;
    int _1705 = abs(_582);
    float _1707 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1709 = abs(_592);
    out.m_67.w = _710;
    float _1711 = 1.0 / _1697;
    out.m_69.x = _796;
    out.m_71.x = _1238;
    out.m_71.y = _1236;
    out.m_71.z = _1240;
    float _1713 = float(uint(_1701));
    float _1715 = abs(_1246);
    float _1717 = log2(_1715);
    int _1719 = as_type<int>(_1711) + (-2);
    float _1721 = exp2(_1707);
    int _1723 = ~_380;
    int _1725 = _1723 + 1;
    float _1727 = as_type<float>(_1719) * _1713;
    bool _1729 = _1246 <= 8000.0;
    bool _1731 = isnan(_1246);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan(8000.0);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1743 = trunc(_1727);
    float _1745 = precise::max(_1743, 0.0);
    uint _1748 = uint(_1745);
    float _1750 = -_1721;
    float _1752 = _1750 + 1.0;
    float _1754 = exp2(_1741);
    float _1756 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1758 = _1725 * int(_1748);
    int _1760 = _1758 + _1701;
    float _1762 = float(uint(_1760));
    float _1764 = as_type<float>(_1719) * _1762;
    float _1766 = trunc(_1764);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1774 = _1772 != 0;
    int _1776 = ~_380;
    int _1778 = _1776 + 1;
    bool _1780 = !_1774;
    float _1782 = _1780 ? 7.345489978790283203125 : 1.0;
    float _1784 = _1782 * _338;
    float _1786 = floor(_1784);
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1790 = _1788 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1792 = int(_1748) + int(_1770);
    float _1794 = float(_1701);
    float _1796 = 1.0 / _1790;
    int _1798 = _1778 * _1792;
    int _1800 = _1798 + _1701;
    bool _1802 = _1794 >= _480;
    bool _1804 = isnan(_1794);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(_480);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    bool _1814 = uint(_1800) >= uint(_380);
    float _1816 = trunc(_1812);
    int _1818 = int(_1816);
    float _1820 = -_1786;
    float _1822 = _1784 + _1820;
    bool _1824 = !_1814;
    int _1826 = _1824 ? 0 : (-1);
    float _1828 = _496 * _172;
    int _1830 = _380 + (-1);
    float _1832 = _1822 * _480;
    int _1834 = ~_1792;
    int _1836 = _1834 + _1826;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1828);
    int _1842 = int(_1840);
    int _1844 = _380 * _1838;
    int _1846 = _1844 + _1701;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1850 = _1848 != 0;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1854 = _1852 != 0;
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1856;
    int _1860 = ~_1818;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = trunc(_1832);
    int _1868 = int(_1866);
    bool _1870 = !_1703;
    int _1872 = _1870 ? _1846 : (-1);
    bool _1874 = !_1850;
    int _1876 = _1874 ? 0 : 1;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1880 = _1878 != 0;
    int _1882 = _1872 * _1864;
    int _1884 = abs(_1876);
    int _1886 = _1818 * _1830;
    int _1888 = _1886 + _1882;
    int _1890 = abs(_598);
    int _1892 = _1888 * _1705;
    int _1894 = _1868 * _1884;
    int _1896 = _1894 + _1701;
    bool _1898 = !_1880;
    int _1900 = _1898 ? 0 : 1;
    int _1902 = _1842 * _1709;
    int _1904 = _1902 + _1892;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1910 = abs(_1900);
    int _1912 = _1896 * _1890;
    int _1914 = _1912 + _1904;
    float _1916 = in.m_73.y;
    int _1918 = _1868 * _1910;
    int _1920 = _1918 + _1914;
    float _1922 = 1.0 / _1908;
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1926 = _1924 != 0;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1932 = _340 > 0.5;
    float _1934 = float(uint(_1920));
    float _1936 = 1.0 / _1930;
    float _1938 = as_type<float>(_1719) * _1934;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1946 = _1588;
    if (_1854)
    {
        float _1948 = in.m_57.x;
        _1944 = _1948;
    }
    float _1950 = _1944;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1954 = trunc(_1938);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    float _1960 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1962;
    float _1966 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1970 = -_1916;
    float _1972 = _1970 + 1.0;
    float _1974 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1964 * _1922;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1984 = _1982 != 0;
    float _1986 = in.m_73.x;
    float _1988 = _1916;
    float _1990 = _1976;
    if (_1926)
    {
        float _1992 = _1932 ? _1972 : _1916;
        _1988 = _1992;
    }
    float _1994 = _1988;
    float _1996 = _1980 * _1796;
    int _1998 = ~_380;
    int _2000 = _1998 + 1;
    out.m_75.x = _1966;
    out.m_75.y = _1974;
    out.m_75.z = _1968;
    out.m_75.w = _1942;
    bool _2002 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2004 = isnan(_336);
    bool _2006 = _2002 || _2004;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2010 = _2006 || _2008;
    float _2012 = float(_2010);
    bool _2014 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2016 = isnan(_336);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2022 = _2018 || _2020;
    float _2024 = float(_2022);
    float _2026 = float(uint(_1896));
    bool _2028 = _1950 > 0.5;
    bool _2030 = _2028 && _1854;
    bool _2032 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2034 = isnan(_336);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2040 = _2036 || _2038;
    float _2042 = float(_2040);
    float _2044 = as_type<float>(_1719) * _2026;
    int _2046 = _2000 * int(_1958);
    int _2048 = _2046 + _1920;
    float _2050 = _1858 * _1936;
    bool _2052 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2054 = isnan(_336);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2060 = _2056 || _2058;
    float _2062 = float(_2060);
    float _2064 = -_2012;
    float _2066 = _2064 + 1.0;
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2070 = _336 + _2068;
    float _2072 = float(uint(_2048));
    float _2074 = -_2024;
    float _2076 = _2074 + 1.0;
    float _2078 = _2062 * _2066;
    float _2080 = -_2062;
    float _2082 = _2080 + 1.0;
    float _2084 = fma(_1976, _2070, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2086 = as_type<float>(_1719) * _2072;
    float _2088 = _2012 * _2076;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2092 = _336 + _2090;
    float _2094 = _2042 * _2082;
    float _2096 = trunc(_2086);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    float _2102 = -_2042;
    float _2104 = _2102 + 1.0;
    float _2106 = fma(_1996, _2092, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2108 = _2084 * _2094;
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2112 = _336 + _2110;
    if (_1854)
    {
        _1990 = _1986;
    }
    float _2114 = _1990;
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2108);
    float _2118 = _2114;
    if (!_1854)
    {
        _530 = _1986;
    }
    float _2120 = _530;
    float _2122 = trunc(_2044);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    float _2128 = fma(_2050, _2112, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _2130 = ~_380;
    int _2132 = _2130 + 1;
    float _2134 = _2120;
    if (_2030)
    {
        float _2136 = -_2114;
        float _2138 = _2136 + 1.0;
        _2118 = _2138;
    }
    float _2140 = _2118;
    float _2142 = fma(_2106, _2078, _2116);
    int _2144 = ~_380;
    int _2146 = _2144 + 1;
    int _2148 = int(_1958) + int(_2100);
    float _2150 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    if (_1854)
    {
        _2134 = _2140;
    }
    float _2152 = _2134;
    float _2154 = fma(_2128, _2088, _2142);
    bool _2156 = _770 != 0.0;
    bool _2158 = isnan(_770);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.0);
    bool _2164 = _2160 || _2162;
    float _2166 = -_526;
    float _2168 = fma(_524, _2150, _2166);
    int _2170 = _2146 * _2148;
    int _2172 = _2170 + _1920;
    float _2174 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2176 = in.m_77.x;
    float _2178 = in.m_77.y;
    float _2180 = in.m_77.z;
    bool _2182 = _768 == 0.0;
    bool _2184 = !_2164;
    bool _2186 = _2182 && _2184;
    int _2188 = _2132 * int(_2126);
    int _2190 = _2188 + _1896;
    float _2192 = fma(_512, _2174, _486);
    float _2194 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2154);
    float _2196 = float(uint(_2190));
    bool _2198 = _772 == 0.0;
    bool _2200 = _2198 && _2186;
    bool _2202 = uint(_2172) >= uint(_380);
    float _2204 = as_type<float>(_1719) * _2196;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2210 = !_2202;
    int _2212 = _2210 ? 0 : (-1);
    float _2214 = trunc(_2204);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    float _2220 = _2168 + 0.5;
    int _2222 = ~_2148;
    int _2224 = _2222 + _2212;
    int _2226 = _2224 + 1;
    float _2228 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2230 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2234 = _2176;
    float _2236 = _2180;
    float _2238 = _2178;
    if (!_2200)
    {
        float _2240 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2176);
        _2234 = _2240;
    }
    float _2242 = _2234;
    int _2244 = _380 * _2226;
    int _2246 = _2244 + _1920;
    float _2248 = _2192 + 0.5;
    float _2250 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2252 = _2194 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_2200)
    {
        float _2254 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2180);
        _2236 = _2254;
    }
    float _2256 = _2236;
    bool _2258 = !_1703;
    int _2260 = _2258 ? _2246 : (-1);
    if (!_2200)
    {
        float _2262 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2178);
        _2238 = _2262;
    }
    float _2264 = _2238;
    int _2266 = ~_380;
    int _2268 = _2266 + 1;
    out.m_79.x = _2248;
    out.m_79.y = _2220;
    int _2270 = int(_2126) + int(_2218);
    float _2272 = _810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = _810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_81.x = _2228;
    out.m_81.y = _2250;
    out.m_81.z = _2230;
    out.m_81.w = _2252;
    int _2276 = _2260 & 3;
    bool _2278 = _2276 != 0;
    float _2280 = -_802;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2284 = _834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2286 = _2260 >> 31;
    float _2288 = _838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2290 = _2268 * _2270;
    int _2292 = _2290 + _1896;
    float _2294 = -_802;
    float _2296 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    int _2298 = _2286 & 3;
    float _2300 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2282);
    float _2302 = _810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2304 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2296);
    int _2306 = _2260 + _2298;
    float _2308 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2284);
    float _2310 = -_802;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2302);
    bool _2314 = uint(_2292) >= uint(_380);
    float _2316 = _2304 * _2264;
    int _2318 = _2306 >> 2;
    float _2320 = _834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2322 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2312);
    float _2324 = _2300 * _2264;
    int _2326 = _2318 << 4;
    int _2328 = _2326 + 368;
    float _2330 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2320);
    float _2332 = _2322 * _2264;
    bool _2334 = !_2314;
    int _2336 = _2334 ? 0 : (-1);
    uint _2338 = uint(int(uint(_2328) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    float _2354 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2330);
    int _2356 = _2260 & 3;
    bool _2358 = _2356 != 0;
    float _2360 = _834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2362 = ~_2270;
    int _2364 = _2362 + _2336;
    int _2366 = _2364 + 1;
    float _2368 = fma(_2354, _2242, _2316);
    bool _2370 = uint(_2356) > 1u;
    float _2372 = _838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2374 = _2328 + 8;
    uint _2376 = uint(int(uint(_2374) >> uint(2)));
    uint _2378 = uint(int(uint(int(_2376)) >> uint(2)));
    int _2380 = int(_2376) & 3;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[int(_2378)][_2380];
    int _2384 = int(_2376) + 1;
    uint _2386 = uint(int(uint(_2384) >> uint(2)));
    int _2388 = _2384 & 3;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[int(_2386)][_2388];
    int _2392 = _2278 ? 0 : 1;
    float _2394 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2360);
    bool _2396 = uint(_2356) >= 2u;
    float _2398 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2372);
    int _2400 = ~_2392;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    float _2406 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2308);
    float _2408 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2394);
    bool _2410 = !_2358;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2398);
    float _2416 = fma(_2406, _2242, _2324);
    int _2418 = _2404;
    if (!_2370)
    {
        int _2420 = ~_2392;
        int _2422 = _2420 + 1;
        _2418 = _2422;
    }
    int _2424 = _2418;
    float _2426 = fma(_2408, _2242, _2332);
    bool _2428 = _2356 != 3;
    float _2430 = fma(_2414, _2256, _2368);
    int _2432 = abs(_2424);
    int _2434 = _380 * _2366;
    int _2436 = _2434 + _1896;
    int _2438 = _2396 ? 0 : 1;
    float _2440 = -_1662;
    float _2442 = _2440 + 1.0;
    int _2444 = abs(_2412);
    float _2446 = _838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2448 = ~_2438;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    float _2454 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    bool _2456 = _2356 != 3;
    float _2458 = _1756 * _1674;
    float _2460 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2446);
    int _2462 = _2452;
    if (_2428)
    {
        int _2464 = ~_2438;
        int _2466 = _2464 + 1;
        _2462 = _2466;
    }
    int _2468 = _2462;
    float _2470 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2454);
    int _2472 = ~_2432;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    float _2478 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2480 = precise::clamp(_2478, 0.0, 1.0);
    float _2482 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2460);
    bool _2484 = !_2456;
    int _2486 = _2484 ? 0 : (-1);
    bool _2488 = !_1703;
    int _2490 = _2488 ? _2436 : (-1);
    float _2492 = _1695 * _2458;
    int _2494 = abs(_2468);
    float _2496 = -_1756;
    float _2498 = _2496 + 1.0;
    int _2500 = ~_2444;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    int _2506 = _2476 * as_type<int>(_2352);
    bool _2508 = !_1984;
    int _2510 = _2508 ? 0 : 1;
    float _2512 = fma(_2470, _2256, _2416);
    int _2514 = abs(_2486);
    int _2516 = _2504 * as_type<int>(_2344);
    int _2518 = _2516 + _2506;
    float _2520 = fma(_2482, _2256, _2426);
    int _2522 = abs(_2510);
    float _2524 = fma(_2480, -2.0, 3.0);
    float _2526 = _2480 * _2480;
    int _2528 = ~_2494;
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    float _2534 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2536 = ~_2514;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    float _2542 = _2526 * _2524;
    int _2544 = _2532 * as_type<int>(_2382);
    int _2546 = _2544 + _2518;
    float _2548 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2534);
    out.m_83.x = _2430;
    out.m_83.y = _2512;
    out.m_83.z = _2520;
    int _2550 = _2540 * as_type<int>(_2390);
    int _2552 = _2550 + _2546;
    float _2554 = -_2542;
    float _2556 = _2554 + 1.0;
    int _2558 = ~_2522;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2548);
    float _2566 = in.m_85.x;
    float _2568 = fma(_2556, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2542);
    bool _2570 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2572 = isnan(_1382);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2578 = _2574 || _2576;
    int _2580 = _2552 * _2562;
    float _2582 = _1588 * 0.5;
    float _2584 = _1739 * _2568;
    int _2586 = _2490 * _2522;
    int _2588 = _2586 + _2580;
    float _2590 = fma(_1642, -0.5, _2582);
    float _2592 = _2584 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2594 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2564);
    float _2596 = _1634 + _1588;
    float _2598 = _2442 * _2592;
    float _2600 = precise::clamp(_2598, 0.0, 1.0);
    float _2602 = float(_2588);
    float _2604 = _2594 + _1588;
    float _2606 = _2596 * 0.5;
    float _2608 = -_2600;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2612 = _1685 * _2458;
    float _2614 = _2604 * 0.5;
    out.m_87.x = _2602;
    float _2616 = fma(_1691, _2612, _1679);
    float _2618 = fma(_1693, _2612, _1681);
    float _2620 = _1685 * _2498;
    float _2622 = fma(_1685, _2492, _1683);
    out.m_89.x = _2606;
    out.m_89.y = _2590;
    out.m_89.z = _2614;
    out.m_89.w = _1588;
    float _2624 = _2610 * _2566;
    float _2626 = _2612;
    float _2628 = _2624;
    float _2630 = _2594;
    if (!_2578)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2632 = _2626;
    out.m_91.x = _2616;
    out.m_91.y = _2618;
    out.m_91.z = _2622;
    out.m_91.w = _2620;
    out.gl_Position.x = _1634;
    out.gl_Position.y = _1642;
    out.gl_Position.z = _2594;
    out.gl_Position.w = _1588;
    float _2634 = _2624 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2636 = _1298 * _1354;
    float _2638 = _2636;
    float _2640 = _2634;
    float _2642 = _2632;
    float _2644 = _2632;
    if (!_2578)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2646 = _2628;
    float _2648 = _2646;
    float _2650 = _2646;
    if (!_2578)
    {
        _1946 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2652 = _1946;
    out.m_93.x = _2634;
    float _2654 = _2636 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2656 = _2652;
    float _2658 = _2652;
    if (!_2578)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2660 = _2630;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2578)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2666 = _2638;
    float _2668 = _2666;
    float _2670 = _2666;
    if (!_2578)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2672 = _2640;
    bool _2674 = !_2578;
    float _2676 = _2672;
    float _2678 = _2672;
    if (!_2674)
    {
        bool _2680 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2682 = isnan(_1382);
        bool _2684 = _2680 || _2682;
        bool _2686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2688 = _2684 || _2686;
        if (!_2688)
        {
            float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2692 = _1382 + _2690;
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2696 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2694;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2702 = 1.0 / _2696;
            float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2720 = _2692 * _2702;
            float _2722 = precise::clamp(_2720, 0.0, 1.0);
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2728 = fma(_2722, _2700, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2730 = fma(_2722, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2732 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2734 = fma(_2722, _2710, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2736 = fma(_2722, _2714, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2738 = fma(_2722, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2650 = _2732;
            _2678 = _2736;
            _2644 = _2728;
            _2664 = _2734;
            _2658 = _2730;
            _2670 = _2738;
            _2740 = true;
        }
        else
        {
            bool _2742 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2744 = isnan(_1382);
            bool _2746 = _2742 || _2744;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2750 = _2746 || _2748;
            if (!_2750)
            {
                _2642 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2752 = _2642;
            _2644 = _2752;
            if (!_2750)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2754 = _2648;
            _2650 = _2754;
            if (!_2750)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2756 = _2656;
            _2658 = _2756;
            if (!_2750)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2758 = _2662;
            _2664 = _2758;
            if (!_2750)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2760 = _2676;
            _2678 = _2760;
            if (!_2750)
            {
                _2668 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2762 = _2668;
            bool _2764 = !_2750;
            _2670 = _2762;
            if (!_2764)
            {
                bool _2766 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2768 = isnan(_1382);
                bool _2770 = _2766 || _2768;
                bool _2772 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2774 = _2770 || _2772;
                if (!_2774)
                {
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2778 = _1382 + _2776;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2780;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2788 = 1.0 / _2782;
                    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2806 = _2778 * _2788;
                    float _2808 = precise::clamp(_2806, 0.0, 1.0);
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2814 = fma(_2808, _2786, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2816 = fma(_2808, _2812, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2818 = fma(_2808, _2792, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2820 = fma(_2808, _2796, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2822 = fma(_2808, _2800, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2824 = fma(_2808, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2650 = _2818;
                    _2678 = _2822;
                    _2644 = _2814;
                    _2664 = _2820;
                    _2658 = _2816;
                    _2670 = _2824;
                    _2740 = true;
                }
                else
                {
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2644 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2670 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2740 = false;
    float _2826 = _2650;
    float _2828 = _2678;
    float _2830 = _2644;
    float _2832 = _2664;
    float _2834 = _2658;
    float _2836 = _2670;
    float _2838 = _2654 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2840 = fma(_2512, -0.5, 0.5);
    float _2842 = precise::clamp(_2840, 0.0, 1.0);
    float _2844 = -_2826;
    float _2846 = _2844 + _2828;
    float _2848 = -_2830;
    float _2850 = _2848 + _2832;
    out.m_53.x = _2838;
    float _2852 = fma(_2842, _2846, _2826);
    float _2854 = -_2834;
    float _2856 = _2854 + _2836;
    float _2858 = fma(_2842, _2850, _2830);
    float _2860 = _2852 * 0.586610972881317138671875;
    bool _2862 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2864 = fma(_2842, _2856, _2834);
    out.m_95.x = 0.0;
    float _2866 = fma(_2858, 0.298911988735198974609375, _2860);
    bool _2868 = _1298 > 0.0;
    bool _2870 = isnan(_1298);
    bool _2872 = _2868 || _2870;
    bool _2874 = isnan(0.0);
    bool _2876 = _2872 || _2874;
    float _2878 = fma(_2864, 0.114477999508380889892578125, _2866);
    bool _2880 = _1354 <= 0.0;
    bool _2882 = !_2876;
    bool _2884 = _2880 || _2882;
    float _2886 = -_2878;
    float _2888 = _2858 + _2886;
    float _2890 = -_2878;
    float _2892 = _2852 + _2890;
    float _2894 = -_2878;
    float _2896 = _2864 + _2894;
    float _2898 = fma(_2888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2900 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2902 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    bool _2904 = !_2862;
    if (!_2904)
    {
        float _2906 = -_1236;
        float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2910 = -_1238;
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2914 = -_1240;
        float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2918 = _2908 * _2908;
        float _2920 = fma(_2912, _2912, _2918);
        float _2922 = fma(_2916, _2916, _2920);
        float _2924 = sqrt(_2922);
        float _2926 = rsqrt(_2922);
        float _2928 = -_2924;
        float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2932 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2934 = precise::clamp(_2932, 0.0, 1.0);
        float _2936 = _2912 * _2926;
        float _2938 = _2908 * _2926;
        float _2940 = abs(_2934);
        float _2942 = log2(_2940);
        float _2944 = _2916 * _2926;
        float _2946 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2948 = _2512 * _2938;
        float _2950 = -_2938;
        float _2952 = -_2946;
        float _2954 = fma(_2950, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2952);
        float _2956 = fma(_2430, _2936, _2948);
        float _2958 = -_2944;
        float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2954);
        float _2962 = fma(_2520, _2944, _2956);
        float _2964 = precise::clamp(_2962, 0.0, 1.0);
        float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2968 = _2960 + _2966;
        float _2970 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2974 = precise::clamp(_2972, 0.0, 1.0);
        float _2976 = exp2(_2970);
        float _2978 = _2976 * _2974;
        float _2980 = _2964 * _2978;
        float _2982 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2984 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2986 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2982;
        out.m_95.y = _2984;
        out.m_95.z = _2986;
    }
    out.m_67.x = _2898;
    out.m_67.y = _2900;
    out.m_67.z = _2902;
    if (!_2884)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2988 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2988;
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
    out.dm_pad2 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2740 = false;
    bool _218 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = as_type<float>(_116);
    float _130 = _120;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_124)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3057 = as_type<float>(_138);
        out.gl_Position.z = _3057;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.dm_pad2.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.dm_pad2.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.dm_pad2.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.dm_pad2.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _142 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_111);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_116);
    bool _154 = _120 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _128;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3112 = as_type<float>(_164);
        out.gl_Position.z = _3112;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.dm_pad2.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.dm_pad2.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.dm_pad2.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.dm_pad2.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    float _172 = 1.0 / _152;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _120 * _172;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_174;
    float _198 = _176;
    float _216;
    if (!_196)
    {
        float _200 = in.m_57.x;
        float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _206 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _208 = _206 * _202;
        float _210 = floor(_208);
        float _212 = -_210;
        float _214 = _208 + _212;
        _216 = _214;
        _218 = true;
    }
    else
    {
        _216 = _176;
    }
    _218 = false;
    float _220 = _216;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    float _242 = 1.0 / _240;
    bool _244 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_220);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_236;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _264;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = _254 * _258;
    float _276 = -_254;
    float _278 = _276 + 1.0;
    float _280 = _224 * _242;
    float _282 = in.m_59.x;
    float _284 = in.m_59.y;
    float _286 = in.m_59.z;
    float _288 = fma(_262, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _290 = fma(_272, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _292 = fma(_266, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = _288 * _274;
    float _296 = _290 * _274;
    float _298 = _292 * _274;
    float _300 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _302 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _296);
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _306 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _300);
    float _308 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _302);
    float _310 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _304);
    float _312 = _306 * _282;
    float _314 = _308 * _284;
    float _316 = _310 * _286;
    bool _318 = !_268;
    if (!_318)
    {
        float _320 = in.m_57.x;
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _198 = _334;
    }
    float _336 = _198;
    float _338 = in.m_57.x;
    float _340 = in.m_57.y;
    float _342 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _344 = log2(_342);
    float _346 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _348 = in.m_46.x;
    float _350 = in.m_46.y;
    float _352 = in.m_46.z;
    float _354 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _358 = in.m_57.z;
    float _360 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _362 = int(_360);
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _366 = _346 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _368 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _380 = int(_378);
    float _382 = _338 * 2.0;
    float _384 = _340 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _386 = _338 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _388 = _340 * 2.0;
    float _390 = float(_362);
    float _392 = fma(_384, -2.0, _356);
    float _394 = floor(_382);
    float _396 = _344 * _120;
    float _398 = -_364;
    float _400 = fma(_386, 2.0, _398);
    float _402 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _404 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _406 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _408 = _340 + _338;
    float _410 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _402);
    float _412 = floor(_388);
    float _414 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _406);
    float _416 = _408 + (-1.0);
    float _418 = _358 * 2.0;
    float _420 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _404);
    float _422 = _340 + _358;
    float _424 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _426 = exp2(_396);
    bool _428 = _394 > 0.0;
    float _430 = _422 + (-1.0);
    bool _432 = _394 >= 0.0;
    bool _434 = isnan(_394);
    bool _436 = _432 || _434;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _444 = floor(_418);
    bool _446 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _448 = isnan(1.0);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _454 = _450 || _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _458 = 1.0 + _456;
    bool _460 = _412 > 0.0;
    bool _462 = _412 >= 0.0;
    bool _464 = isnan(_412);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = 1.0 / _390;
    float _474 = -_426;
    float _476 = _474 + 1.0;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _480 = float(_380);
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _484 = -_120;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _400);
    float _488 = _376 ? _476 : 0.0;
    float _490 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[78].z, _478);
    float _492 = 1.0 / _458;
    bool _494 = _444 > 0.0;
    float _496 = _480 * _120;
    bool _498 = _444 >= 0.0;
    bool _500 = isnan(_444);
    bool _502 = _498 || _500;
    bool _504 = isnan(0.0);
    bool _506 = _502 || _504;
    float _508 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[78].w, _482);
    int _510 = _440 ? 0 : 1;
    float _512 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _490);
    int _514 = _506 ? 0 : 1;
    float _516 = _472 * _120;
    int _518 = ~_510;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _508);
    float _526 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _392);
    int _528 = _522;
    float _530 = _336;
    if (!_428)
    {
        int _532 = ~_510;
        int _534 = _532 + 1;
        _528 = _534;
    }
    int _536 = _528;
    float _538 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].z, _410);
    int _540 = _470 ? 0 : 1;
    float _542 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].z, _414);
    if (_454)
    {
        float _544 = _488 * _492;
        _130 = _544;
    }
    float _546 = _130;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _558 = _556 != 0;
    float _560 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].z, _420);
    int _562 = ~_540;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    float _568 = _538 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _570 = _566;
    if (!_460)
    {
        int _572 = ~_540;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = _560 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _580 = !_554;
    int _582 = _580 ? 0 : 1;
    float _584 = in.m_61.x;
    float _586 = in.m_61.y;
    float _588 = in.m_61.z;
    bool _590 = !_550;
    int _592 = _590 ? 0 : 1;
    float _594 = _542 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _596 = !_558;
    int _598 = _596 ? 0 : 1;
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _602 = _568 + _600;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = float(_536);
    int _618 = ~_514;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    bool _624 = !_606;
    int _626 = _624 ? 0 : 1;
    bool _628 = !_610;
    int _630 = _628 ? 0 : 1;
    int _632 = abs(_626);
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _636 = _578 + _634;
    int _638 = abs(_630);
    float _640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _642 = _594 + _640;
    int _644 = _622;
    if (!_494)
    {
        int _646 = ~_514;
        int _648 = _646 + 1;
        _644 = _648;
    }
    int _650 = _644;
    float _652 = _636 * _636;
    float _654 = float(_638);
    float _656 = fma(_602, _602, _652);
    float _658 = _654 * _616;
    float _660 = float(_632);
    float _662 = fma(_642, _642, _656);
    float _664 = float(_650);
    float _666 = _658 * (-2.0);
    bool _668 = !_614;
    int _670 = _668 ? 0 : 1;
    float _672 = sqrt(_662);
    float _674 = _340 + (-0.5);
    float _676 = fma(_666, _586, _586);
    int _678 = abs(_670);
    float _680 = _660 * _664;
    float _682 = fma(_442, _666, _442);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _676);
    float _686 = _358 + _338;
    float _688 = float(_576);
    float _690 = _680 * (-2.0);
    float _692 = rsqrt(_662);
    float _694 = float(_678);
    float _696 = _686 + (-1.0);
    float _698 = fma(_690, _584, _584);
    float _700 = _672 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _702 = _694 * _688;
    float _704 = fma(_424, _690, _424);
    float _706 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _708 = _338 + (-0.5);
    float _710 = precise::min(_366, _700);
    float _712 = _702 * (-2.0);
    float _714 = _358 + (-0.5);
    float _716 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].x, _698);
    float _718 = fma(_682, _546, _684);
    float _720 = fma(_706, _712, _706);
    float _722 = _692 * _710;
    float _724 = fma(_712, _588, _588);
    float _726 = fma(_704, _546, _716);
    float _728 = _718 * 0.15915493667125701904296875;
    float _730 = _636 * _722;
    float _732 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].z, _724);
    float _734 = _602 * _722;
    float _736 = _728 * 6.283185482025146484375;
    float _738 = sin(_736);
    float _740 = -_730;
    float _742 = _636 + _740;
    float _744 = fma(_720, _546, _732);
    float _746 = -_734;
    float _748 = _602 + _746;
    float _750 = _642 * _722;
    float _752 = _742 * _742;
    float _754 = _726 * 0.15915493667125701904296875;
    float _756 = _744 * 0.15915493667125701904296875;
    float _758 = _728 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = fma(_748, _748, _752);
    float _764 = -_750;
    float _766 = _642 + _764;
    float _768 = in.m_63.x;
    float _770 = in.m_63.y;
    float _772 = in.m_63.z;
    float _774 = _756 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = fma(_766, _766, _762);
    float _780 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = sqrt(_778);
    float _784 = _754 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _754 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _692 * _782;
    float _794 = _780 * _792;
    float _796 = _346 * _792;
    float _798 = _354 * _792;
    float _800 = _756 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _770);
    float _806 = _786 * _760;
    float _808 = _786 * _738;
    float _810 = _786 * _776;
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _768);
    float _814 = _794 * _804;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _772);
    float _818 = _790 * _738;
    float _820 = _790 * _760;
    float _822 = _790 * _776;
    float _824 = _760 * _776;
    float _826 = _738 * _776;
    float _828 = _796 * _812;
    float _830 = _810 * _814;
    float _832 = _798 * _816;
    float _834 = fma(_802, _806, _818);
    float _836 = -_820;
    float _838 = fma(_802, _808, _836);
    float _840 = -_814;
    float _842 = _802 * _840;
    float _844 = -_808;
    float _846 = fma(_802, _820, _844);
    float _848 = fma(_834, _828, _830);
    float _850 = _822 * _814;
    float _852 = fma(_824, _828, _842);
    float _854 = fma(_802, _818, _806);
    float _856 = fma(_838, _832, _848);
    float _858 = fma(_846, _828, _850);
    float _860 = fma(_826, _832, _852);
    float _862 = _856 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _864 = _856 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _866 = fma(_854, _832, _858);
    float _868 = _856 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _870 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[26].x, _862);
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[24].x, _864);
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _870);
    float _876 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _872);
    float _878 = _874 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _880 = _876 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _882 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[25].x, _868);
    float _884 = -_730;
    float _886 = _578 + _884;
    float _888 = _594 + _878;
    float _890 = _568 + _880;
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _882);
    float _894 = -_734;
    float _896 = _568 + _894;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _900 = _888 + _898;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _904 = _890 + _902;
    float _906 = _886 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _908 = _892 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _910 = _900 * _900;
    float _912 = -_750;
    float _914 = _594 + _912;
    float _916 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[11].x, _906);
    float _918 = _578 + _908;
    float _920 = fma(_904, _904, _910);
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[11].z, _916);
    float _924 = sqrt(_920);
    bool _926 = _924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _908;
    float _930 = _910;
    float _932 = _916;
    float _934 = _730;
    float _936 = _750;
    float _938 = _734;
    if (!_926)
    {
        _928 = _890;
    }
    float _940 = _928;
    float _942 = _940;
    if (!_926)
    {
        _930 = _888;
    }
    float _944 = _930;
    float _946 = _944;
    if (!_926)
    {
        _932 = _918;
    }
    float _948 = _932;
    bool _950 = !_926;
    float _952 = _948;
    if (!_950)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _958 = _924 + _956;
        float _960 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = rsqrt(_920);
        float _964 = _958 * _954;
        float _966 = _964 * 0.15915493667125701904296875;
        float _968 = _966 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 * 6.283185482025146484375;
        float _974 = cos(_972);
        float _976 = fma(_970, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = _962 * _976;
        float _980 = _974 + (-1.0);
        float _982 = fma(_904, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_900, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _986 = _980 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = fma(_918, _974, _986);
        _952 = _988;
        _942 = _982;
        _946 = _984;
    }
    float _990 = _952;
    float _992 = _942;
    float _994 = _946;
    float _996 = -_578;
    float _998 = _996 + _990;
    float _1000 = -_568;
    float _1002 = _1000 + _992;
    float _1004 = _922 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1006 = _886 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1008 = _998 * _998;
    float _1010 = -_594;
    float _1012 = _1010 + _994;
    float _1014 = 1.0 / _1004;
    float _1016 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1006);
    float _1018 = fma(_1002, _1002, _1008);
    bool _1020 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1022 = isnan(0.5);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1028 = _1024 || _1026;
    float _1030 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1016);
    float _1032 = fma(_1012, _1012, _1018);
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1036 = sqrt(_1032);
    bool _1038 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1040 = isnan(0.5);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1046 = _1042 || _1044;
    float _1048 = _1034 + _1004;
    float _1050 = -_730;
    float _1052 = _1050 + _990;
    float _1054 = _1048 * _1014;
    float _1056 = _1054 * 0.5;
    float _1058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1060 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1058);
    float _1062 = -_734;
    float _1064 = _1062 + _992;
    float _1066 = -_750;
    float _1068 = _1066 + _994;
    float _1070 = 1.0 / _1060;
    bool _1072 = _1036 > 0.0;
    float _1074 = _1002;
    float _1076 = _990;
    float _1078 = _1060;
    float _1080 = _1014;
    float _1082 = _1068;
    float _1084 = _1032;
    if (!_1072)
    {
        _934 = _1064;
    }
    float _1086 = _934;
    float _1088 = _1086;
    if (!_1072)
    {
        _936 = _1052;
    }
    float _1090 = _936;
    float _1092 = _1090;
    if (!_1072)
    {
        _938 = _1068;
    }
    float _1094 = _938;
    bool _1096 = !_1072;
    float _1098 = _1094;
    float _1100 = _1094;
    if (!_1096)
    {
        float _1102 = _192 * _192;
        float _1104 = fma(_190, _190, _1102);
        float _1106 = rsqrt(_1032);
        float _1108 = fma(_194, _194, _1104);
        float _1110 = sqrt(_1108);
        float _1112 = _998 * _1106;
        float _1114 = _1002 * _1106;
        float _1116 = _1012 * _1106;
        bool _1118 = _1110 > 0.0;
        float _1120 = _1106;
        float _1122 = _1110;
        _1076 = _1114;
        _1078 = _1112;
        if (!_1118)
        {
            _1120 = _1064;
        }
        float _1124 = _1120;
        _1088 = _1124;
        if (!_1118)
        {
            _1122 = _1052;
        }
        float _1126 = _1122;
        _1092 = _1126;
        if (!_1118)
        {
            _1098 = _1068;
        }
        float _1128 = _1098;
        bool _1130 = !_1118;
        _1100 = _1128;
        if (!_1130)
        {
            float _1132 = rsqrt(_1108);
            float _1134 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1136 = _192 * _1132;
            float _1138 = _190 * _1132;
            float _1140 = _194 * _1132;
            float _1142 = _1112 * _1136;
            float _1144 = fma(_1114, _1138, _1142);
            float _1146 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1148 = fma(_1116, _1140, _1144);
            float _1150 = _1148 * _1146;
            float _1152 = fma(_190, _1150, _1064);
            float _1154 = fma(_192, _1150, _1052);
            float _1156 = fma(_194, _1150, _1068);
            _1088 = _1152;
            _1092 = _1154;
            _1100 = _1156;
            _1074 = _1150;
        }
    }
    float _1158 = _1088;
    float _1160 = _1092;
    float _1162 = _1100;
    float _1164 = _1074;
    float _1166 = _1076;
    float _1168 = _1078;
    float _1170 = _1164;
    float _1172 = _1160;
    float _1174 = _1158;
    float _1176 = _1162;
    float _1178 = _1166;
    float _1180 = _1168;
    if (_1046)
    {
        _1170 = 1.0;
    }
    float _1182 = _1170;
    float _1184 = _1182;
    if (!_1028)
    {
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1188 = _886 + _1186;
        float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1192 = _896 + _1190;
        float _1194 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1196 = _1188 * _1188;
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1200 = _914 + _1198;
        float _1202 = fma(_1192, _1192, _1196);
        float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1206 = fma(_1200, _1200, _1202);
        float _1208 = sqrt(_1206);
        float _1210 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1212 = precise::min(_1208, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1214 = _1212 * _1204;
        float _1216 = -_896;
        float _1218 = _1216 + _1158;
        float _1220 = _1210 * _1214;
        float _1222 = -_886;
        float _1224 = _1222 + _1160;
        float _1226 = -_914;
        float _1228 = _1226 + _1162;
        float _1230 = fma(_1218, _1220, _896);
        float _1232 = fma(_1224, _1220, _886);
        float _1234 = fma(_1228, _1220, _914);
        _1172 = _1232;
        _1174 = _1230;
        _1176 = _1234;
    }
    float _1236 = _1172;
    float _1238 = _1174;
    float _1240 = _1176;
    if (_1046)
    {
        _1080 = 1.0;
    }
    float _1242 = _1080;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1246 = _1070 * _1244;
    float _1248 = _1242;
    if (!_1046)
    {
        float _1250 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1250 * 0.15915493667125701904296875;
        float _1254 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1258 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1256;
        float _1260 = _1252 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1254 * 0.15915493667125701904296875;
        float _1266 = _1252 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = 1.0 / _1262;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = 1.0 / _1258;
        float _1286 = 1.0 / _1282;
        float _1288 = _1280 * _1286;
        float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1292 = fma(_1246, _1288, _1290);
        float _1294 = _1292 * _1284;
        float _1296 = precise::clamp(_1294, 0.0, 1.0);
        _1184 = _1296;
    }
    float _1298 = _1184;
    if (!_1046)
    {
        float _1300 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1302 = _1300 * 0.15915493667125701904296875;
        float _1304 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1306 = _1302 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = _1304 * 0.15915493667125701904296875;
        float _1312 = _1302 * 6.283185482025146484375;
        float _1314 = sin(_1312);
        float _1316 = 1.0 / _1308;
        float _1318 = _1310 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        float _1322 = _1314 * _1316;
        float _1324 = _1310 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = _1320 * _1322;
        float _1330 = 1.0 / _1328;
        float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1334 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1332;
        float _1336 = 1.0 / _1334;
        float _1338 = _1326 * _1330;
        float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1342 = fma(_1246, _1338, _1340);
        float _1344 = _1342 * _1336;
        float _1346 = precise::clamp(_1344, 0.0, 1.0);
        float _1348 = -_1346;
        float _1350 = _1348 + 1.0;
        _1082 = _1338;
        _1248 = _1350;
    }
    float _1352 = _1082;
    float _1354 = _1248;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1358 = _1236 + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1362 = _1238 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1366 = _1240 + _1364;
    float _1368 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1370 = _1358 * _1358;
    float _1372 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1368);
    float _1374 = fma(_1362, _1362, _1370);
    float _1376 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1372);
    float _1378 = fma(_1366, _1366, _1374);
    float _1380 = rsqrt(_1378);
    float _1382 = sqrt(_1378);
    float _1384 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1386 = _1362 * _1384;
    float _1388 = _1366 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 + _1392;
    float _1396 = sqrt(_1394);
    bool _1398 = _1396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1396 + _1400;
    float _1404 = _1370;
    float _1406 = _1394;
    float _1408 = _1402;
    float _1410 = _1386;
    float _1412 = _1388;
    float _1414 = _1390;
    if (_1398)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1404 = _1416;
    }
    float _1418 = _1404;
    if (_1398)
    {
        float _1420 = rsqrt(_1394);
        _1406 = _1420;
    }
    float _1422 = _1406;
    float _1424 = _1422;
    if (_1398)
    {
        float _1426 = _1402 * _1418;
        _1408 = _1426;
    }
    float _1428 = _1408;
    if (_1398)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1084 = _1430;
    }
    float _1432 = _1084;
    float _1434 = _1418;
    if (_1398)
    {
        float _1436 = _1432 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        _1434 = _1438;
    }
    float _1440 = _1434;
    float _1442 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1444 = precise::max(0.0, _1442);
    float _1446 = _1352;
    if (_1398)
    {
        float _1448 = _1432 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        _1446 = _1450;
    }
    float _1452 = _1446;
    float _1454 = -_1384;
    float _1456 = -_1444;
    float _1458 = fma(_1358, _1454, _1456);
    if (_1398)
    {
        float _1460 = _1458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1460;
    }
    float _1462 = _1178;
    float _1464 = fma(_896, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1466 = _1440;
    float _1468 = _1462;
    if (_1398)
    {
        float _1470 = fma(_1440, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1180 = _1470;
    }
    float _1472 = _1180;
    float _1474 = _1472;
    if (!_1398)
    {
        _1466 = _1458;
    }
    float _1476 = _1466;
    float _1478 = floor(_1464);
    float _1480 = _1476;
    float _1482 = _1452;
    if (_1398)
    {
        float _1484 = _1452 + (-1.0);
        _1468 = _1484;
    }
    float _1486 = _1468;
    if (_1398)
    {
        float _1488 = _1422 * _1472;
        _1474 = _1488;
    }
    float _1490 = _1474;
    if (_1398)
    {
        float _1492 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1424 = _1492;
    }
    float _1494 = _1424;
    if (_1398)
    {
        float _1496 = _1386 * _1490;
        _1410 = _1496;
    }
    float _1498 = _1410;
    if (_1398)
    {
        float _1500 = _1388 * _1490;
        _1412 = _1500;
    }
    float _1502 = _1412;
    if (_1398)
    {
        float _1504 = fma(_1458, _1452, _1494);
        _1480 = _1504;
    }
    float _1506 = _1480;
    if (_1398)
    {
        float _1508 = _1498 * _1498;
        _1414 = _1508;
    }
    float _1510 = _1414;
    if (!_1398)
    {
        _1482 = _1392;
    }
    float _1512 = _1482;
    float _1514 = _1512;
    if (_1398)
    {
        float _1516 = _1502 * _1502;
        _1514 = _1516;
    }
    float _1518 = _1514;
    float _1520 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1522 = fma(_1506, _1506, _1510);
    float _1524 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1526 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1520);
    float _1528 = _1522 + _1518;
    float _1530 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1532 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1534 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1526);
    float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1538 = fma(_1382, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1536);
    float _1540 = precise::clamp(_1538, 0.0, 1.0);
    float _1542 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1524);
    float _1544 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1532);
    float _1546 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1548 = rsqrt(_1528);
    float _1550 = -_1540;
    float _1552 = _1550 + 1.0;
    float _1554 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1544);
    float _1556 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1542);
    float _1558 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1560 = _1554 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1562 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1564 = abs(_1552);
    float _1566 = log2(_1564);
    float _1568 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1570 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1558);
    float _1572 = fma(_914, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1574 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1576 = -_1478;
    float _1578 = _1464 + _1576;
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1570);
    float _1582 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1584 = _1548 * _1498;
    float _1586 = floor(_1572);
    float _1588 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1580);
    float _1590 = _1548 * _1506;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1594 = _1548 * _1502;
    float _1596 = -_1574;
    float _1598 = fma(_1596, _1530, 1.0);
    float _1600 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1602 = -_1592;
    float _1604 = fma(_1590, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1602);
    float _1606 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1608 = 1.0 / _1588;
    float _1610 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1582);
    float _1612 = -_1594;
    float _1614 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1604);
    float _1616 = _1590 + 1.0;
    float _1618 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1610);
    float _1620 = fma(_1614, -0.5, 0.5);
    float _1622 = fma(_1614, 0.5, 0.5);
    float _1624 = log2(_1598);
    float _1626 = -_1586;
    float _1628 = _1572 + _1626;
    float _1630 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1600);
    float _1632 = fma(_1622, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1634 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1636 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1630);
    float _1638 = fma(_1622, _1632, -0.212114393711090087890625);
    float _1640 = exp2(_1606);
    float _1642 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1644 = _1634 * _1608;
    float _1646 = fma(_1622, _1638, 1.570728778839111328125);
    float _1648 = _1642 * _1608;
    float _1650 = sqrt(_1620);
    float _1652 = _1624 * 0.693147182464599609375;
    float _1654 = fma(_1648, -0.5, 0.5);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1658 = -_1590;
    float _1660 = fma(_1640, _1616, _1658);
    float2 _5430 = float2(_1578, _1628);
    float _1662 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5430, float2(0.0), isnan(_5430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5430, float2(0.0), isnan(_5430)), level(0.0)).x;
    float _1664 = fma(_1660, 0.5, 0.5);
    float _1666 = _1650 * 0.636619746685028076171875;
    float _1668 = fma(_1644, 0.5, 0.5);
    float _1670 = -_1646;
    float _1672 = fma(_1666, _1670, 1.0);
    float3 _5453 = float3(_1668, _1654, _1656);
    float _1674 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5453, float3(0.0), isnan(_5453)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5453, float3(0.0), isnan(_5453)), level(0.0)).x;
    float3 _5464 = float3(_1668, _1654, _1656);
    float4 _1677 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5464, float3(0.0), isnan(_5464)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5464, float3(0.0), isnan(_5464)), level(0.0)).xyzw;
    float _1679 = _1677.x;
    float _1681 = _1677.y;
    float _1683 = _1677.z;
    float _1685 = _1677.w;
    float2 _5480 = float2(_1672, _1664);
    float3 _1689 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5480, float2(0.0), isnan(_5480)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5480, float2(0.0), isnan(_5480)), level(0.0)).xyz;
    float _1691 = _1689.x;
    float _1693 = _1689.y;
    float _1695 = _1689.z;
    float _1697 = float(uint(_380));
    float _1699 = trunc(_516);
    int _1701 = int(_1699);
    bool _1703 = _380 == 0;
    out.m_65.x = _896;
    out.m_65.y = _886;
    out.m_65.z = _914;
    int _1705 = abs(_582);
    float _1707 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1709 = abs(_592);
    out.m_67.w = _710;
    float _1711 = 1.0 / _1697;
    out.m_69.x = _796;
    out.m_71.x = _1238;
    out.m_71.y = _1236;
    out.m_71.z = _1240;
    float _1713 = float(uint(_1701));
    float _1715 = abs(_1246);
    float _1717 = log2(_1715);
    int _1719 = as_type<int>(_1711) + (-2);
    float _1721 = exp2(_1707);
    int _1723 = ~_380;
    int _1725 = _1723 + 1;
    float _1727 = as_type<float>(_1719) * _1713;
    bool _1729 = _1246 <= 8000.0;
    bool _1731 = isnan(_1246);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan(8000.0);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = _1717 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1743 = trunc(_1727);
    float _1745 = precise::max(_1743, 0.0);
    uint _1748 = uint(_1745);
    float _1750 = -_1721;
    float _1752 = _1750 + 1.0;
    float _1754 = exp2(_1741);
    float _1756 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1758 = _1725 * int(_1748);
    int _1760 = _1758 + _1701;
    float _1762 = float(uint(_1760));
    float _1764 = as_type<float>(_1719) * _1762;
    float _1766 = trunc(_1764);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    int _1772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1774 = _1772 != 0;
    int _1776 = ~_380;
    int _1778 = _1776 + 1;
    bool _1780 = !_1774;
    float _1782 = _1780 ? 7.345489978790283203125 : 1.0;
    float _1784 = _1782 * _338;
    float _1786 = floor(_1784);
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1790 = _1788 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1792 = int(_1748) + int(_1770);
    float _1794 = float(_1701);
    float _1796 = 1.0 / _1790;
    int _1798 = _1778 * _1792;
    int _1800 = _1798 + _1701;
    bool _1802 = _1794 >= _480;
    bool _1804 = isnan(_1794);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(_480);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    bool _1814 = uint(_1800) >= uint(_380);
    float _1816 = trunc(_1812);
    int _1818 = int(_1816);
    float _1820 = -_1786;
    float _1822 = _1784 + _1820;
    bool _1824 = !_1814;
    int _1826 = _1824 ? 0 : (-1);
    float _1828 = _496 * _172;
    int _1830 = _380 + (-1);
    float _1832 = _1822 * _480;
    int _1834 = ~_1792;
    int _1836 = _1834 + _1826;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1828);
    int _1842 = int(_1840);
    int _1844 = _380 * _1838;
    int _1846 = _1844 + _1701;
    int _1848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1850 = _1848 != 0;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1854 = _1852 != 0;
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1856;
    int _1860 = ~_1818;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = trunc(_1832);
    int _1868 = int(_1866);
    bool _1870 = !_1703;
    int _1872 = _1870 ? _1846 : (-1);
    bool _1874 = !_1850;
    int _1876 = _1874 ? 0 : 1;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1880 = _1878 != 0;
    int _1882 = _1872 * _1864;
    int _1884 = abs(_1876);
    int _1886 = _1818 * _1830;
    int _1888 = _1886 + _1882;
    int _1890 = abs(_598);
    int _1892 = _1888 * _1705;
    int _1894 = _1868 * _1884;
    int _1896 = _1894 + _1701;
    bool _1898 = !_1880;
    int _1900 = _1898 ? 0 : 1;
    int _1902 = _1842 * _1709;
    int _1904 = _1902 + _1892;
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1910 = abs(_1900);
    int _1912 = _1896 * _1890;
    int _1914 = _1912 + _1904;
    float _1916 = in.m_73.y;
    int _1918 = _1868 * _1910;
    int _1920 = _1918 + _1914;
    float _1922 = 1.0 / _1908;
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1926 = _1924 != 0;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1932 = _340 > 0.5;
    float _1934 = float(uint(_1920));
    float _1936 = 1.0 / _1930;
    float _1938 = as_type<float>(_1719) * _1934;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1946 = _1588;
    if (_1854)
    {
        float _1948 = in.m_57.x;
        _1944 = _1948;
    }
    float _1950 = _1944;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1954 = trunc(_1938);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    float _1960 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1962;
    float _1966 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1970 = -_1916;
    float _1972 = _1970 + 1.0;
    float _1974 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1964 * _1922;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1980 = _1978 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1984 = _1982 != 0;
    float _1986 = in.m_73.x;
    float _1988 = _1916;
    float _1990 = _1976;
    if (_1926)
    {
        float _1992 = _1932 ? _1972 : _1916;
        _1988 = _1992;
    }
    float _1994 = _1988;
    float _1996 = _1980 * _1796;
    int _1998 = ~_380;
    int _2000 = _1998 + 1;
    out.m_75.x = _1966;
    out.m_75.y = _1974;
    out.m_75.z = _1968;
    out.m_75.w = _1942;
    bool _2002 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2004 = isnan(_336);
    bool _2006 = _2002 || _2004;
    bool _2008 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2010 = _2006 || _2008;
    float _2012 = float(_2010);
    bool _2014 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2016 = isnan(_336);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2022 = _2018 || _2020;
    float _2024 = float(_2022);
    float _2026 = float(uint(_1896));
    bool _2028 = _1950 > 0.5;
    bool _2030 = _2028 && _1854;
    bool _2032 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2034 = isnan(_336);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2040 = _2036 || _2038;
    float _2042 = float(_2040);
    float _2044 = as_type<float>(_1719) * _2026;
    int _2046 = _2000 * int(_1958);
    int _2048 = _2046 + _1920;
    float _2050 = _1858 * _1936;
    bool _2052 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2054 = isnan(_336);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2060 = _2056 || _2058;
    float _2062 = float(_2060);
    float _2064 = -_2012;
    float _2066 = _2064 + 1.0;
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2070 = _336 + _2068;
    float _2072 = float(uint(_2048));
    float _2074 = -_2024;
    float _2076 = _2074 + 1.0;
    float _2078 = _2062 * _2066;
    float _2080 = -_2062;
    float _2082 = _2080 + 1.0;
    float _2084 = fma(_1976, _2070, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2086 = as_type<float>(_1719) * _2072;
    float _2088 = _2012 * _2076;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2092 = _336 + _2090;
    float _2094 = _2042 * _2082;
    float _2096 = trunc(_2086);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    float _2102 = -_2042;
    float _2104 = _2102 + 1.0;
    float _2106 = fma(_1996, _2092, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2108 = _2084 * _2094;
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2112 = _336 + _2110;
    if (_1854)
    {
        _1990 = _1986;
    }
    float _2114 = _1990;
    float _2116 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2108);
    float _2118 = _2114;
    if (!_1854)
    {
        _530 = _1986;
    }
    float _2120 = _530;
    float _2122 = trunc(_2044);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    float _2128 = fma(_2050, _2112, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _2130 = ~_380;
    int _2132 = _2130 + 1;
    float _2134 = _2120;
    if (_2030)
    {
        float _2136 = -_2114;
        float _2138 = _2136 + 1.0;
        _2118 = _2138;
    }
    float _2140 = _2118;
    float _2142 = fma(_2106, _2078, _2116);
    int _2144 = ~_380;
    int _2146 = _2144 + 1;
    int _2148 = int(_1958) + int(_2100);
    float _2150 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    if (_1854)
    {
        _2134 = _2140;
    }
    float _2152 = _2134;
    float _2154 = fma(_2128, _2088, _2142);
    bool _2156 = _770 != 0.0;
    bool _2158 = isnan(_770);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.0);
    bool _2164 = _2160 || _2162;
    float _2166 = -_526;
    float _2168 = fma(_524, _2150, _2166);
    int _2170 = _2146 * _2148;
    int _2172 = _2170 + _1920;
    float _2174 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2176 = in.m_77.x;
    float _2178 = in.m_77.y;
    float _2180 = in.m_77.z;
    bool _2182 = _768 == 0.0;
    bool _2184 = !_2164;
    bool _2186 = _2182 && _2184;
    int _2188 = _2132 * int(_2126);
    int _2190 = _2188 + _1896;
    float _2192 = fma(_512, _2174, _486);
    float _2194 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2154);
    float _2196 = float(uint(_2190));
    bool _2198 = _772 == 0.0;
    bool _2200 = _2198 && _2186;
    bool _2202 = uint(_2172) >= uint(_380);
    float _2204 = as_type<float>(_1719) * _2196;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2210 = !_2202;
    int _2212 = _2210 ? 0 : (-1);
    float _2214 = trunc(_2204);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    float _2220 = _2168 + 0.5;
    int _2222 = ~_2148;
    int _2224 = _2222 + _2212;
    int _2226 = _2224 + 1;
    float _2228 = _2206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2230 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2234 = _2176;
    float _2236 = _2180;
    float _2238 = _2178;
    if (!_2200)
    {
        float _2240 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2176);
        _2234 = _2240;
    }
    float _2242 = _2234;
    int _2244 = _380 * _2226;
    int _2246 = _2244 + _1920;
    float _2248 = _2192 + 0.5;
    float _2250 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2252 = _2194 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_2200)
    {
        float _2254 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2180);
        _2236 = _2254;
    }
    float _2256 = _2236;
    bool _2258 = !_1703;
    int _2260 = _2258 ? _2246 : (-1);
    if (!_2200)
    {
        float _2262 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2178);
        _2238 = _2262;
    }
    float _2264 = _2238;
    int _2266 = ~_380;
    int _2268 = _2266 + 1;
    out.m_79.x = _2248;
    out.m_79.y = _2220;
    int _2270 = int(_2126) + int(_2218);
    float _2272 = _810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = _810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_81.x = _2228;
    out.m_81.y = _2250;
    out.m_81.z = _2230;
    out.m_81.w = _2252;
    int _2276 = _2260 & 3;
    bool _2278 = _2276 != 0;
    float _2280 = -_802;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2284 = _834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2286 = _2260 >> 31;
    float _2288 = _838 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2290 = _2268 * _2270;
    int _2292 = _2290 + _1896;
    float _2294 = -_802;
    float _2296 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    int _2298 = _2286 & 3;
    float _2300 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2282);
    float _2302 = _810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2304 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2296);
    int _2306 = _2260 + _2298;
    float _2308 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2284);
    float _2310 = -_802;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2302);
    bool _2314 = uint(_2292) >= uint(_380);
    float _2316 = _2304 * _2264;
    int _2318 = _2306 >> 2;
    float _2320 = _834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2322 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2312);
    float _2324 = _2300 * _2264;
    int _2326 = _2318 << 4;
    int _2328 = _2326 + 368;
    float _2330 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2320);
    float _2332 = _2322 * _2264;
    bool _2334 = !_2314;
    int _2336 = _2334 ? 0 : (-1);
    uint _2338 = uint(int(uint(_2328) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    float _2354 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2330);
    int _2356 = _2260 & 3;
    bool _2358 = _2356 != 0;
    float _2360 = _834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2362 = ~_2270;
    int _2364 = _2362 + _2336;
    int _2366 = _2364 + 1;
    float _2368 = fma(_2354, _2242, _2316);
    bool _2370 = uint(_2356) > 1u;
    float _2372 = _838 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2374 = _2328 + 8;
    uint _2376 = uint(int(uint(_2374) >> uint(2)));
    uint _2378 = uint(int(uint(int(_2376)) >> uint(2)));
    int _2380 = int(_2376) & 3;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[int(_2378)][_2380];
    int _2384 = int(_2376) + 1;
    uint _2386 = uint(int(uint(_2384) >> uint(2)));
    int _2388 = _2384 & 3;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[int(_2386)][_2388];
    int _2392 = _2278 ? 0 : 1;
    float _2394 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2360);
    bool _2396 = uint(_2356) >= 2u;
    float _2398 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2372);
    int _2400 = ~_2392;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    float _2406 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2308);
    float _2408 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2394);
    bool _2410 = !_2358;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2398);
    float _2416 = fma(_2406, _2242, _2324);
    int _2418 = _2404;
    if (!_2370)
    {
        int _2420 = ~_2392;
        int _2422 = _2420 + 1;
        _2418 = _2422;
    }
    int _2424 = _2418;
    float _2426 = fma(_2408, _2242, _2332);
    bool _2428 = _2356 != 3;
    float _2430 = fma(_2414, _2256, _2368);
    int _2432 = abs(_2424);
    int _2434 = _380 * _2366;
    int _2436 = _2434 + _1896;
    int _2438 = _2396 ? 0 : 1;
    float _2440 = -_1662;
    float _2442 = _2440 + 1.0;
    int _2444 = abs(_2412);
    float _2446 = _838 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2448 = ~_2438;
    int _2450 = _2448 + 1;
    int _2452 = _2450 + 1;
    float _2454 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    bool _2456 = _2356 != 3;
    float _2458 = _1756 * _1674;
    float _2460 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2446);
    int _2462 = _2452;
    if (_2428)
    {
        int _2464 = ~_2438;
        int _2466 = _2464 + 1;
        _2462 = _2466;
    }
    int _2468 = _2462;
    float _2470 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2454);
    int _2472 = ~_2432;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    float _2478 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2480 = precise::clamp(_2478, 0.0, 1.0);
    float _2482 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2460);
    bool _2484 = !_2456;
    int _2486 = _2484 ? 0 : (-1);
    bool _2488 = !_1703;
    int _2490 = _2488 ? _2436 : (-1);
    float _2492 = _1695 * _2458;
    int _2494 = abs(_2468);
    float _2496 = -_1756;
    float _2498 = _2496 + 1.0;
    int _2500 = ~_2444;
    int _2502 = _2500 + 1;
    int _2504 = _2502 + 1;
    int _2506 = _2476 * as_type<int>(_2352);
    bool _2508 = !_1984;
    int _2510 = _2508 ? 0 : 1;
    float _2512 = fma(_2470, _2256, _2416);
    int _2514 = abs(_2486);
    int _2516 = _2504 * as_type<int>(_2344);
    int _2518 = _2516 + _2506;
    float _2520 = fma(_2482, _2256, _2426);
    int _2522 = abs(_2510);
    float _2524 = fma(_2480, -2.0, 3.0);
    float _2526 = _2480 * _2480;
    int _2528 = ~_2494;
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    float _2534 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2536 = ~_2514;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    float _2542 = _2526 * _2524;
    int _2544 = _2532 * as_type<int>(_2382);
    int _2546 = _2544 + _2518;
    float _2548 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2534);
    out.m_83.x = _2430;
    out.m_83.y = _2512;
    out.m_83.z = _2520;
    int _2550 = _2540 * as_type<int>(_2390);
    int _2552 = _2550 + _2546;
    float _2554 = -_2542;
    float _2556 = _2554 + 1.0;
    int _2558 = ~_2522;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    float _2564 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2548);
    float _2566 = in.m_85.x;
    float _2568 = fma(_2556, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2542);
    bool _2570 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2572 = isnan(_1382);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2578 = _2574 || _2576;
    int _2580 = _2552 * _2562;
    float _2582 = _1588 * 0.5;
    float _2584 = _1739 * _2568;
    int _2586 = _2490 * _2522;
    int _2588 = _2586 + _2580;
    float _2590 = fma(_1642, -0.5, _2582);
    float _2592 = _2584 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2594 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2564);
    float _2596 = _1634 + _1588;
    float _2598 = _2442 * _2592;
    float _2600 = precise::clamp(_2598, 0.0, 1.0);
    float _2602 = float(_2588);
    float _2604 = _2594 + _1588;
    float _2606 = _2596 * 0.5;
    float _2608 = -_2600;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2612 = _1685 * _2458;
    float _2614 = _2604 * 0.5;
    out.m_87.x = _2602;
    float _2616 = fma(_1691, _2612, _1679);
    float _2618 = fma(_1693, _2612, _1681);
    float _2620 = _1685 * _2498;
    float _2622 = fma(_1685, _2492, _1683);
    out.m_89.x = _2606;
    out.m_89.y = _2590;
    out.m_89.z = _2614;
    out.m_89.w = _1588;
    float _2624 = _2610 * _2566;
    float _2626 = _2612;
    float _2628 = _2624;
    float _2630 = _2594;
    if (!_2578)
    {
        _2626 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2632 = _2626;
    out.m_91.x = _2616;
    out.m_91.y = _2618;
    out.m_91.z = _2622;
    out.m_91.w = _2620;
    out.gl_Position.x = _1634;
    out.gl_Position.y = _1642;
    out.gl_Position.z = _2594;
    out.gl_Position.w = _1588;
    float _2634 = _2624 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2636 = _1298 * _1354;
    float _2638 = _2636;
    float _2640 = _2634;
    float _2642 = _2632;
    float _2644 = _2632;
    if (!_2578)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2646 = _2628;
    float _2648 = _2646;
    float _2650 = _2646;
    if (!_2578)
    {
        _1946 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2652 = _1946;
    out.m_93.x = _2634;
    float _2654 = _2636 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2656 = _2652;
    float _2658 = _2652;
    if (!_2578)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2660 = _2630;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2578)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2666 = _2638;
    float _2668 = _2666;
    float _2670 = _2666;
    if (!_2578)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2672 = _2640;
    bool _2674 = !_2578;
    float _2676 = _2672;
    float _2678 = _2672;
    if (!_2674)
    {
        bool _2680 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2682 = isnan(_1382);
        bool _2684 = _2680 || _2682;
        bool _2686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2688 = _2684 || _2686;
        if (!_2688)
        {
            float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2692 = _1382 + _2690;
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2696 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2694;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2702 = 1.0 / _2696;
            float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2720 = _2692 * _2702;
            float _2722 = precise::clamp(_2720, 0.0, 1.0);
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2728 = fma(_2722, _2700, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2730 = fma(_2722, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2732 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2734 = fma(_2722, _2710, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2736 = fma(_2722, _2714, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2738 = fma(_2722, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2650 = _2732;
            _2678 = _2736;
            _2644 = _2728;
            _2664 = _2734;
            _2658 = _2730;
            _2670 = _2738;
            _2740 = true;
        }
        else
        {
            bool _2742 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2744 = isnan(_1382);
            bool _2746 = _2742 || _2744;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2750 = _2746 || _2748;
            if (!_2750)
            {
                _2642 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2752 = _2642;
            _2644 = _2752;
            if (!_2750)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2754 = _2648;
            _2650 = _2754;
            if (!_2750)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2756 = _2656;
            _2658 = _2756;
            if (!_2750)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2758 = _2662;
            _2664 = _2758;
            if (!_2750)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2760 = _2676;
            _2678 = _2760;
            if (!_2750)
            {
                _2668 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2762 = _2668;
            bool _2764 = !_2750;
            _2670 = _2762;
            if (!_2764)
            {
                bool _2766 = _1382 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2768 = isnan(_1382);
                bool _2770 = _2766 || _2768;
                bool _2772 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2774 = _2770 || _2772;
                if (!_2774)
                {
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2778 = _1382 + _2776;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2782 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2780;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2788 = 1.0 / _2782;
                    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2806 = _2778 * _2788;
                    float _2808 = precise::clamp(_2806, 0.0, 1.0);
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2814 = fma(_2808, _2786, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2816 = fma(_2808, _2812, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2818 = fma(_2808, _2792, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2820 = fma(_2808, _2796, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2822 = fma(_2808, _2800, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2824 = fma(_2808, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2650 = _2818;
                    _2678 = _2822;
                    _2644 = _2814;
                    _2664 = _2820;
                    _2658 = _2816;
                    _2670 = _2824;
                    _2740 = true;
                }
                else
                {
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2644 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2670 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2740 = false;
    float _2826 = _2650;
    float _2828 = _2678;
    float _2830 = _2644;
    float _2832 = _2664;
    float _2834 = _2658;
    float _2836 = _2670;
    float _2838 = _2654 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2840 = fma(_2512, -0.5, 0.5);
    float _2842 = precise::clamp(_2840, 0.0, 1.0);
    float _2844 = -_2826;
    float _2846 = _2844 + _2828;
    float _2848 = -_2830;
    float _2850 = _2848 + _2832;
    out.m_53.x = _2838;
    float _2852 = fma(_2842, _2846, _2826);
    float _2854 = -_2834;
    float _2856 = _2854 + _2836;
    float _2858 = fma(_2842, _2850, _2830);
    float _2860 = _2852 * 0.586610972881317138671875;
    bool _2862 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2864 = fma(_2842, _2856, _2834);
    out.m_95.x = 0.0;
    float _2866 = fma(_2858, 0.298911988735198974609375, _2860);
    bool _2868 = _1298 > 0.0;
    bool _2870 = isnan(_1298);
    bool _2872 = _2868 || _2870;
    bool _2874 = isnan(0.0);
    bool _2876 = _2872 || _2874;
    float _2878 = fma(_2864, 0.114477999508380889892578125, _2866);
    bool _2880 = _1354 <= 0.0;
    bool _2882 = !_2876;
    bool _2884 = _2880 || _2882;
    float _2886 = -_2878;
    float _2888 = _2858 + _2886;
    float _2890 = -_2878;
    float _2892 = _2852 + _2890;
    float _2894 = -_2878;
    float _2896 = _2864 + _2894;
    float _2898 = fma(_2888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2900 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    float _2902 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2878);
    bool _2904 = !_2862;
    if (!_2904)
    {
        float _2906 = -_1236;
        float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2910 = -_1238;
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2914 = -_1240;
        float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2918 = _2908 * _2908;
        float _2920 = fma(_2912, _2912, _2918);
        float _2922 = fma(_2916, _2916, _2920);
        float _2924 = sqrt(_2922);
        float _2926 = rsqrt(_2922);
        float _2928 = -_2924;
        float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2932 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2934 = precise::clamp(_2932, 0.0, 1.0);
        float _2936 = _2912 * _2926;
        float _2938 = _2908 * _2926;
        float _2940 = abs(_2934);
        float _2942 = log2(_2940);
        float _2944 = _2916 * _2926;
        float _2946 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2948 = _2512 * _2938;
        float _2950 = -_2938;
        float _2952 = -_2946;
        float _2954 = fma(_2950, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2952);
        float _2956 = fma(_2430, _2936, _2948);
        float _2958 = -_2944;
        float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2954);
        float _2962 = fma(_2520, _2944, _2956);
        float _2964 = precise::clamp(_2962, 0.0, 1.0);
        float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2968 = _2960 + _2966;
        float _2970 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2974 = precise::clamp(_2972, 0.0, 1.0);
        float _2976 = exp2(_2970);
        float _2978 = _2976 * _2974;
        float _2980 = _2964 * _2978;
        float _2982 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2984 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2986 = _2980 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2982;
        out.m_95.y = _2984;
        out.m_95.z = _2986;
    }
    out.m_67.x = _2898;
    out.m_67.y = _2900;
    out.m_67.z = _2902;
    if (!_2884)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.dm_pad2.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.dm_pad2.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.dm_pad2.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.dm_pad2.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2988 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2988;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.dm_pad2.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.dm_pad2.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.dm_pad2.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.dm_pad2.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

