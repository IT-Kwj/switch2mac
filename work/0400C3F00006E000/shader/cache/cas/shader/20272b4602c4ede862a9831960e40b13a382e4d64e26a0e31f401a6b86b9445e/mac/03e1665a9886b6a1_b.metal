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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_113 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 m_111 [[user(locn14)]];
    float4 m_101 [[user(locn15)]];
    float4 m_107 [[user(locn16)]];
    float4 m_109 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_103 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_91 [[attribute(8)]];
    float4 m_89 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
    float4 m_67 [[attribute(11)]];
    float4 m_93 [[attribute(12)]];
    float4 m_73 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6654 = false;
    bool _5735 = false;
    bool _1070 = false;
    bool _890 = false;
    bool _710 = false;
    bool _584 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6953 = as_type<float>(_148);
        out.gl_Position.z = _6953;
    }
    if (!_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7023 = as_type<float>(_186);
        out.gl_Position.z = _7023;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_59.x;
    float _198 = in.m_59.y;
    float _200 = in.m_59.z;
    float _202 = in.m_61.x;
    float _204 = in.m_61.y;
    float _206 = in.m_61.z;
    float _208 = in.m_63.x;
    float _210 = in.m_63.y;
    float _212 = in.m_63.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_65.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _166 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = 1.0 / _268;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _284;
    bool _288 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _290 = isnan(_260);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = 1.0 / _276;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _260 + _302;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _308 = 1.0 / _272;
    float _310 = _304 * _282;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = _260 + _312;
    float _316 = 1.0 / _280;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _260 + _318;
    float _322 = _314 * _300;
    bool _324 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _326 = isnan(_260);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    bool _336 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_260);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _286;
    float _350 = _264 * _308;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _354 = _260 + _352;
    bool _356 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_260);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _320 * _316;
    float _370 = -_298;
    float _372 = _370 + 1.0;
    float _374 = -_334;
    float _376 = _374 + 1.0;
    float _378 = -_366;
    float _380 = _378 + 1.0;
    float _382 = _334 * _372;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = _354 * _348;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _394;
    float _398 = fma(_386, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_390, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = _346 * _380;
    float _404 = fma(_396, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _406 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _408 = isnan(_260);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -_346;
    float _420 = _418 + 1.0;
    float _422 = _366 * _376;
    bool _424 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _426 = isnan(_260);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = _416 * _420;
    float _442 = -_416;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = fma(_438, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = _434 * _444;
    float _454 = -_434;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = fma(_448, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = _398 * _452;
    float _466 = _400 * _452;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _468;
    float _472 = _404 * _452;
    float _474 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _464);
    float _476 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _478 = fma(_470, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _480 = fma(_460, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _482 = fma(_450, _440, _474);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _472);
    float _494 = fma(_462, _440, _476);
    float _496 = fma(_478, _402, _482);
    float _498 = fma(_486, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _504 = fma(_490, _322, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_480, _440, _492);
    float _516 = fma(_498, _402, _494);
    float _518 = fma(_502, _368, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _520 = fma(_508, _368, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _522 = fma(_512, _368, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _524 = fma(_504, _402, _514);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _534;
    float _538 = fma(_518, _422, _496);
    float _540 = fma(_528, _392, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _542 = fma(_532, _392, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _544 = fma(_536, _392, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _546 = fma(_520, _422, _516);
    float _548 = fma(_522, _422, _524);
    float _550 = fma(_540, _382, _538);
    float _552 = fma(_542, _382, _546);
    float _554 = fma(_544, _382, _548);
    float _556 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[148].x, _550);
    float _558 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[148].y, _552);
    float _560 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[148].z, _554);
    bool _562 = !_306;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _582;
    if (!_562)
    {
        float _566 = in.m_65.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[11].x, _166);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_132);
        float _588 = 1.0 / _586;
        float _590 = _166 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = in.m_67.x;
    float _596 = in.m_67.y;
    float _598 = in.m_67.z;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _602 = _592 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _604;
    bool _608 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _610 = 1.0 / _606;
    float _612 = _560 * _598;
    bool _614 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _616 = isnan(_592);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _602 * _610;
    float _628 = _558 * _596;
    bool _630 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _632 = isnan(_592);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -_624;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _654;
    float _658 = _640 * _644;
    float _660 = fma(_648, _626, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _662 = fma(_652, _626, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _664 = fma(_656, _626, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _666 = -_640;
    float _668 = _666 + 1.0;
    float _670 = _660 * _658;
    float _672 = _662 * _658;
    float _674 = _664 * _658;
    float _676 = _556 * _594;
    float _678 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[107].y, _670);
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[107].x, _672);
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[107].z, _674);
    float _684 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[108].y, _678);
    float _686 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[108].x, _680);
    float _688 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[108].z, _682);
    bool _690 = !_608;
    float _708;
    if (!_690)
    {
        float _692 = in.m_65.x;
        float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _696 = _692 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _700 = _698 * _694;
        float _702 = floor(_700);
        float _704 = -_702;
        float _706 = _700 + _704;
        _708 = _706;
        _710 = true;
    }
    else
    {
        float _712 = float(_132);
        float _714 = 1.0 / _712;
        float _716 = _166 * _714;
        _708 = _716;
    }
    _710 = false;
    float _718 = _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _722 = _718 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _728 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _730 = isnan(_718);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _748 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _750 = isnan(_718);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = 1.0 / _726;
    float _762 = -_738;
    float _764 = _762 + 1.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _766;
    bool _770 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _772 = isnan(_718);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _758 * _764;
    float _784 = -_758;
    float _786 = _784 + 1.0;
    bool _788 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _790 = 1.0 / _742;
    float _792 = _780 * _786;
    float _794 = -_780;
    float _796 = _794 + 1.0;
    float _798 = 1.0 / _746;
    float _800 = _768 * _760;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _806 = fma(_800, _722, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _808 = _804 * _790;
    bool _810 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _812 = isnan(_718);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _828 = _718 + _826;
    float _830 = _806 * _792;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _834 = _718 + _832;
    float _836 = -_820;
    float _838 = _836 + 1.0;
    float _840 = fma(_808, _828, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _842 = _824 * _798;
    float _844 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[115].x, _830);
    float _846 = _738 * _838;
    float _848 = _686 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _850 = fma(_842, _834, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _852 = fma(_840, _782, _844);
    float _854 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _856 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = fma(_850, _846, _852);
    float _860 = _684 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _862 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[118].x, _858);
    float _866 = _860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _856;
    out.m_69.y = _866;
    out.m_69.z = _862;
    out.m_69.w = _868;
    bool _870 = !_788;
    float _888;
    if (!_870)
    {
        float _872 = in.m_65.x;
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _876 = _872 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _880 = _878 * _874;
        float _882 = floor(_880);
        float _884 = -_882;
        float _886 = _880 + _884;
        _888 = _886;
        _890 = true;
    }
    else
    {
        float _892 = float(_132);
        float _894 = 1.0 / _892;
        float _896 = _166 * _894;
        _888 = _896;
    }
    _890 = false;
    float _898 = _888;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _898 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _908 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _910 = isnan(_898);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _928 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _930 = isnan(_898);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = 1.0 / _906;
    float _942 = -_918;
    float _944 = _942 + 1.0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _946;
    bool _950 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _952 = isnan(_898);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = _938 * _944;
    float _964 = -_938;
    float _966 = _964 + 1.0;
    bool _968 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _970 = 1.0 / _922;
    float _972 = _960 * _966;
    float _974 = -_960;
    float _976 = _974 + 1.0;
    float _978 = 1.0 / _926;
    float _980 = _948 * _940;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _986 = fma(_980, _902, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _988 = _984 * _970;
    bool _990 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _992 = isnan(_898);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1008 = _898 + _1006;
    float _1010 = _986 * _972;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1014 = _898 + _1012;
    float _1016 = -_1000;
    float _1018 = _1016 + 1.0;
    float _1020 = fma(_988, _1008, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1022 = _1004 * _978;
    float _1024 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1010);
    float _1026 = _918 * _1018;
    float _1028 = fma(_1022, _1014, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1030 = fma(_1020, _962, _1024);
    float _1032 = fma(_1028, _1026, _1030);
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1040 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1032);
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _1042;
    out.m_71.y = _1044;
    out.m_71.z = _1046;
    out.m_71.w = _1048;
    bool _1050 = !_968;
    float _1068;
    if (!_1050)
    {
        float _1052 = in.m_65.x;
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1056 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _1060 = _1058 * _1054;
        float _1062 = floor(_1060);
        float _1064 = -_1062;
        float _1066 = _1060 + _1064;
        _1068 = _1066;
        _1070 = true;
    }
    else
    {
        float _1072 = float(_132);
        float _1074 = 1.0 / _1072;
        float _1076 = _166 * _1074;
        _1068 = _1076;
    }
    _1070 = false;
    float _1078 = _1068;
    float _1080 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1082 = int(_1080);
    float _1084 = in.m_65.y;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1088 = _1086 != 0;
    float _1090 = in.m_73.x;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1094 = _1092 != 0;
    float _1096 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1098 = int(_1096);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1106 = _1104 != 0;
    float _1108 = 0.0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _1112 = _1102;
    bool _1114 = _1106;
    if (_1088)
    {
        _1108 = 1.0;
    }
    float _1116 = _1108;
    float _1118 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1120 = int(_1118);
    float _1122 = float(_1082);
    float _1124 = 0.0;
    float _1126 = _1116;
    if (_1088)
    {
        _1124 = 1.0;
    }
    float _1128 = _1124;
    float _1130 = 0.0;
    float _1132 = _1128;
    if (_1088)
    {
        _1130 = 1.0;
    }
    float _1134 = _1130;
    int _1136 = 0;
    float _1138 = _1134;
    if (_1088)
    {
        _1136 = 0;
    }
    int _1140 = _1136;
    float _1142 = _1048;
    int _1144 = _1140;
    if (_1088)
    {
        float _1146 = in.m_65.z;
        _1142 = _1146;
    }
    float _1148 = _1142;
    float _1150 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1152 = int(_1150);
    float _1154 = float(_1098);
    if (_1088)
    {
        _1110 = 0;
    }
    int _1156 = _1110;
    bool _1158 = _1084 > 0.5;
    float _1160 = 0.0;
    int _1162 = _1156;
    float _1164 = _1090;
    if (!_1106)
    {
        _1160 = _1090;
    }
    float _1166 = _1160;
    float _1168 = _1166;
    if (_1102)
    {
        float _1170 = -_1090;
        float _1172 = _1170 + 1.0;
        _564 = as_type<int>(_1172);
    }
    int _1174 = _564;
    float _1176 = 0.0;
    if (!_1102)
    {
        _1176 = _1090;
    }
    float _1178 = _1176;
    float _1180 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1182 = int(_1180);
    float _1184 = float(_1120);
    float _1186 = _1178;
    if (_1102)
    {
        float _1188 = _1158 ? as_type<float>(_1174) : _1090;
        _1186 = _1188;
    }
    float _1190 = _1186;
    int _1192 = 0;
    if (_1088)
    {
        _1192 = as_type<int>(_1084);
    }
    int _1194 = _1192;
    float _1196 = 1.0 / _1122;
    int _1198 = 0;
    float _1200 = _1148;
    int _1202 = _1194;
    if (_1088)
    {
        _1198 = as_type<int>(_1148);
    }
    int _1204 = _1198;
    float _1206 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1208 = int(_1206);
    float _1210 = float(_1152);
    float _1212 = float(uint(_1182));
    float _1214 = 1.0 / _1154;
    float _1216 = _1196 * _166;
    float _1218 = 1.0 / _1184;
    float _1220 = float(uint(_1208));
    float _1222 = 1.0 / _1210;
    float _1224 = _1214 * _166;
    float _1226 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1228 = int(_1226);
    float _1230 = _1218 * _166;
    float _1232 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1234 = int(_1232);
    float _1236 = _1222 * _166;
    float _1238 = 1.0 / _1212;
    float _1240 = float(uint(_1228));
    float _1242 = trunc(_1216);
    int _1244 = int(_1242);
    float _1246 = float(uint(_1234));
    float _1248 = 1.0 / _1220;
    int _1250 = as_type<int>(_1238) + (-2);
    float _1252 = 1.0 / _1246;
    float _1254 = float(uint(_1244));
    float _1256 = as_type<float>(_1250) * _1254;
    float _1258 = trunc(_1230);
    int _1260 = int(_1258);
    int _1262 = as_type<int>(_1248) + (-2);
    float _1264 = _1248;
    int _1266 = _1204;
    if (_1088)
    {
        float _1268 = in.m_65.x;
        _1264 = _1268;
    }
    float _1270 = _1264;
    float _1272 = trunc(_1236);
    int _1274 = int(_1272);
    int _1276 = as_type<int>(_1252) + (-2);
    float _1278 = 1.0 / _1240;
    float _1280 = float(uint(_1260));
    float _1282 = as_type<float>(_1262) * _1280;
    float _1284 = trunc(_1224);
    int _1286 = int(_1284);
    float _1288 = trunc(_1256);
    float _1290 = precise::max(_1288, 0.0);
    uint _1293 = uint(_1290);
    int _1295 = as_type<int>(_1278) + (-2);
    float _1297 = float(uint(_1286));
    float _1299 = trunc(_1282);
    float _1301 = precise::max(_1299, 0.0);
    uint _1303 = uint(_1301);
    float _1305 = float(uint(_1274));
    float _1307 = as_type<float>(_1295) * _1297;
    float _1309 = _1297;
    int _1311 = as_type<int>(_1307);
    float _1313 = _1305;
    if (!_1094)
    {
        _1309 = _1090;
    }
    float _1315 = _1309;
    float _1317 = as_type<float>(_1276) * _1305;
    float _1319 = trunc(_1307);
    float _1321 = precise::max(_1319, 0.0);
    uint _1323 = uint(_1321);
    float _1325 = trunc(_1317);
    float _1327 = precise::max(_1325, 0.0);
    uint _1329 = uint(_1327);
    float _1331 = _1315;
    if (_1106)
    {
        float _1333 = -_1090;
        float _1335 = _1333 + 1.0;
        _1311 = as_type<int>(_1335);
    }
    int _1337 = _1311;
    float _1339 = as_type<float>(_1337);
    if (_1106)
    {
        float _1341 = _1158 ? as_type<float>(_1337) : _1090;
        _1168 = _1341;
    }
    float _1343 = _1168;
    float _1345 = _1270;
    if (_1088)
    {
        _1339 = _1270;
    }
    float _1347 = _1339;
    float _1349 = _1347;
    if (_1088)
    {
        _1313 = _1347;
    }
    float _1351 = _1313;
    int _1353 = 0;
    float _1355 = _1351;
    if (_1088)
    {
        _1353 = as_type<int>(_1347);
    }
    int _1357 = _1353;
    int _1359 = _1357;
    if (!_1088)
    {
        float _1361 = in.m_65.x;
        float _1363 = _1084 * 3.1415927410125732421875;
        float _1365 = in.m_65.z;
        float _1367 = _1363 * 0.15915493667125701904296875;
        float _1369 = _1367 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1361 * 3.1415927410125732421875;
        float _1375 = _1373 * 0.15915493667125701904296875;
        float _1377 = _1365 * 3.1415927410125732421875;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = _1375 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = sin(_1385);
        _1355 = _1365;
        _1138 = 5.839270114898681640625;
        _1349 = _1084;
        _1132 = 1.2345600128173828125;
        _1345 = _1361;
        _1126 = 7.345489978790283203125;
        _1144 = 1;
        _1200 = _1365;
        _1162 = 2;
        _1202 = as_type<int>(_1371);
        _1359 = as_type<int>(_1383);
        _1266 = as_type<int>(_1387);
    }
    float _1389 = _1355;
    float _1391 = _1138;
    float _1393 = _1349;
    float _1395 = _1132;
    float _1397 = _1345;
    float _1399 = _1126;
    int _1401 = _1144;
    float _1403 = _1200;
    int _1405 = _1162;
    int _1407 = _1202;
    int _1409 = _1359;
    int _1411 = _1266;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    float _1417 = _1389 * _1391;
    int _1419 = ~_1182;
    int _1421 = _1419 + 1;
    float _1423 = 0.0;
    if (_1094)
    {
        float _1425 = in.m_65.x;
        _1423 = _1425;
    }
    float _1427 = _1423;
    float _1429 = _1393 * _1395;
    int _1431 = ~_1228;
    int _1433 = _1431 + 1;
    float _1435 = _1397 * _1399;
    int _1437 = _1421 * int(_1293);
    int _1439 = _1437 + _1244;
    float _1441 = floor(_1429);
    int _1443 = ~_1208;
    int _1445 = _1443 + 1;
    int _1447 = _1433 * int(_1323);
    int _1449 = _1447 + _1286;
    float _1451 = _1393 * _1399;
    float _1453 = float(uint(_1439));
    int _1455 = as_type<int>(_1389);
    if (_1415)
    {
        float _1457 = in.m_65.z;
        _1455 = as_type<int>(_1457);
    }
    int _1459 = _1455;
    int _1461 = ~_1234;
    int _1463 = _1461 + 1;
    int _1465 = 0;
    if (_1415)
    {
        float _1467 = -_1090;
        float _1469 = _1467 + 1.0;
        _1465 = as_type<int>(_1469);
    }
    int _1471 = _1465;
    float _1473 = float(uint(_1449));
    float _1475 = as_type<float>(_1250) * _1453;
    int _1477 = _1445 * int(_1303);
    int _1479 = _1477 + _1260;
    float _1481 = floor(_1435);
    int _1483 = _1463 * int(_1329);
    int _1485 = _1483 + _1274;
    float _1487 = as_type<float>(_1295) * _1473;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1491 = _1489 != 0;
    float _1493 = in.m_73.y;
    float _1495 = float(uint(_1479));
    bool _1497 = _1401 != 1;
    float _1499 = float(uint(_1485));
    float _1501 = trunc(_1475);
    float _1503 = precise::max(_1501, 0.0);
    uint _1505 = uint(_1503);
    float _1507 = _1475;
    float _1509 = _1495;
    if (_1094)
    {
        bool _1511 = _1427 > 0.5;
        _1112 = _1511;
    }
    bool _1513 = _1112;
    float _1515 = as_type<float>(_1262) * _1495;
    float _1517 = as_type<float>(_1276) * _1499;
    float _1519 = in.m_61.w;
    bool _1521 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1523 = isnan(_1078);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1529 = _1525 || _1527;
    float _1531 = float(_1529);
    float _1533 = trunc(_1487);
    float _1535 = precise::max(_1533, 0.0);
    uint _1537 = uint(_1535);
    float _1539 = -_1481;
    float _1541 = _1435 + _1539;
    int _1543 = _1459;
    if (_1415)
    {
        bool _1545 = as_type<float>(_1459) > 0.5;
        _1114 = _1545;
    }
    bool _1547 = _1114;
    if (_1094)
    {
        float _1549 = -_1090;
        float _1551 = _1549 + 1.0;
        _1543 = as_type<int>(_1551);
    }
    int _1553 = _1543;
    float _1555 = float(_1208);
    int _1557 = 0;
    if (_1491)
    {
        float _1559 = -_1090;
        float _1561 = _1559 + 1.0;
        _1557 = as_type<int>(_1561);
    }
    int _1563 = _1557;
    if (!_1415)
    {
        _1507 = _1090;
    }
    float _1565 = _1507;
    float _1567 = in.m_59.w;
    float _1569 = _1565;
    if (_1094)
    {
        float _1571 = _1513 ? as_type<float>(_1553) : _1090;
        _1331 = _1571;
    }
    float _1573 = _1331;
    float _1575 = -_1441;
    float _1577 = _1429 + _1575;
    float _1579 = float(_132);
    float _1581 = floor(_1417);
    int _1583 = int(_1293) + int(_1505);
    float _1585 = in.m_63.w;
    float _1587 = float(_1182);
    float _1589 = float(_1244);
    float _1591 = float(_1228);
    float _1593 = floor(_1451);
    bool _1595 = _1589 >= _1587;
    bool _1597 = isnan(_1589);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan(_1587);
    bool _1603 = _1599 || _1601;
    float _1605 = float(_1603);
    if (_1415)
    {
        float _1607 = _1547 ? as_type<float>(_1471) : _1090;
        _1569 = _1607;
    }
    float _1609 = _1569;
    int _1611 = ~_1208;
    int _1613 = _1611 + 1;
    if (!_1491)
    {
        _1509 = _1090;
    }
    float _1615 = _1509;
    float _1617 = trunc(_1515);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    float _1623 = -_1581;
    float _1625 = _1417 + _1623;
    float _1627 = float(_1260);
    float _1629 = _1591 * _1577;
    float _1631 = float(_1274);
    float _1633 = _1555 * _1625;
    bool _1635 = _1627 >= _1555;
    bool _1637 = isnan(_1627);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan(_1555);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = 1.0 / _1579;
    float _1649 = -_1593;
    float _1651 = _1451 + _1649;
    int _1653 = int(_1323) + int(_1537);
    float _1655 = float(_1234);
    int _1657 = ~_1228;
    int _1659 = _1657 + 1;
    float _1661 = trunc(_1517);
    float _1663 = precise::max(_1661, 0.0);
    uint _1665 = uint(_1663);
    float _1667 = _1541 * _1587;
    float _1669 = _1587 * _166;
    float _1671 = float(_1286);
    int _1673 = _1659 * _1653;
    int _1675 = _1673 + _1286;
    bool _1677 = _1631 >= _1655;
    bool _1679 = isnan(_1631);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan(_1655);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    bool _1689 = _1671 >= _1591;
    bool _1691 = isnan(_1671);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan(_1591);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1669 * _1647;
    int _1703 = int(_1303) + int(_1621);
    float _1705 = _1647 * _166;
    int _1707 = ~_1182;
    int _1709 = _1707 + 1;
    float _1711 = trunc(_1605);
    int _1713 = int(_1711);
    bool _1715 = uint(_1675) >= uint(_1228);
    float _1717 = _1591 * _1705;
    float _1719 = _1555 * _1705;
    float _1721 = _1655 * _1705;
    int _1723 = _1709 * _1583;
    int _1725 = _1723 + _1244;
    float _1727 = _1655 * _1651;
    int _1729 = _1613 * _1703;
    int _1731 = _1729 + _1260;
    float _1733 = trunc(_1629);
    int _1735 = int(_1733);
    int _1737 = int(_1329) + int(_1665);
    bool _1739 = uint(_1725) >= uint(_1182);
    bool _1741 = uint(_1731) >= uint(_1208);
    bool _1743 = !_1739;
    int _1745 = _1743 ? 0 : (-1);
    float _1747 = trunc(_1667);
    int _1749 = int(_1747);
    int _1751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1753 = _1751 != 0;
    int _1755 = ~_1583;
    int _1757 = _1755 + _1745;
    int _1759 = _1757 + 1;
    bool _1761 = !_1753;
    int _1763 = _1761 ? 0 : 1;
    int _1765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1767 = _1765 != 0;
    float _1769 = trunc(_1699);
    int _1771 = int(_1769);
    int _1773 = ~_1234;
    int _1775 = _1773 + 1;
    bool _1777 = !_1715;
    int _1779 = _1777 ? 0 : (-1);
    int _1781 = abs(_1763);
    int _1783 = _1775 * _1737;
    int _1785 = _1783 + _1274;
    int _1787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1789 = _1787 != 0;
    float _1791 = trunc(_1633);
    int _1793 = int(_1791);
    bool _1795 = !_1767;
    int _1797 = _1795 ? 0 : 1;
    int _1799 = _1749 * _1781;
    int _1801 = _1799 + _1244;
    int _1803 = ~_1653;
    int _1805 = _1803 + _1779;
    int _1807 = _1805 + 1;
    bool _1809 = !_1789;
    int _1811 = _1809 ? 0 : 1;
    int _1813 = abs(_1797);
    int _1815 = _1182 * _1759;
    int _1817 = _1815 + _1244;
    float _1819 = _1615;
    float _1821 = as_type<float>(_1801);
    if (_1491)
    {
        float _1823 = _1158 ? as_type<float>(_1563) : _1090;
        _1819 = _1823;
    }
    float _1825 = _1819;
    float _1827 = trunc(_1645);
    int _1829 = int(_1827);
    bool _1831 = _1182 == 0;
    int _1833 = _1735 * _1813;
    int _1835 = _1833 + _1286;
    int _1837 = abs(_1811);
    int _1839 = _1228 * _1807;
    int _1841 = _1839 + _1286;
    bool _1843 = uint(_1785) >= uint(_1234);
    bool _1845 = !_1741;
    int _1847 = _1845 ? 0 : (-1);
    float _1849 = trunc(_1701);
    int _1851 = int(_1849);
    int _1853 = ~_1713;
    int _1855 = _1853 + 1;
    int _1857 = _1855 + 1;
    bool _1859 = !_1831;
    int _1861 = _1859 ? _1817 : (-1);
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1865 = _1863 != 0;
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1869 = _1867 != 0;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1873 = _1871 != 0;
    int _1875 = _1861 * _1857;
    int _1877 = ~_1703;
    int _1879 = _1877 + _1847;
    int _1881 = _1879 + 1;
    int _1883 = _1793 * _1837;
    int _1885 = _1883 + _1260;
    bool _1887 = !_1843;
    int _1889 = _1887 ? 0 : (-1);
    float _1891 = trunc(_1687);
    int _1893 = int(_1891);
    int _1895 = _1182 + (-1);
    int _1897 = _1208 * _1881;
    int _1899 = _1897 + _1260;
    bool _1901 = !_1869;
    int _1903 = _1901 ? 0 : 1;
    bool _1905 = _1228 == 0;
    int _1907 = _1713 * _1895;
    int _1909 = _1907 + _1875;
    bool _1911 = !_1865;
    int _1913 = _1911 ? 0 : 1;
    float _1915 = trunc(_1717);
    int _1917 = int(_1915);
    int _1919 = ~_1737;
    int _1921 = _1919 + _1889;
    int _1923 = _1921 + 1;
    bool _1925 = _1208 == 0;
    int _1927 = abs(_1903);
    int _1929 = ~_1771;
    int _1931 = _1929 + 1;
    int _1933 = _1931 + 1;
    bool _1935 = !_1905;
    int _1937 = _1935 ? _1841 : (-1);
    int _1939 = _1909 * _1927;
    int _1941 = abs(_1913);
    int _1943 = _1234 * _1923;
    int _1945 = _1943 + _1274;
    int _1947 = ~_1829;
    int _1949 = _1947 + 1;
    int _1951 = _1949 + 1;
    int _1953 = _1933 * _1937;
    bool _1955 = !_1925;
    int _1957 = _1955 ? _1899 : (-1);
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1961 = _1959 != 0;
    int _1963 = _1951 * _1957;
    bool _1965 = !_1873;
    int _1967 = _1965 ? 0 : 1;
    int _1969 = _1851 * _1941;
    int _1971 = _1969 + _1939;
    bool _1973 = !_1961;
    int _1975 = _1973 ? 0 : 1;
    bool _1977 = _1234 == 0;
    int _1979 = abs(_1967);
    int _1981 = abs(_1975);
    int _1983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1985 = _1983 != 0;
    int _1987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1989 = _1987 != 0;
    int _1991 = _1801 * _1979;
    int _1993 = _1991 + _1971;
    int _1995 = ~_1893;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    bool _2001 = !_1977;
    int _2003 = _2001 ? _1945 : (-1);
    int _2005 = _1749 * _1981;
    int _2007 = _2005 + _1993;
    int _2009 = _1228 + (-1);
    bool _2011 = !_1989;
    int _2013 = _2011 ? 0 : 1;
    int _2015 = _1999 * _2003;
    float _2017 = float(uint(_2007));
    int _2019 = _1771 * _2009;
    int _2021 = _2019 + _1953;
    int _2023 = abs(_2013);
    bool _2025 = !_1985;
    int _2027 = _2025 ? 0 : 1;
    float _2029 = as_type<float>(_1250) * _2017;
    int _2031 = _1208 + (-1);
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2035 = _2033 != 0;
    int _2037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2039 = _2037 != 0;
    float _2041 = trunc(_2029);
    float _2043 = precise::max(_2041, 0.0);
    uint _2045 = uint(_2043);
    int _2047 = abs(_2027);
    int _2049 = _1829 * _2031;
    int _2051 = _2049 + _1963;
    int _2053 = _2021 * _2023;
    bool _2055 = !_2035;
    int _2057 = _2055 ? 0 : 1;
    float _2059 = trunc(_1719);
    int _2061 = int(_2059);
    int _2063 = abs(_2057);
    float _2065 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2067 = _2065 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2069 = _1234 + (-1);
    int _2071 = _1917 * _2047;
    int _2073 = _2071 + _2053;
    int _2075 = ~_1182;
    int _2077 = _2075 + 1;
    int _2079 = _1893 * _2069;
    int _2081 = _2079 + _2015;
    bool _2083 = !_2039;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _1835 * _2063;
    int _2089 = _2087 + _2073;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2093 = _2091 != 0;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2097 = _2095 != 0;
    float _2099 = 1.0 / _2067;
    int _2101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2103 = _2101 != 0;
    int _2105 = abs(_2085);
    int _2107 = _2077 * int(_2045);
    int _2109 = _2107 + _2007;
    bool _2111 = !_2103;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = trunc(_1727);
    int _2117 = int(_2115);
    int _2119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2121 = _2119 != 0;
    bool _2123 = !_2097;
    int _2125 = _2123 ? 0 : 1;
    bool _2127 = !_2121;
    int _2129 = _2127 ? 0 : 1;
    float _2131 = float(uint(_2109));
    int _2133 = _1735 * _2105;
    int _2135 = _2133 + _2089;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2139 = _2137 != 0;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2143 = _2141 != 0;
    int _2145 = abs(_2125);
    float _2147 = as_type<float>(_1250) * _2131;
    bool _2149 = !_2093;
    int _2151 = _2149 ? 0 : 1;
    bool _2153 = !_2143;
    int _2155 = _2153 ? 0 : 1;
    int _2157 = _2051 * _2145;
    float _2159 = float(uint(_2135));
    float _2161 = trunc(_2147);
    float _2163 = precise::max(_2161, 0.0);
    uint _2165 = uint(_2163);
    int _2167 = abs(_2151);
    int _2169 = abs(_2155);
    float _2171 = as_type<float>(_1295) * _2159;
    int _2173 = abs(_2113);
    int _2175 = _2061 * _2167;
    int _2177 = _2175 + _2157;
    int _2179 = abs(_2129);
    float _2181 = trunc(_2171);
    float _2183 = precise::max(_2181, 0.0);
    uint _2185 = uint(_2183);
    int _2187 = _2081 * _2169;
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2191 = _2189 != 0;
    int _2193 = _2117 * _2179;
    int _2195 = _2193 + _1274;
    int _2197 = ~_1228;
    int _2199 = _2197 + 1;
    int _2201 = _1885 * _2173;
    int _2203 = _2201 + _2177;
    bool _2205 = !_2191;
    int _2207 = _2205 ? 0 : 1;
    float _2209 = trunc(_1721);
    int _2211 = int(_2209);
    bool _2213 = !_2139;
    int _2215 = _2213 ? 0 : 1;
    float _2217 = -_1493;
    float _2219 = _2217 + 1.0;
    int _2221 = abs(_2207);
    int _2223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2225 = _2223 != 0;
    int _2227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2229 = _2227 != 0;
    int _2231 = int(_2045) + int(_2165);
    int _2233 = _2199 * int(_2185);
    int _2235 = _2233 + _2135;
    int _2237 = abs(_2215);
    int _2239 = ~_1182;
    int _2241 = _2239 + 1;
    float _2243 = float(uint(_2235));
    int _2245 = _1793 * _2221;
    int _2247 = _2245 + _2203;
    bool _2249 = !_2225;
    int _2251 = _2249 ? 0 : 1;
    int _2253 = _2211 * _2237;
    int _2255 = _2253 + _2187;
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2259 = _2257 != 0;
    int _2261 = _2241 * _2231;
    int _2263 = _2261 + _2007;
    int _2265 = abs(_2251);
    float _2267 = as_type<float>(_1295) * _2243;
    float _2269 = float(uint(_2247));
    bool _2271 = uint(_2263) >= uint(_1182);
    float _2273 = trunc(_2267);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    bool _2279 = !_2229;
    int _2281 = _2279 ? 0 : 1;
    float _2283 = as_type<float>(_1262) * _2269;
    bool _2285 = !_2271;
    int _2287 = _2285 ? 0 : (-1);
    int _2289 = abs(_2281);
    float _2291 = trunc(_2283);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _2281;
    if (_2259)
    {
        float _2299 = -_1090;
        float _2301 = _2299 + 1.0;
        _2297 = as_type<int>(_2301);
    }
    int _2303 = _2297;
    int _2305 = _2195 * _2265;
    int _2307 = _2305 + _2255;
    bool _2309 = _1084 > 0.5;
    int _2311 = ~_2231;
    int _2313 = _2311 + _2287;
    int _2315 = _2313 + 1;
    int _2317 = _2117 * _2289;
    int _2319 = _2317 + _2307;
    if (_2259)
    {
        float _2321 = _2309 ? as_type<float>(_2303) : _1090;
        _1164 = _2321;
    }
    float _2323 = _1164;
    bool _2325 = _1182 == 0;
    int _2327 = _1182 * _2315;
    int _2329 = _2327 + _2007;
    float _2331 = float(uint(_2319));
    float _2333 = in.m_65.w;
    int _2335 = ~_1208;
    int _2337 = _2335 + 1;
    bool _2339 = !_2325;
    int _2341 = _2339 ? _2329 : (-1);
    float _2343 = as_type<float>(_1276) * _2331;
    int _2345 = int(_2185) + int(_2277);
    int _2347 = _2337 * int(_2295);
    int _2349 = _2347 + _2247;
    int _2351 = _2341 & 3;
    bool _2353 = _2351 != 0;
    float _2355 = trunc(_2343);
    float _2357 = precise::max(_2355, 0.0);
    uint _2359 = uint(_2357);
    int _2361 = ~_1228;
    int _2363 = _2361 + 1;
    bool _2365 = uint(_2351) > 1u;
    float _2367 = float(uint(_2349));
    int _2369 = _2363 * _2345;
    int _2371 = _2369 + _2135;
    int _2373 = _2341 & 3;
    bool _2375 = _2373 != 0;
    int _2377 = ~_1234;
    int _2379 = _2377 + 1;
    float _2381 = as_type<float>(_1262) * _2367;
    int _2383 = _2375 ? 0 : 1;
    bool _2385 = uint(_2371) >= uint(_1228);
    int _2387 = ~_2383;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    float _2393 = trunc(_2381);
    float _2395 = precise::max(_2393, 0.0);
    uint _2397 = uint(_2395);
    int _2399 = _2391;
    if (!_2365)
    {
        int _2401 = ~_2383;
        int _2403 = _2401 + 1;
        _2399 = _2403;
    }
    int _2405 = _2399;
    int _2407 = _2379 * int(_2359);
    int _2409 = _2407 + _2319;
    bool _2411 = !_2385;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = _2351 != 3;
    bool _2417 = uint(_2351) >= 2u;
    int _2419 = ~_2345;
    int _2421 = _2419 + _2413;
    int _2423 = _2421 + 1;
    int _2425 = _2417 ? 0 : 1;
    float _2427 = float(uint(_2409));
    int _2429 = _1228 * _2423;
    int _2431 = _2429 + _2135;
    int _2433 = _2309 ? as_type<int>(_2219) : as_type<int>(_1493);
    bool _2435 = _2333 > 0.5;
    float _2437 = as_type<float>(_1276) * _2427;
    int _2439 = ~_1208;
    int _2441 = _2439 + 1;
    bool _2443 = _1228 == 0;
    float _2445 = trunc(_2437);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    int _2451 = ~_2425;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = _2455;
    if (_2415)
    {
        int _2459 = ~_2425;
        int _2461 = _2459 + 1;
        _2457 = _2461;
    }
    int _2463 = _2457;
    int _2465 = int(_2295) + int(_2397);
    bool _2467 = !_2443;
    int _2469 = _2467 ? _2431 : (-1);
    int _2471 = _2435 ? as_type<int>(_2219) : as_type<int>(_1493);
    int _2473 = _2441 * _2465;
    int _2475 = _2473 + _2247;
    int _2477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2479 = _2477 != 0;
    int _2481 = _2469 & 3;
    bool _2483 = _2481 != 0;
    bool _2485 = !_2479;
    int _2487 = _2485 ? 0 : 1;
    bool _2489 = uint(_2481) >= 2u;
    int _2491 = _2483 ? 0 : 1;
    bool _2493 = uint(_2475) >= uint(_1208);
    int _2495 = _2489 ? 0 : 1;
    bool _2497 = _2481 != 3;
    bool _2499 = !_2493;
    int _2501 = _2499 ? 0 : (-1);
    int _2503 = ~_1234;
    int _2505 = _2503 + 1;
    bool _2507 = uint(_2481) > 1u;
    int _2509 = ~_2465;
    int _2511 = _2509 + _2501;
    int _2513 = _2511 + 1;
    int _2515 = int(_2359) + int(_2449);
    int _2517 = _1208 * _2513;
    int _2519 = _2517 + _2247;
    bool _2521 = _1208 == 0;
    int _2523 = ~_2495;
    int _2525 = _2523 + 1;
    int _2527 = _2525 + 1;
    int _2529 = _2505 * _2515;
    int _2531 = _2529 + _2319;
    int _2533 = _2527;
    if (_2497)
    {
        int _2535 = ~_2495;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    int _2541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2543 = _2541 != 0;
    int _2545 = ~_2491;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    bool _2551 = !_2521;
    int _2553 = _2551 ? _2519 : (-1);
    int _2555 = _2549;
    if (!_2507)
    {
        int _2557 = ~_2491;
        int _2559 = _2557 + 1;
        _2555 = _2559;
    }
    int _2561 = _2555;
    bool _2563 = uint(_2531) >= uint(_1234);
    bool _2565 = !_2543;
    int _2567 = _2565 ? 0 : 1;
    int _2569 = _2553 & 3;
    bool _2571 = _2569 != 0;
    bool _2573 = !_2563;
    int _2575 = _2573 ? 0 : (-1);
    int _2577 = _2571 ? 0 : 1;
    bool _2579 = uint(_2569) >= 2u;
    bool _2581 = _2569 != 3;
    int _2583 = ~_2515;
    int _2585 = _2583 + _2575;
    int _2587 = _2585 + 1;
    int _2589 = _2579 ? 0 : 1;
    bool _2591 = uint(_2569) > 1u;
    int _2593 = _1234 * _2587;
    int _2595 = _2593 + _2319;
    bool _2597 = _1234 == 0;
    int _2599 = ~_2589;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    bool _2605 = !_2597;
    int _2607 = _2605 ? _2595 : (-1);
    int _2609 = _2603;
    if (_2581)
    {
        int _2611 = ~_2589;
        int _2613 = _2611 + 1;
        _2609 = _2613;
    }
    int _2615 = _2609;
    int _2617 = _2607 & 3;
    bool _2619 = _2617 != 0;
    int _2621 = ~_2577;
    int _2623 = _2621 + 1;
    int _2625 = _2623 + 1;
    int _2627 = _2625;
    if (!_2591)
    {
        int _2629 = ~_2577;
        int _2631 = _2629 + 1;
        _2627 = _2631;
    }
    int _2633 = _2627;
    bool _2635 = uint(_2617) >= 2u;
    int _2637 = _2619 ? 0 : 1;
    int _2639 = _2635 ? 0 : 1;
    bool _2641 = _2617 != 3;
    bool _2643 = uint(_2617) > 1u;
    int _2645 = ~_2639;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = ~_2637;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    float _2657 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2659 = _2657 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2661 = _2649;
    int _2663 = _2655;
    if (_2641)
    {
        int _2665 = ~_2639;
        int _2667 = _2665 + 1;
        _2661 = _2667;
    }
    int _2669 = _2661;
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2673 = _2671 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    if (!_2643)
    {
        int _2675 = ~_2637;
        int _2677 = _2675 + 1;
        _2663 = _2677;
    }
    int _2679 = _2663;
    float _2681 = 1.0 / _2659;
    float _2683 = in.m_50.x;
    float _2685 = in.m_50.y;
    float _2687 = in.m_50.z;
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2691 = _2689 != 0;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2699 = _2697 != 0;
    bool _2701 = !_2691;
    int _2703 = _2701 ? 0 : 1;
    float _2705 = _2699 ? as_type<float>(_2433) : _1493;
    float _2707 = 1.0 / _2673;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2711 = _2709 != 0;
    bool _2713 = _1403 > 0.5;
    float _2715 = _2711 ? as_type<float>(_2471) : _1493;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2719 = _2717 != 0;
    float _2721 = 1.0 / _2695;
    int _2723 = _2713 ? as_type<int>(_2219) : as_type<int>(_1493);
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2727 = _2725 != 0;
    float _2729 = _2719 ? as_type<float>(_2723) : _1493;
    float _2731 = _2727 ? as_type<float>(_2723) : _1493;
    float _2733 = _198 * _2685;
    int _2735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2737 = _2735 != 0;
    int _2739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2741 = _2739 != 0;
    float _2743 = _204 * _2685;
    int _2745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2747 = _2745 != 0;
    float _2749 = _210 * _2685;
    float _2751 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2753 = fma(_196, _2683, _2733);
    float _2755 = fma(_208, _2683, _2749);
    float _2757 = fma(_202, _2683, _2743);
    float _2759 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2761 = _2759 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2763 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2765 = fma(_200, _2687, _2753);
    float _2767 = fma(_2751, -2.0, _2763);
    float _2769 = _1397 * 2.0;
    float _2771 = fma(_206, _2687, _2757);
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2775 = _2773 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2777 = floor(_2769);
    float _2779 = fma(_212, _2687, _2755);
    float _2781 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2781;
    float _2785 = _2737 ? as_type<float>(_2723) : _1493;
    float _2787 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2789 = _1078 + _2787;
    bool _2791 = !_2747;
    int _2793 = _2791 ? 0 : 1;
    float _2795 = _2783 * _2681;
    float _2797 = 1.0 / _2761;
    float _2799 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2801 = _2799 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2803 = _2741 ? as_type<float>(_2723) : _1493;
    float _2805 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2767);
    int _2807 = ~_1182;
    int _2809 = _2807 + 1;
    float _2811 = float(uint(_1835));
    float _2813 = 1.0 / _2775;
    float _2815 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2817 = _2815 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2819 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2821 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2819;
    bool _2823 = _2777 >= 0.0;
    bool _2825 = isnan(_2777);
    bool _2827 = _2823 || _2825;
    bool _2829 = isnan(0.0);
    bool _2831 = _2827 || _2829;
    float _2833 = as_type<float>(_1295) * _2811;
    float _2835 = _2817 * _2099;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2841 = 1.0 / _2801;
    float _2843 = _2821 * _2721;
    bool _2845 = _2777 > 0.0;
    float _2847 = _2839 * _2707;
    float _2849 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2851 = _2849 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2853 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2853;
    float _2857 = _1084 * 2.0;
    float _2859 = _2851 * _2813;
    float _2861 = _2855 * _2797;
    float _2863 = _2831 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2865 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2865;
    float _2869 = floor(_2857);
    float _2871 = fma(_2843, _2789, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2873 = ~as_type<int>(_2863);
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    float _2879 = _2867 * _2841;
    float _2881 = float(uint(_1801));
    bool _2883 = _1405 != 2;
    int _2885 = _2877;
    float _2887 = _2841;
    float _2889 = _2863;
    float _2891 = _2721;
    float _2893 = _2779;
    if (!_2845)
    {
        int _2895 = ~as_type<int>(_2863);
        int _2897 = _2895 + 1;
        _2885 = _2897;
    }
    int _2899 = _2885;
    float _2901 = trunc(_2833);
    float _2903 = precise::max(_2901, 0.0);
    uint _2905 = uint(_2903);
    bool _2907 = !_1497;
    float _2909 = _2907 ? as_type<float>(_1407) : as_type<float>(_1409);
    float _2911 = as_type<float>(_1250) * _2881;
    bool _2913 = !_1497;
    float _2915 = _2913 ? as_type<float>(_1411) : as_type<float>(_1407);
    float _2917 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2919 = _1078 + _2917;
    float _2921 = float(uint(_1885));
    if (!_1497)
    {
        _2887 = _1084;
    }
    float _2923 = _2887;
    float _2925 = trunc(_2911);
    float _2927 = precise::max(_2925, 0.0);
    uint _2929 = uint(_2927);
    float _2931 = 0.0;
    float _2933 = _2923;
    if (!_1497)
    {
        _2931 = _1084;
    }
    float _2935 = _2931;
    float _2937 = fma(_2835, _2919, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2939 = _2935;
    float _2941 = _2937;
    if (!_1497)
    {
        _2889 = _1403;
    }
    float _2943 = _2889;
    float _2945 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2947 = _1078 + _2945;
    float _2949 = _2943;
    if (!_1497)
    {
        _2891 = _1403;
    }
    float _2951 = _2891;
    float _2953 = _2951;
    if (_1497)
    {
        _2933 = _1397;
    }
    float _2955 = _2933;
    if (_1497)
    {
        _2939 = _1397;
    }
    float _2957 = _2939;
    if (_1497)
    {
        _2949 = _1084;
    }
    float _2959 = _2949;
    float _2961 = _2955 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1497)
    {
        _2953 = _1084;
    }
    float _2963 = _2953;
    bool _2965 = _2869 > 0.0;
    bool _2967 = _2869 >= 0.0;
    bool _2969 = isnan(_2869);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan(0.0);
    bool _2975 = _2971 || _2973;
    float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2979 = _1078 + _2977;
    int _2981 = ~_1228;
    int _2983 = _2981 + 1;
    float _2985 = fma(_2795, _2979, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2987 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2989 = _1078 + _2987;
    int _2991 = _2809 * int(_2929);
    int _2993 = _2991 + _1801;
    float _2995 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2997 = _1078 + _2995;
    float _2999 = fma(_2847, _2989, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3001 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3003 = _1078 + _3001;
    float _3005 = float(uint(_2993));
    float _3007 = fma(_2859, _2997, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _3009 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3011 = isnan(_1078);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3017 = _3013 || _3015;
    float _3019 = float(_3017);
    float _3021 = fma(_2861, _3003, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3023 = fma(_2879, _2947, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _3025 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3027 = isnan(_1078);
    bool _3029 = _3025 || _3027;
    bool _3031 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3033 = _3029 || _3031;
    float _3035 = float(_3033);
    float _3037 = as_type<float>(_1250) * _3005;
    bool _3039 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3041 = isnan(_1078);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3047 = _3043 || _3045;
    float _3049 = float(_3047);
    float _3051 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    bool _3053 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3055 = isnan(_1078);
    bool _3057 = _3053 || _3055;
    bool _3059 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3061 = _3057 || _3059;
    float _3063 = float(_3061);
    float _3065 = -_3035;
    float _3067 = _3065 + 1.0;
    bool _3069 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3071 = isnan(_1078);
    bool _3073 = _3069 || _3071;
    bool _3075 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3077 = _3073 || _3075;
    float _3079 = float(_3077);
    float _3081 = -_3049;
    float _3083 = _3081 + 1.0;
    bool _3085 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3087 = isnan(_1078);
    bool _3089 = _3085 || _3087;
    bool _3091 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3093 = _3089 || _3091;
    float _3095 = float(_3093);
    float _3097 = _3019 * _3067;
    float _3099 = -_3019;
    float _3101 = _3099 + 1.0;
    float _3103 = as_type<float>(_1262) * _2921;
    bool _3105 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3107 = isnan(_1078);
    bool _3109 = _3105 || _3107;
    bool _3111 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3113 = _3109 || _3111;
    float _3115 = float(_3113);
    float _3117 = trunc(_3037);
    float _3119 = precise::max(_3117, 0.0);
    uint _3121 = uint(_3119);
    float _3123 = _3049 * _3101;
    float _3125 = float(uint(_2195));
    float _3127 = fma(_2909, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3051);
    float _3129 = _3115 * _3083;
    float _3131 = -_3115;
    float _3133 = _3131 + 1.0;
    float _3135 = as_type<float>(_1276) * _3125;
    float _3137 = trunc(_3103);
    float _3139 = precise::max(_3137, 0.0);
    uint _3141 = uint(_3139);
    int _3143 = ~_1208;
    int _3145 = _3143 + 1;
    float _3147 = -_3095;
    float _3149 = _3147 + 1.0;
    int _3151 = _2983 * int(_2905);
    int _3153 = _3151 + _1835;
    float _3155 = _3095 * _3133;
    float _3157 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3159 = _1531 * _3149;
    float _3161 = -_1531;
    float _3163 = _3161 + 1.0;
    float _3165 = trunc(_3135);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    float _3171 = float(uint(_3153));
    float _3173 = _2909 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3175 = _3079 * _3163;
    float _3177 = -_3079;
    float _3179 = _3177 + 1.0;
    float _3181 = as_type<float>(_1295) * _3171;
    int _3183 = ~_1234;
    int _3185 = _3183 + 1;
    int _3187 = _3145 * int(_3141);
    int _3189 = _3187 + _1885;
    float _3191 = _3063 * _3179;
    float _3193 = -_3063;
    float _3195 = _3193 + 1.0;
    int _3197 = _2975 ? 0 : 1;
    float _3199 = trunc(_3181);
    float _3201 = precise::max(_3199, 0.0);
    uint _3203 = uint(_3201);
    float _3205 = float(uint(_3189));
    float _3207 = _2985 * _3191;
    float _3209 = _2771 + _1519;
    float _3211 = -_3157;
    float _3213 = fma(_3173, 2.0, _3211);
    float _3215 = as_type<float>(_1262) * _3205;
    float _3217 = fma(_3195, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3207);
    float _3219 = _2765 + _1567;
    int _3221 = ~_3197;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    float _3227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3229 = _3185 * int(_3169);
    int _3231 = _3229 + _2195;
    float _3233 = fma(_2937, _3175, _3217);
    int _3235 = _3225;
    float _3237 = _3219;
    if (!_2965)
    {
        int _3239 = ~_3197;
        int _3241 = _3239 + 1;
        _3235 = _3241;
    }
    int _3243 = _3235;
    float _3245 = _2779 + _1585;
    int _3247 = int(_2905) + int(_3203);
    float _3249 = fma(_2871, _3159, _3233);
    float _3251 = float(uint(_3231));
    float _3253 = trunc(_3215);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    int _3259 = ~_1182;
    int _3261 = _3259 + 1;
    float _3263 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3265 = _3209 + _3263;
    int _3267 = int(_2929) + int(_3121);
    float _3269 = as_type<float>(_1276) * _3251;
    int _3271 = ~_1228;
    int _3273 = _3271 + 1;
    float _3275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3277 = _3219 + _3275;
    int _3279 = ~_1208;
    int _3281 = _3279 + 1;
    float _3283 = trunc(_3269);
    float _3285 = precise::max(_3283, 0.0);
    uint _3287 = uint(_3285);
    int _3289 = _3261 * _3267;
    int _3291 = _3289 + _1801;
    float _3293 = fma(_2999, _3155, _3249);
    bool _3295 = !_2883;
    float _3297 = _3295 ? as_type<float>(_1411) : as_type<float>(_1409);
    float _3299 = _3227 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3301 = fma(_3021, _3129, _3293);
    bool _3303 = uint(_3291) >= uint(_1182);
    int _3305 = _3273 * _3247;
    int _3307 = _3305 + _1835;
    int _3309 = int(_3141) + int(_3257);
    float _3311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _3313 = fma(_3007, _3123, _3301);
    int _3315 = ~_1234;
    int _3317 = _3315 + 1;
    float _3319 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3321 = !_3303;
    int _3323 = _3321 ? 0 : (-1);
    int _3325 = _3281 * _3309;
    int _3327 = _3325 + _1885;
    int _3329 = int(_3169) + int(_3287);
    float _3331 = _3265 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3333 = uint(_3307) >= uint(_1228);
    float _3335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3337 = _3245 + _3335;
    float _3339 = _1084 + _1397;
    bool _3341 = !_3333;
    int _3343 = _3341 ? 0 : (-1);
    float _3345 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3127);
    bool _3347 = uint(_3327) >= uint(_1208);
    int _3349 = _3317 * _3329;
    int _3351 = _3349 + _2195;
    float _3353 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3331);
    int _3355 = ~_3267;
    int _3357 = _3355 + _3323;
    int _3359 = _3357 + 1;
    float _3361 = _3311 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    bool _3363 = !_3347;
    int _3365 = _3363 ? 0 : (-1);
    float _3367 = fma(_3337, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3353);
    bool _3369 = uint(_3351) >= uint(_1234);
    int _3371 = _1182 * _3359;
    int _3373 = _3371 + _1801;
    int _3375 = ~_3247;
    int _3377 = _3375 + _3343;
    int _3379 = _3377 + 1;
    float _3381 = fma(_3023, _3097, _3313);
    bool _3383 = !_3369;
    int _3385 = _3383 ? 0 : (-1);
    float _3387 = fma(_3299, _1190, -0.5);
    bool _3389 = _3367 >= 0.0;
    int _3391 = _1228 * _3379;
    int _3393 = _3391 + _1835;
    float _3395 = fma(_3361, _1343, -0.5);
    float _3397 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3399 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3401 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3403 = (*spvDescriptorSet0.vp_c9)._m0[103].z + (*spvDescriptorSet0.vp_c9)._m0[103].x;
    int _3405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].z);
    if (_3389)
    {
        _1821 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3407 = _1821;
    float _3409 = -_3399;
    float _3411 = fma(_3319, 2.0, _3409);
    float _3413 = fma(as_type<float>(_1409), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3401);
    if (_3389)
    {
        float _3415 = _3407 * 5.0;
        _3405 = as_type<int>(_3415);
    }
    int _3417 = _3405;
    float _3419 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _3421 = !_2883;
    float _3423 = _3421 ? as_type<float>(_1409) : as_type<float>(_1407);
    float _3425 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3427 = fma(as_type<float>(_1409), (*spvDescriptorSet0.vp_c9)._m0[103].z, _3403);
    if (_3389)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11730 = as_type<float>(_3417);
        out.gl_Position.z = _11730;
    }
    float _3429 = as_type<float>(_1409) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3431 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[103].w + (*spvDescriptorSet0.vp_c9)._m0[103].y;
    float _3435 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3437 = as_type<float>(_1407) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _3439 = !_2353;
    int _3441 = _3439 ? 0 : 1;
    float _3443 = fma(_2963, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3419);
    float _3445 = -_3425;
    float _3447 = fma(_3429, 2.0, _3445);
    int _3449 = _2469 & 3;
    bool _3451 = _3449 != 0;
    float _3453 = _1403 * 2.0;
    float _3455 = fma(_3437, -2.0, _3435);
    float _3457 = _3265 * _3265;
    bool _3459 = !_3451;
    int _3461 = _3459 ? 0 : 1;
    float _3463 = fma(_2957, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3397);
    float _3465 = fma(_3277, _3277, _3457);
    int _3467 = _2553 & 3;
    bool _3469 = _3467 != 0;
    float _3471 = floor(_3453);
    float _3473 = fma(_3337, _3337, _3465);
    bool _3475 = !_3469;
    int _3477 = _3475 ? 0 : 1;
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3481 = _2607 & 3;
    bool _3483 = _3481 != 0;
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3487 = rsqrt(_3473);
    float _3489 = fma(_2915, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3479);
    bool _3491 = !_3483;
    int _3493 = _3491 ? 0 : 1;
    float _3495 = _2915 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    bool _3497 = _2351 != 3;
    float _3499 = (*spvDescriptorSet0.vp_c9)._m0[102].x + (*spvDescriptorSet0.vp_c9)._m0[101].z;
    float _3501 = _3297 * (*spvDescriptorSet0.vp_c9)._m0[102].x;
    int _3503 = _2469 >> 31;
    float _3505 = fma(_3495, -2.0, _3485);
    bool _3507 = !_3497;
    int _3509 = _3507 ? 0 : (-1);
    float _3511 = _3423 * (*spvDescriptorSet0.vp_c9)._m0[102].y;
    int _3513 = _2341 >> 31;
    float _3515 = -_3499;
    float _3517 = fma(_3501, 2.0, _3515);
    bool _3519 = _2481 != 3;
    float _3521 = fma(_3035, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3381);
    if (_2883)
    {
        _2941 = _1397;
    }
    float _3523 = _2941;
    float _3525 = _3277 * _3487;
    float _3527 = _3523;
    if (_2883)
    {
        _2893 = _1084;
    }
    float _3529 = _2893;
    float _3531 = _3265 * _3487;
    int _3533 = _3503 & 3;
    float _3535 = fma(as_type<float>(_1407), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3431);
    float _3537 = _3529;
    if (!_2883)
    {
        _3527 = _1403;
    }
    float _3539 = _3527;
    float _3541 = -_3531;
    float _3543 = fma(_3541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3265);
    if (!_2883)
    {
        _3537 = _1397;
    }
    float _3545 = _3537;
    float _3547 = fma(as_type<float>(_1407), (*spvDescriptorSet0.vp_c9)._m0[103].w, _3433);
    bool _3549 = _3471 > 0.0;
    float _3551 = _3543 * _3543;
    bool _3553 = _3471 >= 0.0;
    bool _3555 = isnan(_3471);
    bool _3557 = _3553 || _3555;
    bool _3559 = isnan(0.0);
    bool _3561 = _3557 || _3559;
    float _3563 = _3339 + (-1.0);
    int _3565 = _3513 & 3;
    float _3567 = _3545 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3569 = !_3519;
    int _3571 = _3569 ? 0 : (-1);
    float _3573 = fma(_3563, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _3575 = _2569 != 3;
    float _3577 = -_3525;
    float _3579 = fma(_3577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3277);
    int _3581 = _2469 + _3533;
    float _3583 = _3539 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3585 = _2341 + _3565;
    float _3587 = fma(_3579, _3579, _3551);
    float _3589 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3591 = int(_3589);
    int _3593 = _3581 >> 2;
    out.m_75.x = _3521;
    int _3595 = _2553 >> 31;
    float _3597 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _3599 = _3585 >> 2;
    float _3601 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3505);
    int _3603 = _3595 & 3;
    float _3605 = -_3597;
    float _3607 = fma(_2961, 2.0, _3605);
    float _3609 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3611 = _3599 << 4;
    int _3613 = _3611 + 368;
    float _3615 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3617 = int(_3615);
    int _3619 = _2553 + _3603;
    float _3621 = (*spvDescriptorSet0.vp_c9)._m0[102].y + (*spvDescriptorSet0.vp_c9)._m0[101].w;
    uint _3623 = uint(int(uint(_3613) >> uint(2)));
    uint _3625 = uint(int(uint(int(_3623)) >> uint(2)));
    int _3627 = int(_3623) & 3;
    float _3629 = (*spvDescriptorSet0.vp_c9)._m0[int(_3625)][_3627];
    int _3631 = int(_3623) + 1;
    uint _3633 = uint(int(uint(_3631) >> uint(2)));
    int _3635 = _3631 & 3;
    float _3637 = (*spvDescriptorSet0.vp_c9)._m0[int(_3633)][_3635];
    float _3639 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3413);
    int _3641 = _3619 >> 2;
    float _3643 = fma(_3511, -2.0, _3621);
    int _3645 = _2607 >> 31;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3649 = _3641 << 4;
    int _3651 = _3649 + 656;
    float _3653 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3535);
    int _3655 = _3593 << 4;
    int _3657 = _3655 + 512;
    float _3659 = fma(_3609, -2.0, _3647);
    int _3661 = _3645 & 3;
    uint _3663 = uint(int(uint(_3651) >> uint(2)));
    uint _3665 = uint(int(uint(int(_3663)) >> uint(2)));
    int _3667 = int(_3663) & 3;
    float _3669 = (*spvDescriptorSet0.vp_c9)._m0[int(_3665)][_3667];
    int _3671 = int(_3663) + 1;
    uint _3673 = uint(int(uint(_3671) >> uint(2)));
    int _3675 = _3671 & 3;
    float _3677 = (*spvDescriptorSet0.vp_c9)._m0[int(_3673)][_3675];
    float _3679 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3681 = int(_3679);
    int _3683 = _2607 + _3661;
    float _3685 = _3337 * _3487;
    int _3687 = _3561 ? 0 : 1;
    float _3689 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3691 = _3683 >> 2;
    uint _3693 = uint(int(uint(_3657) >> uint(2)));
    uint _3695 = uint(int(uint(int(_3693)) >> uint(2)));
    int _3697 = int(_3693) & 3;
    float _3699 = (*spvDescriptorSet0.vp_c9)._m0[int(_3695)][_3697];
    int _3701 = int(_3693) + 1;
    uint _3703 = uint(int(uint(_3701) >> uint(2)));
    int _3705 = _3701 & 3;
    float _3707 = (*spvDescriptorSet0.vp_c9)._m0[int(_3703)][_3705];
    float _3709 = -_3685;
    float _3711 = fma(_3709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3337);
    bool _3713 = _2617 != 3;
    float _3715 = fma(_3567, -2.0, _3689);
    float _3717 = fma(_3711, _3711, _3587);
    int _3719 = abs(_2405);
    float _3721 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[102].z, _3427);
    int _3723 = ~_3687;
    int _3725 = _3723 + 1;
    int _3727 = _3725 + 1;
    float _3729 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3731 = _3727;
    if (!_3549)
    {
        int _3733 = ~_3687;
        int _3735 = _3733 + 1;
        _3731 = _3735;
    }
    int _3737 = _3731;
    float _3739 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[102].w, _3547);
    int _3741 = ~_3329;
    int _3743 = _3741 + _3385;
    int _3745 = _3743 + 1;
    float _3747 = -_3729;
    float _3749 = fma(_3583, 2.0, _3747);
    int _3751 = abs(_2561);
    float _3753 = -_166;
    float _3755 = fma(_3753, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3213);
    int _3757 = _3691 << 4;
    int _3759 = _3757 + 800;
    int _3761 = _3651 + 8;
    uint _3763 = uint(int(uint(_3761) >> uint(2)));
    uint _3765 = uint(int(uint(int(_3763)) >> uint(2)));
    int _3767 = int(_3763) & 3;
    float _3769 = (*spvDescriptorSet0.vp_c9)._m0[int(_3765)][_3767];
    int _3771 = int(_3763) + 1;
    uint _3773 = uint(int(uint(_3771) >> uint(2)));
    int _3775 = _3771 & 3;
    float _3777 = (*spvDescriptorSet0.vp_c9)._m0[int(_3773)][_3775];
    float _3779 = fma(_3345, _3387, _3755);
    int _3781 = ~_3309;
    int _3783 = _3781 + _3365;
    int _3785 = _3783 + 1;
    float _3787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3789 = ~_3719;
    int _3791 = _3789 + 1;
    int _3793 = _3791 + 1;
    float _3795 = -_166;
    float _3797 = fma(_3795, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3411);
    int _3799 = abs(_3461);
    int _3801 = _3657 + 8;
    uint _3803 = uint(int(uint(_3801) >> uint(2)));
    uint _3805 = uint(int(uint(int(_3803)) >> uint(2)));
    int _3807 = int(_3803) & 3;
    float _3809 = (*spvDescriptorSet0.vp_c9)._m0[int(_3805)][_3807];
    int _3811 = int(_3803) + 1;
    uint _3813 = uint(int(uint(_3811) >> uint(2)));
    int _3815 = _3811 & 3;
    float _3817 = (*spvDescriptorSet0.vp_c9)._m0[int(_3813)][_3815];
    int _3819 = _1208 * _3785;
    int _3821 = _3819 + _1885;
    int _3823 = ~_3751;
    int _3825 = _3823 + 1;
    int _3827 = _3825 + 1;
    int _3829 = _3793 * as_type<int>(_3637);
    int _3831 = abs(_3441);
    int _3833 = _1234 * _3745;
    int _3835 = _3833 + _2195;
    int _3837 = abs(_3477);
    float _3839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    uint _3841 = uint(int(uint(_3759) >> uint(2)));
    uint _3843 = uint(int(uint(int(_3841)) >> uint(2)));
    int _3845 = int(_3841) & 3;
    float _3847 = (*spvDescriptorSet0.vp_c9)._m0[int(_3843)][_3845];
    int _3849 = int(_3841) + 1;
    uint _3851 = uint(int(uint(_3849) >> uint(2)));
    int _3853 = _3849 & 3;
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[int(_3851)][_3853];
    int _3857 = abs(_2633);
    float _3859 = -_166;
    float _3861 = fma(_3859, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3447);
    int _3863 = abs(_2679);
    float _3865 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3455);
    float _3867 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3463);
    int _3869 = ~_3857;
    int _3871 = _3869 + 1;
    int _3873 = _3871 + 1;
    int _3875 = _3613 + 8;
    uint _3877 = uint(int(uint(_3875) >> uint(2)));
    uint _3879 = uint(int(uint(int(_3877)) >> uint(2)));
    int _3881 = int(_3877) & 3;
    float _3883 = (*spvDescriptorSet0.vp_c9)._m0[int(_3879)][_3881];
    int _3885 = int(_3877) + 1;
    uint _3887 = uint(int(uint(_3885) >> uint(2)));
    int _3889 = _3885 & 3;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[int(_3887)][_3889];
    float _3893 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3443);
    int _3895 = ~_3837;
    int _3897 = _3895 + 1;
    int _3899 = _3897 + 1;
    int _3901 = _3873 * as_type<int>(_3677);
    int _3903 = ~_3799;
    int _3905 = _3903 + 1;
    int _3907 = _3905 + 1;
    float _3909 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3911 = log2(_3909);
    int _3913 = _3827 * as_type<int>(_3707);
    int _3915 = _3759 + 8;
    uint _3917 = uint(int(uint(_3915) >> uint(2)));
    uint _3919 = uint(int(uint(int(_3917)) >> uint(2)));
    int _3921 = int(_3917) & 3;
    float _3923 = (*spvDescriptorSet0.vp_c9)._m0[int(_3919)][_3921];
    int _3925 = int(_3917) + 1;
    uint _3927 = uint(int(uint(_3925) >> uint(2)));
    int _3929 = _3925 & 3;
    float _3931 = (*spvDescriptorSet0.vp_c9)._m0[int(_3927)][_3929];
    bool _3933 = !_2325;
    int _3935 = _3933 ? _3373 : (-1);
    int _3937 = _3899 * as_type<int>(_3669);
    int _3939 = _3937 + _3901;
    bool _3941 = !_2443;
    int _3943 = _3941 ? _3393 : (-1);
    int _3945 = _3907 * as_type<int>(_3699);
    int _3947 = _3945 + _3913;
    bool _3949 = !_3713;
    int _3951 = _3949 ? 0 : (-1);
    float _3953 = -_166;
    float _3955 = fma(_3953, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3607);
    int _3957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3959 = _3957 != 0;
    int _3961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3963 = _3961 != 0;
    int _3965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3967 = _3965 != 0;
    float _3969 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3659);
    float _3971 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3973 = int(_3971);
    int _3975 = ~_3831;
    int _3977 = _3975 + 1;
    int _3979 = _3977 + 1;
    float _3981 = -_166;
    float _3983 = fma(_3981, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3749);
    int _3985 = abs(_2615);
    float _3987 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3715);
    int _3989 = abs(_2539);
    int _3991 = _3979 * as_type<int>(_3629);
    int _3993 = _3991 + _3829;
    int _3995 = abs(_3493);
    float _3997 = _3911 * _166;
    int _3999 = ~_3985;
    int _4001 = _3999 + 1;
    int _4003 = _4001 + 1;
    float _4005 = _3779;
    if (_3389)
    {
        out.m_53.x = 0.0;
    }
    bool _4007 = !_3575;
    int _4009 = _4007 ? 0 : (-1);
    int _4011 = abs(_2463);
    int _4013 = _4003 * as_type<int>(_3769);
    int _4015 = _4013 + _3939;
    int _4017 = ~_3989;
    int _4019 = _4017 + 1;
    int _4021 = _4019 + 1;
    int _4023 = ~_3863;
    int _4025 = _4023 + 1;
    int _4027 = _4025 + 1;
    int _4029 = _4021 * as_type<int>(_3809);
    int _4031 = _4029 + _3947;
    int _4033 = ~_4011;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    int _4039 = abs(_4009);
    int _4041 = _4027 * as_type<int>(_3855);
    int _4043 = ~_3995;
    int _4045 = _4043 + 1;
    int _4047 = _4045 + 1;
    int _4049 = abs(_3571);
    int _4051 = ~_4039;
    int _4053 = _4051 + 1;
    int _4055 = _4053 + 1;
    int _4057 = _4047 * as_type<int>(_3847);
    int _4059 = _4057 + _4041;
    float _4061 = float(uint(_3973));
    int _4063 = _4037 * as_type<int>(_3883);
    int _4065 = _4063 + _3993;
    int _4067 = abs(_3509);
    int _4069 = ~_4049;
    int _4071 = _4069 + 1;
    int _4073 = _4071 + 1;
    int _4075 = abs(_2669);
    int _4077 = _4055 * as_type<int>(_3777);
    int _4079 = _4077 + _4015;
    int _4081 = ~_4067;
    int _4083 = _4081 + 1;
    int _4085 = _4083 + 1;
    int _4087 = _4073 * as_type<int>(_3817);
    int _4089 = _4087 + _4031;
    int _4091 = abs(_2487);
    float _4093 = 1.0 / _4061;
    int _4095 = ~_4075;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    int _4101 = _4085 * as_type<int>(_3891);
    int _4103 = _4101 + _4065;
    int _4105 = abs(_3951);
    float _4107 = float(uint(_3591));
    int _4109 = _4099 * as_type<int>(_3923);
    int _4111 = _4109 + _4059;
    int _4113 = ~_4091;
    int _4115 = _4113 + 1;
    int _4117 = _4115 + 1;
    float _4119 = float(uint(_3617));
    int _4121 = ~_4105;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = _4103 * _4117;
    int _4129 = abs(_3617);
    float _4131 = 1.0 / _4107;
    int _4133 = abs(_2567);
    int _4135 = _4125 * as_type<int>(_3931);
    int _4137 = _4135 + _4111;
    float _4139 = float(uint(_3681));
    int _4141 = _3935 * _4091;
    int _4143 = _4141 + _4127;
    int _4145 = ~_4133;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    float _4151 = 1.0 / _4119;
    int _4153 = abs(_2703);
    bool _4155 = _1208 == 0;
    int _4157 = _4149 * _4089;
    int _4159 = abs(_2793);
    int _4161 = abs(_3973);
    float _4163 = 1.0 / _4139;
    int _4165 = ~_4153;
    int _4167 = _4165 + 1;
    int _4169 = _4167 + 1;
    int _4171 = _3943 * _4133;
    int _4173 = _4171 + _4157;
    int _4175 = as_type<int>(_4093) + (-2);
    float _4177 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3489);
    float _4179 = float(uint(_4143));
    int _4181 = _4169 * _4079;
    bool _4183 = !_4155;
    int _4185 = _4183 ? _3821 : (-1);
    int _4187 = ~_4159;
    int _4189 = _4187 + 1;
    int _4191 = _4189 + 1;
    float _4193 = as_type<float>(_4175) * _4179;
    bool _4195 = _1234 == 0;
    float _4197 = float(uint(_4161));
    int _4199 = _4191 * _4137;
    bool _4201 = !_4195;
    int _4203 = _4201 ? _3835 : (-1);
    float _4205 = trunc(_4193);
    float _4207 = precise::max(_4205, 0.0);
    uint _4209 = uint(_4207);
    int _4211 = as_type<int>(_4131) + (-2);
    int _4213 = _4185 * _4153;
    int _4215 = _4213 + _4181;
    float _4217 = float(uint(_4173));
    float _4219 = _3787 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4221 = abs(_3591);
    int _4223 = as_type<int>(_4151) + (-2);
    float _4225 = 1.0 / _4197;
    int _4227 = _4203 * _4159;
    int _4229 = _4227 + _4199;
    float _4231 = float(uint(_4221));
    float _4233 = as_type<float>(_4211) * _4217;
    float _4235 = fma(_4219, _2785, -0.5);
    float _4237 = _3839 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4239 = as_type<int>(_4163) + (-2);
    int _4241 = ~_3973;
    int _4243 = _4241 + 1;
    float _4245 = fma(_4237, _2803, -0.5);
    float _4247 = float(uint(_4229));
    float _4249 = 1.0 / _4231;
    int _4251 = abs(_4143);
    float _4253 = as_type<float>(_4239) * _4247;
    float _4255 = float(uint(_4129));
    int _4257 = _4243 * int(_4209);
    int _4259 = _4257 + _4143;
    int _4261 = abs(_3681);
    float _4263 = trunc(_4233);
    float _4265 = precise::max(_4263, 0.0);
    uint _4267 = uint(_4265);
    int _4269 = as_type<int>(_4225) + (-2);
    float _4271 = float(uint(_4251));
    float _4273 = float(uint(_4215));
    float _4275 = 1.0 / _4255;
    float _4277 = as_type<float>(_4269) * _4271;
    int _4279 = abs(_4173);
    float _4281 = float(uint(_4259));
    float _4283 = as_type<float>(_4223) * _4273;
    float _4285 = float(uint(_4261));
    int _4287 = as_type<int>(_4249) + (-2);
    float _4289 = as_type<float>(_4175) * _4281;
    float _4291 = float(uint(_4279));
    float _4293 = -_3601;
    float _4295 = fma(_4177, _4235, _4293);
    int _4297 = ~_3591;
    int _4299 = _4297 + 1;
    float _4301 = 1.0 / _4285;
    int _4303 = abs(_4215);
    float _4305 = as_type<float>(_4287) * _4291;
    int _4307 = as_type<int>(_4275) + (-2);
    float _4309 = trunc(_4283);
    float _4311 = precise::max(_4309, 0.0);
    uint _4313 = uint(_4311);
    float _4315 = float(uint(_4303));
    int _4317 = _4299 * int(_4267);
    int _4319 = _4317 + _4173;
    int _4321 = ~_3617;
    int _4323 = _4321 + 1;
    int _4325 = abs(_4229);
    float _4327 = as_type<float>(_4307) * _4315;
    int _4329 = ~_3681;
    int _4331 = _4329 + 1;
    float _4333 = trunc(_4253);
    float _4335 = precise::max(_4333, 0.0);
    uint _4337 = uint(_4335);
    int _4339 = ~_4161;
    int _4341 = _4339 + 1;
    int _4343 = as_type<int>(_4301) + (-2);
    float _4345 = float(uint(_4325));
    bool _4347 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4349 = isnan(0.0);
    bool _4351 = _4347 || _4349;
    bool _4353 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4355 = _4351 || _4353;
    float _4357 = trunc(_4277);
    float _4359 = precise::max(_4357, 0.0);
    uint _4361 = uint(_4359);
    int _4363 = _4323 * int(_4313);
    int _4365 = _4363 + _4215;
    int _4367 = ~_3973;
    int _4369 = _4367 + 1;
    int _4371 = ~_3617;
    int _4373 = _4371 + 1;
    int _4375 = ~_3591;
    int _4377 = _4375 + 1;
    float _4379 = trunc(_4305);
    float _4381 = precise::max(_4379, 0.0);
    uint _4383 = uint(_4381);
    int _4385 = _4331 * int(_4337);
    int _4387 = _4385 + _4229;
    float _4389 = trunc(_4327);
    float _4391 = precise::max(_4389, 0.0);
    uint _4393 = uint(_4391);
    int _4395 = _4341 * int(_4361);
    int _4397 = _4395 + _4251;
    float _4399 = float(uint(_4365));
    float _4401 = float(uint(_4387));
    float _4403 = float(uint(_4397));
    float _4405 = trunc(_4289);
    float _4407 = precise::max(_4405, 0.0);
    uint _4409 = uint(_4407);
    float _4411 = as_type<float>(_4239) * _4401;
    int _4413 = ~_4129;
    int _4415 = _4413 + 1;
    float _4417 = as_type<float>(_4269) * _4403;
    float _4419 = exp2(_3997);
    float _4421 = as_type<float>(_4343) * _4345;
    float _4423 = float(uint(_4319));
    int _4425 = _4415 * int(_4393);
    int _4427 = _4425 + _4303;
    float _4429 = as_type<float>(_4223) * _4399;
    bool _4431 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4433 = isnan(1.0);
    bool _4435 = _4431 || _4433;
    bool _4437 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4439 = _4435 || _4437;
    float _4441 = as_type<float>(_4211) * _4423;
    float _4443 = trunc(_4421);
    float _4445 = precise::max(_4443, 0.0);
    uint _4447 = uint(_4445);
    int _4449 = ~_4221;
    int _4451 = _4449 + 1;
    int _4453 = int(_4209) + int(_4409);
    int _4455 = ~_4261;
    int _4457 = _4455 + 1;
    int _4459 = _4451 * int(_4383);
    int _4461 = _4459 + _4279;
    float _4463 = float(uint(_4427));
    float _4465 = trunc(_4441);
    float _4467 = precise::max(_4465, 0.0);
    uint _4469 = uint(_4467);
    float _4471 = -_4419;
    float _4473 = _4471 + 1.0;
    float _4475 = float(uint(_4461));
    float _4477 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4479 = 1.0 + _4477;
    float _4481 = as_type<float>(_4307) * _4463;
    float _4483 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4485 = as_type<float>(_4287) * _4475;
    int _4487 = _4457 * int(_4447);
    int _4489 = _4487 + _4325;
    float _4491 = 1.0 / _4479;
    float _4493 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4495 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4483);
    float _4497 = float(uint(_4489));
    float _4499 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4501 = int(_4267) + int(_4469);
    float _4503 = trunc(_4429);
    float _4505 = precise::max(_4503, 0.0);
    uint _4507 = uint(_4505);
    float _4509 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4511 = as_type<float>(_4343) * _4497;
    float _4513 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4493);
    float _4515 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4499);
    float _4517 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4509);
    float _4519 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4495);
    float _4521 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4513);
    float _4523 = trunc(_4411);
    float _4525 = precise::max(_4523, 0.0);
    uint _4527 = uint(_4525);
    float _4529 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4517);
    float _4531 = -_166;
    float _4533 = fma(_4531, (*spvDescriptorSet0.vp_c9)._m0[101].x, _3517);
    float _4535 = fma(_3721, _3395, _4533);
    float _4537 = trunc(_4417);
    float _4539 = precise::max(_4537, 0.0);
    uint _4541 = uint(_4539);
    float _4543 = _4355 ? _4473 : 0.0;
    float _4545 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4515);
    int _4547 = ~_4261;
    int _4549 = _4547 + 1;
    float _4551 = trunc(_4485);
    float _4553 = precise::max(_4551, 0.0);
    uint _4555 = uint(_4553);
    float _4557 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[101].y, _3643);
    float _4559 = _4535;
    float _4561 = as_type<float>(_4501);
    if (_4439)
    {
        float _4563 = _4543 * _4491;
        _168 = _4563;
    }
    float _4565 = _168;
    int _4567 = _4369 * _4453;
    int _4569 = _4567 + _4143;
    int _4571 = int(_4337) + int(_4527);
    float _4573 = -_4557;
    float _4575 = fma(_3739, _4245, _4573);
    float _4577 = trunc(_4481);
    float _4579 = precise::max(_4577, 0.0);
    uint _4581 = uint(_4579);
    bool _4583 = uint(_4569) >= uint(_3973);
    float _4585 = _4575 + 0.5;
    int _4587 = int(_4361) + int(_4541);
    bool _4589 = !_4583;
    int _4591 = _4589 ? 0 : (-1);
    float _4593 = trunc(_4511);
    float _4595 = precise::max(_4593, 0.0);
    uint _4597 = uint(_4595);
    int _4599 = int(_4313) + int(_4507);
    int _4601 = _4377 * _4501;
    int _4603 = _4601 + _4173;
    int _4605 = ~_3681;
    int _4607 = _4605 + 1;
    int _4609 = int(_4383) + int(_4555);
    int _4611 = _4373 * _4599;
    int _4613 = _4611 + _4215;
    bool _4615 = uint(_4603) >= uint(_3591);
    int _4617 = ~_4221;
    int _4619 = _4617 + 1;
    bool _4621 = uint(_4613) >= uint(_3617);
    int _4623 = _4619 * _4609;
    int _4625 = _4623 + _4279;
    int _4627 = ~_4161;
    int _4629 = _4627 + 1;
    int _4631 = int(_4447) + int(_4597);
    int _4633 = _4607 * _4571;
    int _4635 = _4633 + _4229;
    int _4637 = int(_4393) + int(_4581);
    int _4639 = _4629 * _4587;
    int _4641 = _4639 + _4251;
    int _4643 = ~_4129;
    int _4645 = _4643 + 1;
    float _4647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4649 = !_4615;
    int _4651 = _4649 ? 0 : (-1);
    bool _4653 = uint(_4635) >= uint(_3681);
    int _4655 = _4645 * _4637;
    int _4657 = _4655 + _4303;
    int _4659 = ~_4453;
    int _4661 = _4659 + _4591;
    int _4663 = _4661 + 1;
    int _4665 = _4549 * _4631;
    int _4667 = _4665 + _4325;
    bool _4669 = !_4653;
    int _4671 = _4669 ? 0 : (-1);
    bool _4673 = uint(_4625) >= uint(_4221);
    bool _4675 = !_4621;
    int _4677 = _4675 ? 0 : (-1);
    bool _4679 = uint(_4641) >= uint(_4161);
    bool _4681 = !_4673;
    int _4683 = _4681 ? 0 : (-1);
    bool _4685 = uint(_4667) >= uint(_4261);
    int _4687 = _3973 * _4663;
    int _4689 = _4687 + _4143;
    bool _4691 = !_4679;
    int _4693 = _4691 ? 0 : (-1);
    int _4695 = _4143 ^ _3973;
    bool _4697 = uint(_4657) >= uint(_4129);
    int _4699 = ~_4501;
    int _4701 = _4699 + _4651;
    int _4703 = _4701 + 1;
    float _4705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4707 = uint(int(uint(_4695) >> uint(31)));
    int _4709 = ~_4599;
    int _4711 = _4709 + _4677;
    int _4713 = _4711 + 1;
    int _4715 = _3591 * _4703;
    int _4717 = _4715 + _4173;
    bool _4719 = !_4697;
    int _4721 = _4719 ? 0 : (-1);
    bool _4723 = _3973 == 0;
    int _4725 = _3617 * _4713;
    int _4727 = _4725 + _4215;
    int _4729 = _4173 ^ _3591;
    float _4731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4733 = ~_4693;
    int _4735 = _4587 + _4733;
    int _4737 = _4735 + 1;
    float _4739 = _4295 + 0.5;
    int _4741 = ~int(_4707);
    int _4743 = _4741 + 1;
    bool _4745 = !_4723;
    int _4747 = _4745 ? _4689 : (-1);
    bool _4749 = _3617 == 0;
    float _4751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    uint _4753 = uint(int(uint(_4729) >> uint(31)));
    int _4755 = _4737 ^ _4743;
    int _4757 = ~_4571;
    int _4759 = _4757 + _4671;
    int _4761 = _4759 + 1;
    bool _4763 = !_4685;
    int _4765 = _4763 ? 0 : (-1);
    float _4767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4769 = _3591 == 0;
    int _4771 = _3681 * _4761;
    int _4773 = _4771 + _4229;
    bool _4775 = !_4749;
    int _4777 = _4775 ? _4727 : (-1);
    float _4779 = _4535 + 0.5;
    bool _4781 = _3973 == 0;
    int _4783 = ~_4683;
    int _4785 = _4609 + _4783;
    int _4787 = _4785 + 1;
    float _4789 = _3779 + 0.5;
    int _4791 = ~int(_4753);
    int _4793 = _4791 + 1;
    out.m_77.x = _4779;
    out.m_77.y = _4585;
    int _4795 = ~_4743;
    int _4797 = _4795 + _4755;
    int _4799 = _4797 + 1;
    bool _4801 = !_4769;
    int _4803 = _4801 ? _4717 : (-1);
    out.m_79.x = _4789;
    out.m_79.y = _4739;
    bool _4805 = _3681 == 0;
    int _4807 = _4787 ^ _4793;
    bool _4809 = !_4781;
    int _4811 = _4809 ? _4799 : (-1);
    bool _4813 = _3617 == 0;
    int _4815 = _4215 ^ _3617;
    float _4817 = _4647 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4819 = !_4805;
    int _4821 = _4819 ? _4773 : (-1);
    float _4823 = _4731 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4825 = _3591 == 0;
    float _4827 = fma(_4817, _1573, -0.5);
    int _4829 = ~_4793;
    int _4831 = _4829 + _4807;
    int _4833 = _4831 + 1;
    float _4835 = fma(_4823, _1609, -0.5);
    float _4837 = float(_4747);
    float _4839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _4841 = uint(int(uint(_4815) >> uint(31)));
    bool _4843 = !_4825;
    int _4845 = _4843 ? _4833 : (-1);
    float _4847 = fma(_4817, _4837, _3797);
    bool _4849 = _3681 == 0;
    float _4851 = _4751 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4853 = _4229 ^ _3681;
    float _4855 = _4767 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4857 = ~_4721;
    int _4859 = _4637 + _4857;
    int _4861 = _4859 + 1;
    float _4863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4865 = ~int(_4841);
    int _4867 = _4865 + 1;
    float _4869 = fma(_4851, _2323, -0.5);
    float _4871 = float(_4821);
    float _4873 = fma(_4855, _1825, -0.5);
    float _4875 = float(_4777);
    float _4877 = _4839 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _4879 = _4861 ^ _4867;
    float _4881 = fma(_4851, _4871, _3861);
    uint _4883 = uint(int(uint(_4853) >> uint(31)));
    float _4885 = fma(_4855, _4875, _3983);
    float _4887 = float(_4811);
    float _4889 = _4705 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4891 = ~_4867;
    int _4893 = _4891 + _4879;
    int _4895 = _4893 + 1;
    float _4897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4899 = ~_4765;
    int _4901 = _4631 + _4899;
    int _4903 = _4901 + 1;
    float _4905 = fma(_4889, _2705, -0.5);
    int _4907 = ~int(_4883);
    int _4909 = _4907 + 1;
    float _4911 = -_2805;
    float _4913 = fma(_4889, _4887, _4911);
    bool _4915 = !_4813;
    int _4917 = _4915 ? _4895 : (-1);
    float _4919 = fma(_4545, _4873, _4885);
    float _4921 = float(_4845);
    float _4923 = _4863 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4925 = _4903 ^ _4909;
    float _4927 = fma(_4877, _2715, -0.5);
    float _4929 = float(_4803);
    float _4931 = -_3969;
    float _4933 = fma(_4877, _4921, _4931);
    float _4935 = float(_4917);
    float _4937 = fma(_4923, _2729, -0.5);
    int _4939 = ~_4909;
    int _4941 = _4939 + _4925;
    int _4943 = _4941 + 1;
    float _4945 = fma(_4823, _4929, _3955);
    float _4947 = fma(_3893, _4927, _4933);
    float _4949 = -_3987;
    float _4951 = fma(_4923, _4935, _4949);
    bool _4953 = !_3959;
    int _4955 = _4953 ? 0 : 1;
    float _4957 = fma(_4519, _4827, _4847);
    bool _4959 = !_4849;
    int _4961 = _4959 ? _4943 : (-1);
    float _4963 = fma(_3867, _4835, _4945);
    float _4965 = fma(_4529, _4937, _4951);
    float _4967 = _4947 + 0.5;
    float _4969 = float(_4961);
    float _4971 = _4897 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4973 = abs(_4955);
    float _4975 = fma(_3639, _4869, _4881);
    float _4977 = in.m_81.x;
    float _4979 = in.m_81.y;
    float _4981 = in.m_81.z;
    float _4983 = fma(_4971, _2731, -0.5);
    float _4985 = -_3865;
    float _4987 = fma(_4971, _4969, _4985);
    float _4989 = fma(_4521, _4905, _4913);
    bool _4991 = !_3963;
    int _4993 = _4991 ? 0 : 1;
    float _4995 = _4919 + 0.5;
    float _4997 = fma(_3653, _4983, _4987);
    float _4999 = _4957 + 0.5;
    float _5001 = _4963 + 0.5;
    float _5003 = _4989 + 0.5;
    float _5005 = _4975 + 0.5;
    float _5007 = _4965 + 0.5;
    float _5009 = _4997 + 0.5;
    int _5011 = abs(_4993);
    out.m_83.x = _4999;
    out.m_83.y = _5003;
    out.m_83.z = _5001;
    out.m_83.w = _4967;
    bool _5013 = !_3967;
    int _5015 = _5013 ? 0 : 1;
    out.m_85.x = _4995;
    out.m_85.y = _5007;
    float _5017 = float(_4973);
    out.m_87.x = _5005;
    out.m_87.y = _5009;
    float _5019 = float(_3737);
    float _5021 = as_type<float>(_4713);
    float _5023 = as_type<float>(_4703);
    if (_3389)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5025 = -_3531;
    float _5027 = fma(_5025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3209);
    float _5029 = -_3525;
    float _5031 = fma(_5029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3219);
    float _5033 = float(_2899);
    float _5035 = _5017 * _5019;
    float _5037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5039 = _5027 + _5037;
    float _5041 = float(_5011);
    float _5043 = -_3685;
    float _5045 = fma(_5043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3245);
    float _5047 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5049 = _5031 + _5047;
    float _5051 = _5039 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5053 = _5041 * _5033;
    float _5055 = _1084 + _1403;
    float _5057 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5059 = _5045 + _5057;
    float _5061 = fma(_5049, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5051);
    float _5063 = _5035 * (-2.0);
    float _5065 = _5055 + (-1.0);
    float _5067 = _5053 * (-2.0);
    float _5069 = fma(_5059, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5061);
    float _5071 = _1397 + (-0.5);
    float _5073 = fma(_5063, _4977, _4977);
    float _5075 = fma(_5065, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5077 = _1084 + (-0.5);
    float _5079 = fma(_5067, _4979, _4979);
    bool _5081 = _5069 >= 0.0;
    float _5083 = fma(_3573, _5063, _3573);
    float _5085 = fma(_5071, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5073);
    float _5087 = fma(_5075, _5067, _5075);
    float _5089 = fma(_5077, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5079);
    int _5091 = abs(_5015);
    float _5093 = fma(_5083, _4565, _5085);
    float _5095 = sqrt(_3717);
    float _5097 = fma(_5087, _4565, _5089);
    float _5099 = float(_3243);
    float _5101 = _5093 * 0.15915493667125701904296875;
    float _5103 = _5097 * 0.15915493667125701904296875;
    float _5105 = _5073;
    float _5107 = _5099;
    if (_5081)
    {
        _5105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5109 = _5105;
    float _5111 = _5101 * 6.283185482025146484375;
    float _5113 = sin(_5111);
    float _5115 = float(_5091);
    float _5117 = _1397 + _1403;
    int _5119 = as_type<int>(_5109);
    if (_5081)
    {
        float _5121 = _5109 * 5.0;
        _5119 = as_type<int>(_5121);
    }
    int _5123 = _5119;
    if (_5081)
    {
        out.m_53.x = 0.0;
    }
    float _5125 = _5115 * _5099;
    float _5127 = _5117 + (-1.0);
    float _5129 = _5101 * 6.283185482025146484375;
    float _5131 = cos(_5129);
    if (_5081)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14233 = as_type<float>(_5123);
        out.gl_Position.z = _14233;
    }
    float _5133 = _5125 * (-2.0);
    float _5135 = _5103 * 6.283185482025146484375;
    float _5137 = sin(_5135);
    if (_5081)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5139 = -_3209;
    float _5141 = _5139 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5143 = -_3219;
    float _5145 = _5143 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5147 = -_3245;
    float _5149 = _5147 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5151 = fma(_5127, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5153 = _5141 * _5141;
    float _5155 = fma(_5133, _4981, _4981);
    float _5157 = _1403 + (-0.5);
    float _5159 = fma(_5151, _5133, _5151);
    float _5161 = fma(_5145, _5145, _5153);
    float _5163 = _5103 * 6.283185482025146484375;
    float _5165 = cos(_5163);
    float _5167 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5155);
    float _5169 = _5113 * _5137;
    float _5171 = fma(_5149, _5149, _5161);
    float _5173 = _3487 * _5095;
    float _5175 = fma(_5159, _4565, _5167);
    float _5177 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5179 = rsqrt(_5171);
    float _5181 = _5175 * 0.15915493667125701904296875;
    float _5183 = _5173 * _5177;
    float _5185 = in.m_89.x;
    float _5187 = in.m_89.y;
    float _5189 = in.m_89.z;
    float _5191 = _5131 * _5165;
    float _5193 = _5181 * 6.283185482025146484375;
    float _5195 = sin(_5193);
    float _5197 = _5113 * _5165;
    float _5199 = _5145 * _5179;
    float _5201 = _5149 * _5179;
    float _5203 = _5141 * _5179;
    float _5205 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5207 = _5199 * _5205;
    float _5209 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5211 = _5201 * _5209;
    float _5213 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5215 = _5203 * _5213;
    float _5217 = _5181 * 6.283185482025146484375;
    float _5219 = cos(_5217);
    float _5221 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5223 = -_5207;
    float _5225 = fma(_5201, _5221, _5223);
    float _5227 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5229 = -_5211;
    float _5231 = fma(_5203, _5227, _5229);
    float _5233 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5235 = -_5215;
    float _5237 = fma(_5199, _5233, _5235);
    float _5239 = fma(_5195, _5191, _5169);
    float _5241 = _5225 * _5225;
    float _5243 = fma(_5195, _5169, _5191);
    float _5245 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5247 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5249 = fma(_5231, _5231, _5241);
    float _5251 = _5131 * _5137;
    float _5253 = _5173 * _5247;
    float _5255 = fma(_5237, _5237, _5249);
    float _5257 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5187);
    float _5259 = _5131 * _5219;
    float _5261 = _5165 * _5219;
    float _5263 = _5113 * _5219;
    float _5265 = rsqrt(_5255);
    float _5267 = _5257 * _5253;
    float _5269 = _5173 * _5245;
    float _5271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5185);
    float _5273 = _5137 * _5219;
    float _5275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5189);
    float _5277 = -_5251;
    float _5279 = fma(_5195, _5197, _5277);
    float _5281 = _5271 * _5269;
    float _5283 = _5259 * _5267;
    float _5285 = _5275 * _5183;
    float _5287 = -_5197;
    float _5289 = fma(_5195, _5251, _5287);
    float _5291 = _5263 * _5267;
    float _5293 = fma(_5239, _5281, _5283);
    float _5295 = fma(_5279, _5281, _5291);
    float _5297 = _5231 * _5265;
    float _5299 = _5225 * _5265;
    float _5301 = _5237 * _5265;
    float _5303 = -_5267;
    float _5305 = _5195 * _5303;
    float _5307 = _5203 * _5297;
    float _5309 = _5201 * _5299;
    float _5311 = fma(_5261, _5281, _5305);
    float _5313 = fma(_5289, _5285, _5293);
    float _5315 = -_5309;
    float _5317 = fma(_5203, _5301, _5315);
    float _5319 = -_5307;
    float _5321 = fma(_5199, _5299, _5319);
    float _5323 = fma(_5273, _5285, _5311);
    float _5325 = fma(_5243, _5285, _5295);
    float _5327 = _5317 * _5313;
    float _5329 = _5321 * _5313;
    float _5331 = fma(_5297, _5323, _5327);
    float _5333 = fma(_5301, _5323, _5329);
    float _5335 = fma(_5199, _5325, _5331);
    float _5337 = fma(_5201, _5325, _5333);
    float _5339 = _5199 * _5301;
    float _5341 = _3219 + _5335;
    float _5343 = _3245 + _5337;
    float _5345 = -_5339;
    float _5347 = fma(_5201, _5297, _5345);
    float _5349 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5351 = _5341 + _5349;
    float _5353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5355 = _5343 + _5353;
    float _5357 = _5347 * _5313;
    float _5359 = _5351 * _5351;
    float _5361 = _5355 * _5355;
    float _5363 = fma(_5299, _5323, _5357);
    float _5365 = _5359 + _5361;
    float _5367 = fma(_5203, _5325, _5363);
    float _5369 = sqrt(_5365);
    float _5371 = _3209 + _5367;
    bool _5373 = _5369 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5375 = _5341;
    float _5377 = _5343;
    float _5379 = _5359;
    float _5381 = _5361;
    if (!_5373)
    {
        _5021 = _5371;
    }
    float _5383 = _5021;
    bool _5385 = !_5373;
    float _5387 = _5383;
    if (!_5385)
    {
        float _5389 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5393 = _5369 + _5391;
        float _5395 = rsqrt(_5365);
        float _5397 = _5393 * _5389;
        float _5399 = _5371 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5401 = _5397 * 0.15915493667125701904296875;
        float _5403 = _5401 * 6.283185482025146484375;
        float _5405 = sin(_5403);
        float _5407 = _5401 * 6.283185482025146484375;
        float _5409 = cos(_5407);
        float _5411 = fma(_5405, _5399, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5413 = _5395 * _5411;
        float _5415 = _5409 + (-1.0);
        float _5417 = fma(_5351, _5413, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5419 = fma(_5355, _5413, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5421 = _5415 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5425 = _5417 + _5423;
        float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5429 = _5419 + _5427;
        float _5431 = fma(_5371, _5409, _5421);
        float _5433 = _5425 * _5425;
        float _5435 = _5429 * _5429;
        _5375 = _5417;
        _5377 = _5419;
        _5387 = _5431;
        _5379 = _5433;
        _5381 = _5435;
    }
    float _5437 = _5375;
    float _5439 = _5377;
    float _5441 = _5387;
    float _5443 = _5379;
    float _5445 = _5381;
    float _5447 = fma(_5437, 6.2500002968590706586837768554688e-05, 0.5);
    float _5449 = fma(_5439, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14726 = float2(_5447, _5449);
    float3 _5453 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14726, float2(0.0), isnan(_14726)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14726, float2(0.0), isnan(_14726)), level(0.0)).xyz;
    float _5455 = _5453.x;
    float _5457 = _5453.y;
    float _5459 = _5453.z;
    float _5461 = in.m_91.x;
    float _5463 = in.m_91.y;
    float _5465 = in.m_91.z;
    bool _5467 = _5187 != 0.0;
    bool _5469 = isnan(_5187);
    bool _5471 = _5467 || _5469;
    bool _5473 = isnan(0.0);
    bool _5475 = _5471 || _5473;
    float _5477 = in.m_93.x;
    float _5479 = in.m_93.y;
    float _5481 = in.m_93.z;
    float _5483 = in.m_93.w;
    bool _5485 = _5185 == 0.0;
    bool _5487 = !_5475;
    bool _5489 = _5485 && _5487;
    bool _5491 = _5189 == 0.0;
    bool _5493 = _5491 && _5489;
    float _5495 = _5461;
    if (_5493)
    {
        _4005 = _5461;
    }
    float _5497 = _4005;
    float _5499 = _5497;
    if (_5493)
    {
        _5107 = _5465;
    }
    float _5501 = _5107;
    float _5503 = _5501;
    if (_5493)
    {
        _4559 = _5463;
    }
    float _5505 = _4559;
    float _5507 = _5505;
    if (_5493)
    {
        _4561 = _5497;
    }
    float _5509 = _4561;
    float _5511 = _5509;
    if (!_5493)
    {
        _5499 = _5461;
    }
    float _5513 = _5499;
    if (_5493)
    {
        _5023 = _5501;
    }
    float _5515 = _5023;
    float _5517 = _5515;
    if (!_5493)
    {
        _5503 = _5465;
    }
    float _5519 = _5503;
    if (!_5493)
    {
        float _5521 = fma(_5185, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5513);
        _5511 = _5521;
    }
    float _5523 = _5511;
    if (_5493)
    {
        _5495 = _5505;
    }
    float _5525 = _5495;
    float _5527 = _5481 * _5513;
    float _5529 = _5525;
    if (!_5493)
    {
        _5507 = _5463;
    }
    float _5531 = _5507;
    float _5533 = _5479 * _5519;
    if (!_5493)
    {
        float _5535 = fma(_5189, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5519);
        _5517 = _5535;
    }
    float _5537 = _5517;
    float _5539 = -_5527;
    float _5541 = fma(_5477, _5519, _5539);
    float _5543 = _5259 * _5317;
    float _5545 = _5477 * _5531;
    float _5547 = -_5533;
    float _5549 = fma(_5481, _5531, _5547);
    if (!_5493)
    {
        float _5551 = fma(_5187, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5531);
        _5529 = _5551;
    }
    float _5553 = _5529;
    float _5555 = _5239 * _5317;
    float _5557 = -_5545;
    float _5559 = fma(_5479, _5513, _5557);
    float _5561 = _5239 * _5347;
    float _5563 = _5239 * _5321;
    float _5565 = _5541 * _5483;
    float _5567 = _5549 * _5483;
    float _5569 = _5559 * _5483;
    float _5571 = _5259 * _5347;
    float _5573 = fma(_5261, _5297, _5555);
    float _5575 = fma(_5261, _5299, _5561);
    float _5577 = _5259 * _5321;
    float _5579 = fma(_5261, _5301, _5563);
    float _5581 = -_5195;
    float _5583 = fma(_5581, _5297, _5543);
    float _5585 = _5289 * _5317;
    float _5587 = _5289 * _5347;
    float _5589 = _5289 * _5321;
    float _5591 = -_5195;
    float _5593 = fma(_5591, _5299, _5571);
    float _5595 = -_5195;
    float _5597 = fma(_5595, _5301, _5577);
    float _5599 = fma(_5263, _5199, _5583);
    float _5601 = fma(_5273, _5297, _5585);
    float _5603 = fma(_5273, _5299, _5587);
    float _5605 = fma(_5273, _5301, _5589);
    float _5607 = fma(_5263, _5203, _5593);
    float _5609 = fma(_5263, _5201, _5597);
    float _5611 = fma(_5279, _5199, _5573);
    float _5613 = _5599 * _5479;
    float _5615 = fma(_5279, _5203, _5575);
    float _5617 = fma(_5279, _5201, _5579);
    float _5619 = fma(_5243, _5199, _5601);
    float _5621 = fma(_5243, _5203, _5603);
    float _5623 = fma(_5243, _5201, _5605);
    float _5625 = _5607 * _5479;
    float _5627 = _5609 * _5479;
    float _5629 = fma(_5611, _5477, _5613);
    float _5631 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5633 = _5441 + _5631;
    float _5635 = fma(_5615, _5477, _5625);
    float _5637 = fma(_5617, _5477, _5627);
    float _5639 = _5599 * _5553;
    float _5641 = fma(_5633, _5633, _5443);
    float _5643 = _5607 * _5553;
    float _5645 = _5565 * _5599;
    float _5647 = _5565 * _5607;
    float _5649 = _5641 + _5445;
    float _5651 = _5609 * _5553;
    float _5653 = _5565 * _5609;
    float _5655 = fma(_5567, _5611, _5645);
    float _5657 = fma(_5615, _5523, _5643);
    float _5659 = fma(_5567, _5615, _5647);
    float _5661 = sqrt(_5649);
    float _5663 = fma(_5611, _5523, _5639);
    float _5665 = fma(_5617, _5523, _5651);
    float _5667 = fma(_5567, _5617, _5653);
    float _5669 = fma(_5619, _5481, _5629);
    float _5671 = fma(_5621, _5481, _5635);
    float _5673 = fma(_5621, _5537, _5657);
    float _5675 = fma(_5623, _5481, _5637);
    float _5677 = fma(_5619, _5537, _5663);
    float _5679 = fma(_5569, _5619, _5655);
    float _5681 = fma(_5569, _5621, _5659);
    float _5683 = fma(_5569, _5623, _5667);
    float _5685 = fma(_5623, _5537, _5665);
    out.m_95.x = _5669;
    out.m_95.y = _5671;
    out.m_95.z = _5675;
    bool _5687 = _5661 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5689 = isnan(_5661);
    bool _5691 = _5687 || _5689;
    bool _5693 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5695 = _5691 || _5693;
    out.m_97.x = _5679;
    out.m_97.y = _5681;
    out.m_97.z = _5683;
    out.m_99.x = _5677;
    out.m_99.y = _5673;
    out.m_99.z = _5685;
    float _5697 = _5569;
    float _5699 = _5665;
    if (!_5695)
    {
        _5697 = 1.0;
    }
    float _5701 = _5697;
    out.m_101.x = _5455;
    out.m_101.y = _5457;
    out.m_101.z = _5459;
    bool _5703 = !_5695;
    float _5705 = _5701;
    if (!_5703)
    {
        bool _5707 = _5661 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5709 = isnan(_5661);
        bool _5711 = _5707 || _5709;
        bool _5713 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5715 = _5711 || _5713;
        if (!_5715)
        {
            float _5717 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5719 = _5661 + _5717;
            float _5721 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5723 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5721;
            float _5725 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5727 = _5725 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5729 = 1.0 / _5723;
            float _5731 = _5719 * _5729;
            float _5733 = fma(_5731, _5727, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5705 = _5733;
            _5735 = true;
        }
        else
        {
            bool _5737 = _5661 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5739 = isnan(_5661);
            bool _5741 = _5737 || _5739;
            bool _5743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5745 = _5741 || _5743;
            if (!_5745)
            {
                float _5747 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5749 = _5661 + _5747;
                float _5751 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5753 = _5751 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5755 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5757 = _5755 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5759 = 1.0 / _5753;
                float _5761 = _5749 * _5759;
                float _5763 = fma(_5761, _5757, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5705 = _5763;
                _5735 = true;
            }
            else
            {
                _5705 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5735 = false;
    float _5765 = _5705;
    float _5767 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5769 = _5441 + _5767;
    float _5771 = _5027 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5773 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5775 = _5437 + _5773;
    float _5777 = fma(_5769, _5765, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5779 = fma(_5031, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5771);
    float _5781 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5783 = _5439 + _5781;
    float _5785 = fma(_5775, _5765, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5787 = -_3209;
    float _5789 = _5787 + _5777;
    float _5791 = fma(_5045, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5779);
    float _5793 = fma(_5783, _5765, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5795 = -_3219;
    float _5797 = _5795 + _5785;
    float _5799 = _5789 * _5789;
    float _5801 = _5791 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5803 = _5027 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5805 = -_3245;
    float _5807 = _5805 + _5793;
    float _5809 = fma(_5797, _5797, _5799);
    float _5811 = 1.0 / _5801;
    float _5813 = fma(_5031, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5803);
    float _5815 = fma(_5807, _5807, _5809);
    float _5817 = fma(_5045, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5813);
    float _5819 = sqrt(_5815);
    float _5821 = _5817 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5823 = _5821 + _5801;
    float _5825 = _5823 * _5811;
    float _5827 = _5825 * 0.5;
    bool _5829 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5831 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5833 = _5829 || _5831;
    bool _5835 = isnan(0.5);
    bool _5837 = _5833 || _5835;
    float _5839 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5841 = fma(_5827, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5839);
    bool _5843 = _5819 > 0.0;
    float _5845 = 1.0 / _5841;
    bool _5847 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5849 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5851 = _5847 || _5849;
    bool _5853 = isnan(0.5);
    bool _5855 = _5851 || _5853;
    float _5857 = _5827;
    float _5859 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5861 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5863 = _5793;
    if (!_5843)
    {
        _5857 = _5785;
    }
    float _5865 = _5857;
    float _5867 = _5865;
    float _5869 = _5865;
    if (!_5843)
    {
        _5859 = _5777;
    }
    float _5871 = _5859;
    float _5873 = _5871;
    if (!_5843)
    {
        _5861 = _5793;
    }
    float _5875 = _5861;
    bool _5877 = !_5843;
    float _5879 = _5875;
    if (!_5877)
    {
        float _5881 = _228 * _228;
        float _5883 = fma(_224, _224, _5881);
        float _5885 = fma(_230, _230, _5883);
        float _5887 = rsqrt(_5815);
        float _5889 = sqrt(_5885);
        float _5891 = _5797 * _5887;
        float _5893 = _5789 * _5887;
        float _5895 = _5807 * _5887;
        bool _5897 = _5889 > 0.0;
        float _5899 = _5889;
        float _5901 = _5887;
        _5699 = _5891;
        if (!_5897)
        {
            _5867 = _5785;
        }
        float _5903 = _5867;
        _5869 = _5903;
        if (!_5897)
        {
            _5899 = _5777;
        }
        float _5905 = _5899;
        _5873 = _5905;
        if (!_5897)
        {
            _5901 = _5793;
        }
        float _5907 = _5901;
        bool _5909 = !_5897;
        _5879 = _5907;
        if (!_5909)
        {
            float _5911 = rsqrt(_5885);
            float _5913 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5915 = _228 * _5911;
            float _5917 = _224 * _5911;
            float _5919 = _5893 * _5915;
            float _5921 = _230 * _5911;
            float _5923 = fma(_5891, _5917, _5919);
            float _5925 = _5913 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5927 = fma(_5895, _5921, _5923);
            float _5929 = _5927 * _5925;
            float _5931 = fma(_224, _5929, _5785);
            float _5933 = fma(_228, _5929, _5777);
            float _5935 = fma(_230, _5929, _5793);
            _5869 = _5931;
            _5873 = _5933;
            _5879 = _5935;
        }
    }
    float _5937 = _5869;
    float _5939 = _5873;
    float _5941 = _5879;
    float _5943 = _5699;
    float _5945 = -_3525;
    float _5947 = fma(_5945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5937);
    float _5949 = -_3531;
    float _5951 = fma(_5949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5939);
    float _5953 = -_3685;
    float _5955 = fma(_5953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5941);
    float _5957 = _5951;
    float _5959 = _5947;
    float _5961 = _5955;
    float _5963 = _5943;
    if (_5837)
    {
        _5863 = 1.0;
    }
    float _5965 = _5863;
    float _5967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5969 = _5845 * _5967;
    float _5971 = _5965;
    if (!_5855)
    {
        float _5973 = _5039 * _5039;
        float _5975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5977 = -_3245;
        float _5979 = _5977 + _5941;
        float _5981 = -_3219;
        float _5983 = _5981 + _5937;
        float _5985 = fma(_5049, _5049, _5973);
        float _5987 = fma(_5059, _5059, _5985);
        float _5989 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5991 = sqrt(_5987);
        float _5993 = 1.0 / _5173;
        float _5995 = _5989 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5997 = precise::min(_5991, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5999 = _5997 * _5975;
        float _6001 = _5999 * _5993;
        float _6003 = -_3209;
        float _6005 = _6003 + _5939;
        float _6007 = _5995 * _6001;
        float _6009 = _5979 * _6001;
        float _6011 = fma(_6005, _6007, _5027);
        float _6013 = fma(_5983, _6007, _5031);
        float _6015 = fma(_5995, _6009, _5045);
        _5957 = _6011;
        _5959 = _6013;
        _5961 = _6015;
    }
    float _6017 = _5957;
    float _6019 = _5959;
    float _6021 = _5961;
    if (!_5837)
    {
        float _6023 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6025 = _6023 * 0.15915493667125701904296875;
        float _6027 = _6025 * 6.283185482025146484375;
        float _6029 = cos(_6027);
        float _6031 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6033 = _6031 * 0.15915493667125701904296875;
        float _6035 = _6025 * 6.283185482025146484375;
        float _6037 = sin(_6035);
        float _6039 = 1.0 / _6029;
        float _6041 = _6033 * 6.283185482025146484375;
        float _6043 = cos(_6041);
        float _6045 = _6037 * _6039;
        float _6047 = _6033 * 6.283185482025146484375;
        float _6049 = sin(_6047);
        float _6051 = _6043 * _6045;
        float _6053 = 1.0 / _6051;
        float _6055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6057 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6055;
        float _6059 = 1.0 / _6057;
        float _6061 = _6049 * _6053;
        float _6063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6065 = fma(_5969, _6061, _6063);
        float _6067 = _6065 * _6059;
        float _6069 = precise::clamp(_6067, 0.0, 1.0);
        _5971 = _6069;
    }
    float _6071 = _5971;
    float _6073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6075 = _6017 + _6073;
    float _6077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6079 = _6019 + _6077;
    float _6081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6083 = _6021 + _6081;
    float _6085 = _6075 * _6075;
    float _6087 = fma(_6079, _6079, _6085);
    float _6089 = fma(_6083, _6083, _6087);
    float _6091 = rsqrt(_6089);
    float _6093 = _6091 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6095 = _6079 * _6093;
    float _6097 = _6083 * _6093;
    float _6099 = _6095 * _6095;
    float _6101 = _6097 * _6097;
    float _6103 = _6099 + _6101;
    float _6105 = sqrt(_6103);
    bool _6107 = _6105 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6109 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6111 = _6105 + _6109;
    float _6113 = _6091;
    float _6115 = _6103;
    float _6117 = _6111;
    float _6119 = _6075;
    if (_6107)
    {
        float _6121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6113 = _6121;
    }
    float _6123 = _6113;
    if (_6107)
    {
        float _6125 = rsqrt(_6103);
        _6115 = _6125;
    }
    float _6127 = _6115;
    float _6129 = _6127;
    if (_6107)
    {
        float _6131 = _6111 * _6123;
        _6117 = _6131;
    }
    float _6133 = _6117;
    if (_6107)
    {
        float _6135 = _6133 * 0.15915493667125701904296875;
        _5963 = _6135;
    }
    float _6137 = _5963;
    float _6139 = _6083;
    float _6141 = _6137;
    if (_6107)
    {
        float _6143 = _6137 * 6.283185482025146484375;
        float _6145 = sin(_6143);
        _6139 = _6145;
    }
    float _6147 = _6139;
    float _6149 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6151 = precise::max(0.0, _6149);
    float _6153 = _6123;
    if (_6107)
    {
        float _6155 = _6137 * 6.283185482025146484375;
        float _6157 = cos(_6155);
        _6153 = _6157;
    }
    float _6159 = _6153;
    float _6161 = -_6093;
    float _6163 = -_6151;
    float _6165 = fma(_6075, _6161, _6163);
    float _6167 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6107)
    {
        float _6169 = _6165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6119 = _6169;
    }
    float _6171 = _6119;
    float _6173 = fma(_5031, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6175 = _6171;
    float _6177 = _6147;
    if (_6107)
    {
        float _6179 = fma(_6147, _6171, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6175 = _6179;
    }
    float _6181 = _6175;
    float _6183 = _6181;
    if (!_6107)
    {
        _6177 = _6095;
    }
    float _6185 = _6177;
    float _6187 = sqrt(_6089);
    float _6189 = _6185;
    float _6191 = _6159;
    if (_6107)
    {
        float _6193 = _6159 + (-1.0);
        _6167 = _6193;
    }
    float _6195 = _6167;
    float _6197 = _6195;
    if (_6107)
    {
        float _6199 = _6127 * _6181;
        _3237 = _6199;
    }
    float _6201 = _3237;
    if (!_6107)
    {
        _6183 = _6165;
    }
    float _6203 = _6183;
    float _6205 = _6203;
    if (_6107)
    {
        float _6207 = _6195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6141 = _6207;
    }
    float _6209 = _6141;
    if (_6107)
    {
        float _6211 = _6095 * _6201;
        _6189 = _6211;
    }
    float _6213 = _6189;
    if (!_6107)
    {
        _6197 = _6097;
    }
    float _6215 = _6197;
    float _6217 = _6215;
    if (_6107)
    {
        float _6219 = _6097 * _6201;
        _6217 = _6219;
    }
    float _6221 = _6217;
    if (!_6107)
    {
        _6129 = _6099;
    }
    float _6223 = _6129;
    float _6225 = _6223;
    if (_6107)
    {
        float _6227 = fma(_6165, _6159, _6209);
        _6205 = _6227;
    }
    float _6229 = _6205;
    if (_6107)
    {
        float _6231 = _6213 * _6213;
        _6225 = _6231;
    }
    float _6233 = _6225;
    if (!_6107)
    {
        _6191 = _6101;
    }
    float _6235 = _6191;
    float _6237 = _6235;
    if (_6107)
    {
        float _6239 = _6221 * _6221;
        _6237 = _6239;
    }
    float _6241 = _6237;
    float _6243 = fma(_6229, _6229, _6233);
    float _6245 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6247 = floor(_6173);
    float _6249 = _6243 + _6241;
    float _6251 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6245);
    float _6253 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6255 = fma(_6187, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6253);
    float _6257 = precise::clamp(_6255, 0.0, 1.0);
    float _6259 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6251);
    float _6261 = -_6257;
    float _6263 = _6261 + 1.0;
    float _6265 = rsqrt(_6249);
    float _6267 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6269 = _6259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6271 = fma(_5045, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6273 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6275 = _6269 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6277 = abs(_6263);
    float _6279 = log2(_6277);
    float _6281 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6283 = -_6275;
    float _6285 = fma(_6283, _6267, 1.0);
    float _6287 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6289 = -_6247;
    float _6291 = _6173 + _6289;
    float _6293 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6281);
    float _6295 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6287);
    float _6297 = _6265 * _6213;
    float _6299 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6293);
    float _6301 = _6265 * _6229;
    float _6303 = _6265 * _6221;
    float _6305 = _6297 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6307 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6295);
    float _6309 = _6299 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6311 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6273);
    float _6313 = -_6305;
    float _6315 = fma(_6301, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6313);
    float _6317 = _6307 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6319 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6321 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6311);
    float _6323 = -_6303;
    float _6325 = fma(_6323, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6315);
    float _6327 = _6279 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6329 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6319);
    float _6331 = _6321 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6333 = floor(_6271);
    float _6335 = fma(_6325, -0.5, 0.5);
    float _6337 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6329);
    float _6339 = fma(_6325, 0.5, 0.5);
    float _6341 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6343 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6337);
    float _6345 = _6301 + 1.0;
    float _6347 = log2(_6285);
    float _6349 = fma(_6339, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6351 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6341);
    float _6353 = fma(_6339, _6349, -0.212114393711090087890625);
    float _6355 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6351);
    float _6357 = exp2(_6327);
    float _6359 = -_6333;
    float _6361 = _6271 + _6359;
    float _6363 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6355);
    float _6365 = fma(_6339, _6353, 1.570728778839111328125);
    float _6367 = 1.0 / _6343;
    float _6369 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6371 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6369);
    float _6373 = sqrt(_6335);
    float _6375 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6371);
    float _6377 = _6347 * 0.693147182464599609375;
    float _6379 = -_6301;
    float _6381 = fma(_6357, _6345, _6379);
    float _6383 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6375);
    float2 _16280 = float2(_6291, _6361);
    float _6385 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16280, float2(0.0), isnan(_16280)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16280, float2(0.0), isnan(_16280)), level(0.0)).x;
    float _6387 = _6377 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6389 = _6363 * _6367;
    float _6391 = _6383 * _6367;
    float _6393 = fma(_6381, 0.5, 0.5);
    float _6395 = fma(_6389, 0.5, 0.5);
    float _6397 = fma(_6391, -0.5, 0.5);
    float _6399 = _6373 * 0.636619746685028076171875;
    float3 _16308 = float3(_6395, _6397, _6387);
    float _6401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16308, float3(0.0), isnan(_16308)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16308, float3(0.0), isnan(_16308)), level(0.0)).x;
    float3 _16319 = float3(_6395, _6397, _6387);
    float4 _6404 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16319, float3(0.0), isnan(_16319)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16319, float3(0.0), isnan(_16319)), level(0.0)).xyzw;
    float _6406 = _6404.x;
    float _6408 = _6404.y;
    float _6410 = _6404.z;
    float _6412 = _6404.w;
    float _6414 = -_6365;
    float _6416 = fma(_6399, _6414, 1.0);
    float2 _16340 = float2(_6416, _6393);
    float3 _6418 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16340, float2(0.0), isnan(_16340)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16340, float2(0.0), isnan(_16340)), level(0.0)).xyz;
    float _6420 = _6418.x;
    float _6422 = _6418.y;
    float _6424 = _6418.z;
    float _6426 = abs(_5969);
    float _6428 = log2(_6426);
    float _6430 = _6279 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6432 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6434 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6436 = isnan(_6187);
    bool _6438 = _6434 || _6436;
    bool _6440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6442 = _6438 || _6440;
    float _6444 = exp2(_6430);
    float _6446 = in.m_103.x;
    float _6448 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6432);
    bool _6450 = _5969 <= 8000.0;
    bool _6452 = isnan(_5969);
    bool _6454 = _6450 || _6452;
    bool _6456 = isnan(8000.0);
    bool _6458 = _6454 || _6456;
    float _6460 = float(_6458);
    float _6462 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6448);
    float _6464 = _6428 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6466 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6462);
    float _6468 = _6343 * 0.5;
    float _6470 = _6363 + _6343;
    float _6472 = exp2(_6464);
    float _6474 = -_6444;
    float _6476 = _6474 + 1.0;
    float _6478 = fma(_6383, -0.5, _6468);
    float _6480 = _6466 + _6343;
    float _6482 = _6476 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6484 = _6470 * 0.5;
    out.gl_Position.x = _6363;
    out.gl_Position.y = _6383;
    out.gl_Position.z = _6466;
    out.gl_Position.w = _6343;
    float _6486 = _6480 * 0.5;
    out.m_105.x = _6484;
    out.m_105.y = _6478;
    out.m_105.z = _6486;
    out.m_105.w = _6343;
    float _6488 = fma(_6472, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6490 = precise::clamp(_6488, 0.0, 1.0);
    float _6492 = _6071 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6494 = fma(_6490, -2.0, 3.0);
    float _6496 = _6490 * _6490;
    float _6498 = -_6482;
    float _6500 = _6498 + 1.0;
    float _6502 = _6343;
    float _6504 = _6466;
    float _6506 = _6383;
    float _6508 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _6510 = _6500;
    if (!_6442)
    {
        _6502 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6512 = _6502;
    float _6514 = _6496 * _6494;
    float _6516 = _6512;
    float _6518 = _6512;
    if (!_6442)
    {
        _6504 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6520 = _6504;
    float _6522 = _6520;
    float _6524 = _6520;
    if (!_6442)
    {
        _6506 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6526 = _6506;
    float _6528 = -_6514;
    float _6530 = _6528 + 1.0;
    float _6532 = fma(_6530, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6514);
    float _6534 = _6460 * _6532;
    float _6536 = _6534 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6538 = -_6385;
    float _6540 = _6538 + 1.0;
    float _6542 = _6540 * _6536;
    float _6544 = precise::clamp(_6542, 0.0, 1.0);
    float _6546 = -_6544;
    float _6548 = fma(_6546, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6550 = _6526;
    float _6552 = _6526;
    if (!_6442)
    {
        _6508 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6554 = _6508;
    float _6556 = _6482 * _6401;
    float _6558 = _6548 * _6446;
    float _6560 = _6412 * _6500;
    float _6562 = _6554;
    float _6564 = _6554;
    if (!_6442)
    {
        _6510 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6566 = _6510;
    float _6568 = _6412 * _6556;
    float _6570 = _6558 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6572 = _6424 * _6556;
    float _6574 = fma(_6420, _6568, _6406);
    float _6576 = fma(_6422, _6568, _6408);
    out.m_107.x = _6570;
    float _6578 = fma(_6412, _6572, _6410);
    float _6580 = _6568;
    float _6582 = _6566;
    float _6584 = _6566;
    if (!_6442)
    {
        _6580 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6586 = _6580;
    out.m_109.x = _6574;
    out.m_109.y = _6576;
    out.m_109.z = _6578;
    out.m_109.w = _6560;
    bool _6588 = !_6442;
    float _6590 = _6586;
    float _6592 = _6586;
    if (!_6588)
    {
        bool _6594 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6596 = isnan(_6187);
        bool _6598 = _6594 || _6596;
        bool _6600 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6602 = _6598 || _6600;
        if (!_6602)
        {
            float _6604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6606 = _6187 + _6604;
            float _6608 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6610 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6608;
            float _6612 = 1.0 / _6610;
            float _6614 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6616 = _6614 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6618 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6620 = _6618 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6622 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6624 = _6622 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6626 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6628 = _6626 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6630 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6632 = _6630 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6634 = _6606 * _6612;
            float _6636 = precise::clamp(_6634, 0.0, 1.0);
            float _6638 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6640 = _6638 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6642 = fma(_6636, _6620, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6644 = fma(_6636, _6640, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6646 = fma(_6636, _6616, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6648 = fma(_6636, _6624, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6650 = fma(_6636, _6628, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6652 = fma(_6636, _6632, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6584 = _6646;
            _6518 = _6650;
            _6552 = _6644;
            _6564 = _6648;
            _6592 = _6642;
            _6524 = _6652;
            _6654 = true;
        }
        else
        {
            bool _6656 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6658 = isnan(_6187);
            bool _6660 = _6656 || _6658;
            bool _6662 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6664 = _6660 || _6662;
            if (!_6664)
            {
                _6562 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6666 = _6562;
            _6564 = _6666;
            if (!_6664)
            {
                _6516 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6668 = _6516;
            _6518 = _6668;
            if (!_6664)
            {
                _6522 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6670 = _6522;
            _6524 = _6670;
            if (!_6664)
            {
                _6550 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6672 = _6550;
            _6552 = _6672;
            if (!_6664)
            {
                _6582 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6674 = _6582;
            _6584 = _6674;
            if (!_6664)
            {
                _6590 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6676 = _6590;
            bool _6678 = !_6664;
            _6592 = _6676;
            if (!_6678)
            {
                bool _6680 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6682 = isnan(_6187);
                bool _6684 = _6680 || _6682;
                bool _6686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6688 = _6684 || _6686;
                if (!_6688)
                {
                    float _6690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6692 = _6187 + _6690;
                    float _6694 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6696 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6694;
                    float _6698 = 1.0 / _6696;
                    float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6708 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6710 = _6708 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6712 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6714 = _6712 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6716 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6718 = _6716 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6720 = _6692 * _6698;
                    float _6722 = precise::clamp(_6720, 0.0, 1.0);
                    float _6724 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6726 = _6724 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6728 = fma(_6722, _6706, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6730 = fma(_6722, _6726, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6732 = fma(_6722, _6702, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6734 = fma(_6722, _6710, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6736 = fma(_6722, _6714, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6738 = fma(_6722, _6718, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6584 = _6732;
                    _6518 = _6736;
                    _6552 = _6730;
                    _6564 = _6734;
                    _6592 = _6728;
                    _6524 = _6738;
                    _6654 = true;
                }
                else
                {
                    _6584 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6518 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6552 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6564 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6592 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6524 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6654 = false;
    float _6740 = _6584;
    float _6742 = _6518;
    float _6744 = _6552;
    float _6746 = _6564;
    float _6748 = _6592;
    float _6750 = _6524;
    float _6752 = _6492 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6754 = fma(_5673, -0.5, 0.5);
    float _6756 = precise::clamp(_6754, 0.0, 1.0);
    float _6758 = -_6740;
    float _6760 = _6742 + _6758;
    float _6762 = -_6744;
    float _6764 = _6746 + _6762;
    out.m_53.x = _6752;
    float _6766 = -_6748;
    float _6768 = _6750 + _6766;
    float _6770 = fma(_6756, _6760, _6740);
    float _6772 = fma(_6756, _6764, _6744);
    bool _6774 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6776 = _6770 * 0.586610972881317138671875;
    float _6778 = fma(_6756, _6768, _6748);
    out.m_111.x = 0.0;
    bool _6780 = _6071 > 0.0;
    bool _6782 = isnan(_6071);
    bool _6784 = _6780 || _6782;
    bool _6786 = isnan(0.0);
    bool _6788 = _6784 || _6786;
    float _6790 = fma(_6772, 0.298911988735198974609375, _6776);
    float _6792 = fma(_6778, 0.114477999508380889892578125, _6790);
    float _6794 = -_6792;
    float _6796 = _6772 + _6794;
    float _6798 = -_6792;
    float _6800 = _6770 + _6798;
    float _6802 = -_6792;
    float _6804 = _6778 + _6802;
    float _6806 = fma(_6796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6792);
    float _6808 = fma(_6800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6792);
    float _6810 = fma(_6804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6792);
    bool _6812 = !_6774;
    if (!_6812)
    {
        float _6814 = -_6017;
        float _6816 = _6814 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6818 = -_6019;
        float _6820 = _6818 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6822 = -_6021;
        float _6824 = _6822 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6826 = _6816 * _6816;
        float _6828 = fma(_6820, _6820, _6826);
        float _6830 = fma(_6824, _6824, _6828);
        float _6832 = sqrt(_6830);
        float _6834 = rsqrt(_6830);
        float _6836 = -_6832;
        float _6838 = _6836 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6840 = _6838 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6842 = precise::clamp(_6840, 0.0, 1.0);
        float _6844 = _6820 * _6834;
        float _6846 = _6816 * _6834;
        float _6848 = abs(_6842);
        float _6850 = log2(_6848);
        float _6852 = _6824 * _6834;
        float _6854 = _6844 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6856 = _5673 * _6846;
        float _6858 = -_6846;
        float _6860 = -_6854;
        float _6862 = fma(_6858, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6860);
        float _6864 = fma(_5677, _6844, _6856);
        float _6866 = -_6852;
        float _6868 = fma(_6866, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6862);
        float _6870 = fma(_5685, _6852, _6864);
        float _6872 = precise::clamp(_6870, 0.0, 1.0);
        float _6874 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6876 = _6868 + _6874;
        float _6878 = _6850 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6880 = _6876 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6882 = precise::clamp(_6880, 0.0, 1.0);
        float _6884 = exp2(_6878);
        float _6886 = _6884 * _6882;
        float _6888 = _6872 * _6886;
        float _6890 = _6888 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6892 = _6888 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6894 = _6888 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _6890;
        out.m_111.y = _6892;
        out.m_111.z = _6894;
    }
    out.m_113.x = _6806;
    out.m_113.y = _6808;
    out.m_113.z = _6810;
    if (_6788)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _6896 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6896;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6654 = false;
    bool _5735 = false;
    bool _1070 = false;
    bool _890 = false;
    bool _710 = false;
    bool _584 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6953 = as_type<float>(_148);
        out.gl_Position.z = _6953;
    }
    if (!_136)
    {
        return out;
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7023 = as_type<float>(_186);
        out.gl_Position.z = _7023;
    }
    if (_178)
    {
        return out;
    }
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_59.x;
    float _198 = in.m_59.y;
    float _200 = in.m_59.z;
    float _202 = in.m_61.x;
    float _204 = in.m_61.y;
    float _206 = in.m_61.z;
    float _208 = in.m_63.x;
    float _210 = in.m_63.y;
    float _212 = in.m_63.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_65.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _166 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = 1.0 / _268;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _284;
    bool _288 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _290 = isnan(_260);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = 1.0 / _276;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _260 + _302;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _308 = 1.0 / _272;
    float _310 = _304 * _282;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = _260 + _312;
    float _316 = 1.0 / _280;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _260 + _318;
    float _322 = _314 * _300;
    bool _324 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _326 = isnan(_260);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    bool _336 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_260);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _286;
    float _350 = _264 * _308;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _354 = _260 + _352;
    bool _356 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_260);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _320 * _316;
    float _370 = -_298;
    float _372 = _370 + 1.0;
    float _374 = -_334;
    float _376 = _374 + 1.0;
    float _378 = -_366;
    float _380 = _378 + 1.0;
    float _382 = _334 * _372;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = _354 * _348;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _394;
    float _398 = fma(_386, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_390, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = _346 * _380;
    float _404 = fma(_396, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _406 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _408 = isnan(_260);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -_346;
    float _420 = _418 + 1.0;
    float _422 = _366 * _376;
    bool _424 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _426 = isnan(_260);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = _416 * _420;
    float _442 = -_416;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = fma(_438, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = _434 * _444;
    float _454 = -_434;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = fma(_448, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = _398 * _452;
    float _466 = _400 * _452;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _468;
    float _472 = _404 * _452;
    float _474 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _464);
    float _476 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _478 = fma(_470, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _480 = fma(_460, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _482 = fma(_450, _440, _474);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _472);
    float _494 = fma(_462, _440, _476);
    float _496 = fma(_478, _402, _482);
    float _498 = fma(_486, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _504 = fma(_490, _322, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_480, _440, _492);
    float _516 = fma(_498, _402, _494);
    float _518 = fma(_502, _368, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _520 = fma(_508, _368, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _522 = fma(_512, _368, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _524 = fma(_504, _402, _514);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _534;
    float _538 = fma(_518, _422, _496);
    float _540 = fma(_528, _392, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _542 = fma(_532, _392, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _544 = fma(_536, _392, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _546 = fma(_520, _422, _516);
    float _548 = fma(_522, _422, _524);
    float _550 = fma(_540, _382, _538);
    float _552 = fma(_542, _382, _546);
    float _554 = fma(_544, _382, _548);
    float _556 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[148].x, _550);
    float _558 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[148].y, _552);
    float _560 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[148].z, _554);
    bool _562 = !_306;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _582;
    if (!_562)
    {
        float _566 = in.m_65.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[11].x, _166);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_132);
        float _588 = 1.0 / _586;
        float _590 = _166 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = in.m_67.x;
    float _596 = in.m_67.y;
    float _598 = in.m_67.z;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _602 = _592 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _604;
    bool _608 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _610 = 1.0 / _606;
    float _612 = _560 * _598;
    bool _614 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _616 = isnan(_592);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _602 * _610;
    float _628 = _558 * _596;
    bool _630 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _632 = isnan(_592);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -_624;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _654;
    float _658 = _640 * _644;
    float _660 = fma(_648, _626, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _662 = fma(_652, _626, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _664 = fma(_656, _626, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _666 = -_640;
    float _668 = _666 + 1.0;
    float _670 = _660 * _658;
    float _672 = _662 * _658;
    float _674 = _664 * _658;
    float _676 = _556 * _594;
    float _678 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[107].y, _670);
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[107].x, _672);
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[107].z, _674);
    float _684 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[108].y, _678);
    float _686 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[108].x, _680);
    float _688 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[108].z, _682);
    bool _690 = !_608;
    float _708;
    if (!_690)
    {
        float _692 = in.m_65.x;
        float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _696 = _692 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _700 = _698 * _694;
        float _702 = floor(_700);
        float _704 = -_702;
        float _706 = _700 + _704;
        _708 = _706;
        _710 = true;
    }
    else
    {
        float _712 = float(_132);
        float _714 = 1.0 / _712;
        float _716 = _166 * _714;
        _708 = _716;
    }
    _710 = false;
    float _718 = _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _722 = _718 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _728 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _730 = isnan(_718);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _748 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _750 = isnan(_718);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = 1.0 / _726;
    float _762 = -_738;
    float _764 = _762 + 1.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _766;
    bool _770 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _772 = isnan(_718);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _758 * _764;
    float _784 = -_758;
    float _786 = _784 + 1.0;
    bool _788 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _790 = 1.0 / _742;
    float _792 = _780 * _786;
    float _794 = -_780;
    float _796 = _794 + 1.0;
    float _798 = 1.0 / _746;
    float _800 = _768 * _760;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _806 = fma(_800, _722, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _808 = _804 * _790;
    bool _810 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _812 = isnan(_718);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _828 = _718 + _826;
    float _830 = _806 * _792;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _834 = _718 + _832;
    float _836 = -_820;
    float _838 = _836 + 1.0;
    float _840 = fma(_808, _828, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _842 = _824 * _798;
    float _844 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[115].x, _830);
    float _846 = _738 * _838;
    float _848 = _686 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _850 = fma(_842, _834, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _852 = fma(_840, _782, _844);
    float _854 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _856 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = fma(_850, _846, _852);
    float _860 = _684 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _862 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[118].x, _858);
    float _866 = _860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _856;
    out.m_69.y = _866;
    out.m_69.z = _862;
    out.m_69.w = _868;
    bool _870 = !_788;
    float _888;
    if (!_870)
    {
        float _872 = in.m_65.x;
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _876 = _872 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _880 = _878 * _874;
        float _882 = floor(_880);
        float _884 = -_882;
        float _886 = _880 + _884;
        _888 = _886;
        _890 = true;
    }
    else
    {
        float _892 = float(_132);
        float _894 = 1.0 / _892;
        float _896 = _166 * _894;
        _888 = _896;
    }
    _890 = false;
    float _898 = _888;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _898 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _908 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _910 = isnan(_898);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _928 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _930 = isnan(_898);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = 1.0 / _906;
    float _942 = -_918;
    float _944 = _942 + 1.0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _946;
    bool _950 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _952 = isnan(_898);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = _938 * _944;
    float _964 = -_938;
    float _966 = _964 + 1.0;
    bool _968 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _970 = 1.0 / _922;
    float _972 = _960 * _966;
    float _974 = -_960;
    float _976 = _974 + 1.0;
    float _978 = 1.0 / _926;
    float _980 = _948 * _940;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _986 = fma(_980, _902, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _988 = _984 * _970;
    bool _990 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _992 = isnan(_898);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1008 = _898 + _1006;
    float _1010 = _986 * _972;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1014 = _898 + _1012;
    float _1016 = -_1000;
    float _1018 = _1016 + 1.0;
    float _1020 = fma(_988, _1008, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1022 = _1004 * _978;
    float _1024 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1010);
    float _1026 = _918 * _1018;
    float _1028 = fma(_1022, _1014, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1030 = fma(_1020, _962, _1024);
    float _1032 = fma(_1028, _1026, _1030);
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1040 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1032);
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _1042;
    out.m_71.y = _1044;
    out.m_71.z = _1046;
    out.m_71.w = _1048;
    bool _1050 = !_968;
    float _1068;
    if (!_1050)
    {
        float _1052 = in.m_65.x;
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1056 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _1060 = _1058 * _1054;
        float _1062 = floor(_1060);
        float _1064 = -_1062;
        float _1066 = _1060 + _1064;
        _1068 = _1066;
        _1070 = true;
    }
    else
    {
        float _1072 = float(_132);
        float _1074 = 1.0 / _1072;
        float _1076 = _166 * _1074;
        _1068 = _1076;
    }
    _1070 = false;
    float _1078 = _1068;
    float _1080 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1082 = int(_1080);
    float _1084 = in.m_65.y;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1088 = _1086 != 0;
    float _1090 = in.m_73.x;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1094 = _1092 != 0;
    float _1096 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1098 = int(_1096);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1106 = _1104 != 0;
    float _1108 = 0.0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _1112 = _1102;
    bool _1114 = _1106;
    if (_1088)
    {
        _1108 = 1.0;
    }
    float _1116 = _1108;
    float _1118 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1120 = int(_1118);
    float _1122 = float(_1082);
    float _1124 = 0.0;
    float _1126 = _1116;
    if (_1088)
    {
        _1124 = 1.0;
    }
    float _1128 = _1124;
    float _1130 = 0.0;
    float _1132 = _1128;
    if (_1088)
    {
        _1130 = 1.0;
    }
    float _1134 = _1130;
    int _1136 = 0;
    float _1138 = _1134;
    if (_1088)
    {
        _1136 = 0;
    }
    int _1140 = _1136;
    float _1142 = _1048;
    int _1144 = _1140;
    if (_1088)
    {
        float _1146 = in.m_65.z;
        _1142 = _1146;
    }
    float _1148 = _1142;
    float _1150 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1152 = int(_1150);
    float _1154 = float(_1098);
    if (_1088)
    {
        _1110 = 0;
    }
    int _1156 = _1110;
    bool _1158 = _1084 > 0.5;
    float _1160 = 0.0;
    int _1162 = _1156;
    float _1164 = _1090;
    if (!_1106)
    {
        _1160 = _1090;
    }
    float _1166 = _1160;
    float _1168 = _1166;
    if (_1102)
    {
        float _1170 = -_1090;
        float _1172 = _1170 + 1.0;
        _564 = as_type<int>(_1172);
    }
    int _1174 = _564;
    float _1176 = 0.0;
    if (!_1102)
    {
        _1176 = _1090;
    }
    float _1178 = _1176;
    float _1180 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1182 = int(_1180);
    float _1184 = float(_1120);
    float _1186 = _1178;
    if (_1102)
    {
        float _1188 = _1158 ? as_type<float>(_1174) : _1090;
        _1186 = _1188;
    }
    float _1190 = _1186;
    int _1192 = 0;
    if (_1088)
    {
        _1192 = as_type<int>(_1084);
    }
    int _1194 = _1192;
    float _1196 = 1.0 / _1122;
    int _1198 = 0;
    float _1200 = _1148;
    int _1202 = _1194;
    if (_1088)
    {
        _1198 = as_type<int>(_1148);
    }
    int _1204 = _1198;
    float _1206 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1208 = int(_1206);
    float _1210 = float(_1152);
    float _1212 = float(uint(_1182));
    float _1214 = 1.0 / _1154;
    float _1216 = _1196 * _166;
    float _1218 = 1.0 / _1184;
    float _1220 = float(uint(_1208));
    float _1222 = 1.0 / _1210;
    float _1224 = _1214 * _166;
    float _1226 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1228 = int(_1226);
    float _1230 = _1218 * _166;
    float _1232 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1234 = int(_1232);
    float _1236 = _1222 * _166;
    float _1238 = 1.0 / _1212;
    float _1240 = float(uint(_1228));
    float _1242 = trunc(_1216);
    int _1244 = int(_1242);
    float _1246 = float(uint(_1234));
    float _1248 = 1.0 / _1220;
    int _1250 = as_type<int>(_1238) + (-2);
    float _1252 = 1.0 / _1246;
    float _1254 = float(uint(_1244));
    float _1256 = as_type<float>(_1250) * _1254;
    float _1258 = trunc(_1230);
    int _1260 = int(_1258);
    int _1262 = as_type<int>(_1248) + (-2);
    float _1264 = _1248;
    int _1266 = _1204;
    if (_1088)
    {
        float _1268 = in.m_65.x;
        _1264 = _1268;
    }
    float _1270 = _1264;
    float _1272 = trunc(_1236);
    int _1274 = int(_1272);
    int _1276 = as_type<int>(_1252) + (-2);
    float _1278 = 1.0 / _1240;
    float _1280 = float(uint(_1260));
    float _1282 = as_type<float>(_1262) * _1280;
    float _1284 = trunc(_1224);
    int _1286 = int(_1284);
    float _1288 = trunc(_1256);
    float _1290 = precise::max(_1288, 0.0);
    uint _1293 = uint(_1290);
    int _1295 = as_type<int>(_1278) + (-2);
    float _1297 = float(uint(_1286));
    float _1299 = trunc(_1282);
    float _1301 = precise::max(_1299, 0.0);
    uint _1303 = uint(_1301);
    float _1305 = float(uint(_1274));
    float _1307 = as_type<float>(_1295) * _1297;
    float _1309 = _1297;
    int _1311 = as_type<int>(_1307);
    float _1313 = _1305;
    if (!_1094)
    {
        _1309 = _1090;
    }
    float _1315 = _1309;
    float _1317 = as_type<float>(_1276) * _1305;
    float _1319 = trunc(_1307);
    float _1321 = precise::max(_1319, 0.0);
    uint _1323 = uint(_1321);
    float _1325 = trunc(_1317);
    float _1327 = precise::max(_1325, 0.0);
    uint _1329 = uint(_1327);
    float _1331 = _1315;
    if (_1106)
    {
        float _1333 = -_1090;
        float _1335 = _1333 + 1.0;
        _1311 = as_type<int>(_1335);
    }
    int _1337 = _1311;
    float _1339 = as_type<float>(_1337);
    if (_1106)
    {
        float _1341 = _1158 ? as_type<float>(_1337) : _1090;
        _1168 = _1341;
    }
    float _1343 = _1168;
    float _1345 = _1270;
    if (_1088)
    {
        _1339 = _1270;
    }
    float _1347 = _1339;
    float _1349 = _1347;
    if (_1088)
    {
        _1313 = _1347;
    }
    float _1351 = _1313;
    int _1353 = 0;
    float _1355 = _1351;
    if (_1088)
    {
        _1353 = as_type<int>(_1347);
    }
    int _1357 = _1353;
    int _1359 = _1357;
    if (!_1088)
    {
        float _1361 = in.m_65.x;
        float _1363 = _1084 * 3.1415927410125732421875;
        float _1365 = in.m_65.z;
        float _1367 = _1363 * 0.15915493667125701904296875;
        float _1369 = _1367 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1361 * 3.1415927410125732421875;
        float _1375 = _1373 * 0.15915493667125701904296875;
        float _1377 = _1365 * 3.1415927410125732421875;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = _1375 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = sin(_1385);
        _1355 = _1365;
        _1138 = 5.839270114898681640625;
        _1349 = _1084;
        _1132 = 1.2345600128173828125;
        _1345 = _1361;
        _1126 = 7.345489978790283203125;
        _1144 = 1;
        _1200 = _1365;
        _1162 = 2;
        _1202 = as_type<int>(_1371);
        _1359 = as_type<int>(_1383);
        _1266 = as_type<int>(_1387);
    }
    float _1389 = _1355;
    float _1391 = _1138;
    float _1393 = _1349;
    float _1395 = _1132;
    float _1397 = _1345;
    float _1399 = _1126;
    int _1401 = _1144;
    float _1403 = _1200;
    int _1405 = _1162;
    int _1407 = _1202;
    int _1409 = _1359;
    int _1411 = _1266;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    float _1417 = _1389 * _1391;
    int _1419 = ~_1182;
    int _1421 = _1419 + 1;
    float _1423 = 0.0;
    if (_1094)
    {
        float _1425 = in.m_65.x;
        _1423 = _1425;
    }
    float _1427 = _1423;
    float _1429 = _1393 * _1395;
    int _1431 = ~_1228;
    int _1433 = _1431 + 1;
    float _1435 = _1397 * _1399;
    int _1437 = _1421 * int(_1293);
    int _1439 = _1437 + _1244;
    float _1441 = floor(_1429);
    int _1443 = ~_1208;
    int _1445 = _1443 + 1;
    int _1447 = _1433 * int(_1323);
    int _1449 = _1447 + _1286;
    float _1451 = _1393 * _1399;
    float _1453 = float(uint(_1439));
    int _1455 = as_type<int>(_1389);
    if (_1415)
    {
        float _1457 = in.m_65.z;
        _1455 = as_type<int>(_1457);
    }
    int _1459 = _1455;
    int _1461 = ~_1234;
    int _1463 = _1461 + 1;
    int _1465 = 0;
    if (_1415)
    {
        float _1467 = -_1090;
        float _1469 = _1467 + 1.0;
        _1465 = as_type<int>(_1469);
    }
    int _1471 = _1465;
    float _1473 = float(uint(_1449));
    float _1475 = as_type<float>(_1250) * _1453;
    int _1477 = _1445 * int(_1303);
    int _1479 = _1477 + _1260;
    float _1481 = floor(_1435);
    int _1483 = _1463 * int(_1329);
    int _1485 = _1483 + _1274;
    float _1487 = as_type<float>(_1295) * _1473;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1491 = _1489 != 0;
    float _1493 = in.m_73.y;
    float _1495 = float(uint(_1479));
    bool _1497 = _1401 != 1;
    float _1499 = float(uint(_1485));
    float _1501 = trunc(_1475);
    float _1503 = precise::max(_1501, 0.0);
    uint _1505 = uint(_1503);
    float _1507 = _1475;
    float _1509 = _1495;
    if (_1094)
    {
        bool _1511 = _1427 > 0.5;
        _1112 = _1511;
    }
    bool _1513 = _1112;
    float _1515 = as_type<float>(_1262) * _1495;
    float _1517 = as_type<float>(_1276) * _1499;
    float _1519 = in.m_61.w;
    bool _1521 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1523 = isnan(_1078);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1529 = _1525 || _1527;
    float _1531 = float(_1529);
    float _1533 = trunc(_1487);
    float _1535 = precise::max(_1533, 0.0);
    uint _1537 = uint(_1535);
    float _1539 = -_1481;
    float _1541 = _1435 + _1539;
    int _1543 = _1459;
    if (_1415)
    {
        bool _1545 = as_type<float>(_1459) > 0.5;
        _1114 = _1545;
    }
    bool _1547 = _1114;
    if (_1094)
    {
        float _1549 = -_1090;
        float _1551 = _1549 + 1.0;
        _1543 = as_type<int>(_1551);
    }
    int _1553 = _1543;
    float _1555 = float(_1208);
    int _1557 = 0;
    if (_1491)
    {
        float _1559 = -_1090;
        float _1561 = _1559 + 1.0;
        _1557 = as_type<int>(_1561);
    }
    int _1563 = _1557;
    if (!_1415)
    {
        _1507 = _1090;
    }
    float _1565 = _1507;
    float _1567 = in.m_59.w;
    float _1569 = _1565;
    if (_1094)
    {
        float _1571 = _1513 ? as_type<float>(_1553) : _1090;
        _1331 = _1571;
    }
    float _1573 = _1331;
    float _1575 = -_1441;
    float _1577 = _1429 + _1575;
    float _1579 = float(_132);
    float _1581 = floor(_1417);
    int _1583 = int(_1293) + int(_1505);
    float _1585 = in.m_63.w;
    float _1587 = float(_1182);
    float _1589 = float(_1244);
    float _1591 = float(_1228);
    float _1593 = floor(_1451);
    bool _1595 = _1589 >= _1587;
    bool _1597 = isnan(_1589);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan(_1587);
    bool _1603 = _1599 || _1601;
    float _1605 = float(_1603);
    if (_1415)
    {
        float _1607 = _1547 ? as_type<float>(_1471) : _1090;
        _1569 = _1607;
    }
    float _1609 = _1569;
    int _1611 = ~_1208;
    int _1613 = _1611 + 1;
    if (!_1491)
    {
        _1509 = _1090;
    }
    float _1615 = _1509;
    float _1617 = trunc(_1515);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    float _1623 = -_1581;
    float _1625 = _1417 + _1623;
    float _1627 = float(_1260);
    float _1629 = _1591 * _1577;
    float _1631 = float(_1274);
    float _1633 = _1555 * _1625;
    bool _1635 = _1627 >= _1555;
    bool _1637 = isnan(_1627);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan(_1555);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = 1.0 / _1579;
    float _1649 = -_1593;
    float _1651 = _1451 + _1649;
    int _1653 = int(_1323) + int(_1537);
    float _1655 = float(_1234);
    int _1657 = ~_1228;
    int _1659 = _1657 + 1;
    float _1661 = trunc(_1517);
    float _1663 = precise::max(_1661, 0.0);
    uint _1665 = uint(_1663);
    float _1667 = _1541 * _1587;
    float _1669 = _1587 * _166;
    float _1671 = float(_1286);
    int _1673 = _1659 * _1653;
    int _1675 = _1673 + _1286;
    bool _1677 = _1631 >= _1655;
    bool _1679 = isnan(_1631);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan(_1655);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    bool _1689 = _1671 >= _1591;
    bool _1691 = isnan(_1671);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan(_1591);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1669 * _1647;
    int _1703 = int(_1303) + int(_1621);
    float _1705 = _1647 * _166;
    int _1707 = ~_1182;
    int _1709 = _1707 + 1;
    float _1711 = trunc(_1605);
    int _1713 = int(_1711);
    bool _1715 = uint(_1675) >= uint(_1228);
    float _1717 = _1591 * _1705;
    float _1719 = _1555 * _1705;
    float _1721 = _1655 * _1705;
    int _1723 = _1709 * _1583;
    int _1725 = _1723 + _1244;
    float _1727 = _1655 * _1651;
    int _1729 = _1613 * _1703;
    int _1731 = _1729 + _1260;
    float _1733 = trunc(_1629);
    int _1735 = int(_1733);
    int _1737 = int(_1329) + int(_1665);
    bool _1739 = uint(_1725) >= uint(_1182);
    bool _1741 = uint(_1731) >= uint(_1208);
    bool _1743 = !_1739;
    int _1745 = _1743 ? 0 : (-1);
    float _1747 = trunc(_1667);
    int _1749 = int(_1747);
    int _1751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1753 = _1751 != 0;
    int _1755 = ~_1583;
    int _1757 = _1755 + _1745;
    int _1759 = _1757 + 1;
    bool _1761 = !_1753;
    int _1763 = _1761 ? 0 : 1;
    int _1765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1767 = _1765 != 0;
    float _1769 = trunc(_1699);
    int _1771 = int(_1769);
    int _1773 = ~_1234;
    int _1775 = _1773 + 1;
    bool _1777 = !_1715;
    int _1779 = _1777 ? 0 : (-1);
    int _1781 = abs(_1763);
    int _1783 = _1775 * _1737;
    int _1785 = _1783 + _1274;
    int _1787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1789 = _1787 != 0;
    float _1791 = trunc(_1633);
    int _1793 = int(_1791);
    bool _1795 = !_1767;
    int _1797 = _1795 ? 0 : 1;
    int _1799 = _1749 * _1781;
    int _1801 = _1799 + _1244;
    int _1803 = ~_1653;
    int _1805 = _1803 + _1779;
    int _1807 = _1805 + 1;
    bool _1809 = !_1789;
    int _1811 = _1809 ? 0 : 1;
    int _1813 = abs(_1797);
    int _1815 = _1182 * _1759;
    int _1817 = _1815 + _1244;
    float _1819 = _1615;
    float _1821 = as_type<float>(_1801);
    if (_1491)
    {
        float _1823 = _1158 ? as_type<float>(_1563) : _1090;
        _1819 = _1823;
    }
    float _1825 = _1819;
    float _1827 = trunc(_1645);
    int _1829 = int(_1827);
    bool _1831 = _1182 == 0;
    int _1833 = _1735 * _1813;
    int _1835 = _1833 + _1286;
    int _1837 = abs(_1811);
    int _1839 = _1228 * _1807;
    int _1841 = _1839 + _1286;
    bool _1843 = uint(_1785) >= uint(_1234);
    bool _1845 = !_1741;
    int _1847 = _1845 ? 0 : (-1);
    float _1849 = trunc(_1701);
    int _1851 = int(_1849);
    int _1853 = ~_1713;
    int _1855 = _1853 + 1;
    int _1857 = _1855 + 1;
    bool _1859 = !_1831;
    int _1861 = _1859 ? _1817 : (-1);
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1865 = _1863 != 0;
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1869 = _1867 != 0;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1873 = _1871 != 0;
    int _1875 = _1861 * _1857;
    int _1877 = ~_1703;
    int _1879 = _1877 + _1847;
    int _1881 = _1879 + 1;
    int _1883 = _1793 * _1837;
    int _1885 = _1883 + _1260;
    bool _1887 = !_1843;
    int _1889 = _1887 ? 0 : (-1);
    float _1891 = trunc(_1687);
    int _1893 = int(_1891);
    int _1895 = _1182 + (-1);
    int _1897 = _1208 * _1881;
    int _1899 = _1897 + _1260;
    bool _1901 = !_1869;
    int _1903 = _1901 ? 0 : 1;
    bool _1905 = _1228 == 0;
    int _1907 = _1713 * _1895;
    int _1909 = _1907 + _1875;
    bool _1911 = !_1865;
    int _1913 = _1911 ? 0 : 1;
    float _1915 = trunc(_1717);
    int _1917 = int(_1915);
    int _1919 = ~_1737;
    int _1921 = _1919 + _1889;
    int _1923 = _1921 + 1;
    bool _1925 = _1208 == 0;
    int _1927 = abs(_1903);
    int _1929 = ~_1771;
    int _1931 = _1929 + 1;
    int _1933 = _1931 + 1;
    bool _1935 = !_1905;
    int _1937 = _1935 ? _1841 : (-1);
    int _1939 = _1909 * _1927;
    int _1941 = abs(_1913);
    int _1943 = _1234 * _1923;
    int _1945 = _1943 + _1274;
    int _1947 = ~_1829;
    int _1949 = _1947 + 1;
    int _1951 = _1949 + 1;
    int _1953 = _1933 * _1937;
    bool _1955 = !_1925;
    int _1957 = _1955 ? _1899 : (-1);
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1961 = _1959 != 0;
    int _1963 = _1951 * _1957;
    bool _1965 = !_1873;
    int _1967 = _1965 ? 0 : 1;
    int _1969 = _1851 * _1941;
    int _1971 = _1969 + _1939;
    bool _1973 = !_1961;
    int _1975 = _1973 ? 0 : 1;
    bool _1977 = _1234 == 0;
    int _1979 = abs(_1967);
    int _1981 = abs(_1975);
    int _1983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1985 = _1983 != 0;
    int _1987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1989 = _1987 != 0;
    int _1991 = _1801 * _1979;
    int _1993 = _1991 + _1971;
    int _1995 = ~_1893;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    bool _2001 = !_1977;
    int _2003 = _2001 ? _1945 : (-1);
    int _2005 = _1749 * _1981;
    int _2007 = _2005 + _1993;
    int _2009 = _1228 + (-1);
    bool _2011 = !_1989;
    int _2013 = _2011 ? 0 : 1;
    int _2015 = _1999 * _2003;
    float _2017 = float(uint(_2007));
    int _2019 = _1771 * _2009;
    int _2021 = _2019 + _1953;
    int _2023 = abs(_2013);
    bool _2025 = !_1985;
    int _2027 = _2025 ? 0 : 1;
    float _2029 = as_type<float>(_1250) * _2017;
    int _2031 = _1208 + (-1);
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2035 = _2033 != 0;
    int _2037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2039 = _2037 != 0;
    float _2041 = trunc(_2029);
    float _2043 = precise::max(_2041, 0.0);
    uint _2045 = uint(_2043);
    int _2047 = abs(_2027);
    int _2049 = _1829 * _2031;
    int _2051 = _2049 + _1963;
    int _2053 = _2021 * _2023;
    bool _2055 = !_2035;
    int _2057 = _2055 ? 0 : 1;
    float _2059 = trunc(_1719);
    int _2061 = int(_2059);
    int _2063 = abs(_2057);
    float _2065 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2067 = _2065 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2069 = _1234 + (-1);
    int _2071 = _1917 * _2047;
    int _2073 = _2071 + _2053;
    int _2075 = ~_1182;
    int _2077 = _2075 + 1;
    int _2079 = _1893 * _2069;
    int _2081 = _2079 + _2015;
    bool _2083 = !_2039;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _1835 * _2063;
    int _2089 = _2087 + _2073;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2093 = _2091 != 0;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2097 = _2095 != 0;
    float _2099 = 1.0 / _2067;
    int _2101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2103 = _2101 != 0;
    int _2105 = abs(_2085);
    int _2107 = _2077 * int(_2045);
    int _2109 = _2107 + _2007;
    bool _2111 = !_2103;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = trunc(_1727);
    int _2117 = int(_2115);
    int _2119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2121 = _2119 != 0;
    bool _2123 = !_2097;
    int _2125 = _2123 ? 0 : 1;
    bool _2127 = !_2121;
    int _2129 = _2127 ? 0 : 1;
    float _2131 = float(uint(_2109));
    int _2133 = _1735 * _2105;
    int _2135 = _2133 + _2089;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2139 = _2137 != 0;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2143 = _2141 != 0;
    int _2145 = abs(_2125);
    float _2147 = as_type<float>(_1250) * _2131;
    bool _2149 = !_2093;
    int _2151 = _2149 ? 0 : 1;
    bool _2153 = !_2143;
    int _2155 = _2153 ? 0 : 1;
    int _2157 = _2051 * _2145;
    float _2159 = float(uint(_2135));
    float _2161 = trunc(_2147);
    float _2163 = precise::max(_2161, 0.0);
    uint _2165 = uint(_2163);
    int _2167 = abs(_2151);
    int _2169 = abs(_2155);
    float _2171 = as_type<float>(_1295) * _2159;
    int _2173 = abs(_2113);
    int _2175 = _2061 * _2167;
    int _2177 = _2175 + _2157;
    int _2179 = abs(_2129);
    float _2181 = trunc(_2171);
    float _2183 = precise::max(_2181, 0.0);
    uint _2185 = uint(_2183);
    int _2187 = _2081 * _2169;
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2191 = _2189 != 0;
    int _2193 = _2117 * _2179;
    int _2195 = _2193 + _1274;
    int _2197 = ~_1228;
    int _2199 = _2197 + 1;
    int _2201 = _1885 * _2173;
    int _2203 = _2201 + _2177;
    bool _2205 = !_2191;
    int _2207 = _2205 ? 0 : 1;
    float _2209 = trunc(_1721);
    int _2211 = int(_2209);
    bool _2213 = !_2139;
    int _2215 = _2213 ? 0 : 1;
    float _2217 = -_1493;
    float _2219 = _2217 + 1.0;
    int _2221 = abs(_2207);
    int _2223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2225 = _2223 != 0;
    int _2227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2229 = _2227 != 0;
    int _2231 = int(_2045) + int(_2165);
    int _2233 = _2199 * int(_2185);
    int _2235 = _2233 + _2135;
    int _2237 = abs(_2215);
    int _2239 = ~_1182;
    int _2241 = _2239 + 1;
    float _2243 = float(uint(_2235));
    int _2245 = _1793 * _2221;
    int _2247 = _2245 + _2203;
    bool _2249 = !_2225;
    int _2251 = _2249 ? 0 : 1;
    int _2253 = _2211 * _2237;
    int _2255 = _2253 + _2187;
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2259 = _2257 != 0;
    int _2261 = _2241 * _2231;
    int _2263 = _2261 + _2007;
    int _2265 = abs(_2251);
    float _2267 = as_type<float>(_1295) * _2243;
    float _2269 = float(uint(_2247));
    bool _2271 = uint(_2263) >= uint(_1182);
    float _2273 = trunc(_2267);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    bool _2279 = !_2229;
    int _2281 = _2279 ? 0 : 1;
    float _2283 = as_type<float>(_1262) * _2269;
    bool _2285 = !_2271;
    int _2287 = _2285 ? 0 : (-1);
    int _2289 = abs(_2281);
    float _2291 = trunc(_2283);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _2281;
    if (_2259)
    {
        float _2299 = -_1090;
        float _2301 = _2299 + 1.0;
        _2297 = as_type<int>(_2301);
    }
    int _2303 = _2297;
    int _2305 = _2195 * _2265;
    int _2307 = _2305 + _2255;
    bool _2309 = _1084 > 0.5;
    int _2311 = ~_2231;
    int _2313 = _2311 + _2287;
    int _2315 = _2313 + 1;
    int _2317 = _2117 * _2289;
    int _2319 = _2317 + _2307;
    if (_2259)
    {
        float _2321 = _2309 ? as_type<float>(_2303) : _1090;
        _1164 = _2321;
    }
    float _2323 = _1164;
    bool _2325 = _1182 == 0;
    int _2327 = _1182 * _2315;
    int _2329 = _2327 + _2007;
    float _2331 = float(uint(_2319));
    float _2333 = in.m_65.w;
    int _2335 = ~_1208;
    int _2337 = _2335 + 1;
    bool _2339 = !_2325;
    int _2341 = _2339 ? _2329 : (-1);
    float _2343 = as_type<float>(_1276) * _2331;
    int _2345 = int(_2185) + int(_2277);
    int _2347 = _2337 * int(_2295);
    int _2349 = _2347 + _2247;
    int _2351 = _2341 & 3;
    bool _2353 = _2351 != 0;
    float _2355 = trunc(_2343);
    float _2357 = precise::max(_2355, 0.0);
    uint _2359 = uint(_2357);
    int _2361 = ~_1228;
    int _2363 = _2361 + 1;
    bool _2365 = uint(_2351) > 1u;
    float _2367 = float(uint(_2349));
    int _2369 = _2363 * _2345;
    int _2371 = _2369 + _2135;
    int _2373 = _2341 & 3;
    bool _2375 = _2373 != 0;
    int _2377 = ~_1234;
    int _2379 = _2377 + 1;
    float _2381 = as_type<float>(_1262) * _2367;
    int _2383 = _2375 ? 0 : 1;
    bool _2385 = uint(_2371) >= uint(_1228);
    int _2387 = ~_2383;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    float _2393 = trunc(_2381);
    float _2395 = precise::max(_2393, 0.0);
    uint _2397 = uint(_2395);
    int _2399 = _2391;
    if (!_2365)
    {
        int _2401 = ~_2383;
        int _2403 = _2401 + 1;
        _2399 = _2403;
    }
    int _2405 = _2399;
    int _2407 = _2379 * int(_2359);
    int _2409 = _2407 + _2319;
    bool _2411 = !_2385;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = _2351 != 3;
    bool _2417 = uint(_2351) >= 2u;
    int _2419 = ~_2345;
    int _2421 = _2419 + _2413;
    int _2423 = _2421 + 1;
    int _2425 = _2417 ? 0 : 1;
    float _2427 = float(uint(_2409));
    int _2429 = _1228 * _2423;
    int _2431 = _2429 + _2135;
    int _2433 = _2309 ? as_type<int>(_2219) : as_type<int>(_1493);
    bool _2435 = _2333 > 0.5;
    float _2437 = as_type<float>(_1276) * _2427;
    int _2439 = ~_1208;
    int _2441 = _2439 + 1;
    bool _2443 = _1228 == 0;
    float _2445 = trunc(_2437);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    int _2451 = ~_2425;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = _2455;
    if (_2415)
    {
        int _2459 = ~_2425;
        int _2461 = _2459 + 1;
        _2457 = _2461;
    }
    int _2463 = _2457;
    int _2465 = int(_2295) + int(_2397);
    bool _2467 = !_2443;
    int _2469 = _2467 ? _2431 : (-1);
    int _2471 = _2435 ? as_type<int>(_2219) : as_type<int>(_1493);
    int _2473 = _2441 * _2465;
    int _2475 = _2473 + _2247;
    int _2477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2479 = _2477 != 0;
    int _2481 = _2469 & 3;
    bool _2483 = _2481 != 0;
    bool _2485 = !_2479;
    int _2487 = _2485 ? 0 : 1;
    bool _2489 = uint(_2481) >= 2u;
    int _2491 = _2483 ? 0 : 1;
    bool _2493 = uint(_2475) >= uint(_1208);
    int _2495 = _2489 ? 0 : 1;
    bool _2497 = _2481 != 3;
    bool _2499 = !_2493;
    int _2501 = _2499 ? 0 : (-1);
    int _2503 = ~_1234;
    int _2505 = _2503 + 1;
    bool _2507 = uint(_2481) > 1u;
    int _2509 = ~_2465;
    int _2511 = _2509 + _2501;
    int _2513 = _2511 + 1;
    int _2515 = int(_2359) + int(_2449);
    int _2517 = _1208 * _2513;
    int _2519 = _2517 + _2247;
    bool _2521 = _1208 == 0;
    int _2523 = ~_2495;
    int _2525 = _2523 + 1;
    int _2527 = _2525 + 1;
    int _2529 = _2505 * _2515;
    int _2531 = _2529 + _2319;
    int _2533 = _2527;
    if (_2497)
    {
        int _2535 = ~_2495;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    int _2541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2543 = _2541 != 0;
    int _2545 = ~_2491;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    bool _2551 = !_2521;
    int _2553 = _2551 ? _2519 : (-1);
    int _2555 = _2549;
    if (!_2507)
    {
        int _2557 = ~_2491;
        int _2559 = _2557 + 1;
        _2555 = _2559;
    }
    int _2561 = _2555;
    bool _2563 = uint(_2531) >= uint(_1234);
    bool _2565 = !_2543;
    int _2567 = _2565 ? 0 : 1;
    int _2569 = _2553 & 3;
    bool _2571 = _2569 != 0;
    bool _2573 = !_2563;
    int _2575 = _2573 ? 0 : (-1);
    int _2577 = _2571 ? 0 : 1;
    bool _2579 = uint(_2569) >= 2u;
    bool _2581 = _2569 != 3;
    int _2583 = ~_2515;
    int _2585 = _2583 + _2575;
    int _2587 = _2585 + 1;
    int _2589 = _2579 ? 0 : 1;
    bool _2591 = uint(_2569) > 1u;
    int _2593 = _1234 * _2587;
    int _2595 = _2593 + _2319;
    bool _2597 = _1234 == 0;
    int _2599 = ~_2589;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    bool _2605 = !_2597;
    int _2607 = _2605 ? _2595 : (-1);
    int _2609 = _2603;
    if (_2581)
    {
        int _2611 = ~_2589;
        int _2613 = _2611 + 1;
        _2609 = _2613;
    }
    int _2615 = _2609;
    int _2617 = _2607 & 3;
    bool _2619 = _2617 != 0;
    int _2621 = ~_2577;
    int _2623 = _2621 + 1;
    int _2625 = _2623 + 1;
    int _2627 = _2625;
    if (!_2591)
    {
        int _2629 = ~_2577;
        int _2631 = _2629 + 1;
        _2627 = _2631;
    }
    int _2633 = _2627;
    bool _2635 = uint(_2617) >= 2u;
    int _2637 = _2619 ? 0 : 1;
    int _2639 = _2635 ? 0 : 1;
    bool _2641 = _2617 != 3;
    bool _2643 = uint(_2617) > 1u;
    int _2645 = ~_2639;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = ~_2637;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    float _2657 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2659 = _2657 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2661 = _2649;
    int _2663 = _2655;
    if (_2641)
    {
        int _2665 = ~_2639;
        int _2667 = _2665 + 1;
        _2661 = _2667;
    }
    int _2669 = _2661;
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2673 = _2671 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    if (!_2643)
    {
        int _2675 = ~_2637;
        int _2677 = _2675 + 1;
        _2663 = _2677;
    }
    int _2679 = _2663;
    float _2681 = 1.0 / _2659;
    float _2683 = in.m_50.x;
    float _2685 = in.m_50.y;
    float _2687 = in.m_50.z;
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2691 = _2689 != 0;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2699 = _2697 != 0;
    bool _2701 = !_2691;
    int _2703 = _2701 ? 0 : 1;
    float _2705 = _2699 ? as_type<float>(_2433) : _1493;
    float _2707 = 1.0 / _2673;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2711 = _2709 != 0;
    bool _2713 = _1403 > 0.5;
    float _2715 = _2711 ? as_type<float>(_2471) : _1493;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2719 = _2717 != 0;
    float _2721 = 1.0 / _2695;
    int _2723 = _2713 ? as_type<int>(_2219) : as_type<int>(_1493);
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2727 = _2725 != 0;
    float _2729 = _2719 ? as_type<float>(_2723) : _1493;
    float _2731 = _2727 ? as_type<float>(_2723) : _1493;
    float _2733 = _198 * _2685;
    int _2735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2737 = _2735 != 0;
    int _2739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2741 = _2739 != 0;
    float _2743 = _204 * _2685;
    int _2745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2747 = _2745 != 0;
    float _2749 = _210 * _2685;
    float _2751 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2753 = fma(_196, _2683, _2733);
    float _2755 = fma(_208, _2683, _2749);
    float _2757 = fma(_202, _2683, _2743);
    float _2759 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2761 = _2759 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2763 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2765 = fma(_200, _2687, _2753);
    float _2767 = fma(_2751, -2.0, _2763);
    float _2769 = _1397 * 2.0;
    float _2771 = fma(_206, _2687, _2757);
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2775 = _2773 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2777 = floor(_2769);
    float _2779 = fma(_212, _2687, _2755);
    float _2781 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2781;
    float _2785 = _2737 ? as_type<float>(_2723) : _1493;
    float _2787 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2789 = _1078 + _2787;
    bool _2791 = !_2747;
    int _2793 = _2791 ? 0 : 1;
    float _2795 = _2783 * _2681;
    float _2797 = 1.0 / _2761;
    float _2799 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2801 = _2799 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2803 = _2741 ? as_type<float>(_2723) : _1493;
    float _2805 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2767);
    int _2807 = ~_1182;
    int _2809 = _2807 + 1;
    float _2811 = float(uint(_1835));
    float _2813 = 1.0 / _2775;
    float _2815 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2817 = _2815 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2819 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2821 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2819;
    bool _2823 = _2777 >= 0.0;
    bool _2825 = isnan(_2777);
    bool _2827 = _2823 || _2825;
    bool _2829 = isnan(0.0);
    bool _2831 = _2827 || _2829;
    float _2833 = as_type<float>(_1295) * _2811;
    float _2835 = _2817 * _2099;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2841 = 1.0 / _2801;
    float _2843 = _2821 * _2721;
    bool _2845 = _2777 > 0.0;
    float _2847 = _2839 * _2707;
    float _2849 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2851 = _2849 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2853 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2853;
    float _2857 = _1084 * 2.0;
    float _2859 = _2851 * _2813;
    float _2861 = _2855 * _2797;
    float _2863 = _2831 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2865 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2865;
    float _2869 = floor(_2857);
    float _2871 = fma(_2843, _2789, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2873 = ~as_type<int>(_2863);
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    float _2879 = _2867 * _2841;
    float _2881 = float(uint(_1801));
    bool _2883 = _1405 != 2;
    int _2885 = _2877;
    float _2887 = _2841;
    float _2889 = _2863;
    float _2891 = _2721;
    float _2893 = _2779;
    if (!_2845)
    {
        int _2895 = ~as_type<int>(_2863);
        int _2897 = _2895 + 1;
        _2885 = _2897;
    }
    int _2899 = _2885;
    float _2901 = trunc(_2833);
    float _2903 = precise::max(_2901, 0.0);
    uint _2905 = uint(_2903);
    bool _2907 = !_1497;
    float _2909 = _2907 ? as_type<float>(_1407) : as_type<float>(_1409);
    float _2911 = as_type<float>(_1250) * _2881;
    bool _2913 = !_1497;
    float _2915 = _2913 ? as_type<float>(_1411) : as_type<float>(_1407);
    float _2917 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2919 = _1078 + _2917;
    float _2921 = float(uint(_1885));
    if (!_1497)
    {
        _2887 = _1084;
    }
    float _2923 = _2887;
    float _2925 = trunc(_2911);
    float _2927 = precise::max(_2925, 0.0);
    uint _2929 = uint(_2927);
    float _2931 = 0.0;
    float _2933 = _2923;
    if (!_1497)
    {
        _2931 = _1084;
    }
    float _2935 = _2931;
    float _2937 = fma(_2835, _2919, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2939 = _2935;
    float _2941 = _2937;
    if (!_1497)
    {
        _2889 = _1403;
    }
    float _2943 = _2889;
    float _2945 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2947 = _1078 + _2945;
    float _2949 = _2943;
    if (!_1497)
    {
        _2891 = _1403;
    }
    float _2951 = _2891;
    float _2953 = _2951;
    if (_1497)
    {
        _2933 = _1397;
    }
    float _2955 = _2933;
    if (_1497)
    {
        _2939 = _1397;
    }
    float _2957 = _2939;
    if (_1497)
    {
        _2949 = _1084;
    }
    float _2959 = _2949;
    float _2961 = _2955 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1497)
    {
        _2953 = _1084;
    }
    float _2963 = _2953;
    bool _2965 = _2869 > 0.0;
    bool _2967 = _2869 >= 0.0;
    bool _2969 = isnan(_2869);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan(0.0);
    bool _2975 = _2971 || _2973;
    float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2979 = _1078 + _2977;
    int _2981 = ~_1228;
    int _2983 = _2981 + 1;
    float _2985 = fma(_2795, _2979, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2987 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2989 = _1078 + _2987;
    int _2991 = _2809 * int(_2929);
    int _2993 = _2991 + _1801;
    float _2995 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2997 = _1078 + _2995;
    float _2999 = fma(_2847, _2989, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3001 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3003 = _1078 + _3001;
    float _3005 = float(uint(_2993));
    float _3007 = fma(_2859, _2997, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _3009 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3011 = isnan(_1078);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3017 = _3013 || _3015;
    float _3019 = float(_3017);
    float _3021 = fma(_2861, _3003, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3023 = fma(_2879, _2947, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _3025 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3027 = isnan(_1078);
    bool _3029 = _3025 || _3027;
    bool _3031 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3033 = _3029 || _3031;
    float _3035 = float(_3033);
    float _3037 = as_type<float>(_1250) * _3005;
    bool _3039 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3041 = isnan(_1078);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3047 = _3043 || _3045;
    float _3049 = float(_3047);
    float _3051 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    bool _3053 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3055 = isnan(_1078);
    bool _3057 = _3053 || _3055;
    bool _3059 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3061 = _3057 || _3059;
    float _3063 = float(_3061);
    float _3065 = -_3035;
    float _3067 = _3065 + 1.0;
    bool _3069 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3071 = isnan(_1078);
    bool _3073 = _3069 || _3071;
    bool _3075 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3077 = _3073 || _3075;
    float _3079 = float(_3077);
    float _3081 = -_3049;
    float _3083 = _3081 + 1.0;
    bool _3085 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3087 = isnan(_1078);
    bool _3089 = _3085 || _3087;
    bool _3091 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3093 = _3089 || _3091;
    float _3095 = float(_3093);
    float _3097 = _3019 * _3067;
    float _3099 = -_3019;
    float _3101 = _3099 + 1.0;
    float _3103 = as_type<float>(_1262) * _2921;
    bool _3105 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3107 = isnan(_1078);
    bool _3109 = _3105 || _3107;
    bool _3111 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3113 = _3109 || _3111;
    float _3115 = float(_3113);
    float _3117 = trunc(_3037);
    float _3119 = precise::max(_3117, 0.0);
    uint _3121 = uint(_3119);
    float _3123 = _3049 * _3101;
    float _3125 = float(uint(_2195));
    float _3127 = fma(_2909, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3051);
    float _3129 = _3115 * _3083;
    float _3131 = -_3115;
    float _3133 = _3131 + 1.0;
    float _3135 = as_type<float>(_1276) * _3125;
    float _3137 = trunc(_3103);
    float _3139 = precise::max(_3137, 0.0);
    uint _3141 = uint(_3139);
    int _3143 = ~_1208;
    int _3145 = _3143 + 1;
    float _3147 = -_3095;
    float _3149 = _3147 + 1.0;
    int _3151 = _2983 * int(_2905);
    int _3153 = _3151 + _1835;
    float _3155 = _3095 * _3133;
    float _3157 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3159 = _1531 * _3149;
    float _3161 = -_1531;
    float _3163 = _3161 + 1.0;
    float _3165 = trunc(_3135);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    float _3171 = float(uint(_3153));
    float _3173 = _2909 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3175 = _3079 * _3163;
    float _3177 = -_3079;
    float _3179 = _3177 + 1.0;
    float _3181 = as_type<float>(_1295) * _3171;
    int _3183 = ~_1234;
    int _3185 = _3183 + 1;
    int _3187 = _3145 * int(_3141);
    int _3189 = _3187 + _1885;
    float _3191 = _3063 * _3179;
    float _3193 = -_3063;
    float _3195 = _3193 + 1.0;
    int _3197 = _2975 ? 0 : 1;
    float _3199 = trunc(_3181);
    float _3201 = precise::max(_3199, 0.0);
    uint _3203 = uint(_3201);
    float _3205 = float(uint(_3189));
    float _3207 = _2985 * _3191;
    float _3209 = _2771 + _1519;
    float _3211 = -_3157;
    float _3213 = fma(_3173, 2.0, _3211);
    float _3215 = as_type<float>(_1262) * _3205;
    float _3217 = fma(_3195, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3207);
    float _3219 = _2765 + _1567;
    int _3221 = ~_3197;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    float _3227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3229 = _3185 * int(_3169);
    int _3231 = _3229 + _2195;
    float _3233 = fma(_2937, _3175, _3217);
    int _3235 = _3225;
    float _3237 = _3219;
    if (!_2965)
    {
        int _3239 = ~_3197;
        int _3241 = _3239 + 1;
        _3235 = _3241;
    }
    int _3243 = _3235;
    float _3245 = _2779 + _1585;
    int _3247 = int(_2905) + int(_3203);
    float _3249 = fma(_2871, _3159, _3233);
    float _3251 = float(uint(_3231));
    float _3253 = trunc(_3215);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    int _3259 = ~_1182;
    int _3261 = _3259 + 1;
    float _3263 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3265 = _3209 + _3263;
    int _3267 = int(_2929) + int(_3121);
    float _3269 = as_type<float>(_1276) * _3251;
    int _3271 = ~_1228;
    int _3273 = _3271 + 1;
    float _3275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3277 = _3219 + _3275;
    int _3279 = ~_1208;
    int _3281 = _3279 + 1;
    float _3283 = trunc(_3269);
    float _3285 = precise::max(_3283, 0.0);
    uint _3287 = uint(_3285);
    int _3289 = _3261 * _3267;
    int _3291 = _3289 + _1801;
    float _3293 = fma(_2999, _3155, _3249);
    bool _3295 = !_2883;
    float _3297 = _3295 ? as_type<float>(_1411) : as_type<float>(_1409);
    float _3299 = _3227 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3301 = fma(_3021, _3129, _3293);
    bool _3303 = uint(_3291) >= uint(_1182);
    int _3305 = _3273 * _3247;
    int _3307 = _3305 + _1835;
    int _3309 = int(_3141) + int(_3257);
    float _3311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _3313 = fma(_3007, _3123, _3301);
    int _3315 = ~_1234;
    int _3317 = _3315 + 1;
    float _3319 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3321 = !_3303;
    int _3323 = _3321 ? 0 : (-1);
    int _3325 = _3281 * _3309;
    int _3327 = _3325 + _1885;
    int _3329 = int(_3169) + int(_3287);
    float _3331 = _3265 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3333 = uint(_3307) >= uint(_1228);
    float _3335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3337 = _3245 + _3335;
    float _3339 = _1084 + _1397;
    bool _3341 = !_3333;
    int _3343 = _3341 ? 0 : (-1);
    float _3345 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3127);
    bool _3347 = uint(_3327) >= uint(_1208);
    int _3349 = _3317 * _3329;
    int _3351 = _3349 + _2195;
    float _3353 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3331);
    int _3355 = ~_3267;
    int _3357 = _3355 + _3323;
    int _3359 = _3357 + 1;
    float _3361 = _3311 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    bool _3363 = !_3347;
    int _3365 = _3363 ? 0 : (-1);
    float _3367 = fma(_3337, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3353);
    bool _3369 = uint(_3351) >= uint(_1234);
    int _3371 = _1182 * _3359;
    int _3373 = _3371 + _1801;
    int _3375 = ~_3247;
    int _3377 = _3375 + _3343;
    int _3379 = _3377 + 1;
    float _3381 = fma(_3023, _3097, _3313);
    bool _3383 = !_3369;
    int _3385 = _3383 ? 0 : (-1);
    float _3387 = fma(_3299, _1190, -0.5);
    bool _3389 = _3367 >= 0.0;
    int _3391 = _1228 * _3379;
    int _3393 = _3391 + _1835;
    float _3395 = fma(_3361, _1343, -0.5);
    float _3397 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3399 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3401 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3403 = (*spvDescriptorSet0.vp_c9)._m0[103].z + (*spvDescriptorSet0.vp_c9)._m0[103].x;
    int _3405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].z);
    if (_3389)
    {
        _1821 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3407 = _1821;
    float _3409 = -_3399;
    float _3411 = fma(_3319, 2.0, _3409);
    float _3413 = fma(as_type<float>(_1409), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3401);
    if (_3389)
    {
        float _3415 = _3407 * 5.0;
        _3405 = as_type<int>(_3415);
    }
    int _3417 = _3405;
    float _3419 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _3421 = !_2883;
    float _3423 = _3421 ? as_type<float>(_1409) : as_type<float>(_1407);
    float _3425 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3427 = fma(as_type<float>(_1409), (*spvDescriptorSet0.vp_c9)._m0[103].z, _3403);
    if (_3389)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11730 = as_type<float>(_3417);
        out.gl_Position.z = _11730;
    }
    float _3429 = as_type<float>(_1409) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3431 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[103].w + (*spvDescriptorSet0.vp_c9)._m0[103].y;
    float _3435 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3437 = as_type<float>(_1407) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _3439 = !_2353;
    int _3441 = _3439 ? 0 : 1;
    float _3443 = fma(_2963, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3419);
    float _3445 = -_3425;
    float _3447 = fma(_3429, 2.0, _3445);
    int _3449 = _2469 & 3;
    bool _3451 = _3449 != 0;
    float _3453 = _1403 * 2.0;
    float _3455 = fma(_3437, -2.0, _3435);
    float _3457 = _3265 * _3265;
    bool _3459 = !_3451;
    int _3461 = _3459 ? 0 : 1;
    float _3463 = fma(_2957, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3397);
    float _3465 = fma(_3277, _3277, _3457);
    int _3467 = _2553 & 3;
    bool _3469 = _3467 != 0;
    float _3471 = floor(_3453);
    float _3473 = fma(_3337, _3337, _3465);
    bool _3475 = !_3469;
    int _3477 = _3475 ? 0 : 1;
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3481 = _2607 & 3;
    bool _3483 = _3481 != 0;
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3487 = rsqrt(_3473);
    float _3489 = fma(_2915, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3479);
    bool _3491 = !_3483;
    int _3493 = _3491 ? 0 : 1;
    float _3495 = _2915 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    bool _3497 = _2351 != 3;
    float _3499 = (*spvDescriptorSet0.vp_c9)._m0[102].x + (*spvDescriptorSet0.vp_c9)._m0[101].z;
    float _3501 = _3297 * (*spvDescriptorSet0.vp_c9)._m0[102].x;
    int _3503 = _2469 >> 31;
    float _3505 = fma(_3495, -2.0, _3485);
    bool _3507 = !_3497;
    int _3509 = _3507 ? 0 : (-1);
    float _3511 = _3423 * (*spvDescriptorSet0.vp_c9)._m0[102].y;
    int _3513 = _2341 >> 31;
    float _3515 = -_3499;
    float _3517 = fma(_3501, 2.0, _3515);
    bool _3519 = _2481 != 3;
    float _3521 = fma(_3035, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3381);
    if (_2883)
    {
        _2941 = _1397;
    }
    float _3523 = _2941;
    float _3525 = _3277 * _3487;
    float _3527 = _3523;
    if (_2883)
    {
        _2893 = _1084;
    }
    float _3529 = _2893;
    float _3531 = _3265 * _3487;
    int _3533 = _3503 & 3;
    float _3535 = fma(as_type<float>(_1407), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3431);
    float _3537 = _3529;
    if (!_2883)
    {
        _3527 = _1403;
    }
    float _3539 = _3527;
    float _3541 = -_3531;
    float _3543 = fma(_3541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3265);
    if (!_2883)
    {
        _3537 = _1397;
    }
    float _3545 = _3537;
    float _3547 = fma(as_type<float>(_1407), (*spvDescriptorSet0.vp_c9)._m0[103].w, _3433);
    bool _3549 = _3471 > 0.0;
    float _3551 = _3543 * _3543;
    bool _3553 = _3471 >= 0.0;
    bool _3555 = isnan(_3471);
    bool _3557 = _3553 || _3555;
    bool _3559 = isnan(0.0);
    bool _3561 = _3557 || _3559;
    float _3563 = _3339 + (-1.0);
    int _3565 = _3513 & 3;
    float _3567 = _3545 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3569 = !_3519;
    int _3571 = _3569 ? 0 : (-1);
    float _3573 = fma(_3563, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _3575 = _2569 != 3;
    float _3577 = -_3525;
    float _3579 = fma(_3577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3277);
    int _3581 = _2469 + _3533;
    float _3583 = _3539 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3585 = _2341 + _3565;
    float _3587 = fma(_3579, _3579, _3551);
    float _3589 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3591 = int(_3589);
    int _3593 = _3581 >> 2;
    out.m_75.x = _3521;
    int _3595 = _2553 >> 31;
    float _3597 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _3599 = _3585 >> 2;
    float _3601 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3505);
    int _3603 = _3595 & 3;
    float _3605 = -_3597;
    float _3607 = fma(_2961, 2.0, _3605);
    float _3609 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3611 = _3599 << 4;
    int _3613 = _3611 + 368;
    float _3615 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3617 = int(_3615);
    int _3619 = _2553 + _3603;
    float _3621 = (*spvDescriptorSet0.vp_c9)._m0[102].y + (*spvDescriptorSet0.vp_c9)._m0[101].w;
    uint _3623 = uint(int(uint(_3613) >> uint(2)));
    uint _3625 = uint(int(uint(int(_3623)) >> uint(2)));
    int _3627 = int(_3623) & 3;
    float _3629 = (*spvDescriptorSet0.vp_c9)._m0[int(_3625)][_3627];
    int _3631 = int(_3623) + 1;
    uint _3633 = uint(int(uint(_3631) >> uint(2)));
    int _3635 = _3631 & 3;
    float _3637 = (*spvDescriptorSet0.vp_c9)._m0[int(_3633)][_3635];
    float _3639 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3413);
    int _3641 = _3619 >> 2;
    float _3643 = fma(_3511, -2.0, _3621);
    int _3645 = _2607 >> 31;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3649 = _3641 << 4;
    int _3651 = _3649 + 656;
    float _3653 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3535);
    int _3655 = _3593 << 4;
    int _3657 = _3655 + 512;
    float _3659 = fma(_3609, -2.0, _3647);
    int _3661 = _3645 & 3;
    uint _3663 = uint(int(uint(_3651) >> uint(2)));
    uint _3665 = uint(int(uint(int(_3663)) >> uint(2)));
    int _3667 = int(_3663) & 3;
    float _3669 = (*spvDescriptorSet0.vp_c9)._m0[int(_3665)][_3667];
    int _3671 = int(_3663) + 1;
    uint _3673 = uint(int(uint(_3671) >> uint(2)));
    int _3675 = _3671 & 3;
    float _3677 = (*spvDescriptorSet0.vp_c9)._m0[int(_3673)][_3675];
    float _3679 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3681 = int(_3679);
    int _3683 = _2607 + _3661;
    float _3685 = _3337 * _3487;
    int _3687 = _3561 ? 0 : 1;
    float _3689 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3691 = _3683 >> 2;
    uint _3693 = uint(int(uint(_3657) >> uint(2)));
    uint _3695 = uint(int(uint(int(_3693)) >> uint(2)));
    int _3697 = int(_3693) & 3;
    float _3699 = (*spvDescriptorSet0.vp_c9)._m0[int(_3695)][_3697];
    int _3701 = int(_3693) + 1;
    uint _3703 = uint(int(uint(_3701) >> uint(2)));
    int _3705 = _3701 & 3;
    float _3707 = (*spvDescriptorSet0.vp_c9)._m0[int(_3703)][_3705];
    float _3709 = -_3685;
    float _3711 = fma(_3709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3337);
    bool _3713 = _2617 != 3;
    float _3715 = fma(_3567, -2.0, _3689);
    float _3717 = fma(_3711, _3711, _3587);
    int _3719 = abs(_2405);
    float _3721 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[102].z, _3427);
    int _3723 = ~_3687;
    int _3725 = _3723 + 1;
    int _3727 = _3725 + 1;
    float _3729 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3731 = _3727;
    if (!_3549)
    {
        int _3733 = ~_3687;
        int _3735 = _3733 + 1;
        _3731 = _3735;
    }
    int _3737 = _3731;
    float _3739 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[102].w, _3547);
    int _3741 = ~_3329;
    int _3743 = _3741 + _3385;
    int _3745 = _3743 + 1;
    float _3747 = -_3729;
    float _3749 = fma(_3583, 2.0, _3747);
    int _3751 = abs(_2561);
    float _3753 = -_166;
    float _3755 = fma(_3753, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3213);
    int _3757 = _3691 << 4;
    int _3759 = _3757 + 800;
    int _3761 = _3651 + 8;
    uint _3763 = uint(int(uint(_3761) >> uint(2)));
    uint _3765 = uint(int(uint(int(_3763)) >> uint(2)));
    int _3767 = int(_3763) & 3;
    float _3769 = (*spvDescriptorSet0.vp_c9)._m0[int(_3765)][_3767];
    int _3771 = int(_3763) + 1;
    uint _3773 = uint(int(uint(_3771) >> uint(2)));
    int _3775 = _3771 & 3;
    float _3777 = (*spvDescriptorSet0.vp_c9)._m0[int(_3773)][_3775];
    float _3779 = fma(_3345, _3387, _3755);
    int _3781 = ~_3309;
    int _3783 = _3781 + _3365;
    int _3785 = _3783 + 1;
    float _3787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3789 = ~_3719;
    int _3791 = _3789 + 1;
    int _3793 = _3791 + 1;
    float _3795 = -_166;
    float _3797 = fma(_3795, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3411);
    int _3799 = abs(_3461);
    int _3801 = _3657 + 8;
    uint _3803 = uint(int(uint(_3801) >> uint(2)));
    uint _3805 = uint(int(uint(int(_3803)) >> uint(2)));
    int _3807 = int(_3803) & 3;
    float _3809 = (*spvDescriptorSet0.vp_c9)._m0[int(_3805)][_3807];
    int _3811 = int(_3803) + 1;
    uint _3813 = uint(int(uint(_3811) >> uint(2)));
    int _3815 = _3811 & 3;
    float _3817 = (*spvDescriptorSet0.vp_c9)._m0[int(_3813)][_3815];
    int _3819 = _1208 * _3785;
    int _3821 = _3819 + _1885;
    int _3823 = ~_3751;
    int _3825 = _3823 + 1;
    int _3827 = _3825 + 1;
    int _3829 = _3793 * as_type<int>(_3637);
    int _3831 = abs(_3441);
    int _3833 = _1234 * _3745;
    int _3835 = _3833 + _2195;
    int _3837 = abs(_3477);
    float _3839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    uint _3841 = uint(int(uint(_3759) >> uint(2)));
    uint _3843 = uint(int(uint(int(_3841)) >> uint(2)));
    int _3845 = int(_3841) & 3;
    float _3847 = (*spvDescriptorSet0.vp_c9)._m0[int(_3843)][_3845];
    int _3849 = int(_3841) + 1;
    uint _3851 = uint(int(uint(_3849) >> uint(2)));
    int _3853 = _3849 & 3;
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[int(_3851)][_3853];
    int _3857 = abs(_2633);
    float _3859 = -_166;
    float _3861 = fma(_3859, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3447);
    int _3863 = abs(_2679);
    float _3865 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3455);
    float _3867 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3463);
    int _3869 = ~_3857;
    int _3871 = _3869 + 1;
    int _3873 = _3871 + 1;
    int _3875 = _3613 + 8;
    uint _3877 = uint(int(uint(_3875) >> uint(2)));
    uint _3879 = uint(int(uint(int(_3877)) >> uint(2)));
    int _3881 = int(_3877) & 3;
    float _3883 = (*spvDescriptorSet0.vp_c9)._m0[int(_3879)][_3881];
    int _3885 = int(_3877) + 1;
    uint _3887 = uint(int(uint(_3885) >> uint(2)));
    int _3889 = _3885 & 3;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[int(_3887)][_3889];
    float _3893 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3443);
    int _3895 = ~_3837;
    int _3897 = _3895 + 1;
    int _3899 = _3897 + 1;
    int _3901 = _3873 * as_type<int>(_3677);
    int _3903 = ~_3799;
    int _3905 = _3903 + 1;
    int _3907 = _3905 + 1;
    float _3909 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3911 = log2(_3909);
    int _3913 = _3827 * as_type<int>(_3707);
    int _3915 = _3759 + 8;
    uint _3917 = uint(int(uint(_3915) >> uint(2)));
    uint _3919 = uint(int(uint(int(_3917)) >> uint(2)));
    int _3921 = int(_3917) & 3;
    float _3923 = (*spvDescriptorSet0.vp_c9)._m0[int(_3919)][_3921];
    int _3925 = int(_3917) + 1;
    uint _3927 = uint(int(uint(_3925) >> uint(2)));
    int _3929 = _3925 & 3;
    float _3931 = (*spvDescriptorSet0.vp_c9)._m0[int(_3927)][_3929];
    bool _3933 = !_2325;
    int _3935 = _3933 ? _3373 : (-1);
    int _3937 = _3899 * as_type<int>(_3669);
    int _3939 = _3937 + _3901;
    bool _3941 = !_2443;
    int _3943 = _3941 ? _3393 : (-1);
    int _3945 = _3907 * as_type<int>(_3699);
    int _3947 = _3945 + _3913;
    bool _3949 = !_3713;
    int _3951 = _3949 ? 0 : (-1);
    float _3953 = -_166;
    float _3955 = fma(_3953, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3607);
    int _3957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3959 = _3957 != 0;
    int _3961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3963 = _3961 != 0;
    int _3965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3967 = _3965 != 0;
    float _3969 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3659);
    float _3971 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3973 = int(_3971);
    int _3975 = ~_3831;
    int _3977 = _3975 + 1;
    int _3979 = _3977 + 1;
    float _3981 = -_166;
    float _3983 = fma(_3981, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3749);
    int _3985 = abs(_2615);
    float _3987 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3715);
    int _3989 = abs(_2539);
    int _3991 = _3979 * as_type<int>(_3629);
    int _3993 = _3991 + _3829;
    int _3995 = abs(_3493);
    float _3997 = _3911 * _166;
    int _3999 = ~_3985;
    int _4001 = _3999 + 1;
    int _4003 = _4001 + 1;
    float _4005 = _3779;
    if (_3389)
    {
        out.m_53.x = 0.0;
    }
    bool _4007 = !_3575;
    int _4009 = _4007 ? 0 : (-1);
    int _4011 = abs(_2463);
    int _4013 = _4003 * as_type<int>(_3769);
    int _4015 = _4013 + _3939;
    int _4017 = ~_3989;
    int _4019 = _4017 + 1;
    int _4021 = _4019 + 1;
    int _4023 = ~_3863;
    int _4025 = _4023 + 1;
    int _4027 = _4025 + 1;
    int _4029 = _4021 * as_type<int>(_3809);
    int _4031 = _4029 + _3947;
    int _4033 = ~_4011;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    int _4039 = abs(_4009);
    int _4041 = _4027 * as_type<int>(_3855);
    int _4043 = ~_3995;
    int _4045 = _4043 + 1;
    int _4047 = _4045 + 1;
    int _4049 = abs(_3571);
    int _4051 = ~_4039;
    int _4053 = _4051 + 1;
    int _4055 = _4053 + 1;
    int _4057 = _4047 * as_type<int>(_3847);
    int _4059 = _4057 + _4041;
    float _4061 = float(uint(_3973));
    int _4063 = _4037 * as_type<int>(_3883);
    int _4065 = _4063 + _3993;
    int _4067 = abs(_3509);
    int _4069 = ~_4049;
    int _4071 = _4069 + 1;
    int _4073 = _4071 + 1;
    int _4075 = abs(_2669);
    int _4077 = _4055 * as_type<int>(_3777);
    int _4079 = _4077 + _4015;
    int _4081 = ~_4067;
    int _4083 = _4081 + 1;
    int _4085 = _4083 + 1;
    int _4087 = _4073 * as_type<int>(_3817);
    int _4089 = _4087 + _4031;
    int _4091 = abs(_2487);
    float _4093 = 1.0 / _4061;
    int _4095 = ~_4075;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    int _4101 = _4085 * as_type<int>(_3891);
    int _4103 = _4101 + _4065;
    int _4105 = abs(_3951);
    float _4107 = float(uint(_3591));
    int _4109 = _4099 * as_type<int>(_3923);
    int _4111 = _4109 + _4059;
    int _4113 = ~_4091;
    int _4115 = _4113 + 1;
    int _4117 = _4115 + 1;
    float _4119 = float(uint(_3617));
    int _4121 = ~_4105;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = _4103 * _4117;
    int _4129 = abs(_3617);
    float _4131 = 1.0 / _4107;
    int _4133 = abs(_2567);
    int _4135 = _4125 * as_type<int>(_3931);
    int _4137 = _4135 + _4111;
    float _4139 = float(uint(_3681));
    int _4141 = _3935 * _4091;
    int _4143 = _4141 + _4127;
    int _4145 = ~_4133;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    float _4151 = 1.0 / _4119;
    int _4153 = abs(_2703);
    bool _4155 = _1208 == 0;
    int _4157 = _4149 * _4089;
    int _4159 = abs(_2793);
    int _4161 = abs(_3973);
    float _4163 = 1.0 / _4139;
    int _4165 = ~_4153;
    int _4167 = _4165 + 1;
    int _4169 = _4167 + 1;
    int _4171 = _3943 * _4133;
    int _4173 = _4171 + _4157;
    int _4175 = as_type<int>(_4093) + (-2);
    float _4177 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3489);
    float _4179 = float(uint(_4143));
    int _4181 = _4169 * _4079;
    bool _4183 = !_4155;
    int _4185 = _4183 ? _3821 : (-1);
    int _4187 = ~_4159;
    int _4189 = _4187 + 1;
    int _4191 = _4189 + 1;
    float _4193 = as_type<float>(_4175) * _4179;
    bool _4195 = _1234 == 0;
    float _4197 = float(uint(_4161));
    int _4199 = _4191 * _4137;
    bool _4201 = !_4195;
    int _4203 = _4201 ? _3835 : (-1);
    float _4205 = trunc(_4193);
    float _4207 = precise::max(_4205, 0.0);
    uint _4209 = uint(_4207);
    int _4211 = as_type<int>(_4131) + (-2);
    int _4213 = _4185 * _4153;
    int _4215 = _4213 + _4181;
    float _4217 = float(uint(_4173));
    float _4219 = _3787 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4221 = abs(_3591);
    int _4223 = as_type<int>(_4151) + (-2);
    float _4225 = 1.0 / _4197;
    int _4227 = _4203 * _4159;
    int _4229 = _4227 + _4199;
    float _4231 = float(uint(_4221));
    float _4233 = as_type<float>(_4211) * _4217;
    float _4235 = fma(_4219, _2785, -0.5);
    float _4237 = _3839 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4239 = as_type<int>(_4163) + (-2);
    int _4241 = ~_3973;
    int _4243 = _4241 + 1;
    float _4245 = fma(_4237, _2803, -0.5);
    float _4247 = float(uint(_4229));
    float _4249 = 1.0 / _4231;
    int _4251 = abs(_4143);
    float _4253 = as_type<float>(_4239) * _4247;
    float _4255 = float(uint(_4129));
    int _4257 = _4243 * int(_4209);
    int _4259 = _4257 + _4143;
    int _4261 = abs(_3681);
    float _4263 = trunc(_4233);
    float _4265 = precise::max(_4263, 0.0);
    uint _4267 = uint(_4265);
    int _4269 = as_type<int>(_4225) + (-2);
    float _4271 = float(uint(_4251));
    float _4273 = float(uint(_4215));
    float _4275 = 1.0 / _4255;
    float _4277 = as_type<float>(_4269) * _4271;
    int _4279 = abs(_4173);
    float _4281 = float(uint(_4259));
    float _4283 = as_type<float>(_4223) * _4273;
    float _4285 = float(uint(_4261));
    int _4287 = as_type<int>(_4249) + (-2);
    float _4289 = as_type<float>(_4175) * _4281;
    float _4291 = float(uint(_4279));
    float _4293 = -_3601;
    float _4295 = fma(_4177, _4235, _4293);
    int _4297 = ~_3591;
    int _4299 = _4297 + 1;
    float _4301 = 1.0 / _4285;
    int _4303 = abs(_4215);
    float _4305 = as_type<float>(_4287) * _4291;
    int _4307 = as_type<int>(_4275) + (-2);
    float _4309 = trunc(_4283);
    float _4311 = precise::max(_4309, 0.0);
    uint _4313 = uint(_4311);
    float _4315 = float(uint(_4303));
    int _4317 = _4299 * int(_4267);
    int _4319 = _4317 + _4173;
    int _4321 = ~_3617;
    int _4323 = _4321 + 1;
    int _4325 = abs(_4229);
    float _4327 = as_type<float>(_4307) * _4315;
    int _4329 = ~_3681;
    int _4331 = _4329 + 1;
    float _4333 = trunc(_4253);
    float _4335 = precise::max(_4333, 0.0);
    uint _4337 = uint(_4335);
    int _4339 = ~_4161;
    int _4341 = _4339 + 1;
    int _4343 = as_type<int>(_4301) + (-2);
    float _4345 = float(uint(_4325));
    bool _4347 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4349 = isnan(0.0);
    bool _4351 = _4347 || _4349;
    bool _4353 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4355 = _4351 || _4353;
    float _4357 = trunc(_4277);
    float _4359 = precise::max(_4357, 0.0);
    uint _4361 = uint(_4359);
    int _4363 = _4323 * int(_4313);
    int _4365 = _4363 + _4215;
    int _4367 = ~_3973;
    int _4369 = _4367 + 1;
    int _4371 = ~_3617;
    int _4373 = _4371 + 1;
    int _4375 = ~_3591;
    int _4377 = _4375 + 1;
    float _4379 = trunc(_4305);
    float _4381 = precise::max(_4379, 0.0);
    uint _4383 = uint(_4381);
    int _4385 = _4331 * int(_4337);
    int _4387 = _4385 + _4229;
    float _4389 = trunc(_4327);
    float _4391 = precise::max(_4389, 0.0);
    uint _4393 = uint(_4391);
    int _4395 = _4341 * int(_4361);
    int _4397 = _4395 + _4251;
    float _4399 = float(uint(_4365));
    float _4401 = float(uint(_4387));
    float _4403 = float(uint(_4397));
    float _4405 = trunc(_4289);
    float _4407 = precise::max(_4405, 0.0);
    uint _4409 = uint(_4407);
    float _4411 = as_type<float>(_4239) * _4401;
    int _4413 = ~_4129;
    int _4415 = _4413 + 1;
    float _4417 = as_type<float>(_4269) * _4403;
    float _4419 = exp2(_3997);
    float _4421 = as_type<float>(_4343) * _4345;
    float _4423 = float(uint(_4319));
    int _4425 = _4415 * int(_4393);
    int _4427 = _4425 + _4303;
    float _4429 = as_type<float>(_4223) * _4399;
    bool _4431 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4433 = isnan(1.0);
    bool _4435 = _4431 || _4433;
    bool _4437 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4439 = _4435 || _4437;
    float _4441 = as_type<float>(_4211) * _4423;
    float _4443 = trunc(_4421);
    float _4445 = precise::max(_4443, 0.0);
    uint _4447 = uint(_4445);
    int _4449 = ~_4221;
    int _4451 = _4449 + 1;
    int _4453 = int(_4209) + int(_4409);
    int _4455 = ~_4261;
    int _4457 = _4455 + 1;
    int _4459 = _4451 * int(_4383);
    int _4461 = _4459 + _4279;
    float _4463 = float(uint(_4427));
    float _4465 = trunc(_4441);
    float _4467 = precise::max(_4465, 0.0);
    uint _4469 = uint(_4467);
    float _4471 = -_4419;
    float _4473 = _4471 + 1.0;
    float _4475 = float(uint(_4461));
    float _4477 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4479 = 1.0 + _4477;
    float _4481 = as_type<float>(_4307) * _4463;
    float _4483 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4485 = as_type<float>(_4287) * _4475;
    int _4487 = _4457 * int(_4447);
    int _4489 = _4487 + _4325;
    float _4491 = 1.0 / _4479;
    float _4493 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4495 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4483);
    float _4497 = float(uint(_4489));
    float _4499 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4501 = int(_4267) + int(_4469);
    float _4503 = trunc(_4429);
    float _4505 = precise::max(_4503, 0.0);
    uint _4507 = uint(_4505);
    float _4509 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4511 = as_type<float>(_4343) * _4497;
    float _4513 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4493);
    float _4515 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4499);
    float _4517 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4509);
    float _4519 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4495);
    float _4521 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4513);
    float _4523 = trunc(_4411);
    float _4525 = precise::max(_4523, 0.0);
    uint _4527 = uint(_4525);
    float _4529 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4517);
    float _4531 = -_166;
    float _4533 = fma(_4531, (*spvDescriptorSet0.vp_c9)._m0[101].x, _3517);
    float _4535 = fma(_3721, _3395, _4533);
    float _4537 = trunc(_4417);
    float _4539 = precise::max(_4537, 0.0);
    uint _4541 = uint(_4539);
    float _4543 = _4355 ? _4473 : 0.0;
    float _4545 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4515);
    int _4547 = ~_4261;
    int _4549 = _4547 + 1;
    float _4551 = trunc(_4485);
    float _4553 = precise::max(_4551, 0.0);
    uint _4555 = uint(_4553);
    float _4557 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[101].y, _3643);
    float _4559 = _4535;
    float _4561 = as_type<float>(_4501);
    if (_4439)
    {
        float _4563 = _4543 * _4491;
        _168 = _4563;
    }
    float _4565 = _168;
    int _4567 = _4369 * _4453;
    int _4569 = _4567 + _4143;
    int _4571 = int(_4337) + int(_4527);
    float _4573 = -_4557;
    float _4575 = fma(_3739, _4245, _4573);
    float _4577 = trunc(_4481);
    float _4579 = precise::max(_4577, 0.0);
    uint _4581 = uint(_4579);
    bool _4583 = uint(_4569) >= uint(_3973);
    float _4585 = _4575 + 0.5;
    int _4587 = int(_4361) + int(_4541);
    bool _4589 = !_4583;
    int _4591 = _4589 ? 0 : (-1);
    float _4593 = trunc(_4511);
    float _4595 = precise::max(_4593, 0.0);
    uint _4597 = uint(_4595);
    int _4599 = int(_4313) + int(_4507);
    int _4601 = _4377 * _4501;
    int _4603 = _4601 + _4173;
    int _4605 = ~_3681;
    int _4607 = _4605 + 1;
    int _4609 = int(_4383) + int(_4555);
    int _4611 = _4373 * _4599;
    int _4613 = _4611 + _4215;
    bool _4615 = uint(_4603) >= uint(_3591);
    int _4617 = ~_4221;
    int _4619 = _4617 + 1;
    bool _4621 = uint(_4613) >= uint(_3617);
    int _4623 = _4619 * _4609;
    int _4625 = _4623 + _4279;
    int _4627 = ~_4161;
    int _4629 = _4627 + 1;
    int _4631 = int(_4447) + int(_4597);
    int _4633 = _4607 * _4571;
    int _4635 = _4633 + _4229;
    int _4637 = int(_4393) + int(_4581);
    int _4639 = _4629 * _4587;
    int _4641 = _4639 + _4251;
    int _4643 = ~_4129;
    int _4645 = _4643 + 1;
    float _4647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4649 = !_4615;
    int _4651 = _4649 ? 0 : (-1);
    bool _4653 = uint(_4635) >= uint(_3681);
    int _4655 = _4645 * _4637;
    int _4657 = _4655 + _4303;
    int _4659 = ~_4453;
    int _4661 = _4659 + _4591;
    int _4663 = _4661 + 1;
    int _4665 = _4549 * _4631;
    int _4667 = _4665 + _4325;
    bool _4669 = !_4653;
    int _4671 = _4669 ? 0 : (-1);
    bool _4673 = uint(_4625) >= uint(_4221);
    bool _4675 = !_4621;
    int _4677 = _4675 ? 0 : (-1);
    bool _4679 = uint(_4641) >= uint(_4161);
    bool _4681 = !_4673;
    int _4683 = _4681 ? 0 : (-1);
    bool _4685 = uint(_4667) >= uint(_4261);
    int _4687 = _3973 * _4663;
    int _4689 = _4687 + _4143;
    bool _4691 = !_4679;
    int _4693 = _4691 ? 0 : (-1);
    int _4695 = _4143 ^ _3973;
    bool _4697 = uint(_4657) >= uint(_4129);
    int _4699 = ~_4501;
    int _4701 = _4699 + _4651;
    int _4703 = _4701 + 1;
    float _4705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4707 = uint(int(uint(_4695) >> uint(31)));
    int _4709 = ~_4599;
    int _4711 = _4709 + _4677;
    int _4713 = _4711 + 1;
    int _4715 = _3591 * _4703;
    int _4717 = _4715 + _4173;
    bool _4719 = !_4697;
    int _4721 = _4719 ? 0 : (-1);
    bool _4723 = _3973 == 0;
    int _4725 = _3617 * _4713;
    int _4727 = _4725 + _4215;
    int _4729 = _4173 ^ _3591;
    float _4731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4733 = ~_4693;
    int _4735 = _4587 + _4733;
    int _4737 = _4735 + 1;
    float _4739 = _4295 + 0.5;
    int _4741 = ~int(_4707);
    int _4743 = _4741 + 1;
    bool _4745 = !_4723;
    int _4747 = _4745 ? _4689 : (-1);
    bool _4749 = _3617 == 0;
    float _4751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    uint _4753 = uint(int(uint(_4729) >> uint(31)));
    int _4755 = _4737 ^ _4743;
    int _4757 = ~_4571;
    int _4759 = _4757 + _4671;
    int _4761 = _4759 + 1;
    bool _4763 = !_4685;
    int _4765 = _4763 ? 0 : (-1);
    float _4767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4769 = _3591 == 0;
    int _4771 = _3681 * _4761;
    int _4773 = _4771 + _4229;
    bool _4775 = !_4749;
    int _4777 = _4775 ? _4727 : (-1);
    float _4779 = _4535 + 0.5;
    bool _4781 = _3973 == 0;
    int _4783 = ~_4683;
    int _4785 = _4609 + _4783;
    int _4787 = _4785 + 1;
    float _4789 = _3779 + 0.5;
    int _4791 = ~int(_4753);
    int _4793 = _4791 + 1;
    out.m_77.x = _4779;
    out.m_77.y = _4585;
    int _4795 = ~_4743;
    int _4797 = _4795 + _4755;
    int _4799 = _4797 + 1;
    bool _4801 = !_4769;
    int _4803 = _4801 ? _4717 : (-1);
    out.m_79.x = _4789;
    out.m_79.y = _4739;
    bool _4805 = _3681 == 0;
    int _4807 = _4787 ^ _4793;
    bool _4809 = !_4781;
    int _4811 = _4809 ? _4799 : (-1);
    bool _4813 = _3617 == 0;
    int _4815 = _4215 ^ _3617;
    float _4817 = _4647 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4819 = !_4805;
    int _4821 = _4819 ? _4773 : (-1);
    float _4823 = _4731 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4825 = _3591 == 0;
    float _4827 = fma(_4817, _1573, -0.5);
    int _4829 = ~_4793;
    int _4831 = _4829 + _4807;
    int _4833 = _4831 + 1;
    float _4835 = fma(_4823, _1609, -0.5);
    float _4837 = float(_4747);
    float _4839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _4841 = uint(int(uint(_4815) >> uint(31)));
    bool _4843 = !_4825;
    int _4845 = _4843 ? _4833 : (-1);
    float _4847 = fma(_4817, _4837, _3797);
    bool _4849 = _3681 == 0;
    float _4851 = _4751 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4853 = _4229 ^ _3681;
    float _4855 = _4767 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4857 = ~_4721;
    int _4859 = _4637 + _4857;
    int _4861 = _4859 + 1;
    float _4863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4865 = ~int(_4841);
    int _4867 = _4865 + 1;
    float _4869 = fma(_4851, _2323, -0.5);
    float _4871 = float(_4821);
    float _4873 = fma(_4855, _1825, -0.5);
    float _4875 = float(_4777);
    float _4877 = _4839 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _4879 = _4861 ^ _4867;
    float _4881 = fma(_4851, _4871, _3861);
    uint _4883 = uint(int(uint(_4853) >> uint(31)));
    float _4885 = fma(_4855, _4875, _3983);
    float _4887 = float(_4811);
    float _4889 = _4705 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4891 = ~_4867;
    int _4893 = _4891 + _4879;
    int _4895 = _4893 + 1;
    float _4897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4899 = ~_4765;
    int _4901 = _4631 + _4899;
    int _4903 = _4901 + 1;
    float _4905 = fma(_4889, _2705, -0.5);
    int _4907 = ~int(_4883);
    int _4909 = _4907 + 1;
    float _4911 = -_2805;
    float _4913 = fma(_4889, _4887, _4911);
    bool _4915 = !_4813;
    int _4917 = _4915 ? _4895 : (-1);
    float _4919 = fma(_4545, _4873, _4885);
    float _4921 = float(_4845);
    float _4923 = _4863 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4925 = _4903 ^ _4909;
    float _4927 = fma(_4877, _2715, -0.5);
    float _4929 = float(_4803);
    float _4931 = -_3969;
    float _4933 = fma(_4877, _4921, _4931);
    float _4935 = float(_4917);
    float _4937 = fma(_4923, _2729, -0.5);
    int _4939 = ~_4909;
    int _4941 = _4939 + _4925;
    int _4943 = _4941 + 1;
    float _4945 = fma(_4823, _4929, _3955);
    float _4947 = fma(_3893, _4927, _4933);
    float _4949 = -_3987;
    float _4951 = fma(_4923, _4935, _4949);
    bool _4953 = !_3959;
    int _4955 = _4953 ? 0 : 1;
    float _4957 = fma(_4519, _4827, _4847);
    bool _4959 = !_4849;
    int _4961 = _4959 ? _4943 : (-1);
    float _4963 = fma(_3867, _4835, _4945);
    float _4965 = fma(_4529, _4937, _4951);
    float _4967 = _4947 + 0.5;
    float _4969 = float(_4961);
    float _4971 = _4897 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4973 = abs(_4955);
    float _4975 = fma(_3639, _4869, _4881);
    float _4977 = in.m_81.x;
    float _4979 = in.m_81.y;
    float _4981 = in.m_81.z;
    float _4983 = fma(_4971, _2731, -0.5);
    float _4985 = -_3865;
    float _4987 = fma(_4971, _4969, _4985);
    float _4989 = fma(_4521, _4905, _4913);
    bool _4991 = !_3963;
    int _4993 = _4991 ? 0 : 1;
    float _4995 = _4919 + 0.5;
    float _4997 = fma(_3653, _4983, _4987);
    float _4999 = _4957 + 0.5;
    float _5001 = _4963 + 0.5;
    float _5003 = _4989 + 0.5;
    float _5005 = _4975 + 0.5;
    float _5007 = _4965 + 0.5;
    float _5009 = _4997 + 0.5;
    int _5011 = abs(_4993);
    out.m_83.x = _4999;
    out.m_83.y = _5003;
    out.m_83.z = _5001;
    out.m_83.w = _4967;
    bool _5013 = !_3967;
    int _5015 = _5013 ? 0 : 1;
    out.m_85.x = _4995;
    out.m_85.y = _5007;
    float _5017 = float(_4973);
    out.m_87.x = _5005;
    out.m_87.y = _5009;
    float _5019 = float(_3737);
    float _5021 = as_type<float>(_4713);
    float _5023 = as_type<float>(_4703);
    if (_3389)
    {
        return out;
    }
    float _5025 = -_3531;
    float _5027 = fma(_5025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3209);
    float _5029 = -_3525;
    float _5031 = fma(_5029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3219);
    float _5033 = float(_2899);
    float _5035 = _5017 * _5019;
    float _5037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5039 = _5027 + _5037;
    float _5041 = float(_5011);
    float _5043 = -_3685;
    float _5045 = fma(_5043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3245);
    float _5047 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5049 = _5031 + _5047;
    float _5051 = _5039 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5053 = _5041 * _5033;
    float _5055 = _1084 + _1403;
    float _5057 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5059 = _5045 + _5057;
    float _5061 = fma(_5049, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5051);
    float _5063 = _5035 * (-2.0);
    float _5065 = _5055 + (-1.0);
    float _5067 = _5053 * (-2.0);
    float _5069 = fma(_5059, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5061);
    float _5071 = _1397 + (-0.5);
    float _5073 = fma(_5063, _4977, _4977);
    float _5075 = fma(_5065, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5077 = _1084 + (-0.5);
    float _5079 = fma(_5067, _4979, _4979);
    bool _5081 = _5069 >= 0.0;
    float _5083 = fma(_3573, _5063, _3573);
    float _5085 = fma(_5071, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5073);
    float _5087 = fma(_5075, _5067, _5075);
    float _5089 = fma(_5077, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5079);
    int _5091 = abs(_5015);
    float _5093 = fma(_5083, _4565, _5085);
    float _5095 = sqrt(_3717);
    float _5097 = fma(_5087, _4565, _5089);
    float _5099 = float(_3243);
    float _5101 = _5093 * 0.15915493667125701904296875;
    float _5103 = _5097 * 0.15915493667125701904296875;
    float _5105 = _5073;
    float _5107 = _5099;
    if (_5081)
    {
        _5105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5109 = _5105;
    float _5111 = _5101 * 6.283185482025146484375;
    float _5113 = sin(_5111);
    float _5115 = float(_5091);
    float _5117 = _1397 + _1403;
    int _5119 = as_type<int>(_5109);
    if (_5081)
    {
        float _5121 = _5109 * 5.0;
        _5119 = as_type<int>(_5121);
    }
    int _5123 = _5119;
    if (_5081)
    {
        out.m_53.x = 0.0;
    }
    float _5125 = _5115 * _5099;
    float _5127 = _5117 + (-1.0);
    float _5129 = _5101 * 6.283185482025146484375;
    float _5131 = cos(_5129);
    if (_5081)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14233 = as_type<float>(_5123);
        out.gl_Position.z = _14233;
    }
    float _5133 = _5125 * (-2.0);
    float _5135 = _5103 * 6.283185482025146484375;
    float _5137 = sin(_5135);
    if (_5081)
    {
        return out;
    }
    float _5139 = -_3209;
    float _5141 = _5139 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5143 = -_3219;
    float _5145 = _5143 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5147 = -_3245;
    float _5149 = _5147 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5151 = fma(_5127, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5153 = _5141 * _5141;
    float _5155 = fma(_5133, _4981, _4981);
    float _5157 = _1403 + (-0.5);
    float _5159 = fma(_5151, _5133, _5151);
    float _5161 = fma(_5145, _5145, _5153);
    float _5163 = _5103 * 6.283185482025146484375;
    float _5165 = cos(_5163);
    float _5167 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5155);
    float _5169 = _5113 * _5137;
    float _5171 = fma(_5149, _5149, _5161);
    float _5173 = _3487 * _5095;
    float _5175 = fma(_5159, _4565, _5167);
    float _5177 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5179 = rsqrt(_5171);
    float _5181 = _5175 * 0.15915493667125701904296875;
    float _5183 = _5173 * _5177;
    float _5185 = in.m_89.x;
    float _5187 = in.m_89.y;
    float _5189 = in.m_89.z;
    float _5191 = _5131 * _5165;
    float _5193 = _5181 * 6.283185482025146484375;
    float _5195 = sin(_5193);
    float _5197 = _5113 * _5165;
    float _5199 = _5145 * _5179;
    float _5201 = _5149 * _5179;
    float _5203 = _5141 * _5179;
    float _5205 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5207 = _5199 * _5205;
    float _5209 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5211 = _5201 * _5209;
    float _5213 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5215 = _5203 * _5213;
    float _5217 = _5181 * 6.283185482025146484375;
    float _5219 = cos(_5217);
    float _5221 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5223 = -_5207;
    float _5225 = fma(_5201, _5221, _5223);
    float _5227 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5229 = -_5211;
    float _5231 = fma(_5203, _5227, _5229);
    float _5233 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5235 = -_5215;
    float _5237 = fma(_5199, _5233, _5235);
    float _5239 = fma(_5195, _5191, _5169);
    float _5241 = _5225 * _5225;
    float _5243 = fma(_5195, _5169, _5191);
    float _5245 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5247 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5249 = fma(_5231, _5231, _5241);
    float _5251 = _5131 * _5137;
    float _5253 = _5173 * _5247;
    float _5255 = fma(_5237, _5237, _5249);
    float _5257 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5187);
    float _5259 = _5131 * _5219;
    float _5261 = _5165 * _5219;
    float _5263 = _5113 * _5219;
    float _5265 = rsqrt(_5255);
    float _5267 = _5257 * _5253;
    float _5269 = _5173 * _5245;
    float _5271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5185);
    float _5273 = _5137 * _5219;
    float _5275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5189);
    float _5277 = -_5251;
    float _5279 = fma(_5195, _5197, _5277);
    float _5281 = _5271 * _5269;
    float _5283 = _5259 * _5267;
    float _5285 = _5275 * _5183;
    float _5287 = -_5197;
    float _5289 = fma(_5195, _5251, _5287);
    float _5291 = _5263 * _5267;
    float _5293 = fma(_5239, _5281, _5283);
    float _5295 = fma(_5279, _5281, _5291);
    float _5297 = _5231 * _5265;
    float _5299 = _5225 * _5265;
    float _5301 = _5237 * _5265;
    float _5303 = -_5267;
    float _5305 = _5195 * _5303;
    float _5307 = _5203 * _5297;
    float _5309 = _5201 * _5299;
    float _5311 = fma(_5261, _5281, _5305);
    float _5313 = fma(_5289, _5285, _5293);
    float _5315 = -_5309;
    float _5317 = fma(_5203, _5301, _5315);
    float _5319 = -_5307;
    float _5321 = fma(_5199, _5299, _5319);
    float _5323 = fma(_5273, _5285, _5311);
    float _5325 = fma(_5243, _5285, _5295);
    float _5327 = _5317 * _5313;
    float _5329 = _5321 * _5313;
    float _5331 = fma(_5297, _5323, _5327);
    float _5333 = fma(_5301, _5323, _5329);
    float _5335 = fma(_5199, _5325, _5331);
    float _5337 = fma(_5201, _5325, _5333);
    float _5339 = _5199 * _5301;
    float _5341 = _3219 + _5335;
    float _5343 = _3245 + _5337;
    float _5345 = -_5339;
    float _5347 = fma(_5201, _5297, _5345);
    float _5349 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5351 = _5341 + _5349;
    float _5353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5355 = _5343 + _5353;
    float _5357 = _5347 * _5313;
    float _5359 = _5351 * _5351;
    float _5361 = _5355 * _5355;
    float _5363 = fma(_5299, _5323, _5357);
    float _5365 = _5359 + _5361;
    float _5367 = fma(_5203, _5325, _5363);
    float _5369 = sqrt(_5365);
    float _5371 = _3209 + _5367;
    bool _5373 = _5369 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5375 = _5341;
    float _5377 = _5343;
    float _5379 = _5359;
    float _5381 = _5361;
    if (!_5373)
    {
        _5021 = _5371;
    }
    float _5383 = _5021;
    bool _5385 = !_5373;
    float _5387 = _5383;
    if (!_5385)
    {
        float _5389 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5393 = _5369 + _5391;
        float _5395 = rsqrt(_5365);
        float _5397 = _5393 * _5389;
        float _5399 = _5371 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5401 = _5397 * 0.15915493667125701904296875;
        float _5403 = _5401 * 6.283185482025146484375;
        float _5405 = sin(_5403);
        float _5407 = _5401 * 6.283185482025146484375;
        float _5409 = cos(_5407);
        float _5411 = fma(_5405, _5399, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5413 = _5395 * _5411;
        float _5415 = _5409 + (-1.0);
        float _5417 = fma(_5351, _5413, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5419 = fma(_5355, _5413, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5421 = _5415 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5425 = _5417 + _5423;
        float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5429 = _5419 + _5427;
        float _5431 = fma(_5371, _5409, _5421);
        float _5433 = _5425 * _5425;
        float _5435 = _5429 * _5429;
        _5375 = _5417;
        _5377 = _5419;
        _5387 = _5431;
        _5379 = _5433;
        _5381 = _5435;
    }
    float _5437 = _5375;
    float _5439 = _5377;
    float _5441 = _5387;
    float _5443 = _5379;
    float _5445 = _5381;
    float _5447 = fma(_5437, 6.2500002968590706586837768554688e-05, 0.5);
    float _5449 = fma(_5439, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14726 = float2(_5447, _5449);
    float3 _5453 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14726, float2(0.0), isnan(_14726)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14726, float2(0.0), isnan(_14726)), level(0.0)).xyz;
    float _5455 = _5453.x;
    float _5457 = _5453.y;
    float _5459 = _5453.z;
    float _5461 = in.m_91.x;
    float _5463 = in.m_91.y;
    float _5465 = in.m_91.z;
    bool _5467 = _5187 != 0.0;
    bool _5469 = isnan(_5187);
    bool _5471 = _5467 || _5469;
    bool _5473 = isnan(0.0);
    bool _5475 = _5471 || _5473;
    float _5477 = in.m_93.x;
    float _5479 = in.m_93.y;
    float _5481 = in.m_93.z;
    float _5483 = in.m_93.w;
    bool _5485 = _5185 == 0.0;
    bool _5487 = !_5475;
    bool _5489 = _5485 && _5487;
    bool _5491 = _5189 == 0.0;
    bool _5493 = _5491 && _5489;
    float _5495 = _5461;
    if (_5493)
    {
        _4005 = _5461;
    }
    float _5497 = _4005;
    float _5499 = _5497;
    if (_5493)
    {
        _5107 = _5465;
    }
    float _5501 = _5107;
    float _5503 = _5501;
    if (_5493)
    {
        _4559 = _5463;
    }
    float _5505 = _4559;
    float _5507 = _5505;
    if (_5493)
    {
        _4561 = _5497;
    }
    float _5509 = _4561;
    float _5511 = _5509;
    if (!_5493)
    {
        _5499 = _5461;
    }
    float _5513 = _5499;
    if (_5493)
    {
        _5023 = _5501;
    }
    float _5515 = _5023;
    float _5517 = _5515;
    if (!_5493)
    {
        _5503 = _5465;
    }
    float _5519 = _5503;
    if (!_5493)
    {
        float _5521 = fma(_5185, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5513);
        _5511 = _5521;
    }
    float _5523 = _5511;
    if (_5493)
    {
        _5495 = _5505;
    }
    float _5525 = _5495;
    float _5527 = _5481 * _5513;
    float _5529 = _5525;
    if (!_5493)
    {
        _5507 = _5463;
    }
    float _5531 = _5507;
    float _5533 = _5479 * _5519;
    if (!_5493)
    {
        float _5535 = fma(_5189, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5519);
        _5517 = _5535;
    }
    float _5537 = _5517;
    float _5539 = -_5527;
    float _5541 = fma(_5477, _5519, _5539);
    float _5543 = _5259 * _5317;
    float _5545 = _5477 * _5531;
    float _5547 = -_5533;
    float _5549 = fma(_5481, _5531, _5547);
    if (!_5493)
    {
        float _5551 = fma(_5187, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5531);
        _5529 = _5551;
    }
    float _5553 = _5529;
    float _5555 = _5239 * _5317;
    float _5557 = -_5545;
    float _5559 = fma(_5479, _5513, _5557);
    float _5561 = _5239 * _5347;
    float _5563 = _5239 * _5321;
    float _5565 = _5541 * _5483;
    float _5567 = _5549 * _5483;
    float _5569 = _5559 * _5483;
    float _5571 = _5259 * _5347;
    float _5573 = fma(_5261, _5297, _5555);
    float _5575 = fma(_5261, _5299, _5561);
    float _5577 = _5259 * _5321;
    float _5579 = fma(_5261, _5301, _5563);
    float _5581 = -_5195;
    float _5583 = fma(_5581, _5297, _5543);
    float _5585 = _5289 * _5317;
    float _5587 = _5289 * _5347;
    float _5589 = _5289 * _5321;
    float _5591 = -_5195;
    float _5593 = fma(_5591, _5299, _5571);
    float _5595 = -_5195;
    float _5597 = fma(_5595, _5301, _5577);
    float _5599 = fma(_5263, _5199, _5583);
    float _5601 = fma(_5273, _5297, _5585);
    float _5603 = fma(_5273, _5299, _5587);
    float _5605 = fma(_5273, _5301, _5589);
    float _5607 = fma(_5263, _5203, _5593);
    float _5609 = fma(_5263, _5201, _5597);
    float _5611 = fma(_5279, _5199, _5573);
    float _5613 = _5599 * _5479;
    float _5615 = fma(_5279, _5203, _5575);
    float _5617 = fma(_5279, _5201, _5579);
    float _5619 = fma(_5243, _5199, _5601);
    float _5621 = fma(_5243, _5203, _5603);
    float _5623 = fma(_5243, _5201, _5605);
    float _5625 = _5607 * _5479;
    float _5627 = _5609 * _5479;
    float _5629 = fma(_5611, _5477, _5613);
    float _5631 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5633 = _5441 + _5631;
    float _5635 = fma(_5615, _5477, _5625);
    float _5637 = fma(_5617, _5477, _5627);
    float _5639 = _5599 * _5553;
    float _5641 = fma(_5633, _5633, _5443);
    float _5643 = _5607 * _5553;
    float _5645 = _5565 * _5599;
    float _5647 = _5565 * _5607;
    float _5649 = _5641 + _5445;
    float _5651 = _5609 * _5553;
    float _5653 = _5565 * _5609;
    float _5655 = fma(_5567, _5611, _5645);
    float _5657 = fma(_5615, _5523, _5643);
    float _5659 = fma(_5567, _5615, _5647);
    float _5661 = sqrt(_5649);
    float _5663 = fma(_5611, _5523, _5639);
    float _5665 = fma(_5617, _5523, _5651);
    float _5667 = fma(_5567, _5617, _5653);
    float _5669 = fma(_5619, _5481, _5629);
    float _5671 = fma(_5621, _5481, _5635);
    float _5673 = fma(_5621, _5537, _5657);
    float _5675 = fma(_5623, _5481, _5637);
    float _5677 = fma(_5619, _5537, _5663);
    float _5679 = fma(_5569, _5619, _5655);
    float _5681 = fma(_5569, _5621, _5659);
    float _5683 = fma(_5569, _5623, _5667);
    float _5685 = fma(_5623, _5537, _5665);
    out.m_95.x = _5669;
    out.m_95.y = _5671;
    out.m_95.z = _5675;
    bool _5687 = _5661 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5689 = isnan(_5661);
    bool _5691 = _5687 || _5689;
    bool _5693 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5695 = _5691 || _5693;
    out.m_97.x = _5679;
    out.m_97.y = _5681;
    out.m_97.z = _5683;
    out.m_99.x = _5677;
    out.m_99.y = _5673;
    out.m_99.z = _5685;
    float _5697 = _5569;
    float _5699 = _5665;
    if (!_5695)
    {
        _5697 = 1.0;
    }
    float _5701 = _5697;
    out.m_101.x = _5455;
    out.m_101.y = _5457;
    out.m_101.z = _5459;
    bool _5703 = !_5695;
    float _5705 = _5701;
    if (!_5703)
    {
        bool _5707 = _5661 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5709 = isnan(_5661);
        bool _5711 = _5707 || _5709;
        bool _5713 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5715 = _5711 || _5713;
        if (!_5715)
        {
            float _5717 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5719 = _5661 + _5717;
            float _5721 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5723 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5721;
            float _5725 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5727 = _5725 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5729 = 1.0 / _5723;
            float _5731 = _5719 * _5729;
            float _5733 = fma(_5731, _5727, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5705 = _5733;
            _5735 = true;
        }
        else
        {
            bool _5737 = _5661 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5739 = isnan(_5661);
            bool _5741 = _5737 || _5739;
            bool _5743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5745 = _5741 || _5743;
            if (!_5745)
            {
                float _5747 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5749 = _5661 + _5747;
                float _5751 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5753 = _5751 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5755 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5757 = _5755 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5759 = 1.0 / _5753;
                float _5761 = _5749 * _5759;
                float _5763 = fma(_5761, _5757, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5705 = _5763;
                _5735 = true;
            }
            else
            {
                _5705 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5735 = false;
    float _5765 = _5705;
    float _5767 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5769 = _5441 + _5767;
    float _5771 = _5027 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5773 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5775 = _5437 + _5773;
    float _5777 = fma(_5769, _5765, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5779 = fma(_5031, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5771);
    float _5781 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5783 = _5439 + _5781;
    float _5785 = fma(_5775, _5765, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5787 = -_3209;
    float _5789 = _5787 + _5777;
    float _5791 = fma(_5045, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5779);
    float _5793 = fma(_5783, _5765, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5795 = -_3219;
    float _5797 = _5795 + _5785;
    float _5799 = _5789 * _5789;
    float _5801 = _5791 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5803 = _5027 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5805 = -_3245;
    float _5807 = _5805 + _5793;
    float _5809 = fma(_5797, _5797, _5799);
    float _5811 = 1.0 / _5801;
    float _5813 = fma(_5031, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5803);
    float _5815 = fma(_5807, _5807, _5809);
    float _5817 = fma(_5045, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5813);
    float _5819 = sqrt(_5815);
    float _5821 = _5817 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5823 = _5821 + _5801;
    float _5825 = _5823 * _5811;
    float _5827 = _5825 * 0.5;
    bool _5829 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5831 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5833 = _5829 || _5831;
    bool _5835 = isnan(0.5);
    bool _5837 = _5833 || _5835;
    float _5839 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5841 = fma(_5827, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5839);
    bool _5843 = _5819 > 0.0;
    float _5845 = 1.0 / _5841;
    bool _5847 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5849 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5851 = _5847 || _5849;
    bool _5853 = isnan(0.5);
    bool _5855 = _5851 || _5853;
    float _5857 = _5827;
    float _5859 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5861 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5863 = _5793;
    if (!_5843)
    {
        _5857 = _5785;
    }
    float _5865 = _5857;
    float _5867 = _5865;
    float _5869 = _5865;
    if (!_5843)
    {
        _5859 = _5777;
    }
    float _5871 = _5859;
    float _5873 = _5871;
    if (!_5843)
    {
        _5861 = _5793;
    }
    float _5875 = _5861;
    bool _5877 = !_5843;
    float _5879 = _5875;
    if (!_5877)
    {
        float _5881 = _228 * _228;
        float _5883 = fma(_224, _224, _5881);
        float _5885 = fma(_230, _230, _5883);
        float _5887 = rsqrt(_5815);
        float _5889 = sqrt(_5885);
        float _5891 = _5797 * _5887;
        float _5893 = _5789 * _5887;
        float _5895 = _5807 * _5887;
        bool _5897 = _5889 > 0.0;
        float _5899 = _5889;
        float _5901 = _5887;
        _5699 = _5891;
        if (!_5897)
        {
            _5867 = _5785;
        }
        float _5903 = _5867;
        _5869 = _5903;
        if (!_5897)
        {
            _5899 = _5777;
        }
        float _5905 = _5899;
        _5873 = _5905;
        if (!_5897)
        {
            _5901 = _5793;
        }
        float _5907 = _5901;
        bool _5909 = !_5897;
        _5879 = _5907;
        if (!_5909)
        {
            float _5911 = rsqrt(_5885);
            float _5913 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5915 = _228 * _5911;
            float _5917 = _224 * _5911;
            float _5919 = _5893 * _5915;
            float _5921 = _230 * _5911;
            float _5923 = fma(_5891, _5917, _5919);
            float _5925 = _5913 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5927 = fma(_5895, _5921, _5923);
            float _5929 = _5927 * _5925;
            float _5931 = fma(_224, _5929, _5785);
            float _5933 = fma(_228, _5929, _5777);
            float _5935 = fma(_230, _5929, _5793);
            _5869 = _5931;
            _5873 = _5933;
            _5879 = _5935;
        }
    }
    float _5937 = _5869;
    float _5939 = _5873;
    float _5941 = _5879;
    float _5943 = _5699;
    float _5945 = -_3525;
    float _5947 = fma(_5945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5937);
    float _5949 = -_3531;
    float _5951 = fma(_5949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5939);
    float _5953 = -_3685;
    float _5955 = fma(_5953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5941);
    float _5957 = _5951;
    float _5959 = _5947;
    float _5961 = _5955;
    float _5963 = _5943;
    if (_5837)
    {
        _5863 = 1.0;
    }
    float _5965 = _5863;
    float _5967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5969 = _5845 * _5967;
    float _5971 = _5965;
    if (!_5855)
    {
        float _5973 = _5039 * _5039;
        float _5975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5977 = -_3245;
        float _5979 = _5977 + _5941;
        float _5981 = -_3219;
        float _5983 = _5981 + _5937;
        float _5985 = fma(_5049, _5049, _5973);
        float _5987 = fma(_5059, _5059, _5985);
        float _5989 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5991 = sqrt(_5987);
        float _5993 = 1.0 / _5173;
        float _5995 = _5989 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5997 = precise::min(_5991, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5999 = _5997 * _5975;
        float _6001 = _5999 * _5993;
        float _6003 = -_3209;
        float _6005 = _6003 + _5939;
        float _6007 = _5995 * _6001;
        float _6009 = _5979 * _6001;
        float _6011 = fma(_6005, _6007, _5027);
        float _6013 = fma(_5983, _6007, _5031);
        float _6015 = fma(_5995, _6009, _5045);
        _5957 = _6011;
        _5959 = _6013;
        _5961 = _6015;
    }
    float _6017 = _5957;
    float _6019 = _5959;
    float _6021 = _5961;
    if (!_5837)
    {
        float _6023 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6025 = _6023 * 0.15915493667125701904296875;
        float _6027 = _6025 * 6.283185482025146484375;
        float _6029 = cos(_6027);
        float _6031 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6033 = _6031 * 0.15915493667125701904296875;
        float _6035 = _6025 * 6.283185482025146484375;
        float _6037 = sin(_6035);
        float _6039 = 1.0 / _6029;
        float _6041 = _6033 * 6.283185482025146484375;
        float _6043 = cos(_6041);
        float _6045 = _6037 * _6039;
        float _6047 = _6033 * 6.283185482025146484375;
        float _6049 = sin(_6047);
        float _6051 = _6043 * _6045;
        float _6053 = 1.0 / _6051;
        float _6055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6057 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6055;
        float _6059 = 1.0 / _6057;
        float _6061 = _6049 * _6053;
        float _6063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6065 = fma(_5969, _6061, _6063);
        float _6067 = _6065 * _6059;
        float _6069 = precise::clamp(_6067, 0.0, 1.0);
        _5971 = _6069;
    }
    float _6071 = _5971;
    float _6073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6075 = _6017 + _6073;
    float _6077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6079 = _6019 + _6077;
    float _6081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6083 = _6021 + _6081;
    float _6085 = _6075 * _6075;
    float _6087 = fma(_6079, _6079, _6085);
    float _6089 = fma(_6083, _6083, _6087);
    float _6091 = rsqrt(_6089);
    float _6093 = _6091 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6095 = _6079 * _6093;
    float _6097 = _6083 * _6093;
    float _6099 = _6095 * _6095;
    float _6101 = _6097 * _6097;
    float _6103 = _6099 + _6101;
    float _6105 = sqrt(_6103);
    bool _6107 = _6105 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6109 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6111 = _6105 + _6109;
    float _6113 = _6091;
    float _6115 = _6103;
    float _6117 = _6111;
    float _6119 = _6075;
    if (_6107)
    {
        float _6121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6113 = _6121;
    }
    float _6123 = _6113;
    if (_6107)
    {
        float _6125 = rsqrt(_6103);
        _6115 = _6125;
    }
    float _6127 = _6115;
    float _6129 = _6127;
    if (_6107)
    {
        float _6131 = _6111 * _6123;
        _6117 = _6131;
    }
    float _6133 = _6117;
    if (_6107)
    {
        float _6135 = _6133 * 0.15915493667125701904296875;
        _5963 = _6135;
    }
    float _6137 = _5963;
    float _6139 = _6083;
    float _6141 = _6137;
    if (_6107)
    {
        float _6143 = _6137 * 6.283185482025146484375;
        float _6145 = sin(_6143);
        _6139 = _6145;
    }
    float _6147 = _6139;
    float _6149 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6151 = precise::max(0.0, _6149);
    float _6153 = _6123;
    if (_6107)
    {
        float _6155 = _6137 * 6.283185482025146484375;
        float _6157 = cos(_6155);
        _6153 = _6157;
    }
    float _6159 = _6153;
    float _6161 = -_6093;
    float _6163 = -_6151;
    float _6165 = fma(_6075, _6161, _6163);
    float _6167 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6107)
    {
        float _6169 = _6165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6119 = _6169;
    }
    float _6171 = _6119;
    float _6173 = fma(_5031, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6175 = _6171;
    float _6177 = _6147;
    if (_6107)
    {
        float _6179 = fma(_6147, _6171, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6175 = _6179;
    }
    float _6181 = _6175;
    float _6183 = _6181;
    if (!_6107)
    {
        _6177 = _6095;
    }
    float _6185 = _6177;
    float _6187 = sqrt(_6089);
    float _6189 = _6185;
    float _6191 = _6159;
    if (_6107)
    {
        float _6193 = _6159 + (-1.0);
        _6167 = _6193;
    }
    float _6195 = _6167;
    float _6197 = _6195;
    if (_6107)
    {
        float _6199 = _6127 * _6181;
        _3237 = _6199;
    }
    float _6201 = _3237;
    if (!_6107)
    {
        _6183 = _6165;
    }
    float _6203 = _6183;
    float _6205 = _6203;
    if (_6107)
    {
        float _6207 = _6195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6141 = _6207;
    }
    float _6209 = _6141;
    if (_6107)
    {
        float _6211 = _6095 * _6201;
        _6189 = _6211;
    }
    float _6213 = _6189;
    if (!_6107)
    {
        _6197 = _6097;
    }
    float _6215 = _6197;
    float _6217 = _6215;
    if (_6107)
    {
        float _6219 = _6097 * _6201;
        _6217 = _6219;
    }
    float _6221 = _6217;
    if (!_6107)
    {
        _6129 = _6099;
    }
    float _6223 = _6129;
    float _6225 = _6223;
    if (_6107)
    {
        float _6227 = fma(_6165, _6159, _6209);
        _6205 = _6227;
    }
    float _6229 = _6205;
    if (_6107)
    {
        float _6231 = _6213 * _6213;
        _6225 = _6231;
    }
    float _6233 = _6225;
    if (!_6107)
    {
        _6191 = _6101;
    }
    float _6235 = _6191;
    float _6237 = _6235;
    if (_6107)
    {
        float _6239 = _6221 * _6221;
        _6237 = _6239;
    }
    float _6241 = _6237;
    float _6243 = fma(_6229, _6229, _6233);
    float _6245 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6247 = floor(_6173);
    float _6249 = _6243 + _6241;
    float _6251 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6245);
    float _6253 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6255 = fma(_6187, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6253);
    float _6257 = precise::clamp(_6255, 0.0, 1.0);
    float _6259 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6251);
    float _6261 = -_6257;
    float _6263 = _6261 + 1.0;
    float _6265 = rsqrt(_6249);
    float _6267 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6269 = _6259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6271 = fma(_5045, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6273 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6275 = _6269 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6277 = abs(_6263);
    float _6279 = log2(_6277);
    float _6281 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6283 = -_6275;
    float _6285 = fma(_6283, _6267, 1.0);
    float _6287 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6289 = -_6247;
    float _6291 = _6173 + _6289;
    float _6293 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6281);
    float _6295 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6287);
    float _6297 = _6265 * _6213;
    float _6299 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6293);
    float _6301 = _6265 * _6229;
    float _6303 = _6265 * _6221;
    float _6305 = _6297 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6307 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6295);
    float _6309 = _6299 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6311 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6273);
    float _6313 = -_6305;
    float _6315 = fma(_6301, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6313);
    float _6317 = _6307 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6319 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6321 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6311);
    float _6323 = -_6303;
    float _6325 = fma(_6323, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6315);
    float _6327 = _6279 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6329 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6319);
    float _6331 = _6321 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6333 = floor(_6271);
    float _6335 = fma(_6325, -0.5, 0.5);
    float _6337 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6329);
    float _6339 = fma(_6325, 0.5, 0.5);
    float _6341 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6343 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6337);
    float _6345 = _6301 + 1.0;
    float _6347 = log2(_6285);
    float _6349 = fma(_6339, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6351 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6341);
    float _6353 = fma(_6339, _6349, -0.212114393711090087890625);
    float _6355 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6351);
    float _6357 = exp2(_6327);
    float _6359 = -_6333;
    float _6361 = _6271 + _6359;
    float _6363 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6355);
    float _6365 = fma(_6339, _6353, 1.570728778839111328125);
    float _6367 = 1.0 / _6343;
    float _6369 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6371 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6369);
    float _6373 = sqrt(_6335);
    float _6375 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6371);
    float _6377 = _6347 * 0.693147182464599609375;
    float _6379 = -_6301;
    float _6381 = fma(_6357, _6345, _6379);
    float _6383 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6375);
    float2 _16280 = float2(_6291, _6361);
    float _6385 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16280, float2(0.0), isnan(_16280)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16280, float2(0.0), isnan(_16280)), level(0.0)).x;
    float _6387 = _6377 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6389 = _6363 * _6367;
    float _6391 = _6383 * _6367;
    float _6393 = fma(_6381, 0.5, 0.5);
    float _6395 = fma(_6389, 0.5, 0.5);
    float _6397 = fma(_6391, -0.5, 0.5);
    float _6399 = _6373 * 0.636619746685028076171875;
    float3 _16308 = float3(_6395, _6397, _6387);
    float _6401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16308, float3(0.0), isnan(_16308)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16308, float3(0.0), isnan(_16308)), level(0.0)).x;
    float3 _16319 = float3(_6395, _6397, _6387);
    float4 _6404 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16319, float3(0.0), isnan(_16319)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16319, float3(0.0), isnan(_16319)), level(0.0)).xyzw;
    float _6406 = _6404.x;
    float _6408 = _6404.y;
    float _6410 = _6404.z;
    float _6412 = _6404.w;
    float _6414 = -_6365;
    float _6416 = fma(_6399, _6414, 1.0);
    float2 _16340 = float2(_6416, _6393);
    float3 _6418 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16340, float2(0.0), isnan(_16340)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16340, float2(0.0), isnan(_16340)), level(0.0)).xyz;
    float _6420 = _6418.x;
    float _6422 = _6418.y;
    float _6424 = _6418.z;
    float _6426 = abs(_5969);
    float _6428 = log2(_6426);
    float _6430 = _6279 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6432 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6434 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6436 = isnan(_6187);
    bool _6438 = _6434 || _6436;
    bool _6440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6442 = _6438 || _6440;
    float _6444 = exp2(_6430);
    float _6446 = in.m_103.x;
    float _6448 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6432);
    bool _6450 = _5969 <= 8000.0;
    bool _6452 = isnan(_5969);
    bool _6454 = _6450 || _6452;
    bool _6456 = isnan(8000.0);
    bool _6458 = _6454 || _6456;
    float _6460 = float(_6458);
    float _6462 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6448);
    float _6464 = _6428 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6466 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6462);
    float _6468 = _6343 * 0.5;
    float _6470 = _6363 + _6343;
    float _6472 = exp2(_6464);
    float _6474 = -_6444;
    float _6476 = _6474 + 1.0;
    float _6478 = fma(_6383, -0.5, _6468);
    float _6480 = _6466 + _6343;
    float _6482 = _6476 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6484 = _6470 * 0.5;
    out.gl_Position.x = _6363;
    out.gl_Position.y = _6383;
    out.gl_Position.z = _6466;
    out.gl_Position.w = _6343;
    float _6486 = _6480 * 0.5;
    out.m_105.x = _6484;
    out.m_105.y = _6478;
    out.m_105.z = _6486;
    out.m_105.w = _6343;
    float _6488 = fma(_6472, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6490 = precise::clamp(_6488, 0.0, 1.0);
    float _6492 = _6071 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6494 = fma(_6490, -2.0, 3.0);
    float _6496 = _6490 * _6490;
    float _6498 = -_6482;
    float _6500 = _6498 + 1.0;
    float _6502 = _6343;
    float _6504 = _6466;
    float _6506 = _6383;
    float _6508 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _6510 = _6500;
    if (!_6442)
    {
        _6502 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6512 = _6502;
    float _6514 = _6496 * _6494;
    float _6516 = _6512;
    float _6518 = _6512;
    if (!_6442)
    {
        _6504 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6520 = _6504;
    float _6522 = _6520;
    float _6524 = _6520;
    if (!_6442)
    {
        _6506 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6526 = _6506;
    float _6528 = -_6514;
    float _6530 = _6528 + 1.0;
    float _6532 = fma(_6530, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6514);
    float _6534 = _6460 * _6532;
    float _6536 = _6534 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6538 = -_6385;
    float _6540 = _6538 + 1.0;
    float _6542 = _6540 * _6536;
    float _6544 = precise::clamp(_6542, 0.0, 1.0);
    float _6546 = -_6544;
    float _6548 = fma(_6546, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6550 = _6526;
    float _6552 = _6526;
    if (!_6442)
    {
        _6508 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6554 = _6508;
    float _6556 = _6482 * _6401;
    float _6558 = _6548 * _6446;
    float _6560 = _6412 * _6500;
    float _6562 = _6554;
    float _6564 = _6554;
    if (!_6442)
    {
        _6510 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6566 = _6510;
    float _6568 = _6412 * _6556;
    float _6570 = _6558 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6572 = _6424 * _6556;
    float _6574 = fma(_6420, _6568, _6406);
    float _6576 = fma(_6422, _6568, _6408);
    out.m_107.x = _6570;
    float _6578 = fma(_6412, _6572, _6410);
    float _6580 = _6568;
    float _6582 = _6566;
    float _6584 = _6566;
    if (!_6442)
    {
        _6580 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6586 = _6580;
    out.m_109.x = _6574;
    out.m_109.y = _6576;
    out.m_109.z = _6578;
    out.m_109.w = _6560;
    bool _6588 = !_6442;
    float _6590 = _6586;
    float _6592 = _6586;
    if (!_6588)
    {
        bool _6594 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6596 = isnan(_6187);
        bool _6598 = _6594 || _6596;
        bool _6600 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6602 = _6598 || _6600;
        if (!_6602)
        {
            float _6604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6606 = _6187 + _6604;
            float _6608 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6610 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6608;
            float _6612 = 1.0 / _6610;
            float _6614 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6616 = _6614 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6618 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6620 = _6618 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6622 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6624 = _6622 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6626 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6628 = _6626 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6630 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6632 = _6630 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6634 = _6606 * _6612;
            float _6636 = precise::clamp(_6634, 0.0, 1.0);
            float _6638 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6640 = _6638 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6642 = fma(_6636, _6620, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6644 = fma(_6636, _6640, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6646 = fma(_6636, _6616, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6648 = fma(_6636, _6624, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6650 = fma(_6636, _6628, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6652 = fma(_6636, _6632, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6584 = _6646;
            _6518 = _6650;
            _6552 = _6644;
            _6564 = _6648;
            _6592 = _6642;
            _6524 = _6652;
            _6654 = true;
        }
        else
        {
            bool _6656 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6658 = isnan(_6187);
            bool _6660 = _6656 || _6658;
            bool _6662 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6664 = _6660 || _6662;
            if (!_6664)
            {
                _6562 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6666 = _6562;
            _6564 = _6666;
            if (!_6664)
            {
                _6516 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6668 = _6516;
            _6518 = _6668;
            if (!_6664)
            {
                _6522 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6670 = _6522;
            _6524 = _6670;
            if (!_6664)
            {
                _6550 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6672 = _6550;
            _6552 = _6672;
            if (!_6664)
            {
                _6582 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6674 = _6582;
            _6584 = _6674;
            if (!_6664)
            {
                _6590 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6676 = _6590;
            bool _6678 = !_6664;
            _6592 = _6676;
            if (!_6678)
            {
                bool _6680 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6682 = isnan(_6187);
                bool _6684 = _6680 || _6682;
                bool _6686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6688 = _6684 || _6686;
                if (!_6688)
                {
                    float _6690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6692 = _6187 + _6690;
                    float _6694 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6696 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6694;
                    float _6698 = 1.0 / _6696;
                    float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6708 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6710 = _6708 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6712 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6714 = _6712 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6716 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6718 = _6716 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6720 = _6692 * _6698;
                    float _6722 = precise::clamp(_6720, 0.0, 1.0);
                    float _6724 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6726 = _6724 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6728 = fma(_6722, _6706, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6730 = fma(_6722, _6726, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6732 = fma(_6722, _6702, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6734 = fma(_6722, _6710, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6736 = fma(_6722, _6714, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6738 = fma(_6722, _6718, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6584 = _6732;
                    _6518 = _6736;
                    _6552 = _6730;
                    _6564 = _6734;
                    _6592 = _6728;
                    _6524 = _6738;
                    _6654 = true;
                }
                else
                {
                    _6584 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6518 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6552 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6564 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6592 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6524 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6654 = false;
    float _6740 = _6584;
    float _6742 = _6518;
    float _6744 = _6552;
    float _6746 = _6564;
    float _6748 = _6592;
    float _6750 = _6524;
    float _6752 = _6492 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6754 = fma(_5673, -0.5, 0.5);
    float _6756 = precise::clamp(_6754, 0.0, 1.0);
    float _6758 = -_6740;
    float _6760 = _6742 + _6758;
    float _6762 = -_6744;
    float _6764 = _6746 + _6762;
    out.m_53.x = _6752;
    float _6766 = -_6748;
    float _6768 = _6750 + _6766;
    float _6770 = fma(_6756, _6760, _6740);
    float _6772 = fma(_6756, _6764, _6744);
    bool _6774 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6776 = _6770 * 0.586610972881317138671875;
    float _6778 = fma(_6756, _6768, _6748);
    out.m_111.x = 0.0;
    bool _6780 = _6071 > 0.0;
    bool _6782 = isnan(_6071);
    bool _6784 = _6780 || _6782;
    bool _6786 = isnan(0.0);
    bool _6788 = _6784 || _6786;
    float _6790 = fma(_6772, 0.298911988735198974609375, _6776);
    float _6792 = fma(_6778, 0.114477999508380889892578125, _6790);
    float _6794 = -_6792;
    float _6796 = _6772 + _6794;
    float _6798 = -_6792;
    float _6800 = _6770 + _6798;
    float _6802 = -_6792;
    float _6804 = _6778 + _6802;
    float _6806 = fma(_6796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6792);
    float _6808 = fma(_6800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6792);
    float _6810 = fma(_6804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6792);
    bool _6812 = !_6774;
    if (!_6812)
    {
        float _6814 = -_6017;
        float _6816 = _6814 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6818 = -_6019;
        float _6820 = _6818 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6822 = -_6021;
        float _6824 = _6822 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6826 = _6816 * _6816;
        float _6828 = fma(_6820, _6820, _6826);
        float _6830 = fma(_6824, _6824, _6828);
        float _6832 = sqrt(_6830);
        float _6834 = rsqrt(_6830);
        float _6836 = -_6832;
        float _6838 = _6836 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6840 = _6838 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6842 = precise::clamp(_6840, 0.0, 1.0);
        float _6844 = _6820 * _6834;
        float _6846 = _6816 * _6834;
        float _6848 = abs(_6842);
        float _6850 = log2(_6848);
        float _6852 = _6824 * _6834;
        float _6854 = _6844 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6856 = _5673 * _6846;
        float _6858 = -_6846;
        float _6860 = -_6854;
        float _6862 = fma(_6858, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6860);
        float _6864 = fma(_5677, _6844, _6856);
        float _6866 = -_6852;
        float _6868 = fma(_6866, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6862);
        float _6870 = fma(_5685, _6852, _6864);
        float _6872 = precise::clamp(_6870, 0.0, 1.0);
        float _6874 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6876 = _6868 + _6874;
        float _6878 = _6850 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6880 = _6876 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6882 = precise::clamp(_6880, 0.0, 1.0);
        float _6884 = exp2(_6878);
        float _6886 = _6884 * _6882;
        float _6888 = _6872 * _6886;
        float _6890 = _6888 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6892 = _6888 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6894 = _6888 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _6890;
        out.m_111.y = _6892;
        out.m_111.z = _6894;
    }
    out.m_113.x = _6806;
    out.m_113.y = _6808;
    out.m_113.z = _6810;
    if (_6788)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _6896 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6896;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6654 = false;
    bool _5735 = false;
    bool _1070 = false;
    bool _890 = false;
    bool _710 = false;
    bool _584 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6953 = as_type<float>(_148);
        out.gl_Position.z = _6953;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7023 = as_type<float>(_186);
        out.gl_Position.z = _7023;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_59.x;
    float _198 = in.m_59.y;
    float _200 = in.m_59.z;
    float _202 = in.m_61.x;
    float _204 = in.m_61.y;
    float _206 = in.m_61.z;
    float _208 = in.m_63.x;
    float _210 = in.m_63.y;
    float _212 = in.m_63.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_65.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _166 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = 1.0 / _268;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _284;
    bool _288 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _290 = isnan(_260);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = 1.0 / _276;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _260 + _302;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _308 = 1.0 / _272;
    float _310 = _304 * _282;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = _260 + _312;
    float _316 = 1.0 / _280;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _260 + _318;
    float _322 = _314 * _300;
    bool _324 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _326 = isnan(_260);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    bool _336 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_260);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _286;
    float _350 = _264 * _308;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _354 = _260 + _352;
    bool _356 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_260);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _320 * _316;
    float _370 = -_298;
    float _372 = _370 + 1.0;
    float _374 = -_334;
    float _376 = _374 + 1.0;
    float _378 = -_366;
    float _380 = _378 + 1.0;
    float _382 = _334 * _372;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = _354 * _348;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _394;
    float _398 = fma(_386, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _400 = fma(_390, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = _346 * _380;
    float _404 = fma(_396, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _406 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _408 = isnan(_260);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = -_346;
    float _420 = _418 + 1.0;
    float _422 = _366 * _376;
    bool _424 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _426 = isnan(_260);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = _416 * _420;
    float _442 = -_416;
    float _444 = _442 + 1.0;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = fma(_438, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = _434 * _444;
    float _454 = -_434;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = fma(_448, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = _398 * _452;
    float _466 = _400 * _452;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _468;
    float _472 = _404 * _452;
    float _474 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _464);
    float _476 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _478 = fma(_470, _322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _480 = fma(_460, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _482 = fma(_450, _440, _474);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _472);
    float _494 = fma(_462, _440, _476);
    float _496 = fma(_478, _402, _482);
    float _498 = fma(_486, _322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _504 = fma(_490, _322, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_480, _440, _492);
    float _516 = fma(_498, _402, _494);
    float _518 = fma(_502, _368, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _520 = fma(_508, _368, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _522 = fma(_512, _368, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _524 = fma(_504, _402, _514);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _534;
    float _538 = fma(_518, _422, _496);
    float _540 = fma(_528, _392, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _542 = fma(_532, _392, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _544 = fma(_536, _392, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _546 = fma(_520, _422, _516);
    float _548 = fma(_522, _422, _524);
    float _550 = fma(_540, _382, _538);
    float _552 = fma(_542, _382, _546);
    float _554 = fma(_544, _382, _548);
    float _556 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[148].x, _550);
    float _558 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[148].y, _552);
    float _560 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[148].z, _554);
    bool _562 = !_306;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _582;
    if (!_562)
    {
        float _566 = in.m_65.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[11].x, _166);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_132);
        float _588 = 1.0 / _586;
        float _590 = _166 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = in.m_67.x;
    float _596 = in.m_67.y;
    float _598 = in.m_67.z;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _602 = _592 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _604;
    bool _608 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _610 = 1.0 / _606;
    float _612 = _560 * _598;
    bool _614 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _616 = isnan(_592);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _602 * _610;
    float _628 = _558 * _596;
    bool _630 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _632 = isnan(_592);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -_624;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _654;
    float _658 = _640 * _644;
    float _660 = fma(_648, _626, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _662 = fma(_652, _626, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _664 = fma(_656, _626, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _666 = -_640;
    float _668 = _666 + 1.0;
    float _670 = _660 * _658;
    float _672 = _662 * _658;
    float _674 = _664 * _658;
    float _676 = _556 * _594;
    float _678 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[107].y, _670);
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[107].x, _672);
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[107].z, _674);
    float _684 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[108].y, _678);
    float _686 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[108].x, _680);
    float _688 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[108].z, _682);
    bool _690 = !_608;
    float _708;
    if (!_690)
    {
        float _692 = in.m_65.x;
        float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _696 = _692 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _700 = _698 * _694;
        float _702 = floor(_700);
        float _704 = -_702;
        float _706 = _700 + _704;
        _708 = _706;
        _710 = true;
    }
    else
    {
        float _712 = float(_132);
        float _714 = 1.0 / _712;
        float _716 = _166 * _714;
        _708 = _716;
    }
    _710 = false;
    float _718 = _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _722 = _718 + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _728 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _730 = isnan(_718);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _748 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _750 = isnan(_718);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = 1.0 / _726;
    float _762 = -_738;
    float _764 = _762 + 1.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _766;
    bool _770 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _772 = isnan(_718);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _758 * _764;
    float _784 = -_758;
    float _786 = _784 + 1.0;
    bool _788 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _790 = 1.0 / _742;
    float _792 = _780 * _786;
    float _794 = -_780;
    float _796 = _794 + 1.0;
    float _798 = 1.0 / _746;
    float _800 = _768 * _760;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _806 = fma(_800, _722, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _808 = _804 * _790;
    bool _810 = _718 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _812 = isnan(_718);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _828 = _718 + _826;
    float _830 = _806 * _792;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _834 = _718 + _832;
    float _836 = -_820;
    float _838 = _836 + 1.0;
    float _840 = fma(_808, _828, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _842 = _824 * _798;
    float _844 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[115].x, _830);
    float _846 = _738 * _838;
    float _848 = _686 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _850 = fma(_842, _834, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _852 = fma(_840, _782, _844);
    float _854 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _856 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = fma(_850, _846, _852);
    float _860 = _684 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _862 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[118].x, _858);
    float _866 = _860 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _856;
    out.m_69.y = _866;
    out.m_69.z = _862;
    out.m_69.w = _868;
    bool _870 = !_788;
    float _888;
    if (!_870)
    {
        float _872 = in.m_65.x;
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _876 = _872 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _880 = _878 * _874;
        float _882 = floor(_880);
        float _884 = -_882;
        float _886 = _880 + _884;
        _888 = _886;
        _890 = true;
    }
    else
    {
        float _892 = float(_132);
        float _894 = 1.0 / _892;
        float _896 = _166 * _894;
        _888 = _896;
    }
    _890 = false;
    float _898 = _888;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _898 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _908 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _910 = isnan(_898);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _928 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _930 = isnan(_898);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = 1.0 / _906;
    float _942 = -_918;
    float _944 = _942 + 1.0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _946;
    bool _950 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _952 = isnan(_898);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = _938 * _944;
    float _964 = -_938;
    float _966 = _964 + 1.0;
    bool _968 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _970 = 1.0 / _922;
    float _972 = _960 * _966;
    float _974 = -_960;
    float _976 = _974 + 1.0;
    float _978 = 1.0 / _926;
    float _980 = _948 * _940;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _986 = fma(_980, _902, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _988 = _984 * _970;
    bool _990 = _898 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _992 = isnan(_898);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1008 = _898 + _1006;
    float _1010 = _986 * _972;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1014 = _898 + _1012;
    float _1016 = -_1000;
    float _1018 = _1016 + 1.0;
    float _1020 = fma(_988, _1008, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1022 = _1004 * _978;
    float _1024 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1010);
    float _1026 = _918 * _1018;
    float _1028 = fma(_1022, _1014, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1030 = fma(_1020, _962, _1024);
    float _1032 = fma(_1028, _1026, _1030);
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1040 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1032);
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _1042;
    out.m_71.y = _1044;
    out.m_71.z = _1046;
    out.m_71.w = _1048;
    bool _1050 = !_968;
    float _1068;
    if (!_1050)
    {
        float _1052 = in.m_65.x;
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1056 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _1060 = _1058 * _1054;
        float _1062 = floor(_1060);
        float _1064 = -_1062;
        float _1066 = _1060 + _1064;
        _1068 = _1066;
        _1070 = true;
    }
    else
    {
        float _1072 = float(_132);
        float _1074 = 1.0 / _1072;
        float _1076 = _166 * _1074;
        _1068 = _1076;
    }
    _1070 = false;
    float _1078 = _1068;
    float _1080 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1082 = int(_1080);
    float _1084 = in.m_65.y;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1088 = _1086 != 0;
    float _1090 = in.m_73.x;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1094 = _1092 != 0;
    float _1096 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1098 = int(_1096);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1106 = _1104 != 0;
    float _1108 = 0.0;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _1112 = _1102;
    bool _1114 = _1106;
    if (_1088)
    {
        _1108 = 1.0;
    }
    float _1116 = _1108;
    float _1118 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1120 = int(_1118);
    float _1122 = float(_1082);
    float _1124 = 0.0;
    float _1126 = _1116;
    if (_1088)
    {
        _1124 = 1.0;
    }
    float _1128 = _1124;
    float _1130 = 0.0;
    float _1132 = _1128;
    if (_1088)
    {
        _1130 = 1.0;
    }
    float _1134 = _1130;
    int _1136 = 0;
    float _1138 = _1134;
    if (_1088)
    {
        _1136 = 0;
    }
    int _1140 = _1136;
    float _1142 = _1048;
    int _1144 = _1140;
    if (_1088)
    {
        float _1146 = in.m_65.z;
        _1142 = _1146;
    }
    float _1148 = _1142;
    float _1150 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1152 = int(_1150);
    float _1154 = float(_1098);
    if (_1088)
    {
        _1110 = 0;
    }
    int _1156 = _1110;
    bool _1158 = _1084 > 0.5;
    float _1160 = 0.0;
    int _1162 = _1156;
    float _1164 = _1090;
    if (!_1106)
    {
        _1160 = _1090;
    }
    float _1166 = _1160;
    float _1168 = _1166;
    if (_1102)
    {
        float _1170 = -_1090;
        float _1172 = _1170 + 1.0;
        _564 = as_type<int>(_1172);
    }
    int _1174 = _564;
    float _1176 = 0.0;
    if (!_1102)
    {
        _1176 = _1090;
    }
    float _1178 = _1176;
    float _1180 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1182 = int(_1180);
    float _1184 = float(_1120);
    float _1186 = _1178;
    if (_1102)
    {
        float _1188 = _1158 ? as_type<float>(_1174) : _1090;
        _1186 = _1188;
    }
    float _1190 = _1186;
    int _1192 = 0;
    if (_1088)
    {
        _1192 = as_type<int>(_1084);
    }
    int _1194 = _1192;
    float _1196 = 1.0 / _1122;
    int _1198 = 0;
    float _1200 = _1148;
    int _1202 = _1194;
    if (_1088)
    {
        _1198 = as_type<int>(_1148);
    }
    int _1204 = _1198;
    float _1206 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1208 = int(_1206);
    float _1210 = float(_1152);
    float _1212 = float(uint(_1182));
    float _1214 = 1.0 / _1154;
    float _1216 = _1196 * _166;
    float _1218 = 1.0 / _1184;
    float _1220 = float(uint(_1208));
    float _1222 = 1.0 / _1210;
    float _1224 = _1214 * _166;
    float _1226 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1228 = int(_1226);
    float _1230 = _1218 * _166;
    float _1232 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1234 = int(_1232);
    float _1236 = _1222 * _166;
    float _1238 = 1.0 / _1212;
    float _1240 = float(uint(_1228));
    float _1242 = trunc(_1216);
    int _1244 = int(_1242);
    float _1246 = float(uint(_1234));
    float _1248 = 1.0 / _1220;
    int _1250 = as_type<int>(_1238) + (-2);
    float _1252 = 1.0 / _1246;
    float _1254 = float(uint(_1244));
    float _1256 = as_type<float>(_1250) * _1254;
    float _1258 = trunc(_1230);
    int _1260 = int(_1258);
    int _1262 = as_type<int>(_1248) + (-2);
    float _1264 = _1248;
    int _1266 = _1204;
    if (_1088)
    {
        float _1268 = in.m_65.x;
        _1264 = _1268;
    }
    float _1270 = _1264;
    float _1272 = trunc(_1236);
    int _1274 = int(_1272);
    int _1276 = as_type<int>(_1252) + (-2);
    float _1278 = 1.0 / _1240;
    float _1280 = float(uint(_1260));
    float _1282 = as_type<float>(_1262) * _1280;
    float _1284 = trunc(_1224);
    int _1286 = int(_1284);
    float _1288 = trunc(_1256);
    float _1290 = precise::max(_1288, 0.0);
    uint _1293 = uint(_1290);
    int _1295 = as_type<int>(_1278) + (-2);
    float _1297 = float(uint(_1286));
    float _1299 = trunc(_1282);
    float _1301 = precise::max(_1299, 0.0);
    uint _1303 = uint(_1301);
    float _1305 = float(uint(_1274));
    float _1307 = as_type<float>(_1295) * _1297;
    float _1309 = _1297;
    int _1311 = as_type<int>(_1307);
    float _1313 = _1305;
    if (!_1094)
    {
        _1309 = _1090;
    }
    float _1315 = _1309;
    float _1317 = as_type<float>(_1276) * _1305;
    float _1319 = trunc(_1307);
    float _1321 = precise::max(_1319, 0.0);
    uint _1323 = uint(_1321);
    float _1325 = trunc(_1317);
    float _1327 = precise::max(_1325, 0.0);
    uint _1329 = uint(_1327);
    float _1331 = _1315;
    if (_1106)
    {
        float _1333 = -_1090;
        float _1335 = _1333 + 1.0;
        _1311 = as_type<int>(_1335);
    }
    int _1337 = _1311;
    float _1339 = as_type<float>(_1337);
    if (_1106)
    {
        float _1341 = _1158 ? as_type<float>(_1337) : _1090;
        _1168 = _1341;
    }
    float _1343 = _1168;
    float _1345 = _1270;
    if (_1088)
    {
        _1339 = _1270;
    }
    float _1347 = _1339;
    float _1349 = _1347;
    if (_1088)
    {
        _1313 = _1347;
    }
    float _1351 = _1313;
    int _1353 = 0;
    float _1355 = _1351;
    if (_1088)
    {
        _1353 = as_type<int>(_1347);
    }
    int _1357 = _1353;
    int _1359 = _1357;
    if (!_1088)
    {
        float _1361 = in.m_65.x;
        float _1363 = _1084 * 3.1415927410125732421875;
        float _1365 = in.m_65.z;
        float _1367 = _1363 * 0.15915493667125701904296875;
        float _1369 = _1367 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1361 * 3.1415927410125732421875;
        float _1375 = _1373 * 0.15915493667125701904296875;
        float _1377 = _1365 * 3.1415927410125732421875;
        float _1379 = _1377 * 0.15915493667125701904296875;
        float _1381 = _1375 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = sin(_1385);
        _1355 = _1365;
        _1138 = 5.839270114898681640625;
        _1349 = _1084;
        _1132 = 1.2345600128173828125;
        _1345 = _1361;
        _1126 = 7.345489978790283203125;
        _1144 = 1;
        _1200 = _1365;
        _1162 = 2;
        _1202 = as_type<int>(_1371);
        _1359 = as_type<int>(_1383);
        _1266 = as_type<int>(_1387);
    }
    float _1389 = _1355;
    float _1391 = _1138;
    float _1393 = _1349;
    float _1395 = _1132;
    float _1397 = _1345;
    float _1399 = _1126;
    int _1401 = _1144;
    float _1403 = _1200;
    int _1405 = _1162;
    int _1407 = _1202;
    int _1409 = _1359;
    int _1411 = _1266;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1415 = _1413 != 0;
    float _1417 = _1389 * _1391;
    int _1419 = ~_1182;
    int _1421 = _1419 + 1;
    float _1423 = 0.0;
    if (_1094)
    {
        float _1425 = in.m_65.x;
        _1423 = _1425;
    }
    float _1427 = _1423;
    float _1429 = _1393 * _1395;
    int _1431 = ~_1228;
    int _1433 = _1431 + 1;
    float _1435 = _1397 * _1399;
    int _1437 = _1421 * int(_1293);
    int _1439 = _1437 + _1244;
    float _1441 = floor(_1429);
    int _1443 = ~_1208;
    int _1445 = _1443 + 1;
    int _1447 = _1433 * int(_1323);
    int _1449 = _1447 + _1286;
    float _1451 = _1393 * _1399;
    float _1453 = float(uint(_1439));
    int _1455 = as_type<int>(_1389);
    if (_1415)
    {
        float _1457 = in.m_65.z;
        _1455 = as_type<int>(_1457);
    }
    int _1459 = _1455;
    int _1461 = ~_1234;
    int _1463 = _1461 + 1;
    int _1465 = 0;
    if (_1415)
    {
        float _1467 = -_1090;
        float _1469 = _1467 + 1.0;
        _1465 = as_type<int>(_1469);
    }
    int _1471 = _1465;
    float _1473 = float(uint(_1449));
    float _1475 = as_type<float>(_1250) * _1453;
    int _1477 = _1445 * int(_1303);
    int _1479 = _1477 + _1260;
    float _1481 = floor(_1435);
    int _1483 = _1463 * int(_1329);
    int _1485 = _1483 + _1274;
    float _1487 = as_type<float>(_1295) * _1473;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1491 = _1489 != 0;
    float _1493 = in.m_73.y;
    float _1495 = float(uint(_1479));
    bool _1497 = _1401 != 1;
    float _1499 = float(uint(_1485));
    float _1501 = trunc(_1475);
    float _1503 = precise::max(_1501, 0.0);
    uint _1505 = uint(_1503);
    float _1507 = _1475;
    float _1509 = _1495;
    if (_1094)
    {
        bool _1511 = _1427 > 0.5;
        _1112 = _1511;
    }
    bool _1513 = _1112;
    float _1515 = as_type<float>(_1262) * _1495;
    float _1517 = as_type<float>(_1276) * _1499;
    float _1519 = in.m_61.w;
    bool _1521 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1523 = isnan(_1078);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1529 = _1525 || _1527;
    float _1531 = float(_1529);
    float _1533 = trunc(_1487);
    float _1535 = precise::max(_1533, 0.0);
    uint _1537 = uint(_1535);
    float _1539 = -_1481;
    float _1541 = _1435 + _1539;
    int _1543 = _1459;
    if (_1415)
    {
        bool _1545 = as_type<float>(_1459) > 0.5;
        _1114 = _1545;
    }
    bool _1547 = _1114;
    if (_1094)
    {
        float _1549 = -_1090;
        float _1551 = _1549 + 1.0;
        _1543 = as_type<int>(_1551);
    }
    int _1553 = _1543;
    float _1555 = float(_1208);
    int _1557 = 0;
    if (_1491)
    {
        float _1559 = -_1090;
        float _1561 = _1559 + 1.0;
        _1557 = as_type<int>(_1561);
    }
    int _1563 = _1557;
    if (!_1415)
    {
        _1507 = _1090;
    }
    float _1565 = _1507;
    float _1567 = in.m_59.w;
    float _1569 = _1565;
    if (_1094)
    {
        float _1571 = _1513 ? as_type<float>(_1553) : _1090;
        _1331 = _1571;
    }
    float _1573 = _1331;
    float _1575 = -_1441;
    float _1577 = _1429 + _1575;
    float _1579 = float(_132);
    float _1581 = floor(_1417);
    int _1583 = int(_1293) + int(_1505);
    float _1585 = in.m_63.w;
    float _1587 = float(_1182);
    float _1589 = float(_1244);
    float _1591 = float(_1228);
    float _1593 = floor(_1451);
    bool _1595 = _1589 >= _1587;
    bool _1597 = isnan(_1589);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan(_1587);
    bool _1603 = _1599 || _1601;
    float _1605 = float(_1603);
    if (_1415)
    {
        float _1607 = _1547 ? as_type<float>(_1471) : _1090;
        _1569 = _1607;
    }
    float _1609 = _1569;
    int _1611 = ~_1208;
    int _1613 = _1611 + 1;
    if (!_1491)
    {
        _1509 = _1090;
    }
    float _1615 = _1509;
    float _1617 = trunc(_1515);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    float _1623 = -_1581;
    float _1625 = _1417 + _1623;
    float _1627 = float(_1260);
    float _1629 = _1591 * _1577;
    float _1631 = float(_1274);
    float _1633 = _1555 * _1625;
    bool _1635 = _1627 >= _1555;
    bool _1637 = isnan(_1627);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan(_1555);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = 1.0 / _1579;
    float _1649 = -_1593;
    float _1651 = _1451 + _1649;
    int _1653 = int(_1323) + int(_1537);
    float _1655 = float(_1234);
    int _1657 = ~_1228;
    int _1659 = _1657 + 1;
    float _1661 = trunc(_1517);
    float _1663 = precise::max(_1661, 0.0);
    uint _1665 = uint(_1663);
    float _1667 = _1541 * _1587;
    float _1669 = _1587 * _166;
    float _1671 = float(_1286);
    int _1673 = _1659 * _1653;
    int _1675 = _1673 + _1286;
    bool _1677 = _1631 >= _1655;
    bool _1679 = isnan(_1631);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan(_1655);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    bool _1689 = _1671 >= _1591;
    bool _1691 = isnan(_1671);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan(_1591);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1669 * _1647;
    int _1703 = int(_1303) + int(_1621);
    float _1705 = _1647 * _166;
    int _1707 = ~_1182;
    int _1709 = _1707 + 1;
    float _1711 = trunc(_1605);
    int _1713 = int(_1711);
    bool _1715 = uint(_1675) >= uint(_1228);
    float _1717 = _1591 * _1705;
    float _1719 = _1555 * _1705;
    float _1721 = _1655 * _1705;
    int _1723 = _1709 * _1583;
    int _1725 = _1723 + _1244;
    float _1727 = _1655 * _1651;
    int _1729 = _1613 * _1703;
    int _1731 = _1729 + _1260;
    float _1733 = trunc(_1629);
    int _1735 = int(_1733);
    int _1737 = int(_1329) + int(_1665);
    bool _1739 = uint(_1725) >= uint(_1182);
    bool _1741 = uint(_1731) >= uint(_1208);
    bool _1743 = !_1739;
    int _1745 = _1743 ? 0 : (-1);
    float _1747 = trunc(_1667);
    int _1749 = int(_1747);
    int _1751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1753 = _1751 != 0;
    int _1755 = ~_1583;
    int _1757 = _1755 + _1745;
    int _1759 = _1757 + 1;
    bool _1761 = !_1753;
    int _1763 = _1761 ? 0 : 1;
    int _1765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1767 = _1765 != 0;
    float _1769 = trunc(_1699);
    int _1771 = int(_1769);
    int _1773 = ~_1234;
    int _1775 = _1773 + 1;
    bool _1777 = !_1715;
    int _1779 = _1777 ? 0 : (-1);
    int _1781 = abs(_1763);
    int _1783 = _1775 * _1737;
    int _1785 = _1783 + _1274;
    int _1787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1789 = _1787 != 0;
    float _1791 = trunc(_1633);
    int _1793 = int(_1791);
    bool _1795 = !_1767;
    int _1797 = _1795 ? 0 : 1;
    int _1799 = _1749 * _1781;
    int _1801 = _1799 + _1244;
    int _1803 = ~_1653;
    int _1805 = _1803 + _1779;
    int _1807 = _1805 + 1;
    bool _1809 = !_1789;
    int _1811 = _1809 ? 0 : 1;
    int _1813 = abs(_1797);
    int _1815 = _1182 * _1759;
    int _1817 = _1815 + _1244;
    float _1819 = _1615;
    float _1821 = as_type<float>(_1801);
    if (_1491)
    {
        float _1823 = _1158 ? as_type<float>(_1563) : _1090;
        _1819 = _1823;
    }
    float _1825 = _1819;
    float _1827 = trunc(_1645);
    int _1829 = int(_1827);
    bool _1831 = _1182 == 0;
    int _1833 = _1735 * _1813;
    int _1835 = _1833 + _1286;
    int _1837 = abs(_1811);
    int _1839 = _1228 * _1807;
    int _1841 = _1839 + _1286;
    bool _1843 = uint(_1785) >= uint(_1234);
    bool _1845 = !_1741;
    int _1847 = _1845 ? 0 : (-1);
    float _1849 = trunc(_1701);
    int _1851 = int(_1849);
    int _1853 = ~_1713;
    int _1855 = _1853 + 1;
    int _1857 = _1855 + 1;
    bool _1859 = !_1831;
    int _1861 = _1859 ? _1817 : (-1);
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1865 = _1863 != 0;
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1869 = _1867 != 0;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1873 = _1871 != 0;
    int _1875 = _1861 * _1857;
    int _1877 = ~_1703;
    int _1879 = _1877 + _1847;
    int _1881 = _1879 + 1;
    int _1883 = _1793 * _1837;
    int _1885 = _1883 + _1260;
    bool _1887 = !_1843;
    int _1889 = _1887 ? 0 : (-1);
    float _1891 = trunc(_1687);
    int _1893 = int(_1891);
    int _1895 = _1182 + (-1);
    int _1897 = _1208 * _1881;
    int _1899 = _1897 + _1260;
    bool _1901 = !_1869;
    int _1903 = _1901 ? 0 : 1;
    bool _1905 = _1228 == 0;
    int _1907 = _1713 * _1895;
    int _1909 = _1907 + _1875;
    bool _1911 = !_1865;
    int _1913 = _1911 ? 0 : 1;
    float _1915 = trunc(_1717);
    int _1917 = int(_1915);
    int _1919 = ~_1737;
    int _1921 = _1919 + _1889;
    int _1923 = _1921 + 1;
    bool _1925 = _1208 == 0;
    int _1927 = abs(_1903);
    int _1929 = ~_1771;
    int _1931 = _1929 + 1;
    int _1933 = _1931 + 1;
    bool _1935 = !_1905;
    int _1937 = _1935 ? _1841 : (-1);
    int _1939 = _1909 * _1927;
    int _1941 = abs(_1913);
    int _1943 = _1234 * _1923;
    int _1945 = _1943 + _1274;
    int _1947 = ~_1829;
    int _1949 = _1947 + 1;
    int _1951 = _1949 + 1;
    int _1953 = _1933 * _1937;
    bool _1955 = !_1925;
    int _1957 = _1955 ? _1899 : (-1);
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1961 = _1959 != 0;
    int _1963 = _1951 * _1957;
    bool _1965 = !_1873;
    int _1967 = _1965 ? 0 : 1;
    int _1969 = _1851 * _1941;
    int _1971 = _1969 + _1939;
    bool _1973 = !_1961;
    int _1975 = _1973 ? 0 : 1;
    bool _1977 = _1234 == 0;
    int _1979 = abs(_1967);
    int _1981 = abs(_1975);
    int _1983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1985 = _1983 != 0;
    int _1987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1989 = _1987 != 0;
    int _1991 = _1801 * _1979;
    int _1993 = _1991 + _1971;
    int _1995 = ~_1893;
    int _1997 = _1995 + 1;
    int _1999 = _1997 + 1;
    bool _2001 = !_1977;
    int _2003 = _2001 ? _1945 : (-1);
    int _2005 = _1749 * _1981;
    int _2007 = _2005 + _1993;
    int _2009 = _1228 + (-1);
    bool _2011 = !_1989;
    int _2013 = _2011 ? 0 : 1;
    int _2015 = _1999 * _2003;
    float _2017 = float(uint(_2007));
    int _2019 = _1771 * _2009;
    int _2021 = _2019 + _1953;
    int _2023 = abs(_2013);
    bool _2025 = !_1985;
    int _2027 = _2025 ? 0 : 1;
    float _2029 = as_type<float>(_1250) * _2017;
    int _2031 = _1208 + (-1);
    int _2033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2035 = _2033 != 0;
    int _2037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2039 = _2037 != 0;
    float _2041 = trunc(_2029);
    float _2043 = precise::max(_2041, 0.0);
    uint _2045 = uint(_2043);
    int _2047 = abs(_2027);
    int _2049 = _1829 * _2031;
    int _2051 = _2049 + _1963;
    int _2053 = _2021 * _2023;
    bool _2055 = !_2035;
    int _2057 = _2055 ? 0 : 1;
    float _2059 = trunc(_1719);
    int _2061 = int(_2059);
    int _2063 = abs(_2057);
    float _2065 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2067 = _2065 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2069 = _1234 + (-1);
    int _2071 = _1917 * _2047;
    int _2073 = _2071 + _2053;
    int _2075 = ~_1182;
    int _2077 = _2075 + 1;
    int _2079 = _1893 * _2069;
    int _2081 = _2079 + _2015;
    bool _2083 = !_2039;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _1835 * _2063;
    int _2089 = _2087 + _2073;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2093 = _2091 != 0;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2097 = _2095 != 0;
    float _2099 = 1.0 / _2067;
    int _2101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2103 = _2101 != 0;
    int _2105 = abs(_2085);
    int _2107 = _2077 * int(_2045);
    int _2109 = _2107 + _2007;
    bool _2111 = !_2103;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = trunc(_1727);
    int _2117 = int(_2115);
    int _2119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2121 = _2119 != 0;
    bool _2123 = !_2097;
    int _2125 = _2123 ? 0 : 1;
    bool _2127 = !_2121;
    int _2129 = _2127 ? 0 : 1;
    float _2131 = float(uint(_2109));
    int _2133 = _1735 * _2105;
    int _2135 = _2133 + _2089;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2139 = _2137 != 0;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2143 = _2141 != 0;
    int _2145 = abs(_2125);
    float _2147 = as_type<float>(_1250) * _2131;
    bool _2149 = !_2093;
    int _2151 = _2149 ? 0 : 1;
    bool _2153 = !_2143;
    int _2155 = _2153 ? 0 : 1;
    int _2157 = _2051 * _2145;
    float _2159 = float(uint(_2135));
    float _2161 = trunc(_2147);
    float _2163 = precise::max(_2161, 0.0);
    uint _2165 = uint(_2163);
    int _2167 = abs(_2151);
    int _2169 = abs(_2155);
    float _2171 = as_type<float>(_1295) * _2159;
    int _2173 = abs(_2113);
    int _2175 = _2061 * _2167;
    int _2177 = _2175 + _2157;
    int _2179 = abs(_2129);
    float _2181 = trunc(_2171);
    float _2183 = precise::max(_2181, 0.0);
    uint _2185 = uint(_2183);
    int _2187 = _2081 * _2169;
    int _2189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2191 = _2189 != 0;
    int _2193 = _2117 * _2179;
    int _2195 = _2193 + _1274;
    int _2197 = ~_1228;
    int _2199 = _2197 + 1;
    int _2201 = _1885 * _2173;
    int _2203 = _2201 + _2177;
    bool _2205 = !_2191;
    int _2207 = _2205 ? 0 : 1;
    float _2209 = trunc(_1721);
    int _2211 = int(_2209);
    bool _2213 = !_2139;
    int _2215 = _2213 ? 0 : 1;
    float _2217 = -_1493;
    float _2219 = _2217 + 1.0;
    int _2221 = abs(_2207);
    int _2223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2225 = _2223 != 0;
    int _2227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2229 = _2227 != 0;
    int _2231 = int(_2045) + int(_2165);
    int _2233 = _2199 * int(_2185);
    int _2235 = _2233 + _2135;
    int _2237 = abs(_2215);
    int _2239 = ~_1182;
    int _2241 = _2239 + 1;
    float _2243 = float(uint(_2235));
    int _2245 = _1793 * _2221;
    int _2247 = _2245 + _2203;
    bool _2249 = !_2225;
    int _2251 = _2249 ? 0 : 1;
    int _2253 = _2211 * _2237;
    int _2255 = _2253 + _2187;
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2259 = _2257 != 0;
    int _2261 = _2241 * _2231;
    int _2263 = _2261 + _2007;
    int _2265 = abs(_2251);
    float _2267 = as_type<float>(_1295) * _2243;
    float _2269 = float(uint(_2247));
    bool _2271 = uint(_2263) >= uint(_1182);
    float _2273 = trunc(_2267);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    bool _2279 = !_2229;
    int _2281 = _2279 ? 0 : 1;
    float _2283 = as_type<float>(_1262) * _2269;
    bool _2285 = !_2271;
    int _2287 = _2285 ? 0 : (-1);
    int _2289 = abs(_2281);
    float _2291 = trunc(_2283);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _2281;
    if (_2259)
    {
        float _2299 = -_1090;
        float _2301 = _2299 + 1.0;
        _2297 = as_type<int>(_2301);
    }
    int _2303 = _2297;
    int _2305 = _2195 * _2265;
    int _2307 = _2305 + _2255;
    bool _2309 = _1084 > 0.5;
    int _2311 = ~_2231;
    int _2313 = _2311 + _2287;
    int _2315 = _2313 + 1;
    int _2317 = _2117 * _2289;
    int _2319 = _2317 + _2307;
    if (_2259)
    {
        float _2321 = _2309 ? as_type<float>(_2303) : _1090;
        _1164 = _2321;
    }
    float _2323 = _1164;
    bool _2325 = _1182 == 0;
    int _2327 = _1182 * _2315;
    int _2329 = _2327 + _2007;
    float _2331 = float(uint(_2319));
    float _2333 = in.m_65.w;
    int _2335 = ~_1208;
    int _2337 = _2335 + 1;
    bool _2339 = !_2325;
    int _2341 = _2339 ? _2329 : (-1);
    float _2343 = as_type<float>(_1276) * _2331;
    int _2345 = int(_2185) + int(_2277);
    int _2347 = _2337 * int(_2295);
    int _2349 = _2347 + _2247;
    int _2351 = _2341 & 3;
    bool _2353 = _2351 != 0;
    float _2355 = trunc(_2343);
    float _2357 = precise::max(_2355, 0.0);
    uint _2359 = uint(_2357);
    int _2361 = ~_1228;
    int _2363 = _2361 + 1;
    bool _2365 = uint(_2351) > 1u;
    float _2367 = float(uint(_2349));
    int _2369 = _2363 * _2345;
    int _2371 = _2369 + _2135;
    int _2373 = _2341 & 3;
    bool _2375 = _2373 != 0;
    int _2377 = ~_1234;
    int _2379 = _2377 + 1;
    float _2381 = as_type<float>(_1262) * _2367;
    int _2383 = _2375 ? 0 : 1;
    bool _2385 = uint(_2371) >= uint(_1228);
    int _2387 = ~_2383;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    float _2393 = trunc(_2381);
    float _2395 = precise::max(_2393, 0.0);
    uint _2397 = uint(_2395);
    int _2399 = _2391;
    if (!_2365)
    {
        int _2401 = ~_2383;
        int _2403 = _2401 + 1;
        _2399 = _2403;
    }
    int _2405 = _2399;
    int _2407 = _2379 * int(_2359);
    int _2409 = _2407 + _2319;
    bool _2411 = !_2385;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = _2351 != 3;
    bool _2417 = uint(_2351) >= 2u;
    int _2419 = ~_2345;
    int _2421 = _2419 + _2413;
    int _2423 = _2421 + 1;
    int _2425 = _2417 ? 0 : 1;
    float _2427 = float(uint(_2409));
    int _2429 = _1228 * _2423;
    int _2431 = _2429 + _2135;
    int _2433 = _2309 ? as_type<int>(_2219) : as_type<int>(_1493);
    bool _2435 = _2333 > 0.5;
    float _2437 = as_type<float>(_1276) * _2427;
    int _2439 = ~_1208;
    int _2441 = _2439 + 1;
    bool _2443 = _1228 == 0;
    float _2445 = trunc(_2437);
    float _2447 = precise::max(_2445, 0.0);
    uint _2449 = uint(_2447);
    int _2451 = ~_2425;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = _2455;
    if (_2415)
    {
        int _2459 = ~_2425;
        int _2461 = _2459 + 1;
        _2457 = _2461;
    }
    int _2463 = _2457;
    int _2465 = int(_2295) + int(_2397);
    bool _2467 = !_2443;
    int _2469 = _2467 ? _2431 : (-1);
    int _2471 = _2435 ? as_type<int>(_2219) : as_type<int>(_1493);
    int _2473 = _2441 * _2465;
    int _2475 = _2473 + _2247;
    int _2477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2479 = _2477 != 0;
    int _2481 = _2469 & 3;
    bool _2483 = _2481 != 0;
    bool _2485 = !_2479;
    int _2487 = _2485 ? 0 : 1;
    bool _2489 = uint(_2481) >= 2u;
    int _2491 = _2483 ? 0 : 1;
    bool _2493 = uint(_2475) >= uint(_1208);
    int _2495 = _2489 ? 0 : 1;
    bool _2497 = _2481 != 3;
    bool _2499 = !_2493;
    int _2501 = _2499 ? 0 : (-1);
    int _2503 = ~_1234;
    int _2505 = _2503 + 1;
    bool _2507 = uint(_2481) > 1u;
    int _2509 = ~_2465;
    int _2511 = _2509 + _2501;
    int _2513 = _2511 + 1;
    int _2515 = int(_2359) + int(_2449);
    int _2517 = _1208 * _2513;
    int _2519 = _2517 + _2247;
    bool _2521 = _1208 == 0;
    int _2523 = ~_2495;
    int _2525 = _2523 + 1;
    int _2527 = _2525 + 1;
    int _2529 = _2505 * _2515;
    int _2531 = _2529 + _2319;
    int _2533 = _2527;
    if (_2497)
    {
        int _2535 = ~_2495;
        int _2537 = _2535 + 1;
        _2533 = _2537;
    }
    int _2539 = _2533;
    int _2541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2543 = _2541 != 0;
    int _2545 = ~_2491;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    bool _2551 = !_2521;
    int _2553 = _2551 ? _2519 : (-1);
    int _2555 = _2549;
    if (!_2507)
    {
        int _2557 = ~_2491;
        int _2559 = _2557 + 1;
        _2555 = _2559;
    }
    int _2561 = _2555;
    bool _2563 = uint(_2531) >= uint(_1234);
    bool _2565 = !_2543;
    int _2567 = _2565 ? 0 : 1;
    int _2569 = _2553 & 3;
    bool _2571 = _2569 != 0;
    bool _2573 = !_2563;
    int _2575 = _2573 ? 0 : (-1);
    int _2577 = _2571 ? 0 : 1;
    bool _2579 = uint(_2569) >= 2u;
    bool _2581 = _2569 != 3;
    int _2583 = ~_2515;
    int _2585 = _2583 + _2575;
    int _2587 = _2585 + 1;
    int _2589 = _2579 ? 0 : 1;
    bool _2591 = uint(_2569) > 1u;
    int _2593 = _1234 * _2587;
    int _2595 = _2593 + _2319;
    bool _2597 = _1234 == 0;
    int _2599 = ~_2589;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    bool _2605 = !_2597;
    int _2607 = _2605 ? _2595 : (-1);
    int _2609 = _2603;
    if (_2581)
    {
        int _2611 = ~_2589;
        int _2613 = _2611 + 1;
        _2609 = _2613;
    }
    int _2615 = _2609;
    int _2617 = _2607 & 3;
    bool _2619 = _2617 != 0;
    int _2621 = ~_2577;
    int _2623 = _2621 + 1;
    int _2625 = _2623 + 1;
    int _2627 = _2625;
    if (!_2591)
    {
        int _2629 = ~_2577;
        int _2631 = _2629 + 1;
        _2627 = _2631;
    }
    int _2633 = _2627;
    bool _2635 = uint(_2617) >= 2u;
    int _2637 = _2619 ? 0 : 1;
    int _2639 = _2635 ? 0 : 1;
    bool _2641 = _2617 != 3;
    bool _2643 = uint(_2617) > 1u;
    int _2645 = ~_2639;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = ~_2637;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    float _2657 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2659 = _2657 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2661 = _2649;
    int _2663 = _2655;
    if (_2641)
    {
        int _2665 = ~_2639;
        int _2667 = _2665 + 1;
        _2661 = _2667;
    }
    int _2669 = _2661;
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2673 = _2671 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    if (!_2643)
    {
        int _2675 = ~_2637;
        int _2677 = _2675 + 1;
        _2663 = _2677;
    }
    int _2679 = _2663;
    float _2681 = 1.0 / _2659;
    float _2683 = in.m_50.x;
    float _2685 = in.m_50.y;
    float _2687 = in.m_50.z;
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2691 = _2689 != 0;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2699 = _2697 != 0;
    bool _2701 = !_2691;
    int _2703 = _2701 ? 0 : 1;
    float _2705 = _2699 ? as_type<float>(_2433) : _1493;
    float _2707 = 1.0 / _2673;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2711 = _2709 != 0;
    bool _2713 = _1403 > 0.5;
    float _2715 = _2711 ? as_type<float>(_2471) : _1493;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2719 = _2717 != 0;
    float _2721 = 1.0 / _2695;
    int _2723 = _2713 ? as_type<int>(_2219) : as_type<int>(_1493);
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2727 = _2725 != 0;
    float _2729 = _2719 ? as_type<float>(_2723) : _1493;
    float _2731 = _2727 ? as_type<float>(_2723) : _1493;
    float _2733 = _198 * _2685;
    int _2735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2737 = _2735 != 0;
    int _2739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2741 = _2739 != 0;
    float _2743 = _204 * _2685;
    int _2745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2747 = _2745 != 0;
    float _2749 = _210 * _2685;
    float _2751 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2753 = fma(_196, _2683, _2733);
    float _2755 = fma(_208, _2683, _2749);
    float _2757 = fma(_202, _2683, _2743);
    float _2759 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2761 = _2759 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2763 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2765 = fma(_200, _2687, _2753);
    float _2767 = fma(_2751, -2.0, _2763);
    float _2769 = _1397 * 2.0;
    float _2771 = fma(_206, _2687, _2757);
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2775 = _2773 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2777 = floor(_2769);
    float _2779 = fma(_212, _2687, _2755);
    float _2781 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2781;
    float _2785 = _2737 ? as_type<float>(_2723) : _1493;
    float _2787 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2789 = _1078 + _2787;
    bool _2791 = !_2747;
    int _2793 = _2791 ? 0 : 1;
    float _2795 = _2783 * _2681;
    float _2797 = 1.0 / _2761;
    float _2799 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2801 = _2799 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2803 = _2741 ? as_type<float>(_2723) : _1493;
    float _2805 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2767);
    int _2807 = ~_1182;
    int _2809 = _2807 + 1;
    float _2811 = float(uint(_1835));
    float _2813 = 1.0 / _2775;
    float _2815 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2817 = _2815 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2819 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2821 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2819;
    bool _2823 = _2777 >= 0.0;
    bool _2825 = isnan(_2777);
    bool _2827 = _2823 || _2825;
    bool _2829 = isnan(0.0);
    bool _2831 = _2827 || _2829;
    float _2833 = as_type<float>(_1295) * _2811;
    float _2835 = _2817 * _2099;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2841 = 1.0 / _2801;
    float _2843 = _2821 * _2721;
    bool _2845 = _2777 > 0.0;
    float _2847 = _2839 * _2707;
    float _2849 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2851 = _2849 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2853 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2853;
    float _2857 = _1084 * 2.0;
    float _2859 = _2851 * _2813;
    float _2861 = _2855 * _2797;
    float _2863 = _2831 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2865 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2865;
    float _2869 = floor(_2857);
    float _2871 = fma(_2843, _2789, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2873 = ~as_type<int>(_2863);
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    float _2879 = _2867 * _2841;
    float _2881 = float(uint(_1801));
    bool _2883 = _1405 != 2;
    int _2885 = _2877;
    float _2887 = _2841;
    float _2889 = _2863;
    float _2891 = _2721;
    float _2893 = _2779;
    if (!_2845)
    {
        int _2895 = ~as_type<int>(_2863);
        int _2897 = _2895 + 1;
        _2885 = _2897;
    }
    int _2899 = _2885;
    float _2901 = trunc(_2833);
    float _2903 = precise::max(_2901, 0.0);
    uint _2905 = uint(_2903);
    bool _2907 = !_1497;
    float _2909 = _2907 ? as_type<float>(_1407) : as_type<float>(_1409);
    float _2911 = as_type<float>(_1250) * _2881;
    bool _2913 = !_1497;
    float _2915 = _2913 ? as_type<float>(_1411) : as_type<float>(_1407);
    float _2917 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2919 = _1078 + _2917;
    float _2921 = float(uint(_1885));
    if (!_1497)
    {
        _2887 = _1084;
    }
    float _2923 = _2887;
    float _2925 = trunc(_2911);
    float _2927 = precise::max(_2925, 0.0);
    uint _2929 = uint(_2927);
    float _2931 = 0.0;
    float _2933 = _2923;
    if (!_1497)
    {
        _2931 = _1084;
    }
    float _2935 = _2931;
    float _2937 = fma(_2835, _2919, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2939 = _2935;
    float _2941 = _2937;
    if (!_1497)
    {
        _2889 = _1403;
    }
    float _2943 = _2889;
    float _2945 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2947 = _1078 + _2945;
    float _2949 = _2943;
    if (!_1497)
    {
        _2891 = _1403;
    }
    float _2951 = _2891;
    float _2953 = _2951;
    if (_1497)
    {
        _2933 = _1397;
    }
    float _2955 = _2933;
    if (_1497)
    {
        _2939 = _1397;
    }
    float _2957 = _2939;
    if (_1497)
    {
        _2949 = _1084;
    }
    float _2959 = _2949;
    float _2961 = _2955 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1497)
    {
        _2953 = _1084;
    }
    float _2963 = _2953;
    bool _2965 = _2869 > 0.0;
    bool _2967 = _2869 >= 0.0;
    bool _2969 = isnan(_2869);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan(0.0);
    bool _2975 = _2971 || _2973;
    float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2979 = _1078 + _2977;
    int _2981 = ~_1228;
    int _2983 = _2981 + 1;
    float _2985 = fma(_2795, _2979, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2987 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2989 = _1078 + _2987;
    int _2991 = _2809 * int(_2929);
    int _2993 = _2991 + _1801;
    float _2995 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2997 = _1078 + _2995;
    float _2999 = fma(_2847, _2989, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3001 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3003 = _1078 + _3001;
    float _3005 = float(uint(_2993));
    float _3007 = fma(_2859, _2997, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _3009 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3011 = isnan(_1078);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3017 = _3013 || _3015;
    float _3019 = float(_3017);
    float _3021 = fma(_2861, _3003, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3023 = fma(_2879, _2947, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _3025 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3027 = isnan(_1078);
    bool _3029 = _3025 || _3027;
    bool _3031 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3033 = _3029 || _3031;
    float _3035 = float(_3033);
    float _3037 = as_type<float>(_1250) * _3005;
    bool _3039 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3041 = isnan(_1078);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3047 = _3043 || _3045;
    float _3049 = float(_3047);
    float _3051 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    bool _3053 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3055 = isnan(_1078);
    bool _3057 = _3053 || _3055;
    bool _3059 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3061 = _3057 || _3059;
    float _3063 = float(_3061);
    float _3065 = -_3035;
    float _3067 = _3065 + 1.0;
    bool _3069 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3071 = isnan(_1078);
    bool _3073 = _3069 || _3071;
    bool _3075 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3077 = _3073 || _3075;
    float _3079 = float(_3077);
    float _3081 = -_3049;
    float _3083 = _3081 + 1.0;
    bool _3085 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3087 = isnan(_1078);
    bool _3089 = _3085 || _3087;
    bool _3091 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3093 = _3089 || _3091;
    float _3095 = float(_3093);
    float _3097 = _3019 * _3067;
    float _3099 = -_3019;
    float _3101 = _3099 + 1.0;
    float _3103 = as_type<float>(_1262) * _2921;
    bool _3105 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3107 = isnan(_1078);
    bool _3109 = _3105 || _3107;
    bool _3111 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3113 = _3109 || _3111;
    float _3115 = float(_3113);
    float _3117 = trunc(_3037);
    float _3119 = precise::max(_3117, 0.0);
    uint _3121 = uint(_3119);
    float _3123 = _3049 * _3101;
    float _3125 = float(uint(_2195));
    float _3127 = fma(_2909, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3051);
    float _3129 = _3115 * _3083;
    float _3131 = -_3115;
    float _3133 = _3131 + 1.0;
    float _3135 = as_type<float>(_1276) * _3125;
    float _3137 = trunc(_3103);
    float _3139 = precise::max(_3137, 0.0);
    uint _3141 = uint(_3139);
    int _3143 = ~_1208;
    int _3145 = _3143 + 1;
    float _3147 = -_3095;
    float _3149 = _3147 + 1.0;
    int _3151 = _2983 * int(_2905);
    int _3153 = _3151 + _1835;
    float _3155 = _3095 * _3133;
    float _3157 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3159 = _1531 * _3149;
    float _3161 = -_1531;
    float _3163 = _3161 + 1.0;
    float _3165 = trunc(_3135);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    float _3171 = float(uint(_3153));
    float _3173 = _2909 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3175 = _3079 * _3163;
    float _3177 = -_3079;
    float _3179 = _3177 + 1.0;
    float _3181 = as_type<float>(_1295) * _3171;
    int _3183 = ~_1234;
    int _3185 = _3183 + 1;
    int _3187 = _3145 * int(_3141);
    int _3189 = _3187 + _1885;
    float _3191 = _3063 * _3179;
    float _3193 = -_3063;
    float _3195 = _3193 + 1.0;
    int _3197 = _2975 ? 0 : 1;
    float _3199 = trunc(_3181);
    float _3201 = precise::max(_3199, 0.0);
    uint _3203 = uint(_3201);
    float _3205 = float(uint(_3189));
    float _3207 = _2985 * _3191;
    float _3209 = _2771 + _1519;
    float _3211 = -_3157;
    float _3213 = fma(_3173, 2.0, _3211);
    float _3215 = as_type<float>(_1262) * _3205;
    float _3217 = fma(_3195, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3207);
    float _3219 = _2765 + _1567;
    int _3221 = ~_3197;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    float _3227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3229 = _3185 * int(_3169);
    int _3231 = _3229 + _2195;
    float _3233 = fma(_2937, _3175, _3217);
    int _3235 = _3225;
    float _3237 = _3219;
    if (!_2965)
    {
        int _3239 = ~_3197;
        int _3241 = _3239 + 1;
        _3235 = _3241;
    }
    int _3243 = _3235;
    float _3245 = _2779 + _1585;
    int _3247 = int(_2905) + int(_3203);
    float _3249 = fma(_2871, _3159, _3233);
    float _3251 = float(uint(_3231));
    float _3253 = trunc(_3215);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    int _3259 = ~_1182;
    int _3261 = _3259 + 1;
    float _3263 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3265 = _3209 + _3263;
    int _3267 = int(_2929) + int(_3121);
    float _3269 = as_type<float>(_1276) * _3251;
    int _3271 = ~_1228;
    int _3273 = _3271 + 1;
    float _3275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3277 = _3219 + _3275;
    int _3279 = ~_1208;
    int _3281 = _3279 + 1;
    float _3283 = trunc(_3269);
    float _3285 = precise::max(_3283, 0.0);
    uint _3287 = uint(_3285);
    int _3289 = _3261 * _3267;
    int _3291 = _3289 + _1801;
    float _3293 = fma(_2999, _3155, _3249);
    bool _3295 = !_2883;
    float _3297 = _3295 ? as_type<float>(_1411) : as_type<float>(_1409);
    float _3299 = _3227 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3301 = fma(_3021, _3129, _3293);
    bool _3303 = uint(_3291) >= uint(_1182);
    int _3305 = _3273 * _3247;
    int _3307 = _3305 + _1835;
    int _3309 = int(_3141) + int(_3257);
    float _3311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _3313 = fma(_3007, _3123, _3301);
    int _3315 = ~_1234;
    int _3317 = _3315 + 1;
    float _3319 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3321 = !_3303;
    int _3323 = _3321 ? 0 : (-1);
    int _3325 = _3281 * _3309;
    int _3327 = _3325 + _1885;
    int _3329 = int(_3169) + int(_3287);
    float _3331 = _3265 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _3333 = uint(_3307) >= uint(_1228);
    float _3335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3337 = _3245 + _3335;
    float _3339 = _1084 + _1397;
    bool _3341 = !_3333;
    int _3343 = _3341 ? 0 : (-1);
    float _3345 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3127);
    bool _3347 = uint(_3327) >= uint(_1208);
    int _3349 = _3317 * _3329;
    int _3351 = _3349 + _2195;
    float _3353 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3331);
    int _3355 = ~_3267;
    int _3357 = _3355 + _3323;
    int _3359 = _3357 + 1;
    float _3361 = _3311 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    bool _3363 = !_3347;
    int _3365 = _3363 ? 0 : (-1);
    float _3367 = fma(_3337, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3353);
    bool _3369 = uint(_3351) >= uint(_1234);
    int _3371 = _1182 * _3359;
    int _3373 = _3371 + _1801;
    int _3375 = ~_3247;
    int _3377 = _3375 + _3343;
    int _3379 = _3377 + 1;
    float _3381 = fma(_3023, _3097, _3313);
    bool _3383 = !_3369;
    int _3385 = _3383 ? 0 : (-1);
    float _3387 = fma(_3299, _1190, -0.5);
    bool _3389 = _3367 >= 0.0;
    int _3391 = _1228 * _3379;
    int _3393 = _3391 + _1835;
    float _3395 = fma(_3361, _1343, -0.5);
    float _3397 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3399 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3401 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3403 = (*spvDescriptorSet0.vp_c9)._m0[103].z + (*spvDescriptorSet0.vp_c9)._m0[103].x;
    int _3405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].z);
    if (_3389)
    {
        _1821 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3407 = _1821;
    float _3409 = -_3399;
    float _3411 = fma(_3319, 2.0, _3409);
    float _3413 = fma(as_type<float>(_1409), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3401);
    if (_3389)
    {
        float _3415 = _3407 * 5.0;
        _3405 = as_type<int>(_3415);
    }
    int _3417 = _3405;
    float _3419 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _3421 = !_2883;
    float _3423 = _3421 ? as_type<float>(_1409) : as_type<float>(_1407);
    float _3425 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3427 = fma(as_type<float>(_1409), (*spvDescriptorSet0.vp_c9)._m0[103].z, _3403);
    if (_3389)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11730 = as_type<float>(_3417);
        out.gl_Position.z = _11730;
    }
    float _3429 = as_type<float>(_1409) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3431 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[103].w + (*spvDescriptorSet0.vp_c9)._m0[103].y;
    float _3435 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3437 = as_type<float>(_1407) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _3439 = !_2353;
    int _3441 = _3439 ? 0 : 1;
    float _3443 = fma(_2963, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3419);
    float _3445 = -_3425;
    float _3447 = fma(_3429, 2.0, _3445);
    int _3449 = _2469 & 3;
    bool _3451 = _3449 != 0;
    float _3453 = _1403 * 2.0;
    float _3455 = fma(_3437, -2.0, _3435);
    float _3457 = _3265 * _3265;
    bool _3459 = !_3451;
    int _3461 = _3459 ? 0 : 1;
    float _3463 = fma(_2957, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3397);
    float _3465 = fma(_3277, _3277, _3457);
    int _3467 = _2553 & 3;
    bool _3469 = _3467 != 0;
    float _3471 = floor(_3453);
    float _3473 = fma(_3337, _3337, _3465);
    bool _3475 = !_3469;
    int _3477 = _3475 ? 0 : 1;
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3481 = _2607 & 3;
    bool _3483 = _3481 != 0;
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3487 = rsqrt(_3473);
    float _3489 = fma(_2915, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3479);
    bool _3491 = !_3483;
    int _3493 = _3491 ? 0 : 1;
    float _3495 = _2915 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    bool _3497 = _2351 != 3;
    float _3499 = (*spvDescriptorSet0.vp_c9)._m0[102].x + (*spvDescriptorSet0.vp_c9)._m0[101].z;
    float _3501 = _3297 * (*spvDescriptorSet0.vp_c9)._m0[102].x;
    int _3503 = _2469 >> 31;
    float _3505 = fma(_3495, -2.0, _3485);
    bool _3507 = !_3497;
    int _3509 = _3507 ? 0 : (-1);
    float _3511 = _3423 * (*spvDescriptorSet0.vp_c9)._m0[102].y;
    int _3513 = _2341 >> 31;
    float _3515 = -_3499;
    float _3517 = fma(_3501, 2.0, _3515);
    bool _3519 = _2481 != 3;
    float _3521 = fma(_3035, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3381);
    if (_2883)
    {
        _2941 = _1397;
    }
    float _3523 = _2941;
    float _3525 = _3277 * _3487;
    float _3527 = _3523;
    if (_2883)
    {
        _2893 = _1084;
    }
    float _3529 = _2893;
    float _3531 = _3265 * _3487;
    int _3533 = _3503 & 3;
    float _3535 = fma(as_type<float>(_1407), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3431);
    float _3537 = _3529;
    if (!_2883)
    {
        _3527 = _1403;
    }
    float _3539 = _3527;
    float _3541 = -_3531;
    float _3543 = fma(_3541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3265);
    if (!_2883)
    {
        _3537 = _1397;
    }
    float _3545 = _3537;
    float _3547 = fma(as_type<float>(_1407), (*spvDescriptorSet0.vp_c9)._m0[103].w, _3433);
    bool _3549 = _3471 > 0.0;
    float _3551 = _3543 * _3543;
    bool _3553 = _3471 >= 0.0;
    bool _3555 = isnan(_3471);
    bool _3557 = _3553 || _3555;
    bool _3559 = isnan(0.0);
    bool _3561 = _3557 || _3559;
    float _3563 = _3339 + (-1.0);
    int _3565 = _3513 & 3;
    float _3567 = _3545 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3569 = !_3519;
    int _3571 = _3569 ? 0 : (-1);
    float _3573 = fma(_3563, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _3575 = _2569 != 3;
    float _3577 = -_3525;
    float _3579 = fma(_3577, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3277);
    int _3581 = _2469 + _3533;
    float _3583 = _3539 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3585 = _2341 + _3565;
    float _3587 = fma(_3579, _3579, _3551);
    float _3589 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3591 = int(_3589);
    int _3593 = _3581 >> 2;
    out.m_75.x = _3521;
    int _3595 = _2553 >> 31;
    float _3597 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _3599 = _3585 >> 2;
    float _3601 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3505);
    int _3603 = _3595 & 3;
    float _3605 = -_3597;
    float _3607 = fma(_2961, 2.0, _3605);
    float _3609 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3611 = _3599 << 4;
    int _3613 = _3611 + 368;
    float _3615 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3617 = int(_3615);
    int _3619 = _2553 + _3603;
    float _3621 = (*spvDescriptorSet0.vp_c9)._m0[102].y + (*spvDescriptorSet0.vp_c9)._m0[101].w;
    uint _3623 = uint(int(uint(_3613) >> uint(2)));
    uint _3625 = uint(int(uint(int(_3623)) >> uint(2)));
    int _3627 = int(_3623) & 3;
    float _3629 = (*spvDescriptorSet0.vp_c9)._m0[int(_3625)][_3627];
    int _3631 = int(_3623) + 1;
    uint _3633 = uint(int(uint(_3631) >> uint(2)));
    int _3635 = _3631 & 3;
    float _3637 = (*spvDescriptorSet0.vp_c9)._m0[int(_3633)][_3635];
    float _3639 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3413);
    int _3641 = _3619 >> 2;
    float _3643 = fma(_3511, -2.0, _3621);
    int _3645 = _2607 >> 31;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3649 = _3641 << 4;
    int _3651 = _3649 + 656;
    float _3653 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3535);
    int _3655 = _3593 << 4;
    int _3657 = _3655 + 512;
    float _3659 = fma(_3609, -2.0, _3647);
    int _3661 = _3645 & 3;
    uint _3663 = uint(int(uint(_3651) >> uint(2)));
    uint _3665 = uint(int(uint(int(_3663)) >> uint(2)));
    int _3667 = int(_3663) & 3;
    float _3669 = (*spvDescriptorSet0.vp_c9)._m0[int(_3665)][_3667];
    int _3671 = int(_3663) + 1;
    uint _3673 = uint(int(uint(_3671) >> uint(2)));
    int _3675 = _3671 & 3;
    float _3677 = (*spvDescriptorSet0.vp_c9)._m0[int(_3673)][_3675];
    float _3679 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3681 = int(_3679);
    int _3683 = _2607 + _3661;
    float _3685 = _3337 * _3487;
    int _3687 = _3561 ? 0 : 1;
    float _3689 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3691 = _3683 >> 2;
    uint _3693 = uint(int(uint(_3657) >> uint(2)));
    uint _3695 = uint(int(uint(int(_3693)) >> uint(2)));
    int _3697 = int(_3693) & 3;
    float _3699 = (*spvDescriptorSet0.vp_c9)._m0[int(_3695)][_3697];
    int _3701 = int(_3693) + 1;
    uint _3703 = uint(int(uint(_3701) >> uint(2)));
    int _3705 = _3701 & 3;
    float _3707 = (*spvDescriptorSet0.vp_c9)._m0[int(_3703)][_3705];
    float _3709 = -_3685;
    float _3711 = fma(_3709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3337);
    bool _3713 = _2617 != 3;
    float _3715 = fma(_3567, -2.0, _3689);
    float _3717 = fma(_3711, _3711, _3587);
    int _3719 = abs(_2405);
    float _3721 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[102].z, _3427);
    int _3723 = ~_3687;
    int _3725 = _3723 + 1;
    int _3727 = _3725 + 1;
    float _3729 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3731 = _3727;
    if (!_3549)
    {
        int _3733 = ~_3687;
        int _3735 = _3733 + 1;
        _3731 = _3735;
    }
    int _3737 = _3731;
    float _3739 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[102].w, _3547);
    int _3741 = ~_3329;
    int _3743 = _3741 + _3385;
    int _3745 = _3743 + 1;
    float _3747 = -_3729;
    float _3749 = fma(_3583, 2.0, _3747);
    int _3751 = abs(_2561);
    float _3753 = -_166;
    float _3755 = fma(_3753, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3213);
    int _3757 = _3691 << 4;
    int _3759 = _3757 + 800;
    int _3761 = _3651 + 8;
    uint _3763 = uint(int(uint(_3761) >> uint(2)));
    uint _3765 = uint(int(uint(int(_3763)) >> uint(2)));
    int _3767 = int(_3763) & 3;
    float _3769 = (*spvDescriptorSet0.vp_c9)._m0[int(_3765)][_3767];
    int _3771 = int(_3763) + 1;
    uint _3773 = uint(int(uint(_3771) >> uint(2)));
    int _3775 = _3771 & 3;
    float _3777 = (*spvDescriptorSet0.vp_c9)._m0[int(_3773)][_3775];
    float _3779 = fma(_3345, _3387, _3755);
    int _3781 = ~_3309;
    int _3783 = _3781 + _3365;
    int _3785 = _3783 + 1;
    float _3787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3789 = ~_3719;
    int _3791 = _3789 + 1;
    int _3793 = _3791 + 1;
    float _3795 = -_166;
    float _3797 = fma(_3795, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3411);
    int _3799 = abs(_3461);
    int _3801 = _3657 + 8;
    uint _3803 = uint(int(uint(_3801) >> uint(2)));
    uint _3805 = uint(int(uint(int(_3803)) >> uint(2)));
    int _3807 = int(_3803) & 3;
    float _3809 = (*spvDescriptorSet0.vp_c9)._m0[int(_3805)][_3807];
    int _3811 = int(_3803) + 1;
    uint _3813 = uint(int(uint(_3811) >> uint(2)));
    int _3815 = _3811 & 3;
    float _3817 = (*spvDescriptorSet0.vp_c9)._m0[int(_3813)][_3815];
    int _3819 = _1208 * _3785;
    int _3821 = _3819 + _1885;
    int _3823 = ~_3751;
    int _3825 = _3823 + 1;
    int _3827 = _3825 + 1;
    int _3829 = _3793 * as_type<int>(_3637);
    int _3831 = abs(_3441);
    int _3833 = _1234 * _3745;
    int _3835 = _3833 + _2195;
    int _3837 = abs(_3477);
    float _3839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    uint _3841 = uint(int(uint(_3759) >> uint(2)));
    uint _3843 = uint(int(uint(int(_3841)) >> uint(2)));
    int _3845 = int(_3841) & 3;
    float _3847 = (*spvDescriptorSet0.vp_c9)._m0[int(_3843)][_3845];
    int _3849 = int(_3841) + 1;
    uint _3851 = uint(int(uint(_3849) >> uint(2)));
    int _3853 = _3849 & 3;
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[int(_3851)][_3853];
    int _3857 = abs(_2633);
    float _3859 = -_166;
    float _3861 = fma(_3859, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3447);
    int _3863 = abs(_2679);
    float _3865 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3455);
    float _3867 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3463);
    int _3869 = ~_3857;
    int _3871 = _3869 + 1;
    int _3873 = _3871 + 1;
    int _3875 = _3613 + 8;
    uint _3877 = uint(int(uint(_3875) >> uint(2)));
    uint _3879 = uint(int(uint(int(_3877)) >> uint(2)));
    int _3881 = int(_3877) & 3;
    float _3883 = (*spvDescriptorSet0.vp_c9)._m0[int(_3879)][_3881];
    int _3885 = int(_3877) + 1;
    uint _3887 = uint(int(uint(_3885) >> uint(2)));
    int _3889 = _3885 & 3;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[int(_3887)][_3889];
    float _3893 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3443);
    int _3895 = ~_3837;
    int _3897 = _3895 + 1;
    int _3899 = _3897 + 1;
    int _3901 = _3873 * as_type<int>(_3677);
    int _3903 = ~_3799;
    int _3905 = _3903 + 1;
    int _3907 = _3905 + 1;
    float _3909 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3911 = log2(_3909);
    int _3913 = _3827 * as_type<int>(_3707);
    int _3915 = _3759 + 8;
    uint _3917 = uint(int(uint(_3915) >> uint(2)));
    uint _3919 = uint(int(uint(int(_3917)) >> uint(2)));
    int _3921 = int(_3917) & 3;
    float _3923 = (*spvDescriptorSet0.vp_c9)._m0[int(_3919)][_3921];
    int _3925 = int(_3917) + 1;
    uint _3927 = uint(int(uint(_3925) >> uint(2)));
    int _3929 = _3925 & 3;
    float _3931 = (*spvDescriptorSet0.vp_c9)._m0[int(_3927)][_3929];
    bool _3933 = !_2325;
    int _3935 = _3933 ? _3373 : (-1);
    int _3937 = _3899 * as_type<int>(_3669);
    int _3939 = _3937 + _3901;
    bool _3941 = !_2443;
    int _3943 = _3941 ? _3393 : (-1);
    int _3945 = _3907 * as_type<int>(_3699);
    int _3947 = _3945 + _3913;
    bool _3949 = !_3713;
    int _3951 = _3949 ? 0 : (-1);
    float _3953 = -_166;
    float _3955 = fma(_3953, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3607);
    int _3957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3959 = _3957 != 0;
    int _3961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3963 = _3961 != 0;
    int _3965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3967 = _3965 != 0;
    float _3969 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3659);
    float _3971 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3973 = int(_3971);
    int _3975 = ~_3831;
    int _3977 = _3975 + 1;
    int _3979 = _3977 + 1;
    float _3981 = -_166;
    float _3983 = fma(_3981, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3749);
    int _3985 = abs(_2615);
    float _3987 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3715);
    int _3989 = abs(_2539);
    int _3991 = _3979 * as_type<int>(_3629);
    int _3993 = _3991 + _3829;
    int _3995 = abs(_3493);
    float _3997 = _3911 * _166;
    int _3999 = ~_3985;
    int _4001 = _3999 + 1;
    int _4003 = _4001 + 1;
    float _4005 = _3779;
    if (_3389)
    {
        out.m_53.x = 0.0;
    }
    bool _4007 = !_3575;
    int _4009 = _4007 ? 0 : (-1);
    int _4011 = abs(_2463);
    int _4013 = _4003 * as_type<int>(_3769);
    int _4015 = _4013 + _3939;
    int _4017 = ~_3989;
    int _4019 = _4017 + 1;
    int _4021 = _4019 + 1;
    int _4023 = ~_3863;
    int _4025 = _4023 + 1;
    int _4027 = _4025 + 1;
    int _4029 = _4021 * as_type<int>(_3809);
    int _4031 = _4029 + _3947;
    int _4033 = ~_4011;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    int _4039 = abs(_4009);
    int _4041 = _4027 * as_type<int>(_3855);
    int _4043 = ~_3995;
    int _4045 = _4043 + 1;
    int _4047 = _4045 + 1;
    int _4049 = abs(_3571);
    int _4051 = ~_4039;
    int _4053 = _4051 + 1;
    int _4055 = _4053 + 1;
    int _4057 = _4047 * as_type<int>(_3847);
    int _4059 = _4057 + _4041;
    float _4061 = float(uint(_3973));
    int _4063 = _4037 * as_type<int>(_3883);
    int _4065 = _4063 + _3993;
    int _4067 = abs(_3509);
    int _4069 = ~_4049;
    int _4071 = _4069 + 1;
    int _4073 = _4071 + 1;
    int _4075 = abs(_2669);
    int _4077 = _4055 * as_type<int>(_3777);
    int _4079 = _4077 + _4015;
    int _4081 = ~_4067;
    int _4083 = _4081 + 1;
    int _4085 = _4083 + 1;
    int _4087 = _4073 * as_type<int>(_3817);
    int _4089 = _4087 + _4031;
    int _4091 = abs(_2487);
    float _4093 = 1.0 / _4061;
    int _4095 = ~_4075;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    int _4101 = _4085 * as_type<int>(_3891);
    int _4103 = _4101 + _4065;
    int _4105 = abs(_3951);
    float _4107 = float(uint(_3591));
    int _4109 = _4099 * as_type<int>(_3923);
    int _4111 = _4109 + _4059;
    int _4113 = ~_4091;
    int _4115 = _4113 + 1;
    int _4117 = _4115 + 1;
    float _4119 = float(uint(_3617));
    int _4121 = ~_4105;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = _4103 * _4117;
    int _4129 = abs(_3617);
    float _4131 = 1.0 / _4107;
    int _4133 = abs(_2567);
    int _4135 = _4125 * as_type<int>(_3931);
    int _4137 = _4135 + _4111;
    float _4139 = float(uint(_3681));
    int _4141 = _3935 * _4091;
    int _4143 = _4141 + _4127;
    int _4145 = ~_4133;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    float _4151 = 1.0 / _4119;
    int _4153 = abs(_2703);
    bool _4155 = _1208 == 0;
    int _4157 = _4149 * _4089;
    int _4159 = abs(_2793);
    int _4161 = abs(_3973);
    float _4163 = 1.0 / _4139;
    int _4165 = ~_4153;
    int _4167 = _4165 + 1;
    int _4169 = _4167 + 1;
    int _4171 = _3943 * _4133;
    int _4173 = _4171 + _4157;
    int _4175 = as_type<int>(_4093) + (-2);
    float _4177 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3489);
    float _4179 = float(uint(_4143));
    int _4181 = _4169 * _4079;
    bool _4183 = !_4155;
    int _4185 = _4183 ? _3821 : (-1);
    int _4187 = ~_4159;
    int _4189 = _4187 + 1;
    int _4191 = _4189 + 1;
    float _4193 = as_type<float>(_4175) * _4179;
    bool _4195 = _1234 == 0;
    float _4197 = float(uint(_4161));
    int _4199 = _4191 * _4137;
    bool _4201 = !_4195;
    int _4203 = _4201 ? _3835 : (-1);
    float _4205 = trunc(_4193);
    float _4207 = precise::max(_4205, 0.0);
    uint _4209 = uint(_4207);
    int _4211 = as_type<int>(_4131) + (-2);
    int _4213 = _4185 * _4153;
    int _4215 = _4213 + _4181;
    float _4217 = float(uint(_4173));
    float _4219 = _3787 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4221 = abs(_3591);
    int _4223 = as_type<int>(_4151) + (-2);
    float _4225 = 1.0 / _4197;
    int _4227 = _4203 * _4159;
    int _4229 = _4227 + _4199;
    float _4231 = float(uint(_4221));
    float _4233 = as_type<float>(_4211) * _4217;
    float _4235 = fma(_4219, _2785, -0.5);
    float _4237 = _3839 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4239 = as_type<int>(_4163) + (-2);
    int _4241 = ~_3973;
    int _4243 = _4241 + 1;
    float _4245 = fma(_4237, _2803, -0.5);
    float _4247 = float(uint(_4229));
    float _4249 = 1.0 / _4231;
    int _4251 = abs(_4143);
    float _4253 = as_type<float>(_4239) * _4247;
    float _4255 = float(uint(_4129));
    int _4257 = _4243 * int(_4209);
    int _4259 = _4257 + _4143;
    int _4261 = abs(_3681);
    float _4263 = trunc(_4233);
    float _4265 = precise::max(_4263, 0.0);
    uint _4267 = uint(_4265);
    int _4269 = as_type<int>(_4225) + (-2);
    float _4271 = float(uint(_4251));
    float _4273 = float(uint(_4215));
    float _4275 = 1.0 / _4255;
    float _4277 = as_type<float>(_4269) * _4271;
    int _4279 = abs(_4173);
    float _4281 = float(uint(_4259));
    float _4283 = as_type<float>(_4223) * _4273;
    float _4285 = float(uint(_4261));
    int _4287 = as_type<int>(_4249) + (-2);
    float _4289 = as_type<float>(_4175) * _4281;
    float _4291 = float(uint(_4279));
    float _4293 = -_3601;
    float _4295 = fma(_4177, _4235, _4293);
    int _4297 = ~_3591;
    int _4299 = _4297 + 1;
    float _4301 = 1.0 / _4285;
    int _4303 = abs(_4215);
    float _4305 = as_type<float>(_4287) * _4291;
    int _4307 = as_type<int>(_4275) + (-2);
    float _4309 = trunc(_4283);
    float _4311 = precise::max(_4309, 0.0);
    uint _4313 = uint(_4311);
    float _4315 = float(uint(_4303));
    int _4317 = _4299 * int(_4267);
    int _4319 = _4317 + _4173;
    int _4321 = ~_3617;
    int _4323 = _4321 + 1;
    int _4325 = abs(_4229);
    float _4327 = as_type<float>(_4307) * _4315;
    int _4329 = ~_3681;
    int _4331 = _4329 + 1;
    float _4333 = trunc(_4253);
    float _4335 = precise::max(_4333, 0.0);
    uint _4337 = uint(_4335);
    int _4339 = ~_4161;
    int _4341 = _4339 + 1;
    int _4343 = as_type<int>(_4301) + (-2);
    float _4345 = float(uint(_4325));
    bool _4347 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4349 = isnan(0.0);
    bool _4351 = _4347 || _4349;
    bool _4353 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4355 = _4351 || _4353;
    float _4357 = trunc(_4277);
    float _4359 = precise::max(_4357, 0.0);
    uint _4361 = uint(_4359);
    int _4363 = _4323 * int(_4313);
    int _4365 = _4363 + _4215;
    int _4367 = ~_3973;
    int _4369 = _4367 + 1;
    int _4371 = ~_3617;
    int _4373 = _4371 + 1;
    int _4375 = ~_3591;
    int _4377 = _4375 + 1;
    float _4379 = trunc(_4305);
    float _4381 = precise::max(_4379, 0.0);
    uint _4383 = uint(_4381);
    int _4385 = _4331 * int(_4337);
    int _4387 = _4385 + _4229;
    float _4389 = trunc(_4327);
    float _4391 = precise::max(_4389, 0.0);
    uint _4393 = uint(_4391);
    int _4395 = _4341 * int(_4361);
    int _4397 = _4395 + _4251;
    float _4399 = float(uint(_4365));
    float _4401 = float(uint(_4387));
    float _4403 = float(uint(_4397));
    float _4405 = trunc(_4289);
    float _4407 = precise::max(_4405, 0.0);
    uint _4409 = uint(_4407);
    float _4411 = as_type<float>(_4239) * _4401;
    int _4413 = ~_4129;
    int _4415 = _4413 + 1;
    float _4417 = as_type<float>(_4269) * _4403;
    float _4419 = exp2(_3997);
    float _4421 = as_type<float>(_4343) * _4345;
    float _4423 = float(uint(_4319));
    int _4425 = _4415 * int(_4393);
    int _4427 = _4425 + _4303;
    float _4429 = as_type<float>(_4223) * _4399;
    bool _4431 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4433 = isnan(1.0);
    bool _4435 = _4431 || _4433;
    bool _4437 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4439 = _4435 || _4437;
    float _4441 = as_type<float>(_4211) * _4423;
    float _4443 = trunc(_4421);
    float _4445 = precise::max(_4443, 0.0);
    uint _4447 = uint(_4445);
    int _4449 = ~_4221;
    int _4451 = _4449 + 1;
    int _4453 = int(_4209) + int(_4409);
    int _4455 = ~_4261;
    int _4457 = _4455 + 1;
    int _4459 = _4451 * int(_4383);
    int _4461 = _4459 + _4279;
    float _4463 = float(uint(_4427));
    float _4465 = trunc(_4441);
    float _4467 = precise::max(_4465, 0.0);
    uint _4469 = uint(_4467);
    float _4471 = -_4419;
    float _4473 = _4471 + 1.0;
    float _4475 = float(uint(_4461));
    float _4477 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4479 = 1.0 + _4477;
    float _4481 = as_type<float>(_4307) * _4463;
    float _4483 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4485 = as_type<float>(_4287) * _4475;
    int _4487 = _4457 * int(_4447);
    int _4489 = _4487 + _4325;
    float _4491 = 1.0 / _4479;
    float _4493 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4495 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4483);
    float _4497 = float(uint(_4489));
    float _4499 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4501 = int(_4267) + int(_4469);
    float _4503 = trunc(_4429);
    float _4505 = precise::max(_4503, 0.0);
    uint _4507 = uint(_4505);
    float _4509 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4511 = as_type<float>(_4343) * _4497;
    float _4513 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4493);
    float _4515 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4499);
    float _4517 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4509);
    float _4519 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4495);
    float _4521 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4513);
    float _4523 = trunc(_4411);
    float _4525 = precise::max(_4523, 0.0);
    uint _4527 = uint(_4525);
    float _4529 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4517);
    float _4531 = -_166;
    float _4533 = fma(_4531, (*spvDescriptorSet0.vp_c9)._m0[101].x, _3517);
    float _4535 = fma(_3721, _3395, _4533);
    float _4537 = trunc(_4417);
    float _4539 = precise::max(_4537, 0.0);
    uint _4541 = uint(_4539);
    float _4543 = _4355 ? _4473 : 0.0;
    float _4545 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4515);
    int _4547 = ~_4261;
    int _4549 = _4547 + 1;
    float _4551 = trunc(_4485);
    float _4553 = precise::max(_4551, 0.0);
    uint _4555 = uint(_4553);
    float _4557 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[101].y, _3643);
    float _4559 = _4535;
    float _4561 = as_type<float>(_4501);
    if (_4439)
    {
        float _4563 = _4543 * _4491;
        _168 = _4563;
    }
    float _4565 = _168;
    int _4567 = _4369 * _4453;
    int _4569 = _4567 + _4143;
    int _4571 = int(_4337) + int(_4527);
    float _4573 = -_4557;
    float _4575 = fma(_3739, _4245, _4573);
    float _4577 = trunc(_4481);
    float _4579 = precise::max(_4577, 0.0);
    uint _4581 = uint(_4579);
    bool _4583 = uint(_4569) >= uint(_3973);
    float _4585 = _4575 + 0.5;
    int _4587 = int(_4361) + int(_4541);
    bool _4589 = !_4583;
    int _4591 = _4589 ? 0 : (-1);
    float _4593 = trunc(_4511);
    float _4595 = precise::max(_4593, 0.0);
    uint _4597 = uint(_4595);
    int _4599 = int(_4313) + int(_4507);
    int _4601 = _4377 * _4501;
    int _4603 = _4601 + _4173;
    int _4605 = ~_3681;
    int _4607 = _4605 + 1;
    int _4609 = int(_4383) + int(_4555);
    int _4611 = _4373 * _4599;
    int _4613 = _4611 + _4215;
    bool _4615 = uint(_4603) >= uint(_3591);
    int _4617 = ~_4221;
    int _4619 = _4617 + 1;
    bool _4621 = uint(_4613) >= uint(_3617);
    int _4623 = _4619 * _4609;
    int _4625 = _4623 + _4279;
    int _4627 = ~_4161;
    int _4629 = _4627 + 1;
    int _4631 = int(_4447) + int(_4597);
    int _4633 = _4607 * _4571;
    int _4635 = _4633 + _4229;
    int _4637 = int(_4393) + int(_4581);
    int _4639 = _4629 * _4587;
    int _4641 = _4639 + _4251;
    int _4643 = ~_4129;
    int _4645 = _4643 + 1;
    float _4647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4649 = !_4615;
    int _4651 = _4649 ? 0 : (-1);
    bool _4653 = uint(_4635) >= uint(_3681);
    int _4655 = _4645 * _4637;
    int _4657 = _4655 + _4303;
    int _4659 = ~_4453;
    int _4661 = _4659 + _4591;
    int _4663 = _4661 + 1;
    int _4665 = _4549 * _4631;
    int _4667 = _4665 + _4325;
    bool _4669 = !_4653;
    int _4671 = _4669 ? 0 : (-1);
    bool _4673 = uint(_4625) >= uint(_4221);
    bool _4675 = !_4621;
    int _4677 = _4675 ? 0 : (-1);
    bool _4679 = uint(_4641) >= uint(_4161);
    bool _4681 = !_4673;
    int _4683 = _4681 ? 0 : (-1);
    bool _4685 = uint(_4667) >= uint(_4261);
    int _4687 = _3973 * _4663;
    int _4689 = _4687 + _4143;
    bool _4691 = !_4679;
    int _4693 = _4691 ? 0 : (-1);
    int _4695 = _4143 ^ _3973;
    bool _4697 = uint(_4657) >= uint(_4129);
    int _4699 = ~_4501;
    int _4701 = _4699 + _4651;
    int _4703 = _4701 + 1;
    float _4705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4707 = uint(int(uint(_4695) >> uint(31)));
    int _4709 = ~_4599;
    int _4711 = _4709 + _4677;
    int _4713 = _4711 + 1;
    int _4715 = _3591 * _4703;
    int _4717 = _4715 + _4173;
    bool _4719 = !_4697;
    int _4721 = _4719 ? 0 : (-1);
    bool _4723 = _3973 == 0;
    int _4725 = _3617 * _4713;
    int _4727 = _4725 + _4215;
    int _4729 = _4173 ^ _3591;
    float _4731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4733 = ~_4693;
    int _4735 = _4587 + _4733;
    int _4737 = _4735 + 1;
    float _4739 = _4295 + 0.5;
    int _4741 = ~int(_4707);
    int _4743 = _4741 + 1;
    bool _4745 = !_4723;
    int _4747 = _4745 ? _4689 : (-1);
    bool _4749 = _3617 == 0;
    float _4751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    uint _4753 = uint(int(uint(_4729) >> uint(31)));
    int _4755 = _4737 ^ _4743;
    int _4757 = ~_4571;
    int _4759 = _4757 + _4671;
    int _4761 = _4759 + 1;
    bool _4763 = !_4685;
    int _4765 = _4763 ? 0 : (-1);
    float _4767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4769 = _3591 == 0;
    int _4771 = _3681 * _4761;
    int _4773 = _4771 + _4229;
    bool _4775 = !_4749;
    int _4777 = _4775 ? _4727 : (-1);
    float _4779 = _4535 + 0.5;
    bool _4781 = _3973 == 0;
    int _4783 = ~_4683;
    int _4785 = _4609 + _4783;
    int _4787 = _4785 + 1;
    float _4789 = _3779 + 0.5;
    int _4791 = ~int(_4753);
    int _4793 = _4791 + 1;
    out.m_77.x = _4779;
    out.m_77.y = _4585;
    int _4795 = ~_4743;
    int _4797 = _4795 + _4755;
    int _4799 = _4797 + 1;
    bool _4801 = !_4769;
    int _4803 = _4801 ? _4717 : (-1);
    out.m_79.x = _4789;
    out.m_79.y = _4739;
    bool _4805 = _3681 == 0;
    int _4807 = _4787 ^ _4793;
    bool _4809 = !_4781;
    int _4811 = _4809 ? _4799 : (-1);
    bool _4813 = _3617 == 0;
    int _4815 = _4215 ^ _3617;
    float _4817 = _4647 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4819 = !_4805;
    int _4821 = _4819 ? _4773 : (-1);
    float _4823 = _4731 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4825 = _3591 == 0;
    float _4827 = fma(_4817, _1573, -0.5);
    int _4829 = ~_4793;
    int _4831 = _4829 + _4807;
    int _4833 = _4831 + 1;
    float _4835 = fma(_4823, _1609, -0.5);
    float _4837 = float(_4747);
    float _4839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _4841 = uint(int(uint(_4815) >> uint(31)));
    bool _4843 = !_4825;
    int _4845 = _4843 ? _4833 : (-1);
    float _4847 = fma(_4817, _4837, _3797);
    bool _4849 = _3681 == 0;
    float _4851 = _4751 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4853 = _4229 ^ _3681;
    float _4855 = _4767 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4857 = ~_4721;
    int _4859 = _4637 + _4857;
    int _4861 = _4859 + 1;
    float _4863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4865 = ~int(_4841);
    int _4867 = _4865 + 1;
    float _4869 = fma(_4851, _2323, -0.5);
    float _4871 = float(_4821);
    float _4873 = fma(_4855, _1825, -0.5);
    float _4875 = float(_4777);
    float _4877 = _4839 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _4879 = _4861 ^ _4867;
    float _4881 = fma(_4851, _4871, _3861);
    uint _4883 = uint(int(uint(_4853) >> uint(31)));
    float _4885 = fma(_4855, _4875, _3983);
    float _4887 = float(_4811);
    float _4889 = _4705 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4891 = ~_4867;
    int _4893 = _4891 + _4879;
    int _4895 = _4893 + 1;
    float _4897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4899 = ~_4765;
    int _4901 = _4631 + _4899;
    int _4903 = _4901 + 1;
    float _4905 = fma(_4889, _2705, -0.5);
    int _4907 = ~int(_4883);
    int _4909 = _4907 + 1;
    float _4911 = -_2805;
    float _4913 = fma(_4889, _4887, _4911);
    bool _4915 = !_4813;
    int _4917 = _4915 ? _4895 : (-1);
    float _4919 = fma(_4545, _4873, _4885);
    float _4921 = float(_4845);
    float _4923 = _4863 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4925 = _4903 ^ _4909;
    float _4927 = fma(_4877, _2715, -0.5);
    float _4929 = float(_4803);
    float _4931 = -_3969;
    float _4933 = fma(_4877, _4921, _4931);
    float _4935 = float(_4917);
    float _4937 = fma(_4923, _2729, -0.5);
    int _4939 = ~_4909;
    int _4941 = _4939 + _4925;
    int _4943 = _4941 + 1;
    float _4945 = fma(_4823, _4929, _3955);
    float _4947 = fma(_3893, _4927, _4933);
    float _4949 = -_3987;
    float _4951 = fma(_4923, _4935, _4949);
    bool _4953 = !_3959;
    int _4955 = _4953 ? 0 : 1;
    float _4957 = fma(_4519, _4827, _4847);
    bool _4959 = !_4849;
    int _4961 = _4959 ? _4943 : (-1);
    float _4963 = fma(_3867, _4835, _4945);
    float _4965 = fma(_4529, _4937, _4951);
    float _4967 = _4947 + 0.5;
    float _4969 = float(_4961);
    float _4971 = _4897 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4973 = abs(_4955);
    float _4975 = fma(_3639, _4869, _4881);
    float _4977 = in.m_81.x;
    float _4979 = in.m_81.y;
    float _4981 = in.m_81.z;
    float _4983 = fma(_4971, _2731, -0.5);
    float _4985 = -_3865;
    float _4987 = fma(_4971, _4969, _4985);
    float _4989 = fma(_4521, _4905, _4913);
    bool _4991 = !_3963;
    int _4993 = _4991 ? 0 : 1;
    float _4995 = _4919 + 0.5;
    float _4997 = fma(_3653, _4983, _4987);
    float _4999 = _4957 + 0.5;
    float _5001 = _4963 + 0.5;
    float _5003 = _4989 + 0.5;
    float _5005 = _4975 + 0.5;
    float _5007 = _4965 + 0.5;
    float _5009 = _4997 + 0.5;
    int _5011 = abs(_4993);
    out.m_83.x = _4999;
    out.m_83.y = _5003;
    out.m_83.z = _5001;
    out.m_83.w = _4967;
    bool _5013 = !_3967;
    int _5015 = _5013 ? 0 : 1;
    out.m_85.x = _4995;
    out.m_85.y = _5007;
    float _5017 = float(_4973);
    out.m_87.x = _5005;
    out.m_87.y = _5009;
    float _5019 = float(_3737);
    float _5021 = as_type<float>(_4713);
    float _5023 = as_type<float>(_4703);
    if (_3389)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5025 = -_3531;
    float _5027 = fma(_5025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3209);
    float _5029 = -_3525;
    float _5031 = fma(_5029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3219);
    float _5033 = float(_2899);
    float _5035 = _5017 * _5019;
    float _5037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5039 = _5027 + _5037;
    float _5041 = float(_5011);
    float _5043 = -_3685;
    float _5045 = fma(_5043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3245);
    float _5047 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5049 = _5031 + _5047;
    float _5051 = _5039 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5053 = _5041 * _5033;
    float _5055 = _1084 + _1403;
    float _5057 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5059 = _5045 + _5057;
    float _5061 = fma(_5049, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5051);
    float _5063 = _5035 * (-2.0);
    float _5065 = _5055 + (-1.0);
    float _5067 = _5053 * (-2.0);
    float _5069 = fma(_5059, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5061);
    float _5071 = _1397 + (-0.5);
    float _5073 = fma(_5063, _4977, _4977);
    float _5075 = fma(_5065, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5077 = _1084 + (-0.5);
    float _5079 = fma(_5067, _4979, _4979);
    bool _5081 = _5069 >= 0.0;
    float _5083 = fma(_3573, _5063, _3573);
    float _5085 = fma(_5071, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5073);
    float _5087 = fma(_5075, _5067, _5075);
    float _5089 = fma(_5077, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5079);
    int _5091 = abs(_5015);
    float _5093 = fma(_5083, _4565, _5085);
    float _5095 = sqrt(_3717);
    float _5097 = fma(_5087, _4565, _5089);
    float _5099 = float(_3243);
    float _5101 = _5093 * 0.15915493667125701904296875;
    float _5103 = _5097 * 0.15915493667125701904296875;
    float _5105 = _5073;
    float _5107 = _5099;
    if (_5081)
    {
        _5105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5109 = _5105;
    float _5111 = _5101 * 6.283185482025146484375;
    float _5113 = sin(_5111);
    float _5115 = float(_5091);
    float _5117 = _1397 + _1403;
    int _5119 = as_type<int>(_5109);
    if (_5081)
    {
        float _5121 = _5109 * 5.0;
        _5119 = as_type<int>(_5121);
    }
    int _5123 = _5119;
    if (_5081)
    {
        out.m_53.x = 0.0;
    }
    float _5125 = _5115 * _5099;
    float _5127 = _5117 + (-1.0);
    float _5129 = _5101 * 6.283185482025146484375;
    float _5131 = cos(_5129);
    if (_5081)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14233 = as_type<float>(_5123);
        out.gl_Position.z = _14233;
    }
    float _5133 = _5125 * (-2.0);
    float _5135 = _5103 * 6.283185482025146484375;
    float _5137 = sin(_5135);
    if (_5081)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5139 = -_3209;
    float _5141 = _5139 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5143 = -_3219;
    float _5145 = _5143 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5147 = -_3245;
    float _5149 = _5147 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5151 = fma(_5127, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5153 = _5141 * _5141;
    float _5155 = fma(_5133, _4981, _4981);
    float _5157 = _1403 + (-0.5);
    float _5159 = fma(_5151, _5133, _5151);
    float _5161 = fma(_5145, _5145, _5153);
    float _5163 = _5103 * 6.283185482025146484375;
    float _5165 = cos(_5163);
    float _5167 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5155);
    float _5169 = _5113 * _5137;
    float _5171 = fma(_5149, _5149, _5161);
    float _5173 = _3487 * _5095;
    float _5175 = fma(_5159, _4565, _5167);
    float _5177 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5179 = rsqrt(_5171);
    float _5181 = _5175 * 0.15915493667125701904296875;
    float _5183 = _5173 * _5177;
    float _5185 = in.m_89.x;
    float _5187 = in.m_89.y;
    float _5189 = in.m_89.z;
    float _5191 = _5131 * _5165;
    float _5193 = _5181 * 6.283185482025146484375;
    float _5195 = sin(_5193);
    float _5197 = _5113 * _5165;
    float _5199 = _5145 * _5179;
    float _5201 = _5149 * _5179;
    float _5203 = _5141 * _5179;
    float _5205 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5207 = _5199 * _5205;
    float _5209 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5211 = _5201 * _5209;
    float _5213 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5215 = _5203 * _5213;
    float _5217 = _5181 * 6.283185482025146484375;
    float _5219 = cos(_5217);
    float _5221 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5223 = -_5207;
    float _5225 = fma(_5201, _5221, _5223);
    float _5227 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5229 = -_5211;
    float _5231 = fma(_5203, _5227, _5229);
    float _5233 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5235 = -_5215;
    float _5237 = fma(_5199, _5233, _5235);
    float _5239 = fma(_5195, _5191, _5169);
    float _5241 = _5225 * _5225;
    float _5243 = fma(_5195, _5169, _5191);
    float _5245 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5247 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5249 = fma(_5231, _5231, _5241);
    float _5251 = _5131 * _5137;
    float _5253 = _5173 * _5247;
    float _5255 = fma(_5237, _5237, _5249);
    float _5257 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5187);
    float _5259 = _5131 * _5219;
    float _5261 = _5165 * _5219;
    float _5263 = _5113 * _5219;
    float _5265 = rsqrt(_5255);
    float _5267 = _5257 * _5253;
    float _5269 = _5173 * _5245;
    float _5271 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5185);
    float _5273 = _5137 * _5219;
    float _5275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5189);
    float _5277 = -_5251;
    float _5279 = fma(_5195, _5197, _5277);
    float _5281 = _5271 * _5269;
    float _5283 = _5259 * _5267;
    float _5285 = _5275 * _5183;
    float _5287 = -_5197;
    float _5289 = fma(_5195, _5251, _5287);
    float _5291 = _5263 * _5267;
    float _5293 = fma(_5239, _5281, _5283);
    float _5295 = fma(_5279, _5281, _5291);
    float _5297 = _5231 * _5265;
    float _5299 = _5225 * _5265;
    float _5301 = _5237 * _5265;
    float _5303 = -_5267;
    float _5305 = _5195 * _5303;
    float _5307 = _5203 * _5297;
    float _5309 = _5201 * _5299;
    float _5311 = fma(_5261, _5281, _5305);
    float _5313 = fma(_5289, _5285, _5293);
    float _5315 = -_5309;
    float _5317 = fma(_5203, _5301, _5315);
    float _5319 = -_5307;
    float _5321 = fma(_5199, _5299, _5319);
    float _5323 = fma(_5273, _5285, _5311);
    float _5325 = fma(_5243, _5285, _5295);
    float _5327 = _5317 * _5313;
    float _5329 = _5321 * _5313;
    float _5331 = fma(_5297, _5323, _5327);
    float _5333 = fma(_5301, _5323, _5329);
    float _5335 = fma(_5199, _5325, _5331);
    float _5337 = fma(_5201, _5325, _5333);
    float _5339 = _5199 * _5301;
    float _5341 = _3219 + _5335;
    float _5343 = _3245 + _5337;
    float _5345 = -_5339;
    float _5347 = fma(_5201, _5297, _5345);
    float _5349 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5351 = _5341 + _5349;
    float _5353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5355 = _5343 + _5353;
    float _5357 = _5347 * _5313;
    float _5359 = _5351 * _5351;
    float _5361 = _5355 * _5355;
    float _5363 = fma(_5299, _5323, _5357);
    float _5365 = _5359 + _5361;
    float _5367 = fma(_5203, _5325, _5363);
    float _5369 = sqrt(_5365);
    float _5371 = _3209 + _5367;
    bool _5373 = _5369 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5375 = _5341;
    float _5377 = _5343;
    float _5379 = _5359;
    float _5381 = _5361;
    if (!_5373)
    {
        _5021 = _5371;
    }
    float _5383 = _5021;
    bool _5385 = !_5373;
    float _5387 = _5383;
    if (!_5385)
    {
        float _5389 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5393 = _5369 + _5391;
        float _5395 = rsqrt(_5365);
        float _5397 = _5393 * _5389;
        float _5399 = _5371 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5401 = _5397 * 0.15915493667125701904296875;
        float _5403 = _5401 * 6.283185482025146484375;
        float _5405 = sin(_5403);
        float _5407 = _5401 * 6.283185482025146484375;
        float _5409 = cos(_5407);
        float _5411 = fma(_5405, _5399, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5413 = _5395 * _5411;
        float _5415 = _5409 + (-1.0);
        float _5417 = fma(_5351, _5413, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5419 = fma(_5355, _5413, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5421 = _5415 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5425 = _5417 + _5423;
        float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5429 = _5419 + _5427;
        float _5431 = fma(_5371, _5409, _5421);
        float _5433 = _5425 * _5425;
        float _5435 = _5429 * _5429;
        _5375 = _5417;
        _5377 = _5419;
        _5387 = _5431;
        _5379 = _5433;
        _5381 = _5435;
    }
    float _5437 = _5375;
    float _5439 = _5377;
    float _5441 = _5387;
    float _5443 = _5379;
    float _5445 = _5381;
    float _5447 = fma(_5437, 6.2500002968590706586837768554688e-05, 0.5);
    float _5449 = fma(_5439, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14726 = float2(_5447, _5449);
    float3 _5453 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14726, float2(0.0), isnan(_14726)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14726, float2(0.0), isnan(_14726)), level(0.0)).xyz;
    float _5455 = _5453.x;
    float _5457 = _5453.y;
    float _5459 = _5453.z;
    float _5461 = in.m_91.x;
    float _5463 = in.m_91.y;
    float _5465 = in.m_91.z;
    bool _5467 = _5187 != 0.0;
    bool _5469 = isnan(_5187);
    bool _5471 = _5467 || _5469;
    bool _5473 = isnan(0.0);
    bool _5475 = _5471 || _5473;
    float _5477 = in.m_93.x;
    float _5479 = in.m_93.y;
    float _5481 = in.m_93.z;
    float _5483 = in.m_93.w;
    bool _5485 = _5185 == 0.0;
    bool _5487 = !_5475;
    bool _5489 = _5485 && _5487;
    bool _5491 = _5189 == 0.0;
    bool _5493 = _5491 && _5489;
    float _5495 = _5461;
    if (_5493)
    {
        _4005 = _5461;
    }
    float _5497 = _4005;
    float _5499 = _5497;
    if (_5493)
    {
        _5107 = _5465;
    }
    float _5501 = _5107;
    float _5503 = _5501;
    if (_5493)
    {
        _4559 = _5463;
    }
    float _5505 = _4559;
    float _5507 = _5505;
    if (_5493)
    {
        _4561 = _5497;
    }
    float _5509 = _4561;
    float _5511 = _5509;
    if (!_5493)
    {
        _5499 = _5461;
    }
    float _5513 = _5499;
    if (_5493)
    {
        _5023 = _5501;
    }
    float _5515 = _5023;
    float _5517 = _5515;
    if (!_5493)
    {
        _5503 = _5465;
    }
    float _5519 = _5503;
    if (!_5493)
    {
        float _5521 = fma(_5185, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5513);
        _5511 = _5521;
    }
    float _5523 = _5511;
    if (_5493)
    {
        _5495 = _5505;
    }
    float _5525 = _5495;
    float _5527 = _5481 * _5513;
    float _5529 = _5525;
    if (!_5493)
    {
        _5507 = _5463;
    }
    float _5531 = _5507;
    float _5533 = _5479 * _5519;
    if (!_5493)
    {
        float _5535 = fma(_5189, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5519);
        _5517 = _5535;
    }
    float _5537 = _5517;
    float _5539 = -_5527;
    float _5541 = fma(_5477, _5519, _5539);
    float _5543 = _5259 * _5317;
    float _5545 = _5477 * _5531;
    float _5547 = -_5533;
    float _5549 = fma(_5481, _5531, _5547);
    if (!_5493)
    {
        float _5551 = fma(_5187, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5531);
        _5529 = _5551;
    }
    float _5553 = _5529;
    float _5555 = _5239 * _5317;
    float _5557 = -_5545;
    float _5559 = fma(_5479, _5513, _5557);
    float _5561 = _5239 * _5347;
    float _5563 = _5239 * _5321;
    float _5565 = _5541 * _5483;
    float _5567 = _5549 * _5483;
    float _5569 = _5559 * _5483;
    float _5571 = _5259 * _5347;
    float _5573 = fma(_5261, _5297, _5555);
    float _5575 = fma(_5261, _5299, _5561);
    float _5577 = _5259 * _5321;
    float _5579 = fma(_5261, _5301, _5563);
    float _5581 = -_5195;
    float _5583 = fma(_5581, _5297, _5543);
    float _5585 = _5289 * _5317;
    float _5587 = _5289 * _5347;
    float _5589 = _5289 * _5321;
    float _5591 = -_5195;
    float _5593 = fma(_5591, _5299, _5571);
    float _5595 = -_5195;
    float _5597 = fma(_5595, _5301, _5577);
    float _5599 = fma(_5263, _5199, _5583);
    float _5601 = fma(_5273, _5297, _5585);
    float _5603 = fma(_5273, _5299, _5587);
    float _5605 = fma(_5273, _5301, _5589);
    float _5607 = fma(_5263, _5203, _5593);
    float _5609 = fma(_5263, _5201, _5597);
    float _5611 = fma(_5279, _5199, _5573);
    float _5613 = _5599 * _5479;
    float _5615 = fma(_5279, _5203, _5575);
    float _5617 = fma(_5279, _5201, _5579);
    float _5619 = fma(_5243, _5199, _5601);
    float _5621 = fma(_5243, _5203, _5603);
    float _5623 = fma(_5243, _5201, _5605);
    float _5625 = _5607 * _5479;
    float _5627 = _5609 * _5479;
    float _5629 = fma(_5611, _5477, _5613);
    float _5631 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5633 = _5441 + _5631;
    float _5635 = fma(_5615, _5477, _5625);
    float _5637 = fma(_5617, _5477, _5627);
    float _5639 = _5599 * _5553;
    float _5641 = fma(_5633, _5633, _5443);
    float _5643 = _5607 * _5553;
    float _5645 = _5565 * _5599;
    float _5647 = _5565 * _5607;
    float _5649 = _5641 + _5445;
    float _5651 = _5609 * _5553;
    float _5653 = _5565 * _5609;
    float _5655 = fma(_5567, _5611, _5645);
    float _5657 = fma(_5615, _5523, _5643);
    float _5659 = fma(_5567, _5615, _5647);
    float _5661 = sqrt(_5649);
    float _5663 = fma(_5611, _5523, _5639);
    float _5665 = fma(_5617, _5523, _5651);
    float _5667 = fma(_5567, _5617, _5653);
    float _5669 = fma(_5619, _5481, _5629);
    float _5671 = fma(_5621, _5481, _5635);
    float _5673 = fma(_5621, _5537, _5657);
    float _5675 = fma(_5623, _5481, _5637);
    float _5677 = fma(_5619, _5537, _5663);
    float _5679 = fma(_5569, _5619, _5655);
    float _5681 = fma(_5569, _5621, _5659);
    float _5683 = fma(_5569, _5623, _5667);
    float _5685 = fma(_5623, _5537, _5665);
    out.m_95.x = _5669;
    out.m_95.y = _5671;
    out.m_95.z = _5675;
    bool _5687 = _5661 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5689 = isnan(_5661);
    bool _5691 = _5687 || _5689;
    bool _5693 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5695 = _5691 || _5693;
    out.m_97.x = _5679;
    out.m_97.y = _5681;
    out.m_97.z = _5683;
    out.m_99.x = _5677;
    out.m_99.y = _5673;
    out.m_99.z = _5685;
    float _5697 = _5569;
    float _5699 = _5665;
    if (!_5695)
    {
        _5697 = 1.0;
    }
    float _5701 = _5697;
    out.m_101.x = _5455;
    out.m_101.y = _5457;
    out.m_101.z = _5459;
    bool _5703 = !_5695;
    float _5705 = _5701;
    if (!_5703)
    {
        bool _5707 = _5661 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5709 = isnan(_5661);
        bool _5711 = _5707 || _5709;
        bool _5713 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5715 = _5711 || _5713;
        if (!_5715)
        {
            float _5717 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5719 = _5661 + _5717;
            float _5721 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5723 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5721;
            float _5725 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5727 = _5725 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5729 = 1.0 / _5723;
            float _5731 = _5719 * _5729;
            float _5733 = fma(_5731, _5727, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5705 = _5733;
            _5735 = true;
        }
        else
        {
            bool _5737 = _5661 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5739 = isnan(_5661);
            bool _5741 = _5737 || _5739;
            bool _5743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5745 = _5741 || _5743;
            if (!_5745)
            {
                float _5747 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5749 = _5661 + _5747;
                float _5751 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5753 = _5751 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5755 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5757 = _5755 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5759 = 1.0 / _5753;
                float _5761 = _5749 * _5759;
                float _5763 = fma(_5761, _5757, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5705 = _5763;
                _5735 = true;
            }
            else
            {
                _5705 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5735 = false;
    float _5765 = _5705;
    float _5767 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5769 = _5441 + _5767;
    float _5771 = _5027 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5773 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5775 = _5437 + _5773;
    float _5777 = fma(_5769, _5765, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5779 = fma(_5031, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5771);
    float _5781 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5783 = _5439 + _5781;
    float _5785 = fma(_5775, _5765, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5787 = -_3209;
    float _5789 = _5787 + _5777;
    float _5791 = fma(_5045, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5779);
    float _5793 = fma(_5783, _5765, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5795 = -_3219;
    float _5797 = _5795 + _5785;
    float _5799 = _5789 * _5789;
    float _5801 = _5791 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5803 = _5027 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5805 = -_3245;
    float _5807 = _5805 + _5793;
    float _5809 = fma(_5797, _5797, _5799);
    float _5811 = 1.0 / _5801;
    float _5813 = fma(_5031, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5803);
    float _5815 = fma(_5807, _5807, _5809);
    float _5817 = fma(_5045, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5813);
    float _5819 = sqrt(_5815);
    float _5821 = _5817 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5823 = _5821 + _5801;
    float _5825 = _5823 * _5811;
    float _5827 = _5825 * 0.5;
    bool _5829 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5831 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5833 = _5829 || _5831;
    bool _5835 = isnan(0.5);
    bool _5837 = _5833 || _5835;
    float _5839 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5841 = fma(_5827, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5839);
    bool _5843 = _5819 > 0.0;
    float _5845 = 1.0 / _5841;
    bool _5847 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5849 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5851 = _5847 || _5849;
    bool _5853 = isnan(0.5);
    bool _5855 = _5851 || _5853;
    float _5857 = _5827;
    float _5859 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5861 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5863 = _5793;
    if (!_5843)
    {
        _5857 = _5785;
    }
    float _5865 = _5857;
    float _5867 = _5865;
    float _5869 = _5865;
    if (!_5843)
    {
        _5859 = _5777;
    }
    float _5871 = _5859;
    float _5873 = _5871;
    if (!_5843)
    {
        _5861 = _5793;
    }
    float _5875 = _5861;
    bool _5877 = !_5843;
    float _5879 = _5875;
    if (!_5877)
    {
        float _5881 = _228 * _228;
        float _5883 = fma(_224, _224, _5881);
        float _5885 = fma(_230, _230, _5883);
        float _5887 = rsqrt(_5815);
        float _5889 = sqrt(_5885);
        float _5891 = _5797 * _5887;
        float _5893 = _5789 * _5887;
        float _5895 = _5807 * _5887;
        bool _5897 = _5889 > 0.0;
        float _5899 = _5889;
        float _5901 = _5887;
        _5699 = _5891;
        if (!_5897)
        {
            _5867 = _5785;
        }
        float _5903 = _5867;
        _5869 = _5903;
        if (!_5897)
        {
            _5899 = _5777;
        }
        float _5905 = _5899;
        _5873 = _5905;
        if (!_5897)
        {
            _5901 = _5793;
        }
        float _5907 = _5901;
        bool _5909 = !_5897;
        _5879 = _5907;
        if (!_5909)
        {
            float _5911 = rsqrt(_5885);
            float _5913 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5915 = _228 * _5911;
            float _5917 = _224 * _5911;
            float _5919 = _5893 * _5915;
            float _5921 = _230 * _5911;
            float _5923 = fma(_5891, _5917, _5919);
            float _5925 = _5913 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5927 = fma(_5895, _5921, _5923);
            float _5929 = _5927 * _5925;
            float _5931 = fma(_224, _5929, _5785);
            float _5933 = fma(_228, _5929, _5777);
            float _5935 = fma(_230, _5929, _5793);
            _5869 = _5931;
            _5873 = _5933;
            _5879 = _5935;
        }
    }
    float _5937 = _5869;
    float _5939 = _5873;
    float _5941 = _5879;
    float _5943 = _5699;
    float _5945 = -_3525;
    float _5947 = fma(_5945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5937);
    float _5949 = -_3531;
    float _5951 = fma(_5949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5939);
    float _5953 = -_3685;
    float _5955 = fma(_5953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5941);
    float _5957 = _5951;
    float _5959 = _5947;
    float _5961 = _5955;
    float _5963 = _5943;
    if (_5837)
    {
        _5863 = 1.0;
    }
    float _5965 = _5863;
    float _5967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5969 = _5845 * _5967;
    float _5971 = _5965;
    if (!_5855)
    {
        float _5973 = _5039 * _5039;
        float _5975 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5977 = -_3245;
        float _5979 = _5977 + _5941;
        float _5981 = -_3219;
        float _5983 = _5981 + _5937;
        float _5985 = fma(_5049, _5049, _5973);
        float _5987 = fma(_5059, _5059, _5985);
        float _5989 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5991 = sqrt(_5987);
        float _5993 = 1.0 / _5173;
        float _5995 = _5989 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5997 = precise::min(_5991, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5999 = _5997 * _5975;
        float _6001 = _5999 * _5993;
        float _6003 = -_3209;
        float _6005 = _6003 + _5939;
        float _6007 = _5995 * _6001;
        float _6009 = _5979 * _6001;
        float _6011 = fma(_6005, _6007, _5027);
        float _6013 = fma(_5983, _6007, _5031);
        float _6015 = fma(_5995, _6009, _5045);
        _5957 = _6011;
        _5959 = _6013;
        _5961 = _6015;
    }
    float _6017 = _5957;
    float _6019 = _5959;
    float _6021 = _5961;
    if (!_5837)
    {
        float _6023 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6025 = _6023 * 0.15915493667125701904296875;
        float _6027 = _6025 * 6.283185482025146484375;
        float _6029 = cos(_6027);
        float _6031 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6033 = _6031 * 0.15915493667125701904296875;
        float _6035 = _6025 * 6.283185482025146484375;
        float _6037 = sin(_6035);
        float _6039 = 1.0 / _6029;
        float _6041 = _6033 * 6.283185482025146484375;
        float _6043 = cos(_6041);
        float _6045 = _6037 * _6039;
        float _6047 = _6033 * 6.283185482025146484375;
        float _6049 = sin(_6047);
        float _6051 = _6043 * _6045;
        float _6053 = 1.0 / _6051;
        float _6055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6057 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6055;
        float _6059 = 1.0 / _6057;
        float _6061 = _6049 * _6053;
        float _6063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6065 = fma(_5969, _6061, _6063);
        float _6067 = _6065 * _6059;
        float _6069 = precise::clamp(_6067, 0.0, 1.0);
        _5971 = _6069;
    }
    float _6071 = _5971;
    float _6073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6075 = _6017 + _6073;
    float _6077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6079 = _6019 + _6077;
    float _6081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6083 = _6021 + _6081;
    float _6085 = _6075 * _6075;
    float _6087 = fma(_6079, _6079, _6085);
    float _6089 = fma(_6083, _6083, _6087);
    float _6091 = rsqrt(_6089);
    float _6093 = _6091 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6095 = _6079 * _6093;
    float _6097 = _6083 * _6093;
    float _6099 = _6095 * _6095;
    float _6101 = _6097 * _6097;
    float _6103 = _6099 + _6101;
    float _6105 = sqrt(_6103);
    bool _6107 = _6105 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6109 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6111 = _6105 + _6109;
    float _6113 = _6091;
    float _6115 = _6103;
    float _6117 = _6111;
    float _6119 = _6075;
    if (_6107)
    {
        float _6121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6113 = _6121;
    }
    float _6123 = _6113;
    if (_6107)
    {
        float _6125 = rsqrt(_6103);
        _6115 = _6125;
    }
    float _6127 = _6115;
    float _6129 = _6127;
    if (_6107)
    {
        float _6131 = _6111 * _6123;
        _6117 = _6131;
    }
    float _6133 = _6117;
    if (_6107)
    {
        float _6135 = _6133 * 0.15915493667125701904296875;
        _5963 = _6135;
    }
    float _6137 = _5963;
    float _6139 = _6083;
    float _6141 = _6137;
    if (_6107)
    {
        float _6143 = _6137 * 6.283185482025146484375;
        float _6145 = sin(_6143);
        _6139 = _6145;
    }
    float _6147 = _6139;
    float _6149 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6151 = precise::max(0.0, _6149);
    float _6153 = _6123;
    if (_6107)
    {
        float _6155 = _6137 * 6.283185482025146484375;
        float _6157 = cos(_6155);
        _6153 = _6157;
    }
    float _6159 = _6153;
    float _6161 = -_6093;
    float _6163 = -_6151;
    float _6165 = fma(_6075, _6161, _6163);
    float _6167 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6107)
    {
        float _6169 = _6165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6119 = _6169;
    }
    float _6171 = _6119;
    float _6173 = fma(_5031, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6175 = _6171;
    float _6177 = _6147;
    if (_6107)
    {
        float _6179 = fma(_6147, _6171, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6175 = _6179;
    }
    float _6181 = _6175;
    float _6183 = _6181;
    if (!_6107)
    {
        _6177 = _6095;
    }
    float _6185 = _6177;
    float _6187 = sqrt(_6089);
    float _6189 = _6185;
    float _6191 = _6159;
    if (_6107)
    {
        float _6193 = _6159 + (-1.0);
        _6167 = _6193;
    }
    float _6195 = _6167;
    float _6197 = _6195;
    if (_6107)
    {
        float _6199 = _6127 * _6181;
        _3237 = _6199;
    }
    float _6201 = _3237;
    if (!_6107)
    {
        _6183 = _6165;
    }
    float _6203 = _6183;
    float _6205 = _6203;
    if (_6107)
    {
        float _6207 = _6195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6141 = _6207;
    }
    float _6209 = _6141;
    if (_6107)
    {
        float _6211 = _6095 * _6201;
        _6189 = _6211;
    }
    float _6213 = _6189;
    if (!_6107)
    {
        _6197 = _6097;
    }
    float _6215 = _6197;
    float _6217 = _6215;
    if (_6107)
    {
        float _6219 = _6097 * _6201;
        _6217 = _6219;
    }
    float _6221 = _6217;
    if (!_6107)
    {
        _6129 = _6099;
    }
    float _6223 = _6129;
    float _6225 = _6223;
    if (_6107)
    {
        float _6227 = fma(_6165, _6159, _6209);
        _6205 = _6227;
    }
    float _6229 = _6205;
    if (_6107)
    {
        float _6231 = _6213 * _6213;
        _6225 = _6231;
    }
    float _6233 = _6225;
    if (!_6107)
    {
        _6191 = _6101;
    }
    float _6235 = _6191;
    float _6237 = _6235;
    if (_6107)
    {
        float _6239 = _6221 * _6221;
        _6237 = _6239;
    }
    float _6241 = _6237;
    float _6243 = fma(_6229, _6229, _6233);
    float _6245 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6247 = floor(_6173);
    float _6249 = _6243 + _6241;
    float _6251 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6245);
    float _6253 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6255 = fma(_6187, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6253);
    float _6257 = precise::clamp(_6255, 0.0, 1.0);
    float _6259 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6251);
    float _6261 = -_6257;
    float _6263 = _6261 + 1.0;
    float _6265 = rsqrt(_6249);
    float _6267 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6269 = _6259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6271 = fma(_5045, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6273 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6275 = _6269 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6277 = abs(_6263);
    float _6279 = log2(_6277);
    float _6281 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6283 = -_6275;
    float _6285 = fma(_6283, _6267, 1.0);
    float _6287 = _6017 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6289 = -_6247;
    float _6291 = _6173 + _6289;
    float _6293 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6281);
    float _6295 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6287);
    float _6297 = _6265 * _6213;
    float _6299 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6293);
    float _6301 = _6265 * _6229;
    float _6303 = _6265 * _6221;
    float _6305 = _6297 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6307 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6295);
    float _6309 = _6299 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6311 = fma(_6019, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6273);
    float _6313 = -_6305;
    float _6315 = fma(_6301, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6313);
    float _6317 = _6307 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6319 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6321 = fma(_6021, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6311);
    float _6323 = -_6303;
    float _6325 = fma(_6323, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6315);
    float _6327 = _6279 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6329 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6319);
    float _6331 = _6321 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6333 = floor(_6271);
    float _6335 = fma(_6325, -0.5, 0.5);
    float _6337 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6329);
    float _6339 = fma(_6325, 0.5, 0.5);
    float _6341 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6343 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6337);
    float _6345 = _6301 + 1.0;
    float _6347 = log2(_6285);
    float _6349 = fma(_6339, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6351 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6341);
    float _6353 = fma(_6339, _6349, -0.212114393711090087890625);
    float _6355 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6351);
    float _6357 = exp2(_6327);
    float _6359 = -_6333;
    float _6361 = _6271 + _6359;
    float _6363 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6355);
    float _6365 = fma(_6339, _6353, 1.570728778839111328125);
    float _6367 = 1.0 / _6343;
    float _6369 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6371 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6369);
    float _6373 = sqrt(_6335);
    float _6375 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6371);
    float _6377 = _6347 * 0.693147182464599609375;
    float _6379 = -_6301;
    float _6381 = fma(_6357, _6345, _6379);
    float _6383 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6375);
    float2 _16280 = float2(_6291, _6361);
    float _6385 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16280, float2(0.0), isnan(_16280)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16280, float2(0.0), isnan(_16280)), level(0.0)).x;
    float _6387 = _6377 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6389 = _6363 * _6367;
    float _6391 = _6383 * _6367;
    float _6393 = fma(_6381, 0.5, 0.5);
    float _6395 = fma(_6389, 0.5, 0.5);
    float _6397 = fma(_6391, -0.5, 0.5);
    float _6399 = _6373 * 0.636619746685028076171875;
    float3 _16308 = float3(_6395, _6397, _6387);
    float _6401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16308, float3(0.0), isnan(_16308)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16308, float3(0.0), isnan(_16308)), level(0.0)).x;
    float3 _16319 = float3(_6395, _6397, _6387);
    float4 _6404 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16319, float3(0.0), isnan(_16319)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16319, float3(0.0), isnan(_16319)), level(0.0)).xyzw;
    float _6406 = _6404.x;
    float _6408 = _6404.y;
    float _6410 = _6404.z;
    float _6412 = _6404.w;
    float _6414 = -_6365;
    float _6416 = fma(_6399, _6414, 1.0);
    float2 _16340 = float2(_6416, _6393);
    float3 _6418 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16340, float2(0.0), isnan(_16340)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16340, float2(0.0), isnan(_16340)), level(0.0)).xyz;
    float _6420 = _6418.x;
    float _6422 = _6418.y;
    float _6424 = _6418.z;
    float _6426 = abs(_5969);
    float _6428 = log2(_6426);
    float _6430 = _6279 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6432 = _6309 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6434 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6436 = isnan(_6187);
    bool _6438 = _6434 || _6436;
    bool _6440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6442 = _6438 || _6440;
    float _6444 = exp2(_6430);
    float _6446 = in.m_103.x;
    float _6448 = fma(_6317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6432);
    bool _6450 = _5969 <= 8000.0;
    bool _6452 = isnan(_5969);
    bool _6454 = _6450 || _6452;
    bool _6456 = isnan(8000.0);
    bool _6458 = _6454 || _6456;
    float _6460 = float(_6458);
    float _6462 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6448);
    float _6464 = _6428 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6466 = fma(_6331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6462);
    float _6468 = _6343 * 0.5;
    float _6470 = _6363 + _6343;
    float _6472 = exp2(_6464);
    float _6474 = -_6444;
    float _6476 = _6474 + 1.0;
    float _6478 = fma(_6383, -0.5, _6468);
    float _6480 = _6466 + _6343;
    float _6482 = _6476 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6484 = _6470 * 0.5;
    out.gl_Position.x = _6363;
    out.gl_Position.y = _6383;
    out.gl_Position.z = _6466;
    out.gl_Position.w = _6343;
    float _6486 = _6480 * 0.5;
    out.m_105.x = _6484;
    out.m_105.y = _6478;
    out.m_105.z = _6486;
    out.m_105.w = _6343;
    float _6488 = fma(_6472, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6490 = precise::clamp(_6488, 0.0, 1.0);
    float _6492 = _6071 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6494 = fma(_6490, -2.0, 3.0);
    float _6496 = _6490 * _6490;
    float _6498 = -_6482;
    float _6500 = _6498 + 1.0;
    float _6502 = _6343;
    float _6504 = _6466;
    float _6506 = _6383;
    float _6508 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _6510 = _6500;
    if (!_6442)
    {
        _6502 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6512 = _6502;
    float _6514 = _6496 * _6494;
    float _6516 = _6512;
    float _6518 = _6512;
    if (!_6442)
    {
        _6504 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6520 = _6504;
    float _6522 = _6520;
    float _6524 = _6520;
    if (!_6442)
    {
        _6506 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6526 = _6506;
    float _6528 = -_6514;
    float _6530 = _6528 + 1.0;
    float _6532 = fma(_6530, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6514);
    float _6534 = _6460 * _6532;
    float _6536 = _6534 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6538 = -_6385;
    float _6540 = _6538 + 1.0;
    float _6542 = _6540 * _6536;
    float _6544 = precise::clamp(_6542, 0.0, 1.0);
    float _6546 = -_6544;
    float _6548 = fma(_6546, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6550 = _6526;
    float _6552 = _6526;
    if (!_6442)
    {
        _6508 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6554 = _6508;
    float _6556 = _6482 * _6401;
    float _6558 = _6548 * _6446;
    float _6560 = _6412 * _6500;
    float _6562 = _6554;
    float _6564 = _6554;
    if (!_6442)
    {
        _6510 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6566 = _6510;
    float _6568 = _6412 * _6556;
    float _6570 = _6558 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6572 = _6424 * _6556;
    float _6574 = fma(_6420, _6568, _6406);
    float _6576 = fma(_6422, _6568, _6408);
    out.m_107.x = _6570;
    float _6578 = fma(_6412, _6572, _6410);
    float _6580 = _6568;
    float _6582 = _6566;
    float _6584 = _6566;
    if (!_6442)
    {
        _6580 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6586 = _6580;
    out.m_109.x = _6574;
    out.m_109.y = _6576;
    out.m_109.z = _6578;
    out.m_109.w = _6560;
    bool _6588 = !_6442;
    float _6590 = _6586;
    float _6592 = _6586;
    if (!_6588)
    {
        bool _6594 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6596 = isnan(_6187);
        bool _6598 = _6594 || _6596;
        bool _6600 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6602 = _6598 || _6600;
        if (!_6602)
        {
            float _6604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6606 = _6187 + _6604;
            float _6608 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6610 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6608;
            float _6612 = 1.0 / _6610;
            float _6614 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6616 = _6614 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6618 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6620 = _6618 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6622 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6624 = _6622 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6626 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6628 = _6626 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6630 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6632 = _6630 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6634 = _6606 * _6612;
            float _6636 = precise::clamp(_6634, 0.0, 1.0);
            float _6638 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6640 = _6638 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6642 = fma(_6636, _6620, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6644 = fma(_6636, _6640, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6646 = fma(_6636, _6616, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6648 = fma(_6636, _6624, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6650 = fma(_6636, _6628, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6652 = fma(_6636, _6632, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6584 = _6646;
            _6518 = _6650;
            _6552 = _6644;
            _6564 = _6648;
            _6592 = _6642;
            _6524 = _6652;
            _6654 = true;
        }
        else
        {
            bool _6656 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6658 = isnan(_6187);
            bool _6660 = _6656 || _6658;
            bool _6662 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6664 = _6660 || _6662;
            if (!_6664)
            {
                _6562 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6666 = _6562;
            _6564 = _6666;
            if (!_6664)
            {
                _6516 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6668 = _6516;
            _6518 = _6668;
            if (!_6664)
            {
                _6522 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6670 = _6522;
            _6524 = _6670;
            if (!_6664)
            {
                _6550 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6672 = _6550;
            _6552 = _6672;
            if (!_6664)
            {
                _6582 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6674 = _6582;
            _6584 = _6674;
            if (!_6664)
            {
                _6590 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6676 = _6590;
            bool _6678 = !_6664;
            _6592 = _6676;
            if (!_6678)
            {
                bool _6680 = _6187 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6682 = isnan(_6187);
                bool _6684 = _6680 || _6682;
                bool _6686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6688 = _6684 || _6686;
                if (!_6688)
                {
                    float _6690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6692 = _6187 + _6690;
                    float _6694 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6696 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6694;
                    float _6698 = 1.0 / _6696;
                    float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6708 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6710 = _6708 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6712 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6714 = _6712 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6716 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6718 = _6716 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6720 = _6692 * _6698;
                    float _6722 = precise::clamp(_6720, 0.0, 1.0);
                    float _6724 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6726 = _6724 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6728 = fma(_6722, _6706, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6730 = fma(_6722, _6726, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6732 = fma(_6722, _6702, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6734 = fma(_6722, _6710, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6736 = fma(_6722, _6714, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6738 = fma(_6722, _6718, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6584 = _6732;
                    _6518 = _6736;
                    _6552 = _6730;
                    _6564 = _6734;
                    _6592 = _6728;
                    _6524 = _6738;
                    _6654 = true;
                }
                else
                {
                    _6584 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6518 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6552 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6564 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6592 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6524 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6654 = false;
    float _6740 = _6584;
    float _6742 = _6518;
    float _6744 = _6552;
    float _6746 = _6564;
    float _6748 = _6592;
    float _6750 = _6524;
    float _6752 = _6492 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6754 = fma(_5673, -0.5, 0.5);
    float _6756 = precise::clamp(_6754, 0.0, 1.0);
    float _6758 = -_6740;
    float _6760 = _6742 + _6758;
    float _6762 = -_6744;
    float _6764 = _6746 + _6762;
    out.m_53.x = _6752;
    float _6766 = -_6748;
    float _6768 = _6750 + _6766;
    float _6770 = fma(_6756, _6760, _6740);
    float _6772 = fma(_6756, _6764, _6744);
    bool _6774 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6776 = _6770 * 0.586610972881317138671875;
    float _6778 = fma(_6756, _6768, _6748);
    out.m_111.x = 0.0;
    bool _6780 = _6071 > 0.0;
    bool _6782 = isnan(_6071);
    bool _6784 = _6780 || _6782;
    bool _6786 = isnan(0.0);
    bool _6788 = _6784 || _6786;
    float _6790 = fma(_6772, 0.298911988735198974609375, _6776);
    float _6792 = fma(_6778, 0.114477999508380889892578125, _6790);
    float _6794 = -_6792;
    float _6796 = _6772 + _6794;
    float _6798 = -_6792;
    float _6800 = _6770 + _6798;
    float _6802 = -_6792;
    float _6804 = _6778 + _6802;
    float _6806 = fma(_6796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6792);
    float _6808 = fma(_6800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6792);
    float _6810 = fma(_6804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6792);
    bool _6812 = !_6774;
    if (!_6812)
    {
        float _6814 = -_6017;
        float _6816 = _6814 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6818 = -_6019;
        float _6820 = _6818 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6822 = -_6021;
        float _6824 = _6822 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6826 = _6816 * _6816;
        float _6828 = fma(_6820, _6820, _6826);
        float _6830 = fma(_6824, _6824, _6828);
        float _6832 = sqrt(_6830);
        float _6834 = rsqrt(_6830);
        float _6836 = -_6832;
        float _6838 = _6836 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6840 = _6838 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6842 = precise::clamp(_6840, 0.0, 1.0);
        float _6844 = _6820 * _6834;
        float _6846 = _6816 * _6834;
        float _6848 = abs(_6842);
        float _6850 = log2(_6848);
        float _6852 = _6824 * _6834;
        float _6854 = _6844 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6856 = _5673 * _6846;
        float _6858 = -_6846;
        float _6860 = -_6854;
        float _6862 = fma(_6858, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6860);
        float _6864 = fma(_5677, _6844, _6856);
        float _6866 = -_6852;
        float _6868 = fma(_6866, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6862);
        float _6870 = fma(_5685, _6852, _6864);
        float _6872 = precise::clamp(_6870, 0.0, 1.0);
        float _6874 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6876 = _6868 + _6874;
        float _6878 = _6850 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6880 = _6876 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6882 = precise::clamp(_6880, 0.0, 1.0);
        float _6884 = exp2(_6878);
        float _6886 = _6884 * _6882;
        float _6888 = _6872 * _6886;
        float _6890 = _6888 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6892 = _6888 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6894 = _6888 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _6890;
        out.m_111.y = _6892;
        out.m_111.z = _6894;
    }
    out.m_113.x = _6806;
    out.m_113.y = _6808;
    out.m_113.z = _6810;
    if (_6788)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _6896 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6896;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

