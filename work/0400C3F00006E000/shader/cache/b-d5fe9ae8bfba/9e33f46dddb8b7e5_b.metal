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
    float4 m_67 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_101 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_71 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_87 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 m_95 [[user(locn15)]];
    float4 m_89 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3145 = false;
    bool _700 = false;
    bool _564 = false;
    bool _456 = false;
    bool _228 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_46.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (!_124)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_124)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3449 = as_type<float>(_134);
        out.gl_Position.z = _3449;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_51.w;
    float _140 = float(_120);
    float _142 = 1.0 / _140;
    float _144 = -_138;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_138);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = _146 * _142;
    bool _160 = _146 >= _140;
    bool _162 = !_156;
    bool _164 = _160 || _162;
    out.m_53.x = _158;
    float _166 = _138;
    float _168 = _146;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _166;
    if (_164)
    {
        out.m_49.x = 0.0;
    }
    if (_164)
    {
        float _172 = _170 * 5.0;
        _136 = as_type<int>(_172);
    }
    int _174 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3521 = as_type<float>(_174);
        out.gl_Position.z = _3521;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    bool _202 = !_182;
    float _204 = _200;
    float _206 = _198;
    float _208 = _196;
    float _226;
    if (!_202)
    {
        float _210 = in.m_57.x;
        float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _218 = _216 * _212;
        float _220 = floor(_218);
        float _222 = -_220;
        float _224 = _218 + _222;
        _226 = _224;
        _228 = true;
    }
    else
    {
        _226 = _158;
    }
    _228 = false;
    float _230 = _226;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _230 + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _230 + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _230 + _252;
    float _256 = 1.0 / _246;
    bool _258 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _260 = isnan(_230);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = 1.0 / _242;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = -_268;
    float _278 = _276 + 1.0;
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _282 = 1.0 / _250;
    float _284 = _238 * _256;
    bool _286 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_230);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = _296 * _278;
    float _300 = _234 * _270;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _306;
    float _310 = -_296;
    float _312 = _310 + 1.0;
    float _314 = fma(_274, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_304, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _322 = _254 * _282;
    bool _324 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_230);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = fma(_308, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _338 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_230);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = -_334;
    float _360 = _358 + 1.0;
    float _362 = _334 * _312;
    float _364 = fma(_352, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_320, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _368 = fma(_356, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = _348 * _360;
    float _372 = in.m_59.x;
    float _374 = in.m_59.y;
    float _376 = in.m_59.z;
    float _378 = -_348;
    float _380 = _378 + 1.0;
    float _382 = _316 * _370;
    float _384 = _336 * _370;
    float _386 = _314 * _370;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _388;
    float _392 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _384);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _400;
    float _404 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _386);
    float _406 = fma(_390, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _408 = fma(_398, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _410 = fma(_402, _322, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _412 = fma(_364, _362, _392);
    float _414 = fma(_366, _362, _394);
    float _416 = fma(_368, _362, _404);
    float _418 = fma(_406, _298, _412);
    float _420 = fma(_408, _298, _414);
    float _422 = fma(_410, _298, _416);
    float _424 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[146].x, _418);
    float _426 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[146].y, _420);
    float _428 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[146].z, _422);
    float _430 = _424 * _372;
    float _432 = _426 * _374;
    float _434 = _428 * _376;
    bool _436 = !_280;
    float _454;
    if (!_436)
    {
        float _438 = in.m_57.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].x, _146);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        _454 = _158;
    }
    _456 = false;
    float _458 = _454;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _462 = _458 + _460;
    bool _464 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _466 = isnan(_458);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _476;
    bool _480 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _482 = isnan(_458);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_474;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = 1.0 / _478;
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _504 = _490 * _494;
    float _506 = -_490;
    float _508 = _506 + 1.0;
    float _510 = _462 * _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _512;
    float _516 = fma(_498, _510, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _518;
    float _522 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _524 = _516 * _504;
    float _526 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _528 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[107].x, _524);
    float _530 = _526 * _504;
    float _532 = _522 * _504;
    float _534 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[108].x, _528);
    float _536 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[107].y, _530);
    float _538 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[107].z, _532);
    float _540 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[108].y, _536);
    float _542 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[108].z, _538);
    bool _544 = !_502;
    float _562;
    if (!_544)
    {
        float _546 = in.m_57.x;
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _550 = _546 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        _562 = _158;
    }
    _564 = false;
    float _566 = _562;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _570 = _566 + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _576 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_566);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _592 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _594 = isnan(_566);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _604;
    bool _608 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _610 = isnan(_566);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = 1.0 / _574;
    float _622 = -_586;
    float _624 = _622 + 1.0;
    bool _626 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _628 = _602 * _624;
    float _630 = -_602;
    float _632 = _630 + 1.0;
    float _634 = 1.0 / _590;
    float _636 = _606 * _620;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _644 = fma(_636, _570, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = _640 * _634;
    float _650 = _644 * _628;
    float _652 = -_618;
    float _654 = _652 + 1.0;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _566 + _656;
    float _660 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[115].x, _650);
    float _662 = _586 * _654;
    float _664 = fma(_648, _658, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _666 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _668 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _670 = fma(_664, _662, _660);
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[117].x, _670);
    float _678 = _676 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _680 = !_626;
    float _698;
    if (!_680)
    {
        float _682 = in.m_57.x;
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _686 = _682 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _690 = _688 * _684;
        float _692 = floor(_690);
        float _694 = -_692;
        float _696 = _690 + _694;
        _698 = _696;
        _700 = true;
    }
    else
    {
        _698 = _158;
    }
    _700 = false;
    float _702 = _698;
    float _704 = in.m_57.z;
    float _706 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = in.m_57.y;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _712 = _710 != 0;
    float _714 = _706 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _716 = in.m_46.x;
    float _718 = in.m_46.y;
    float _720 = in.m_46.z;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _728 = _726 != 0;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _732 = _730 != 0;
    float _734 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = in.m_57.x;
    float _738 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _740 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _742 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _738);
    float _744 = _704 * 2.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _750 = _708 * 2.0;
    float _752 = _708 + _704;
    float _754 = floor(_744);
    float _756 = fma(_158, _748, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _758 = _718 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _760 = _718 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = _718 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _764 = _752 + (-1.0);
    float _766 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[4].x, _758);
    float _768 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _770 = floor(_750);
    float _772 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[6].x, _762);
    float _774 = _716;
    if (_712)
    {
        _774 = _736;
    }
    float _776 = _774;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _780 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[4].z, _766);
    float _782 = _776;
    if (!_712)
    {
        _782 = _704;
    }
    float _784 = _782;
    float _786 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    bool _788 = _754 >= 0.0;
    bool _790 = isnan(_754);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _800 = _754 > 0.0;
    float _802 = _784 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _804 = _796 ? 0 : 1;
    float _806 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[6].z, _772);
    float _808 = -_798;
    float _810 = fma(_802, 2.0, _808);
    bool _812 = _770 > 0.0;
    float _814 = _704 + _736;
    float _816 = _802;
    if (_712)
    {
        _816 = _708;
    }
    float _818 = _816;
    float _820 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _742);
    float _822 = _814 + (-1.0);
    float _824 = _818;
    if (!_712)
    {
        _824 = _736;
    }
    float _826 = _824;
    float _828 = _736 * 2.0;
    bool _830 = _770 >= 0.0;
    bool _832 = isnan(_770);
    bool _834 = _830 || _832;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _842 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _844 = log2(_842);
    float _846 = _826 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _848 = _786 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _850 = _838 ? 0 : 1;
    float _852 = fma(_846, -2.0, _840);
    float _854 = _708 + _736;
    float _856 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _858 = ~_850;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    float _864 = floor(_828);
    bool _866 = !_724;
    int _868 = _866 ? 0 : 1;
    float _870 = _854 + (-1.0);
    int _872 = _862;
    if (!_812)
    {
        int _874 = ~_850;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    float _880 = _780 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _882 = !_732;
    int _884 = _882 ? 0 : 1;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _888 = _848 + _886;
    float _890 = _844 * _146;
    int _892 = ~_804;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = _806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _900 = abs(_868);
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _904 = _880 + _902;
    int _906 = _896;
    if (!_800)
    {
        int _908 = ~_804;
        int _910 = _908 + 1;
        _906 = _910;
    }
    int _912 = _906;
    float _914 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = abs(_884);
    float _918 = exp2(_890);
    float _920 = float(_900);
    float _922 = -_146;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[86].x, _810);
    float _926 = float(_916);
    float _928 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _852);
    float _930 = float(_912);
    float _932 = -_880;
    float _934 = _932 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _936 = float(_878);
    float _938 = _820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _940 = _920 * _930;
    float _942 = _926 * _936;
    bool _944 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _946 = isnan(1.0);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _952 = _948 || _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _956 = 1.0 + _954;
    bool _958 = _864 > 0.0;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _962 = _864 >= 0.0;
    bool _964 = isnan(_864);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    float _972 = in.m_61.x;
    float _974 = in.m_61.y;
    float _976 = in.m_61.z;
    float _978 = -_918;
    float _980 = _978 + 1.0;
    float _982 = 1.0 / _956;
    float _984 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[88].w, _960);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _988 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _990 = isnan(0.0);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _996 = _992 || _994;
    float _998 = _940 * (-2.0);
    float _1000 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _984);
    float _1002 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _986);
    float _1004 = _996 ? _980 : 0.0;
    float _1006 = _942 * (-2.0);
    int _1008 = _970 ? 0 : 1;
    float _1010 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1002);
    float _1012 = _888 * _888;
    float _1014 = fma(_914, _998, _914);
    int _1016 = ~_1008;
    int _1018 = _1016 + 1;
    int _1020 = _1018 + 1;
    float _1022 = _704 + (-0.5);
    int _1024 = _1020;
    if (!_958)
    {
        int _1026 = ~_1008;
        int _1028 = _1026 + 1;
        _1024 = _1028;
    }
    int _1030 = _1024;
    if (_952)
    {
        float _1032 = _1004 * _982;
        _168 = _1032;
    }
    float _1034 = _168;
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1038 = _898 + _1036;
    float _1040 = fma(_904, _904, _1012);
    float _1042 = _736 + (-0.5);
    float _1044 = -_848;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = float(_1030);
    float _1050 = fma(_1038, _1038, _1040);
    float _1052 = fma(_998, _972, _972);
    bool _1054 = !_728;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = _1046 * _1046;
    float _1060 = sqrt(_1050);
    float _1062 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1052);
    int _1064 = abs(_1056);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1066;
    float _1070 = -_898;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = fma(_934, _934, _1058);
    float _1076 = float(_1064);
    float _1078 = fma(_1014, _1034, _1062);
    float _1080 = rsqrt(_1050);
    float _1082 = fma(_1072, _1072, _1074);
    float _1084 = _1076 * _1048;
    float _1086 = _1084 * (-2.0);
    float _1088 = _1060 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1090 = fma(_1006, _976, _976);
    float _1092 = fma(_856, _1006, _856);
    float _1094 = fma(_778, _1086, _778);
    float _1096 = sqrt(_1082);
    float _1098 = precise::min(_714, _1088);
    float _1100 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1090);
    float _1102 = _848 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1104 = fma(_1086, _974, _974);
    float _1106 = _708 + (-0.5);
    float _1108 = _1080 * _1098;
    float _1110 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1102);
    float _1112 = fma(_1092, _1034, _1100);
    float _1114 = _1078 * 0.15915493667125701904296875;
    float _1116 = _888 * _1108;
    float _1118 = _904 * _1108;
    float _1120 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1110);
    float _1122 = _1038 * _1108;
    float _1124 = -_1116;
    float _1126 = _888 + _1124;
    float _1128 = -_1118;
    float _1130 = _904 + _1128;
    float _1132 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1134 = -_1122;
    float _1136 = _1038 + _1134;
    float _1138 = _1126 * _1126;
    float _1140 = rsqrt(_1082);
    float _1142 = -_1132;
    float _1144 = _938 + _1142;
    float _1146 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1104);
    float _1148 = fma(_1130, _1130, _1138);
    float _1150 = abs(_1144);
    float _1152 = precise::max(_1150, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1154 = fma(_1136, _1136, _1148);
    float _1156 = 1.0 / _1068;
    float _1158 = fma(_1094, _1034, _1146);
    float _1160 = _1112 * 0.15915493667125701904296875;
    float _1162 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1164 = precise::min(_1152, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1166 = _1158 * 0.15915493667125701904296875;
    bool _1168 = _1132 >= _938;
    bool _1170 = isnan(_1132);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(_938);
    bool _1176 = _1172 || _1174;
    float _1178 = sqrt(_1154);
    float _1180 = abs(_1096);
    float _1182 = precise::max(0.0, _1180);
    float _1184 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1162);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1188 = _1164 + _1186;
    float _1190 = _934 * _1140;
    bool _1192 = !_1176;
    float _1194 = _1192 ? 1.0 : (-1.0);
    float _1196 = _1072 * _1140;
    float _1198 = _1114 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = precise::min(_1182, 40.0);
    float _1204 = _1188 * _1156;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1208 = _1190 * _1206;
    float _1210 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1184);
    float _1212 = _1046 * _1140;
    float _1214 = _1194 * _1204;
    float _1216 = fma(_1202, -0.02500000037252902984619140625, 1.0);
    float _1218 = _1114 * 6.283185482025146484375;
    float _1220 = cos(_1218);
    float _1222 = _1080 * _1178;
    float _1224 = _158 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1226 = in.m_63.x;
    float _1228 = in.m_63.y;
    float _1230 = in.m_63.z;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1234 = _1196 * _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1238 = -_1208;
    float _1240 = fma(_1196, _1236, _1238);
    float _1242 = _1224 * _1214;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1246 = _1212 * _1244;
    float _1248 = _1160 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1254 = -_1234;
    float _1256 = fma(_1212, _1252, _1254);
    float _1258 = _1240 * _1240;
    float _1260 = _706 * _1222;
    float _1262 = _1242 * 0.15915493667125701904296875;
    float _1264 = fma(_1256, _1256, _1258);
    float _1266 = _1166 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = _1166 * 6.283185482025146484375;
    float _1272 = sin(_1270);
    float _1274 = _1220 * _1250;
    float _1276 = _1200 * _1250;
    float _1278 = _1160 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1268 * _1250;
    float _1284 = _1220 * _1268;
    float _1286 = _1220 * _1272;
    float _1288 = _1200 * _1272;
    float _1290 = _1272 * _1250;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1294 = -_1246;
    float _1296 = fma(_1190, _1292, _1294);
    float _1298 = _1200 * _1268;
    float _1300 = _734 * _1222;
    float _1302 = fma(_1296, _1296, _1264);
    float _1304 = fma(_1280, _1284, _1288);
    float _1306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1228);
    float _1308 = fma(_1280, _1288, _1284);
    float _1310 = -_1286;
    float _1312 = fma(_1280, _1298, _1310);
    float _1314 = -_1298;
    float _1316 = fma(_1280, _1286, _1314);
    float _1318 = rsqrt(_1302);
    float _1320 = _1300 * _1306;
    float _1322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1226);
    float _1324 = _740 * _1222;
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1230);
    float _1328 = -_1320;
    float _1330 = _1280 * _1328;
    float _1332 = _1274 * _1320;
    float _1334 = _1260 * _1322;
    float _1336 = _1276 * _1320;
    float _1338 = rsqrt(_1210);
    float _1340 = _1324 * _1326;
    float _1342 = fma(_1304, _1334, _1332);
    float _1344 = fma(_1312, _1334, _1336);
    float _1346 = fma(_1282, _1334, _1330);
    float _1348 = fma(_1316, _1340, _1342);
    float _1350 = _1296 * _1318;
    float _1352 = _1240 * _1318;
    float _1354 = _1256 * _1318;
    float _1356 = fma(_1308, _1340, _1344);
    float _1358 = _1190 * _1350;
    float _1360 = _1196 * _1352;
    float _1362 = fma(_1290, _1340, _1346);
    float _1364 = _1212 * _1354;
    float _1366 = -_1358;
    float _1368 = fma(_1196, _1354, _1366);
    float _1370 = -_1360;
    float _1372 = fma(_1212, _1350, _1370);
    float _1374 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1376 = -_1364;
    float _1378 = fma(_1190, _1352, _1376);
    float _1380 = _1368 * _1348;
    float _1382 = _1372 * _1348;
    float _1384 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1386 = _1374 * _1374;
    float _1388 = fma(_1352, _1362, _1380);
    float _1390 = fma(_1354, _1362, _1382);
    float _1392 = _1378 * _1348;
    float _1394 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1396 = fma(_1212, _1356, _1388);
    float _1398 = fma(_1384, _1384, _1386);
    float _1400 = fma(_1190, _1356, _1390);
    float _1402 = fma(_1350, _1362, _1392);
    float _1404 = _848 + _1396;
    float _1406 = _848 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1408 = fma(_1394, _1394, _1398);
    float _1410 = _880 + _1400;
    float _1412 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1414 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1416 = fma(_1196, _1356, _1402);
    float _1418 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1420 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1406);
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1412);
    float _1424 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1414);
    float _1426 = _898 + _1416;
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1418);
    float _1430 = rsqrt(_1408);
    float _1432 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1434 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1424);
    float _1436 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1428);
    float _1438 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1446 = _1262 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    float _1450 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1452 = -_1442;
    float _1454 = _1452 + _1440;
    float _1456 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1458 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1460 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1462 = fma(_1216, _1454, _1442);
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1456);
    float _1466 = _1262 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = _1394 * _1430;
    float _1472 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1458);
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1460);
    float _1476 = _1384 * _1430;
    float _1478 = _1374 * _1430;
    float _1480 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1464);
    float _1482 = _1470 * _1470;
    float _1484 = -_1448;
    float _1486 = _1484 + 1.0;
    float _1488 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1472);
    float _1490 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1492 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1474);
    float _1494 = _1478 * _1486;
    float _1496 = fma(_1486, _1482, _1448);
    float _1498 = _1476 * _1486;
    float _1500 = _1488 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1502 = _1476 * _1468;
    float _1504 = _1478 * _1468;
    float _1506 = _1470 * _1468;
    float _1508 = -_848;
    float _1510 = _1508 + _1490;
    float _1512 = fma(_1470, _1494, _1502);
    float _1514 = -_1504;
    float _1516 = fma(_1470, _1498, _1514);
    float _1518 = -_1506;
    float _1520 = fma(_1478, _1498, _1518);
    float _1522 = -_880;
    float _1524 = _1522 + _1500;
    float _1526 = _1512 * _1510;
    float _1528 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1530 = fma(_1476, _1498, _1448);
    float _1532 = _1520 * _1510;
    float _1534 = fma(_1516, _1524, _1526);
    float _1536 = -_898;
    float _1538 = _1536 + _1528;
    float _1540 = fma(_1470, _1498, _1504);
    float _1542 = fma(_1530, _1524, _1532);
    float _1544 = fma(_1478, _1494, _1448);
    float _1546 = fma(_1496, _1538, _1534);
    float _1548 = fma(_1478, _1498, _1506);
    float _1550 = fma(_1540, _1538, _1542);
    float _1552 = _1544 * _1510;
    float _1554 = fma(_1546, _756, _898);
    float _1556 = -_1116;
    float _1558 = _848 + _1556;
    float _1560 = fma(_1550, _756, _880);
    float _1562 = -_1502;
    float _1564 = fma(_1470, _1494, _1562);
    float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1568 = _1554 + _1566;
    float _1570 = fma(_1548, _1524, _1552);
    float _1572 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1574 = _1560 + _1572;
    float _1576 = -_1118;
    float _1578 = _880 + _1576;
    float _1580 = _1568 * _1568;
    float _1582 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1584 = fma(_1564, _1538, _1570);
    float _1586 = -_1122;
    float _1588 = _898 + _1586;
    float _1590 = fma(_1574, _1574, _1580);
    float _1592 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1582);
    float _1594 = _848 + _1584;
    float _1596 = sqrt(_1590);
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1592);
    bool _1600 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1602 = _1592;
    float _1604 = _1580;
    float _1606 = _1584;
    float _1608 = _1116;
    float _1610 = _1568;
    if (!_1600)
    {
        _1602 = _1560;
    }
    float _1612 = _1602;
    float _1614 = _1612;
    if (!_1600)
    {
        _1604 = _1554;
    }
    float _1616 = _1604;
    float _1618 = _1616;
    if (!_1600)
    {
        _1606 = _1594;
    }
    float _1620 = _1606;
    bool _1622 = !_1600;
    float _1624 = _1620;
    if (!_1622)
    {
        float _1626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1630 = _1596 + _1628;
        float _1632 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = _1630 * _1626;
        float _1636 = rsqrt(_1590);
        float _1638 = _1634 * 0.15915493667125701904296875;
        float _1640 = _1638 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        float _1644 = _1638 * 6.283185482025146484375;
        float _1646 = cos(_1644);
        float _1648 = fma(_1642, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1650 = _1636 * _1648;
        float _1652 = _1646 + (-1.0);
        float _1654 = fma(_1574, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1656 = fma(_1568, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1660 = fma(_1594, _1646, _1658);
        _1624 = _1660;
        _1614 = _1654;
        _1618 = _1656;
    }
    float _1662 = _1624;
    float _1664 = _1614;
    float _1666 = _1618;
    float _1668 = -_848;
    float _1670 = _1668 + _1662;
    float _1672 = -_880;
    float _1674 = _1672 + _1664;
    float _1676 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1678 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1680 = _1670 * _1670;
    float _1682 = -_898;
    float _1684 = _1682 + _1666;
    float _1686 = 1.0 / _1676;
    float _1688 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1678);
    float _1690 = fma(_1674, _1674, _1680);
    float _1692 = -_1118;
    float _1694 = _1692 + _1664;
    float _1696 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1688);
    float _1698 = fma(_1684, _1684, _1690);
    float _1700 = -_1122;
    float _1702 = _1700 + _1666;
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1706 = sqrt(_1698);
    float _1708 = _1704 + _1676;
    float _1710 = _1708 * _1686;
    float _1712 = _1710 * 0.5;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1716 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1714);
    float _1718 = 1.0 / _1716;
    bool _1720 = _1706 > 0.0;
    bool _1722 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan(0.5);
    bool _1730 = _1726 || _1728;
    float _1732 = -_1116;
    float _1734 = _1732 + _1662;
    bool _1736 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan(0.5);
    bool _1744 = _1740 || _1742;
    float _1746 = _1664;
    float _1748 = _1666;
    float _1750 = _1662;
    float _1752 = _1674;
    float _1754 = _1734;
    float _1756 = _1686;
    if (!_1720)
    {
        _1746 = _1694;
    }
    float _1758 = _1746;
    float _1760 = _1758;
    float _1762 = _1758;
    if (!_1720)
    {
        _1748 = _1734;
    }
    float _1764 = _1748;
    float _1766 = _1764;
    if (!_1720)
    {
        _1750 = _1702;
    }
    float _1768 = _1750;
    bool _1770 = !_1720;
    float _1772 = _1768;
    if (!_1770)
    {
        float _1774 = _198 * _198;
        float _1776 = rsqrt(_1698);
        float _1778 = fma(_196, _196, _1774);
        float _1780 = fma(_200, _200, _1778);
        float _1782 = sqrt(_1780);
        float _1784 = _1674 * _1776;
        float _1786 = _1670 * _1776;
        float _1788 = _1684 * _1776;
        bool _1790 = _1782 > 0.0;
        float _1792 = _1776;
        float _1794 = _1782;
        if (!_1790)
        {
            _1760 = _1694;
        }
        float _1796 = _1760;
        _1762 = _1796;
        if (!_1790)
        {
            _1792 = _1734;
        }
        float _1798 = _1792;
        _1766 = _1798;
        if (!_1790)
        {
            _1794 = _1702;
        }
        float _1800 = _1794;
        bool _1802 = !_1790;
        _1772 = _1800;
        if (!_1802)
        {
            float _1804 = rsqrt(_1780);
            float _1806 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1808 = _198 * _1804;
            float _1810 = _196 * _1804;
            float _1812 = _200 * _1804;
            float _1814 = _1786 * _1808;
            float _1816 = fma(_1784, _1810, _1814);
            float _1818 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1820 = fma(_1788, _1812, _1816);
            float _1822 = _1820 * _1818;
            float _1824 = fma(_196, _1822, _1694);
            float _1826 = fma(_198, _1822, _1734);
            float _1828 = fma(_200, _1822, _1702);
            _1762 = _1824;
            _1766 = _1826;
            _1772 = _1828;
        }
    }
    float _1830 = _1762;
    float _1832 = _1766;
    float _1834 = _1772;
    if (_1730)
    {
        _1752 = 1.0;
    }
    float _1836 = _1752;
    float _1838 = _1836;
    if (_1744)
    {
        _204 = _1830;
    }
    float _1840 = _204;
    float _1842 = _1840;
    if (_1744)
    {
        _206 = _1832;
    }
    float _1844 = _206;
    float _1846 = _1844;
    if (_1744)
    {
        _208 = _1834;
    }
    float _1848 = _208;
    float _1850 = _1848;
    if (!_1744)
    {
        float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1854 = _1558 + _1852;
        float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1858 = _1578 + _1856;
        float _1860 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1862 = -_1578;
        float _1864 = _1862 + _1830;
        float _1866 = _1854 * _1854;
        float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1870 = _1588 + _1868;
        float _1872 = -_1558;
        float _1874 = _1872 + _1832;
        float _1876 = -_1588;
        float _1878 = _1876 + _1834;
        float _1880 = fma(_1858, _1858, _1866);
        float _1882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1884 = fma(_1870, _1870, _1880);
        float _1886 = sqrt(_1884);
        float _1888 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1890 = precise::min(_1886, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1892 = _1890 * _1882;
        float _1894 = _1888 * _1892;
        float _1896 = fma(_1864, _1894, _1578);
        float _1898 = fma(_1874, _1894, _1558);
        float _1900 = fma(_1878, _1894, _1588);
        _1754 = _1882;
        _1846 = _1898;
        _1842 = _1896;
        _1850 = _1900;
    }
    float _1902 = _1754;
    float _1904 = _1846;
    float _1906 = _1842;
    float _1908 = _1850;
    float _1910 = _1902;
    if (_1730)
    {
        _1756 = 1.0;
    }
    float _1912 = _1756;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1916 = _1718 * _1914;
    float _1918 = _1912;
    if (!_1730)
    {
        float _1920 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1922 = _1920 * 0.15915493667125701904296875;
        float _1924 = _1922 * 6.283185482025146484375;
        float _1926 = cos(_1924);
        float _1928 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1930 = _1928 * 0.15915493667125701904296875;
        float _1932 = _1922 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = 1.0 / _1926;
        float _1938 = _1930 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1934 * _1936;
        float _1944 = _1930 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1950 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1948;
        float _1952 = _1940 * _1942;
        float _1954 = 1.0 / _1950;
        float _1956 = 1.0 / _1952;
        float _1958 = _1946 * _1956;
        float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1962 = fma(_1916, _1958, _1960);
        float _1964 = _1962 * _1954;
        float _1966 = precise::clamp(_1964, 0.0, 1.0);
        _1910 = _1942;
        _1608 = _1922;
        _1838 = _1966;
    }
    float _1968 = _1910;
    float _1970 = _1608;
    float _1972 = _1838;
    float _1974 = _1968;
    float _1976 = _1970;
    if (!_1730)
    {
        float _1978 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1980 = _1978 * 0.15915493667125701904296875;
        float _1982 = _1980 * 6.283185482025146484375;
        float _1984 = cos(_1982);
        float _1986 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1988 = _1986 * 0.15915493667125701904296875;
        float _1990 = _1980 * 6.283185482025146484375;
        float _1992 = sin(_1990);
        float _1994 = 1.0 / _1984;
        float _1996 = _1988 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        float _2000 = _1992 * _1994;
        float _2002 = _1988 * 6.283185482025146484375;
        float _2004 = sin(_2002);
        float _2006 = _1998 * _2000;
        float _2008 = 1.0 / _2006;
        float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2012 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2010;
        float _2014 = 1.0 / _2012;
        float _2016 = _2004 * _2008;
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2020 = fma(_1916, _2016, _2018);
        float _2022 = _2020 * _2014;
        float _2024 = precise::clamp(_2022, 0.0, 1.0);
        float _2026 = -_2024;
        float _2028 = _2026 + 1.0;
        _1974 = _1994;
        _1918 = _2028;
    }
    float _2030 = _1974;
    float _2032 = _1918;
    float _2034 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2036 = _1904 + _2034;
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2040 = _1906 + _2038;
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2044 = _1908 + _2042;
    float _2046 = _2036 * _2036;
    float _2048 = fma(_2040, _2040, _2046);
    float _2050 = fma(_2044, _2044, _2048);
    float _2052 = rsqrt(_2050);
    float _2054 = sqrt(_2050);
    float _2056 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2058 = _2040 * _2056;
    float _2060 = _2044 * _2056;
    float _2062 = _2058 * _2058;
    float _2064 = _2060 * _2060;
    float _2066 = _2062 + _2064;
    float _2068 = sqrt(_2066);
    bool _2070 = _2068 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2074 = _2068 + _2072;
    float _2076 = _2044;
    float _2078 = _2046;
    float _2080 = _2074;
    float _2082 = _2036;
    float _2084 = _2030;
    if (_2070)
    {
        float _2086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2076 = _2086;
    }
    float _2088 = _2076;
    if (_2070)
    {
        float _2090 = rsqrt(_2066);
        _2078 = _2090;
    }
    float _2092 = _2078;
    float _2094 = _2092;
    if (_2070)
    {
        float _2096 = _2074 * _2088;
        _2080 = _2096;
    }
    float _2098 = _2080;
    if (_2070)
    {
        float _2100 = _2098 * 0.15915493667125701904296875;
        _1976 = _2100;
    }
    float _2102 = _1976;
    float _2104 = _2052;
    float _2106 = _2102;
    if (_2070)
    {
        float _2108 = _2102 * 6.283185482025146484375;
        float _2110 = sin(_2108);
        _2104 = _2110;
    }
    float _2112 = _2104;
    float _2114 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2116 = precise::max(0.0, _2114);
    float _2118 = _2088;
    float _2120 = _2116;
    if (_2070)
    {
        float _2122 = _2102 * 6.283185482025146484375;
        float _2124 = cos(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    float _2128 = -_2056;
    float _2130 = -_2116;
    float _2132 = fma(_2036, _2128, _2130);
    if (_2070)
    {
        float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2082 = _2134;
    }
    float _2136 = _2082;
    if (!_2070)
    {
        _2106 = _2062;
    }
    float _2138 = _2106;
    float _2140 = _2112;
    float _2142 = _2138;
    if (_2070)
    {
        float _2144 = fma(_2112, _2136, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2084 = _2144;
    }
    float _2146 = _2084;
    float _2148 = _2146;
    if (!_2070)
    {
        _2140 = _2132;
    }
    float _2150 = _2140;
    float _2152 = _2150;
    float _2154 = _2126;
    if (_2070)
    {
        float _2156 = _2126 + (-1.0);
        _2120 = _2156;
    }
    float _2158 = _2120;
    float _2160 = _2158;
    if (_2070)
    {
        float _2162 = _2092 * _2146;
        _1610 = _2162;
    }
    float _2164 = _1610;
    if (!_2070)
    {
        _2094 = _2058;
    }
    float _2166 = _2094;
    float _2168 = _2166;
    if (_2070)
    {
        float _2170 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2160 = _2170;
    }
    float _2172 = _2160;
    if (_2070)
    {
        float _2174 = _2058 * _2164;
        _2168 = _2174;
    }
    float _2176 = _2168;
    if (!_2070)
    {
        _2148 = _2064;
    }
    float _2178 = _2148;
    float _2180 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2182 = _2178;
    if (_2070)
    {
        float _2184 = fma(_2132, _2126, _2172);
        _2152 = _2184;
    }
    float _2186 = _2152;
    if (!_2070)
    {
        _2154 = _2060;
    }
    float _2188 = _2154;
    float _2190 = _2188;
    if (_2070)
    {
        float _2192 = _2176 * _2176;
        _2142 = _2192;
    }
    float _2194 = _2142;
    if (_2070)
    {
        float _2196 = _2060 * _2164;
        _2190 = _2196;
    }
    float _2198 = _2190;
    float _2200 = floor(_2180);
    float _2202 = fma(_2186, _2186, _2194);
    if (_2070)
    {
        float _2204 = _2198 * _2198;
        _2182 = _2204;
    }
    float _2206 = _2182;
    float _2208 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2210 = _2202 + _2206;
    float _2212 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2208);
    float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2216 = fma(_2054, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2214);
    float _2218 = precise::clamp(_2216, 0.0, 1.0);
    float _2220 = rsqrt(_2210);
    float _2222 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2212);
    float _2224 = -_2218;
    float _2226 = _2224 + 1.0;
    float _2228 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2230 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2232 = fma(_1588, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2234 = abs(_2226);
    float _2236 = log2(_2234);
    float _2238 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2240 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2242 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2244 = -_2200;
    float _2246 = _2180 + _2244;
    float _2248 = -_2238;
    float _2250 = fma(_2248, _2230, 1.0);
    float _2252 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2254 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2240);
    float _2256 = _2220 * _2176;
    float _2258 = _2220 * _2186;
    float _2260 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2252);
    float _2262 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2254);
    float _2264 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2266 = _2220 * _2198;
    float _2268 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2260);
    float _2270 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2272 = -_2264;
    float _2274 = fma(_2258, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2272);
    float _2276 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2242);
    float _2278 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2280 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2282 = -_2266;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2274);
    float _2286 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2276);
    float _2288 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2290 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2280);
    float _2292 = floor(_2232);
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2296 = fma(_2284, -0.5, 0.5);
    float _2298 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2290);
    float _2300 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2302 = fma(_2284, 0.5, 0.5);
    float _2304 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2298);
    float _2306 = exp2(_2288);
    float _2308 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2310 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2300);
    float _2312 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2308);
    float _2314 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2310);
    float _2316 = 1.0 / _2304;
    float _2318 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2312);
    float _2320 = -_2292;
    float _2322 = _2232 + _2320;
    float _2324 = fma(_2302, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2326 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2314);
    float _2328 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2318);
    float _2330 = fma(_2302, _2324, -0.212114393711090087890625);
    float _2332 = log2(_2250);
    float _2334 = sqrt(_2296);
    float _2336 = _2326 * _2316;
    float2 _6960 = float2(_2246, _2322);
    float _2338 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6960, float2(0.0), isnan(_6960)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6960, float2(0.0), isnan(_6960)), level(0.0)).x;
    float _2340 = fma(_2302, _2330, 1.570728778839111328125);
    float _2342 = _2332 * 0.693147182464599609375;
    float _2344 = _2258 + 1.0;
    float _2346 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2348 = -_2258;
    float _2350 = fma(_2306, _2344, _2348);
    float _2352 = _2328 * _2316;
    float _2354 = fma(_2336, 0.5, 0.5);
    float _2356 = _2334 * 0.636619746685028076171875;
    float _2358 = fma(_2350, 0.5, 0.5);
    float _2360 = fma(_2352, -0.5, 0.5);
    float _2362 = -_2340;
    float _2364 = fma(_2356, _2362, 1.0);
    float3 _7007 = float3(_2354, _2360, _2346);
    float _2366 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7007, float3(0.0), isnan(_7007)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7007, float3(0.0), isnan(_7007)), level(0.0)).x;
    float3 _7018 = float3(_2354, _2360, _2346);
    float4 _2369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7018, float3(0.0), isnan(_7018)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7018, float3(0.0), isnan(_7018)), level(0.0)).xyzw;
    float _2371 = _2369.x;
    float _2373 = _2369.y;
    float _2375 = _2369.z;
    float _2377 = _2369.w;
    float2 _7034 = float2(_2364, _2358);
    float3 _2381 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7034, float2(0.0), isnan(_7034)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7034, float2(0.0), isnan(_7034)), level(0.0)).xyz;
    float _2383 = _2381.x;
    float _2385 = _2381.y;
    float _2387 = _2381.z;
    float _2389 = in.m_57.w;
    float _2391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2393 = in.m_65.y;
    bool _2395 = _704 > 0.5;
    float _2397 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2399 = _708 > 0.5;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2407 = _2405 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2409 = in.m_65.x;
    float _2411 = 1.0 / _2403;
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    out.m_67.x = _646;
    out.m_67.y = _672;
    out.m_67.z = _674;
    out.m_67.w = _678;
    float _2417 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2419 = 1.0 / _2407;
    out.m_69.w = _1098;
    bool _2421 = _2389 > 0.5;
    out.m_71.x = _1578;
    out.m_71.y = _1558;
    out.m_71.z = _1588;
    float _2423 = -_2393;
    float _2425 = _2423 + 1.0;
    float _2427 = 1.0 / _2415;
    int _2429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2431 = _2429 != 0;
    float _2433 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2435 = _2433 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2439 = _2437 != 0;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2443 = _702 + _2441;
    int _2445 = _2399 ? as_type<int>(_2425) : as_type<int>(_2393);
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2449 = _702 + _2447;
    float _2451 = _2435 * _2419;
    float _2453 = _2439 ? as_type<float>(_2445) : _2393;
    float _2455 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2457 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2455;
    int _2459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2461 = _2459 != 0;
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2465 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2463;
    bool _2467 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2469 = isnan(_702);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2475 = _2471 || _2473;
    float _2477 = float(_2475);
    float _2479 = _2457 * _2411;
    float _2481 = _2419;
    float _2483 = _2411;
    float _2485 = _2393;
    float _2487 = _2326;
    if (!_2431)
    {
        _2481 = _2409;
    }
    float _2489 = _2481;
    float _2491 = _2465 * _2427;
    int _2493 = _2421 ? as_type<int>(_2425) : as_type<int>(_2393);
    float _2495 = fma(_2479, _2449, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2499 = _2497 != 0;
    float _2501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2505 = _2503 != 0;
    float _2507 = _1304 * _1368;
    int _2509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2511 = _2509 != 0;
    float _2513 = fma(_2451, _2443, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2515 = _2489;
    bool _2517 = _2511;
    if (!_2431)
    {
        _2483 = _2489;
    }
    float _2519 = _2483;
    float _2521 = fma(_1282, _1352, _2507);
    float _2523 = _2519;
    if (_2431)
    {
        _2515 = _2409;
    }
    float _2525 = _2515;
    float _2527 = -_2477;
    float _2529 = _2527 + 1.0;
    bool _2531 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2533 = isnan(_702);
    bool _2535 = _2531 || _2533;
    bool _2537 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2539 = _2535 || _2537;
    float _2541 = float(_2539);
    float _2543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2545 = _2511 ? as_type<float>(_2493) : _2393;
    int _2547 = 0;
    float _2549 = _2525;
    if (_2499)
    {
        float _2551 = -_2525;
        float _2553 = _2551 + 1.0;
        _2547 = as_type<int>(_2553);
    }
    int _2555 = _2547;
    float _2557 = as_type<float>(_2555);
    if (_2431)
    {
        bool _2559 = _736 > 0.5;
        _2517 = _2559;
    }
    bool _2561 = _2517;
    float _2563 = _2541 * _2529;
    float _2565 = in.m_73.x;
    float _2567 = in.m_73.y;
    float _2569 = in.m_73.z;
    bool _2571 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2573 = isnan(_702);
    bool _2575 = _2571 || _2573;
    bool _2577 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2579 = _2575 || _2577;
    float _2581 = float(_2579);
    float _2583 = -_2541;
    float _2585 = _2583 + 1.0;
    int _2587 = as_type<int>(_2585);
    if (_2461)
    {
        float _2589 = _2395 ? _2425 : _2393;
        _2485 = _2589;
    }
    float _2591 = _2485;
    float _2593 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2595 = _1228 != 0.0;
    bool _2597 = isnan(_1228);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan(0.0);
    bool _2603 = _2599 || _2601;
    float _2605 = _2581 * _2585;
    bool _2607 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2609 = isnan(_702);
    bool _2611 = _2607 || _2609;
    bool _2613 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2615 = _2611 || _2613;
    float _2617 = float(_2615);
    float _2619 = -_2581;
    float _2621 = _2619 + 1.0;
    bool _2623 = _1226 == 0.0;
    bool _2625 = !_2603;
    bool _2627 = _2623 && _2625;
    float _2629 = _2591;
    if (_2431)
    {
        float _2631 = -_2525;
        float _2633 = _2631 + 1.0;
        _2587 = as_type<int>(_2633);
    }
    int _2635 = _2587;
    float _2637 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2639 = _702 + _2637;
    float _2641 = _2617 * _2621;
    bool _2643 = _1230 == 0.0;
    bool _2645 = _2643 && _2627;
    int _2647 = 0;
    if (_2505)
    {
        float _2649 = -_2525;
        float _2651 = _2649 + 1.0;
        _2647 = as_type<int>(_2651);
    }
    int _2653 = _2647;
    if (_2431)
    {
        float _2655 = _2561 ? as_type<float>(_2635) : _2525;
        _2523 = _2655;
    }
    float _2657 = _2523;
    float _2659 = _2495 * _2641;
    float _2661 = 0.0;
    if (!_2499)
    {
        _2661 = _2525;
    }
    float _2663 = _2661;
    float _2665 = in.m_75.x;
    float _2667 = in.m_75.y;
    float _2669 = in.m_75.z;
    float _2671 = in.m_75.w;
    float _2673 = _2663;
    if (_2499)
    {
        float _2675 = _2395 ? as_type<float>(_2555) : _2525;
        _2673 = _2675;
    }
    float _2677 = _2673;
    float _2679 = fma(_2491, _2639, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2681 = fma(_2593, _2591, -0.5);
    float _2683 = 0.0;
    if (!_2505)
    {
        _2683 = _2525;
    }
    float _2685 = _2683;
    float _2687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2689 = _2685;
    if (_2505)
    {
        float _2691 = _2399 ? as_type<float>(_2653) : _2525;
        _2689 = _2691;
    }
    float _2693 = _2689;
    float _2695 = -_2617;
    float _2697 = _2695 + 1.0;
    float _2699 = _2697;
    if (_2645)
    {
        _2557 = _2567;
    }
    float _2701 = _2557;
    float _2703 = _2545 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2705 = _2701;
    if (_2645)
    {
        _2549 = _2569;
    }
    float _2707 = _2549;
    float _2709 = fma(_2417, _2693, -0.5);
    float _2711 = _2707;
    if (_2645)
    {
        _2629 = _2701;
    }
    float _2713 = _2629;
    float _2715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2717 = _2713;
    if (!_2645)
    {
        _2705 = _2567;
    }
    float _2719 = _2705;
    float _2721 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2659);
    if (!_2645)
    {
        float _2723 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2569);
        _2711 = _2723;
    }
    float _2725 = _2711;
    float _2727 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2729 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_2645)
    {
        float _2731 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2719);
        _2717 = _2731;
    }
    float _2733 = _2717;
    float _2735 = _2453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2739 = fma(_1010, _2709, _924);
    float _2741 = fma(_2513, _2605, _2721);
    float _2743 = _2667 * _2569;
    float _2745 = _2669 * _2565;
    if (_2645)
    {
        _2699 = _2565;
    }
    float _2747 = _2699;
    float _2749 = _2747;
    if (!_2645)
    {
        float _2751 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2565);
        _2749 = _2751;
    }
    float _2753 = _2749;
    float _2755 = -_2743;
    float _2757 = fma(_2669, _2719, _2755);
    float _2759 = _2735 * _2715;
    float _2761 = _2727 * _2687;
    float _2763 = _2729 * _2543;
    float _2765 = -_2745;
    float _2767 = fma(_2665, _2569, _2765);
    float _2769 = _2665 * _2719;
    float _2771 = -_928;
    float _2773 = fma(_1000, _2681, _2771);
    float _2775 = _2739 + 0.5;
    float _2777 = fma(_2679, _2563, _2741);
    float _2779 = _2703 * _2737;
    float _2781 = -_2769;
    float _2783 = fma(_2667, _2565, _2781);
    float _2785 = _1274 * _1368;
    out.m_77.x = _2761;
    out.m_77.y = _2759;
    out.m_77.z = _2763;
    out.m_77.w = _2779;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2789 = fma(_2477, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2777);
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2793 = -_1280;
    float _2795 = fma(_2793, _1352, _2785);
    float _2797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2799 = _2787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2801 = _2791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2803 = _2789 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2805 = _2797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2807 = _1316 * _1368;
    float _2809 = fma(_1276, _1212, _2795);
    float _2811 = _2773 + 0.5;
    float _2813 = _2767 * _2671;
    float _2815 = _1274 * _1372;
    float _2817 = abs(_1916);
    float _2819 = log2(_2817);
    float _2821 = _1274 * _1378;
    float _2823 = _1304 * _1372;
    float _2825 = _1304 * _1378;
    float _2827 = -_1280;
    float _2829 = fma(_2827, _1354, _2815);
    float _2831 = _1316 * _1378;
    float _2833 = -_1280;
    float _2835 = fma(_2833, _1350, _2821);
    float _2837 = fma(_1282, _1350, _2825);
    float _2839 = fma(_1276, _1190, _2829);
    float _2841 = fma(_1290, _1350, _2831);
    float _2843 = fma(_1276, _1196, _2835);
    float _2845 = fma(_1312, _1196, _2837);
    float _2847 = fma(_1308, _1196, _2841);
    out.m_79.x = _2799;
    out.m_79.y = _2801;
    out.m_79.z = _2805;
    out.m_79.w = _2803;
    float _2849 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2851 = fma(_1282, _1354, _2823);
    float _2853 = fma(_1312, _1212, _2521);
    out.m_81.x = _2775;
    out.m_81.y = _2811;
    float _2855 = _2843 * _2667;
    float _2857 = _2757 * _2671;
    float _2859 = exp2(_2849);
    float _2861 = fma(_1312, _1190, _2851);
    float _2863 = _2839 * _2733;
    float _2865 = _2783 * _2671;
    float _2867 = _1316 * _1372;
    bool _2869 = _1916 <= 8000.0;
    bool _2871 = isnan(_1916);
    bool _2873 = _2869 || _2871;
    bool _2875 = isnan(8000.0);
    bool _2877 = _2873 || _2875;
    float _2879 = float(_2877);
    out.m_83.x = _1260;
    float _2881 = fma(_1290, _1352, _2807);
    float _2883 = _2809 * _2667;
    float _2885 = _2809 * _2733;
    float _2887 = _2813 * _2809;
    float _2889 = fma(_1308, _1212, _2881);
    float _2891 = _2839 * _2667;
    float _2893 = _2813 * _2839;
    float _2895 = _2843 * _2733;
    float _2897 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2899 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2901 = precise::clamp(_2899, 0.0, 1.0);
    float _2903 = _2813 * _2843;
    float _2905 = fma(_2857, _2861, _2893);
    float _2907 = fma(_2853, _2753, _2885);
    float _2909 = fma(_2901, -2.0, 3.0);
    float _2911 = _2901 * _2901;
    float _2913 = fma(_2853, _2665, _2883);
    float _2915 = fma(_2857, _2853, _2887);
    float _2917 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2897);
    float _2919 = _2911 * _2909;
    float _2921 = fma(_2857, _2845, _2903);
    float _2923 = exp2(_2397);
    float _2925 = fma(_1290, _1354, _2867);
    float _2927 = -_2919;
    float _2929 = _2927 + 1.0;
    float _2931 = fma(_2861, _2753, _2863);
    float _2933 = fma(_2861, _2665, _2891);
    float _2935 = fma(_1308, _1190, _2925);
    float _2937 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2919);
    float _2939 = fma(_2865, _2847, _2921);
    float _2941 = fma(_2845, _2753, _2895);
    float _2943 = in.m_85.x;
    float _2945 = fma(_2845, _2665, _2855);
    float _2947 = _2879 * _2937;
    float _2949 = fma(_2865, _2935, _2905);
    float _2951 = fma(_2865, _2889, _2915);
    float _2953 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2917);
    float _2955 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2957 = -_2923;
    float _2959 = _2957 + 1.0;
    float _2961 = _2304 * 0.5;
    out.m_87.x = _2949;
    out.m_87.y = _2951;
    out.m_87.z = _2939;
    float _2963 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2953);
    float _2965 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2967 = fma(_2935, _2669, _2933);
    float _2969 = _2326 + _2304;
    float _2971 = _2963 + _2304;
    float _2973 = fma(_2328, -0.5, _2961);
    float _2975 = fma(_2935, _2725, _2931);
    float _2977 = fma(_2889, _2669, _2913);
    float _2979 = fma(_2889, _2725, _2907);
    float _2981 = fma(_2847, _2725, _2941);
    float _2983 = fma(_2847, _2669, _2945);
    float _2985 = _2971 * 0.5;
    float _2987 = _2969 * 0.5;
    out.m_89.x = _2967;
    out.m_89.y = _2977;
    out.m_89.z = _2983;
    bool _2989 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2991 = isnan(_2054);
    bool _2993 = _2989 || _2991;
    bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2997 = _2993 || _2995;
    float _2999 = _1972 * _2032;
    out.m_91.x = _2987;
    out.m_91.y = _2973;
    out.m_91.z = _2985;
    out.m_91.w = _2304;
    out.m_93.x = _2975;
    out.m_93.y = _2979;
    out.m_93.z = _2981;
    out.m_95.x = _1906;
    out.m_95.y = _1904;
    out.m_95.z = _1908;
    float _3001 = _2945;
    float _3003 = _2939;
    float _3005 = _2999;
    float _3007 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2997)
    {
        _3001 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3009 = _3001;
    out.gl_Position.x = _2326;
    out.gl_Position.y = _2328;
    out.gl_Position.z = _2963;
    out.gl_Position.w = _2304;
    float _3011 = _3009;
    float _3013 = _3009;
    if (!_2997)
    {
        _3003 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3015 = _3003;
    float _3017 = _2999 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3019 = _3015;
    float _3021 = _3015;
    if (!_2997)
    {
        _2487 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3023 = _2487;
    float _3025 = _3023;
    float _3027 = _3023;
    if (!_2997)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3029 = _3005;
    float _3031 = -_2338;
    float _3033 = _3031 + 1.0;
    float _3035 = _3033 * _2955;
    float _3037 = precise::clamp(_3035, 0.0, 1.0);
    float _3039 = -_3037;
    float _3041 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3043 = _2943;
    float _3045 = _3029;
    float _3047 = _3029;
    if (!_2997)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3049 = _3007;
    float _3051 = _3041 * _2943;
    float _3053 = _3049;
    float _3055 = _3049;
    if (!_2997)
    {
        _3043 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3057 = _3043;
    float _3059 = _3051 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3061 = _2965 * _2366;
    float _3063 = -_2965;
    float _3065 = _3063 + 1.0;
    out.m_97.x = _3059;
    float _3067 = _2377 * _3061;
    float _3069 = _2387 * _3061;
    float _3071 = _2377 * _3065;
    float _3073 = fma(_2383, _3067, _2371);
    float _3075 = fma(_2385, _3067, _2373);
    float _3077 = fma(_2377, _3069, _2375);
    out.m_99.x = _3073;
    out.m_99.y = _3075;
    out.m_99.z = _3077;
    out.m_99.w = _3071;
    bool _3079 = !_2997;
    float _3081 = _3057;
    float _3083 = _3057;
    if (!_3079)
    {
        bool _3085 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3087 = isnan(_2054);
        bool _3089 = _3085 || _3087;
        bool _3091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3093 = _3089 || _3091;
        if (!_3093)
        {
            float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3097 = _2054 + _3095;
            float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3101 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3099;
            float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3107 = 1.0 / _3101;
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3125 = _3097 * _3107;
            float _3127 = precise::clamp(_3125, 0.0, 1.0);
            float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3133 = fma(_3127, _3105, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3135 = fma(_3127, _3131, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3137 = fma(_3127, _3111, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3139 = fma(_3127, _3115, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3141 = fma(_3127, _3119, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3143 = fma(_3127, _3123, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3027 = _3137;
            _3055 = _3141;
            _3013 = _3133;
            _3021 = _3139;
            _3083 = _3135;
            _3047 = _3143;
            _3145 = true;
        }
        else
        {
            bool _3147 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3149 = isnan(_2054);
            bool _3151 = _3147 || _3149;
            bool _3153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3155 = _3151 || _3153;
            if (!_3155)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3157 = _3011;
            _3013 = _3157;
            if (!_3155)
            {
                _3025 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3159 = _3025;
            _3027 = _3159;
            if (!_3155)
            {
                _3081 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3161 = _3081;
            _3083 = _3161;
            if (!_3155)
            {
                _3019 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3163 = _3019;
            _3021 = _3163;
            if (!_3155)
            {
                _3053 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3165 = _3053;
            _3055 = _3165;
            if (!_3155)
            {
                _3045 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3167 = _3045;
            bool _3169 = !_3155;
            _3047 = _3167;
            if (!_3169)
            {
                bool _3171 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3173 = isnan(_2054);
                bool _3175 = _3171 || _3173;
                bool _3177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3179 = _3175 || _3177;
                if (!_3179)
                {
                    float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3183 = _2054 + _3181;
                    float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3187 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3185;
                    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3193 = 1.0 / _3187;
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3197 = _3195 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3205 = _3203 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3211 = _3183 * _3193;
                    float _3213 = precise::clamp(_3211, 0.0, 1.0);
                    float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3219 = fma(_3213, _3191, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3221 = fma(_3213, _3217, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3223 = fma(_3213, _3197, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3225 = fma(_3213, _3201, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3227 = fma(_3213, _3205, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3229 = fma(_3213, _3209, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3027 = _3223;
                    _3055 = _3227;
                    _3013 = _3219;
                    _3021 = _3225;
                    _3083 = _3221;
                    _3047 = _3229;
                    _3145 = true;
                }
                else
                {
                    _3027 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3055 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3021 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3083 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3047 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3145 = false;
    float _3231 = _3027;
    float _3233 = _3055;
    float _3235 = _3013;
    float _3237 = _3021;
    float _3239 = _3083;
    float _3241 = _3047;
    float _3243 = fma(_2979, -0.5, 0.5);
    float _3245 = precise::clamp(_3243, 0.0, 1.0);
    float _3247 = -_3231;
    float _3249 = _3247 + _3233;
    float _3251 = _3017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3253 = -_3235;
    float _3255 = _3253 + _3237;
    float _3257 = fma(_3245, _3249, _3231);
    out.m_101.x = 0.0;
    float _3259 = -_3239;
    float _3261 = _3259 + _3241;
    float _3263 = fma(_3245, _3255, _3235);
    float _3265 = _3257 * 0.586610972881317138671875;
    out.m_49.x = _3251;
    bool _3267 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3269 = fma(_3245, _3261, _3239);
    float _3271 = fma(_3263, 0.298911988735198974609375, _3265);
    bool _3273 = _1972 > 0.0;
    bool _3275 = isnan(_1972);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan(0.0);
    bool _3281 = _3277 || _3279;
    float _3283 = fma(_3269, 0.114477999508380889892578125, _3271);
    bool _3285 = _2032 <= 0.0;
    bool _3287 = !_3281;
    bool _3289 = _3285 || _3287;
    float _3291 = -_3283;
    float _3293 = _3263 + _3291;
    float _3295 = -_3283;
    float _3297 = _3257 + _3295;
    float _3299 = -_3283;
    float _3301 = _3269 + _3299;
    float _3303 = fma(_3293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3283);
    float _3305 = fma(_3297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3283);
    float _3307 = fma(_3301, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3283);
    bool _3309 = !_3267;
    if (!_3309)
    {
        float _3311 = -_1904;
        float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3315 = -_1906;
        float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3319 = -_1908;
        float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3323 = _3313 * _3313;
        float _3325 = fma(_3317, _3317, _3323);
        float _3327 = fma(_3321, _3321, _3325);
        float _3329 = sqrt(_3327);
        float _3331 = rsqrt(_3327);
        float _3333 = -_3329;
        float _3335 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3337 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3339 = precise::clamp(_3337, 0.0, 1.0);
        float _3341 = _3317 * _3331;
        float _3343 = _3313 * _3331;
        float _3345 = abs(_3339);
        float _3347 = log2(_3345);
        float _3349 = _3321 * _3331;
        float _3351 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3353 = _2979 * _3343;
        float _3355 = -_3343;
        float _3357 = -_3351;
        float _3359 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3357);
        float _3361 = fma(_2975, _3341, _3353);
        float _3363 = -_3349;
        float _3365 = fma(_3363, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3359);
        float _3367 = fma(_2981, _3349, _3361);
        float _3369 = precise::clamp(_3367, 0.0, 1.0);
        float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3373 = _3365 + _3371;
        float _3375 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3377 = _3373 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = exp2(_3375);
        float _3383 = _3381 * _3379;
        float _3385 = _3369 * _3383;
        float _3387 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3389 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3391 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3387;
        out.m_101.y = _3389;
        out.m_101.z = _3391;
    }
    out.m_69.x = _3303;
    out.m_69.y = _3305;
    out.m_69.z = _3307;
    if (!_3289)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3393 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3393;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3145 = false;
    bool _700 = false;
    bool _564 = false;
    bool _456 = false;
    bool _228 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_46.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (!_124)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_124)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3449 = as_type<float>(_134);
        out.gl_Position.z = _3449;
    }
    if (!_124)
    {
        return out;
    }
    float _138 = in.m_51.w;
    float _140 = float(_120);
    float _142 = 1.0 / _140;
    float _144 = -_138;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_138);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = _146 * _142;
    bool _160 = _146 >= _140;
    bool _162 = !_156;
    bool _164 = _160 || _162;
    out.m_53.x = _158;
    float _166 = _138;
    float _168 = _146;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _166;
    if (_164)
    {
        out.m_49.x = 0.0;
    }
    if (_164)
    {
        float _172 = _170 * 5.0;
        _136 = as_type<int>(_172);
    }
    int _174 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3521 = as_type<float>(_174);
        out.gl_Position.z = _3521;
    }
    if (_164)
    {
        return out;
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    bool _202 = !_182;
    float _204 = _200;
    float _206 = _198;
    float _208 = _196;
    float _226;
    if (!_202)
    {
        float _210 = in.m_57.x;
        float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _218 = _216 * _212;
        float _220 = floor(_218);
        float _222 = -_220;
        float _224 = _218 + _222;
        _226 = _224;
        _228 = true;
    }
    else
    {
        _226 = _158;
    }
    _228 = false;
    float _230 = _226;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _230 + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _230 + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _230 + _252;
    float _256 = 1.0 / _246;
    bool _258 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _260 = isnan(_230);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = 1.0 / _242;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = -_268;
    float _278 = _276 + 1.0;
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _282 = 1.0 / _250;
    float _284 = _238 * _256;
    bool _286 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_230);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = _296 * _278;
    float _300 = _234 * _270;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _306;
    float _310 = -_296;
    float _312 = _310 + 1.0;
    float _314 = fma(_274, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_304, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _322 = _254 * _282;
    bool _324 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_230);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = fma(_308, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _338 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_230);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = -_334;
    float _360 = _358 + 1.0;
    float _362 = _334 * _312;
    float _364 = fma(_352, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_320, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _368 = fma(_356, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = _348 * _360;
    float _372 = in.m_59.x;
    float _374 = in.m_59.y;
    float _376 = in.m_59.z;
    float _378 = -_348;
    float _380 = _378 + 1.0;
    float _382 = _316 * _370;
    float _384 = _336 * _370;
    float _386 = _314 * _370;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _388;
    float _392 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _384);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _400;
    float _404 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _386);
    float _406 = fma(_390, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _408 = fma(_398, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _410 = fma(_402, _322, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _412 = fma(_364, _362, _392);
    float _414 = fma(_366, _362, _394);
    float _416 = fma(_368, _362, _404);
    float _418 = fma(_406, _298, _412);
    float _420 = fma(_408, _298, _414);
    float _422 = fma(_410, _298, _416);
    float _424 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[146].x, _418);
    float _426 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[146].y, _420);
    float _428 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[146].z, _422);
    float _430 = _424 * _372;
    float _432 = _426 * _374;
    float _434 = _428 * _376;
    bool _436 = !_280;
    float _454;
    if (!_436)
    {
        float _438 = in.m_57.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].x, _146);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        _454 = _158;
    }
    _456 = false;
    float _458 = _454;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _462 = _458 + _460;
    bool _464 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _466 = isnan(_458);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _476;
    bool _480 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _482 = isnan(_458);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_474;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = 1.0 / _478;
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _504 = _490 * _494;
    float _506 = -_490;
    float _508 = _506 + 1.0;
    float _510 = _462 * _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _512;
    float _516 = fma(_498, _510, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _518;
    float _522 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _524 = _516 * _504;
    float _526 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _528 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[107].x, _524);
    float _530 = _526 * _504;
    float _532 = _522 * _504;
    float _534 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[108].x, _528);
    float _536 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[107].y, _530);
    float _538 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[107].z, _532);
    float _540 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[108].y, _536);
    float _542 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[108].z, _538);
    bool _544 = !_502;
    float _562;
    if (!_544)
    {
        float _546 = in.m_57.x;
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _550 = _546 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        _562 = _158;
    }
    _564 = false;
    float _566 = _562;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _570 = _566 + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _576 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_566);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _592 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _594 = isnan(_566);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _604;
    bool _608 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _610 = isnan(_566);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = 1.0 / _574;
    float _622 = -_586;
    float _624 = _622 + 1.0;
    bool _626 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _628 = _602 * _624;
    float _630 = -_602;
    float _632 = _630 + 1.0;
    float _634 = 1.0 / _590;
    float _636 = _606 * _620;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _644 = fma(_636, _570, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = _640 * _634;
    float _650 = _644 * _628;
    float _652 = -_618;
    float _654 = _652 + 1.0;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _566 + _656;
    float _660 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[115].x, _650);
    float _662 = _586 * _654;
    float _664 = fma(_648, _658, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _666 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _668 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _670 = fma(_664, _662, _660);
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[117].x, _670);
    float _678 = _676 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _680 = !_626;
    float _698;
    if (!_680)
    {
        float _682 = in.m_57.x;
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _686 = _682 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _690 = _688 * _684;
        float _692 = floor(_690);
        float _694 = -_692;
        float _696 = _690 + _694;
        _698 = _696;
        _700 = true;
    }
    else
    {
        _698 = _158;
    }
    _700 = false;
    float _702 = _698;
    float _704 = in.m_57.z;
    float _706 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = in.m_57.y;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _712 = _710 != 0;
    float _714 = _706 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _716 = in.m_46.x;
    float _718 = in.m_46.y;
    float _720 = in.m_46.z;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _728 = _726 != 0;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _732 = _730 != 0;
    float _734 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = in.m_57.x;
    float _738 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _740 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _742 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _738);
    float _744 = _704 * 2.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _750 = _708 * 2.0;
    float _752 = _708 + _704;
    float _754 = floor(_744);
    float _756 = fma(_158, _748, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _758 = _718 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _760 = _718 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = _718 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _764 = _752 + (-1.0);
    float _766 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[4].x, _758);
    float _768 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _770 = floor(_750);
    float _772 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[6].x, _762);
    float _774 = _716;
    if (_712)
    {
        _774 = _736;
    }
    float _776 = _774;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _780 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[4].z, _766);
    float _782 = _776;
    if (!_712)
    {
        _782 = _704;
    }
    float _784 = _782;
    float _786 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    bool _788 = _754 >= 0.0;
    bool _790 = isnan(_754);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _800 = _754 > 0.0;
    float _802 = _784 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _804 = _796 ? 0 : 1;
    float _806 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[6].z, _772);
    float _808 = -_798;
    float _810 = fma(_802, 2.0, _808);
    bool _812 = _770 > 0.0;
    float _814 = _704 + _736;
    float _816 = _802;
    if (_712)
    {
        _816 = _708;
    }
    float _818 = _816;
    float _820 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _742);
    float _822 = _814 + (-1.0);
    float _824 = _818;
    if (!_712)
    {
        _824 = _736;
    }
    float _826 = _824;
    float _828 = _736 * 2.0;
    bool _830 = _770 >= 0.0;
    bool _832 = isnan(_770);
    bool _834 = _830 || _832;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _842 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _844 = log2(_842);
    float _846 = _826 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _848 = _786 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _850 = _838 ? 0 : 1;
    float _852 = fma(_846, -2.0, _840);
    float _854 = _708 + _736;
    float _856 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _858 = ~_850;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    float _864 = floor(_828);
    bool _866 = !_724;
    int _868 = _866 ? 0 : 1;
    float _870 = _854 + (-1.0);
    int _872 = _862;
    if (!_812)
    {
        int _874 = ~_850;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    float _880 = _780 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _882 = !_732;
    int _884 = _882 ? 0 : 1;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _888 = _848 + _886;
    float _890 = _844 * _146;
    int _892 = ~_804;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = _806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _900 = abs(_868);
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _904 = _880 + _902;
    int _906 = _896;
    if (!_800)
    {
        int _908 = ~_804;
        int _910 = _908 + 1;
        _906 = _910;
    }
    int _912 = _906;
    float _914 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = abs(_884);
    float _918 = exp2(_890);
    float _920 = float(_900);
    float _922 = -_146;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[86].x, _810);
    float _926 = float(_916);
    float _928 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _852);
    float _930 = float(_912);
    float _932 = -_880;
    float _934 = _932 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _936 = float(_878);
    float _938 = _820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _940 = _920 * _930;
    float _942 = _926 * _936;
    bool _944 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _946 = isnan(1.0);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _952 = _948 || _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _956 = 1.0 + _954;
    bool _958 = _864 > 0.0;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _962 = _864 >= 0.0;
    bool _964 = isnan(_864);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    float _972 = in.m_61.x;
    float _974 = in.m_61.y;
    float _976 = in.m_61.z;
    float _978 = -_918;
    float _980 = _978 + 1.0;
    float _982 = 1.0 / _956;
    float _984 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[88].w, _960);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _988 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _990 = isnan(0.0);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _996 = _992 || _994;
    float _998 = _940 * (-2.0);
    float _1000 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _984);
    float _1002 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _986);
    float _1004 = _996 ? _980 : 0.0;
    float _1006 = _942 * (-2.0);
    int _1008 = _970 ? 0 : 1;
    float _1010 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1002);
    float _1012 = _888 * _888;
    float _1014 = fma(_914, _998, _914);
    int _1016 = ~_1008;
    int _1018 = _1016 + 1;
    int _1020 = _1018 + 1;
    float _1022 = _704 + (-0.5);
    int _1024 = _1020;
    if (!_958)
    {
        int _1026 = ~_1008;
        int _1028 = _1026 + 1;
        _1024 = _1028;
    }
    int _1030 = _1024;
    if (_952)
    {
        float _1032 = _1004 * _982;
        _168 = _1032;
    }
    float _1034 = _168;
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1038 = _898 + _1036;
    float _1040 = fma(_904, _904, _1012);
    float _1042 = _736 + (-0.5);
    float _1044 = -_848;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = float(_1030);
    float _1050 = fma(_1038, _1038, _1040);
    float _1052 = fma(_998, _972, _972);
    bool _1054 = !_728;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = _1046 * _1046;
    float _1060 = sqrt(_1050);
    float _1062 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1052);
    int _1064 = abs(_1056);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1066;
    float _1070 = -_898;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = fma(_934, _934, _1058);
    float _1076 = float(_1064);
    float _1078 = fma(_1014, _1034, _1062);
    float _1080 = rsqrt(_1050);
    float _1082 = fma(_1072, _1072, _1074);
    float _1084 = _1076 * _1048;
    float _1086 = _1084 * (-2.0);
    float _1088 = _1060 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1090 = fma(_1006, _976, _976);
    float _1092 = fma(_856, _1006, _856);
    float _1094 = fma(_778, _1086, _778);
    float _1096 = sqrt(_1082);
    float _1098 = precise::min(_714, _1088);
    float _1100 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1090);
    float _1102 = _848 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1104 = fma(_1086, _974, _974);
    float _1106 = _708 + (-0.5);
    float _1108 = _1080 * _1098;
    float _1110 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1102);
    float _1112 = fma(_1092, _1034, _1100);
    float _1114 = _1078 * 0.15915493667125701904296875;
    float _1116 = _888 * _1108;
    float _1118 = _904 * _1108;
    float _1120 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1110);
    float _1122 = _1038 * _1108;
    float _1124 = -_1116;
    float _1126 = _888 + _1124;
    float _1128 = -_1118;
    float _1130 = _904 + _1128;
    float _1132 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1134 = -_1122;
    float _1136 = _1038 + _1134;
    float _1138 = _1126 * _1126;
    float _1140 = rsqrt(_1082);
    float _1142 = -_1132;
    float _1144 = _938 + _1142;
    float _1146 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1104);
    float _1148 = fma(_1130, _1130, _1138);
    float _1150 = abs(_1144);
    float _1152 = precise::max(_1150, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1154 = fma(_1136, _1136, _1148);
    float _1156 = 1.0 / _1068;
    float _1158 = fma(_1094, _1034, _1146);
    float _1160 = _1112 * 0.15915493667125701904296875;
    float _1162 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1164 = precise::min(_1152, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1166 = _1158 * 0.15915493667125701904296875;
    bool _1168 = _1132 >= _938;
    bool _1170 = isnan(_1132);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(_938);
    bool _1176 = _1172 || _1174;
    float _1178 = sqrt(_1154);
    float _1180 = abs(_1096);
    float _1182 = precise::max(0.0, _1180);
    float _1184 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1162);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1188 = _1164 + _1186;
    float _1190 = _934 * _1140;
    bool _1192 = !_1176;
    float _1194 = _1192 ? 1.0 : (-1.0);
    float _1196 = _1072 * _1140;
    float _1198 = _1114 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = precise::min(_1182, 40.0);
    float _1204 = _1188 * _1156;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1208 = _1190 * _1206;
    float _1210 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1184);
    float _1212 = _1046 * _1140;
    float _1214 = _1194 * _1204;
    float _1216 = fma(_1202, -0.02500000037252902984619140625, 1.0);
    float _1218 = _1114 * 6.283185482025146484375;
    float _1220 = cos(_1218);
    float _1222 = _1080 * _1178;
    float _1224 = _158 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1226 = in.m_63.x;
    float _1228 = in.m_63.y;
    float _1230 = in.m_63.z;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1234 = _1196 * _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1238 = -_1208;
    float _1240 = fma(_1196, _1236, _1238);
    float _1242 = _1224 * _1214;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1246 = _1212 * _1244;
    float _1248 = _1160 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1254 = -_1234;
    float _1256 = fma(_1212, _1252, _1254);
    float _1258 = _1240 * _1240;
    float _1260 = _706 * _1222;
    float _1262 = _1242 * 0.15915493667125701904296875;
    float _1264 = fma(_1256, _1256, _1258);
    float _1266 = _1166 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = _1166 * 6.283185482025146484375;
    float _1272 = sin(_1270);
    float _1274 = _1220 * _1250;
    float _1276 = _1200 * _1250;
    float _1278 = _1160 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1268 * _1250;
    float _1284 = _1220 * _1268;
    float _1286 = _1220 * _1272;
    float _1288 = _1200 * _1272;
    float _1290 = _1272 * _1250;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1294 = -_1246;
    float _1296 = fma(_1190, _1292, _1294);
    float _1298 = _1200 * _1268;
    float _1300 = _734 * _1222;
    float _1302 = fma(_1296, _1296, _1264);
    float _1304 = fma(_1280, _1284, _1288);
    float _1306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1228);
    float _1308 = fma(_1280, _1288, _1284);
    float _1310 = -_1286;
    float _1312 = fma(_1280, _1298, _1310);
    float _1314 = -_1298;
    float _1316 = fma(_1280, _1286, _1314);
    float _1318 = rsqrt(_1302);
    float _1320 = _1300 * _1306;
    float _1322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1226);
    float _1324 = _740 * _1222;
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1230);
    float _1328 = -_1320;
    float _1330 = _1280 * _1328;
    float _1332 = _1274 * _1320;
    float _1334 = _1260 * _1322;
    float _1336 = _1276 * _1320;
    float _1338 = rsqrt(_1210);
    float _1340 = _1324 * _1326;
    float _1342 = fma(_1304, _1334, _1332);
    float _1344 = fma(_1312, _1334, _1336);
    float _1346 = fma(_1282, _1334, _1330);
    float _1348 = fma(_1316, _1340, _1342);
    float _1350 = _1296 * _1318;
    float _1352 = _1240 * _1318;
    float _1354 = _1256 * _1318;
    float _1356 = fma(_1308, _1340, _1344);
    float _1358 = _1190 * _1350;
    float _1360 = _1196 * _1352;
    float _1362 = fma(_1290, _1340, _1346);
    float _1364 = _1212 * _1354;
    float _1366 = -_1358;
    float _1368 = fma(_1196, _1354, _1366);
    float _1370 = -_1360;
    float _1372 = fma(_1212, _1350, _1370);
    float _1374 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1376 = -_1364;
    float _1378 = fma(_1190, _1352, _1376);
    float _1380 = _1368 * _1348;
    float _1382 = _1372 * _1348;
    float _1384 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1386 = _1374 * _1374;
    float _1388 = fma(_1352, _1362, _1380);
    float _1390 = fma(_1354, _1362, _1382);
    float _1392 = _1378 * _1348;
    float _1394 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1396 = fma(_1212, _1356, _1388);
    float _1398 = fma(_1384, _1384, _1386);
    float _1400 = fma(_1190, _1356, _1390);
    float _1402 = fma(_1350, _1362, _1392);
    float _1404 = _848 + _1396;
    float _1406 = _848 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1408 = fma(_1394, _1394, _1398);
    float _1410 = _880 + _1400;
    float _1412 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1414 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1416 = fma(_1196, _1356, _1402);
    float _1418 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1420 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1406);
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1412);
    float _1424 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1414);
    float _1426 = _898 + _1416;
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1418);
    float _1430 = rsqrt(_1408);
    float _1432 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1434 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1424);
    float _1436 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1428);
    float _1438 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1446 = _1262 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    float _1450 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1452 = -_1442;
    float _1454 = _1452 + _1440;
    float _1456 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1458 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1460 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1462 = fma(_1216, _1454, _1442);
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1456);
    float _1466 = _1262 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = _1394 * _1430;
    float _1472 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1458);
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1460);
    float _1476 = _1384 * _1430;
    float _1478 = _1374 * _1430;
    float _1480 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1464);
    float _1482 = _1470 * _1470;
    float _1484 = -_1448;
    float _1486 = _1484 + 1.0;
    float _1488 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1472);
    float _1490 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1492 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1474);
    float _1494 = _1478 * _1486;
    float _1496 = fma(_1486, _1482, _1448);
    float _1498 = _1476 * _1486;
    float _1500 = _1488 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1502 = _1476 * _1468;
    float _1504 = _1478 * _1468;
    float _1506 = _1470 * _1468;
    float _1508 = -_848;
    float _1510 = _1508 + _1490;
    float _1512 = fma(_1470, _1494, _1502);
    float _1514 = -_1504;
    float _1516 = fma(_1470, _1498, _1514);
    float _1518 = -_1506;
    float _1520 = fma(_1478, _1498, _1518);
    float _1522 = -_880;
    float _1524 = _1522 + _1500;
    float _1526 = _1512 * _1510;
    float _1528 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1530 = fma(_1476, _1498, _1448);
    float _1532 = _1520 * _1510;
    float _1534 = fma(_1516, _1524, _1526);
    float _1536 = -_898;
    float _1538 = _1536 + _1528;
    float _1540 = fma(_1470, _1498, _1504);
    float _1542 = fma(_1530, _1524, _1532);
    float _1544 = fma(_1478, _1494, _1448);
    float _1546 = fma(_1496, _1538, _1534);
    float _1548 = fma(_1478, _1498, _1506);
    float _1550 = fma(_1540, _1538, _1542);
    float _1552 = _1544 * _1510;
    float _1554 = fma(_1546, _756, _898);
    float _1556 = -_1116;
    float _1558 = _848 + _1556;
    float _1560 = fma(_1550, _756, _880);
    float _1562 = -_1502;
    float _1564 = fma(_1470, _1494, _1562);
    float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1568 = _1554 + _1566;
    float _1570 = fma(_1548, _1524, _1552);
    float _1572 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1574 = _1560 + _1572;
    float _1576 = -_1118;
    float _1578 = _880 + _1576;
    float _1580 = _1568 * _1568;
    float _1582 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1584 = fma(_1564, _1538, _1570);
    float _1586 = -_1122;
    float _1588 = _898 + _1586;
    float _1590 = fma(_1574, _1574, _1580);
    float _1592 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1582);
    float _1594 = _848 + _1584;
    float _1596 = sqrt(_1590);
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1592);
    bool _1600 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1602 = _1592;
    float _1604 = _1580;
    float _1606 = _1584;
    float _1608 = _1116;
    float _1610 = _1568;
    if (!_1600)
    {
        _1602 = _1560;
    }
    float _1612 = _1602;
    float _1614 = _1612;
    if (!_1600)
    {
        _1604 = _1554;
    }
    float _1616 = _1604;
    float _1618 = _1616;
    if (!_1600)
    {
        _1606 = _1594;
    }
    float _1620 = _1606;
    bool _1622 = !_1600;
    float _1624 = _1620;
    if (!_1622)
    {
        float _1626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1630 = _1596 + _1628;
        float _1632 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = _1630 * _1626;
        float _1636 = rsqrt(_1590);
        float _1638 = _1634 * 0.15915493667125701904296875;
        float _1640 = _1638 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        float _1644 = _1638 * 6.283185482025146484375;
        float _1646 = cos(_1644);
        float _1648 = fma(_1642, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1650 = _1636 * _1648;
        float _1652 = _1646 + (-1.0);
        float _1654 = fma(_1574, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1656 = fma(_1568, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1660 = fma(_1594, _1646, _1658);
        _1624 = _1660;
        _1614 = _1654;
        _1618 = _1656;
    }
    float _1662 = _1624;
    float _1664 = _1614;
    float _1666 = _1618;
    float _1668 = -_848;
    float _1670 = _1668 + _1662;
    float _1672 = -_880;
    float _1674 = _1672 + _1664;
    float _1676 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1678 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1680 = _1670 * _1670;
    float _1682 = -_898;
    float _1684 = _1682 + _1666;
    float _1686 = 1.0 / _1676;
    float _1688 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1678);
    float _1690 = fma(_1674, _1674, _1680);
    float _1692 = -_1118;
    float _1694 = _1692 + _1664;
    float _1696 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1688);
    float _1698 = fma(_1684, _1684, _1690);
    float _1700 = -_1122;
    float _1702 = _1700 + _1666;
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1706 = sqrt(_1698);
    float _1708 = _1704 + _1676;
    float _1710 = _1708 * _1686;
    float _1712 = _1710 * 0.5;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1716 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1714);
    float _1718 = 1.0 / _1716;
    bool _1720 = _1706 > 0.0;
    bool _1722 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan(0.5);
    bool _1730 = _1726 || _1728;
    float _1732 = -_1116;
    float _1734 = _1732 + _1662;
    bool _1736 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan(0.5);
    bool _1744 = _1740 || _1742;
    float _1746 = _1664;
    float _1748 = _1666;
    float _1750 = _1662;
    float _1752 = _1674;
    float _1754 = _1734;
    float _1756 = _1686;
    if (!_1720)
    {
        _1746 = _1694;
    }
    float _1758 = _1746;
    float _1760 = _1758;
    float _1762 = _1758;
    if (!_1720)
    {
        _1748 = _1734;
    }
    float _1764 = _1748;
    float _1766 = _1764;
    if (!_1720)
    {
        _1750 = _1702;
    }
    float _1768 = _1750;
    bool _1770 = !_1720;
    float _1772 = _1768;
    if (!_1770)
    {
        float _1774 = _198 * _198;
        float _1776 = rsqrt(_1698);
        float _1778 = fma(_196, _196, _1774);
        float _1780 = fma(_200, _200, _1778);
        float _1782 = sqrt(_1780);
        float _1784 = _1674 * _1776;
        float _1786 = _1670 * _1776;
        float _1788 = _1684 * _1776;
        bool _1790 = _1782 > 0.0;
        float _1792 = _1776;
        float _1794 = _1782;
        if (!_1790)
        {
            _1760 = _1694;
        }
        float _1796 = _1760;
        _1762 = _1796;
        if (!_1790)
        {
            _1792 = _1734;
        }
        float _1798 = _1792;
        _1766 = _1798;
        if (!_1790)
        {
            _1794 = _1702;
        }
        float _1800 = _1794;
        bool _1802 = !_1790;
        _1772 = _1800;
        if (!_1802)
        {
            float _1804 = rsqrt(_1780);
            float _1806 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1808 = _198 * _1804;
            float _1810 = _196 * _1804;
            float _1812 = _200 * _1804;
            float _1814 = _1786 * _1808;
            float _1816 = fma(_1784, _1810, _1814);
            float _1818 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1820 = fma(_1788, _1812, _1816);
            float _1822 = _1820 * _1818;
            float _1824 = fma(_196, _1822, _1694);
            float _1826 = fma(_198, _1822, _1734);
            float _1828 = fma(_200, _1822, _1702);
            _1762 = _1824;
            _1766 = _1826;
            _1772 = _1828;
        }
    }
    float _1830 = _1762;
    float _1832 = _1766;
    float _1834 = _1772;
    if (_1730)
    {
        _1752 = 1.0;
    }
    float _1836 = _1752;
    float _1838 = _1836;
    if (_1744)
    {
        _204 = _1830;
    }
    float _1840 = _204;
    float _1842 = _1840;
    if (_1744)
    {
        _206 = _1832;
    }
    float _1844 = _206;
    float _1846 = _1844;
    if (_1744)
    {
        _208 = _1834;
    }
    float _1848 = _208;
    float _1850 = _1848;
    if (!_1744)
    {
        float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1854 = _1558 + _1852;
        float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1858 = _1578 + _1856;
        float _1860 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1862 = -_1578;
        float _1864 = _1862 + _1830;
        float _1866 = _1854 * _1854;
        float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1870 = _1588 + _1868;
        float _1872 = -_1558;
        float _1874 = _1872 + _1832;
        float _1876 = -_1588;
        float _1878 = _1876 + _1834;
        float _1880 = fma(_1858, _1858, _1866);
        float _1882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1884 = fma(_1870, _1870, _1880);
        float _1886 = sqrt(_1884);
        float _1888 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1890 = precise::min(_1886, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1892 = _1890 * _1882;
        float _1894 = _1888 * _1892;
        float _1896 = fma(_1864, _1894, _1578);
        float _1898 = fma(_1874, _1894, _1558);
        float _1900 = fma(_1878, _1894, _1588);
        _1754 = _1882;
        _1846 = _1898;
        _1842 = _1896;
        _1850 = _1900;
    }
    float _1902 = _1754;
    float _1904 = _1846;
    float _1906 = _1842;
    float _1908 = _1850;
    float _1910 = _1902;
    if (_1730)
    {
        _1756 = 1.0;
    }
    float _1912 = _1756;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1916 = _1718 * _1914;
    float _1918 = _1912;
    if (!_1730)
    {
        float _1920 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1922 = _1920 * 0.15915493667125701904296875;
        float _1924 = _1922 * 6.283185482025146484375;
        float _1926 = cos(_1924);
        float _1928 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1930 = _1928 * 0.15915493667125701904296875;
        float _1932 = _1922 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = 1.0 / _1926;
        float _1938 = _1930 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1934 * _1936;
        float _1944 = _1930 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1950 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1948;
        float _1952 = _1940 * _1942;
        float _1954 = 1.0 / _1950;
        float _1956 = 1.0 / _1952;
        float _1958 = _1946 * _1956;
        float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1962 = fma(_1916, _1958, _1960);
        float _1964 = _1962 * _1954;
        float _1966 = precise::clamp(_1964, 0.0, 1.0);
        _1910 = _1942;
        _1608 = _1922;
        _1838 = _1966;
    }
    float _1968 = _1910;
    float _1970 = _1608;
    float _1972 = _1838;
    float _1974 = _1968;
    float _1976 = _1970;
    if (!_1730)
    {
        float _1978 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1980 = _1978 * 0.15915493667125701904296875;
        float _1982 = _1980 * 6.283185482025146484375;
        float _1984 = cos(_1982);
        float _1986 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1988 = _1986 * 0.15915493667125701904296875;
        float _1990 = _1980 * 6.283185482025146484375;
        float _1992 = sin(_1990);
        float _1994 = 1.0 / _1984;
        float _1996 = _1988 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        float _2000 = _1992 * _1994;
        float _2002 = _1988 * 6.283185482025146484375;
        float _2004 = sin(_2002);
        float _2006 = _1998 * _2000;
        float _2008 = 1.0 / _2006;
        float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2012 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2010;
        float _2014 = 1.0 / _2012;
        float _2016 = _2004 * _2008;
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2020 = fma(_1916, _2016, _2018);
        float _2022 = _2020 * _2014;
        float _2024 = precise::clamp(_2022, 0.0, 1.0);
        float _2026 = -_2024;
        float _2028 = _2026 + 1.0;
        _1974 = _1994;
        _1918 = _2028;
    }
    float _2030 = _1974;
    float _2032 = _1918;
    float _2034 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2036 = _1904 + _2034;
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2040 = _1906 + _2038;
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2044 = _1908 + _2042;
    float _2046 = _2036 * _2036;
    float _2048 = fma(_2040, _2040, _2046);
    float _2050 = fma(_2044, _2044, _2048);
    float _2052 = rsqrt(_2050);
    float _2054 = sqrt(_2050);
    float _2056 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2058 = _2040 * _2056;
    float _2060 = _2044 * _2056;
    float _2062 = _2058 * _2058;
    float _2064 = _2060 * _2060;
    float _2066 = _2062 + _2064;
    float _2068 = sqrt(_2066);
    bool _2070 = _2068 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2074 = _2068 + _2072;
    float _2076 = _2044;
    float _2078 = _2046;
    float _2080 = _2074;
    float _2082 = _2036;
    float _2084 = _2030;
    if (_2070)
    {
        float _2086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2076 = _2086;
    }
    float _2088 = _2076;
    if (_2070)
    {
        float _2090 = rsqrt(_2066);
        _2078 = _2090;
    }
    float _2092 = _2078;
    float _2094 = _2092;
    if (_2070)
    {
        float _2096 = _2074 * _2088;
        _2080 = _2096;
    }
    float _2098 = _2080;
    if (_2070)
    {
        float _2100 = _2098 * 0.15915493667125701904296875;
        _1976 = _2100;
    }
    float _2102 = _1976;
    float _2104 = _2052;
    float _2106 = _2102;
    if (_2070)
    {
        float _2108 = _2102 * 6.283185482025146484375;
        float _2110 = sin(_2108);
        _2104 = _2110;
    }
    float _2112 = _2104;
    float _2114 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2116 = precise::max(0.0, _2114);
    float _2118 = _2088;
    float _2120 = _2116;
    if (_2070)
    {
        float _2122 = _2102 * 6.283185482025146484375;
        float _2124 = cos(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    float _2128 = -_2056;
    float _2130 = -_2116;
    float _2132 = fma(_2036, _2128, _2130);
    if (_2070)
    {
        float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2082 = _2134;
    }
    float _2136 = _2082;
    if (!_2070)
    {
        _2106 = _2062;
    }
    float _2138 = _2106;
    float _2140 = _2112;
    float _2142 = _2138;
    if (_2070)
    {
        float _2144 = fma(_2112, _2136, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2084 = _2144;
    }
    float _2146 = _2084;
    float _2148 = _2146;
    if (!_2070)
    {
        _2140 = _2132;
    }
    float _2150 = _2140;
    float _2152 = _2150;
    float _2154 = _2126;
    if (_2070)
    {
        float _2156 = _2126 + (-1.0);
        _2120 = _2156;
    }
    float _2158 = _2120;
    float _2160 = _2158;
    if (_2070)
    {
        float _2162 = _2092 * _2146;
        _1610 = _2162;
    }
    float _2164 = _1610;
    if (!_2070)
    {
        _2094 = _2058;
    }
    float _2166 = _2094;
    float _2168 = _2166;
    if (_2070)
    {
        float _2170 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2160 = _2170;
    }
    float _2172 = _2160;
    if (_2070)
    {
        float _2174 = _2058 * _2164;
        _2168 = _2174;
    }
    float _2176 = _2168;
    if (!_2070)
    {
        _2148 = _2064;
    }
    float _2178 = _2148;
    float _2180 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2182 = _2178;
    if (_2070)
    {
        float _2184 = fma(_2132, _2126, _2172);
        _2152 = _2184;
    }
    float _2186 = _2152;
    if (!_2070)
    {
        _2154 = _2060;
    }
    float _2188 = _2154;
    float _2190 = _2188;
    if (_2070)
    {
        float _2192 = _2176 * _2176;
        _2142 = _2192;
    }
    float _2194 = _2142;
    if (_2070)
    {
        float _2196 = _2060 * _2164;
        _2190 = _2196;
    }
    float _2198 = _2190;
    float _2200 = floor(_2180);
    float _2202 = fma(_2186, _2186, _2194);
    if (_2070)
    {
        float _2204 = _2198 * _2198;
        _2182 = _2204;
    }
    float _2206 = _2182;
    float _2208 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2210 = _2202 + _2206;
    float _2212 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2208);
    float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2216 = fma(_2054, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2214);
    float _2218 = precise::clamp(_2216, 0.0, 1.0);
    float _2220 = rsqrt(_2210);
    float _2222 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2212);
    float _2224 = -_2218;
    float _2226 = _2224 + 1.0;
    float _2228 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2230 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2232 = fma(_1588, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2234 = abs(_2226);
    float _2236 = log2(_2234);
    float _2238 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2240 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2242 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2244 = -_2200;
    float _2246 = _2180 + _2244;
    float _2248 = -_2238;
    float _2250 = fma(_2248, _2230, 1.0);
    float _2252 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2254 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2240);
    float _2256 = _2220 * _2176;
    float _2258 = _2220 * _2186;
    float _2260 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2252);
    float _2262 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2254);
    float _2264 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2266 = _2220 * _2198;
    float _2268 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2260);
    float _2270 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2272 = -_2264;
    float _2274 = fma(_2258, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2272);
    float _2276 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2242);
    float _2278 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2280 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2282 = -_2266;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2274);
    float _2286 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2276);
    float _2288 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2290 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2280);
    float _2292 = floor(_2232);
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2296 = fma(_2284, -0.5, 0.5);
    float _2298 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2290);
    float _2300 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2302 = fma(_2284, 0.5, 0.5);
    float _2304 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2298);
    float _2306 = exp2(_2288);
    float _2308 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2310 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2300);
    float _2312 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2308);
    float _2314 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2310);
    float _2316 = 1.0 / _2304;
    float _2318 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2312);
    float _2320 = -_2292;
    float _2322 = _2232 + _2320;
    float _2324 = fma(_2302, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2326 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2314);
    float _2328 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2318);
    float _2330 = fma(_2302, _2324, -0.212114393711090087890625);
    float _2332 = log2(_2250);
    float _2334 = sqrt(_2296);
    float _2336 = _2326 * _2316;
    float2 _6960 = float2(_2246, _2322);
    float _2338 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6960, float2(0.0), isnan(_6960)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6960, float2(0.0), isnan(_6960)), level(0.0)).x;
    float _2340 = fma(_2302, _2330, 1.570728778839111328125);
    float _2342 = _2332 * 0.693147182464599609375;
    float _2344 = _2258 + 1.0;
    float _2346 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2348 = -_2258;
    float _2350 = fma(_2306, _2344, _2348);
    float _2352 = _2328 * _2316;
    float _2354 = fma(_2336, 0.5, 0.5);
    float _2356 = _2334 * 0.636619746685028076171875;
    float _2358 = fma(_2350, 0.5, 0.5);
    float _2360 = fma(_2352, -0.5, 0.5);
    float _2362 = -_2340;
    float _2364 = fma(_2356, _2362, 1.0);
    float3 _7007 = float3(_2354, _2360, _2346);
    float _2366 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7007, float3(0.0), isnan(_7007)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7007, float3(0.0), isnan(_7007)), level(0.0)).x;
    float3 _7018 = float3(_2354, _2360, _2346);
    float4 _2369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7018, float3(0.0), isnan(_7018)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7018, float3(0.0), isnan(_7018)), level(0.0)).xyzw;
    float _2371 = _2369.x;
    float _2373 = _2369.y;
    float _2375 = _2369.z;
    float _2377 = _2369.w;
    float2 _7034 = float2(_2364, _2358);
    float3 _2381 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7034, float2(0.0), isnan(_7034)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7034, float2(0.0), isnan(_7034)), level(0.0)).xyz;
    float _2383 = _2381.x;
    float _2385 = _2381.y;
    float _2387 = _2381.z;
    float _2389 = in.m_57.w;
    float _2391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2393 = in.m_65.y;
    bool _2395 = _704 > 0.5;
    float _2397 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2399 = _708 > 0.5;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2407 = _2405 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2409 = in.m_65.x;
    float _2411 = 1.0 / _2403;
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    out.m_67.x = _646;
    out.m_67.y = _672;
    out.m_67.z = _674;
    out.m_67.w = _678;
    float _2417 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2419 = 1.0 / _2407;
    out.m_69.w = _1098;
    bool _2421 = _2389 > 0.5;
    out.m_71.x = _1578;
    out.m_71.y = _1558;
    out.m_71.z = _1588;
    float _2423 = -_2393;
    float _2425 = _2423 + 1.0;
    float _2427 = 1.0 / _2415;
    int _2429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2431 = _2429 != 0;
    float _2433 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2435 = _2433 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2439 = _2437 != 0;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2443 = _702 + _2441;
    int _2445 = _2399 ? as_type<int>(_2425) : as_type<int>(_2393);
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2449 = _702 + _2447;
    float _2451 = _2435 * _2419;
    float _2453 = _2439 ? as_type<float>(_2445) : _2393;
    float _2455 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2457 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2455;
    int _2459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2461 = _2459 != 0;
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2465 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2463;
    bool _2467 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2469 = isnan(_702);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2475 = _2471 || _2473;
    float _2477 = float(_2475);
    float _2479 = _2457 * _2411;
    float _2481 = _2419;
    float _2483 = _2411;
    float _2485 = _2393;
    float _2487 = _2326;
    if (!_2431)
    {
        _2481 = _2409;
    }
    float _2489 = _2481;
    float _2491 = _2465 * _2427;
    int _2493 = _2421 ? as_type<int>(_2425) : as_type<int>(_2393);
    float _2495 = fma(_2479, _2449, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2499 = _2497 != 0;
    float _2501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2505 = _2503 != 0;
    float _2507 = _1304 * _1368;
    int _2509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2511 = _2509 != 0;
    float _2513 = fma(_2451, _2443, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2515 = _2489;
    bool _2517 = _2511;
    if (!_2431)
    {
        _2483 = _2489;
    }
    float _2519 = _2483;
    float _2521 = fma(_1282, _1352, _2507);
    float _2523 = _2519;
    if (_2431)
    {
        _2515 = _2409;
    }
    float _2525 = _2515;
    float _2527 = -_2477;
    float _2529 = _2527 + 1.0;
    bool _2531 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2533 = isnan(_702);
    bool _2535 = _2531 || _2533;
    bool _2537 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2539 = _2535 || _2537;
    float _2541 = float(_2539);
    float _2543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2545 = _2511 ? as_type<float>(_2493) : _2393;
    int _2547 = 0;
    float _2549 = _2525;
    if (_2499)
    {
        float _2551 = -_2525;
        float _2553 = _2551 + 1.0;
        _2547 = as_type<int>(_2553);
    }
    int _2555 = _2547;
    float _2557 = as_type<float>(_2555);
    if (_2431)
    {
        bool _2559 = _736 > 0.5;
        _2517 = _2559;
    }
    bool _2561 = _2517;
    float _2563 = _2541 * _2529;
    float _2565 = in.m_73.x;
    float _2567 = in.m_73.y;
    float _2569 = in.m_73.z;
    bool _2571 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2573 = isnan(_702);
    bool _2575 = _2571 || _2573;
    bool _2577 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2579 = _2575 || _2577;
    float _2581 = float(_2579);
    float _2583 = -_2541;
    float _2585 = _2583 + 1.0;
    int _2587 = as_type<int>(_2585);
    if (_2461)
    {
        float _2589 = _2395 ? _2425 : _2393;
        _2485 = _2589;
    }
    float _2591 = _2485;
    float _2593 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2595 = _1228 != 0.0;
    bool _2597 = isnan(_1228);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan(0.0);
    bool _2603 = _2599 || _2601;
    float _2605 = _2581 * _2585;
    bool _2607 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2609 = isnan(_702);
    bool _2611 = _2607 || _2609;
    bool _2613 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2615 = _2611 || _2613;
    float _2617 = float(_2615);
    float _2619 = -_2581;
    float _2621 = _2619 + 1.0;
    bool _2623 = _1226 == 0.0;
    bool _2625 = !_2603;
    bool _2627 = _2623 && _2625;
    float _2629 = _2591;
    if (_2431)
    {
        float _2631 = -_2525;
        float _2633 = _2631 + 1.0;
        _2587 = as_type<int>(_2633);
    }
    int _2635 = _2587;
    float _2637 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2639 = _702 + _2637;
    float _2641 = _2617 * _2621;
    bool _2643 = _1230 == 0.0;
    bool _2645 = _2643 && _2627;
    int _2647 = 0;
    if (_2505)
    {
        float _2649 = -_2525;
        float _2651 = _2649 + 1.0;
        _2647 = as_type<int>(_2651);
    }
    int _2653 = _2647;
    if (_2431)
    {
        float _2655 = _2561 ? as_type<float>(_2635) : _2525;
        _2523 = _2655;
    }
    float _2657 = _2523;
    float _2659 = _2495 * _2641;
    float _2661 = 0.0;
    if (!_2499)
    {
        _2661 = _2525;
    }
    float _2663 = _2661;
    float _2665 = in.m_75.x;
    float _2667 = in.m_75.y;
    float _2669 = in.m_75.z;
    float _2671 = in.m_75.w;
    float _2673 = _2663;
    if (_2499)
    {
        float _2675 = _2395 ? as_type<float>(_2555) : _2525;
        _2673 = _2675;
    }
    float _2677 = _2673;
    float _2679 = fma(_2491, _2639, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2681 = fma(_2593, _2591, -0.5);
    float _2683 = 0.0;
    if (!_2505)
    {
        _2683 = _2525;
    }
    float _2685 = _2683;
    float _2687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2689 = _2685;
    if (_2505)
    {
        float _2691 = _2399 ? as_type<float>(_2653) : _2525;
        _2689 = _2691;
    }
    float _2693 = _2689;
    float _2695 = -_2617;
    float _2697 = _2695 + 1.0;
    float _2699 = _2697;
    if (_2645)
    {
        _2557 = _2567;
    }
    float _2701 = _2557;
    float _2703 = _2545 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2705 = _2701;
    if (_2645)
    {
        _2549 = _2569;
    }
    float _2707 = _2549;
    float _2709 = fma(_2417, _2693, -0.5);
    float _2711 = _2707;
    if (_2645)
    {
        _2629 = _2701;
    }
    float _2713 = _2629;
    float _2715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2717 = _2713;
    if (!_2645)
    {
        _2705 = _2567;
    }
    float _2719 = _2705;
    float _2721 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2659);
    if (!_2645)
    {
        float _2723 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2569);
        _2711 = _2723;
    }
    float _2725 = _2711;
    float _2727 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2729 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_2645)
    {
        float _2731 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2719);
        _2717 = _2731;
    }
    float _2733 = _2717;
    float _2735 = _2453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2739 = fma(_1010, _2709, _924);
    float _2741 = fma(_2513, _2605, _2721);
    float _2743 = _2667 * _2569;
    float _2745 = _2669 * _2565;
    if (_2645)
    {
        _2699 = _2565;
    }
    float _2747 = _2699;
    float _2749 = _2747;
    if (!_2645)
    {
        float _2751 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2565);
        _2749 = _2751;
    }
    float _2753 = _2749;
    float _2755 = -_2743;
    float _2757 = fma(_2669, _2719, _2755);
    float _2759 = _2735 * _2715;
    float _2761 = _2727 * _2687;
    float _2763 = _2729 * _2543;
    float _2765 = -_2745;
    float _2767 = fma(_2665, _2569, _2765);
    float _2769 = _2665 * _2719;
    float _2771 = -_928;
    float _2773 = fma(_1000, _2681, _2771);
    float _2775 = _2739 + 0.5;
    float _2777 = fma(_2679, _2563, _2741);
    float _2779 = _2703 * _2737;
    float _2781 = -_2769;
    float _2783 = fma(_2667, _2565, _2781);
    float _2785 = _1274 * _1368;
    out.m_77.x = _2761;
    out.m_77.y = _2759;
    out.m_77.z = _2763;
    out.m_77.w = _2779;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2789 = fma(_2477, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2777);
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2793 = -_1280;
    float _2795 = fma(_2793, _1352, _2785);
    float _2797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2799 = _2787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2801 = _2791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2803 = _2789 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2805 = _2797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2807 = _1316 * _1368;
    float _2809 = fma(_1276, _1212, _2795);
    float _2811 = _2773 + 0.5;
    float _2813 = _2767 * _2671;
    float _2815 = _1274 * _1372;
    float _2817 = abs(_1916);
    float _2819 = log2(_2817);
    float _2821 = _1274 * _1378;
    float _2823 = _1304 * _1372;
    float _2825 = _1304 * _1378;
    float _2827 = -_1280;
    float _2829 = fma(_2827, _1354, _2815);
    float _2831 = _1316 * _1378;
    float _2833 = -_1280;
    float _2835 = fma(_2833, _1350, _2821);
    float _2837 = fma(_1282, _1350, _2825);
    float _2839 = fma(_1276, _1190, _2829);
    float _2841 = fma(_1290, _1350, _2831);
    float _2843 = fma(_1276, _1196, _2835);
    float _2845 = fma(_1312, _1196, _2837);
    float _2847 = fma(_1308, _1196, _2841);
    out.m_79.x = _2799;
    out.m_79.y = _2801;
    out.m_79.z = _2805;
    out.m_79.w = _2803;
    float _2849 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2851 = fma(_1282, _1354, _2823);
    float _2853 = fma(_1312, _1212, _2521);
    out.m_81.x = _2775;
    out.m_81.y = _2811;
    float _2855 = _2843 * _2667;
    float _2857 = _2757 * _2671;
    float _2859 = exp2(_2849);
    float _2861 = fma(_1312, _1190, _2851);
    float _2863 = _2839 * _2733;
    float _2865 = _2783 * _2671;
    float _2867 = _1316 * _1372;
    bool _2869 = _1916 <= 8000.0;
    bool _2871 = isnan(_1916);
    bool _2873 = _2869 || _2871;
    bool _2875 = isnan(8000.0);
    bool _2877 = _2873 || _2875;
    float _2879 = float(_2877);
    out.m_83.x = _1260;
    float _2881 = fma(_1290, _1352, _2807);
    float _2883 = _2809 * _2667;
    float _2885 = _2809 * _2733;
    float _2887 = _2813 * _2809;
    float _2889 = fma(_1308, _1212, _2881);
    float _2891 = _2839 * _2667;
    float _2893 = _2813 * _2839;
    float _2895 = _2843 * _2733;
    float _2897 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2899 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2901 = precise::clamp(_2899, 0.0, 1.0);
    float _2903 = _2813 * _2843;
    float _2905 = fma(_2857, _2861, _2893);
    float _2907 = fma(_2853, _2753, _2885);
    float _2909 = fma(_2901, -2.0, 3.0);
    float _2911 = _2901 * _2901;
    float _2913 = fma(_2853, _2665, _2883);
    float _2915 = fma(_2857, _2853, _2887);
    float _2917 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2897);
    float _2919 = _2911 * _2909;
    float _2921 = fma(_2857, _2845, _2903);
    float _2923 = exp2(_2397);
    float _2925 = fma(_1290, _1354, _2867);
    float _2927 = -_2919;
    float _2929 = _2927 + 1.0;
    float _2931 = fma(_2861, _2753, _2863);
    float _2933 = fma(_2861, _2665, _2891);
    float _2935 = fma(_1308, _1190, _2925);
    float _2937 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2919);
    float _2939 = fma(_2865, _2847, _2921);
    float _2941 = fma(_2845, _2753, _2895);
    float _2943 = in.m_85.x;
    float _2945 = fma(_2845, _2665, _2855);
    float _2947 = _2879 * _2937;
    float _2949 = fma(_2865, _2935, _2905);
    float _2951 = fma(_2865, _2889, _2915);
    float _2953 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2917);
    float _2955 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2957 = -_2923;
    float _2959 = _2957 + 1.0;
    float _2961 = _2304 * 0.5;
    out.m_87.x = _2949;
    out.m_87.y = _2951;
    out.m_87.z = _2939;
    float _2963 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2953);
    float _2965 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2967 = fma(_2935, _2669, _2933);
    float _2969 = _2326 + _2304;
    float _2971 = _2963 + _2304;
    float _2973 = fma(_2328, -0.5, _2961);
    float _2975 = fma(_2935, _2725, _2931);
    float _2977 = fma(_2889, _2669, _2913);
    float _2979 = fma(_2889, _2725, _2907);
    float _2981 = fma(_2847, _2725, _2941);
    float _2983 = fma(_2847, _2669, _2945);
    float _2985 = _2971 * 0.5;
    float _2987 = _2969 * 0.5;
    out.m_89.x = _2967;
    out.m_89.y = _2977;
    out.m_89.z = _2983;
    bool _2989 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2991 = isnan(_2054);
    bool _2993 = _2989 || _2991;
    bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2997 = _2993 || _2995;
    float _2999 = _1972 * _2032;
    out.m_91.x = _2987;
    out.m_91.y = _2973;
    out.m_91.z = _2985;
    out.m_91.w = _2304;
    out.m_93.x = _2975;
    out.m_93.y = _2979;
    out.m_93.z = _2981;
    out.m_95.x = _1906;
    out.m_95.y = _1904;
    out.m_95.z = _1908;
    float _3001 = _2945;
    float _3003 = _2939;
    float _3005 = _2999;
    float _3007 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2997)
    {
        _3001 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3009 = _3001;
    out.gl_Position.x = _2326;
    out.gl_Position.y = _2328;
    out.gl_Position.z = _2963;
    out.gl_Position.w = _2304;
    float _3011 = _3009;
    float _3013 = _3009;
    if (!_2997)
    {
        _3003 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3015 = _3003;
    float _3017 = _2999 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3019 = _3015;
    float _3021 = _3015;
    if (!_2997)
    {
        _2487 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3023 = _2487;
    float _3025 = _3023;
    float _3027 = _3023;
    if (!_2997)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3029 = _3005;
    float _3031 = -_2338;
    float _3033 = _3031 + 1.0;
    float _3035 = _3033 * _2955;
    float _3037 = precise::clamp(_3035, 0.0, 1.0);
    float _3039 = -_3037;
    float _3041 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3043 = _2943;
    float _3045 = _3029;
    float _3047 = _3029;
    if (!_2997)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3049 = _3007;
    float _3051 = _3041 * _2943;
    float _3053 = _3049;
    float _3055 = _3049;
    if (!_2997)
    {
        _3043 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3057 = _3043;
    float _3059 = _3051 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3061 = _2965 * _2366;
    float _3063 = -_2965;
    float _3065 = _3063 + 1.0;
    out.m_97.x = _3059;
    float _3067 = _2377 * _3061;
    float _3069 = _2387 * _3061;
    float _3071 = _2377 * _3065;
    float _3073 = fma(_2383, _3067, _2371);
    float _3075 = fma(_2385, _3067, _2373);
    float _3077 = fma(_2377, _3069, _2375);
    out.m_99.x = _3073;
    out.m_99.y = _3075;
    out.m_99.z = _3077;
    out.m_99.w = _3071;
    bool _3079 = !_2997;
    float _3081 = _3057;
    float _3083 = _3057;
    if (!_3079)
    {
        bool _3085 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3087 = isnan(_2054);
        bool _3089 = _3085 || _3087;
        bool _3091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3093 = _3089 || _3091;
        if (!_3093)
        {
            float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3097 = _2054 + _3095;
            float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3101 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3099;
            float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3107 = 1.0 / _3101;
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3125 = _3097 * _3107;
            float _3127 = precise::clamp(_3125, 0.0, 1.0);
            float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3133 = fma(_3127, _3105, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3135 = fma(_3127, _3131, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3137 = fma(_3127, _3111, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3139 = fma(_3127, _3115, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3141 = fma(_3127, _3119, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3143 = fma(_3127, _3123, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3027 = _3137;
            _3055 = _3141;
            _3013 = _3133;
            _3021 = _3139;
            _3083 = _3135;
            _3047 = _3143;
            _3145 = true;
        }
        else
        {
            bool _3147 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3149 = isnan(_2054);
            bool _3151 = _3147 || _3149;
            bool _3153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3155 = _3151 || _3153;
            if (!_3155)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3157 = _3011;
            _3013 = _3157;
            if (!_3155)
            {
                _3025 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3159 = _3025;
            _3027 = _3159;
            if (!_3155)
            {
                _3081 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3161 = _3081;
            _3083 = _3161;
            if (!_3155)
            {
                _3019 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3163 = _3019;
            _3021 = _3163;
            if (!_3155)
            {
                _3053 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3165 = _3053;
            _3055 = _3165;
            if (!_3155)
            {
                _3045 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3167 = _3045;
            bool _3169 = !_3155;
            _3047 = _3167;
            if (!_3169)
            {
                bool _3171 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3173 = isnan(_2054);
                bool _3175 = _3171 || _3173;
                bool _3177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3179 = _3175 || _3177;
                if (!_3179)
                {
                    float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3183 = _2054 + _3181;
                    float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3187 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3185;
                    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3193 = 1.0 / _3187;
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3197 = _3195 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3205 = _3203 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3211 = _3183 * _3193;
                    float _3213 = precise::clamp(_3211, 0.0, 1.0);
                    float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3219 = fma(_3213, _3191, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3221 = fma(_3213, _3217, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3223 = fma(_3213, _3197, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3225 = fma(_3213, _3201, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3227 = fma(_3213, _3205, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3229 = fma(_3213, _3209, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3027 = _3223;
                    _3055 = _3227;
                    _3013 = _3219;
                    _3021 = _3225;
                    _3083 = _3221;
                    _3047 = _3229;
                    _3145 = true;
                }
                else
                {
                    _3027 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3055 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3021 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3083 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3047 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3145 = false;
    float _3231 = _3027;
    float _3233 = _3055;
    float _3235 = _3013;
    float _3237 = _3021;
    float _3239 = _3083;
    float _3241 = _3047;
    float _3243 = fma(_2979, -0.5, 0.5);
    float _3245 = precise::clamp(_3243, 0.0, 1.0);
    float _3247 = -_3231;
    float _3249 = _3247 + _3233;
    float _3251 = _3017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3253 = -_3235;
    float _3255 = _3253 + _3237;
    float _3257 = fma(_3245, _3249, _3231);
    out.m_101.x = 0.0;
    float _3259 = -_3239;
    float _3261 = _3259 + _3241;
    float _3263 = fma(_3245, _3255, _3235);
    float _3265 = _3257 * 0.586610972881317138671875;
    out.m_49.x = _3251;
    bool _3267 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3269 = fma(_3245, _3261, _3239);
    float _3271 = fma(_3263, 0.298911988735198974609375, _3265);
    bool _3273 = _1972 > 0.0;
    bool _3275 = isnan(_1972);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan(0.0);
    bool _3281 = _3277 || _3279;
    float _3283 = fma(_3269, 0.114477999508380889892578125, _3271);
    bool _3285 = _2032 <= 0.0;
    bool _3287 = !_3281;
    bool _3289 = _3285 || _3287;
    float _3291 = -_3283;
    float _3293 = _3263 + _3291;
    float _3295 = -_3283;
    float _3297 = _3257 + _3295;
    float _3299 = -_3283;
    float _3301 = _3269 + _3299;
    float _3303 = fma(_3293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3283);
    float _3305 = fma(_3297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3283);
    float _3307 = fma(_3301, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3283);
    bool _3309 = !_3267;
    if (!_3309)
    {
        float _3311 = -_1904;
        float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3315 = -_1906;
        float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3319 = -_1908;
        float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3323 = _3313 * _3313;
        float _3325 = fma(_3317, _3317, _3323);
        float _3327 = fma(_3321, _3321, _3325);
        float _3329 = sqrt(_3327);
        float _3331 = rsqrt(_3327);
        float _3333 = -_3329;
        float _3335 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3337 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3339 = precise::clamp(_3337, 0.0, 1.0);
        float _3341 = _3317 * _3331;
        float _3343 = _3313 * _3331;
        float _3345 = abs(_3339);
        float _3347 = log2(_3345);
        float _3349 = _3321 * _3331;
        float _3351 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3353 = _2979 * _3343;
        float _3355 = -_3343;
        float _3357 = -_3351;
        float _3359 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3357);
        float _3361 = fma(_2975, _3341, _3353);
        float _3363 = -_3349;
        float _3365 = fma(_3363, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3359);
        float _3367 = fma(_2981, _3349, _3361);
        float _3369 = precise::clamp(_3367, 0.0, 1.0);
        float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3373 = _3365 + _3371;
        float _3375 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3377 = _3373 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = exp2(_3375);
        float _3383 = _3381 * _3379;
        float _3385 = _3369 * _3383;
        float _3387 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3389 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3391 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3387;
        out.m_101.y = _3389;
        out.m_101.z = _3391;
    }
    out.m_69.x = _3303;
    out.m_69.y = _3305;
    out.m_69.z = _3307;
    if (!_3289)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3393 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3393;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3145 = false;
    bool _700 = false;
    bool _564 = false;
    bool _456 = false;
    bool _228 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_46.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (!_124)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_124)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3449 = as_type<float>(_134);
        out.gl_Position.z = _3449;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_51.w;
    float _140 = float(_120);
    float _142 = 1.0 / _140;
    float _144 = -_138;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_138);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = _146 * _142;
    bool _160 = _146 >= _140;
    bool _162 = !_156;
    bool _164 = _160 || _162;
    out.m_53.x = _158;
    float _166 = _138;
    float _168 = _146;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _166;
    if (_164)
    {
        out.m_49.x = 0.0;
    }
    if (_164)
    {
        float _172 = _170 * 5.0;
        _136 = as_type<int>(_172);
    }
    int _174 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3521 = as_type<float>(_174);
        out.gl_Position.z = _3521;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    bool _202 = !_182;
    float _204 = _200;
    float _206 = _198;
    float _208 = _196;
    float _226;
    if (!_202)
    {
        float _210 = in.m_57.x;
        float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _218 = _216 * _212;
        float _220 = floor(_218);
        float _222 = -_220;
        float _224 = _218 + _222;
        _226 = _224;
        _228 = true;
    }
    else
    {
        _226 = _158;
    }
    _228 = false;
    float _230 = _226;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _230 + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _230 + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = _230 + _252;
    float _256 = 1.0 / _246;
    bool _258 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _260 = isnan(_230);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = 1.0 / _242;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = -_268;
    float _278 = _276 + 1.0;
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _282 = 1.0 / _250;
    float _284 = _238 * _256;
    bool _286 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _288 = isnan(_230);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = _296 * _278;
    float _300 = _234 * _270;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _306;
    float _310 = -_296;
    float _312 = _310 + 1.0;
    float _314 = fma(_274, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_304, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _322 = _254 * _282;
    bool _324 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_230);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = fma(_308, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _338 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_230);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = -_334;
    float _360 = _358 + 1.0;
    float _362 = _334 * _312;
    float _364 = fma(_352, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_320, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _368 = fma(_356, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = _348 * _360;
    float _372 = in.m_59.x;
    float _374 = in.m_59.y;
    float _376 = in.m_59.z;
    float _378 = -_348;
    float _380 = _378 + 1.0;
    float _382 = _316 * _370;
    float _384 = _336 * _370;
    float _386 = _314 * _370;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _388;
    float _392 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].y, _384);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _400;
    float _404 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[143].z, _386);
    float _406 = fma(_390, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _408 = fma(_398, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _410 = fma(_402, _322, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _412 = fma(_364, _362, _392);
    float _414 = fma(_366, _362, _394);
    float _416 = fma(_368, _362, _404);
    float _418 = fma(_406, _298, _412);
    float _420 = fma(_408, _298, _414);
    float _422 = fma(_410, _298, _416);
    float _424 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[146].x, _418);
    float _426 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[146].y, _420);
    float _428 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[146].z, _422);
    float _430 = _424 * _372;
    float _432 = _426 * _374;
    float _434 = _428 * _376;
    bool _436 = !_280;
    float _454;
    if (!_436)
    {
        float _438 = in.m_57.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].x, _146);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        _454 = _158;
    }
    _456 = false;
    float _458 = _454;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _462 = _458 + _460;
    bool _464 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _466 = isnan(_458);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _476;
    bool _480 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _482 = isnan(_458);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_474;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = 1.0 / _478;
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _504 = _490 * _494;
    float _506 = -_490;
    float _508 = _506 + 1.0;
    float _510 = _462 * _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _512;
    float _516 = fma(_498, _510, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _518;
    float _522 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _524 = _516 * _504;
    float _526 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _528 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[107].x, _524);
    float _530 = _526 * _504;
    float _532 = _522 * _504;
    float _534 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[108].x, _528);
    float _536 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[107].y, _530);
    float _538 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[107].z, _532);
    float _540 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[108].y, _536);
    float _542 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[108].z, _538);
    bool _544 = !_502;
    float _562;
    if (!_544)
    {
        float _546 = in.m_57.x;
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _550 = _546 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        _562 = _158;
    }
    _564 = false;
    float _566 = _562;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _570 = _566 + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _576 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_566);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _592 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _594 = isnan(_566);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _604;
    bool _608 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _610 = isnan(_566);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = 1.0 / _574;
    float _622 = -_586;
    float _624 = _622 + 1.0;
    bool _626 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _628 = _602 * _624;
    float _630 = -_602;
    float _632 = _630 + 1.0;
    float _634 = 1.0 / _590;
    float _636 = _606 * _620;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = _534 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _644 = fma(_636, _570, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = _640 * _634;
    float _650 = _644 * _628;
    float _652 = -_618;
    float _654 = _652 + 1.0;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _566 + _656;
    float _660 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[115].x, _650);
    float _662 = _586 * _654;
    float _664 = fma(_648, _658, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _666 = _540 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _668 = _542 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _670 = fma(_664, _662, _660);
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[117].x, _670);
    float _678 = _676 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _680 = !_626;
    float _698;
    if (!_680)
    {
        float _682 = in.m_57.x;
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _686 = _682 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _690 = _688 * _684;
        float _692 = floor(_690);
        float _694 = -_692;
        float _696 = _690 + _694;
        _698 = _696;
        _700 = true;
    }
    else
    {
        _698 = _158;
    }
    _700 = false;
    float _702 = _698;
    float _704 = in.m_57.z;
    float _706 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _708 = in.m_57.y;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _712 = _710 != 0;
    float _714 = _706 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _716 = in.m_46.x;
    float _718 = in.m_46.y;
    float _720 = in.m_46.z;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _728 = _726 != 0;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _732 = _730 != 0;
    float _734 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = in.m_57.x;
    float _738 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _740 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _742 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _738);
    float _744 = _704 * 2.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _750 = _708 * 2.0;
    float _752 = _708 + _704;
    float _754 = floor(_744);
    float _756 = fma(_158, _748, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _758 = _718 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _760 = _718 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = _718 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _764 = _752 + (-1.0);
    float _766 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[4].x, _758);
    float _768 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _770 = floor(_750);
    float _772 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[6].x, _762);
    float _774 = _716;
    if (_712)
    {
        _774 = _736;
    }
    float _776 = _774;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _780 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[4].z, _766);
    float _782 = _776;
    if (!_712)
    {
        _782 = _704;
    }
    float _784 = _782;
    float _786 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    bool _788 = _754 >= 0.0;
    bool _790 = isnan(_754);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _800 = _754 > 0.0;
    float _802 = _784 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _804 = _796 ? 0 : 1;
    float _806 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[6].z, _772);
    float _808 = -_798;
    float _810 = fma(_802, 2.0, _808);
    bool _812 = _770 > 0.0;
    float _814 = _704 + _736;
    float _816 = _802;
    if (_712)
    {
        _816 = _708;
    }
    float _818 = _816;
    float _820 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _742);
    float _822 = _814 + (-1.0);
    float _824 = _818;
    if (!_712)
    {
        _824 = _736;
    }
    float _826 = _824;
    float _828 = _736 * 2.0;
    bool _830 = _770 >= 0.0;
    bool _832 = isnan(_770);
    bool _834 = _830 || _832;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _842 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _844 = log2(_842);
    float _846 = _826 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _848 = _786 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _850 = _838 ? 0 : 1;
    float _852 = fma(_846, -2.0, _840);
    float _854 = _708 + _736;
    float _856 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _858 = ~_850;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    float _864 = floor(_828);
    bool _866 = !_724;
    int _868 = _866 ? 0 : 1;
    float _870 = _854 + (-1.0);
    int _872 = _862;
    if (!_812)
    {
        int _874 = ~_850;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    float _880 = _780 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _882 = !_732;
    int _884 = _882 ? 0 : 1;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _888 = _848 + _886;
    float _890 = _844 * _146;
    int _892 = ~_804;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = _806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _900 = abs(_868);
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _904 = _880 + _902;
    int _906 = _896;
    if (!_800)
    {
        int _908 = ~_804;
        int _910 = _908 + 1;
        _906 = _910;
    }
    int _912 = _906;
    float _914 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = abs(_884);
    float _918 = exp2(_890);
    float _920 = float(_900);
    float _922 = -_146;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[86].x, _810);
    float _926 = float(_916);
    float _928 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _852);
    float _930 = float(_912);
    float _932 = -_880;
    float _934 = _932 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _936 = float(_878);
    float _938 = _820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _940 = _920 * _930;
    float _942 = _926 * _936;
    bool _944 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _946 = isnan(1.0);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _952 = _948 || _950;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _956 = 1.0 + _954;
    bool _958 = _864 > 0.0;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _962 = _864 >= 0.0;
    bool _964 = isnan(_864);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    float _972 = in.m_61.x;
    float _974 = in.m_61.y;
    float _976 = in.m_61.z;
    float _978 = -_918;
    float _980 = _978 + 1.0;
    float _982 = 1.0 / _956;
    float _984 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[88].w, _960);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _988 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _990 = isnan(0.0);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _996 = _992 || _994;
    float _998 = _940 * (-2.0);
    float _1000 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _984);
    float _1002 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _986);
    float _1004 = _996 ? _980 : 0.0;
    float _1006 = _942 * (-2.0);
    int _1008 = _970 ? 0 : 1;
    float _1010 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1002);
    float _1012 = _888 * _888;
    float _1014 = fma(_914, _998, _914);
    int _1016 = ~_1008;
    int _1018 = _1016 + 1;
    int _1020 = _1018 + 1;
    float _1022 = _704 + (-0.5);
    int _1024 = _1020;
    if (!_958)
    {
        int _1026 = ~_1008;
        int _1028 = _1026 + 1;
        _1024 = _1028;
    }
    int _1030 = _1024;
    if (_952)
    {
        float _1032 = _1004 * _982;
        _168 = _1032;
    }
    float _1034 = _168;
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1038 = _898 + _1036;
    float _1040 = fma(_904, _904, _1012);
    float _1042 = _736 + (-0.5);
    float _1044 = -_848;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = float(_1030);
    float _1050 = fma(_1038, _1038, _1040);
    float _1052 = fma(_998, _972, _972);
    bool _1054 = !_728;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = _1046 * _1046;
    float _1060 = sqrt(_1050);
    float _1062 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1052);
    int _1064 = abs(_1056);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1066;
    float _1070 = -_898;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = fma(_934, _934, _1058);
    float _1076 = float(_1064);
    float _1078 = fma(_1014, _1034, _1062);
    float _1080 = rsqrt(_1050);
    float _1082 = fma(_1072, _1072, _1074);
    float _1084 = _1076 * _1048;
    float _1086 = _1084 * (-2.0);
    float _1088 = _1060 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1090 = fma(_1006, _976, _976);
    float _1092 = fma(_856, _1006, _856);
    float _1094 = fma(_778, _1086, _778);
    float _1096 = sqrt(_1082);
    float _1098 = precise::min(_714, _1088);
    float _1100 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1090);
    float _1102 = _848 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1104 = fma(_1086, _974, _974);
    float _1106 = _708 + (-0.5);
    float _1108 = _1080 * _1098;
    float _1110 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1102);
    float _1112 = fma(_1092, _1034, _1100);
    float _1114 = _1078 * 0.15915493667125701904296875;
    float _1116 = _888 * _1108;
    float _1118 = _904 * _1108;
    float _1120 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1110);
    float _1122 = _1038 * _1108;
    float _1124 = -_1116;
    float _1126 = _888 + _1124;
    float _1128 = -_1118;
    float _1130 = _904 + _1128;
    float _1132 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1134 = -_1122;
    float _1136 = _1038 + _1134;
    float _1138 = _1126 * _1126;
    float _1140 = rsqrt(_1082);
    float _1142 = -_1132;
    float _1144 = _938 + _1142;
    float _1146 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1104);
    float _1148 = fma(_1130, _1130, _1138);
    float _1150 = abs(_1144);
    float _1152 = precise::max(_1150, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1154 = fma(_1136, _1136, _1148);
    float _1156 = 1.0 / _1068;
    float _1158 = fma(_1094, _1034, _1146);
    float _1160 = _1112 * 0.15915493667125701904296875;
    float _1162 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1164 = precise::min(_1152, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1166 = _1158 * 0.15915493667125701904296875;
    bool _1168 = _1132 >= _938;
    bool _1170 = isnan(_1132);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(_938);
    bool _1176 = _1172 || _1174;
    float _1178 = sqrt(_1154);
    float _1180 = abs(_1096);
    float _1182 = precise::max(0.0, _1180);
    float _1184 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1162);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1188 = _1164 + _1186;
    float _1190 = _934 * _1140;
    bool _1192 = !_1176;
    float _1194 = _1192 ? 1.0 : (-1.0);
    float _1196 = _1072 * _1140;
    float _1198 = _1114 * 6.283185482025146484375;
    float _1200 = sin(_1198);
    float _1202 = precise::min(_1182, 40.0);
    float _1204 = _1188 * _1156;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1208 = _1190 * _1206;
    float _1210 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1184);
    float _1212 = _1046 * _1140;
    float _1214 = _1194 * _1204;
    float _1216 = fma(_1202, -0.02500000037252902984619140625, 1.0);
    float _1218 = _1114 * 6.283185482025146484375;
    float _1220 = cos(_1218);
    float _1222 = _1080 * _1178;
    float _1224 = _158 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1226 = in.m_63.x;
    float _1228 = in.m_63.y;
    float _1230 = in.m_63.z;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1234 = _1196 * _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1238 = -_1208;
    float _1240 = fma(_1196, _1236, _1238);
    float _1242 = _1224 * _1214;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1246 = _1212 * _1244;
    float _1248 = _1160 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1254 = -_1234;
    float _1256 = fma(_1212, _1252, _1254);
    float _1258 = _1240 * _1240;
    float _1260 = _706 * _1222;
    float _1262 = _1242 * 0.15915493667125701904296875;
    float _1264 = fma(_1256, _1256, _1258);
    float _1266 = _1166 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = _1166 * 6.283185482025146484375;
    float _1272 = sin(_1270);
    float _1274 = _1220 * _1250;
    float _1276 = _1200 * _1250;
    float _1278 = _1160 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1268 * _1250;
    float _1284 = _1220 * _1268;
    float _1286 = _1220 * _1272;
    float _1288 = _1200 * _1272;
    float _1290 = _1272 * _1250;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1294 = -_1246;
    float _1296 = fma(_1190, _1292, _1294);
    float _1298 = _1200 * _1268;
    float _1300 = _734 * _1222;
    float _1302 = fma(_1296, _1296, _1264);
    float _1304 = fma(_1280, _1284, _1288);
    float _1306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1228);
    float _1308 = fma(_1280, _1288, _1284);
    float _1310 = -_1286;
    float _1312 = fma(_1280, _1298, _1310);
    float _1314 = -_1298;
    float _1316 = fma(_1280, _1286, _1314);
    float _1318 = rsqrt(_1302);
    float _1320 = _1300 * _1306;
    float _1322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1226);
    float _1324 = _740 * _1222;
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1230);
    float _1328 = -_1320;
    float _1330 = _1280 * _1328;
    float _1332 = _1274 * _1320;
    float _1334 = _1260 * _1322;
    float _1336 = _1276 * _1320;
    float _1338 = rsqrt(_1210);
    float _1340 = _1324 * _1326;
    float _1342 = fma(_1304, _1334, _1332);
    float _1344 = fma(_1312, _1334, _1336);
    float _1346 = fma(_1282, _1334, _1330);
    float _1348 = fma(_1316, _1340, _1342);
    float _1350 = _1296 * _1318;
    float _1352 = _1240 * _1318;
    float _1354 = _1256 * _1318;
    float _1356 = fma(_1308, _1340, _1344);
    float _1358 = _1190 * _1350;
    float _1360 = _1196 * _1352;
    float _1362 = fma(_1290, _1340, _1346);
    float _1364 = _1212 * _1354;
    float _1366 = -_1358;
    float _1368 = fma(_1196, _1354, _1366);
    float _1370 = -_1360;
    float _1372 = fma(_1212, _1350, _1370);
    float _1374 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1376 = -_1364;
    float _1378 = fma(_1190, _1352, _1376);
    float _1380 = _1368 * _1348;
    float _1382 = _1372 * _1348;
    float _1384 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1386 = _1374 * _1374;
    float _1388 = fma(_1352, _1362, _1380);
    float _1390 = fma(_1354, _1362, _1382);
    float _1392 = _1378 * _1348;
    float _1394 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1396 = fma(_1212, _1356, _1388);
    float _1398 = fma(_1384, _1384, _1386);
    float _1400 = fma(_1190, _1356, _1390);
    float _1402 = fma(_1350, _1362, _1392);
    float _1404 = _848 + _1396;
    float _1406 = _848 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1408 = fma(_1394, _1394, _1398);
    float _1410 = _880 + _1400;
    float _1412 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1414 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1416 = fma(_1196, _1356, _1402);
    float _1418 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1420 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1406);
    float _1422 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1412);
    float _1424 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1414);
    float _1426 = _898 + _1416;
    float _1428 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1418);
    float _1430 = rsqrt(_1408);
    float _1432 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1434 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1424);
    float _1436 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1428);
    float _1438 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1446 = _1262 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    float _1450 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1452 = -_1442;
    float _1454 = _1452 + _1440;
    float _1456 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1458 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1460 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1462 = fma(_1216, _1454, _1442);
    float _1464 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1456);
    float _1466 = _1262 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = _1394 * _1430;
    float _1472 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1458);
    float _1474 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1460);
    float _1476 = _1384 * _1430;
    float _1478 = _1374 * _1430;
    float _1480 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1464);
    float _1482 = _1470 * _1470;
    float _1484 = -_1448;
    float _1486 = _1484 + 1.0;
    float _1488 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1472);
    float _1490 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1492 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1474);
    float _1494 = _1478 * _1486;
    float _1496 = fma(_1486, _1482, _1448);
    float _1498 = _1476 * _1486;
    float _1500 = _1488 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1502 = _1476 * _1468;
    float _1504 = _1478 * _1468;
    float _1506 = _1470 * _1468;
    float _1508 = -_848;
    float _1510 = _1508 + _1490;
    float _1512 = fma(_1470, _1494, _1502);
    float _1514 = -_1504;
    float _1516 = fma(_1470, _1498, _1514);
    float _1518 = -_1506;
    float _1520 = fma(_1478, _1498, _1518);
    float _1522 = -_880;
    float _1524 = _1522 + _1500;
    float _1526 = _1512 * _1510;
    float _1528 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1530 = fma(_1476, _1498, _1448);
    float _1532 = _1520 * _1510;
    float _1534 = fma(_1516, _1524, _1526);
    float _1536 = -_898;
    float _1538 = _1536 + _1528;
    float _1540 = fma(_1470, _1498, _1504);
    float _1542 = fma(_1530, _1524, _1532);
    float _1544 = fma(_1478, _1494, _1448);
    float _1546 = fma(_1496, _1538, _1534);
    float _1548 = fma(_1478, _1498, _1506);
    float _1550 = fma(_1540, _1538, _1542);
    float _1552 = _1544 * _1510;
    float _1554 = fma(_1546, _756, _898);
    float _1556 = -_1116;
    float _1558 = _848 + _1556;
    float _1560 = fma(_1550, _756, _880);
    float _1562 = -_1502;
    float _1564 = fma(_1470, _1494, _1562);
    float _1566 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1568 = _1554 + _1566;
    float _1570 = fma(_1548, _1524, _1552);
    float _1572 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1574 = _1560 + _1572;
    float _1576 = -_1118;
    float _1578 = _880 + _1576;
    float _1580 = _1568 * _1568;
    float _1582 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1584 = fma(_1564, _1538, _1570);
    float _1586 = -_1122;
    float _1588 = _898 + _1586;
    float _1590 = fma(_1574, _1574, _1580);
    float _1592 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1582);
    float _1594 = _848 + _1584;
    float _1596 = sqrt(_1590);
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1592);
    bool _1600 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1602 = _1592;
    float _1604 = _1580;
    float _1606 = _1584;
    float _1608 = _1116;
    float _1610 = _1568;
    if (!_1600)
    {
        _1602 = _1560;
    }
    float _1612 = _1602;
    float _1614 = _1612;
    if (!_1600)
    {
        _1604 = _1554;
    }
    float _1616 = _1604;
    float _1618 = _1616;
    if (!_1600)
    {
        _1606 = _1594;
    }
    float _1620 = _1606;
    bool _1622 = !_1600;
    float _1624 = _1620;
    if (!_1622)
    {
        float _1626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1630 = _1596 + _1628;
        float _1632 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = _1630 * _1626;
        float _1636 = rsqrt(_1590);
        float _1638 = _1634 * 0.15915493667125701904296875;
        float _1640 = _1638 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        float _1644 = _1638 * 6.283185482025146484375;
        float _1646 = cos(_1644);
        float _1648 = fma(_1642, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1650 = _1636 * _1648;
        float _1652 = _1646 + (-1.0);
        float _1654 = fma(_1574, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1656 = fma(_1568, _1650, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1660 = fma(_1594, _1646, _1658);
        _1624 = _1660;
        _1614 = _1654;
        _1618 = _1656;
    }
    float _1662 = _1624;
    float _1664 = _1614;
    float _1666 = _1618;
    float _1668 = -_848;
    float _1670 = _1668 + _1662;
    float _1672 = -_880;
    float _1674 = _1672 + _1664;
    float _1676 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1678 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1680 = _1670 * _1670;
    float _1682 = -_898;
    float _1684 = _1682 + _1666;
    float _1686 = 1.0 / _1676;
    float _1688 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1678);
    float _1690 = fma(_1674, _1674, _1680);
    float _1692 = -_1118;
    float _1694 = _1692 + _1664;
    float _1696 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1688);
    float _1698 = fma(_1684, _1684, _1690);
    float _1700 = -_1122;
    float _1702 = _1700 + _1666;
    float _1704 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1706 = sqrt(_1698);
    float _1708 = _1704 + _1676;
    float _1710 = _1708 * _1686;
    float _1712 = _1710 * 0.5;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1716 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1714);
    float _1718 = 1.0 / _1716;
    bool _1720 = _1706 > 0.0;
    bool _1722 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan(0.5);
    bool _1730 = _1726 || _1728;
    float _1732 = -_1116;
    float _1734 = _1732 + _1662;
    bool _1736 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan(0.5);
    bool _1744 = _1740 || _1742;
    float _1746 = _1664;
    float _1748 = _1666;
    float _1750 = _1662;
    float _1752 = _1674;
    float _1754 = _1734;
    float _1756 = _1686;
    if (!_1720)
    {
        _1746 = _1694;
    }
    float _1758 = _1746;
    float _1760 = _1758;
    float _1762 = _1758;
    if (!_1720)
    {
        _1748 = _1734;
    }
    float _1764 = _1748;
    float _1766 = _1764;
    if (!_1720)
    {
        _1750 = _1702;
    }
    float _1768 = _1750;
    bool _1770 = !_1720;
    float _1772 = _1768;
    if (!_1770)
    {
        float _1774 = _198 * _198;
        float _1776 = rsqrt(_1698);
        float _1778 = fma(_196, _196, _1774);
        float _1780 = fma(_200, _200, _1778);
        float _1782 = sqrt(_1780);
        float _1784 = _1674 * _1776;
        float _1786 = _1670 * _1776;
        float _1788 = _1684 * _1776;
        bool _1790 = _1782 > 0.0;
        float _1792 = _1776;
        float _1794 = _1782;
        if (!_1790)
        {
            _1760 = _1694;
        }
        float _1796 = _1760;
        _1762 = _1796;
        if (!_1790)
        {
            _1792 = _1734;
        }
        float _1798 = _1792;
        _1766 = _1798;
        if (!_1790)
        {
            _1794 = _1702;
        }
        float _1800 = _1794;
        bool _1802 = !_1790;
        _1772 = _1800;
        if (!_1802)
        {
            float _1804 = rsqrt(_1780);
            float _1806 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1808 = _198 * _1804;
            float _1810 = _196 * _1804;
            float _1812 = _200 * _1804;
            float _1814 = _1786 * _1808;
            float _1816 = fma(_1784, _1810, _1814);
            float _1818 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1820 = fma(_1788, _1812, _1816);
            float _1822 = _1820 * _1818;
            float _1824 = fma(_196, _1822, _1694);
            float _1826 = fma(_198, _1822, _1734);
            float _1828 = fma(_200, _1822, _1702);
            _1762 = _1824;
            _1766 = _1826;
            _1772 = _1828;
        }
    }
    float _1830 = _1762;
    float _1832 = _1766;
    float _1834 = _1772;
    if (_1730)
    {
        _1752 = 1.0;
    }
    float _1836 = _1752;
    float _1838 = _1836;
    if (_1744)
    {
        _204 = _1830;
    }
    float _1840 = _204;
    float _1842 = _1840;
    if (_1744)
    {
        _206 = _1832;
    }
    float _1844 = _206;
    float _1846 = _1844;
    if (_1744)
    {
        _208 = _1834;
    }
    float _1848 = _208;
    float _1850 = _1848;
    if (!_1744)
    {
        float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1854 = _1558 + _1852;
        float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1858 = _1578 + _1856;
        float _1860 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1862 = -_1578;
        float _1864 = _1862 + _1830;
        float _1866 = _1854 * _1854;
        float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1870 = _1588 + _1868;
        float _1872 = -_1558;
        float _1874 = _1872 + _1832;
        float _1876 = -_1588;
        float _1878 = _1876 + _1834;
        float _1880 = fma(_1858, _1858, _1866);
        float _1882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1884 = fma(_1870, _1870, _1880);
        float _1886 = sqrt(_1884);
        float _1888 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1890 = precise::min(_1886, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1892 = _1890 * _1882;
        float _1894 = _1888 * _1892;
        float _1896 = fma(_1864, _1894, _1578);
        float _1898 = fma(_1874, _1894, _1558);
        float _1900 = fma(_1878, _1894, _1588);
        _1754 = _1882;
        _1846 = _1898;
        _1842 = _1896;
        _1850 = _1900;
    }
    float _1902 = _1754;
    float _1904 = _1846;
    float _1906 = _1842;
    float _1908 = _1850;
    float _1910 = _1902;
    if (_1730)
    {
        _1756 = 1.0;
    }
    float _1912 = _1756;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1916 = _1718 * _1914;
    float _1918 = _1912;
    if (!_1730)
    {
        float _1920 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1922 = _1920 * 0.15915493667125701904296875;
        float _1924 = _1922 * 6.283185482025146484375;
        float _1926 = cos(_1924);
        float _1928 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1930 = _1928 * 0.15915493667125701904296875;
        float _1932 = _1922 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        float _1936 = 1.0 / _1926;
        float _1938 = _1930 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1934 * _1936;
        float _1944 = _1930 * 6.283185482025146484375;
        float _1946 = sin(_1944);
        float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1950 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1948;
        float _1952 = _1940 * _1942;
        float _1954 = 1.0 / _1950;
        float _1956 = 1.0 / _1952;
        float _1958 = _1946 * _1956;
        float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1962 = fma(_1916, _1958, _1960);
        float _1964 = _1962 * _1954;
        float _1966 = precise::clamp(_1964, 0.0, 1.0);
        _1910 = _1942;
        _1608 = _1922;
        _1838 = _1966;
    }
    float _1968 = _1910;
    float _1970 = _1608;
    float _1972 = _1838;
    float _1974 = _1968;
    float _1976 = _1970;
    if (!_1730)
    {
        float _1978 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1980 = _1978 * 0.15915493667125701904296875;
        float _1982 = _1980 * 6.283185482025146484375;
        float _1984 = cos(_1982);
        float _1986 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1988 = _1986 * 0.15915493667125701904296875;
        float _1990 = _1980 * 6.283185482025146484375;
        float _1992 = sin(_1990);
        float _1994 = 1.0 / _1984;
        float _1996 = _1988 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        float _2000 = _1992 * _1994;
        float _2002 = _1988 * 6.283185482025146484375;
        float _2004 = sin(_2002);
        float _2006 = _1998 * _2000;
        float _2008 = 1.0 / _2006;
        float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2012 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2010;
        float _2014 = 1.0 / _2012;
        float _2016 = _2004 * _2008;
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2020 = fma(_1916, _2016, _2018);
        float _2022 = _2020 * _2014;
        float _2024 = precise::clamp(_2022, 0.0, 1.0);
        float _2026 = -_2024;
        float _2028 = _2026 + 1.0;
        _1974 = _1994;
        _1918 = _2028;
    }
    float _2030 = _1974;
    float _2032 = _1918;
    float _2034 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2036 = _1904 + _2034;
    float _2038 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2040 = _1906 + _2038;
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2044 = _1908 + _2042;
    float _2046 = _2036 * _2036;
    float _2048 = fma(_2040, _2040, _2046);
    float _2050 = fma(_2044, _2044, _2048);
    float _2052 = rsqrt(_2050);
    float _2054 = sqrt(_2050);
    float _2056 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2058 = _2040 * _2056;
    float _2060 = _2044 * _2056;
    float _2062 = _2058 * _2058;
    float _2064 = _2060 * _2060;
    float _2066 = _2062 + _2064;
    float _2068 = sqrt(_2066);
    bool _2070 = _2068 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2074 = _2068 + _2072;
    float _2076 = _2044;
    float _2078 = _2046;
    float _2080 = _2074;
    float _2082 = _2036;
    float _2084 = _2030;
    if (_2070)
    {
        float _2086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2076 = _2086;
    }
    float _2088 = _2076;
    if (_2070)
    {
        float _2090 = rsqrt(_2066);
        _2078 = _2090;
    }
    float _2092 = _2078;
    float _2094 = _2092;
    if (_2070)
    {
        float _2096 = _2074 * _2088;
        _2080 = _2096;
    }
    float _2098 = _2080;
    if (_2070)
    {
        float _2100 = _2098 * 0.15915493667125701904296875;
        _1976 = _2100;
    }
    float _2102 = _1976;
    float _2104 = _2052;
    float _2106 = _2102;
    if (_2070)
    {
        float _2108 = _2102 * 6.283185482025146484375;
        float _2110 = sin(_2108);
        _2104 = _2110;
    }
    float _2112 = _2104;
    float _2114 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2116 = precise::max(0.0, _2114);
    float _2118 = _2088;
    float _2120 = _2116;
    if (_2070)
    {
        float _2122 = _2102 * 6.283185482025146484375;
        float _2124 = cos(_2122);
        _2118 = _2124;
    }
    float _2126 = _2118;
    float _2128 = -_2056;
    float _2130 = -_2116;
    float _2132 = fma(_2036, _2128, _2130);
    if (_2070)
    {
        float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2082 = _2134;
    }
    float _2136 = _2082;
    if (!_2070)
    {
        _2106 = _2062;
    }
    float _2138 = _2106;
    float _2140 = _2112;
    float _2142 = _2138;
    if (_2070)
    {
        float _2144 = fma(_2112, _2136, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2084 = _2144;
    }
    float _2146 = _2084;
    float _2148 = _2146;
    if (!_2070)
    {
        _2140 = _2132;
    }
    float _2150 = _2140;
    float _2152 = _2150;
    float _2154 = _2126;
    if (_2070)
    {
        float _2156 = _2126 + (-1.0);
        _2120 = _2156;
    }
    float _2158 = _2120;
    float _2160 = _2158;
    if (_2070)
    {
        float _2162 = _2092 * _2146;
        _1610 = _2162;
    }
    float _2164 = _1610;
    if (!_2070)
    {
        _2094 = _2058;
    }
    float _2166 = _2094;
    float _2168 = _2166;
    if (_2070)
    {
        float _2170 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2160 = _2170;
    }
    float _2172 = _2160;
    if (_2070)
    {
        float _2174 = _2058 * _2164;
        _2168 = _2174;
    }
    float _2176 = _2168;
    if (!_2070)
    {
        _2148 = _2064;
    }
    float _2178 = _2148;
    float _2180 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2182 = _2178;
    if (_2070)
    {
        float _2184 = fma(_2132, _2126, _2172);
        _2152 = _2184;
    }
    float _2186 = _2152;
    if (!_2070)
    {
        _2154 = _2060;
    }
    float _2188 = _2154;
    float _2190 = _2188;
    if (_2070)
    {
        float _2192 = _2176 * _2176;
        _2142 = _2192;
    }
    float _2194 = _2142;
    if (_2070)
    {
        float _2196 = _2060 * _2164;
        _2190 = _2196;
    }
    float _2198 = _2190;
    float _2200 = floor(_2180);
    float _2202 = fma(_2186, _2186, _2194);
    if (_2070)
    {
        float _2204 = _2198 * _2198;
        _2182 = _2204;
    }
    float _2206 = _2182;
    float _2208 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2210 = _2202 + _2206;
    float _2212 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2208);
    float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2216 = fma(_2054, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2214);
    float _2218 = precise::clamp(_2216, 0.0, 1.0);
    float _2220 = rsqrt(_2210);
    float _2222 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2212);
    float _2224 = -_2218;
    float _2226 = _2224 + 1.0;
    float _2228 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2230 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2232 = fma(_1588, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2234 = abs(_2226);
    float _2236 = log2(_2234);
    float _2238 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2240 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2242 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2244 = -_2200;
    float _2246 = _2180 + _2244;
    float _2248 = -_2238;
    float _2250 = fma(_2248, _2230, 1.0);
    float _2252 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2254 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2240);
    float _2256 = _2220 * _2176;
    float _2258 = _2220 * _2186;
    float _2260 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2252);
    float _2262 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2254);
    float _2264 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2266 = _2220 * _2198;
    float _2268 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2260);
    float _2270 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2272 = -_2264;
    float _2274 = fma(_2258, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2272);
    float _2276 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2242);
    float _2278 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2280 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2282 = -_2266;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2274);
    float _2286 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2276);
    float _2288 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2290 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2280);
    float _2292 = floor(_2232);
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2296 = fma(_2284, -0.5, 0.5);
    float _2298 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2290);
    float _2300 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2302 = fma(_2284, 0.5, 0.5);
    float _2304 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2298);
    float _2306 = exp2(_2288);
    float _2308 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2310 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2300);
    float _2312 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2308);
    float _2314 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2310);
    float _2316 = 1.0 / _2304;
    float _2318 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2312);
    float _2320 = -_2292;
    float _2322 = _2232 + _2320;
    float _2324 = fma(_2302, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2326 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2314);
    float _2328 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2318);
    float _2330 = fma(_2302, _2324, -0.212114393711090087890625);
    float _2332 = log2(_2250);
    float _2334 = sqrt(_2296);
    float _2336 = _2326 * _2316;
    float2 _6960 = float2(_2246, _2322);
    float _2338 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6960, float2(0.0), isnan(_6960)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6960, float2(0.0), isnan(_6960)), level(0.0)).x;
    float _2340 = fma(_2302, _2330, 1.570728778839111328125);
    float _2342 = _2332 * 0.693147182464599609375;
    float _2344 = _2258 + 1.0;
    float _2346 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2348 = -_2258;
    float _2350 = fma(_2306, _2344, _2348);
    float _2352 = _2328 * _2316;
    float _2354 = fma(_2336, 0.5, 0.5);
    float _2356 = _2334 * 0.636619746685028076171875;
    float _2358 = fma(_2350, 0.5, 0.5);
    float _2360 = fma(_2352, -0.5, 0.5);
    float _2362 = -_2340;
    float _2364 = fma(_2356, _2362, 1.0);
    float3 _7007 = float3(_2354, _2360, _2346);
    float _2366 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7007, float3(0.0), isnan(_7007)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7007, float3(0.0), isnan(_7007)), level(0.0)).x;
    float3 _7018 = float3(_2354, _2360, _2346);
    float4 _2369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7018, float3(0.0), isnan(_7018)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7018, float3(0.0), isnan(_7018)), level(0.0)).xyzw;
    float _2371 = _2369.x;
    float _2373 = _2369.y;
    float _2375 = _2369.z;
    float _2377 = _2369.w;
    float2 _7034 = float2(_2364, _2358);
    float3 _2381 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7034, float2(0.0), isnan(_7034)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7034, float2(0.0), isnan(_7034)), level(0.0)).xyz;
    float _2383 = _2381.x;
    float _2385 = _2381.y;
    float _2387 = _2381.z;
    float _2389 = in.m_57.w;
    float _2391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2393 = in.m_65.y;
    bool _2395 = _704 > 0.5;
    float _2397 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2399 = _708 > 0.5;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2407 = _2405 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2409 = in.m_65.x;
    float _2411 = 1.0 / _2403;
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    out.m_67.x = _646;
    out.m_67.y = _672;
    out.m_67.z = _674;
    out.m_67.w = _678;
    float _2417 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2419 = 1.0 / _2407;
    out.m_69.w = _1098;
    bool _2421 = _2389 > 0.5;
    out.m_71.x = _1578;
    out.m_71.y = _1558;
    out.m_71.z = _1588;
    float _2423 = -_2393;
    float _2425 = _2423 + 1.0;
    float _2427 = 1.0 / _2415;
    int _2429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2431 = _2429 != 0;
    float _2433 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2435 = _2433 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2439 = _2437 != 0;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2443 = _702 + _2441;
    int _2445 = _2399 ? as_type<int>(_2425) : as_type<int>(_2393);
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2449 = _702 + _2447;
    float _2451 = _2435 * _2419;
    float _2453 = _2439 ? as_type<float>(_2445) : _2393;
    float _2455 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2457 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2455;
    int _2459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2461 = _2459 != 0;
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2465 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2463;
    bool _2467 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2469 = isnan(_702);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2475 = _2471 || _2473;
    float _2477 = float(_2475);
    float _2479 = _2457 * _2411;
    float _2481 = _2419;
    float _2483 = _2411;
    float _2485 = _2393;
    float _2487 = _2326;
    if (!_2431)
    {
        _2481 = _2409;
    }
    float _2489 = _2481;
    float _2491 = _2465 * _2427;
    int _2493 = _2421 ? as_type<int>(_2425) : as_type<int>(_2393);
    float _2495 = fma(_2479, _2449, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2499 = _2497 != 0;
    float _2501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2505 = _2503 != 0;
    float _2507 = _1304 * _1368;
    int _2509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2511 = _2509 != 0;
    float _2513 = fma(_2451, _2443, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2515 = _2489;
    bool _2517 = _2511;
    if (!_2431)
    {
        _2483 = _2489;
    }
    float _2519 = _2483;
    float _2521 = fma(_1282, _1352, _2507);
    float _2523 = _2519;
    if (_2431)
    {
        _2515 = _2409;
    }
    float _2525 = _2515;
    float _2527 = -_2477;
    float _2529 = _2527 + 1.0;
    bool _2531 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2533 = isnan(_702);
    bool _2535 = _2531 || _2533;
    bool _2537 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2539 = _2535 || _2537;
    float _2541 = float(_2539);
    float _2543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2545 = _2511 ? as_type<float>(_2493) : _2393;
    int _2547 = 0;
    float _2549 = _2525;
    if (_2499)
    {
        float _2551 = -_2525;
        float _2553 = _2551 + 1.0;
        _2547 = as_type<int>(_2553);
    }
    int _2555 = _2547;
    float _2557 = as_type<float>(_2555);
    if (_2431)
    {
        bool _2559 = _736 > 0.5;
        _2517 = _2559;
    }
    bool _2561 = _2517;
    float _2563 = _2541 * _2529;
    float _2565 = in.m_73.x;
    float _2567 = in.m_73.y;
    float _2569 = in.m_73.z;
    bool _2571 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2573 = isnan(_702);
    bool _2575 = _2571 || _2573;
    bool _2577 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2579 = _2575 || _2577;
    float _2581 = float(_2579);
    float _2583 = -_2541;
    float _2585 = _2583 + 1.0;
    int _2587 = as_type<int>(_2585);
    if (_2461)
    {
        float _2589 = _2395 ? _2425 : _2393;
        _2485 = _2589;
    }
    float _2591 = _2485;
    float _2593 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2595 = _1228 != 0.0;
    bool _2597 = isnan(_1228);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan(0.0);
    bool _2603 = _2599 || _2601;
    float _2605 = _2581 * _2585;
    bool _2607 = _702 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2609 = isnan(_702);
    bool _2611 = _2607 || _2609;
    bool _2613 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2615 = _2611 || _2613;
    float _2617 = float(_2615);
    float _2619 = -_2581;
    float _2621 = _2619 + 1.0;
    bool _2623 = _1226 == 0.0;
    bool _2625 = !_2603;
    bool _2627 = _2623 && _2625;
    float _2629 = _2591;
    if (_2431)
    {
        float _2631 = -_2525;
        float _2633 = _2631 + 1.0;
        _2587 = as_type<int>(_2633);
    }
    int _2635 = _2587;
    float _2637 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2639 = _702 + _2637;
    float _2641 = _2617 * _2621;
    bool _2643 = _1230 == 0.0;
    bool _2645 = _2643 && _2627;
    int _2647 = 0;
    if (_2505)
    {
        float _2649 = -_2525;
        float _2651 = _2649 + 1.0;
        _2647 = as_type<int>(_2651);
    }
    int _2653 = _2647;
    if (_2431)
    {
        float _2655 = _2561 ? as_type<float>(_2635) : _2525;
        _2523 = _2655;
    }
    float _2657 = _2523;
    float _2659 = _2495 * _2641;
    float _2661 = 0.0;
    if (!_2499)
    {
        _2661 = _2525;
    }
    float _2663 = _2661;
    float _2665 = in.m_75.x;
    float _2667 = in.m_75.y;
    float _2669 = in.m_75.z;
    float _2671 = in.m_75.w;
    float _2673 = _2663;
    if (_2499)
    {
        float _2675 = _2395 ? as_type<float>(_2555) : _2525;
        _2673 = _2675;
    }
    float _2677 = _2673;
    float _2679 = fma(_2491, _2639, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2681 = fma(_2593, _2591, -0.5);
    float _2683 = 0.0;
    if (!_2505)
    {
        _2683 = _2525;
    }
    float _2685 = _2683;
    float _2687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2689 = _2685;
    if (_2505)
    {
        float _2691 = _2399 ? as_type<float>(_2653) : _2525;
        _2689 = _2691;
    }
    float _2693 = _2689;
    float _2695 = -_2617;
    float _2697 = _2695 + 1.0;
    float _2699 = _2697;
    if (_2645)
    {
        _2557 = _2567;
    }
    float _2701 = _2557;
    float _2703 = _2545 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2705 = _2701;
    if (_2645)
    {
        _2549 = _2569;
    }
    float _2707 = _2549;
    float _2709 = fma(_2417, _2693, -0.5);
    float _2711 = _2707;
    if (_2645)
    {
        _2629 = _2701;
    }
    float _2713 = _2629;
    float _2715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2717 = _2713;
    if (!_2645)
    {
        _2705 = _2567;
    }
    float _2719 = _2705;
    float _2721 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2659);
    if (!_2645)
    {
        float _2723 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2569);
        _2711 = _2723;
    }
    float _2725 = _2711;
    float _2727 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2729 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_2645)
    {
        float _2731 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2719);
        _2717 = _2731;
    }
    float _2733 = _2717;
    float _2735 = _2453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2739 = fma(_1010, _2709, _924);
    float _2741 = fma(_2513, _2605, _2721);
    float _2743 = _2667 * _2569;
    float _2745 = _2669 * _2565;
    if (_2645)
    {
        _2699 = _2565;
    }
    float _2747 = _2699;
    float _2749 = _2747;
    if (!_2645)
    {
        float _2751 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2565);
        _2749 = _2751;
    }
    float _2753 = _2749;
    float _2755 = -_2743;
    float _2757 = fma(_2669, _2719, _2755);
    float _2759 = _2735 * _2715;
    float _2761 = _2727 * _2687;
    float _2763 = _2729 * _2543;
    float _2765 = -_2745;
    float _2767 = fma(_2665, _2569, _2765);
    float _2769 = _2665 * _2719;
    float _2771 = -_928;
    float _2773 = fma(_1000, _2681, _2771);
    float _2775 = _2739 + 0.5;
    float _2777 = fma(_2679, _2563, _2741);
    float _2779 = _2703 * _2737;
    float _2781 = -_2769;
    float _2783 = fma(_2667, _2565, _2781);
    float _2785 = _1274 * _1368;
    out.m_77.x = _2761;
    out.m_77.y = _2759;
    out.m_77.z = _2763;
    out.m_77.w = _2779;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2789 = fma(_2477, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2777);
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2793 = -_1280;
    float _2795 = fma(_2793, _1352, _2785);
    float _2797 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2799 = _2787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2801 = _2791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2803 = _2789 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2805 = _2797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2807 = _1316 * _1368;
    float _2809 = fma(_1276, _1212, _2795);
    float _2811 = _2773 + 0.5;
    float _2813 = _2767 * _2671;
    float _2815 = _1274 * _1372;
    float _2817 = abs(_1916);
    float _2819 = log2(_2817);
    float _2821 = _1274 * _1378;
    float _2823 = _1304 * _1372;
    float _2825 = _1304 * _1378;
    float _2827 = -_1280;
    float _2829 = fma(_2827, _1354, _2815);
    float _2831 = _1316 * _1378;
    float _2833 = -_1280;
    float _2835 = fma(_2833, _1350, _2821);
    float _2837 = fma(_1282, _1350, _2825);
    float _2839 = fma(_1276, _1190, _2829);
    float _2841 = fma(_1290, _1350, _2831);
    float _2843 = fma(_1276, _1196, _2835);
    float _2845 = fma(_1312, _1196, _2837);
    float _2847 = fma(_1308, _1196, _2841);
    out.m_79.x = _2799;
    out.m_79.y = _2801;
    out.m_79.z = _2805;
    out.m_79.w = _2803;
    float _2849 = _2819 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2851 = fma(_1282, _1354, _2823);
    float _2853 = fma(_1312, _1212, _2521);
    out.m_81.x = _2775;
    out.m_81.y = _2811;
    float _2855 = _2843 * _2667;
    float _2857 = _2757 * _2671;
    float _2859 = exp2(_2849);
    float _2861 = fma(_1312, _1190, _2851);
    float _2863 = _2839 * _2733;
    float _2865 = _2783 * _2671;
    float _2867 = _1316 * _1372;
    bool _2869 = _1916 <= 8000.0;
    bool _2871 = isnan(_1916);
    bool _2873 = _2869 || _2871;
    bool _2875 = isnan(8000.0);
    bool _2877 = _2873 || _2875;
    float _2879 = float(_2877);
    out.m_83.x = _1260;
    float _2881 = fma(_1290, _1352, _2807);
    float _2883 = _2809 * _2667;
    float _2885 = _2809 * _2733;
    float _2887 = _2813 * _2809;
    float _2889 = fma(_1308, _1212, _2881);
    float _2891 = _2839 * _2667;
    float _2893 = _2813 * _2839;
    float _2895 = _2843 * _2733;
    float _2897 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2899 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2901 = precise::clamp(_2899, 0.0, 1.0);
    float _2903 = _2813 * _2843;
    float _2905 = fma(_2857, _2861, _2893);
    float _2907 = fma(_2853, _2753, _2885);
    float _2909 = fma(_2901, -2.0, 3.0);
    float _2911 = _2901 * _2901;
    float _2913 = fma(_2853, _2665, _2883);
    float _2915 = fma(_2857, _2853, _2887);
    float _2917 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2897);
    float _2919 = _2911 * _2909;
    float _2921 = fma(_2857, _2845, _2903);
    float _2923 = exp2(_2397);
    float _2925 = fma(_1290, _1354, _2867);
    float _2927 = -_2919;
    float _2929 = _2927 + 1.0;
    float _2931 = fma(_2861, _2753, _2863);
    float _2933 = fma(_2861, _2665, _2891);
    float _2935 = fma(_1308, _1190, _2925);
    float _2937 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2919);
    float _2939 = fma(_2865, _2847, _2921);
    float _2941 = fma(_2845, _2753, _2895);
    float _2943 = in.m_85.x;
    float _2945 = fma(_2845, _2665, _2855);
    float _2947 = _2879 * _2937;
    float _2949 = fma(_2865, _2935, _2905);
    float _2951 = fma(_2865, _2889, _2915);
    float _2953 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2917);
    float _2955 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2957 = -_2923;
    float _2959 = _2957 + 1.0;
    float _2961 = _2304 * 0.5;
    out.m_87.x = _2949;
    out.m_87.y = _2951;
    out.m_87.z = _2939;
    float _2963 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2953);
    float _2965 = _2959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2967 = fma(_2935, _2669, _2933);
    float _2969 = _2326 + _2304;
    float _2971 = _2963 + _2304;
    float _2973 = fma(_2328, -0.5, _2961);
    float _2975 = fma(_2935, _2725, _2931);
    float _2977 = fma(_2889, _2669, _2913);
    float _2979 = fma(_2889, _2725, _2907);
    float _2981 = fma(_2847, _2725, _2941);
    float _2983 = fma(_2847, _2669, _2945);
    float _2985 = _2971 * 0.5;
    float _2987 = _2969 * 0.5;
    out.m_89.x = _2967;
    out.m_89.y = _2977;
    out.m_89.z = _2983;
    bool _2989 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2991 = isnan(_2054);
    bool _2993 = _2989 || _2991;
    bool _2995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2997 = _2993 || _2995;
    float _2999 = _1972 * _2032;
    out.m_91.x = _2987;
    out.m_91.y = _2973;
    out.m_91.z = _2985;
    out.m_91.w = _2304;
    out.m_93.x = _2975;
    out.m_93.y = _2979;
    out.m_93.z = _2981;
    out.m_95.x = _1906;
    out.m_95.y = _1904;
    out.m_95.z = _1908;
    float _3001 = _2945;
    float _3003 = _2939;
    float _3005 = _2999;
    float _3007 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_2997)
    {
        _3001 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3009 = _3001;
    out.gl_Position.x = _2326;
    out.gl_Position.y = _2328;
    out.gl_Position.z = _2963;
    out.gl_Position.w = _2304;
    float _3011 = _3009;
    float _3013 = _3009;
    if (!_2997)
    {
        _3003 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3015 = _3003;
    float _3017 = _2999 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3019 = _3015;
    float _3021 = _3015;
    if (!_2997)
    {
        _2487 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3023 = _2487;
    float _3025 = _3023;
    float _3027 = _3023;
    if (!_2997)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3029 = _3005;
    float _3031 = -_2338;
    float _3033 = _3031 + 1.0;
    float _3035 = _3033 * _2955;
    float _3037 = precise::clamp(_3035, 0.0, 1.0);
    float _3039 = -_3037;
    float _3041 = fma(_3039, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3043 = _2943;
    float _3045 = _3029;
    float _3047 = _3029;
    if (!_2997)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3049 = _3007;
    float _3051 = _3041 * _2943;
    float _3053 = _3049;
    float _3055 = _3049;
    if (!_2997)
    {
        _3043 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3057 = _3043;
    float _3059 = _3051 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3061 = _2965 * _2366;
    float _3063 = -_2965;
    float _3065 = _3063 + 1.0;
    out.m_97.x = _3059;
    float _3067 = _2377 * _3061;
    float _3069 = _2387 * _3061;
    float _3071 = _2377 * _3065;
    float _3073 = fma(_2383, _3067, _2371);
    float _3075 = fma(_2385, _3067, _2373);
    float _3077 = fma(_2377, _3069, _2375);
    out.m_99.x = _3073;
    out.m_99.y = _3075;
    out.m_99.z = _3077;
    out.m_99.w = _3071;
    bool _3079 = !_2997;
    float _3081 = _3057;
    float _3083 = _3057;
    if (!_3079)
    {
        bool _3085 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3087 = isnan(_2054);
        bool _3089 = _3085 || _3087;
        bool _3091 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3093 = _3089 || _3091;
        if (!_3093)
        {
            float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3097 = _2054 + _3095;
            float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3101 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3099;
            float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3105 = _3103 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3107 = 1.0 / _3101;
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3125 = _3097 * _3107;
            float _3127 = precise::clamp(_3125, 0.0, 1.0);
            float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3133 = fma(_3127, _3105, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3135 = fma(_3127, _3131, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3137 = fma(_3127, _3111, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3139 = fma(_3127, _3115, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3141 = fma(_3127, _3119, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3143 = fma(_3127, _3123, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3027 = _3137;
            _3055 = _3141;
            _3013 = _3133;
            _3021 = _3139;
            _3083 = _3135;
            _3047 = _3143;
            _3145 = true;
        }
        else
        {
            bool _3147 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3149 = isnan(_2054);
            bool _3151 = _3147 || _3149;
            bool _3153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3155 = _3151 || _3153;
            if (!_3155)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3157 = _3011;
            _3013 = _3157;
            if (!_3155)
            {
                _3025 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3159 = _3025;
            _3027 = _3159;
            if (!_3155)
            {
                _3081 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3161 = _3081;
            _3083 = _3161;
            if (!_3155)
            {
                _3019 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3163 = _3019;
            _3021 = _3163;
            if (!_3155)
            {
                _3053 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3165 = _3053;
            _3055 = _3165;
            if (!_3155)
            {
                _3045 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3167 = _3045;
            bool _3169 = !_3155;
            _3047 = _3167;
            if (!_3169)
            {
                bool _3171 = _2054 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3173 = isnan(_2054);
                bool _3175 = _3171 || _3173;
                bool _3177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3179 = _3175 || _3177;
                if (!_3179)
                {
                    float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3183 = _2054 + _3181;
                    float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3187 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3185;
                    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3193 = 1.0 / _3187;
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3197 = _3195 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3205 = _3203 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3211 = _3183 * _3193;
                    float _3213 = precise::clamp(_3211, 0.0, 1.0);
                    float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3219 = fma(_3213, _3191, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3221 = fma(_3213, _3217, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3223 = fma(_3213, _3197, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3225 = fma(_3213, _3201, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3227 = fma(_3213, _3205, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3229 = fma(_3213, _3209, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3027 = _3223;
                    _3055 = _3227;
                    _3013 = _3219;
                    _3021 = _3225;
                    _3083 = _3221;
                    _3047 = _3229;
                    _3145 = true;
                }
                else
                {
                    _3027 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3055 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3021 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3083 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3047 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3145 = false;
    float _3231 = _3027;
    float _3233 = _3055;
    float _3235 = _3013;
    float _3237 = _3021;
    float _3239 = _3083;
    float _3241 = _3047;
    float _3243 = fma(_2979, -0.5, 0.5);
    float _3245 = precise::clamp(_3243, 0.0, 1.0);
    float _3247 = -_3231;
    float _3249 = _3247 + _3233;
    float _3251 = _3017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3253 = -_3235;
    float _3255 = _3253 + _3237;
    float _3257 = fma(_3245, _3249, _3231);
    out.m_101.x = 0.0;
    float _3259 = -_3239;
    float _3261 = _3259 + _3241;
    float _3263 = fma(_3245, _3255, _3235);
    float _3265 = _3257 * 0.586610972881317138671875;
    out.m_49.x = _3251;
    bool _3267 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3269 = fma(_3245, _3261, _3239);
    float _3271 = fma(_3263, 0.298911988735198974609375, _3265);
    bool _3273 = _1972 > 0.0;
    bool _3275 = isnan(_1972);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan(0.0);
    bool _3281 = _3277 || _3279;
    float _3283 = fma(_3269, 0.114477999508380889892578125, _3271);
    bool _3285 = _2032 <= 0.0;
    bool _3287 = !_3281;
    bool _3289 = _3285 || _3287;
    float _3291 = -_3283;
    float _3293 = _3263 + _3291;
    float _3295 = -_3283;
    float _3297 = _3257 + _3295;
    float _3299 = -_3283;
    float _3301 = _3269 + _3299;
    float _3303 = fma(_3293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3283);
    float _3305 = fma(_3297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3283);
    float _3307 = fma(_3301, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3283);
    bool _3309 = !_3267;
    if (!_3309)
    {
        float _3311 = -_1904;
        float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3315 = -_1906;
        float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3319 = -_1908;
        float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3323 = _3313 * _3313;
        float _3325 = fma(_3317, _3317, _3323);
        float _3327 = fma(_3321, _3321, _3325);
        float _3329 = sqrt(_3327);
        float _3331 = rsqrt(_3327);
        float _3333 = -_3329;
        float _3335 = _3333 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3337 = _3335 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3339 = precise::clamp(_3337, 0.0, 1.0);
        float _3341 = _3317 * _3331;
        float _3343 = _3313 * _3331;
        float _3345 = abs(_3339);
        float _3347 = log2(_3345);
        float _3349 = _3321 * _3331;
        float _3351 = _3341 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3353 = _2979 * _3343;
        float _3355 = -_3343;
        float _3357 = -_3351;
        float _3359 = fma(_3355, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3357);
        float _3361 = fma(_2975, _3341, _3353);
        float _3363 = -_3349;
        float _3365 = fma(_3363, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3359);
        float _3367 = fma(_2981, _3349, _3361);
        float _3369 = precise::clamp(_3367, 0.0, 1.0);
        float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3373 = _3365 + _3371;
        float _3375 = _3347 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3377 = _3373 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = exp2(_3375);
        float _3383 = _3381 * _3379;
        float _3385 = _3369 * _3383;
        float _3387 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3389 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3391 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _3387;
        out.m_101.y = _3389;
        out.m_101.z = _3391;
    }
    out.m_69.x = _3303;
    out.m_69.y = _3305;
    out.m_69.z = _3307;
    if (!_3289)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3393 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3393;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

