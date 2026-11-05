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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
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
    float4 m_65 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_103 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_99 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_87 [[attribute(0)]];
    float4 m_55 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
    float4 m_79 [[attribute(12)]];
    float4 m_71 [[attribute(13)]];
    float4 m_73 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2455 = false;
    bool _620 = false;
    bool _466 = false;
    bool _244 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_49.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2754 = as_type<float>(_138);
        out.gl_Position.z = _2754;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_51.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_49.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2823 = as_type<float>(_176);
        out.gl_Position.z = _2823;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_55.x;
    float _188 = in.m_55.y;
    float _190 = in.m_55.z;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = _180 * _188;
    float _206 = _180 * _194;
    float _208 = fma(_178, _186, _204);
    float _210 = _180 * _200;
    float _212 = fma(_178, _192, _206);
    float _214 = fma(_178, _198, _210);
    float _216 = fma(_182, _190, _208);
    float _218 = fma(_182, _196, _212);
    float _220 = fma(_182, _202, _214);
    bool _222 = !_184;
    float _224 = _218;
    float _242;
    if (!_222)
    {
        float _226 = in.m_61.x;
        float _228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _232 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _234 = _232 * _228;
        float _236 = floor(_234);
        float _238 = -_236;
        float _240 = _234 + _238;
        _242 = _240;
        _244 = true;
    }
    else
    {
        float _246 = float(_122);
        float _248 = 1.0 / _246;
        float _250 = _156 * _248;
        _242 = _250;
    }
    _244 = false;
    float _252 = _242;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = _252 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = _252 + _258;
    bool _262 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _264 = isnan(_252);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _252 + _286;
    float _290 = 1.0 / _276;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = 1.0 / _284;
    float _296 = 1.0 / _280;
    float _298 = _256 * _290;
    bool _300 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _302 = isnan(_252);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -_310;
    float _314 = _312 + 1.0;
    float _316 = _260 * _294;
    bool _318 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_252);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = _272 * _314;
    bool _336 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_252);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -_328;
    float _354 = _352 + 1.0;
    float _356 = -_272;
    float _358 = _356 + 1.0;
    float _360 = _288 * _296;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = _346 * _354;
    float _372 = fma(_332, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = fma(_364, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = fma(_368, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _378 = _328 * _358;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _384 = _374 * _370;
    float _386 = _376 * _370;
    float _388 = -_346;
    float _390 = _388 + 1.0;
    float _392 = _372 * _370;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _400 = fma(_350, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _402 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _392);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = fma(_396, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _410 = fma(_382, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _384);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _418;
    float _422 = fma(_400, _378, _398);
    float _424 = fma(_406, _316, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _426 = fma(_416, _316, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _428 = fma(_420, _316, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _430 = fma(_408, _378, _412);
    float _432 = fma(_410, _378, _402);
    float _434 = fma(_424, _334, _422);
    float _436 = fma(_426, _334, _430);
    float _438 = fma(_428, _334, _432);
    float _440 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].x, _434);
    float _442 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].y, _436);
    float _444 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].z, _438);
    bool _446 = !_292;
    float _464;
    if (!_446)
    {
        float _448 = in.m_61.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_122);
        float _470 = 1.0 / _468;
        float _472 = _156 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = isnan(_474);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _496 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _498 = isnan(_474);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = 1.0 / _478;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _510;
    float _514 = -_490;
    float _516 = _514 + 1.0;
    bool _518 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = isnan(_474);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    bool _530 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _532 = _506 * _516;
    float _534 = -_506;
    float _536 = _534 + 1.0;
    float _538 = 1.0 / _494;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = _512 * _508;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _474 + _546;
    float _550 = -_528;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _556 = _474 + _554;
    float _558 = fma(_544, _548, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _490 * _552;
    float _562 = _542 * _538;
    float _564 = _558 * _532;
    float _566 = fma(_562, _556, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[115].x, _564);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = fma(_566, _560, _568);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _576 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[117].x, _572);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = in.m_63.x;
    float _586 = in.m_63.y;
    float _588 = in.m_63.z;
    float _590 = _578 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _592 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _582;
    out.m_65.y = _576;
    out.m_65.z = _592;
    out.m_65.w = _590;
    float _594 = _444 * _588;
    float _596 = _442 * _586;
    float _598 = _440 * _584;
    bool _600 = !_530;
    float _618;
    if (!_600)
    {
        float _602 = in.m_61.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_122);
        float _624 = 1.0 / _622;
        float _626 = _156 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_61.z;
    float _632 = in.m_61.x;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _636 = _634 != 0;
    float _638 = in.m_61.y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _644 = in.m_55.w;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _656 = _654 != 0;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _662 = _630 * 2.0;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _668 = _632 * 2.0;
    float _670 = _632 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _672 = floor(_662);
    float _674 = _638 * 2.0;
    float _676 = -_640;
    float _678 = fma(_670, 2.0, _676);
    float _680 = _638 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _682 = _632 + _638;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _686 = !_652;
    int _688 = _686 ? 0 : 1;
    float _690 = floor(_668);
    float _692 = fma(_680, -2.0, _642);
    float _694 = _682 + (-1.0);
    float _696 = _680;
    float _698 = _682;
    int _700 = as_type<int>(_628);
    if (!_636)
    {
        _696 = _638;
    }
    float _702 = _696;
    float _704 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[78].z, _684);
    float _706 = _702;
    if (!_636)
    {
        _698 = _630;
    }
    float _708 = _698;
    float _710 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _712 = _708;
    if (_636)
    {
        _706 = _632;
    }
    float _714 = _706;
    float _716 = floor(_674);
    bool _718 = _672 > 0.0;
    float _720 = -_156;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[76].x, _678);
    bool _724 = _672 >= 0.0;
    bool _726 = isnan(_672);
    bool _728 = _724 || _726;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    float _734 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[83].z, _658);
    float _736 = _672;
    if (!_636)
    {
        _736 = _630;
    }
    float _738 = _736;
    float _740 = _714 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _742 = _738;
    if (_636)
    {
        _742 = _638;
    }
    float _744 = _742;
    float _746 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _734);
    if (_636)
    {
        _712 = _638;
    }
    float _748 = _712;
    float _750 = -_664;
    float _752 = fma(_740, 2.0, _750);
    bool _754 = _690 >= 0.0;
    bool _756 = isnan(_690);
    bool _758 = _754 || _756;
    bool _760 = isnan(0.0);
    bool _762 = _758 || _760;
    bool _764 = _690 > 0.0;
    float _766 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[83].w, _660);
    float _768 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _770 = log2(_768);
    int _772 = _732 ? 0 : 1;
    bool _774 = _716 > 0.0;
    int _776 = _762 ? 0 : 1;
    bool _778 = _716 >= 0.0;
    bool _780 = isnan(_716);
    bool _782 = _778 || _780;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    float _788 = _744 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _790 = !_648;
    int _792 = _790 ? 0 : 1;
    int _794 = ~_772;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    float _800 = fma(_788, -2.0, _666);
    int _802 = _786 ? 0 : 1;
    int _804 = abs(_792);
    float _806 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _800);
    int _808 = _798;
    if (!_718)
    {
        int _810 = ~_772;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    float _816 = _770 * _156;
    int _818 = ~_802;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = float(_804);
    float _826 = float(_814);
    int _828 = _822;
    if (!_774)
    {
        int _830 = ~_802;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    int _836 = ~_776;
    int _838 = _836 + 1;
    int _840 = _838 + 1;
    float _842 = _824 * _826;
    int _844 = _840;
    if (!_764)
    {
        int _846 = ~_776;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = _842 * (-2.0);
    float _854 = exp2(_816);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _858 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(1.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = in.m_67.x;
    float _870 = in.m_67.y;
    float _872 = in.m_67.z;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _876 = 1.0 + _874;
    float _878 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[78].w, _856);
    bool _880 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _888 = _884 || _886;
    float _890 = 1.0 / _876;
    int _892 = abs(_688);
    float _894 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _704);
    float _896 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _878);
    bool _898 = !_656;
    int _900 = _898 ? 0 : 1;
    float _902 = float(_834);
    float _904 = -_854;
    float _906 = _904 + 1.0;
    float _908 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _692);
    float _910 = float(_892);
    float _912 = _888 ? _906 : 0.0;
    float _914 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _766);
    float _916 = float(_850);
    float _918 = -_156;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[81].x, _752);
    int _922 = abs(_900);
    float _924 = _896;
    if (_866)
    {
        float _926 = _912 * _890;
        _160 = _926;
    }
    float _928 = _160;
    float _930 = fma(_710, _852, _710);
    float _932 = fma(_852, _868, _868);
    float _934 = _638 + _630;
    float _936 = _632 + (-0.5);
    float _938 = _910 * _916;
    float _940 = _934 + (-1.0);
    float _942 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[196].x, _932);
    float _944 = float(_922);
    float _946 = _938 * (-2.0);
    float _948 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _950 = fma(_930, _928, _942);
    float _952 = _944 * _902;
    float _954 = fma(_948, _946, _948);
    float _956 = fma(_946, _870, _870);
    float _958 = _638 + (-0.5);
    float _960 = _632 + _630;
    float _962 = _952 * (-2.0);
    float _964 = _950 * 0.15915493667125701904296875;
    float _966 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].y, _956);
    float _968 = _960 + (-1.0);
    float _970 = fma(_962, _872, _872);
    float _972 = _964 * 6.283185482025146484375;
    float _974 = sin(_972);
    float _976 = fma(_954, _928, _966);
    float _978 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _980 = in.m_46.x;
    float _982 = in.m_46.y;
    float _984 = in.m_46.z;
    float _986 = _976 * 0.15915493667125701904296875;
    float _988 = _630 + (-0.5);
    float _990 = in.m_69.x;
    float _992 = in.m_69.y;
    float _994 = in.m_69.z;
    float _996 = fma(_978, _962, _978);
    float _998 = _964 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _970);
    float _1004 = _596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1006 = _594 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1008 = fma(_996, _928, _1002);
    float _1010 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1012 = _986 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = _1008 * 0.15915493667125701904296875;
    float _1018 = _986 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _200 * _982;
    float _1024 = _194 * _982;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _992);
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _994);
    float _1030 = _1016 * 6.283185482025146484375;
    float _1032 = cos(_1030);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _990);
    float _1036 = _1026 * _1004;
    float _1038 = fma(_198, _980, _1022);
    float _1040 = _1028 * _1006;
    float _1042 = _1034 * _1010;
    float _1044 = _1000 * _1014;
    float _1046 = fma(_202, _984, _1038);
    float _1048 = _1016 * 6.283185482025146484375;
    float _1050 = sin(_1048);
    float _1052 = _1000 * _1020;
    float _1054 = _974 * _1020;
    float _1056 = fma(_192, _980, _1024);
    float _1058 = fma(_196, _984, _1056);
    float _1060 = _1000 * _1032;
    float _1062 = _974 * _1014;
    float _1064 = _1020 * _1032;
    float _1066 = _974 * _1032;
    float _1068 = _1014 * _1032;
    float _1070 = in.m_59.w;
    float _1072 = _1060 * _1036;
    float _1074 = _1066 * _1036;
    float _1076 = fma(_1050, _1052, _1062);
    float _1078 = -_1036;
    float _1080 = _1050 * _1078;
    float _1082 = -_1054;
    float _1084 = fma(_1050, _1044, _1082);
    float _1086 = fma(_1050, _1062, _1052);
    float _1088 = fma(_1076, _1042, _1072);
    float _1090 = -_1044;
    float _1092 = fma(_1050, _1054, _1090);
    float _1094 = fma(_1064, _1042, _1080);
    float _1096 = fma(_1084, _1040, _1088);
    float _1098 = fma(_1092, _1042, _1074);
    float _1100 = fma(_1068, _1040, _1094);
    float _1102 = _188 * _982;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1106 = fma(_1086, _1040, _1098);
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1110 = fma(_186, _980, _1102);
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1104);
    float _1114 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1116 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1108);
    float _1118 = fma(_190, _984, _1110);
    float _1120 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1112);
    float _1122 = _1046 + _1070;
    float _1124 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1116);
    float _1126 = _1118 + _644;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1130 = in.m_57.w;
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1134 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1114);
    float _1136 = _1122 + _1128;
    float _1138 = _1126 + _1132;
    float _1140 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1134);
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1144 = _1136 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1148 = _1138 + _1146;
    float _1150 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1152 = _1144 * _1144;
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = sqrt(_1154);
    float _1158 = _1058 + _1130;
    float _1160 = _1158 + _1150;
    bool _1162 = _1156 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1130;
    float _1166 = _1138;
    float _1168 = _1100;
    float _1170 = _1154;
    int _1172 = as_type<int>(_1158);
    float _1174 = _1122;
    if (!_1162)
    {
        _1164 = _1138;
    }
    float _1176 = _1164;
    float _1178 = _1176;
    if (!_1162)
    {
        _1166 = _1136;
    }
    float _1180 = _1166;
    float _1182 = _1180;
    if (!_1162)
    {
        _1168 = _1160;
    }
    float _1184 = _1168;
    bool _1186 = !_1162;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1194 = _1156 + _1192;
        float _1196 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = rsqrt(_1154);
        float _1200 = _1194 * _1190;
        float _1202 = _1200 * 0.15915493667125701904296875;
        float _1204 = _1202 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        float _1208 = _1202 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = _1206 + (-1.0);
        float _1214 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = fma(_1210, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1218 = fma(_1160, _1206, _1214);
        float _1220 = _1198 * _1216;
        float _1222 = fma(_1148, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1224 = fma(_1144, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1188 = _1218;
        _1178 = _1222;
        _1182 = _1224;
        _1170 = _1198;
    }
    float _1226 = _1188;
    float _1228 = _1178;
    float _1230 = _1182;
    float _1232 = _1170;
    float _1234 = -_1158;
    float _1236 = _1234 + _1226;
    float _1238 = -_1126;
    float _1240 = _1238 + _1228;
    float _1242 = -_1122;
    float _1244 = _1242 + _1230;
    float _1246 = _1236 * _1236;
    float _1248 = fma(_1240, _1240, _1246);
    float _1250 = fma(_1244, _1244, _1248);
    float _1252 = sqrt(_1250);
    bool _1254 = _1252 > 0.0;
    bool _1256 = !_1254;
    float _1258 = _1226;
    float _1260 = _1228;
    float _1262 = _1230;
    float _1264 = _1240;
    float _1266 = _1232;
    if (!_1256)
    {
        float _1268 = _218 * _218;
        float _1270 = fma(_216, _216, _1268);
        float _1272 = fma(_220, _220, _1270);
        float _1274 = rsqrt(_1250);
        float _1276 = sqrt(_1272);
        float _1278 = _1240 * _1274;
        float _1280 = _1236 * _1274;
        float _1282 = _1244 * _1274;
        bool _1284 = _1276 > 0.0;
        bool _1286 = !_1284;
        _1264 = _1280;
        _1266 = _1278;
        if (!_1286)
        {
            float _1288 = rsqrt(_1272);
            float _1290 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1292 = _218 * _1288;
            float _1294 = _216 * _1288;
            float _1296 = _220 * _1288;
            float _1298 = _1280 * _1292;
            float _1300 = fma(_1278, _1294, _1298);
            float _1302 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1304 = fma(_1282, _1296, _1300);
            float _1306 = _1304 * _1302;
            float _1308 = fma(_216, _1306, _1228);
            float _1310 = fma(_218, _1306, _1226);
            float _1312 = fma(_220, _1306, _1230);
            _1258 = _1310;
            _1260 = _1308;
            _1262 = _1312;
            _1264 = _1300;
        }
    }
    float _1314 = _1258;
    float _1316 = _1260;
    float _1318 = _1262;
    float _1320 = _1264;
    float _1322 = _1266;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1326 = _1314 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1330 = _1316 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1334 = _1318 + _1332;
    float _1336 = _1326 * _1326;
    float _1338 = fma(_1330, _1330, _1336);
    float _1340 = fma(_1334, _1334, _1338);
    float _1342 = rsqrt(_1340);
    float _1344 = sqrt(_1340);
    float _1346 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1348 = _1330 * _1346;
    float _1350 = _1334 * _1346;
    float _1352 = _1348 * _1348;
    float _1354 = _1350 * _1350;
    float _1356 = _1352 + _1354;
    float _1358 = sqrt(_1356);
    bool _1360 = _1358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = _1358 + _1362;
    float _1366 = _1320;
    float _1368 = _1356;
    float _1370 = _1364;
    float _1372 = _1322;
    float _1374 = _1326;
    float _1376 = _1350;
    if (_1360)
    {
        float _1378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1366 = _1378;
    }
    float _1380 = _1366;
    if (_1360)
    {
        float _1382 = rsqrt(_1356);
        _1368 = _1382;
    }
    float _1384 = _1368;
    float _1386 = _1384;
    if (_1360)
    {
        float _1388 = _1364 * _1380;
        _1370 = _1388;
    }
    float _1390 = _1370;
    if (_1360)
    {
        float _1392 = _1390 * 0.15915493667125701904296875;
        _1372 = _1392;
    }
    float _1394 = _1372;
    float _1396 = _1342;
    if (_1360)
    {
        float _1398 = _1394 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        _1396 = _1400;
    }
    float _1402 = _1396;
    float _1404 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1406 = precise::max(0.0, _1404);
    float _1408 = _1380;
    float _1410 = _1406;
    if (_1360)
    {
        float _1412 = _1394 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = -_1346;
    float _1420 = -_1406;
    float _1422 = fma(_1326, _1418, _1420);
    if (_1360)
    {
        float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1424;
    }
    float _1426 = _1374;
    float _1428 = _1402;
    float _1430 = _1426;
    if (_1360)
    {
        float _1432 = fma(_1402, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _224 = _1432;
    }
    float _1434 = _224;
    float _1436 = _1434;
    if (!_1360)
    {
        _1428 = _1348;
    }
    float _1438 = _1428;
    float _1440 = _1438;
    if (!_1360)
    {
        _1430 = _1422;
    }
    float _1442 = _1430;
    float _1444 = _1442;
    float _1446 = _1416;
    if (_1360)
    {
        float _1448 = _1416 + (-1.0);
        _1410 = _1448;
    }
    float _1450 = _1410;
    float _1452 = _1450;
    if (_1360)
    {
        float _1454 = _1384 * _1434;
        _1436 = _1454;
    }
    float _1456 = _1436;
    if (!_1360)
    {
        _1386 = _1352;
    }
    float _1458 = _1386;
    float _1460 = _1458;
    if (_1360)
    {
        float _1462 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1462;
    }
    float _1464 = _1452;
    if (_1360)
    {
        float _1466 = _1348 * _1456;
        _1440 = _1466;
    }
    float _1468 = _1440;
    if (_1360)
    {
        float _1470 = _1350 * _1456;
        _1376 = _1470;
    }
    float _1472 = _1376;
    float _1474 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1360)
    {
        float _1476 = fma(_1422, _1416, _1464);
        _1444 = _1476;
    }
    float _1478 = _1444;
    if (_1360)
    {
        float _1480 = _1468 * _1468;
        _1460 = _1480;
    }
    float _1482 = _1460;
    if (!_1360)
    {
        _1446 = _1354;
    }
    float _1484 = _1446;
    float _1486 = _1484;
    if (_1360)
    {
        float _1488 = _1472 * _1472;
        _1486 = _1488;
    }
    float _1490 = _1486;
    float _1492 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1474);
    float _1494 = fma(_1478, _1478, _1482);
    float _1496 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1498 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1492);
    float _1500 = _1494 + _1490;
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1504 = fma(_1344, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1502);
    float _1506 = precise::clamp(_1504, 0.0, 1.0);
    float _1508 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1510 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1512 = rsqrt(_1500);
    float _1514 = -_1506;
    float _1516 = _1514 + 1.0;
    float _1518 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1520 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1522 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1518);
    float _1524 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1496);
    float _1526 = abs(_1516);
    float _1528 = log2(_1526);
    float _1530 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1532 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1522);
    float _1534 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1536 = fma(_1122, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1538 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1530);
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = -_1520;
    float _1544 = fma(_1542, _1534, 1.0);
    float _1546 = _1512 * _1468;
    float _1548 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1538);
    float _1550 = floor(_1508);
    float _1552 = _1512 * _1478;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1556 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1558 = _1512 * _1472;
    float _1560 = -_1554;
    float _1562 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1560);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1566 = floor(_1536);
    float _1568 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1570 = -_1558;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1562);
    float _1574 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1524);
    float _1576 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1564);
    float _1578 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1580 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1582 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1584 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1576);
    float _1586 = exp2(_1568);
    float _1588 = -_1550;
    float _1590 = _1508 + _1588;
    float _1592 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1578);
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1584);
    float _1596 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1580);
    float _1598 = _1552 + 1.0;
    float _1600 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1592);
    float _1602 = -_1566;
    float _1604 = _1536 + _1602;
    float _1606 = log2(_1544);
    float _1608 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1596);
    float _1610 = 1.0 / _1594;
    float _1612 = fma(_1572, -0.5, 0.5);
    float _1614 = fma(_1572, 0.5, 0.5);
    float _1616 = -_1552;
    float _1618 = fma(_1586, _1598, _1616);
    float _1620 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1600);
    float _1622 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1608);
    float _1624 = fma(_1614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _5117 = float2(_1590, _1604);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5117, float2(0.0), isnan(_5117)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5117, float2(0.0), isnan(_5117)), level(0.0)).x;
    float _1628 = sqrt(_1612);
    float _1630 = fma(_1618, 0.5, 0.5);
    float _1632 = fma(_1614, _1624, -0.212114393711090087890625);
    float _1634 = fma(_1614, _1632, 1.570728778839111328125);
    float _1636 = _1606 * 0.693147182464599609375;
    float _1638 = _1622 * _1610;
    float _1640 = _1620 * _1610;
    float _1642 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1644 = fma(_1638, -0.5, 0.5);
    float _1646 = fma(_1640, 0.5, 0.5);
    float _1648 = _1628 * 0.636619746685028076171875;
    float3 _5160 = float3(_1646, _1644, _1642);
    float _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5160, float3(0.0), isnan(_5160)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5160, float3(0.0), isnan(_5160)), level(0.0)).x;
    float _1652 = -_1634;
    float _1654 = fma(_1648, _1652, 1.0);
    float3 _5176 = float3(_1646, _1644, _1642);
    float4 _1657 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5176, float3(0.0), isnan(_5176)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5176, float3(0.0), isnan(_5176)), level(0.0)).xyzw;
    float _1659 = _1657.x;
    float _1661 = _1657.y;
    float _1663 = _1657.z;
    float _1665 = _1657.w;
    float2 _5192 = float2(_1654, _1630);
    float3 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5192, float2(0.0), isnan(_5192)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5192, float2(0.0), isnan(_5192)), level(0.0)).xyz;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = in.m_61.w;
    bool _1679 = _630 > 0.5;
    float _1681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1683 = in.m_71.y;
    bool _1685 = _638 > 0.5;
    float _1687 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1689 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1693 = _1691 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1695 = in.m_73.x;
    float _1697 = in.m_73.w;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1701 = _1699 != 0;
    float _1703 = 1.0 / _1693;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1707 = _1705 != 0;
    float _1709 = in.m_73.z;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1713 = _1711 != 0;
    float _1715 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1689);
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1719 = _1717 != 0;
    float _1721 = in.m_73.y;
    bool _1723 = _1677 > 0.5;
    float _1725 = exp2(_1687);
    float _1727 = in.m_71.x;
    float _1729 = -_1683;
    float _1731 = _1729 + 1.0;
    float _1733 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1715);
    float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1735;
    int _1739 = _1723 ? as_type<int>(_1731) : as_type<int>(_1683);
    out.m_75.x = _1695;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1743 = _1741 != 0;
    float _1745 = _1737 * _1703;
    float _1747 = _1701 ? as_type<float>(_1739) : _1683;
    out.m_75.w = _1697;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1751 = _1749 != 0;
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1755 = _628 + _1753;
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1759 = _1685 ? as_type<int>(_1731) : as_type<int>(_1683);
    float _1761 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1763 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1765 = isnan(_628);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    out.m_75.z = _1709;
    float _1775 = _1719 ? as_type<float>(_1759) : _1683;
    float _1777 = fma(_1745, _1755, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1779 = _1719;
    float _1781 = _1755;
    float _1783 = _1683;
    int _1785 = _1759;
    float _1787 = _1622;
    float _1789 = _1620;
    if (_1707)
    {
        bool _1791 = _632 > 0.5;
        _1779 = _1791;
    }
    bool _1793 = _1779;
    out.m_75.y = _1721;
    float _1795 = fma(_1747, _1761, -0.5);
    float _1797 = _1727;
    if (!_1707)
    {
        _1781 = _1727;
    }
    float _1799 = _1781;
    float _1801 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1803 = _1799;
    if (_1751)
    {
        float _1805 = _1679 ? _1731 : _1683;
        _1783 = _1805;
    }
    float _1807 = _1783;
    float _1809 = -_1773;
    float _1811 = _1809 + 1.0;
    bool _1813 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1815 = isnan(_628);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = _1823;
    if (_1707)
    {
        float _1827 = -_1727;
        float _1829 = _1827 + 1.0;
        _700 = as_type<int>(_1829);
    }
    int _1831 = _700;
    float _1833 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1835 = _992 != 0.0;
    bool _1837 = isnan(_992);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(0.0);
    bool _1843 = _1839 || _1841;
    float _1845 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1801);
    float _1847 = _1823 * _1811;
    float _1849 = fma(_1833, _1775, -0.5);
    float _1851 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1853 = in.m_77.x;
    float _1855 = in.m_77.y;
    float _1857 = in.m_77.z;
    bool _1859 = _990 == 0.0;
    bool _1861 = !_1843;
    bool _1863 = _1859 && _1861;
    float _1865 = _1777 * _1847;
    float _1867 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1851);
    float _1869 = _1867;
    if (_1707)
    {
        float _1871 = _1793 ? as_type<float>(_1831) : _1727;
        _1803 = _1871;
    }
    float _1873 = _1803;
    if (_1713)
    {
        float _1875 = -_1727;
        float _1877 = _1875 + 1.0;
        _1172 = as_type<int>(_1877);
    }
    int _1879 = _1172;
    bool _1881 = _994 == 0.0;
    bool _1883 = _1881 && _1863;
    float _1885 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1867);
    float _1887 = -_908;
    float _1889 = fma(_896, _1849, _1887);
    float _1891 = as_type<float>(_1879);
    if (!_1713)
    {
        _924 = _1727;
    }
    float _1893 = _924;
    float _1895 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1845);
    float _1897 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1899 = _1893;
    float _1901 = _1895;
    float _1903 = _1897;
    if (_1713)
    {
        float _1905 = _1685 ? as_type<float>(_1879) : _1727;
        _1899 = _1905;
    }
    float _1907 = _1899;
    float _1909 = -_1823;
    float _1911 = _1909 + 1.0;
    float _1913 = _1907;
    if (_1743)
    {
        float _1915 = -_1727;
        float _1917 = _1915 + 1.0;
        _1785 = as_type<int>(_1917);
    }
    int _1919 = _1785;
    float _1921 = 1.0 / _1897;
    if (!_1743)
    {
        _1869 = _1727;
    }
    float _1923 = _1869;
    float _1925 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1865);
    float _1927 = -_806;
    float _1929 = fma(_914, _1795, _1927);
    float _1931 = _1923;
    if (_1743)
    {
        float _1933 = _1679 ? as_type<float>(_1919) : _1727;
        _1931 = _1933;
    }
    float _1935 = _1931;
    float _1937 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1925);
    bool _1939 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1941 = isnan(0.5);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1947 = _1943 || _1945;
    float _1949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1883)
    {
        _1891 = _1853;
    }
    float _1951 = _1891;
    float _1953 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1733);
    float _1955 = _1951;
    if (_1883)
    {
        _1797 = _1855;
    }
    float _1957 = _1797;
    float _1959 = -_1725;
    float _1961 = _1959 + 1.0;
    float _1963 = _1957;
    if (_1883)
    {
        _1174 = _1951;
    }
    float _1965 = _1174;
    float _1967 = _1965;
    if (!_1883)
    {
        _1955 = _1853;
    }
    float _1969 = _1955;
    float _1971 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1973 = _1969;
    if (_1883)
    {
        _1825 = _1857;
    }
    float _1975 = _1825;
    float _1977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1979 = _1975;
    if (_1883)
    {
        _1901 = _1957;
    }
    float _1981 = _1901;
    float _1983 = _1971 + _1897;
    float _1985 = _1981;
    if (_1883)
    {
        _1903 = _1975;
    }
    float _1987 = _1903;
    float _1989 = _1987;
    if (!_1883)
    {
        float _1991 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1969);
        _1967 = _1991;
    }
    float _1993 = _1967;
    if (!_1883)
    {
        _1963 = _1855;
    }
    float _1995 = _1963;
    float _1997 = _1983 * _1921;
    float _1999 = _1997 * 0.5;
    if (!_1883)
    {
        _1979 = _1857;
    }
    float _2001 = _1979;
    float _2003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2005 = in.m_79.x;
    float _2007 = in.m_79.y;
    float _2009 = in.m_79.z;
    float _2011 = in.m_79.w;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2015 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2013);
    float _2017 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2019 = _2015;
    if (!_1883)
    {
        float _2021 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1995);
        _1985 = _2021;
    }
    float _2023 = _1985;
    float _2025 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_1883)
    {
        float _2027 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2001);
        _1989 = _2027;
    }
    float _2029 = _1989;
    float _2031 = fma(_2017, _1873, -0.5);
    float _2033 = 1.0 / _2015;
    float _2035 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2037 = fma(_894, _2031, _722);
    float _2039 = fma(_2035, _1935, -0.5);
    bool _2041 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2043 = isnan(_1344);
    bool _2045 = _2041 || _2043;
    bool _2047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2049 = _2045 || _2047;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2053 = _2025 * _2003;
    float _2055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2057 = fma(_746, _2039, _920);
    if (!_1947)
    {
        _2019 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2059 = _2019;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2063 = _2051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1620;
    out.gl_Position.y = _1622;
    out.gl_Position.z = _1953;
    out.gl_Position.w = _1594;
    float _2065 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2067 = _2033 * _2065;
    float _2069 = _2009 * _1969;
    float _2071 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2073 = _2059;
    if (!_1947)
    {
        float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2077 = _2059 + _2075;
        _2073 = _2077;
    }
    float _2079 = _2073;
    float _2081 = abs(_2067);
    float _2083 = log2(_2081);
    float _2085 = -_2069;
    float _2087 = fma(_2005, _2001, _2085);
    float _2089 = _2007 * _2001;
    float _2091 = _2005 * _1995;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2095 = _2071 * _2055;
    float _2097 = -_2089;
    float _2099 = fma(_2009, _1995, _2097);
    float _2101 = _1889 + 0.5;
    float _2103 = _1995;
    if (!_1947)
    {
        float _2105 = 1.0 / _2079;
        _2103 = _2105;
    }
    float _2107 = _2103;
    float _2109 = _1929 + 0.5;
    float _2111 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2113 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2115 = _1937 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2117 = -_2091;
    float _2119 = fma(_2007, _1969, _2117);
    out.m_81.x = _2095;
    out.m_81.y = _2053;
    if (!_1947)
    {
        float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2123 = _2067 + _2121;
        _1973 = _2123;
    }
    float _2125 = _1973;
    float _2127 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_1947)
    {
        _1913 = 1.0;
    }
    float _2129 = _1913;
    out.m_83.x = _2111;
    out.m_83.y = _2113;
    out.m_83.z = _2063;
    out.m_83.w = _2115;
    float _2131 = _2057 + 0.5;
    float _2133 = _2037 + 0.5;
    float _2135 = exp2(_2127);
    float _2137 = _2087 * _2011;
    float _2139 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2141 = _2129;
    if (!_1947)
    {
        float _2143 = _2125 * _2107;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        _2141 = _2145;
    }
    float _2147 = _2141;
    out.m_85.x = _2133;
    out.m_85.y = _2101;
    out.m_85.z = _2131;
    out.m_85.w = _2109;
    float _2149 = _2099 * _2011;
    float _2151 = _2119 * _2011;
    bool _2153 = _2067 <= 8000.0;
    bool _2155 = isnan(_2067);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan(8000.0);
    bool _2161 = _2157 || _2159;
    float _2163 = float(_2161);
    float _2165 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2167 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2169 = -_1050;
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2139);
    float _2173 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2175 = -_1050;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2165);
    float _2179 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2181 = -_1050;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2167);
    float _2185 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2187 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2173);
    float _2189 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2179);
    float _2191 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2193 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2195 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2185);
    float _2201 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2203 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2171);
    float _2205 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2177);
    float _2207 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2183);
    float _2209 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2191);
    float _2211 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2193);
    float _2213 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2187);
    float _2215 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2189);
    float _2217 = fma(_2197, -2.0, 3.0);
    float _2219 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2201);
    float _2221 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2199);
    float _2223 = _2197 * _2197;
    float _2225 = _2203 * _2007;
    float _2227 = _2205 * _2007;
    float _2229 = _2207 * _2007;
    float _2231 = _2203 * _2023;
    float _2233 = _2205 * _2023;
    float _2235 = _2137 * _2203;
    float _2237 = _2207 * _2023;
    float _2239 = _2137 * _2205;
    float _2241 = _2137 * _2207;
    float _2243 = _2223 * _2217;
    float _2245 = fma(_2213, _1993, _2231);
    float _2247 = fma(_2215, _1993, _2233);
    float _2249 = fma(_2213, _2005, _2225);
    float _2251 = fma(_2149, _2213, _2235);
    float _2253 = fma(_2221, _1993, _2237);
    float _2255 = fma(_2215, _2005, _2227);
    float _2257 = fma(_2221, _2005, _2229);
    float _2259 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2209);
    float _2261 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2211);
    float _2263 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2219);
    float _2265 = fma(_2149, _2215, _2239);
    float _2267 = fma(_2149, _2221, _2241);
    float _2269 = fma(_2151, _2259, _2251);
    float _2271 = -_2243;
    float _2273 = _2271 + 1.0;
    float _2275 = fma(_2151, _2261, _2265);
    float _2277 = fma(_2151, _2263, _2267);
    float _2279 = fma(_2259, _2009, _2249);
    float _2281 = in.m_87.x;
    float _2283 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2243);
    float _2285 = fma(_2261, _2009, _2255);
    float _2287 = fma(_2263, _2009, _2257);
    float _2289 = fma(_2261, _2029, _2247);
    float _2291 = _2163 * _2283;
    float _2293 = fma(_2263, _2029, _2253);
    float _2295 = _1953 + _1594;
    float _2297 = _1620 + _1594;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2301 = _1594 * 0.5;
    out.m_89.x = _2279;
    out.m_89.y = _2285;
    out.m_89.z = _2287;
    float _2303 = fma(_2259, _2029, _2245);
    float _2305 = _2295 * 0.5;
    float _2307 = _2297 * 0.5;
    float _2309 = fma(_1622, -0.5, _2301);
    out.m_91.x = _2269;
    out.m_91.y = _2275;
    out.m_91.z = _2277;
    float _2311 = _2147 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2313 = _2287;
    if (!_2049)
    {
        _1787 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2315 = _1787;
    out.m_93.x = _2307;
    out.m_93.y = _2309;
    out.m_93.z = _2305;
    out.m_93.w = _1594;
    float _2317 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2319 = _2317;
    float _2321 = _2315;
    float _2323 = _2315;
    if (!_2049)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2325 = _1789;
    out.m_95.x = _2303;
    out.m_95.y = _2289;
    out.m_95.z = _2293;
    float _2327 = -_2317;
    float _2329 = _2327 + 1.0;
    float _2331 = _2329;
    float _2333 = _2325;
    float _2335 = _2325;
    if (!_2049)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2337 = _2313;
    float _2339 = -_1626;
    float _2341 = _2339 + 1.0;
    float _2343 = _2341 * _2299;
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2345;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2351 = _2349 * _2281;
    float _2353 = _2281;
    float _2355 = _2337;
    float _2357 = _2337;
    if (!_2049)
    {
        _2353 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2359 = _2353;
    float _2361 = _2351 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2363 = _2317 * _1650;
    float _2365 = _2359;
    float _2367 = _2359;
    if (!_2049)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2369 = _2319;
    out.m_97.x = _2361;
    float _2371 = _1665 * _2363;
    float _2373 = _1665 * _2329;
    float _2375 = _2369;
    float _2377 = _2369;
    if (!_2049)
    {
        _2331 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2379 = _2331;
    float _2381 = _1675 * _2363;
    float _2383 = fma(_1671, _2371, _1659);
    float _2385 = fma(_1673, _2371, _1661);
    float _2387 = fma(_1665, _2381, _1663);
    out.m_99.x = _2383;
    out.m_99.y = _2385;
    out.m_99.z = _2387;
    out.m_99.w = _2373;
    bool _2389 = !_2049;
    float _2391 = _2379;
    float _2393 = _2379;
    if (!_2389)
    {
        bool _2395 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2397 = isnan(_1344);
        bool _2399 = _2395 || _2397;
        bool _2401 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2403 = _2399 || _2401;
        if (!_2403)
        {
            float _2405 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2407 = _1344 + _2405;
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2411 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2409;
            float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2417 = 1.0 / _2411;
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2435 = _2407 * _2417;
            float _2437 = precise::clamp(_2435, 0.0, 1.0);
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2443 = fma(_2437, _2415, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2445 = fma(_2437, _2441, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2447 = fma(_2437, _2421, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2449 = fma(_2437, _2425, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2451 = fma(_2437, _2429, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2453 = fma(_2437, _2433, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2335 = _2447;
            _2377 = _2451;
            _2323 = _2443;
            _2357 = _2449;
            _2367 = _2445;
            _2393 = _2453;
            _2455 = true;
        }
        else
        {
            bool _2457 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2459 = isnan(_1344);
            bool _2461 = _2457 || _2459;
            bool _2463 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2465 = _2461 || _2463;
            if (!_2465)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2467 = _2321;
            _2323 = _2467;
            if (!_2465)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2469 = _2333;
            _2335 = _2469;
            if (!_2465)
            {
                _2365 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2471 = _2365;
            _2367 = _2471;
            if (!_2465)
            {
                _2355 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2473 = _2355;
            _2357 = _2473;
            if (!_2465)
            {
                _2375 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2475 = _2375;
            _2377 = _2475;
            if (!_2465)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2477 = _2391;
            bool _2479 = !_2465;
            _2393 = _2477;
            if (!_2479)
            {
                bool _2481 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2483 = isnan(_1344);
                bool _2485 = _2481 || _2483;
                bool _2487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2489 = _2485 || _2487;
                if (!_2489)
                {
                    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2493 = _1344 + _2491;
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2497 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2495;
                    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2503 = 1.0 / _2497;
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2521 = _2493 * _2503;
                    float _2523 = precise::clamp(_2521, 0.0, 1.0);
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2529 = fma(_2523, _2501, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2531 = fma(_2523, _2527, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2533 = fma(_2523, _2507, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2535 = fma(_2523, _2511, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2537 = fma(_2523, _2515, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2539 = fma(_2523, _2519, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2335 = _2533;
                    _2377 = _2537;
                    _2323 = _2529;
                    _2357 = _2535;
                    _2367 = _2531;
                    _2393 = _2539;
                    _2455 = true;
                }
                else
                {
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2377 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2357 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2367 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2455 = false;
    float _2541 = _2335;
    float _2543 = _2377;
    float _2545 = _2323;
    float _2547 = _2357;
    float _2549 = _2367;
    float _2551 = _2393;
    float _2553 = fma(_2289, -0.5, 0.5);
    float _2555 = precise::clamp(_2553, 0.0, 1.0);
    float _2557 = -_2541;
    float _2559 = _2557 + _2543;
    float _2561 = _2311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2563 = -_2545;
    float _2565 = _2563 + _2547;
    float _2567 = fma(_2555, _2559, _2541);
    out.m_101.x = 0.0;
    float _2569 = -_2549;
    float _2571 = _2569 + _2551;
    float _2573 = fma(_2555, _2565, _2545);
    float _2575 = _2567 * 0.586610972881317138671875;
    out.m_49.x = _2561;
    bool _2577 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2579 = fma(_2555, _2571, _2549);
    float _2581 = fma(_2573, 0.298911988735198974609375, _2575);
    bool _2583 = _2147 > 0.0;
    bool _2585 = isnan(_2147);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan(0.0);
    bool _2591 = _2587 || _2589;
    float _2593 = fma(_2579, 0.114477999508380889892578125, _2581);
    float _2595 = -_2593;
    float _2597 = _2573 + _2595;
    float _2599 = -_2593;
    float _2601 = _2567 + _2599;
    float _2603 = -_2593;
    float _2605 = _2579 + _2603;
    float _2607 = fma(_2597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2593);
    float _2609 = fma(_2601, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2593);
    float _2611 = fma(_2605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2593);
    bool _2613 = !_2577;
    if (!_2613)
    {
        float _2615 = -_1314;
        float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2619 = -_1316;
        float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2623 = -_1318;
        float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2627 = _2617 * _2617;
        float _2629 = fma(_2621, _2621, _2627);
        float _2631 = fma(_2625, _2625, _2629);
        float _2633 = sqrt(_2631);
        float _2635 = rsqrt(_2631);
        float _2637 = -_2633;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2641 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2643 = precise::clamp(_2641, 0.0, 1.0);
        float _2645 = _2621 * _2635;
        float _2647 = _2617 * _2635;
        float _2649 = abs(_2643);
        float _2651 = log2(_2649);
        float _2653 = _2625 * _2635;
        float _2655 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2657 = _2289 * _2647;
        float _2659 = -_2647;
        float _2661 = -_2655;
        float _2663 = fma(_2659, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2661);
        float _2665 = fma(_2303, _2645, _2657);
        float _2667 = -_2653;
        float _2669 = fma(_2667, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2663);
        float _2671 = fma(_2293, _2653, _2665);
        float _2673 = precise::clamp(_2671, 0.0, 1.0);
        float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2677 = _2669 + _2675;
        float _2679 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2681 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2683 = precise::clamp(_2681, 0.0, 1.0);
        float _2685 = exp2(_2679);
        float _2687 = _2685 * _2683;
        float _2689 = _2673 * _2687;
        float _2691 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2693 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2695 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2691;
        out.m_101.y = _2693;
        out.m_101.z = _2695;
    }
    out.m_103.x = _2607;
    out.m_103.y = _2609;
    out.m_103.z = _2611;
    if (_2591)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2697 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2697;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2455 = false;
    bool _620 = false;
    bool _466 = false;
    bool _244 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_49.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2754 = as_type<float>(_138);
        out.gl_Position.z = _2754;
    }
    if (!_126)
    {
        return out;
    }
    float _142 = in.m_51.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_49.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2823 = as_type<float>(_176);
        out.gl_Position.z = _2823;
    }
    if (_170)
    {
        return out;
    }
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_55.x;
    float _188 = in.m_55.y;
    float _190 = in.m_55.z;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = _180 * _188;
    float _206 = _180 * _194;
    float _208 = fma(_178, _186, _204);
    float _210 = _180 * _200;
    float _212 = fma(_178, _192, _206);
    float _214 = fma(_178, _198, _210);
    float _216 = fma(_182, _190, _208);
    float _218 = fma(_182, _196, _212);
    float _220 = fma(_182, _202, _214);
    bool _222 = !_184;
    float _224 = _218;
    float _242;
    if (!_222)
    {
        float _226 = in.m_61.x;
        float _228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _232 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _234 = _232 * _228;
        float _236 = floor(_234);
        float _238 = -_236;
        float _240 = _234 + _238;
        _242 = _240;
        _244 = true;
    }
    else
    {
        float _246 = float(_122);
        float _248 = 1.0 / _246;
        float _250 = _156 * _248;
        _242 = _250;
    }
    _244 = false;
    float _252 = _242;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = _252 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = _252 + _258;
    bool _262 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _264 = isnan(_252);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _252 + _286;
    float _290 = 1.0 / _276;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = 1.0 / _284;
    float _296 = 1.0 / _280;
    float _298 = _256 * _290;
    bool _300 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _302 = isnan(_252);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -_310;
    float _314 = _312 + 1.0;
    float _316 = _260 * _294;
    bool _318 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_252);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = _272 * _314;
    bool _336 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_252);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -_328;
    float _354 = _352 + 1.0;
    float _356 = -_272;
    float _358 = _356 + 1.0;
    float _360 = _288 * _296;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = _346 * _354;
    float _372 = fma(_332, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = fma(_364, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = fma(_368, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _378 = _328 * _358;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _384 = _374 * _370;
    float _386 = _376 * _370;
    float _388 = -_346;
    float _390 = _388 + 1.0;
    float _392 = _372 * _370;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _400 = fma(_350, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _402 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _392);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = fma(_396, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _410 = fma(_382, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _384);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _418;
    float _422 = fma(_400, _378, _398);
    float _424 = fma(_406, _316, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _426 = fma(_416, _316, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _428 = fma(_420, _316, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _430 = fma(_408, _378, _412);
    float _432 = fma(_410, _378, _402);
    float _434 = fma(_424, _334, _422);
    float _436 = fma(_426, _334, _430);
    float _438 = fma(_428, _334, _432);
    float _440 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].x, _434);
    float _442 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].y, _436);
    float _444 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].z, _438);
    bool _446 = !_292;
    float _464;
    if (!_446)
    {
        float _448 = in.m_61.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_122);
        float _470 = 1.0 / _468;
        float _472 = _156 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = isnan(_474);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _496 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _498 = isnan(_474);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = 1.0 / _478;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _510;
    float _514 = -_490;
    float _516 = _514 + 1.0;
    bool _518 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = isnan(_474);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    bool _530 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _532 = _506 * _516;
    float _534 = -_506;
    float _536 = _534 + 1.0;
    float _538 = 1.0 / _494;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = _512 * _508;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _474 + _546;
    float _550 = -_528;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _556 = _474 + _554;
    float _558 = fma(_544, _548, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _490 * _552;
    float _562 = _542 * _538;
    float _564 = _558 * _532;
    float _566 = fma(_562, _556, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[115].x, _564);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = fma(_566, _560, _568);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _576 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[117].x, _572);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = in.m_63.x;
    float _586 = in.m_63.y;
    float _588 = in.m_63.z;
    float _590 = _578 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _592 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _582;
    out.m_65.y = _576;
    out.m_65.z = _592;
    out.m_65.w = _590;
    float _594 = _444 * _588;
    float _596 = _442 * _586;
    float _598 = _440 * _584;
    bool _600 = !_530;
    float _618;
    if (!_600)
    {
        float _602 = in.m_61.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_122);
        float _624 = 1.0 / _622;
        float _626 = _156 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_61.z;
    float _632 = in.m_61.x;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _636 = _634 != 0;
    float _638 = in.m_61.y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _644 = in.m_55.w;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _656 = _654 != 0;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _662 = _630 * 2.0;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _668 = _632 * 2.0;
    float _670 = _632 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _672 = floor(_662);
    float _674 = _638 * 2.0;
    float _676 = -_640;
    float _678 = fma(_670, 2.0, _676);
    float _680 = _638 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _682 = _632 + _638;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _686 = !_652;
    int _688 = _686 ? 0 : 1;
    float _690 = floor(_668);
    float _692 = fma(_680, -2.0, _642);
    float _694 = _682 + (-1.0);
    float _696 = _680;
    float _698 = _682;
    int _700 = as_type<int>(_628);
    if (!_636)
    {
        _696 = _638;
    }
    float _702 = _696;
    float _704 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[78].z, _684);
    float _706 = _702;
    if (!_636)
    {
        _698 = _630;
    }
    float _708 = _698;
    float _710 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _712 = _708;
    if (_636)
    {
        _706 = _632;
    }
    float _714 = _706;
    float _716 = floor(_674);
    bool _718 = _672 > 0.0;
    float _720 = -_156;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[76].x, _678);
    bool _724 = _672 >= 0.0;
    bool _726 = isnan(_672);
    bool _728 = _724 || _726;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    float _734 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[83].z, _658);
    float _736 = _672;
    if (!_636)
    {
        _736 = _630;
    }
    float _738 = _736;
    float _740 = _714 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _742 = _738;
    if (_636)
    {
        _742 = _638;
    }
    float _744 = _742;
    float _746 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _734);
    if (_636)
    {
        _712 = _638;
    }
    float _748 = _712;
    float _750 = -_664;
    float _752 = fma(_740, 2.0, _750);
    bool _754 = _690 >= 0.0;
    bool _756 = isnan(_690);
    bool _758 = _754 || _756;
    bool _760 = isnan(0.0);
    bool _762 = _758 || _760;
    bool _764 = _690 > 0.0;
    float _766 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[83].w, _660);
    float _768 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _770 = log2(_768);
    int _772 = _732 ? 0 : 1;
    bool _774 = _716 > 0.0;
    int _776 = _762 ? 0 : 1;
    bool _778 = _716 >= 0.0;
    bool _780 = isnan(_716);
    bool _782 = _778 || _780;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    float _788 = _744 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _790 = !_648;
    int _792 = _790 ? 0 : 1;
    int _794 = ~_772;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    float _800 = fma(_788, -2.0, _666);
    int _802 = _786 ? 0 : 1;
    int _804 = abs(_792);
    float _806 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _800);
    int _808 = _798;
    if (!_718)
    {
        int _810 = ~_772;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    float _816 = _770 * _156;
    int _818 = ~_802;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = float(_804);
    float _826 = float(_814);
    int _828 = _822;
    if (!_774)
    {
        int _830 = ~_802;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    int _836 = ~_776;
    int _838 = _836 + 1;
    int _840 = _838 + 1;
    float _842 = _824 * _826;
    int _844 = _840;
    if (!_764)
    {
        int _846 = ~_776;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = _842 * (-2.0);
    float _854 = exp2(_816);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _858 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(1.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = in.m_67.x;
    float _870 = in.m_67.y;
    float _872 = in.m_67.z;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _876 = 1.0 + _874;
    float _878 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[78].w, _856);
    bool _880 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _888 = _884 || _886;
    float _890 = 1.0 / _876;
    int _892 = abs(_688);
    float _894 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _704);
    float _896 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _878);
    bool _898 = !_656;
    int _900 = _898 ? 0 : 1;
    float _902 = float(_834);
    float _904 = -_854;
    float _906 = _904 + 1.0;
    float _908 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _692);
    float _910 = float(_892);
    float _912 = _888 ? _906 : 0.0;
    float _914 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _766);
    float _916 = float(_850);
    float _918 = -_156;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[81].x, _752);
    int _922 = abs(_900);
    float _924 = _896;
    if (_866)
    {
        float _926 = _912 * _890;
        _160 = _926;
    }
    float _928 = _160;
    float _930 = fma(_710, _852, _710);
    float _932 = fma(_852, _868, _868);
    float _934 = _638 + _630;
    float _936 = _632 + (-0.5);
    float _938 = _910 * _916;
    float _940 = _934 + (-1.0);
    float _942 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[196].x, _932);
    float _944 = float(_922);
    float _946 = _938 * (-2.0);
    float _948 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _950 = fma(_930, _928, _942);
    float _952 = _944 * _902;
    float _954 = fma(_948, _946, _948);
    float _956 = fma(_946, _870, _870);
    float _958 = _638 + (-0.5);
    float _960 = _632 + _630;
    float _962 = _952 * (-2.0);
    float _964 = _950 * 0.15915493667125701904296875;
    float _966 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].y, _956);
    float _968 = _960 + (-1.0);
    float _970 = fma(_962, _872, _872);
    float _972 = _964 * 6.283185482025146484375;
    float _974 = sin(_972);
    float _976 = fma(_954, _928, _966);
    float _978 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _980 = in.m_46.x;
    float _982 = in.m_46.y;
    float _984 = in.m_46.z;
    float _986 = _976 * 0.15915493667125701904296875;
    float _988 = _630 + (-0.5);
    float _990 = in.m_69.x;
    float _992 = in.m_69.y;
    float _994 = in.m_69.z;
    float _996 = fma(_978, _962, _978);
    float _998 = _964 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _970);
    float _1004 = _596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1006 = _594 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1008 = fma(_996, _928, _1002);
    float _1010 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1012 = _986 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = _1008 * 0.15915493667125701904296875;
    float _1018 = _986 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _200 * _982;
    float _1024 = _194 * _982;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _992);
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _994);
    float _1030 = _1016 * 6.283185482025146484375;
    float _1032 = cos(_1030);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _990);
    float _1036 = _1026 * _1004;
    float _1038 = fma(_198, _980, _1022);
    float _1040 = _1028 * _1006;
    float _1042 = _1034 * _1010;
    float _1044 = _1000 * _1014;
    float _1046 = fma(_202, _984, _1038);
    float _1048 = _1016 * 6.283185482025146484375;
    float _1050 = sin(_1048);
    float _1052 = _1000 * _1020;
    float _1054 = _974 * _1020;
    float _1056 = fma(_192, _980, _1024);
    float _1058 = fma(_196, _984, _1056);
    float _1060 = _1000 * _1032;
    float _1062 = _974 * _1014;
    float _1064 = _1020 * _1032;
    float _1066 = _974 * _1032;
    float _1068 = _1014 * _1032;
    float _1070 = in.m_59.w;
    float _1072 = _1060 * _1036;
    float _1074 = _1066 * _1036;
    float _1076 = fma(_1050, _1052, _1062);
    float _1078 = -_1036;
    float _1080 = _1050 * _1078;
    float _1082 = -_1054;
    float _1084 = fma(_1050, _1044, _1082);
    float _1086 = fma(_1050, _1062, _1052);
    float _1088 = fma(_1076, _1042, _1072);
    float _1090 = -_1044;
    float _1092 = fma(_1050, _1054, _1090);
    float _1094 = fma(_1064, _1042, _1080);
    float _1096 = fma(_1084, _1040, _1088);
    float _1098 = fma(_1092, _1042, _1074);
    float _1100 = fma(_1068, _1040, _1094);
    float _1102 = _188 * _982;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1106 = fma(_1086, _1040, _1098);
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1110 = fma(_186, _980, _1102);
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1104);
    float _1114 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1116 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1108);
    float _1118 = fma(_190, _984, _1110);
    float _1120 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1112);
    float _1122 = _1046 + _1070;
    float _1124 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1116);
    float _1126 = _1118 + _644;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1130 = in.m_57.w;
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1134 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1114);
    float _1136 = _1122 + _1128;
    float _1138 = _1126 + _1132;
    float _1140 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1134);
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1144 = _1136 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1148 = _1138 + _1146;
    float _1150 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1152 = _1144 * _1144;
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = sqrt(_1154);
    float _1158 = _1058 + _1130;
    float _1160 = _1158 + _1150;
    bool _1162 = _1156 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1130;
    float _1166 = _1138;
    float _1168 = _1100;
    float _1170 = _1154;
    int _1172 = as_type<int>(_1158);
    float _1174 = _1122;
    if (!_1162)
    {
        _1164 = _1138;
    }
    float _1176 = _1164;
    float _1178 = _1176;
    if (!_1162)
    {
        _1166 = _1136;
    }
    float _1180 = _1166;
    float _1182 = _1180;
    if (!_1162)
    {
        _1168 = _1160;
    }
    float _1184 = _1168;
    bool _1186 = !_1162;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1194 = _1156 + _1192;
        float _1196 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = rsqrt(_1154);
        float _1200 = _1194 * _1190;
        float _1202 = _1200 * 0.15915493667125701904296875;
        float _1204 = _1202 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        float _1208 = _1202 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = _1206 + (-1.0);
        float _1214 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = fma(_1210, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1218 = fma(_1160, _1206, _1214);
        float _1220 = _1198 * _1216;
        float _1222 = fma(_1148, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1224 = fma(_1144, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1188 = _1218;
        _1178 = _1222;
        _1182 = _1224;
        _1170 = _1198;
    }
    float _1226 = _1188;
    float _1228 = _1178;
    float _1230 = _1182;
    float _1232 = _1170;
    float _1234 = -_1158;
    float _1236 = _1234 + _1226;
    float _1238 = -_1126;
    float _1240 = _1238 + _1228;
    float _1242 = -_1122;
    float _1244 = _1242 + _1230;
    float _1246 = _1236 * _1236;
    float _1248 = fma(_1240, _1240, _1246);
    float _1250 = fma(_1244, _1244, _1248);
    float _1252 = sqrt(_1250);
    bool _1254 = _1252 > 0.0;
    bool _1256 = !_1254;
    float _1258 = _1226;
    float _1260 = _1228;
    float _1262 = _1230;
    float _1264 = _1240;
    float _1266 = _1232;
    if (!_1256)
    {
        float _1268 = _218 * _218;
        float _1270 = fma(_216, _216, _1268);
        float _1272 = fma(_220, _220, _1270);
        float _1274 = rsqrt(_1250);
        float _1276 = sqrt(_1272);
        float _1278 = _1240 * _1274;
        float _1280 = _1236 * _1274;
        float _1282 = _1244 * _1274;
        bool _1284 = _1276 > 0.0;
        bool _1286 = !_1284;
        _1264 = _1280;
        _1266 = _1278;
        if (!_1286)
        {
            float _1288 = rsqrt(_1272);
            float _1290 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1292 = _218 * _1288;
            float _1294 = _216 * _1288;
            float _1296 = _220 * _1288;
            float _1298 = _1280 * _1292;
            float _1300 = fma(_1278, _1294, _1298);
            float _1302 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1304 = fma(_1282, _1296, _1300);
            float _1306 = _1304 * _1302;
            float _1308 = fma(_216, _1306, _1228);
            float _1310 = fma(_218, _1306, _1226);
            float _1312 = fma(_220, _1306, _1230);
            _1258 = _1310;
            _1260 = _1308;
            _1262 = _1312;
            _1264 = _1300;
        }
    }
    float _1314 = _1258;
    float _1316 = _1260;
    float _1318 = _1262;
    float _1320 = _1264;
    float _1322 = _1266;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1326 = _1314 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1330 = _1316 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1334 = _1318 + _1332;
    float _1336 = _1326 * _1326;
    float _1338 = fma(_1330, _1330, _1336);
    float _1340 = fma(_1334, _1334, _1338);
    float _1342 = rsqrt(_1340);
    float _1344 = sqrt(_1340);
    float _1346 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1348 = _1330 * _1346;
    float _1350 = _1334 * _1346;
    float _1352 = _1348 * _1348;
    float _1354 = _1350 * _1350;
    float _1356 = _1352 + _1354;
    float _1358 = sqrt(_1356);
    bool _1360 = _1358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = _1358 + _1362;
    float _1366 = _1320;
    float _1368 = _1356;
    float _1370 = _1364;
    float _1372 = _1322;
    float _1374 = _1326;
    float _1376 = _1350;
    if (_1360)
    {
        float _1378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1366 = _1378;
    }
    float _1380 = _1366;
    if (_1360)
    {
        float _1382 = rsqrt(_1356);
        _1368 = _1382;
    }
    float _1384 = _1368;
    float _1386 = _1384;
    if (_1360)
    {
        float _1388 = _1364 * _1380;
        _1370 = _1388;
    }
    float _1390 = _1370;
    if (_1360)
    {
        float _1392 = _1390 * 0.15915493667125701904296875;
        _1372 = _1392;
    }
    float _1394 = _1372;
    float _1396 = _1342;
    if (_1360)
    {
        float _1398 = _1394 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        _1396 = _1400;
    }
    float _1402 = _1396;
    float _1404 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1406 = precise::max(0.0, _1404);
    float _1408 = _1380;
    float _1410 = _1406;
    if (_1360)
    {
        float _1412 = _1394 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = -_1346;
    float _1420 = -_1406;
    float _1422 = fma(_1326, _1418, _1420);
    if (_1360)
    {
        float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1424;
    }
    float _1426 = _1374;
    float _1428 = _1402;
    float _1430 = _1426;
    if (_1360)
    {
        float _1432 = fma(_1402, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _224 = _1432;
    }
    float _1434 = _224;
    float _1436 = _1434;
    if (!_1360)
    {
        _1428 = _1348;
    }
    float _1438 = _1428;
    float _1440 = _1438;
    if (!_1360)
    {
        _1430 = _1422;
    }
    float _1442 = _1430;
    float _1444 = _1442;
    float _1446 = _1416;
    if (_1360)
    {
        float _1448 = _1416 + (-1.0);
        _1410 = _1448;
    }
    float _1450 = _1410;
    float _1452 = _1450;
    if (_1360)
    {
        float _1454 = _1384 * _1434;
        _1436 = _1454;
    }
    float _1456 = _1436;
    if (!_1360)
    {
        _1386 = _1352;
    }
    float _1458 = _1386;
    float _1460 = _1458;
    if (_1360)
    {
        float _1462 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1462;
    }
    float _1464 = _1452;
    if (_1360)
    {
        float _1466 = _1348 * _1456;
        _1440 = _1466;
    }
    float _1468 = _1440;
    if (_1360)
    {
        float _1470 = _1350 * _1456;
        _1376 = _1470;
    }
    float _1472 = _1376;
    float _1474 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1360)
    {
        float _1476 = fma(_1422, _1416, _1464);
        _1444 = _1476;
    }
    float _1478 = _1444;
    if (_1360)
    {
        float _1480 = _1468 * _1468;
        _1460 = _1480;
    }
    float _1482 = _1460;
    if (!_1360)
    {
        _1446 = _1354;
    }
    float _1484 = _1446;
    float _1486 = _1484;
    if (_1360)
    {
        float _1488 = _1472 * _1472;
        _1486 = _1488;
    }
    float _1490 = _1486;
    float _1492 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1474);
    float _1494 = fma(_1478, _1478, _1482);
    float _1496 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1498 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1492);
    float _1500 = _1494 + _1490;
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1504 = fma(_1344, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1502);
    float _1506 = precise::clamp(_1504, 0.0, 1.0);
    float _1508 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1510 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1512 = rsqrt(_1500);
    float _1514 = -_1506;
    float _1516 = _1514 + 1.0;
    float _1518 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1520 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1522 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1518);
    float _1524 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1496);
    float _1526 = abs(_1516);
    float _1528 = log2(_1526);
    float _1530 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1532 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1522);
    float _1534 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1536 = fma(_1122, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1538 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1530);
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = -_1520;
    float _1544 = fma(_1542, _1534, 1.0);
    float _1546 = _1512 * _1468;
    float _1548 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1538);
    float _1550 = floor(_1508);
    float _1552 = _1512 * _1478;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1556 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1558 = _1512 * _1472;
    float _1560 = -_1554;
    float _1562 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1560);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1566 = floor(_1536);
    float _1568 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1570 = -_1558;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1562);
    float _1574 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1524);
    float _1576 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1564);
    float _1578 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1580 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1582 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1584 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1576);
    float _1586 = exp2(_1568);
    float _1588 = -_1550;
    float _1590 = _1508 + _1588;
    float _1592 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1578);
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1584);
    float _1596 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1580);
    float _1598 = _1552 + 1.0;
    float _1600 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1592);
    float _1602 = -_1566;
    float _1604 = _1536 + _1602;
    float _1606 = log2(_1544);
    float _1608 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1596);
    float _1610 = 1.0 / _1594;
    float _1612 = fma(_1572, -0.5, 0.5);
    float _1614 = fma(_1572, 0.5, 0.5);
    float _1616 = -_1552;
    float _1618 = fma(_1586, _1598, _1616);
    float _1620 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1600);
    float _1622 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1608);
    float _1624 = fma(_1614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _5117 = float2(_1590, _1604);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5117, float2(0.0), isnan(_5117)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5117, float2(0.0), isnan(_5117)), level(0.0)).x;
    float _1628 = sqrt(_1612);
    float _1630 = fma(_1618, 0.5, 0.5);
    float _1632 = fma(_1614, _1624, -0.212114393711090087890625);
    float _1634 = fma(_1614, _1632, 1.570728778839111328125);
    float _1636 = _1606 * 0.693147182464599609375;
    float _1638 = _1622 * _1610;
    float _1640 = _1620 * _1610;
    float _1642 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1644 = fma(_1638, -0.5, 0.5);
    float _1646 = fma(_1640, 0.5, 0.5);
    float _1648 = _1628 * 0.636619746685028076171875;
    float3 _5160 = float3(_1646, _1644, _1642);
    float _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5160, float3(0.0), isnan(_5160)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5160, float3(0.0), isnan(_5160)), level(0.0)).x;
    float _1652 = -_1634;
    float _1654 = fma(_1648, _1652, 1.0);
    float3 _5176 = float3(_1646, _1644, _1642);
    float4 _1657 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5176, float3(0.0), isnan(_5176)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5176, float3(0.0), isnan(_5176)), level(0.0)).xyzw;
    float _1659 = _1657.x;
    float _1661 = _1657.y;
    float _1663 = _1657.z;
    float _1665 = _1657.w;
    float2 _5192 = float2(_1654, _1630);
    float3 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5192, float2(0.0), isnan(_5192)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5192, float2(0.0), isnan(_5192)), level(0.0)).xyz;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = in.m_61.w;
    bool _1679 = _630 > 0.5;
    float _1681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1683 = in.m_71.y;
    bool _1685 = _638 > 0.5;
    float _1687 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1689 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1693 = _1691 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1695 = in.m_73.x;
    float _1697 = in.m_73.w;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1701 = _1699 != 0;
    float _1703 = 1.0 / _1693;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1707 = _1705 != 0;
    float _1709 = in.m_73.z;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1713 = _1711 != 0;
    float _1715 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1689);
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1719 = _1717 != 0;
    float _1721 = in.m_73.y;
    bool _1723 = _1677 > 0.5;
    float _1725 = exp2(_1687);
    float _1727 = in.m_71.x;
    float _1729 = -_1683;
    float _1731 = _1729 + 1.0;
    float _1733 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1715);
    float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1735;
    int _1739 = _1723 ? as_type<int>(_1731) : as_type<int>(_1683);
    out.m_75.x = _1695;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1743 = _1741 != 0;
    float _1745 = _1737 * _1703;
    float _1747 = _1701 ? as_type<float>(_1739) : _1683;
    out.m_75.w = _1697;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1751 = _1749 != 0;
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1755 = _628 + _1753;
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1759 = _1685 ? as_type<int>(_1731) : as_type<int>(_1683);
    float _1761 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1763 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1765 = isnan(_628);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    out.m_75.z = _1709;
    float _1775 = _1719 ? as_type<float>(_1759) : _1683;
    float _1777 = fma(_1745, _1755, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1779 = _1719;
    float _1781 = _1755;
    float _1783 = _1683;
    int _1785 = _1759;
    float _1787 = _1622;
    float _1789 = _1620;
    if (_1707)
    {
        bool _1791 = _632 > 0.5;
        _1779 = _1791;
    }
    bool _1793 = _1779;
    out.m_75.y = _1721;
    float _1795 = fma(_1747, _1761, -0.5);
    float _1797 = _1727;
    if (!_1707)
    {
        _1781 = _1727;
    }
    float _1799 = _1781;
    float _1801 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1803 = _1799;
    if (_1751)
    {
        float _1805 = _1679 ? _1731 : _1683;
        _1783 = _1805;
    }
    float _1807 = _1783;
    float _1809 = -_1773;
    float _1811 = _1809 + 1.0;
    bool _1813 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1815 = isnan(_628);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = _1823;
    if (_1707)
    {
        float _1827 = -_1727;
        float _1829 = _1827 + 1.0;
        _700 = as_type<int>(_1829);
    }
    int _1831 = _700;
    float _1833 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1835 = _992 != 0.0;
    bool _1837 = isnan(_992);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(0.0);
    bool _1843 = _1839 || _1841;
    float _1845 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1801);
    float _1847 = _1823 * _1811;
    float _1849 = fma(_1833, _1775, -0.5);
    float _1851 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1853 = in.m_77.x;
    float _1855 = in.m_77.y;
    float _1857 = in.m_77.z;
    bool _1859 = _990 == 0.0;
    bool _1861 = !_1843;
    bool _1863 = _1859 && _1861;
    float _1865 = _1777 * _1847;
    float _1867 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1851);
    float _1869 = _1867;
    if (_1707)
    {
        float _1871 = _1793 ? as_type<float>(_1831) : _1727;
        _1803 = _1871;
    }
    float _1873 = _1803;
    if (_1713)
    {
        float _1875 = -_1727;
        float _1877 = _1875 + 1.0;
        _1172 = as_type<int>(_1877);
    }
    int _1879 = _1172;
    bool _1881 = _994 == 0.0;
    bool _1883 = _1881 && _1863;
    float _1885 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1867);
    float _1887 = -_908;
    float _1889 = fma(_896, _1849, _1887);
    float _1891 = as_type<float>(_1879);
    if (!_1713)
    {
        _924 = _1727;
    }
    float _1893 = _924;
    float _1895 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1845);
    float _1897 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1899 = _1893;
    float _1901 = _1895;
    float _1903 = _1897;
    if (_1713)
    {
        float _1905 = _1685 ? as_type<float>(_1879) : _1727;
        _1899 = _1905;
    }
    float _1907 = _1899;
    float _1909 = -_1823;
    float _1911 = _1909 + 1.0;
    float _1913 = _1907;
    if (_1743)
    {
        float _1915 = -_1727;
        float _1917 = _1915 + 1.0;
        _1785 = as_type<int>(_1917);
    }
    int _1919 = _1785;
    float _1921 = 1.0 / _1897;
    if (!_1743)
    {
        _1869 = _1727;
    }
    float _1923 = _1869;
    float _1925 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1865);
    float _1927 = -_806;
    float _1929 = fma(_914, _1795, _1927);
    float _1931 = _1923;
    if (_1743)
    {
        float _1933 = _1679 ? as_type<float>(_1919) : _1727;
        _1931 = _1933;
    }
    float _1935 = _1931;
    float _1937 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1925);
    bool _1939 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1941 = isnan(0.5);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1947 = _1943 || _1945;
    float _1949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1883)
    {
        _1891 = _1853;
    }
    float _1951 = _1891;
    float _1953 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1733);
    float _1955 = _1951;
    if (_1883)
    {
        _1797 = _1855;
    }
    float _1957 = _1797;
    float _1959 = -_1725;
    float _1961 = _1959 + 1.0;
    float _1963 = _1957;
    if (_1883)
    {
        _1174 = _1951;
    }
    float _1965 = _1174;
    float _1967 = _1965;
    if (!_1883)
    {
        _1955 = _1853;
    }
    float _1969 = _1955;
    float _1971 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1973 = _1969;
    if (_1883)
    {
        _1825 = _1857;
    }
    float _1975 = _1825;
    float _1977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1979 = _1975;
    if (_1883)
    {
        _1901 = _1957;
    }
    float _1981 = _1901;
    float _1983 = _1971 + _1897;
    float _1985 = _1981;
    if (_1883)
    {
        _1903 = _1975;
    }
    float _1987 = _1903;
    float _1989 = _1987;
    if (!_1883)
    {
        float _1991 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1969);
        _1967 = _1991;
    }
    float _1993 = _1967;
    if (!_1883)
    {
        _1963 = _1855;
    }
    float _1995 = _1963;
    float _1997 = _1983 * _1921;
    float _1999 = _1997 * 0.5;
    if (!_1883)
    {
        _1979 = _1857;
    }
    float _2001 = _1979;
    float _2003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2005 = in.m_79.x;
    float _2007 = in.m_79.y;
    float _2009 = in.m_79.z;
    float _2011 = in.m_79.w;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2015 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2013);
    float _2017 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2019 = _2015;
    if (!_1883)
    {
        float _2021 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1995);
        _1985 = _2021;
    }
    float _2023 = _1985;
    float _2025 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_1883)
    {
        float _2027 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2001);
        _1989 = _2027;
    }
    float _2029 = _1989;
    float _2031 = fma(_2017, _1873, -0.5);
    float _2033 = 1.0 / _2015;
    float _2035 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2037 = fma(_894, _2031, _722);
    float _2039 = fma(_2035, _1935, -0.5);
    bool _2041 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2043 = isnan(_1344);
    bool _2045 = _2041 || _2043;
    bool _2047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2049 = _2045 || _2047;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2053 = _2025 * _2003;
    float _2055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2057 = fma(_746, _2039, _920);
    if (!_1947)
    {
        _2019 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2059 = _2019;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2063 = _2051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1620;
    out.gl_Position.y = _1622;
    out.gl_Position.z = _1953;
    out.gl_Position.w = _1594;
    float _2065 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2067 = _2033 * _2065;
    float _2069 = _2009 * _1969;
    float _2071 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2073 = _2059;
    if (!_1947)
    {
        float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2077 = _2059 + _2075;
        _2073 = _2077;
    }
    float _2079 = _2073;
    float _2081 = abs(_2067);
    float _2083 = log2(_2081);
    float _2085 = -_2069;
    float _2087 = fma(_2005, _2001, _2085);
    float _2089 = _2007 * _2001;
    float _2091 = _2005 * _1995;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2095 = _2071 * _2055;
    float _2097 = -_2089;
    float _2099 = fma(_2009, _1995, _2097);
    float _2101 = _1889 + 0.5;
    float _2103 = _1995;
    if (!_1947)
    {
        float _2105 = 1.0 / _2079;
        _2103 = _2105;
    }
    float _2107 = _2103;
    float _2109 = _1929 + 0.5;
    float _2111 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2113 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2115 = _1937 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2117 = -_2091;
    float _2119 = fma(_2007, _1969, _2117);
    out.m_81.x = _2095;
    out.m_81.y = _2053;
    if (!_1947)
    {
        float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2123 = _2067 + _2121;
        _1973 = _2123;
    }
    float _2125 = _1973;
    float _2127 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_1947)
    {
        _1913 = 1.0;
    }
    float _2129 = _1913;
    out.m_83.x = _2111;
    out.m_83.y = _2113;
    out.m_83.z = _2063;
    out.m_83.w = _2115;
    float _2131 = _2057 + 0.5;
    float _2133 = _2037 + 0.5;
    float _2135 = exp2(_2127);
    float _2137 = _2087 * _2011;
    float _2139 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2141 = _2129;
    if (!_1947)
    {
        float _2143 = _2125 * _2107;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        _2141 = _2145;
    }
    float _2147 = _2141;
    out.m_85.x = _2133;
    out.m_85.y = _2101;
    out.m_85.z = _2131;
    out.m_85.w = _2109;
    float _2149 = _2099 * _2011;
    float _2151 = _2119 * _2011;
    bool _2153 = _2067 <= 8000.0;
    bool _2155 = isnan(_2067);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan(8000.0);
    bool _2161 = _2157 || _2159;
    float _2163 = float(_2161);
    float _2165 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2167 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2169 = -_1050;
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2139);
    float _2173 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2175 = -_1050;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2165);
    float _2179 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2181 = -_1050;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2167);
    float _2185 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2187 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2173);
    float _2189 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2179);
    float _2191 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2193 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2195 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2185);
    float _2201 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2203 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2171);
    float _2205 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2177);
    float _2207 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2183);
    float _2209 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2191);
    float _2211 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2193);
    float _2213 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2187);
    float _2215 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2189);
    float _2217 = fma(_2197, -2.0, 3.0);
    float _2219 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2201);
    float _2221 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2199);
    float _2223 = _2197 * _2197;
    float _2225 = _2203 * _2007;
    float _2227 = _2205 * _2007;
    float _2229 = _2207 * _2007;
    float _2231 = _2203 * _2023;
    float _2233 = _2205 * _2023;
    float _2235 = _2137 * _2203;
    float _2237 = _2207 * _2023;
    float _2239 = _2137 * _2205;
    float _2241 = _2137 * _2207;
    float _2243 = _2223 * _2217;
    float _2245 = fma(_2213, _1993, _2231);
    float _2247 = fma(_2215, _1993, _2233);
    float _2249 = fma(_2213, _2005, _2225);
    float _2251 = fma(_2149, _2213, _2235);
    float _2253 = fma(_2221, _1993, _2237);
    float _2255 = fma(_2215, _2005, _2227);
    float _2257 = fma(_2221, _2005, _2229);
    float _2259 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2209);
    float _2261 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2211);
    float _2263 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2219);
    float _2265 = fma(_2149, _2215, _2239);
    float _2267 = fma(_2149, _2221, _2241);
    float _2269 = fma(_2151, _2259, _2251);
    float _2271 = -_2243;
    float _2273 = _2271 + 1.0;
    float _2275 = fma(_2151, _2261, _2265);
    float _2277 = fma(_2151, _2263, _2267);
    float _2279 = fma(_2259, _2009, _2249);
    float _2281 = in.m_87.x;
    float _2283 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2243);
    float _2285 = fma(_2261, _2009, _2255);
    float _2287 = fma(_2263, _2009, _2257);
    float _2289 = fma(_2261, _2029, _2247);
    float _2291 = _2163 * _2283;
    float _2293 = fma(_2263, _2029, _2253);
    float _2295 = _1953 + _1594;
    float _2297 = _1620 + _1594;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2301 = _1594 * 0.5;
    out.m_89.x = _2279;
    out.m_89.y = _2285;
    out.m_89.z = _2287;
    float _2303 = fma(_2259, _2029, _2245);
    float _2305 = _2295 * 0.5;
    float _2307 = _2297 * 0.5;
    float _2309 = fma(_1622, -0.5, _2301);
    out.m_91.x = _2269;
    out.m_91.y = _2275;
    out.m_91.z = _2277;
    float _2311 = _2147 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2313 = _2287;
    if (!_2049)
    {
        _1787 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2315 = _1787;
    out.m_93.x = _2307;
    out.m_93.y = _2309;
    out.m_93.z = _2305;
    out.m_93.w = _1594;
    float _2317 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2319 = _2317;
    float _2321 = _2315;
    float _2323 = _2315;
    if (!_2049)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2325 = _1789;
    out.m_95.x = _2303;
    out.m_95.y = _2289;
    out.m_95.z = _2293;
    float _2327 = -_2317;
    float _2329 = _2327 + 1.0;
    float _2331 = _2329;
    float _2333 = _2325;
    float _2335 = _2325;
    if (!_2049)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2337 = _2313;
    float _2339 = -_1626;
    float _2341 = _2339 + 1.0;
    float _2343 = _2341 * _2299;
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2345;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2351 = _2349 * _2281;
    float _2353 = _2281;
    float _2355 = _2337;
    float _2357 = _2337;
    if (!_2049)
    {
        _2353 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2359 = _2353;
    float _2361 = _2351 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2363 = _2317 * _1650;
    float _2365 = _2359;
    float _2367 = _2359;
    if (!_2049)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2369 = _2319;
    out.m_97.x = _2361;
    float _2371 = _1665 * _2363;
    float _2373 = _1665 * _2329;
    float _2375 = _2369;
    float _2377 = _2369;
    if (!_2049)
    {
        _2331 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2379 = _2331;
    float _2381 = _1675 * _2363;
    float _2383 = fma(_1671, _2371, _1659);
    float _2385 = fma(_1673, _2371, _1661);
    float _2387 = fma(_1665, _2381, _1663);
    out.m_99.x = _2383;
    out.m_99.y = _2385;
    out.m_99.z = _2387;
    out.m_99.w = _2373;
    bool _2389 = !_2049;
    float _2391 = _2379;
    float _2393 = _2379;
    if (!_2389)
    {
        bool _2395 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2397 = isnan(_1344);
        bool _2399 = _2395 || _2397;
        bool _2401 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2403 = _2399 || _2401;
        if (!_2403)
        {
            float _2405 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2407 = _1344 + _2405;
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2411 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2409;
            float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2417 = 1.0 / _2411;
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2435 = _2407 * _2417;
            float _2437 = precise::clamp(_2435, 0.0, 1.0);
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2443 = fma(_2437, _2415, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2445 = fma(_2437, _2441, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2447 = fma(_2437, _2421, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2449 = fma(_2437, _2425, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2451 = fma(_2437, _2429, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2453 = fma(_2437, _2433, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2335 = _2447;
            _2377 = _2451;
            _2323 = _2443;
            _2357 = _2449;
            _2367 = _2445;
            _2393 = _2453;
            _2455 = true;
        }
        else
        {
            bool _2457 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2459 = isnan(_1344);
            bool _2461 = _2457 || _2459;
            bool _2463 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2465 = _2461 || _2463;
            if (!_2465)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2467 = _2321;
            _2323 = _2467;
            if (!_2465)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2469 = _2333;
            _2335 = _2469;
            if (!_2465)
            {
                _2365 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2471 = _2365;
            _2367 = _2471;
            if (!_2465)
            {
                _2355 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2473 = _2355;
            _2357 = _2473;
            if (!_2465)
            {
                _2375 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2475 = _2375;
            _2377 = _2475;
            if (!_2465)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2477 = _2391;
            bool _2479 = !_2465;
            _2393 = _2477;
            if (!_2479)
            {
                bool _2481 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2483 = isnan(_1344);
                bool _2485 = _2481 || _2483;
                bool _2487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2489 = _2485 || _2487;
                if (!_2489)
                {
                    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2493 = _1344 + _2491;
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2497 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2495;
                    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2503 = 1.0 / _2497;
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2521 = _2493 * _2503;
                    float _2523 = precise::clamp(_2521, 0.0, 1.0);
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2529 = fma(_2523, _2501, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2531 = fma(_2523, _2527, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2533 = fma(_2523, _2507, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2535 = fma(_2523, _2511, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2537 = fma(_2523, _2515, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2539 = fma(_2523, _2519, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2335 = _2533;
                    _2377 = _2537;
                    _2323 = _2529;
                    _2357 = _2535;
                    _2367 = _2531;
                    _2393 = _2539;
                    _2455 = true;
                }
                else
                {
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2377 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2357 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2367 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2455 = false;
    float _2541 = _2335;
    float _2543 = _2377;
    float _2545 = _2323;
    float _2547 = _2357;
    float _2549 = _2367;
    float _2551 = _2393;
    float _2553 = fma(_2289, -0.5, 0.5);
    float _2555 = precise::clamp(_2553, 0.0, 1.0);
    float _2557 = -_2541;
    float _2559 = _2557 + _2543;
    float _2561 = _2311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2563 = -_2545;
    float _2565 = _2563 + _2547;
    float _2567 = fma(_2555, _2559, _2541);
    out.m_101.x = 0.0;
    float _2569 = -_2549;
    float _2571 = _2569 + _2551;
    float _2573 = fma(_2555, _2565, _2545);
    float _2575 = _2567 * 0.586610972881317138671875;
    out.m_49.x = _2561;
    bool _2577 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2579 = fma(_2555, _2571, _2549);
    float _2581 = fma(_2573, 0.298911988735198974609375, _2575);
    bool _2583 = _2147 > 0.0;
    bool _2585 = isnan(_2147);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan(0.0);
    bool _2591 = _2587 || _2589;
    float _2593 = fma(_2579, 0.114477999508380889892578125, _2581);
    float _2595 = -_2593;
    float _2597 = _2573 + _2595;
    float _2599 = -_2593;
    float _2601 = _2567 + _2599;
    float _2603 = -_2593;
    float _2605 = _2579 + _2603;
    float _2607 = fma(_2597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2593);
    float _2609 = fma(_2601, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2593);
    float _2611 = fma(_2605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2593);
    bool _2613 = !_2577;
    if (!_2613)
    {
        float _2615 = -_1314;
        float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2619 = -_1316;
        float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2623 = -_1318;
        float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2627 = _2617 * _2617;
        float _2629 = fma(_2621, _2621, _2627);
        float _2631 = fma(_2625, _2625, _2629);
        float _2633 = sqrt(_2631);
        float _2635 = rsqrt(_2631);
        float _2637 = -_2633;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2641 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2643 = precise::clamp(_2641, 0.0, 1.0);
        float _2645 = _2621 * _2635;
        float _2647 = _2617 * _2635;
        float _2649 = abs(_2643);
        float _2651 = log2(_2649);
        float _2653 = _2625 * _2635;
        float _2655 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2657 = _2289 * _2647;
        float _2659 = -_2647;
        float _2661 = -_2655;
        float _2663 = fma(_2659, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2661);
        float _2665 = fma(_2303, _2645, _2657);
        float _2667 = -_2653;
        float _2669 = fma(_2667, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2663);
        float _2671 = fma(_2293, _2653, _2665);
        float _2673 = precise::clamp(_2671, 0.0, 1.0);
        float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2677 = _2669 + _2675;
        float _2679 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2681 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2683 = precise::clamp(_2681, 0.0, 1.0);
        float _2685 = exp2(_2679);
        float _2687 = _2685 * _2683;
        float _2689 = _2673 * _2687;
        float _2691 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2693 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2695 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2691;
        out.m_101.y = _2693;
        out.m_101.z = _2695;
    }
    out.m_103.x = _2607;
    out.m_103.y = _2609;
    out.m_103.z = _2611;
    if (_2591)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2697 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2697;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2455 = false;
    bool _620 = false;
    bool _466 = false;
    bool _244 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_49.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2754 = as_type<float>(_138);
        out.gl_Position.z = _2754;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_49.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2823 = as_type<float>(_176);
        out.gl_Position.z = _2823;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_55.x;
    float _188 = in.m_55.y;
    float _190 = in.m_55.z;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = _180 * _188;
    float _206 = _180 * _194;
    float _208 = fma(_178, _186, _204);
    float _210 = _180 * _200;
    float _212 = fma(_178, _192, _206);
    float _214 = fma(_178, _198, _210);
    float _216 = fma(_182, _190, _208);
    float _218 = fma(_182, _196, _212);
    float _220 = fma(_182, _202, _214);
    bool _222 = !_184;
    float _224 = _218;
    float _242;
    if (!_222)
    {
        float _226 = in.m_61.x;
        float _228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _232 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _234 = _232 * _228;
        float _236 = floor(_234);
        float _238 = -_236;
        float _240 = _234 + _238;
        _242 = _240;
        _244 = true;
    }
    else
    {
        float _246 = float(_122);
        float _248 = 1.0 / _246;
        float _250 = _156 * _248;
        _242 = _250;
    }
    _244 = false;
    float _252 = _242;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = _252 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = _252 + _258;
    bool _262 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _264 = isnan(_252);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _252 + _286;
    float _290 = 1.0 / _276;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = 1.0 / _284;
    float _296 = 1.0 / _280;
    float _298 = _256 * _290;
    bool _300 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _302 = isnan(_252);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -_310;
    float _314 = _312 + 1.0;
    float _316 = _260 * _294;
    bool _318 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_252);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = _272 * _314;
    bool _336 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_252);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -_328;
    float _354 = _352 + 1.0;
    float _356 = -_272;
    float _358 = _356 + 1.0;
    float _360 = _288 * _296;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = _346 * _354;
    float _372 = fma(_332, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = fma(_364, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = fma(_368, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _378 = _328 * _358;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _384 = _374 * _370;
    float _386 = _376 * _370;
    float _388 = -_346;
    float _390 = _388 + 1.0;
    float _392 = _372 * _370;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _400 = fma(_350, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _402 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _392);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = fma(_396, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _410 = fma(_382, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _384);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _418;
    float _422 = fma(_400, _378, _398);
    float _424 = fma(_406, _316, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _426 = fma(_416, _316, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _428 = fma(_420, _316, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _430 = fma(_408, _378, _412);
    float _432 = fma(_410, _378, _402);
    float _434 = fma(_424, _334, _422);
    float _436 = fma(_426, _334, _430);
    float _438 = fma(_428, _334, _432);
    float _440 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].x, _434);
    float _442 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].y, _436);
    float _444 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].z, _438);
    bool _446 = !_292;
    float _464;
    if (!_446)
    {
        float _448 = in.m_61.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_122);
        float _470 = 1.0 / _468;
        float _472 = _156 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = isnan(_474);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _496 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _498 = isnan(_474);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = 1.0 / _478;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _510;
    float _514 = -_490;
    float _516 = _514 + 1.0;
    bool _518 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = isnan(_474);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    bool _530 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _532 = _506 * _516;
    float _534 = -_506;
    float _536 = _534 + 1.0;
    float _538 = 1.0 / _494;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = _512 * _508;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _474 + _546;
    float _550 = -_528;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _556 = _474 + _554;
    float _558 = fma(_544, _548, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _490 * _552;
    float _562 = _542 * _538;
    float _564 = _558 * _532;
    float _566 = fma(_562, _556, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[115].x, _564);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = fma(_566, _560, _568);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _576 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[117].x, _572);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = in.m_63.x;
    float _586 = in.m_63.y;
    float _588 = in.m_63.z;
    float _590 = _578 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _592 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _582;
    out.m_65.y = _576;
    out.m_65.z = _592;
    out.m_65.w = _590;
    float _594 = _444 * _588;
    float _596 = _442 * _586;
    float _598 = _440 * _584;
    bool _600 = !_530;
    float _618;
    if (!_600)
    {
        float _602 = in.m_61.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_122);
        float _624 = 1.0 / _622;
        float _626 = _156 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_61.z;
    float _632 = in.m_61.x;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _636 = _634 != 0;
    float _638 = in.m_61.y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _644 = in.m_55.w;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _656 = _654 != 0;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _662 = _630 * 2.0;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _668 = _632 * 2.0;
    float _670 = _632 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _672 = floor(_662);
    float _674 = _638 * 2.0;
    float _676 = -_640;
    float _678 = fma(_670, 2.0, _676);
    float _680 = _638 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _682 = _632 + _638;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _686 = !_652;
    int _688 = _686 ? 0 : 1;
    float _690 = floor(_668);
    float _692 = fma(_680, -2.0, _642);
    float _694 = _682 + (-1.0);
    float _696 = _680;
    float _698 = _682;
    int _700 = as_type<int>(_628);
    if (!_636)
    {
        _696 = _638;
    }
    float _702 = _696;
    float _704 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[78].z, _684);
    float _706 = _702;
    if (!_636)
    {
        _698 = _630;
    }
    float _708 = _698;
    float _710 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _712 = _708;
    if (_636)
    {
        _706 = _632;
    }
    float _714 = _706;
    float _716 = floor(_674);
    bool _718 = _672 > 0.0;
    float _720 = -_156;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[76].x, _678);
    bool _724 = _672 >= 0.0;
    bool _726 = isnan(_672);
    bool _728 = _724 || _726;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    float _734 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[83].z, _658);
    float _736 = _672;
    if (!_636)
    {
        _736 = _630;
    }
    float _738 = _736;
    float _740 = _714 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _742 = _738;
    if (_636)
    {
        _742 = _638;
    }
    float _744 = _742;
    float _746 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _734);
    if (_636)
    {
        _712 = _638;
    }
    float _748 = _712;
    float _750 = -_664;
    float _752 = fma(_740, 2.0, _750);
    bool _754 = _690 >= 0.0;
    bool _756 = isnan(_690);
    bool _758 = _754 || _756;
    bool _760 = isnan(0.0);
    bool _762 = _758 || _760;
    bool _764 = _690 > 0.0;
    float _766 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[83].w, _660);
    float _768 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _770 = log2(_768);
    int _772 = _732 ? 0 : 1;
    bool _774 = _716 > 0.0;
    int _776 = _762 ? 0 : 1;
    bool _778 = _716 >= 0.0;
    bool _780 = isnan(_716);
    bool _782 = _778 || _780;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    float _788 = _744 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _790 = !_648;
    int _792 = _790 ? 0 : 1;
    int _794 = ~_772;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    float _800 = fma(_788, -2.0, _666);
    int _802 = _786 ? 0 : 1;
    int _804 = abs(_792);
    float _806 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _800);
    int _808 = _798;
    if (!_718)
    {
        int _810 = ~_772;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    float _816 = _770 * _156;
    int _818 = ~_802;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = float(_804);
    float _826 = float(_814);
    int _828 = _822;
    if (!_774)
    {
        int _830 = ~_802;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    int _836 = ~_776;
    int _838 = _836 + 1;
    int _840 = _838 + 1;
    float _842 = _824 * _826;
    int _844 = _840;
    if (!_764)
    {
        int _846 = ~_776;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = _842 * (-2.0);
    float _854 = exp2(_816);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _858 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(1.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = in.m_67.x;
    float _870 = in.m_67.y;
    float _872 = in.m_67.z;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _876 = 1.0 + _874;
    float _878 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[78].w, _856);
    bool _880 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _888 = _884 || _886;
    float _890 = 1.0 / _876;
    int _892 = abs(_688);
    float _894 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _704);
    float _896 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _878);
    bool _898 = !_656;
    int _900 = _898 ? 0 : 1;
    float _902 = float(_834);
    float _904 = -_854;
    float _906 = _904 + 1.0;
    float _908 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _692);
    float _910 = float(_892);
    float _912 = _888 ? _906 : 0.0;
    float _914 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _766);
    float _916 = float(_850);
    float _918 = -_156;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[81].x, _752);
    int _922 = abs(_900);
    float _924 = _896;
    if (_866)
    {
        float _926 = _912 * _890;
        _160 = _926;
    }
    float _928 = _160;
    float _930 = fma(_710, _852, _710);
    float _932 = fma(_852, _868, _868);
    float _934 = _638 + _630;
    float _936 = _632 + (-0.5);
    float _938 = _910 * _916;
    float _940 = _934 + (-1.0);
    float _942 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[196].x, _932);
    float _944 = float(_922);
    float _946 = _938 * (-2.0);
    float _948 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _950 = fma(_930, _928, _942);
    float _952 = _944 * _902;
    float _954 = fma(_948, _946, _948);
    float _956 = fma(_946, _870, _870);
    float _958 = _638 + (-0.5);
    float _960 = _632 + _630;
    float _962 = _952 * (-2.0);
    float _964 = _950 * 0.15915493667125701904296875;
    float _966 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].y, _956);
    float _968 = _960 + (-1.0);
    float _970 = fma(_962, _872, _872);
    float _972 = _964 * 6.283185482025146484375;
    float _974 = sin(_972);
    float _976 = fma(_954, _928, _966);
    float _978 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _980 = in.m_46.x;
    float _982 = in.m_46.y;
    float _984 = in.m_46.z;
    float _986 = _976 * 0.15915493667125701904296875;
    float _988 = _630 + (-0.5);
    float _990 = in.m_69.x;
    float _992 = in.m_69.y;
    float _994 = in.m_69.z;
    float _996 = fma(_978, _962, _978);
    float _998 = _964 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _970);
    float _1004 = _596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1006 = _594 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1008 = fma(_996, _928, _1002);
    float _1010 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1012 = _986 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = _1008 * 0.15915493667125701904296875;
    float _1018 = _986 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _200 * _982;
    float _1024 = _194 * _982;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _992);
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _994);
    float _1030 = _1016 * 6.283185482025146484375;
    float _1032 = cos(_1030);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _990);
    float _1036 = _1026 * _1004;
    float _1038 = fma(_198, _980, _1022);
    float _1040 = _1028 * _1006;
    float _1042 = _1034 * _1010;
    float _1044 = _1000 * _1014;
    float _1046 = fma(_202, _984, _1038);
    float _1048 = _1016 * 6.283185482025146484375;
    float _1050 = sin(_1048);
    float _1052 = _1000 * _1020;
    float _1054 = _974 * _1020;
    float _1056 = fma(_192, _980, _1024);
    float _1058 = fma(_196, _984, _1056);
    float _1060 = _1000 * _1032;
    float _1062 = _974 * _1014;
    float _1064 = _1020 * _1032;
    float _1066 = _974 * _1032;
    float _1068 = _1014 * _1032;
    float _1070 = in.m_59.w;
    float _1072 = _1060 * _1036;
    float _1074 = _1066 * _1036;
    float _1076 = fma(_1050, _1052, _1062);
    float _1078 = -_1036;
    float _1080 = _1050 * _1078;
    float _1082 = -_1054;
    float _1084 = fma(_1050, _1044, _1082);
    float _1086 = fma(_1050, _1062, _1052);
    float _1088 = fma(_1076, _1042, _1072);
    float _1090 = -_1044;
    float _1092 = fma(_1050, _1054, _1090);
    float _1094 = fma(_1064, _1042, _1080);
    float _1096 = fma(_1084, _1040, _1088);
    float _1098 = fma(_1092, _1042, _1074);
    float _1100 = fma(_1068, _1040, _1094);
    float _1102 = _188 * _982;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1106 = fma(_1086, _1040, _1098);
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1110 = fma(_186, _980, _1102);
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1104);
    float _1114 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1116 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1108);
    float _1118 = fma(_190, _984, _1110);
    float _1120 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1112);
    float _1122 = _1046 + _1070;
    float _1124 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1116);
    float _1126 = _1118 + _644;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1130 = in.m_57.w;
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1134 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1114);
    float _1136 = _1122 + _1128;
    float _1138 = _1126 + _1132;
    float _1140 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1134);
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1144 = _1136 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1148 = _1138 + _1146;
    float _1150 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1152 = _1144 * _1144;
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = sqrt(_1154);
    float _1158 = _1058 + _1130;
    float _1160 = _1158 + _1150;
    bool _1162 = _1156 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1130;
    float _1166 = _1138;
    float _1168 = _1100;
    float _1170 = _1154;
    int _1172 = as_type<int>(_1158);
    float _1174 = _1122;
    if (!_1162)
    {
        _1164 = _1138;
    }
    float _1176 = _1164;
    float _1178 = _1176;
    if (!_1162)
    {
        _1166 = _1136;
    }
    float _1180 = _1166;
    float _1182 = _1180;
    if (!_1162)
    {
        _1168 = _1160;
    }
    float _1184 = _1168;
    bool _1186 = !_1162;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1194 = _1156 + _1192;
        float _1196 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = rsqrt(_1154);
        float _1200 = _1194 * _1190;
        float _1202 = _1200 * 0.15915493667125701904296875;
        float _1204 = _1202 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        float _1208 = _1202 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = _1206 + (-1.0);
        float _1214 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = fma(_1210, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1218 = fma(_1160, _1206, _1214);
        float _1220 = _1198 * _1216;
        float _1222 = fma(_1148, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1224 = fma(_1144, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1188 = _1218;
        _1178 = _1222;
        _1182 = _1224;
        _1170 = _1198;
    }
    float _1226 = _1188;
    float _1228 = _1178;
    float _1230 = _1182;
    float _1232 = _1170;
    float _1234 = -_1158;
    float _1236 = _1234 + _1226;
    float _1238 = -_1126;
    float _1240 = _1238 + _1228;
    float _1242 = -_1122;
    float _1244 = _1242 + _1230;
    float _1246 = _1236 * _1236;
    float _1248 = fma(_1240, _1240, _1246);
    float _1250 = fma(_1244, _1244, _1248);
    float _1252 = sqrt(_1250);
    bool _1254 = _1252 > 0.0;
    bool _1256 = !_1254;
    float _1258 = _1226;
    float _1260 = _1228;
    float _1262 = _1230;
    float _1264 = _1240;
    float _1266 = _1232;
    if (!_1256)
    {
        float _1268 = _218 * _218;
        float _1270 = fma(_216, _216, _1268);
        float _1272 = fma(_220, _220, _1270);
        float _1274 = rsqrt(_1250);
        float _1276 = sqrt(_1272);
        float _1278 = _1240 * _1274;
        float _1280 = _1236 * _1274;
        float _1282 = _1244 * _1274;
        bool _1284 = _1276 > 0.0;
        bool _1286 = !_1284;
        _1264 = _1280;
        _1266 = _1278;
        if (!_1286)
        {
            float _1288 = rsqrt(_1272);
            float _1290 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1292 = _218 * _1288;
            float _1294 = _216 * _1288;
            float _1296 = _220 * _1288;
            float _1298 = _1280 * _1292;
            float _1300 = fma(_1278, _1294, _1298);
            float _1302 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1304 = fma(_1282, _1296, _1300);
            float _1306 = _1304 * _1302;
            float _1308 = fma(_216, _1306, _1228);
            float _1310 = fma(_218, _1306, _1226);
            float _1312 = fma(_220, _1306, _1230);
            _1258 = _1310;
            _1260 = _1308;
            _1262 = _1312;
            _1264 = _1300;
        }
    }
    float _1314 = _1258;
    float _1316 = _1260;
    float _1318 = _1262;
    float _1320 = _1264;
    float _1322 = _1266;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1326 = _1314 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1330 = _1316 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1334 = _1318 + _1332;
    float _1336 = _1326 * _1326;
    float _1338 = fma(_1330, _1330, _1336);
    float _1340 = fma(_1334, _1334, _1338);
    float _1342 = rsqrt(_1340);
    float _1344 = sqrt(_1340);
    float _1346 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1348 = _1330 * _1346;
    float _1350 = _1334 * _1346;
    float _1352 = _1348 * _1348;
    float _1354 = _1350 * _1350;
    float _1356 = _1352 + _1354;
    float _1358 = sqrt(_1356);
    bool _1360 = _1358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1364 = _1358 + _1362;
    float _1366 = _1320;
    float _1368 = _1356;
    float _1370 = _1364;
    float _1372 = _1322;
    float _1374 = _1326;
    float _1376 = _1350;
    if (_1360)
    {
        float _1378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1366 = _1378;
    }
    float _1380 = _1366;
    if (_1360)
    {
        float _1382 = rsqrt(_1356);
        _1368 = _1382;
    }
    float _1384 = _1368;
    float _1386 = _1384;
    if (_1360)
    {
        float _1388 = _1364 * _1380;
        _1370 = _1388;
    }
    float _1390 = _1370;
    if (_1360)
    {
        float _1392 = _1390 * 0.15915493667125701904296875;
        _1372 = _1392;
    }
    float _1394 = _1372;
    float _1396 = _1342;
    if (_1360)
    {
        float _1398 = _1394 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        _1396 = _1400;
    }
    float _1402 = _1396;
    float _1404 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1406 = precise::max(0.0, _1404);
    float _1408 = _1380;
    float _1410 = _1406;
    if (_1360)
    {
        float _1412 = _1394 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = -_1346;
    float _1420 = -_1406;
    float _1422 = fma(_1326, _1418, _1420);
    if (_1360)
    {
        float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1424;
    }
    float _1426 = _1374;
    float _1428 = _1402;
    float _1430 = _1426;
    if (_1360)
    {
        float _1432 = fma(_1402, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _224 = _1432;
    }
    float _1434 = _224;
    float _1436 = _1434;
    if (!_1360)
    {
        _1428 = _1348;
    }
    float _1438 = _1428;
    float _1440 = _1438;
    if (!_1360)
    {
        _1430 = _1422;
    }
    float _1442 = _1430;
    float _1444 = _1442;
    float _1446 = _1416;
    if (_1360)
    {
        float _1448 = _1416 + (-1.0);
        _1410 = _1448;
    }
    float _1450 = _1410;
    float _1452 = _1450;
    if (_1360)
    {
        float _1454 = _1384 * _1434;
        _1436 = _1454;
    }
    float _1456 = _1436;
    if (!_1360)
    {
        _1386 = _1352;
    }
    float _1458 = _1386;
    float _1460 = _1458;
    if (_1360)
    {
        float _1462 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1462;
    }
    float _1464 = _1452;
    if (_1360)
    {
        float _1466 = _1348 * _1456;
        _1440 = _1466;
    }
    float _1468 = _1440;
    if (_1360)
    {
        float _1470 = _1350 * _1456;
        _1376 = _1470;
    }
    float _1472 = _1376;
    float _1474 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1360)
    {
        float _1476 = fma(_1422, _1416, _1464);
        _1444 = _1476;
    }
    float _1478 = _1444;
    if (_1360)
    {
        float _1480 = _1468 * _1468;
        _1460 = _1480;
    }
    float _1482 = _1460;
    if (!_1360)
    {
        _1446 = _1354;
    }
    float _1484 = _1446;
    float _1486 = _1484;
    if (_1360)
    {
        float _1488 = _1472 * _1472;
        _1486 = _1488;
    }
    float _1490 = _1486;
    float _1492 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1474);
    float _1494 = fma(_1478, _1478, _1482);
    float _1496 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1498 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1492);
    float _1500 = _1494 + _1490;
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1504 = fma(_1344, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1502);
    float _1506 = precise::clamp(_1504, 0.0, 1.0);
    float _1508 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1510 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1512 = rsqrt(_1500);
    float _1514 = -_1506;
    float _1516 = _1514 + 1.0;
    float _1518 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1520 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1522 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1518);
    float _1524 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1496);
    float _1526 = abs(_1516);
    float _1528 = log2(_1526);
    float _1530 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1532 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1522);
    float _1534 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1536 = fma(_1122, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1538 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1530);
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = -_1520;
    float _1544 = fma(_1542, _1534, 1.0);
    float _1546 = _1512 * _1468;
    float _1548 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1538);
    float _1550 = floor(_1508);
    float _1552 = _1512 * _1478;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1556 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1558 = _1512 * _1472;
    float _1560 = -_1554;
    float _1562 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1560);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1566 = floor(_1536);
    float _1568 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1570 = -_1558;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1562);
    float _1574 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1524);
    float _1576 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1564);
    float _1578 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1580 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1582 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1584 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1576);
    float _1586 = exp2(_1568);
    float _1588 = -_1550;
    float _1590 = _1508 + _1588;
    float _1592 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1578);
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1584);
    float _1596 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1580);
    float _1598 = _1552 + 1.0;
    float _1600 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1592);
    float _1602 = -_1566;
    float _1604 = _1536 + _1602;
    float _1606 = log2(_1544);
    float _1608 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1596);
    float _1610 = 1.0 / _1594;
    float _1612 = fma(_1572, -0.5, 0.5);
    float _1614 = fma(_1572, 0.5, 0.5);
    float _1616 = -_1552;
    float _1618 = fma(_1586, _1598, _1616);
    float _1620 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1600);
    float _1622 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1608);
    float _1624 = fma(_1614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _5117 = float2(_1590, _1604);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5117, float2(0.0), isnan(_5117)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5117, float2(0.0), isnan(_5117)), level(0.0)).x;
    float _1628 = sqrt(_1612);
    float _1630 = fma(_1618, 0.5, 0.5);
    float _1632 = fma(_1614, _1624, -0.212114393711090087890625);
    float _1634 = fma(_1614, _1632, 1.570728778839111328125);
    float _1636 = _1606 * 0.693147182464599609375;
    float _1638 = _1622 * _1610;
    float _1640 = _1620 * _1610;
    float _1642 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1644 = fma(_1638, -0.5, 0.5);
    float _1646 = fma(_1640, 0.5, 0.5);
    float _1648 = _1628 * 0.636619746685028076171875;
    float3 _5160 = float3(_1646, _1644, _1642);
    float _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5160, float3(0.0), isnan(_5160)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5160, float3(0.0), isnan(_5160)), level(0.0)).x;
    float _1652 = -_1634;
    float _1654 = fma(_1648, _1652, 1.0);
    float3 _5176 = float3(_1646, _1644, _1642);
    float4 _1657 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5176, float3(0.0), isnan(_5176)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5176, float3(0.0), isnan(_5176)), level(0.0)).xyzw;
    float _1659 = _1657.x;
    float _1661 = _1657.y;
    float _1663 = _1657.z;
    float _1665 = _1657.w;
    float2 _5192 = float2(_1654, _1630);
    float3 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5192, float2(0.0), isnan(_5192)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5192, float2(0.0), isnan(_5192)), level(0.0)).xyz;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = in.m_61.w;
    bool _1679 = _630 > 0.5;
    float _1681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1683 = in.m_71.y;
    bool _1685 = _638 > 0.5;
    float _1687 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1689 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1693 = _1691 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1695 = in.m_73.x;
    float _1697 = in.m_73.w;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1701 = _1699 != 0;
    float _1703 = 1.0 / _1693;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1707 = _1705 != 0;
    float _1709 = in.m_73.z;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1713 = _1711 != 0;
    float _1715 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1689);
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1719 = _1717 != 0;
    float _1721 = in.m_73.y;
    bool _1723 = _1677 > 0.5;
    float _1725 = exp2(_1687);
    float _1727 = in.m_71.x;
    float _1729 = -_1683;
    float _1731 = _1729 + 1.0;
    float _1733 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1715);
    float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1735;
    int _1739 = _1723 ? as_type<int>(_1731) : as_type<int>(_1683);
    out.m_75.x = _1695;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1743 = _1741 != 0;
    float _1745 = _1737 * _1703;
    float _1747 = _1701 ? as_type<float>(_1739) : _1683;
    out.m_75.w = _1697;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1751 = _1749 != 0;
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1755 = _628 + _1753;
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1759 = _1685 ? as_type<int>(_1731) : as_type<int>(_1683);
    float _1761 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1763 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1765 = isnan(_628);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    out.m_75.z = _1709;
    float _1775 = _1719 ? as_type<float>(_1759) : _1683;
    float _1777 = fma(_1745, _1755, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1779 = _1719;
    float _1781 = _1755;
    float _1783 = _1683;
    int _1785 = _1759;
    float _1787 = _1622;
    float _1789 = _1620;
    if (_1707)
    {
        bool _1791 = _632 > 0.5;
        _1779 = _1791;
    }
    bool _1793 = _1779;
    out.m_75.y = _1721;
    float _1795 = fma(_1747, _1761, -0.5);
    float _1797 = _1727;
    if (!_1707)
    {
        _1781 = _1727;
    }
    float _1799 = _1781;
    float _1801 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1803 = _1799;
    if (_1751)
    {
        float _1805 = _1679 ? _1731 : _1683;
        _1783 = _1805;
    }
    float _1807 = _1783;
    float _1809 = -_1773;
    float _1811 = _1809 + 1.0;
    bool _1813 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1815 = isnan(_628);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = _1823;
    if (_1707)
    {
        float _1827 = -_1727;
        float _1829 = _1827 + 1.0;
        _700 = as_type<int>(_1829);
    }
    int _1831 = _700;
    float _1833 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1835 = _992 != 0.0;
    bool _1837 = isnan(_992);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(0.0);
    bool _1843 = _1839 || _1841;
    float _1845 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1801);
    float _1847 = _1823 * _1811;
    float _1849 = fma(_1833, _1775, -0.5);
    float _1851 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1853 = in.m_77.x;
    float _1855 = in.m_77.y;
    float _1857 = in.m_77.z;
    bool _1859 = _990 == 0.0;
    bool _1861 = !_1843;
    bool _1863 = _1859 && _1861;
    float _1865 = _1777 * _1847;
    float _1867 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1851);
    float _1869 = _1867;
    if (_1707)
    {
        float _1871 = _1793 ? as_type<float>(_1831) : _1727;
        _1803 = _1871;
    }
    float _1873 = _1803;
    if (_1713)
    {
        float _1875 = -_1727;
        float _1877 = _1875 + 1.0;
        _1172 = as_type<int>(_1877);
    }
    int _1879 = _1172;
    bool _1881 = _994 == 0.0;
    bool _1883 = _1881 && _1863;
    float _1885 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1867);
    float _1887 = -_908;
    float _1889 = fma(_896, _1849, _1887);
    float _1891 = as_type<float>(_1879);
    if (!_1713)
    {
        _924 = _1727;
    }
    float _1893 = _924;
    float _1895 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1845);
    float _1897 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1899 = _1893;
    float _1901 = _1895;
    float _1903 = _1897;
    if (_1713)
    {
        float _1905 = _1685 ? as_type<float>(_1879) : _1727;
        _1899 = _1905;
    }
    float _1907 = _1899;
    float _1909 = -_1823;
    float _1911 = _1909 + 1.0;
    float _1913 = _1907;
    if (_1743)
    {
        float _1915 = -_1727;
        float _1917 = _1915 + 1.0;
        _1785 = as_type<int>(_1917);
    }
    int _1919 = _1785;
    float _1921 = 1.0 / _1897;
    if (!_1743)
    {
        _1869 = _1727;
    }
    float _1923 = _1869;
    float _1925 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1865);
    float _1927 = -_806;
    float _1929 = fma(_914, _1795, _1927);
    float _1931 = _1923;
    if (_1743)
    {
        float _1933 = _1679 ? as_type<float>(_1919) : _1727;
        _1931 = _1933;
    }
    float _1935 = _1931;
    float _1937 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1925);
    bool _1939 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1941 = isnan(0.5);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1947 = _1943 || _1945;
    float _1949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1883)
    {
        _1891 = _1853;
    }
    float _1951 = _1891;
    float _1953 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1733);
    float _1955 = _1951;
    if (_1883)
    {
        _1797 = _1855;
    }
    float _1957 = _1797;
    float _1959 = -_1725;
    float _1961 = _1959 + 1.0;
    float _1963 = _1957;
    if (_1883)
    {
        _1174 = _1951;
    }
    float _1965 = _1174;
    float _1967 = _1965;
    if (!_1883)
    {
        _1955 = _1853;
    }
    float _1969 = _1955;
    float _1971 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1973 = _1969;
    if (_1883)
    {
        _1825 = _1857;
    }
    float _1975 = _1825;
    float _1977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1979 = _1975;
    if (_1883)
    {
        _1901 = _1957;
    }
    float _1981 = _1901;
    float _1983 = _1971 + _1897;
    float _1985 = _1981;
    if (_1883)
    {
        _1903 = _1975;
    }
    float _1987 = _1903;
    float _1989 = _1987;
    if (!_1883)
    {
        float _1991 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1969);
        _1967 = _1991;
    }
    float _1993 = _1967;
    if (!_1883)
    {
        _1963 = _1855;
    }
    float _1995 = _1963;
    float _1997 = _1983 * _1921;
    float _1999 = _1997 * 0.5;
    if (!_1883)
    {
        _1979 = _1857;
    }
    float _2001 = _1979;
    float _2003 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2005 = in.m_79.x;
    float _2007 = in.m_79.y;
    float _2009 = in.m_79.z;
    float _2011 = in.m_79.w;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2015 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2013);
    float _2017 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2019 = _2015;
    if (!_1883)
    {
        float _2021 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1995);
        _1985 = _2021;
    }
    float _2023 = _1985;
    float _2025 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_1883)
    {
        float _2027 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2001);
        _1989 = _2027;
    }
    float _2029 = _1989;
    float _2031 = fma(_2017, _1873, -0.5);
    float _2033 = 1.0 / _2015;
    float _2035 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2037 = fma(_894, _2031, _722);
    float _2039 = fma(_2035, _1935, -0.5);
    bool _2041 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2043 = isnan(_1344);
    bool _2045 = _2041 || _2043;
    bool _2047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2049 = _2045 || _2047;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2053 = _2025 * _2003;
    float _2055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2057 = fma(_746, _2039, _920);
    if (!_1947)
    {
        _2019 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2059 = _2019;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2063 = _2051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1620;
    out.gl_Position.y = _1622;
    out.gl_Position.z = _1953;
    out.gl_Position.w = _1594;
    float _2065 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2067 = _2033 * _2065;
    float _2069 = _2009 * _1969;
    float _2071 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2073 = _2059;
    if (!_1947)
    {
        float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2077 = _2059 + _2075;
        _2073 = _2077;
    }
    float _2079 = _2073;
    float _2081 = abs(_2067);
    float _2083 = log2(_2081);
    float _2085 = -_2069;
    float _2087 = fma(_2005, _2001, _2085);
    float _2089 = _2007 * _2001;
    float _2091 = _2005 * _1995;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2095 = _2071 * _2055;
    float _2097 = -_2089;
    float _2099 = fma(_2009, _1995, _2097);
    float _2101 = _1889 + 0.5;
    float _2103 = _1995;
    if (!_1947)
    {
        float _2105 = 1.0 / _2079;
        _2103 = _2105;
    }
    float _2107 = _2103;
    float _2109 = _1929 + 0.5;
    float _2111 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2113 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2115 = _1937 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2117 = -_2091;
    float _2119 = fma(_2007, _1969, _2117);
    out.m_81.x = _2095;
    out.m_81.y = _2053;
    if (!_1947)
    {
        float _2121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2123 = _2067 + _2121;
        _1973 = _2123;
    }
    float _2125 = _1973;
    float _2127 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_1947)
    {
        _1913 = 1.0;
    }
    float _2129 = _1913;
    out.m_83.x = _2111;
    out.m_83.y = _2113;
    out.m_83.z = _2063;
    out.m_83.w = _2115;
    float _2131 = _2057 + 0.5;
    float _2133 = _2037 + 0.5;
    float _2135 = exp2(_2127);
    float _2137 = _2087 * _2011;
    float _2139 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2141 = _2129;
    if (!_1947)
    {
        float _2143 = _2125 * _2107;
        float _2145 = precise::clamp(_2143, 0.0, 1.0);
        _2141 = _2145;
    }
    float _2147 = _2141;
    out.m_85.x = _2133;
    out.m_85.y = _2101;
    out.m_85.z = _2131;
    out.m_85.w = _2109;
    float _2149 = _2099 * _2011;
    float _2151 = _2119 * _2011;
    bool _2153 = _2067 <= 8000.0;
    bool _2155 = isnan(_2067);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan(8000.0);
    bool _2161 = _2157 || _2159;
    float _2163 = float(_2161);
    float _2165 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2167 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2169 = -_1050;
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2139);
    float _2173 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2175 = -_1050;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2165);
    float _2179 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2181 = -_1050;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2167);
    float _2185 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2187 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2173);
    float _2189 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2179);
    float _2191 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2193 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2195 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2185);
    float _2201 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2203 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2171);
    float _2205 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2177);
    float _2207 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2183);
    float _2209 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2191);
    float _2211 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2193);
    float _2213 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2187);
    float _2215 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2189);
    float _2217 = fma(_2197, -2.0, 3.0);
    float _2219 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2201);
    float _2221 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2199);
    float _2223 = _2197 * _2197;
    float _2225 = _2203 * _2007;
    float _2227 = _2205 * _2007;
    float _2229 = _2207 * _2007;
    float _2231 = _2203 * _2023;
    float _2233 = _2205 * _2023;
    float _2235 = _2137 * _2203;
    float _2237 = _2207 * _2023;
    float _2239 = _2137 * _2205;
    float _2241 = _2137 * _2207;
    float _2243 = _2223 * _2217;
    float _2245 = fma(_2213, _1993, _2231);
    float _2247 = fma(_2215, _1993, _2233);
    float _2249 = fma(_2213, _2005, _2225);
    float _2251 = fma(_2149, _2213, _2235);
    float _2253 = fma(_2221, _1993, _2237);
    float _2255 = fma(_2215, _2005, _2227);
    float _2257 = fma(_2221, _2005, _2229);
    float _2259 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2209);
    float _2261 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2211);
    float _2263 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2219);
    float _2265 = fma(_2149, _2215, _2239);
    float _2267 = fma(_2149, _2221, _2241);
    float _2269 = fma(_2151, _2259, _2251);
    float _2271 = -_2243;
    float _2273 = _2271 + 1.0;
    float _2275 = fma(_2151, _2261, _2265);
    float _2277 = fma(_2151, _2263, _2267);
    float _2279 = fma(_2259, _2009, _2249);
    float _2281 = in.m_87.x;
    float _2283 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2243);
    float _2285 = fma(_2261, _2009, _2255);
    float _2287 = fma(_2263, _2009, _2257);
    float _2289 = fma(_2261, _2029, _2247);
    float _2291 = _2163 * _2283;
    float _2293 = fma(_2263, _2029, _2253);
    float _2295 = _1953 + _1594;
    float _2297 = _1620 + _1594;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2301 = _1594 * 0.5;
    out.m_89.x = _2279;
    out.m_89.y = _2285;
    out.m_89.z = _2287;
    float _2303 = fma(_2259, _2029, _2245);
    float _2305 = _2295 * 0.5;
    float _2307 = _2297 * 0.5;
    float _2309 = fma(_1622, -0.5, _2301);
    out.m_91.x = _2269;
    out.m_91.y = _2275;
    out.m_91.z = _2277;
    float _2311 = _2147 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2313 = _2287;
    if (!_2049)
    {
        _1787 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2315 = _1787;
    out.m_93.x = _2307;
    out.m_93.y = _2309;
    out.m_93.z = _2305;
    out.m_93.w = _1594;
    float _2317 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2319 = _2317;
    float _2321 = _2315;
    float _2323 = _2315;
    if (!_2049)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2325 = _1789;
    out.m_95.x = _2303;
    out.m_95.y = _2289;
    out.m_95.z = _2293;
    float _2327 = -_2317;
    float _2329 = _2327 + 1.0;
    float _2331 = _2329;
    float _2333 = _2325;
    float _2335 = _2325;
    if (!_2049)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2337 = _2313;
    float _2339 = -_1626;
    float _2341 = _2339 + 1.0;
    float _2343 = _2341 * _2299;
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2345;
    float _2349 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2351 = _2349 * _2281;
    float _2353 = _2281;
    float _2355 = _2337;
    float _2357 = _2337;
    if (!_2049)
    {
        _2353 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2359 = _2353;
    float _2361 = _2351 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2363 = _2317 * _1650;
    float _2365 = _2359;
    float _2367 = _2359;
    if (!_2049)
    {
        _2319 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2369 = _2319;
    out.m_97.x = _2361;
    float _2371 = _1665 * _2363;
    float _2373 = _1665 * _2329;
    float _2375 = _2369;
    float _2377 = _2369;
    if (!_2049)
    {
        _2331 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2379 = _2331;
    float _2381 = _1675 * _2363;
    float _2383 = fma(_1671, _2371, _1659);
    float _2385 = fma(_1673, _2371, _1661);
    float _2387 = fma(_1665, _2381, _1663);
    out.m_99.x = _2383;
    out.m_99.y = _2385;
    out.m_99.z = _2387;
    out.m_99.w = _2373;
    bool _2389 = !_2049;
    float _2391 = _2379;
    float _2393 = _2379;
    if (!_2389)
    {
        bool _2395 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2397 = isnan(_1344);
        bool _2399 = _2395 || _2397;
        bool _2401 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2403 = _2399 || _2401;
        if (!_2403)
        {
            float _2405 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2407 = _1344 + _2405;
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2411 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2409;
            float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2417 = 1.0 / _2411;
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2435 = _2407 * _2417;
            float _2437 = precise::clamp(_2435, 0.0, 1.0);
            float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2443 = fma(_2437, _2415, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2445 = fma(_2437, _2441, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2447 = fma(_2437, _2421, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2449 = fma(_2437, _2425, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2451 = fma(_2437, _2429, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2453 = fma(_2437, _2433, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2335 = _2447;
            _2377 = _2451;
            _2323 = _2443;
            _2357 = _2449;
            _2367 = _2445;
            _2393 = _2453;
            _2455 = true;
        }
        else
        {
            bool _2457 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2459 = isnan(_1344);
            bool _2461 = _2457 || _2459;
            bool _2463 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2465 = _2461 || _2463;
            if (!_2465)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2467 = _2321;
            _2323 = _2467;
            if (!_2465)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2469 = _2333;
            _2335 = _2469;
            if (!_2465)
            {
                _2365 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2471 = _2365;
            _2367 = _2471;
            if (!_2465)
            {
                _2355 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2473 = _2355;
            _2357 = _2473;
            if (!_2465)
            {
                _2375 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2475 = _2375;
            _2377 = _2475;
            if (!_2465)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2477 = _2391;
            bool _2479 = !_2465;
            _2393 = _2477;
            if (!_2479)
            {
                bool _2481 = _1344 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2483 = isnan(_1344);
                bool _2485 = _2481 || _2483;
                bool _2487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2489 = _2485 || _2487;
                if (!_2489)
                {
                    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2493 = _1344 + _2491;
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2497 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2495;
                    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2503 = 1.0 / _2497;
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2515 = _2513 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2521 = _2493 * _2503;
                    float _2523 = precise::clamp(_2521, 0.0, 1.0);
                    float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2529 = fma(_2523, _2501, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2531 = fma(_2523, _2527, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2533 = fma(_2523, _2507, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2535 = fma(_2523, _2511, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2537 = fma(_2523, _2515, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2539 = fma(_2523, _2519, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2335 = _2533;
                    _2377 = _2537;
                    _2323 = _2529;
                    _2357 = _2535;
                    _2367 = _2531;
                    _2393 = _2539;
                    _2455 = true;
                }
                else
                {
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2377 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2357 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2367 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2455 = false;
    float _2541 = _2335;
    float _2543 = _2377;
    float _2545 = _2323;
    float _2547 = _2357;
    float _2549 = _2367;
    float _2551 = _2393;
    float _2553 = fma(_2289, -0.5, 0.5);
    float _2555 = precise::clamp(_2553, 0.0, 1.0);
    float _2557 = -_2541;
    float _2559 = _2557 + _2543;
    float _2561 = _2311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2563 = -_2545;
    float _2565 = _2563 + _2547;
    float _2567 = fma(_2555, _2559, _2541);
    out.m_101.x = 0.0;
    float _2569 = -_2549;
    float _2571 = _2569 + _2551;
    float _2573 = fma(_2555, _2565, _2545);
    float _2575 = _2567 * 0.586610972881317138671875;
    out.m_49.x = _2561;
    bool _2577 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2579 = fma(_2555, _2571, _2549);
    float _2581 = fma(_2573, 0.298911988735198974609375, _2575);
    bool _2583 = _2147 > 0.0;
    bool _2585 = isnan(_2147);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan(0.0);
    bool _2591 = _2587 || _2589;
    float _2593 = fma(_2579, 0.114477999508380889892578125, _2581);
    float _2595 = -_2593;
    float _2597 = _2573 + _2595;
    float _2599 = -_2593;
    float _2601 = _2567 + _2599;
    float _2603 = -_2593;
    float _2605 = _2579 + _2603;
    float _2607 = fma(_2597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2593);
    float _2609 = fma(_2601, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2593);
    float _2611 = fma(_2605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2593);
    bool _2613 = !_2577;
    if (!_2613)
    {
        float _2615 = -_1314;
        float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2619 = -_1316;
        float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2623 = -_1318;
        float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2627 = _2617 * _2617;
        float _2629 = fma(_2621, _2621, _2627);
        float _2631 = fma(_2625, _2625, _2629);
        float _2633 = sqrt(_2631);
        float _2635 = rsqrt(_2631);
        float _2637 = -_2633;
        float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2641 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2643 = precise::clamp(_2641, 0.0, 1.0);
        float _2645 = _2621 * _2635;
        float _2647 = _2617 * _2635;
        float _2649 = abs(_2643);
        float _2651 = log2(_2649);
        float _2653 = _2625 * _2635;
        float _2655 = _2645 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2657 = _2289 * _2647;
        float _2659 = -_2647;
        float _2661 = -_2655;
        float _2663 = fma(_2659, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2661);
        float _2665 = fma(_2303, _2645, _2657);
        float _2667 = -_2653;
        float _2669 = fma(_2667, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2663);
        float _2671 = fma(_2293, _2653, _2665);
        float _2673 = precise::clamp(_2671, 0.0, 1.0);
        float _2675 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2677 = _2669 + _2675;
        float _2679 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2681 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2683 = precise::clamp(_2681, 0.0, 1.0);
        float _2685 = exp2(_2679);
        float _2687 = _2685 * _2683;
        float _2689 = _2673 * _2687;
        float _2691 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2693 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2695 = _2689 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2691;
        out.m_101.y = _2693;
        out.m_101.z = _2695;
    }
    out.m_103.x = _2607;
    out.m_103.y = _2609;
    out.m_103.z = _2611;
    if (_2591)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2697 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2697;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

