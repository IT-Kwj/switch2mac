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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture2d<float> vp_t_tcb_A [[id(6)]];
    sampler vp_t_tcb_ASmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_ASmplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2341 = false;
    bool _542 = false;
    bool _420 = false;
    bool _288 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2627 = as_type<float>(_118);
        out.gl_Position.z = _2627;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_51.w;
    float _124 = float(_102);
    float _126 = -_122;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_122);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    bool _140 = _128 >= _124;
    bool _142 = !_138;
    bool _144 = _140 || _142;
    float _146 = _128;
    if (_144)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_144)
    {
        out.m_49.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2691 = as_type<float>(_152);
        out.gl_Position.z = _2691;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = 1.0 / _124;
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _158 = _128 * _154;
    bool _160 = !_156;
    float _178;
    if (!_160)
    {
        float _162 = in.m_53.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        _178 = _158;
    }
    _180 = false;
    float _182 = _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _186 = _182 + _184;
    bool _188 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _190 = isnan(_182);
    bool _192 = _188 || _190;
    bool _194 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _196 = _192 || _194;
    float _198 = float(_196);
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    bool _204 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _206 = isnan(_182);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _212 = _208 || _210;
    float _214 = float(_212);
    float _216 = -_198;
    float _218 = _216 + 1.0;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _220;
    float _224 = 1.0 / _202;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _228 = _214 * _218;
    float _230 = -_214;
    float _232 = _230 + 1.0;
    float _234 = _186 * _224;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _236;
    float _240 = fma(_222, _234, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = fma(_238, _234, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _248 = _240 * _228;
    float _250 = fma(_244, _234, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _252 = _246 * _228;
    float _254 = _250 * _228;
    float _256 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[143].x, _248);
    float _258 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[143].y, _254);
    float _260 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[143].z, _252);
    float _262 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[144].x, _256);
    float _264 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[144].y, _258);
    float _266 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[144].z, _260);
    bool _268 = !_226;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        _286 = _158;
    }
    _288 = false;
    float _290 = _286;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _308;
    bool _312 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _314 = isnan(_290);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_306;
    float _326 = _324 + 1.0;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _328;
    float _332 = 1.0 / _310;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _336 = _322 * _326;
    float _338 = -_322;
    float _340 = _338 + 1.0;
    float _342 = _294 * _332;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _344;
    float _348 = fma(_330, _342, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _350;
    float _354 = fma(_346, _342, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _356 = _348 * _336;
    float _358 = fma(_352, _342, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _360 = _354 * _336;
    float _362 = in.m_55.x;
    float _364 = in.m_55.y;
    float _366 = in.m_55.z;
    float _368 = _358 * _336;
    float _370 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[107].x, _356);
    float _372 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[107].y, _368);
    float _374 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[107].z, _360);
    float _376 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[108].x, _370);
    float _378 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[108].y, _372);
    float _380 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[108].z, _374);
    float _382 = _376 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _384 = _378 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _386 = _380 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _388 = _382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _390 = _384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _388;
    out.m_57.y = _390;
    out.m_57.z = _392;
    float _394 = _266 * _366;
    float _396 = _264 * _364;
    float _398 = _262 * _362;
    bool _400 = !_334;
    float _418;
    if (!_400)
    {
        float _402 = in.m_53.x;
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _406 = _402 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _418 = _416;
        _420 = true;
    }
    else
    {
        _418 = _158;
    }
    _420 = false;
    float _422 = _418;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _426 = _422 + _424;
    bool _428 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _430 = isnan(_422);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _440;
    bool _444 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _446 = isnan(_422);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -_438;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _460;
    float _464 = 1.0 / _442;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _468 = _454 * _458;
    float _470 = -_454;
    float _472 = _470 + 1.0;
    float _474 = _426 * _464;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _476;
    float _480 = fma(_462, _474, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _482;
    float _486 = fma(_478, _474, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _488 = _480 * _468;
    float _490 = fma(_484, _474, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _492 = _486 * _468;
    float _494 = _490 * _468;
    float _496 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[123].x, _488);
    float _498 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[123].y, _494);
    float _500 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[123].z, _492);
    float _502 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[124].x, _496);
    float _504 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[124].y, _498);
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[124].z, _500);
    float _508 = _502 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _510 = _504 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _512 = _506 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _514 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _514;
    out.m_59.y = _516;
    out.m_59.z = _518;
    bool _520 = !_466;
    float _522 = _508;
    float _540;
    if (!_520)
    {
        float _524 = in.m_53.x;
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _528 = _524 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _522 = _532;
        _540 = _538;
        _542 = true;
    }
    else
    {
        _540 = _158;
    }
    _542 = false;
    float _544 = _522;
    float _546 = _540;
    float _548 = in.m_61.x;
    float _550 = in.m_61.y;
    float _552 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _554 = _396 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _556 = in.m_53.x;
    float _558 = in.m_53.y;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _562 = _560 != 0;
    float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _566 = in.m_53.z;
    float _568 = in.m_53.w;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _576 = _574 != 0;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _582 = _580 != 0;
    float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _588 = _586 != 0;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _592 = _544;
    if (!_562)
    {
        float _594 = in.m_53.z;
        _590 = _594;
    }
    float _596 = _590;
    float _598 = _564 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _600 = _552 * _548;
    float _602 = _554 * _550;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _606 = -_600;
    float _608 = _606 + 1.0;
    bool _610 = _556 > 0.5;
    float _612 = -_602;
    float _614 = _612 + 1.0;
    float _616 = _602;
    float _618 = _600;
    if (!_562)
    {
        _592 = _558;
    }
    float _620 = _592;
    float _622 = _584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _624 = _568 > 0.5;
    int _626 = _610 ? as_type<int>(_608) : as_type<int>(_600);
    bool _628 = _558 > 0.5;
    float _630 = _620;
    float _632 = _596;
    if (_562)
    {
        _630 = _556;
    }
    float _634 = _630;
    int _636 = _628 ? as_type<int>(_614) : as_type<int>(_602);
    bool _638 = !_572;
    float _640 = _638 ? _600 : as_type<float>(_626);
    float _642 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[83].z, _578);
    float _644 = _634 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _646 = _566 > 0.5;
    bool _648 = !_576;
    float _650 = _648 ? _602 : as_type<float>(_636);
    float _652 = _644;
    if (_588)
    {
        float _654 = _624 ? _614 : _602;
        _616 = _654;
    }
    float _656 = _616;
    float _658 = -_604;
    float _660 = fma(_644, 2.0, _658);
    if (_582)
    {
        float _662 = _646 ? _608 : _600;
        _618 = _662;
    }
    float _664 = _618;
    if (!_562)
    {
        _652 = _596;
    }
    float _666 = _652;
    float _668 = -_128;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[81].x, _660);
    float _672 = fma(_598, _664, -0.5);
    float _674 = fma(_622, _656, -0.5);
    float _676 = _666;
    if (_562)
    {
        _676 = _558;
    }
    float _678 = _676;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_562)
    {
        _632 = _558;
    }
    float _682 = _632;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _688 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].w, _680);
    float _690 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _642);
    float _692 = fma(_686, -2.0, _684);
    float _694 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _688);
    float _696 = fma(_690, _672, _670);
    float _698 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _692);
    float _700 = _696 + 0.5;
    float _702 = -_698;
    float _704 = fma(_694, _674, _702);
    float _706 = _704 + 0.5;
    float2 _3631 = float2(_700, _706);
    float _708 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_3631, float2(0.0), isnan(_3631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_3631, float2(0.0), isnan(_3631)), level(0.0)).w;
    float _710 = in.m_63.x;
    float _712 = in.m_63.y;
    float _714 = in.m_63.z;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _718 = _546 + _716;
    float _720 = in.m_61.z;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _724 = _546 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _728 = _546 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _732 = _546 + _730;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _744 = _742 != 0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _750;
    float _754 = 1.0 / _748;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _762 = _546 + _760;
    float _764 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _768 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00999999977648258209228515625, _710);
    float _770 = -_548;
    float _772 = _770 + _710;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _778 = 1.0 / _752;
    float _780 = -_720;
    float _782 = _780 + _714;
    float _784 = -_712;
    float _786 = fma(_784, 0.800000011920928955078125, 1.0);
    float _788 = -_550;
    float _790 = _788 + _712;
    float _792 = fma(_712, 2.0, -1.0);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _794;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _800 = 1.0 / _776;
    float _802 = _556 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _804 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _806 = _768 + _556;
    float _808 = -_798;
    float _810 = fma(_802, 2.0, _808);
    float _812 = fma(_804, -2.0, _766);
    float _814 = 1.0 / _758;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _822 = _546 + _820;
    float _824 = _718 * _778;
    float _826 = _806 * 12.56637096405029296875;
    float _828 = -_128;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _810);
    float _832 = 1.0 / _818;
    float _834 = _728 * _800;
    float _836 = _826 * 0.15915493667125701904296875;
    float _838 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _840 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _842 = isnan(_546);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = 1.0 / _796;
    float _854 = _822 * _814;
    float _856 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _838);
    float _858 = _556 * 2.0;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _862 = _546 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _864;
    float _868 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _856);
    float _870 = _558 * 2.0;
    float _872 = _724 * _832;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _874;
    float _878 = _566 * 2.0;
    float _880 = _558 + _566;
    float _882 = floor(_858);
    float _884 = _862 * _754;
    bool _886 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _888 = isnan(_546);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _880 + (-1.0);
    float _900 = _762 * _852;
    float _902 = 1.0 / _876;
    float _904 = -_896;
    float _906 = _904 + 1.0;
    bool _908 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _910 = isnan(_546);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _928 = floor(_878);
    bool _930 = _882 >= 0.0;
    bool _932 = isnan(_882);
    bool _934 = _930 || _932;
    bool _936 = isnan(0.0);
    bool _938 = _934 || _936;
    bool _940 = _882 > 0.0;
    float _942 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _944 = _556 + _566;
    float _946 = _558 + _556;
    float _948 = _732 * _902;
    float _950 = floor(_870);
    float _952 = _944 + (-1.0);
    float _954 = _946 + (-1.0);
    int _956 = _938 ? 0 : 1;
    float _958 = _566 + (-0.5);
    float _960 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _962 = _928 > 0.0;
    float _964 = rint(_556);
    bool _966 = _928 >= 0.0;
    bool _968 = isnan(_928);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    float _976 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _978;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    int _986 = _974 ? 0 : 1;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _988;
    bool _992 = _950 > 0.0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _994;
    bool _998 = _950 >= 0.0;
    bool _1000 = isnan(_950);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(0.0);
    bool _1006 = _1002 || _1004;
    float _1008 = fma(_990, _824, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1010 = fma(_996, _824, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1012 = fma(_980, _824, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1022 = fma(_964, 2.0, -1.0);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1024;
    float _1028 = fma(_1016, _854, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1034 = fma(_1020, _854, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1036;
    float _1040 = fma(_984, _854, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1046 = fma(_1026, _884, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1048 = fma(_1038, _884, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1050 = fma(_1032, _834, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1052 = fma(_1044, _834, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _1054 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1056 = isnan(_546);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1074;
    float _1078 = -_1064;
    float _1080 = _1078 + 1.0;
    float _1082 = fma(_1068, _884, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1084 = fma(_1072, _834, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1086;
    float _1090 = _850 * _1080;
    float _1092 = -_850;
    float _1094 = _1092 + 1.0;
    float _1096 = fma(_866, _900, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _1098 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1100 = isnan(_546);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = fma(_1088, _900, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1112 = _896 * _1094;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1122 = -_1108;
    float _1124 = _1122 + 1.0;
    float _1126 = _1108 * _906;
    bool _1128 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1130 = isnan(_546);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = fma(_922, _900, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1142 = fma(_1116, _872, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1144 = fma(_1120, _872, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1146 = _918 * _1124;
    float _1148 = fma(_926, _872, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1150 = -_918;
    float _1152 = _1150 + 1.0;
    bool _1154 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1156 = isnan(_546);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = rsqrt(_868);
    bool _1168 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1170 = isnan(_546);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1176 = _1172 || _1174;
    float _1178 = float(_1176);
    float _1180 = -_1138;
    float _1182 = _1180 + 1.0;
    float _1184 = _1138 * _1152;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1186;
    float _1190 = _1178 * _1182;
    float _1192 = -_1178;
    float _1194 = _1192 + 1.0;
    float _1196 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1198 = log2(_1196);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1200;
    float _1204 = _1164 * _1194;
    float _1206 = -_1164;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1188, _948, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1212 = fma(_1202, _948, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1214 = _1008 * _1204;
    float _1216 = _836 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    int _1220 = _1006 ? 0 : 1;
    float _1222 = fma(_1076, _948, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1214);
    int _1226 = ~_956;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1230;
    if (!_940)
    {
        int _1234 = ~_956;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    float _1240 = _1010 * _1204;
    float _1242 = _1012 * _1204;
    int _1244 = ~_986;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1240);
    float _1252 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1242);
    int _1254 = ~_1220;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    float _1260 = fma(_1218, -0.125, -0.125);
    int _1262 = _1258;
    int _1264 = _1248;
    if (!_992)
    {
        int _1266 = ~_1220;
        int _1268 = _1266 + 1;
        _1262 = _1268;
    }
    int _1270 = _1262;
    float _1272 = _1198 * _128;
    bool _1274 = !_736;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = fma(_1028, _1190, _1250);
    if (!_962)
    {
        int _1280 = ~_986;
        int _1282 = _1280 + 1;
        _1264 = _1282;
    }
    int _1284 = _1264;
    float _1286 = fma(_1034, _1190, _1224);
    int _1288 = abs(_1276);
    float _1290 = exp2(_1272);
    float _1292 = in.m_65.x;
    float _1294 = in.m_65.y;
    float _1296 = in.m_65.z;
    float _1298 = fma(_1040, _1190, _1252);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1302 = 1.0 + _1300;
    float _1304 = float(_1288);
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1308 = float(_1284);
    float _1310 = 1.0 / _1302;
    bool _1312 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1314 = isnan(1.0);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1320 = _1316 || _1318;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1324 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1306);
    float _1326 = _1304 * _1308;
    bool _1328 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = -_1290;
    float _1340 = _1338 + 1.0;
    float _1342 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1322);
    bool _1344 = !_740;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1324);
    float _1350 = _556 + (-0.5);
    float _1352 = _1336 ? _1340 : 0.0;
    float _1354 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1342);
    float _1356 = _1326 * (-2.0);
    int _1358 = abs(_1346);
    float _1360 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _812);
    if (_1320)
    {
        float _1362 = _1352 * _1310;
        _146 = _1362;
    }
    float _1364 = _146;
    float _1366 = fma(_1356, _1292, _1292);
    float _1368 = fma(_976, _1356, _976);
    bool _1370 = !_744;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1366);
    float _1376 = float(_1358);
    float _1378 = fma(_1046, _1184, _1286);
    float _1380 = float(_1238);
    float _1382 = fma(_1368, _1364, _1374);
    int _1384 = abs(_1372);
    float _1386 = fma(_1050, _1146, _1378);
    float _1388 = _558 + (-0.5);
    float _1390 = _1376 * _1380;
    float _1392 = _1382 * 0.15915493667125701904296875;
    float _1394 = float(_1384);
    float _1396 = fma(_1048, _1184, _1278);
    float _1398 = _1390 * (-2.0);
    float _1400 = float(_1270);
    float _1402 = fma(_1110, _1126, _1386);
    float _1404 = fma(_1052, _1146, _1396);
    float _1406 = fma(_1398, _1294, _1294);
    float _1408 = fma(_1082, _1184, _1298);
    float _1410 = _1394 * _1400;
    float _1412 = fma(_1142, _1112, _1402);
    float _1414 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1406);
    float _1416 = fma(_1096, _1126, _1404);
    float _1418 = _1410 * (-2.0);
    float _1420 = fma(_1210, _1090, _1412);
    float _1422 = fma(_1084, _1146, _1408);
    float _1424 = fma(_1144, _1112, _1416);
    float _1426 = fma(_1418, _1296, _1296);
    float _1428 = fma(_960, _1418, _960);
    float _1430 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1420);
    float _1432 = fma(_1212, _1090, _1424);
    float _1434 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1426);
    float _1436 = fma(_942, _1398, _942);
    float _1438 = fma(_1430, _790, _550);
    float _1440 = _720 * _720;
    float _1442 = fma(_1428, _1364, _1434);
    float _1444 = fma(_1140, _1126, _1422);
    float _1446 = fma(_1436, _1364, _1414);
    float _1448 = fma(_548, _548, _1440);
    float _1450 = _1442 * 0.15915493667125701904296875;
    float _1452 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1432);
    float _1454 = fma(_1148, _1112, _1444);
    float _1456 = _1446 * 0.15915493667125701904296875;
    float _1458 = _1392 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = -_1452;
    float _1464 = _1462 + 1.0;
    float _1466 = fma(_1222, _1090, _1454);
    float _1468 = fma(_1430, _772, _548);
    float _1470 = _792 * _1464;
    float _1472 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1466);
    float _1474 = fma(_1430, _782, _720);
    float _1476 = rsqrt(_1448);
    float _1478 = _1470 * _1022;
    float _1480 = _1472 * _786;
    float _1482 = _158 * _1260;
    float _1484 = _1480 * 18.0;
    float _1486 = _1456 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    float _1490 = -_1484;
    float _1492 = fma(_1490, _1166, _1438);
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[193].x, _1492);
    float _1496 = _1456 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    float _1500 = fma(_708, 0.20000000298023223876953125, -0.100000001490116119384765625);
    float _1502 = _1476 * _1500;
    float _1504 = _1450 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = _1460 * _1488;
    float _1510 = _1452 * _1502;
    float _1512 = _1510 * 0.5;
    float _1514 = fma(_548, _1512, _1468);
    float _1516 = fma(_720, _1512, _1474);
    float _1518 = _1392 * 6.283185482025146484375;
    float _1520 = cos(_1518);
    float _1522 = _1460 * _1498;
    float _1524 = _1450 * 6.283185482025146484375;
    float _1526 = sin(_1524);
    float _1528 = _1460 * _1506;
    float _1530 = _1498 * _1506;
    float _1532 = _1520 * _1498;
    float _1534 = _1478 * 0.15915493667125701904296875;
    float _1536 = _1520 * _1488;
    float _1538 = _1520 * _1506;
    float _1540 = _1488 * _1506;
    float _1542 = _1534 * 6.283185482025146484375;
    float _1544 = cos(_1542);
    float _1546 = fma(_1526, _1532, _1508);
    float _1548 = fma(_1526, _1508, _1532);
    float _1550 = -_1536;
    float _1552 = fma(_1526, _1522, _1550);
    float _1554 = in.m_46.x;
    float _1556 = in.m_46.y;
    float _1558 = in.m_46.z;
    float _1560 = -_1522;
    float _1562 = fma(_1526, _1536, _1560);
    float _1564 = _1534 * 6.283185482025146484375;
    float _1566 = sin(_1564);
    float _1568 = _1514 * _1544;
    float _1570 = _1514 * _1566;
    float _1572 = fma(_1516, _1566, _1568);
    float _1574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1494);
    float _1576 = -_1570;
    float _1578 = fma(_1516, _1544, _1576);
    float _1580 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1572);
    float _1582 = _554 * _1574;
    float _1584 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1586 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1578);
    float _1588 = _552 * _1580;
    float _1590 = -_1582;
    float _1592 = _1526 * _1590;
    float _1594 = _1528 * _1582;
    float _1596 = _764 * _1586;
    float _1598 = _1538 * _1582;
    float _1600 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1602 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1604 = fma(_1530, _1588, _1592);
    float _1606 = fma(_1546, _1588, _1598);
    float _1608 = fma(_1552, _1588, _1594);
    float _1610 = fma(_1554, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1602);
    float _1612 = fma(_1540, _1596, _1604);
    float _1614 = fma(_1562, _1596, _1606);
    float _1616 = fma(_1554, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1584);
    float _1618 = fma(_1554, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1600);
    float _1620 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1610);
    float _1622 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1624 = fma(_1548, _1596, _1608);
    float _1626 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1628 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1616);
    float _1630 = fma(_1612, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1622);
    float _1632 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1618);
    float _1634 = _1620 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1636 = fma(_1612, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1626);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1630);
    float _1640 = _1628 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1642 = _1632 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1644 = fma(_1624, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1636);
    float _1646 = _1634 + _1638;
    float _1648 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1650 = _1640 + _1644;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1654 = _1646 + _1652;
    float _1656 = fma(_1612, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1648);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1660 = _1650 + _1658;
    float _1662 = _1654 * _1654;
    float _1664 = fma(_1624, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1656);
    float _1666 = fma(_1660, _1660, _1662);
    float _1668 = _1642 + _1664;
    float _1670 = sqrt(_1666);
    bool _1672 = _1670 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1662;
    float _1676 = _1650;
    float _1678 = _1656;
    float _1680 = _1664;
    if (!_1672)
    {
        _1674 = _1650;
    }
    float _1682 = _1674;
    float _1684 = _1682;
    if (!_1672)
    {
        _1676 = _1646;
    }
    float _1686 = _1676;
    float _1688 = _1686;
    if (!_1672)
    {
        _1678 = _1668;
    }
    float _1690 = _1678;
    bool _1692 = !_1672;
    float _1694 = _1690;
    if (!_1692)
    {
        float _1696 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1700 = _1670 + _1698;
        float _1702 = rsqrt(_1666);
        float _1704 = _1700 * _1696;
        float _1706 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1708 = _1704 * 0.15915493667125701904296875;
        float _1710 = _1708 * 6.283185482025146484375;
        float _1712 = cos(_1710);
        float _1714 = _1708 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        float _1718 = _1712 + (-1.0);
        float _1720 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = fma(_1716, _1706, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1724 = fma(_1668, _1712, _1720);
        float _1726 = _1702 * _1722;
        float _1728 = fma(_1660, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1730 = fma(_1654, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1694 = _1724;
        _1684 = _1728;
        _1688 = _1730;
    }
    float _1732 = _1694;
    float _1734 = _1684;
    float _1736 = _1688;
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1740 = _1732 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1744 = _1734 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = _1736 + _1746;
    float _1750 = _1740 * _1740;
    float _1752 = fma(_1744, _1744, _1750);
    float _1754 = fma(_1748, _1748, _1752);
    float _1756 = rsqrt(_1754);
    float _1758 = sqrt(_1754);
    float _1760 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1762 = _1744 * _1760;
    float _1764 = _1748 * _1760;
    float _1766 = _1762 * _1762;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 + _1768;
    float _1772 = sqrt(_1770);
    bool _1774 = _1772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = _1772 + _1776;
    float _1780 = _1756;
    float _1782 = _1778;
    float _1784 = _1740;
    float _1786 = _1760;
    if (_1774)
    {
        float _1788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1780 = _1788;
    }
    float _1790 = _1780;
    float _1792 = _1790;
    if (_1774)
    {
        float _1794 = _1778 * _1790;
        _1782 = _1794;
    }
    float _1796 = _1782;
    if (_1774)
    {
        float _1798 = rsqrt(_1770);
        _1792 = _1798;
    }
    float _1800 = _1792;
    float _1802 = _1800;
    if (_1774)
    {
        float _1804 = _1796 * 0.15915493667125701904296875;
        _1680 = _1804;
    }
    float _1806 = _1680;
    float _1808 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1810 = _1748;
    float _1812 = _1806;
    if (_1774)
    {
        float _1814 = _1806 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        _1810 = _1816;
    }
    float _1818 = _1810;
    float _1820 = precise::max(0.0, _1808);
    float _1822 = _1668;
    float _1824 = _1820;
    if (_1774)
    {
        float _1826 = _1806 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        _1822 = _1828;
    }
    float _1830 = _1822;
    float _1832 = -_1760;
    float _1834 = -_1820;
    float _1836 = fma(_1740, _1832, _1834);
    if (_1774)
    {
        float _1838 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1838;
    }
    float _1840 = _1784;
    float _1842 = _1818;
    float _1844 = _1840;
    if (_1774)
    {
        float _1846 = fma(_1818, _1840, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1842 = _1846;
    }
    float _1848 = _1842;
    float _1850 = _1848;
    if (!_1774)
    {
        _1844 = _1766;
    }
    float _1852 = _1844;
    float _1854 = _1852;
    if (_1774)
    {
        float _1856 = _1800 * _1848;
        _1786 = _1856;
    }
    float _1858 = _1786;
    if (!_1774)
    {
        _1802 = _1762;
    }
    float _1860 = _1802;
    float _1862 = _1860;
    float _1864 = _1830;
    if (_1774)
    {
        float _1866 = _1830 + (-1.0);
        _1824 = _1866;
    }
    float _1868 = _1824;
    float _1870 = _1868;
    if (_1774)
    {
        float _1872 = _1762 * _1858;
        _1862 = _1872;
    }
    float _1874 = _1862;
    if (!_1774)
    {
        _1850 = _1836;
    }
    float _1876 = _1850;
    float _1878 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1880 = _1876;
    if (_1774)
    {
        float _1882 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1812 = _1882;
    }
    float _1884 = _1812;
    if (!_1774)
    {
        _1870 = _1764;
    }
    float _1886 = _1870;
    float _1888 = _1886;
    if (_1774)
    {
        float _1890 = _1764 * _1858;
        _1888 = _1890;
    }
    float _1892 = _1888;
    if (_1774)
    {
        float _1894 = _1874 * _1874;
        _1854 = _1894;
    }
    float _1896 = _1854;
    if (_1774)
    {
        float _1898 = fma(_1836, _1830, _1884);
        _1880 = _1898;
    }
    float _1900 = _1880;
    if (!_1774)
    {
        _1864 = _1768;
    }
    float _1902 = _1864;
    float _1904 = _1902;
    if (_1774)
    {
        float _1906 = _1892 * _1892;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1900, _1900, _1896);
    float _1912 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1914 = _1910 + _1908;
    float _1916 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1878);
    float _1918 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1922 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1920);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = rsqrt(_1914);
    float _1928 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1916);
    float _1930 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1932 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1918);
    float _1934 = -_1924;
    float _1936 = _1934 + 1.0;
    float _1938 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1940 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1930);
    float _1942 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1932);
    float _1944 = abs(_1936);
    float _1946 = log2(_1944);
    float _1948 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1938);
    float _1950 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1940);
    float _1952 = _1942 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1954 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1956 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1948);
    float _1958 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1962 = _1926 * _1874;
    float _1964 = _1926 * _1900;
    float _1966 = _1926 * _1892;
    float _1968 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1960);
    float _1970 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1972 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1974 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1976 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1968);
    float _1978 = -_1970;
    float _1980 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1978);
    float _1982 = -_1972;
    float _1984 = fma(_1982, _1912, 1.0);
    float _1986 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1988 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1976);
    float _1990 = -_1966;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1980);
    float _1994 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1996 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1998 = log2(_1984);
    float _2000 = fma(_1992, -0.5, 0.5);
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1994);
    float _2004 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1996);
    float _2006 = fma(_1992, 0.5, 0.5);
    float _2008 = _1964 + 1.0;
    float _2010 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2002);
    float _2012 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2004);
    float _2014 = 1.0 / _1988;
    float _2016 = fma(_2006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2018 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2010);
    float _2020 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2012);
    float _2022 = fma(_2006, _2016, -0.212114393711090087890625);
    float _2024 = exp2(_1986);
    float _2026 = _1998 * 0.693147182464599609375;
    float _2028 = fma(_2006, _2022, 1.570728778839111328125);
    float _2030 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2032 = sqrt(_2000);
    float _2034 = _2018 * _2014;
    float _2036 = _2020 * _2014;
    float _2038 = fma(_2034, 0.5, 0.5);
    float _2040 = fma(_2036, -0.5, 0.5);
    float _2042 = -_1964;
    float _2044 = fma(_2024, _2008, _2042);
    float3 _5786 = float3(_2038, _2040, _2030);
    float _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5786, float3(0.0), isnan(_5786)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5786, float3(0.0), isnan(_5786)), level(0.0)).x;
    float _2048 = fma(_2044, 0.5, 0.5);
    float _2050 = _2032 * 0.636619746685028076171875;
    float _2052 = -_2028;
    float _2054 = fma(_2050, _2052, 1.0);
    float3 _5807 = float3(_2038, _2040, _2030);
    float4 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5807, float3(0.0), isnan(_5807)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5807, float3(0.0), isnan(_5807)), level(0.0)).xyzw;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = _2057.w;
    float2 _5823 = float2(_2054, _2048);
    float3 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5823, float2(0.0), isnan(_5823)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5823, float2(0.0), isnan(_5823)), level(0.0)).xyz;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = in.m_67.x;
    float _2079 = in.m_67.y;
    float _2081 = in.m_67.z;
    bool _2083 = _1494 != 0.0;
    bool _2085 = isnan(_1494);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan(0.0);
    bool _2091 = _2087 || _2089;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2095 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2097 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2099 = _1572 == 0.0;
    bool _2101 = !_2091;
    bool _2103 = _2099 && _2101;
    out.m_69.x = _1734;
    out.m_69.y = _1732;
    out.m_69.z = _1736;
    float _2105 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2097);
    bool _2107 = _1578 == 0.0;
    bool _2109 = _2107 && _2103;
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2113 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2105);
    float _2115 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2113);
    float _2117 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2119 = exp2(_2095);
    float _2121 = fma(_640, _2117, -0.5);
    float _2123 = _2079;
    float _2125 = _2077;
    float _2127 = _2081;
    float _2129 = _1988;
    float _2131 = _2115;
    float _2133 = _2020;
    if (!_2109)
    {
        float _2135 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2079);
        _2123 = _2135;
    }
    float _2137 = _2123;
    if (!_2109)
    {
        float _2139 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2077);
        _2125 = _2139;
    }
    float _2141 = _2125;
    float _2143 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2145 = fma(_1348, _2121, _830);
    float _2147 = _1538 * _2137;
    float _2149 = -_2137;
    float _2151 = _1526 * _2149;
    float _2153 = fma(_650, _2143, -0.5);
    if (!_2109)
    {
        float _2155 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2081);
        _2127 = _2155;
    }
    float _2157 = _2127;
    float _2159 = fma(_1546, _2141, _2147);
    float _2161 = _2145 + 0.5;
    float _2163 = -_1360;
    float _2165 = fma(_1354, _2153, _2163);
    float _2167 = fma(_1530, _2141, _2151);
    float _2169 = _1528 * _2137;
    float _2171 = fma(_1562, _2157, _2159);
    float _2173 = _2165 + 0.5;
    float _2175 = _2115 + _1988;
    float _2177 = -_2119;
    float _2179 = _2177 + 1.0;
    float _2181 = fma(_1540, _2157, _2167);
    float _2183 = fma(_1552, _2141, _2169);
    out.m_71.x = _2161;
    out.m_71.y = _2173;
    float _2185 = _2171 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2187 = _2175 * 0.5;
    float _2189 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2191 = fma(_1548, _2157, _2183);
    float _2193 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2185);
    bool _2195 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2197 = isnan(_1758);
    bool _2199 = _2195 || _2197;
    bool _2201 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2203 = _2199 || _2201;
    float _2205 = fma(_2191, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2193);
    float _2207 = _2171 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2209 = _2171 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_73.z = _2187;
    out.m_73.w = _1988;
    float _2211 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2207);
    float _2213 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2209);
    float _2215 = -_2189;
    float _2217 = _2215 + 1.0;
    float _2219 = fma(_2191, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2211);
    float _2221 = fma(_2191, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2213);
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _2115;
    out.gl_Position.w = _1988;
    float _2223 = _2193;
    float _2225 = _2018;
    float _2227 = _2217;
    if (!_2203)
    {
        _2223 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2229 = _2223;
    out.m_75.x = _2205;
    out.m_75.y = _2219;
    out.m_75.z = _2221;
    float _2231 = _2229;
    float _2233 = _2229;
    if (!_2203)
    {
        _2129 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2235 = _2129;
    float _2237 = _2235;
    float _2239 = _2235;
    if (!_2203)
    {
        _2131 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2241 = _2131;
    float _2243 = _2241;
    float _2245 = _2241;
    if (!_2203)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2247 = _2133;
    float _2249 = _2247;
    float _2251 = _2247;
    if (!_2203)
    {
        _2225 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2253 = _2225;
    float _2255 = _2189 * _2046;
    float _2257 = _2065 * _2255;
    float _2259 = _2065 * _2217;
    float _2261 = _2253;
    float _2263 = _2253;
    if (!_2203)
    {
        _2227 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2265 = _2227;
    float _2267 = _2075 * _2255;
    float _2269 = fma(_2071, _2257, _2059);
    float _2271 = fma(_2073, _2257, _2061);
    float _2273 = fma(_2065, _2267, _2063);
    out.m_77.x = _2269;
    out.m_77.y = _2271;
    out.m_77.z = _2273;
    out.m_77.w = _2259;
    bool _2275 = !_2203;
    float _2277 = _2265;
    float _2279 = _2265;
    if (!_2275)
    {
        bool _2281 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2283 = isnan(_1758);
        bool _2285 = _2281 || _2283;
        bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2289 = _2285 || _2287;
        if (!_2289)
        {
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = _1758 + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2297 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2295;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2303 = 1.0 / _2297;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2321 = _2293 * _2303;
            float _2323 = precise::clamp(_2321, 0.0, 1.0);
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2329 = fma(_2323, _2301, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2331 = fma(_2323, _2327, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2333 = fma(_2323, _2307, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2335 = fma(_2323, _2311, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2337 = fma(_2323, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2339 = fma(_2323, _2319, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2239 = _2333;
            _2263 = _2337;
            _2279 = _2329;
            _2251 = _2335;
            _2245 = _2331;
            _2233 = _2339;
            _2341 = true;
        }
        else
        {
            bool _2343 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2345 = isnan(_1758);
            bool _2347 = _2343 || _2345;
            bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2351 = _2347 || _2349;
            if (!_2351)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2353 = _2277;
            _2279 = _2353;
            if (!_2351)
            {
                _2237 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2355 = _2237;
            _2239 = _2355;
            if (!_2351)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2357 = _2243;
            _2245 = _2357;
            if (!_2351)
            {
                _2249 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2359 = _2249;
            _2251 = _2359;
            if (!_2351)
            {
                _2261 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2361 = _2261;
            _2263 = _2361;
            if (!_2351)
            {
                _2231 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2363 = _2231;
            bool _2365 = !_2351;
            _2233 = _2363;
            if (!_2365)
            {
                bool _2367 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2369 = isnan(_1758);
                bool _2371 = _2367 || _2369;
                bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2375 = _2371 || _2373;
                if (!_2375)
                {
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = _1758 + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2389 = 1.0 / _2383;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2407 = _2379 * _2389;
                    float _2409 = precise::clamp(_2407, 0.0, 1.0);
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2415 = fma(_2409, _2387, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2417 = fma(_2409, _2413, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2419 = fma(_2409, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2421 = fma(_2409, _2397, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2423 = fma(_2409, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2425 = fma(_2409, _2405, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2239 = _2419;
                    _2263 = _2423;
                    _2279 = _2415;
                    _2251 = _2421;
                    _2245 = _2417;
                    _2233 = _2425;
                    _2341 = true;
                }
                else
                {
                    _2239 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2263 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2251 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2233 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2341 = false;
    float _2427 = _2239;
    float _2429 = _2263;
    float _2431 = _2279;
    float _2433 = _2251;
    float _2435 = _2245;
    float _2437 = _2233;
    float _2439 = fma(_2219, -0.5, 0.5);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    float _2451 = -_2435;
    float _2453 = _2451 + _2437;
    bool _2455 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2457 = fma(_2441, _2445, _2427);
    float _2459 = fma(_2441, _2449, _2431);
    float _2461 = fma(_2441, _2453, _2435);
    float _2463 = _2457 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2465 = fma(_2459, 0.298911988735198974609375, _2463);
    float _2467 = fma(_2461, 0.114477999508380889892578125, _2465);
    out.m_79.x = 0.0;
    float _2469 = -_2467;
    float _2471 = _2459 + _2469;
    float _2473 = -_2467;
    float _2475 = _2457 + _2473;
    float _2477 = -_2467;
    float _2479 = _2461 + _2477;
    float _2481 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2483 = fma(_2471, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2485 = fma(_2475, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2487 = fma(_2479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    out.m_81.w = _2481;
    out.m_83.x = _2483;
    out.m_83.y = _2485;
    out.m_83.z = _2487;
    if (!_2455)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2489 = -_1732;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2493 = -_1734;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2497 = -_1736;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2501 = _2491 * _2491;
    float _2503 = fma(_2495, _2495, _2501);
    float _2505 = fma(_2499, _2499, _2503);
    float _2507 = sqrt(_2505);
    float _2509 = rsqrt(_2505);
    float _2511 = -_2507;
    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2515 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = _2495 * _2509;
    float _2521 = _2491 * _2509;
    float _2523 = abs(_2517);
    float _2525 = log2(_2523);
    float _2527 = _2499 * _2509;
    float _2529 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2531 = _2219 * _2521;
    float _2533 = -_2521;
    float _2535 = -_2529;
    float _2537 = fma(_2533, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2535);
    float _2539 = fma(_2205, _2519, _2531);
    float _2541 = -_2527;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2537);
    float _2545 = fma(_2221, _2527, _2539);
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2551 = _2543 + _2549;
    float _2553 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2555 = _2551 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = exp2(_2553);
    float _2561 = _2559 * _2557;
    float _2563 = _2547 * _2561;
    float _2565 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2567 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2569 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _2565;
    out.m_79.y = _2567;
    out.m_79.z = _2569;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2341 = false;
    bool _542 = false;
    bool _420 = false;
    bool _288 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2627 = as_type<float>(_118);
        out.gl_Position.z = _2627;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_51.w;
    float _124 = float(_102);
    float _126 = -_122;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_122);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    bool _140 = _128 >= _124;
    bool _142 = !_138;
    bool _144 = _140 || _142;
    float _146 = _128;
    if (_144)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_144)
    {
        out.m_49.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2691 = as_type<float>(_152);
        out.gl_Position.z = _2691;
    }
    if (_144)
    {
        return out;
    }
    float _154 = 1.0 / _124;
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _158 = _128 * _154;
    bool _160 = !_156;
    float _178;
    if (!_160)
    {
        float _162 = in.m_53.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        _178 = _158;
    }
    _180 = false;
    float _182 = _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _186 = _182 + _184;
    bool _188 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _190 = isnan(_182);
    bool _192 = _188 || _190;
    bool _194 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _196 = _192 || _194;
    float _198 = float(_196);
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    bool _204 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _206 = isnan(_182);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _212 = _208 || _210;
    float _214 = float(_212);
    float _216 = -_198;
    float _218 = _216 + 1.0;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _220;
    float _224 = 1.0 / _202;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _228 = _214 * _218;
    float _230 = -_214;
    float _232 = _230 + 1.0;
    float _234 = _186 * _224;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _236;
    float _240 = fma(_222, _234, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = fma(_238, _234, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _248 = _240 * _228;
    float _250 = fma(_244, _234, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _252 = _246 * _228;
    float _254 = _250 * _228;
    float _256 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[143].x, _248);
    float _258 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[143].y, _254);
    float _260 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[143].z, _252);
    float _262 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[144].x, _256);
    float _264 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[144].y, _258);
    float _266 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[144].z, _260);
    bool _268 = !_226;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        _286 = _158;
    }
    _288 = false;
    float _290 = _286;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _308;
    bool _312 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _314 = isnan(_290);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_306;
    float _326 = _324 + 1.0;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _328;
    float _332 = 1.0 / _310;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _336 = _322 * _326;
    float _338 = -_322;
    float _340 = _338 + 1.0;
    float _342 = _294 * _332;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _344;
    float _348 = fma(_330, _342, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _350;
    float _354 = fma(_346, _342, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _356 = _348 * _336;
    float _358 = fma(_352, _342, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _360 = _354 * _336;
    float _362 = in.m_55.x;
    float _364 = in.m_55.y;
    float _366 = in.m_55.z;
    float _368 = _358 * _336;
    float _370 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[107].x, _356);
    float _372 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[107].y, _368);
    float _374 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[107].z, _360);
    float _376 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[108].x, _370);
    float _378 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[108].y, _372);
    float _380 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[108].z, _374);
    float _382 = _376 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _384 = _378 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _386 = _380 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _388 = _382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _390 = _384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _388;
    out.m_57.y = _390;
    out.m_57.z = _392;
    float _394 = _266 * _366;
    float _396 = _264 * _364;
    float _398 = _262 * _362;
    bool _400 = !_334;
    float _418;
    if (!_400)
    {
        float _402 = in.m_53.x;
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _406 = _402 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _418 = _416;
        _420 = true;
    }
    else
    {
        _418 = _158;
    }
    _420 = false;
    float _422 = _418;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _426 = _422 + _424;
    bool _428 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _430 = isnan(_422);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _440;
    bool _444 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _446 = isnan(_422);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -_438;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _460;
    float _464 = 1.0 / _442;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _468 = _454 * _458;
    float _470 = -_454;
    float _472 = _470 + 1.0;
    float _474 = _426 * _464;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _476;
    float _480 = fma(_462, _474, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _482;
    float _486 = fma(_478, _474, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _488 = _480 * _468;
    float _490 = fma(_484, _474, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _492 = _486 * _468;
    float _494 = _490 * _468;
    float _496 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[123].x, _488);
    float _498 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[123].y, _494);
    float _500 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[123].z, _492);
    float _502 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[124].x, _496);
    float _504 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[124].y, _498);
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[124].z, _500);
    float _508 = _502 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _510 = _504 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _512 = _506 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _514 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _514;
    out.m_59.y = _516;
    out.m_59.z = _518;
    bool _520 = !_466;
    float _522 = _508;
    float _540;
    if (!_520)
    {
        float _524 = in.m_53.x;
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _528 = _524 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _522 = _532;
        _540 = _538;
        _542 = true;
    }
    else
    {
        _540 = _158;
    }
    _542 = false;
    float _544 = _522;
    float _546 = _540;
    float _548 = in.m_61.x;
    float _550 = in.m_61.y;
    float _552 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _554 = _396 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _556 = in.m_53.x;
    float _558 = in.m_53.y;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _562 = _560 != 0;
    float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _566 = in.m_53.z;
    float _568 = in.m_53.w;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _576 = _574 != 0;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _582 = _580 != 0;
    float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _588 = _586 != 0;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _592 = _544;
    if (!_562)
    {
        float _594 = in.m_53.z;
        _590 = _594;
    }
    float _596 = _590;
    float _598 = _564 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _600 = _552 * _548;
    float _602 = _554 * _550;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _606 = -_600;
    float _608 = _606 + 1.0;
    bool _610 = _556 > 0.5;
    float _612 = -_602;
    float _614 = _612 + 1.0;
    float _616 = _602;
    float _618 = _600;
    if (!_562)
    {
        _592 = _558;
    }
    float _620 = _592;
    float _622 = _584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _624 = _568 > 0.5;
    int _626 = _610 ? as_type<int>(_608) : as_type<int>(_600);
    bool _628 = _558 > 0.5;
    float _630 = _620;
    float _632 = _596;
    if (_562)
    {
        _630 = _556;
    }
    float _634 = _630;
    int _636 = _628 ? as_type<int>(_614) : as_type<int>(_602);
    bool _638 = !_572;
    float _640 = _638 ? _600 : as_type<float>(_626);
    float _642 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[83].z, _578);
    float _644 = _634 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _646 = _566 > 0.5;
    bool _648 = !_576;
    float _650 = _648 ? _602 : as_type<float>(_636);
    float _652 = _644;
    if (_588)
    {
        float _654 = _624 ? _614 : _602;
        _616 = _654;
    }
    float _656 = _616;
    float _658 = -_604;
    float _660 = fma(_644, 2.0, _658);
    if (_582)
    {
        float _662 = _646 ? _608 : _600;
        _618 = _662;
    }
    float _664 = _618;
    if (!_562)
    {
        _652 = _596;
    }
    float _666 = _652;
    float _668 = -_128;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[81].x, _660);
    float _672 = fma(_598, _664, -0.5);
    float _674 = fma(_622, _656, -0.5);
    float _676 = _666;
    if (_562)
    {
        _676 = _558;
    }
    float _678 = _676;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_562)
    {
        _632 = _558;
    }
    float _682 = _632;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _688 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].w, _680);
    float _690 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _642);
    float _692 = fma(_686, -2.0, _684);
    float _694 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _688);
    float _696 = fma(_690, _672, _670);
    float _698 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _692);
    float _700 = _696 + 0.5;
    float _702 = -_698;
    float _704 = fma(_694, _674, _702);
    float _706 = _704 + 0.5;
    float2 _3631 = float2(_700, _706);
    float _708 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_3631, float2(0.0), isnan(_3631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_3631, float2(0.0), isnan(_3631)), level(0.0)).w;
    float _710 = in.m_63.x;
    float _712 = in.m_63.y;
    float _714 = in.m_63.z;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _718 = _546 + _716;
    float _720 = in.m_61.z;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _724 = _546 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _728 = _546 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _732 = _546 + _730;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _744 = _742 != 0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _750;
    float _754 = 1.0 / _748;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _762 = _546 + _760;
    float _764 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _768 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00999999977648258209228515625, _710);
    float _770 = -_548;
    float _772 = _770 + _710;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _778 = 1.0 / _752;
    float _780 = -_720;
    float _782 = _780 + _714;
    float _784 = -_712;
    float _786 = fma(_784, 0.800000011920928955078125, 1.0);
    float _788 = -_550;
    float _790 = _788 + _712;
    float _792 = fma(_712, 2.0, -1.0);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _794;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _800 = 1.0 / _776;
    float _802 = _556 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _804 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _806 = _768 + _556;
    float _808 = -_798;
    float _810 = fma(_802, 2.0, _808);
    float _812 = fma(_804, -2.0, _766);
    float _814 = 1.0 / _758;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _822 = _546 + _820;
    float _824 = _718 * _778;
    float _826 = _806 * 12.56637096405029296875;
    float _828 = -_128;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _810);
    float _832 = 1.0 / _818;
    float _834 = _728 * _800;
    float _836 = _826 * 0.15915493667125701904296875;
    float _838 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _840 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _842 = isnan(_546);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = 1.0 / _796;
    float _854 = _822 * _814;
    float _856 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _838);
    float _858 = _556 * 2.0;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _862 = _546 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _864;
    float _868 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _856);
    float _870 = _558 * 2.0;
    float _872 = _724 * _832;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _874;
    float _878 = _566 * 2.0;
    float _880 = _558 + _566;
    float _882 = floor(_858);
    float _884 = _862 * _754;
    bool _886 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _888 = isnan(_546);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _880 + (-1.0);
    float _900 = _762 * _852;
    float _902 = 1.0 / _876;
    float _904 = -_896;
    float _906 = _904 + 1.0;
    bool _908 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _910 = isnan(_546);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _928 = floor(_878);
    bool _930 = _882 >= 0.0;
    bool _932 = isnan(_882);
    bool _934 = _930 || _932;
    bool _936 = isnan(0.0);
    bool _938 = _934 || _936;
    bool _940 = _882 > 0.0;
    float _942 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _944 = _556 + _566;
    float _946 = _558 + _556;
    float _948 = _732 * _902;
    float _950 = floor(_870);
    float _952 = _944 + (-1.0);
    float _954 = _946 + (-1.0);
    int _956 = _938 ? 0 : 1;
    float _958 = _566 + (-0.5);
    float _960 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _962 = _928 > 0.0;
    float _964 = rint(_556);
    bool _966 = _928 >= 0.0;
    bool _968 = isnan(_928);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    float _976 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _978;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    int _986 = _974 ? 0 : 1;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _988;
    bool _992 = _950 > 0.0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _994;
    bool _998 = _950 >= 0.0;
    bool _1000 = isnan(_950);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(0.0);
    bool _1006 = _1002 || _1004;
    float _1008 = fma(_990, _824, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1010 = fma(_996, _824, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1012 = fma(_980, _824, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1022 = fma(_964, 2.0, -1.0);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1024;
    float _1028 = fma(_1016, _854, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1034 = fma(_1020, _854, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1036;
    float _1040 = fma(_984, _854, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1046 = fma(_1026, _884, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1048 = fma(_1038, _884, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1050 = fma(_1032, _834, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1052 = fma(_1044, _834, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _1054 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1056 = isnan(_546);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1074;
    float _1078 = -_1064;
    float _1080 = _1078 + 1.0;
    float _1082 = fma(_1068, _884, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1084 = fma(_1072, _834, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1086;
    float _1090 = _850 * _1080;
    float _1092 = -_850;
    float _1094 = _1092 + 1.0;
    float _1096 = fma(_866, _900, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _1098 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1100 = isnan(_546);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = fma(_1088, _900, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1112 = _896 * _1094;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1122 = -_1108;
    float _1124 = _1122 + 1.0;
    float _1126 = _1108 * _906;
    bool _1128 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1130 = isnan(_546);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = fma(_922, _900, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1142 = fma(_1116, _872, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1144 = fma(_1120, _872, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1146 = _918 * _1124;
    float _1148 = fma(_926, _872, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1150 = -_918;
    float _1152 = _1150 + 1.0;
    bool _1154 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1156 = isnan(_546);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = rsqrt(_868);
    bool _1168 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1170 = isnan(_546);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1176 = _1172 || _1174;
    float _1178 = float(_1176);
    float _1180 = -_1138;
    float _1182 = _1180 + 1.0;
    float _1184 = _1138 * _1152;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1186;
    float _1190 = _1178 * _1182;
    float _1192 = -_1178;
    float _1194 = _1192 + 1.0;
    float _1196 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1198 = log2(_1196);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1200;
    float _1204 = _1164 * _1194;
    float _1206 = -_1164;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1188, _948, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1212 = fma(_1202, _948, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1214 = _1008 * _1204;
    float _1216 = _836 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    int _1220 = _1006 ? 0 : 1;
    float _1222 = fma(_1076, _948, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1214);
    int _1226 = ~_956;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1230;
    if (!_940)
    {
        int _1234 = ~_956;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    float _1240 = _1010 * _1204;
    float _1242 = _1012 * _1204;
    int _1244 = ~_986;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1240);
    float _1252 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1242);
    int _1254 = ~_1220;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    float _1260 = fma(_1218, -0.125, -0.125);
    int _1262 = _1258;
    int _1264 = _1248;
    if (!_992)
    {
        int _1266 = ~_1220;
        int _1268 = _1266 + 1;
        _1262 = _1268;
    }
    int _1270 = _1262;
    float _1272 = _1198 * _128;
    bool _1274 = !_736;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = fma(_1028, _1190, _1250);
    if (!_962)
    {
        int _1280 = ~_986;
        int _1282 = _1280 + 1;
        _1264 = _1282;
    }
    int _1284 = _1264;
    float _1286 = fma(_1034, _1190, _1224);
    int _1288 = abs(_1276);
    float _1290 = exp2(_1272);
    float _1292 = in.m_65.x;
    float _1294 = in.m_65.y;
    float _1296 = in.m_65.z;
    float _1298 = fma(_1040, _1190, _1252);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1302 = 1.0 + _1300;
    float _1304 = float(_1288);
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1308 = float(_1284);
    float _1310 = 1.0 / _1302;
    bool _1312 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1314 = isnan(1.0);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1320 = _1316 || _1318;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1324 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1306);
    float _1326 = _1304 * _1308;
    bool _1328 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = -_1290;
    float _1340 = _1338 + 1.0;
    float _1342 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1322);
    bool _1344 = !_740;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1324);
    float _1350 = _556 + (-0.5);
    float _1352 = _1336 ? _1340 : 0.0;
    float _1354 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1342);
    float _1356 = _1326 * (-2.0);
    int _1358 = abs(_1346);
    float _1360 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _812);
    if (_1320)
    {
        float _1362 = _1352 * _1310;
        _146 = _1362;
    }
    float _1364 = _146;
    float _1366 = fma(_1356, _1292, _1292);
    float _1368 = fma(_976, _1356, _976);
    bool _1370 = !_744;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1366);
    float _1376 = float(_1358);
    float _1378 = fma(_1046, _1184, _1286);
    float _1380 = float(_1238);
    float _1382 = fma(_1368, _1364, _1374);
    int _1384 = abs(_1372);
    float _1386 = fma(_1050, _1146, _1378);
    float _1388 = _558 + (-0.5);
    float _1390 = _1376 * _1380;
    float _1392 = _1382 * 0.15915493667125701904296875;
    float _1394 = float(_1384);
    float _1396 = fma(_1048, _1184, _1278);
    float _1398 = _1390 * (-2.0);
    float _1400 = float(_1270);
    float _1402 = fma(_1110, _1126, _1386);
    float _1404 = fma(_1052, _1146, _1396);
    float _1406 = fma(_1398, _1294, _1294);
    float _1408 = fma(_1082, _1184, _1298);
    float _1410 = _1394 * _1400;
    float _1412 = fma(_1142, _1112, _1402);
    float _1414 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1406);
    float _1416 = fma(_1096, _1126, _1404);
    float _1418 = _1410 * (-2.0);
    float _1420 = fma(_1210, _1090, _1412);
    float _1422 = fma(_1084, _1146, _1408);
    float _1424 = fma(_1144, _1112, _1416);
    float _1426 = fma(_1418, _1296, _1296);
    float _1428 = fma(_960, _1418, _960);
    float _1430 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1420);
    float _1432 = fma(_1212, _1090, _1424);
    float _1434 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1426);
    float _1436 = fma(_942, _1398, _942);
    float _1438 = fma(_1430, _790, _550);
    float _1440 = _720 * _720;
    float _1442 = fma(_1428, _1364, _1434);
    float _1444 = fma(_1140, _1126, _1422);
    float _1446 = fma(_1436, _1364, _1414);
    float _1448 = fma(_548, _548, _1440);
    float _1450 = _1442 * 0.15915493667125701904296875;
    float _1452 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1432);
    float _1454 = fma(_1148, _1112, _1444);
    float _1456 = _1446 * 0.15915493667125701904296875;
    float _1458 = _1392 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = -_1452;
    float _1464 = _1462 + 1.0;
    float _1466 = fma(_1222, _1090, _1454);
    float _1468 = fma(_1430, _772, _548);
    float _1470 = _792 * _1464;
    float _1472 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1466);
    float _1474 = fma(_1430, _782, _720);
    float _1476 = rsqrt(_1448);
    float _1478 = _1470 * _1022;
    float _1480 = _1472 * _786;
    float _1482 = _158 * _1260;
    float _1484 = _1480 * 18.0;
    float _1486 = _1456 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    float _1490 = -_1484;
    float _1492 = fma(_1490, _1166, _1438);
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[193].x, _1492);
    float _1496 = _1456 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    float _1500 = fma(_708, 0.20000000298023223876953125, -0.100000001490116119384765625);
    float _1502 = _1476 * _1500;
    float _1504 = _1450 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = _1460 * _1488;
    float _1510 = _1452 * _1502;
    float _1512 = _1510 * 0.5;
    float _1514 = fma(_548, _1512, _1468);
    float _1516 = fma(_720, _1512, _1474);
    float _1518 = _1392 * 6.283185482025146484375;
    float _1520 = cos(_1518);
    float _1522 = _1460 * _1498;
    float _1524 = _1450 * 6.283185482025146484375;
    float _1526 = sin(_1524);
    float _1528 = _1460 * _1506;
    float _1530 = _1498 * _1506;
    float _1532 = _1520 * _1498;
    float _1534 = _1478 * 0.15915493667125701904296875;
    float _1536 = _1520 * _1488;
    float _1538 = _1520 * _1506;
    float _1540 = _1488 * _1506;
    float _1542 = _1534 * 6.283185482025146484375;
    float _1544 = cos(_1542);
    float _1546 = fma(_1526, _1532, _1508);
    float _1548 = fma(_1526, _1508, _1532);
    float _1550 = -_1536;
    float _1552 = fma(_1526, _1522, _1550);
    float _1554 = in.m_46.x;
    float _1556 = in.m_46.y;
    float _1558 = in.m_46.z;
    float _1560 = -_1522;
    float _1562 = fma(_1526, _1536, _1560);
    float _1564 = _1534 * 6.283185482025146484375;
    float _1566 = sin(_1564);
    float _1568 = _1514 * _1544;
    float _1570 = _1514 * _1566;
    float _1572 = fma(_1516, _1566, _1568);
    float _1574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1494);
    float _1576 = -_1570;
    float _1578 = fma(_1516, _1544, _1576);
    float _1580 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1572);
    float _1582 = _554 * _1574;
    float _1584 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1586 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1578);
    float _1588 = _552 * _1580;
    float _1590 = -_1582;
    float _1592 = _1526 * _1590;
    float _1594 = _1528 * _1582;
    float _1596 = _764 * _1586;
    float _1598 = _1538 * _1582;
    float _1600 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1602 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1604 = fma(_1530, _1588, _1592);
    float _1606 = fma(_1546, _1588, _1598);
    float _1608 = fma(_1552, _1588, _1594);
    float _1610 = fma(_1554, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1602);
    float _1612 = fma(_1540, _1596, _1604);
    float _1614 = fma(_1562, _1596, _1606);
    float _1616 = fma(_1554, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1584);
    float _1618 = fma(_1554, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1600);
    float _1620 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1610);
    float _1622 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1624 = fma(_1548, _1596, _1608);
    float _1626 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1628 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1616);
    float _1630 = fma(_1612, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1622);
    float _1632 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1618);
    float _1634 = _1620 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1636 = fma(_1612, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1626);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1630);
    float _1640 = _1628 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1642 = _1632 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1644 = fma(_1624, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1636);
    float _1646 = _1634 + _1638;
    float _1648 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1650 = _1640 + _1644;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1654 = _1646 + _1652;
    float _1656 = fma(_1612, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1648);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1660 = _1650 + _1658;
    float _1662 = _1654 * _1654;
    float _1664 = fma(_1624, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1656);
    float _1666 = fma(_1660, _1660, _1662);
    float _1668 = _1642 + _1664;
    float _1670 = sqrt(_1666);
    bool _1672 = _1670 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1662;
    float _1676 = _1650;
    float _1678 = _1656;
    float _1680 = _1664;
    if (!_1672)
    {
        _1674 = _1650;
    }
    float _1682 = _1674;
    float _1684 = _1682;
    if (!_1672)
    {
        _1676 = _1646;
    }
    float _1686 = _1676;
    float _1688 = _1686;
    if (!_1672)
    {
        _1678 = _1668;
    }
    float _1690 = _1678;
    bool _1692 = !_1672;
    float _1694 = _1690;
    if (!_1692)
    {
        float _1696 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1700 = _1670 + _1698;
        float _1702 = rsqrt(_1666);
        float _1704 = _1700 * _1696;
        float _1706 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1708 = _1704 * 0.15915493667125701904296875;
        float _1710 = _1708 * 6.283185482025146484375;
        float _1712 = cos(_1710);
        float _1714 = _1708 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        float _1718 = _1712 + (-1.0);
        float _1720 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = fma(_1716, _1706, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1724 = fma(_1668, _1712, _1720);
        float _1726 = _1702 * _1722;
        float _1728 = fma(_1660, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1730 = fma(_1654, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1694 = _1724;
        _1684 = _1728;
        _1688 = _1730;
    }
    float _1732 = _1694;
    float _1734 = _1684;
    float _1736 = _1688;
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1740 = _1732 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1744 = _1734 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = _1736 + _1746;
    float _1750 = _1740 * _1740;
    float _1752 = fma(_1744, _1744, _1750);
    float _1754 = fma(_1748, _1748, _1752);
    float _1756 = rsqrt(_1754);
    float _1758 = sqrt(_1754);
    float _1760 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1762 = _1744 * _1760;
    float _1764 = _1748 * _1760;
    float _1766 = _1762 * _1762;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 + _1768;
    float _1772 = sqrt(_1770);
    bool _1774 = _1772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = _1772 + _1776;
    float _1780 = _1756;
    float _1782 = _1778;
    float _1784 = _1740;
    float _1786 = _1760;
    if (_1774)
    {
        float _1788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1780 = _1788;
    }
    float _1790 = _1780;
    float _1792 = _1790;
    if (_1774)
    {
        float _1794 = _1778 * _1790;
        _1782 = _1794;
    }
    float _1796 = _1782;
    if (_1774)
    {
        float _1798 = rsqrt(_1770);
        _1792 = _1798;
    }
    float _1800 = _1792;
    float _1802 = _1800;
    if (_1774)
    {
        float _1804 = _1796 * 0.15915493667125701904296875;
        _1680 = _1804;
    }
    float _1806 = _1680;
    float _1808 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1810 = _1748;
    float _1812 = _1806;
    if (_1774)
    {
        float _1814 = _1806 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        _1810 = _1816;
    }
    float _1818 = _1810;
    float _1820 = precise::max(0.0, _1808);
    float _1822 = _1668;
    float _1824 = _1820;
    if (_1774)
    {
        float _1826 = _1806 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        _1822 = _1828;
    }
    float _1830 = _1822;
    float _1832 = -_1760;
    float _1834 = -_1820;
    float _1836 = fma(_1740, _1832, _1834);
    if (_1774)
    {
        float _1838 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1838;
    }
    float _1840 = _1784;
    float _1842 = _1818;
    float _1844 = _1840;
    if (_1774)
    {
        float _1846 = fma(_1818, _1840, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1842 = _1846;
    }
    float _1848 = _1842;
    float _1850 = _1848;
    if (!_1774)
    {
        _1844 = _1766;
    }
    float _1852 = _1844;
    float _1854 = _1852;
    if (_1774)
    {
        float _1856 = _1800 * _1848;
        _1786 = _1856;
    }
    float _1858 = _1786;
    if (!_1774)
    {
        _1802 = _1762;
    }
    float _1860 = _1802;
    float _1862 = _1860;
    float _1864 = _1830;
    if (_1774)
    {
        float _1866 = _1830 + (-1.0);
        _1824 = _1866;
    }
    float _1868 = _1824;
    float _1870 = _1868;
    if (_1774)
    {
        float _1872 = _1762 * _1858;
        _1862 = _1872;
    }
    float _1874 = _1862;
    if (!_1774)
    {
        _1850 = _1836;
    }
    float _1876 = _1850;
    float _1878 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1880 = _1876;
    if (_1774)
    {
        float _1882 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1812 = _1882;
    }
    float _1884 = _1812;
    if (!_1774)
    {
        _1870 = _1764;
    }
    float _1886 = _1870;
    float _1888 = _1886;
    if (_1774)
    {
        float _1890 = _1764 * _1858;
        _1888 = _1890;
    }
    float _1892 = _1888;
    if (_1774)
    {
        float _1894 = _1874 * _1874;
        _1854 = _1894;
    }
    float _1896 = _1854;
    if (_1774)
    {
        float _1898 = fma(_1836, _1830, _1884);
        _1880 = _1898;
    }
    float _1900 = _1880;
    if (!_1774)
    {
        _1864 = _1768;
    }
    float _1902 = _1864;
    float _1904 = _1902;
    if (_1774)
    {
        float _1906 = _1892 * _1892;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1900, _1900, _1896);
    float _1912 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1914 = _1910 + _1908;
    float _1916 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1878);
    float _1918 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1922 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1920);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = rsqrt(_1914);
    float _1928 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1916);
    float _1930 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1932 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1918);
    float _1934 = -_1924;
    float _1936 = _1934 + 1.0;
    float _1938 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1940 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1930);
    float _1942 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1932);
    float _1944 = abs(_1936);
    float _1946 = log2(_1944);
    float _1948 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1938);
    float _1950 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1940);
    float _1952 = _1942 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1954 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1956 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1948);
    float _1958 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1962 = _1926 * _1874;
    float _1964 = _1926 * _1900;
    float _1966 = _1926 * _1892;
    float _1968 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1960);
    float _1970 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1972 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1974 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1976 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1968);
    float _1978 = -_1970;
    float _1980 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1978);
    float _1982 = -_1972;
    float _1984 = fma(_1982, _1912, 1.0);
    float _1986 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1988 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1976);
    float _1990 = -_1966;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1980);
    float _1994 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1996 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1998 = log2(_1984);
    float _2000 = fma(_1992, -0.5, 0.5);
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1994);
    float _2004 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1996);
    float _2006 = fma(_1992, 0.5, 0.5);
    float _2008 = _1964 + 1.0;
    float _2010 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2002);
    float _2012 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2004);
    float _2014 = 1.0 / _1988;
    float _2016 = fma(_2006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2018 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2010);
    float _2020 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2012);
    float _2022 = fma(_2006, _2016, -0.212114393711090087890625);
    float _2024 = exp2(_1986);
    float _2026 = _1998 * 0.693147182464599609375;
    float _2028 = fma(_2006, _2022, 1.570728778839111328125);
    float _2030 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2032 = sqrt(_2000);
    float _2034 = _2018 * _2014;
    float _2036 = _2020 * _2014;
    float _2038 = fma(_2034, 0.5, 0.5);
    float _2040 = fma(_2036, -0.5, 0.5);
    float _2042 = -_1964;
    float _2044 = fma(_2024, _2008, _2042);
    float3 _5786 = float3(_2038, _2040, _2030);
    float _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5786, float3(0.0), isnan(_5786)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5786, float3(0.0), isnan(_5786)), level(0.0)).x;
    float _2048 = fma(_2044, 0.5, 0.5);
    float _2050 = _2032 * 0.636619746685028076171875;
    float _2052 = -_2028;
    float _2054 = fma(_2050, _2052, 1.0);
    float3 _5807 = float3(_2038, _2040, _2030);
    float4 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5807, float3(0.0), isnan(_5807)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5807, float3(0.0), isnan(_5807)), level(0.0)).xyzw;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = _2057.w;
    float2 _5823 = float2(_2054, _2048);
    float3 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5823, float2(0.0), isnan(_5823)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5823, float2(0.0), isnan(_5823)), level(0.0)).xyz;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = in.m_67.x;
    float _2079 = in.m_67.y;
    float _2081 = in.m_67.z;
    bool _2083 = _1494 != 0.0;
    bool _2085 = isnan(_1494);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan(0.0);
    bool _2091 = _2087 || _2089;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2095 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2097 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2099 = _1572 == 0.0;
    bool _2101 = !_2091;
    bool _2103 = _2099 && _2101;
    out.m_69.x = _1734;
    out.m_69.y = _1732;
    out.m_69.z = _1736;
    float _2105 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2097);
    bool _2107 = _1578 == 0.0;
    bool _2109 = _2107 && _2103;
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2113 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2105);
    float _2115 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2113);
    float _2117 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2119 = exp2(_2095);
    float _2121 = fma(_640, _2117, -0.5);
    float _2123 = _2079;
    float _2125 = _2077;
    float _2127 = _2081;
    float _2129 = _1988;
    float _2131 = _2115;
    float _2133 = _2020;
    if (!_2109)
    {
        float _2135 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2079);
        _2123 = _2135;
    }
    float _2137 = _2123;
    if (!_2109)
    {
        float _2139 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2077);
        _2125 = _2139;
    }
    float _2141 = _2125;
    float _2143 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2145 = fma(_1348, _2121, _830);
    float _2147 = _1538 * _2137;
    float _2149 = -_2137;
    float _2151 = _1526 * _2149;
    float _2153 = fma(_650, _2143, -0.5);
    if (!_2109)
    {
        float _2155 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2081);
        _2127 = _2155;
    }
    float _2157 = _2127;
    float _2159 = fma(_1546, _2141, _2147);
    float _2161 = _2145 + 0.5;
    float _2163 = -_1360;
    float _2165 = fma(_1354, _2153, _2163);
    float _2167 = fma(_1530, _2141, _2151);
    float _2169 = _1528 * _2137;
    float _2171 = fma(_1562, _2157, _2159);
    float _2173 = _2165 + 0.5;
    float _2175 = _2115 + _1988;
    float _2177 = -_2119;
    float _2179 = _2177 + 1.0;
    float _2181 = fma(_1540, _2157, _2167);
    float _2183 = fma(_1552, _2141, _2169);
    out.m_71.x = _2161;
    out.m_71.y = _2173;
    float _2185 = _2171 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2187 = _2175 * 0.5;
    float _2189 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2191 = fma(_1548, _2157, _2183);
    float _2193 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2185);
    bool _2195 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2197 = isnan(_1758);
    bool _2199 = _2195 || _2197;
    bool _2201 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2203 = _2199 || _2201;
    float _2205 = fma(_2191, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2193);
    float _2207 = _2171 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2209 = _2171 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_73.z = _2187;
    out.m_73.w = _1988;
    float _2211 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2207);
    float _2213 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2209);
    float _2215 = -_2189;
    float _2217 = _2215 + 1.0;
    float _2219 = fma(_2191, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2211);
    float _2221 = fma(_2191, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2213);
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _2115;
    out.gl_Position.w = _1988;
    float _2223 = _2193;
    float _2225 = _2018;
    float _2227 = _2217;
    if (!_2203)
    {
        _2223 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2229 = _2223;
    out.m_75.x = _2205;
    out.m_75.y = _2219;
    out.m_75.z = _2221;
    float _2231 = _2229;
    float _2233 = _2229;
    if (!_2203)
    {
        _2129 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2235 = _2129;
    float _2237 = _2235;
    float _2239 = _2235;
    if (!_2203)
    {
        _2131 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2241 = _2131;
    float _2243 = _2241;
    float _2245 = _2241;
    if (!_2203)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2247 = _2133;
    float _2249 = _2247;
    float _2251 = _2247;
    if (!_2203)
    {
        _2225 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2253 = _2225;
    float _2255 = _2189 * _2046;
    float _2257 = _2065 * _2255;
    float _2259 = _2065 * _2217;
    float _2261 = _2253;
    float _2263 = _2253;
    if (!_2203)
    {
        _2227 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2265 = _2227;
    float _2267 = _2075 * _2255;
    float _2269 = fma(_2071, _2257, _2059);
    float _2271 = fma(_2073, _2257, _2061);
    float _2273 = fma(_2065, _2267, _2063);
    out.m_77.x = _2269;
    out.m_77.y = _2271;
    out.m_77.z = _2273;
    out.m_77.w = _2259;
    bool _2275 = !_2203;
    float _2277 = _2265;
    float _2279 = _2265;
    if (!_2275)
    {
        bool _2281 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2283 = isnan(_1758);
        bool _2285 = _2281 || _2283;
        bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2289 = _2285 || _2287;
        if (!_2289)
        {
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = _1758 + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2297 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2295;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2303 = 1.0 / _2297;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2321 = _2293 * _2303;
            float _2323 = precise::clamp(_2321, 0.0, 1.0);
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2329 = fma(_2323, _2301, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2331 = fma(_2323, _2327, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2333 = fma(_2323, _2307, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2335 = fma(_2323, _2311, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2337 = fma(_2323, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2339 = fma(_2323, _2319, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2239 = _2333;
            _2263 = _2337;
            _2279 = _2329;
            _2251 = _2335;
            _2245 = _2331;
            _2233 = _2339;
            _2341 = true;
        }
        else
        {
            bool _2343 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2345 = isnan(_1758);
            bool _2347 = _2343 || _2345;
            bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2351 = _2347 || _2349;
            if (!_2351)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2353 = _2277;
            _2279 = _2353;
            if (!_2351)
            {
                _2237 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2355 = _2237;
            _2239 = _2355;
            if (!_2351)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2357 = _2243;
            _2245 = _2357;
            if (!_2351)
            {
                _2249 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2359 = _2249;
            _2251 = _2359;
            if (!_2351)
            {
                _2261 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2361 = _2261;
            _2263 = _2361;
            if (!_2351)
            {
                _2231 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2363 = _2231;
            bool _2365 = !_2351;
            _2233 = _2363;
            if (!_2365)
            {
                bool _2367 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2369 = isnan(_1758);
                bool _2371 = _2367 || _2369;
                bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2375 = _2371 || _2373;
                if (!_2375)
                {
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = _1758 + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2389 = 1.0 / _2383;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2407 = _2379 * _2389;
                    float _2409 = precise::clamp(_2407, 0.0, 1.0);
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2415 = fma(_2409, _2387, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2417 = fma(_2409, _2413, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2419 = fma(_2409, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2421 = fma(_2409, _2397, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2423 = fma(_2409, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2425 = fma(_2409, _2405, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2239 = _2419;
                    _2263 = _2423;
                    _2279 = _2415;
                    _2251 = _2421;
                    _2245 = _2417;
                    _2233 = _2425;
                    _2341 = true;
                }
                else
                {
                    _2239 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2263 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2251 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2233 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2341 = false;
    float _2427 = _2239;
    float _2429 = _2263;
    float _2431 = _2279;
    float _2433 = _2251;
    float _2435 = _2245;
    float _2437 = _2233;
    float _2439 = fma(_2219, -0.5, 0.5);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    float _2451 = -_2435;
    float _2453 = _2451 + _2437;
    bool _2455 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2457 = fma(_2441, _2445, _2427);
    float _2459 = fma(_2441, _2449, _2431);
    float _2461 = fma(_2441, _2453, _2435);
    float _2463 = _2457 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2465 = fma(_2459, 0.298911988735198974609375, _2463);
    float _2467 = fma(_2461, 0.114477999508380889892578125, _2465);
    out.m_79.x = 0.0;
    float _2469 = -_2467;
    float _2471 = _2459 + _2469;
    float _2473 = -_2467;
    float _2475 = _2457 + _2473;
    float _2477 = -_2467;
    float _2479 = _2461 + _2477;
    float _2481 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2483 = fma(_2471, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2485 = fma(_2475, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2487 = fma(_2479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    out.m_81.w = _2481;
    out.m_83.x = _2483;
    out.m_83.y = _2485;
    out.m_83.z = _2487;
    if (!_2455)
    {
        return out;
    }
    float _2489 = -_1732;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2493 = -_1734;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2497 = -_1736;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2501 = _2491 * _2491;
    float _2503 = fma(_2495, _2495, _2501);
    float _2505 = fma(_2499, _2499, _2503);
    float _2507 = sqrt(_2505);
    float _2509 = rsqrt(_2505);
    float _2511 = -_2507;
    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2515 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = _2495 * _2509;
    float _2521 = _2491 * _2509;
    float _2523 = abs(_2517);
    float _2525 = log2(_2523);
    float _2527 = _2499 * _2509;
    float _2529 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2531 = _2219 * _2521;
    float _2533 = -_2521;
    float _2535 = -_2529;
    float _2537 = fma(_2533, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2535);
    float _2539 = fma(_2205, _2519, _2531);
    float _2541 = -_2527;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2537);
    float _2545 = fma(_2221, _2527, _2539);
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2551 = _2543 + _2549;
    float _2553 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2555 = _2551 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = exp2(_2553);
    float _2561 = _2559 * _2557;
    float _2563 = _2547 * _2561;
    float _2565 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2567 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2569 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _2565;
    out.m_79.y = _2567;
    out.m_79.z = _2569;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2341 = false;
    bool _542 = false;
    bool _420 = false;
    bool _288 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_102);
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2627 = as_type<float>(_118);
        out.gl_Position.z = _2627;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_51.w;
    float _124 = float(_102);
    float _126 = -_122;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_122);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    bool _140 = _128 >= _124;
    bool _142 = !_138;
    bool _144 = _140 || _142;
    float _146 = _128;
    if (_144)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_144)
    {
        out.m_49.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _120 = as_type<int>(_150);
    }
    int _152 = _120;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2691 = as_type<float>(_152);
        out.gl_Position.z = _2691;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = 1.0 / _124;
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _158 = _128 * _154;
    bool _160 = !_156;
    float _178;
    if (!_160)
    {
        float _162 = in.m_53.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        _178 = _158;
    }
    _180 = false;
    float _182 = _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _186 = _182 + _184;
    bool _188 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _190 = isnan(_182);
    bool _192 = _188 || _190;
    bool _194 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _196 = _192 || _194;
    float _198 = float(_196);
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    bool _204 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _206 = isnan(_182);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _212 = _208 || _210;
    float _214 = float(_212);
    float _216 = -_198;
    float _218 = _216 + 1.0;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _220;
    float _224 = 1.0 / _202;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _228 = _214 * _218;
    float _230 = -_214;
    float _232 = _230 + 1.0;
    float _234 = _186 * _224;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _236;
    float _240 = fma(_222, _234, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = fma(_238, _234, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _248 = _240 * _228;
    float _250 = fma(_244, _234, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _252 = _246 * _228;
    float _254 = _250 * _228;
    float _256 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[143].x, _248);
    float _258 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[143].y, _254);
    float _260 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[143].z, _252);
    float _262 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[144].x, _256);
    float _264 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[144].y, _258);
    float _266 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[144].z, _260);
    bool _268 = !_226;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        _286 = _158;
    }
    _288 = false;
    float _290 = _286;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _294 = _290 + _292;
    bool _296 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _298 = isnan(_290);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _308;
    bool _312 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _314 = isnan(_290);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_306;
    float _326 = _324 + 1.0;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _328;
    float _332 = 1.0 / _310;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _336 = _322 * _326;
    float _338 = -_322;
    float _340 = _338 + 1.0;
    float _342 = _294 * _332;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _344;
    float _348 = fma(_330, _342, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _350;
    float _354 = fma(_346, _342, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _356 = _348 * _336;
    float _358 = fma(_352, _342, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _360 = _354 * _336;
    float _362 = in.m_55.x;
    float _364 = in.m_55.y;
    float _366 = in.m_55.z;
    float _368 = _358 * _336;
    float _370 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[107].x, _356);
    float _372 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[107].y, _368);
    float _374 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[107].z, _360);
    float _376 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[108].x, _370);
    float _378 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[108].y, _372);
    float _380 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[108].z, _374);
    float _382 = _376 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _384 = _378 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _386 = _380 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _388 = _382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _390 = _384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _388;
    out.m_57.y = _390;
    out.m_57.z = _392;
    float _394 = _266 * _366;
    float _396 = _264 * _364;
    float _398 = _262 * _362;
    bool _400 = !_334;
    float _418;
    if (!_400)
    {
        float _402 = in.m_53.x;
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _406 = _402 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _418 = _416;
        _420 = true;
    }
    else
    {
        _418 = _158;
    }
    _420 = false;
    float _422 = _418;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _426 = _422 + _424;
    bool _428 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _430 = isnan(_422);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _440;
    bool _444 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _446 = isnan(_422);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -_438;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _460;
    float _464 = 1.0 / _442;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _468 = _454 * _458;
    float _470 = -_454;
    float _472 = _470 + 1.0;
    float _474 = _426 * _464;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _476;
    float _480 = fma(_462, _474, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _482;
    float _486 = fma(_478, _474, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _488 = _480 * _468;
    float _490 = fma(_484, _474, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _492 = _486 * _468;
    float _494 = _490 * _468;
    float _496 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[123].x, _488);
    float _498 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[123].y, _494);
    float _500 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[123].z, _492);
    float _502 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[124].x, _496);
    float _504 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[124].y, _498);
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[124].z, _500);
    float _508 = _502 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _510 = _504 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _512 = _506 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _514 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _514;
    out.m_59.y = _516;
    out.m_59.z = _518;
    bool _520 = !_466;
    float _522 = _508;
    float _540;
    if (!_520)
    {
        float _524 = in.m_53.x;
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _528 = _524 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _522 = _532;
        _540 = _538;
        _542 = true;
    }
    else
    {
        _540 = _158;
    }
    _542 = false;
    float _544 = _522;
    float _546 = _540;
    float _548 = in.m_61.x;
    float _550 = in.m_61.y;
    float _552 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _554 = _396 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _556 = in.m_53.x;
    float _558 = in.m_53.y;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _562 = _560 != 0;
    float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _566 = in.m_53.z;
    float _568 = in.m_53.w;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _576 = _574 != 0;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _582 = _580 != 0;
    float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _588 = _586 != 0;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _592 = _544;
    if (!_562)
    {
        float _594 = in.m_53.z;
        _590 = _594;
    }
    float _596 = _590;
    float _598 = _564 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _600 = _552 * _548;
    float _602 = _554 * _550;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _606 = -_600;
    float _608 = _606 + 1.0;
    bool _610 = _556 > 0.5;
    float _612 = -_602;
    float _614 = _612 + 1.0;
    float _616 = _602;
    float _618 = _600;
    if (!_562)
    {
        _592 = _558;
    }
    float _620 = _592;
    float _622 = _584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _624 = _568 > 0.5;
    int _626 = _610 ? as_type<int>(_608) : as_type<int>(_600);
    bool _628 = _558 > 0.5;
    float _630 = _620;
    float _632 = _596;
    if (_562)
    {
        _630 = _556;
    }
    float _634 = _630;
    int _636 = _628 ? as_type<int>(_614) : as_type<int>(_602);
    bool _638 = !_572;
    float _640 = _638 ? _600 : as_type<float>(_626);
    float _642 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[83].z, _578);
    float _644 = _634 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _646 = _566 > 0.5;
    bool _648 = !_576;
    float _650 = _648 ? _602 : as_type<float>(_636);
    float _652 = _644;
    if (_588)
    {
        float _654 = _624 ? _614 : _602;
        _616 = _654;
    }
    float _656 = _616;
    float _658 = -_604;
    float _660 = fma(_644, 2.0, _658);
    if (_582)
    {
        float _662 = _646 ? _608 : _600;
        _618 = _662;
    }
    float _664 = _618;
    if (!_562)
    {
        _652 = _596;
    }
    float _666 = _652;
    float _668 = -_128;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[81].x, _660);
    float _672 = fma(_598, _664, -0.5);
    float _674 = fma(_622, _656, -0.5);
    float _676 = _666;
    if (_562)
    {
        _676 = _558;
    }
    float _678 = _676;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_562)
    {
        _632 = _558;
    }
    float _682 = _632;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _688 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].w, _680);
    float _690 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _642);
    float _692 = fma(_686, -2.0, _684);
    float _694 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _688);
    float _696 = fma(_690, _672, _670);
    float _698 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _692);
    float _700 = _696 + 0.5;
    float _702 = -_698;
    float _704 = fma(_694, _674, _702);
    float _706 = _704 + 0.5;
    float2 _3631 = float2(_700, _706);
    float _708 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_3631, float2(0.0), isnan(_3631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_3631, float2(0.0), isnan(_3631)), level(0.0)).w;
    float _710 = in.m_63.x;
    float _712 = in.m_63.y;
    float _714 = in.m_63.z;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _718 = _546 + _716;
    float _720 = in.m_61.z;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _724 = _546 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _728 = _546 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _732 = _546 + _730;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _744 = _742 != 0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _750;
    float _754 = 1.0 / _748;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _762 = _546 + _760;
    float _764 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _768 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00999999977648258209228515625, _710);
    float _770 = -_548;
    float _772 = _770 + _710;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _778 = 1.0 / _752;
    float _780 = -_720;
    float _782 = _780 + _714;
    float _784 = -_712;
    float _786 = fma(_784, 0.800000011920928955078125, 1.0);
    float _788 = -_550;
    float _790 = _788 + _712;
    float _792 = fma(_712, 2.0, -1.0);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _794;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _800 = 1.0 / _776;
    float _802 = _556 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _804 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _806 = _768 + _556;
    float _808 = -_798;
    float _810 = fma(_802, 2.0, _808);
    float _812 = fma(_804, -2.0, _766);
    float _814 = 1.0 / _758;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _822 = _546 + _820;
    float _824 = _718 * _778;
    float _826 = _806 * 12.56637096405029296875;
    float _828 = -_128;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _810);
    float _832 = 1.0 / _818;
    float _834 = _728 * _800;
    float _836 = _826 * 0.15915493667125701904296875;
    float _838 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _840 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _842 = isnan(_546);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = 1.0 / _796;
    float _854 = _822 * _814;
    float _856 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _838);
    float _858 = _556 * 2.0;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _862 = _546 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _864;
    float _868 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _856);
    float _870 = _558 * 2.0;
    float _872 = _724 * _832;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _874;
    float _878 = _566 * 2.0;
    float _880 = _558 + _566;
    float _882 = floor(_858);
    float _884 = _862 * _754;
    bool _886 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _888 = isnan(_546);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _880 + (-1.0);
    float _900 = _762 * _852;
    float _902 = 1.0 / _876;
    float _904 = -_896;
    float _906 = _904 + 1.0;
    bool _908 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _910 = isnan(_546);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _928 = floor(_878);
    bool _930 = _882 >= 0.0;
    bool _932 = isnan(_882);
    bool _934 = _930 || _932;
    bool _936 = isnan(0.0);
    bool _938 = _934 || _936;
    bool _940 = _882 > 0.0;
    float _942 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _944 = _556 + _566;
    float _946 = _558 + _556;
    float _948 = _732 * _902;
    float _950 = floor(_870);
    float _952 = _944 + (-1.0);
    float _954 = _946 + (-1.0);
    int _956 = _938 ? 0 : 1;
    float _958 = _566 + (-0.5);
    float _960 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _962 = _928 > 0.0;
    float _964 = rint(_556);
    bool _966 = _928 >= 0.0;
    bool _968 = isnan(_928);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    float _976 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _978;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    int _986 = _974 ? 0 : 1;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _988;
    bool _992 = _950 > 0.0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _994;
    bool _998 = _950 >= 0.0;
    bool _1000 = isnan(_950);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(0.0);
    bool _1006 = _1002 || _1004;
    float _1008 = fma(_990, _824, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1010 = fma(_996, _824, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1012 = fma(_980, _824, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1022 = fma(_964, 2.0, -1.0);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1024;
    float _1028 = fma(_1016, _854, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1034 = fma(_1020, _854, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1036;
    float _1040 = fma(_984, _854, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1046 = fma(_1026, _884, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1048 = fma(_1038, _884, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1050 = fma(_1032, _834, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1052 = fma(_1044, _834, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _1054 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1056 = isnan(_546);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1074;
    float _1078 = -_1064;
    float _1080 = _1078 + 1.0;
    float _1082 = fma(_1068, _884, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1084 = fma(_1072, _834, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1086;
    float _1090 = _850 * _1080;
    float _1092 = -_850;
    float _1094 = _1092 + 1.0;
    float _1096 = fma(_866, _900, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    bool _1098 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1100 = isnan(_546);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = fma(_1088, _900, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1112 = _896 * _1094;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1122 = -_1108;
    float _1124 = _1122 + 1.0;
    float _1126 = _1108 * _906;
    bool _1128 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1130 = isnan(_546);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = fma(_922, _900, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1142 = fma(_1116, _872, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1144 = fma(_1120, _872, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1146 = _918 * _1124;
    float _1148 = fma(_926, _872, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1150 = -_918;
    float _1152 = _1150 + 1.0;
    bool _1154 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1156 = isnan(_546);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = rsqrt(_868);
    bool _1168 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1170 = isnan(_546);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1176 = _1172 || _1174;
    float _1178 = float(_1176);
    float _1180 = -_1138;
    float _1182 = _1180 + 1.0;
    float _1184 = _1138 * _1152;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1186;
    float _1190 = _1178 * _1182;
    float _1192 = -_1178;
    float _1194 = _1192 + 1.0;
    float _1196 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1198 = log2(_1196);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1200;
    float _1204 = _1164 * _1194;
    float _1206 = -_1164;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1188, _948, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1212 = fma(_1202, _948, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1214 = _1008 * _1204;
    float _1216 = _836 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    int _1220 = _1006 ? 0 : 1;
    float _1222 = fma(_1076, _948, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1214);
    int _1226 = ~_956;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1230;
    if (!_940)
    {
        int _1234 = ~_956;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    float _1240 = _1010 * _1204;
    float _1242 = _1012 * _1204;
    int _1244 = ~_986;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1240);
    float _1252 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1242);
    int _1254 = ~_1220;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    float _1260 = fma(_1218, -0.125, -0.125);
    int _1262 = _1258;
    int _1264 = _1248;
    if (!_992)
    {
        int _1266 = ~_1220;
        int _1268 = _1266 + 1;
        _1262 = _1268;
    }
    int _1270 = _1262;
    float _1272 = _1198 * _128;
    bool _1274 = !_736;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = fma(_1028, _1190, _1250);
    if (!_962)
    {
        int _1280 = ~_986;
        int _1282 = _1280 + 1;
        _1264 = _1282;
    }
    int _1284 = _1264;
    float _1286 = fma(_1034, _1190, _1224);
    int _1288 = abs(_1276);
    float _1290 = exp2(_1272);
    float _1292 = in.m_65.x;
    float _1294 = in.m_65.y;
    float _1296 = in.m_65.z;
    float _1298 = fma(_1040, _1190, _1252);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1302 = 1.0 + _1300;
    float _1304 = float(_1288);
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1308 = float(_1284);
    float _1310 = 1.0 / _1302;
    bool _1312 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1314 = isnan(1.0);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1320 = _1316 || _1318;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1324 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1306);
    float _1326 = _1304 * _1308;
    bool _1328 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = -_1290;
    float _1340 = _1338 + 1.0;
    float _1342 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1322);
    bool _1344 = !_740;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1324);
    float _1350 = _556 + (-0.5);
    float _1352 = _1336 ? _1340 : 0.0;
    float _1354 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1342);
    float _1356 = _1326 * (-2.0);
    int _1358 = abs(_1346);
    float _1360 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _812);
    if (_1320)
    {
        float _1362 = _1352 * _1310;
        _146 = _1362;
    }
    float _1364 = _146;
    float _1366 = fma(_1356, _1292, _1292);
    float _1368 = fma(_976, _1356, _976);
    bool _1370 = !_744;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1366);
    float _1376 = float(_1358);
    float _1378 = fma(_1046, _1184, _1286);
    float _1380 = float(_1238);
    float _1382 = fma(_1368, _1364, _1374);
    int _1384 = abs(_1372);
    float _1386 = fma(_1050, _1146, _1378);
    float _1388 = _558 + (-0.5);
    float _1390 = _1376 * _1380;
    float _1392 = _1382 * 0.15915493667125701904296875;
    float _1394 = float(_1384);
    float _1396 = fma(_1048, _1184, _1278);
    float _1398 = _1390 * (-2.0);
    float _1400 = float(_1270);
    float _1402 = fma(_1110, _1126, _1386);
    float _1404 = fma(_1052, _1146, _1396);
    float _1406 = fma(_1398, _1294, _1294);
    float _1408 = fma(_1082, _1184, _1298);
    float _1410 = _1394 * _1400;
    float _1412 = fma(_1142, _1112, _1402);
    float _1414 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1406);
    float _1416 = fma(_1096, _1126, _1404);
    float _1418 = _1410 * (-2.0);
    float _1420 = fma(_1210, _1090, _1412);
    float _1422 = fma(_1084, _1146, _1408);
    float _1424 = fma(_1144, _1112, _1416);
    float _1426 = fma(_1418, _1296, _1296);
    float _1428 = fma(_960, _1418, _960);
    float _1430 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1420);
    float _1432 = fma(_1212, _1090, _1424);
    float _1434 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1426);
    float _1436 = fma(_942, _1398, _942);
    float _1438 = fma(_1430, _790, _550);
    float _1440 = _720 * _720;
    float _1442 = fma(_1428, _1364, _1434);
    float _1444 = fma(_1140, _1126, _1422);
    float _1446 = fma(_1436, _1364, _1414);
    float _1448 = fma(_548, _548, _1440);
    float _1450 = _1442 * 0.15915493667125701904296875;
    float _1452 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1432);
    float _1454 = fma(_1148, _1112, _1444);
    float _1456 = _1446 * 0.15915493667125701904296875;
    float _1458 = _1392 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = -_1452;
    float _1464 = _1462 + 1.0;
    float _1466 = fma(_1222, _1090, _1454);
    float _1468 = fma(_1430, _772, _548);
    float _1470 = _792 * _1464;
    float _1472 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1466);
    float _1474 = fma(_1430, _782, _720);
    float _1476 = rsqrt(_1448);
    float _1478 = _1470 * _1022;
    float _1480 = _1472 * _786;
    float _1482 = _158 * _1260;
    float _1484 = _1480 * 18.0;
    float _1486 = _1456 * 6.283185482025146484375;
    float _1488 = sin(_1486);
    float _1490 = -_1484;
    float _1492 = fma(_1490, _1166, _1438);
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[193].x, _1492);
    float _1496 = _1456 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    float _1500 = fma(_708, 0.20000000298023223876953125, -0.100000001490116119384765625);
    float _1502 = _1476 * _1500;
    float _1504 = _1450 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    float _1508 = _1460 * _1488;
    float _1510 = _1452 * _1502;
    float _1512 = _1510 * 0.5;
    float _1514 = fma(_548, _1512, _1468);
    float _1516 = fma(_720, _1512, _1474);
    float _1518 = _1392 * 6.283185482025146484375;
    float _1520 = cos(_1518);
    float _1522 = _1460 * _1498;
    float _1524 = _1450 * 6.283185482025146484375;
    float _1526 = sin(_1524);
    float _1528 = _1460 * _1506;
    float _1530 = _1498 * _1506;
    float _1532 = _1520 * _1498;
    float _1534 = _1478 * 0.15915493667125701904296875;
    float _1536 = _1520 * _1488;
    float _1538 = _1520 * _1506;
    float _1540 = _1488 * _1506;
    float _1542 = _1534 * 6.283185482025146484375;
    float _1544 = cos(_1542);
    float _1546 = fma(_1526, _1532, _1508);
    float _1548 = fma(_1526, _1508, _1532);
    float _1550 = -_1536;
    float _1552 = fma(_1526, _1522, _1550);
    float _1554 = in.m_46.x;
    float _1556 = in.m_46.y;
    float _1558 = in.m_46.z;
    float _1560 = -_1522;
    float _1562 = fma(_1526, _1536, _1560);
    float _1564 = _1534 * 6.283185482025146484375;
    float _1566 = sin(_1564);
    float _1568 = _1514 * _1544;
    float _1570 = _1514 * _1566;
    float _1572 = fma(_1516, _1566, _1568);
    float _1574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1494);
    float _1576 = -_1570;
    float _1578 = fma(_1516, _1544, _1576);
    float _1580 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1572);
    float _1582 = _554 * _1574;
    float _1584 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1586 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1578);
    float _1588 = _552 * _1580;
    float _1590 = -_1582;
    float _1592 = _1526 * _1590;
    float _1594 = _1528 * _1582;
    float _1596 = _764 * _1586;
    float _1598 = _1538 * _1582;
    float _1600 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1602 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1604 = fma(_1530, _1588, _1592);
    float _1606 = fma(_1546, _1588, _1598);
    float _1608 = fma(_1552, _1588, _1594);
    float _1610 = fma(_1554, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1602);
    float _1612 = fma(_1540, _1596, _1604);
    float _1614 = fma(_1562, _1596, _1606);
    float _1616 = fma(_1554, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1584);
    float _1618 = fma(_1554, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1600);
    float _1620 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1610);
    float _1622 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1624 = fma(_1548, _1596, _1608);
    float _1626 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1628 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1616);
    float _1630 = fma(_1612, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1622);
    float _1632 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1618);
    float _1634 = _1620 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1636 = fma(_1612, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1626);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1630);
    float _1640 = _1628 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1642 = _1632 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1644 = fma(_1624, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1636);
    float _1646 = _1634 + _1638;
    float _1648 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1650 = _1640 + _1644;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1654 = _1646 + _1652;
    float _1656 = fma(_1612, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1648);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1660 = _1650 + _1658;
    float _1662 = _1654 * _1654;
    float _1664 = fma(_1624, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1656);
    float _1666 = fma(_1660, _1660, _1662);
    float _1668 = _1642 + _1664;
    float _1670 = sqrt(_1666);
    bool _1672 = _1670 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1662;
    float _1676 = _1650;
    float _1678 = _1656;
    float _1680 = _1664;
    if (!_1672)
    {
        _1674 = _1650;
    }
    float _1682 = _1674;
    float _1684 = _1682;
    if (!_1672)
    {
        _1676 = _1646;
    }
    float _1686 = _1676;
    float _1688 = _1686;
    if (!_1672)
    {
        _1678 = _1668;
    }
    float _1690 = _1678;
    bool _1692 = !_1672;
    float _1694 = _1690;
    if (!_1692)
    {
        float _1696 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1700 = _1670 + _1698;
        float _1702 = rsqrt(_1666);
        float _1704 = _1700 * _1696;
        float _1706 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1708 = _1704 * 0.15915493667125701904296875;
        float _1710 = _1708 * 6.283185482025146484375;
        float _1712 = cos(_1710);
        float _1714 = _1708 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        float _1718 = _1712 + (-1.0);
        float _1720 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = fma(_1716, _1706, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1724 = fma(_1668, _1712, _1720);
        float _1726 = _1702 * _1722;
        float _1728 = fma(_1660, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1730 = fma(_1654, _1726, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1694 = _1724;
        _1684 = _1728;
        _1688 = _1730;
    }
    float _1732 = _1694;
    float _1734 = _1684;
    float _1736 = _1688;
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1740 = _1732 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1744 = _1734 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = _1736 + _1746;
    float _1750 = _1740 * _1740;
    float _1752 = fma(_1744, _1744, _1750);
    float _1754 = fma(_1748, _1748, _1752);
    float _1756 = rsqrt(_1754);
    float _1758 = sqrt(_1754);
    float _1760 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1762 = _1744 * _1760;
    float _1764 = _1748 * _1760;
    float _1766 = _1762 * _1762;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 + _1768;
    float _1772 = sqrt(_1770);
    bool _1774 = _1772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = _1772 + _1776;
    float _1780 = _1756;
    float _1782 = _1778;
    float _1784 = _1740;
    float _1786 = _1760;
    if (_1774)
    {
        float _1788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1780 = _1788;
    }
    float _1790 = _1780;
    float _1792 = _1790;
    if (_1774)
    {
        float _1794 = _1778 * _1790;
        _1782 = _1794;
    }
    float _1796 = _1782;
    if (_1774)
    {
        float _1798 = rsqrt(_1770);
        _1792 = _1798;
    }
    float _1800 = _1792;
    float _1802 = _1800;
    if (_1774)
    {
        float _1804 = _1796 * 0.15915493667125701904296875;
        _1680 = _1804;
    }
    float _1806 = _1680;
    float _1808 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1810 = _1748;
    float _1812 = _1806;
    if (_1774)
    {
        float _1814 = _1806 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        _1810 = _1816;
    }
    float _1818 = _1810;
    float _1820 = precise::max(0.0, _1808);
    float _1822 = _1668;
    float _1824 = _1820;
    if (_1774)
    {
        float _1826 = _1806 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        _1822 = _1828;
    }
    float _1830 = _1822;
    float _1832 = -_1760;
    float _1834 = -_1820;
    float _1836 = fma(_1740, _1832, _1834);
    if (_1774)
    {
        float _1838 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1838;
    }
    float _1840 = _1784;
    float _1842 = _1818;
    float _1844 = _1840;
    if (_1774)
    {
        float _1846 = fma(_1818, _1840, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1842 = _1846;
    }
    float _1848 = _1842;
    float _1850 = _1848;
    if (!_1774)
    {
        _1844 = _1766;
    }
    float _1852 = _1844;
    float _1854 = _1852;
    if (_1774)
    {
        float _1856 = _1800 * _1848;
        _1786 = _1856;
    }
    float _1858 = _1786;
    if (!_1774)
    {
        _1802 = _1762;
    }
    float _1860 = _1802;
    float _1862 = _1860;
    float _1864 = _1830;
    if (_1774)
    {
        float _1866 = _1830 + (-1.0);
        _1824 = _1866;
    }
    float _1868 = _1824;
    float _1870 = _1868;
    if (_1774)
    {
        float _1872 = _1762 * _1858;
        _1862 = _1872;
    }
    float _1874 = _1862;
    if (!_1774)
    {
        _1850 = _1836;
    }
    float _1876 = _1850;
    float _1878 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1880 = _1876;
    if (_1774)
    {
        float _1882 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1812 = _1882;
    }
    float _1884 = _1812;
    if (!_1774)
    {
        _1870 = _1764;
    }
    float _1886 = _1870;
    float _1888 = _1886;
    if (_1774)
    {
        float _1890 = _1764 * _1858;
        _1888 = _1890;
    }
    float _1892 = _1888;
    if (_1774)
    {
        float _1894 = _1874 * _1874;
        _1854 = _1894;
    }
    float _1896 = _1854;
    if (_1774)
    {
        float _1898 = fma(_1836, _1830, _1884);
        _1880 = _1898;
    }
    float _1900 = _1880;
    if (!_1774)
    {
        _1864 = _1768;
    }
    float _1902 = _1864;
    float _1904 = _1902;
    if (_1774)
    {
        float _1906 = _1892 * _1892;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1900, _1900, _1896);
    float _1912 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1914 = _1910 + _1908;
    float _1916 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1878);
    float _1918 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1922 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1920);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = rsqrt(_1914);
    float _1928 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1916);
    float _1930 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1932 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1918);
    float _1934 = -_1924;
    float _1936 = _1934 + 1.0;
    float _1938 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1940 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1930);
    float _1942 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1932);
    float _1944 = abs(_1936);
    float _1946 = log2(_1944);
    float _1948 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1938);
    float _1950 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1940);
    float _1952 = _1942 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1954 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1956 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1948);
    float _1958 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1962 = _1926 * _1874;
    float _1964 = _1926 * _1900;
    float _1966 = _1926 * _1892;
    float _1968 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1960);
    float _1970 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1972 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1974 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1976 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1968);
    float _1978 = -_1970;
    float _1980 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1978);
    float _1982 = -_1972;
    float _1984 = fma(_1982, _1912, 1.0);
    float _1986 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1988 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1976);
    float _1990 = -_1966;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1980);
    float _1994 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1996 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1998 = log2(_1984);
    float _2000 = fma(_1992, -0.5, 0.5);
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1994);
    float _2004 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1996);
    float _2006 = fma(_1992, 0.5, 0.5);
    float _2008 = _1964 + 1.0;
    float _2010 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2002);
    float _2012 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2004);
    float _2014 = 1.0 / _1988;
    float _2016 = fma(_2006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2018 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2010);
    float _2020 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2012);
    float _2022 = fma(_2006, _2016, -0.212114393711090087890625);
    float _2024 = exp2(_1986);
    float _2026 = _1998 * 0.693147182464599609375;
    float _2028 = fma(_2006, _2022, 1.570728778839111328125);
    float _2030 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2032 = sqrt(_2000);
    float _2034 = _2018 * _2014;
    float _2036 = _2020 * _2014;
    float _2038 = fma(_2034, 0.5, 0.5);
    float _2040 = fma(_2036, -0.5, 0.5);
    float _2042 = -_1964;
    float _2044 = fma(_2024, _2008, _2042);
    float3 _5786 = float3(_2038, _2040, _2030);
    float _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5786, float3(0.0), isnan(_5786)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5786, float3(0.0), isnan(_5786)), level(0.0)).x;
    float _2048 = fma(_2044, 0.5, 0.5);
    float _2050 = _2032 * 0.636619746685028076171875;
    float _2052 = -_2028;
    float _2054 = fma(_2050, _2052, 1.0);
    float3 _5807 = float3(_2038, _2040, _2030);
    float4 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5807, float3(0.0), isnan(_5807)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5807, float3(0.0), isnan(_5807)), level(0.0)).xyzw;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = _2057.w;
    float2 _5823 = float2(_2054, _2048);
    float3 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5823, float2(0.0), isnan(_5823)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5823, float2(0.0), isnan(_5823)), level(0.0)).xyz;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = in.m_67.x;
    float _2079 = in.m_67.y;
    float _2081 = in.m_67.z;
    bool _2083 = _1494 != 0.0;
    bool _2085 = isnan(_1494);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan(0.0);
    bool _2091 = _2087 || _2089;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2095 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2097 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2099 = _1572 == 0.0;
    bool _2101 = !_2091;
    bool _2103 = _2099 && _2101;
    out.m_69.x = _1734;
    out.m_69.y = _1732;
    out.m_69.z = _1736;
    float _2105 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2097);
    bool _2107 = _1578 == 0.0;
    bool _2109 = _2107 && _2103;
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2113 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2105);
    float _2115 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2113);
    float _2117 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2119 = exp2(_2095);
    float _2121 = fma(_640, _2117, -0.5);
    float _2123 = _2079;
    float _2125 = _2077;
    float _2127 = _2081;
    float _2129 = _1988;
    float _2131 = _2115;
    float _2133 = _2020;
    if (!_2109)
    {
        float _2135 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2079);
        _2123 = _2135;
    }
    float _2137 = _2123;
    if (!_2109)
    {
        float _2139 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2077);
        _2125 = _2139;
    }
    float _2141 = _2125;
    float _2143 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2145 = fma(_1348, _2121, _830);
    float _2147 = _1538 * _2137;
    float _2149 = -_2137;
    float _2151 = _1526 * _2149;
    float _2153 = fma(_650, _2143, -0.5);
    if (!_2109)
    {
        float _2155 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2081);
        _2127 = _2155;
    }
    float _2157 = _2127;
    float _2159 = fma(_1546, _2141, _2147);
    float _2161 = _2145 + 0.5;
    float _2163 = -_1360;
    float _2165 = fma(_1354, _2153, _2163);
    float _2167 = fma(_1530, _2141, _2151);
    float _2169 = _1528 * _2137;
    float _2171 = fma(_1562, _2157, _2159);
    float _2173 = _2165 + 0.5;
    float _2175 = _2115 + _1988;
    float _2177 = -_2119;
    float _2179 = _2177 + 1.0;
    float _2181 = fma(_1540, _2157, _2167);
    float _2183 = fma(_1552, _2141, _2169);
    out.m_71.x = _2161;
    out.m_71.y = _2173;
    float _2185 = _2171 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2187 = _2175 * 0.5;
    float _2189 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2191 = fma(_1548, _2157, _2183);
    float _2193 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2185);
    bool _2195 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2197 = isnan(_1758);
    bool _2199 = _2195 || _2197;
    bool _2201 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2203 = _2199 || _2201;
    float _2205 = fma(_2191, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2193);
    float _2207 = _2171 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2209 = _2171 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_73.z = _2187;
    out.m_73.w = _1988;
    float _2211 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2207);
    float _2213 = fma(_2181, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2209);
    float _2215 = -_2189;
    float _2217 = _2215 + 1.0;
    float _2219 = fma(_2191, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2211);
    float _2221 = fma(_2191, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2213);
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _2115;
    out.gl_Position.w = _1988;
    float _2223 = _2193;
    float _2225 = _2018;
    float _2227 = _2217;
    if (!_2203)
    {
        _2223 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2229 = _2223;
    out.m_75.x = _2205;
    out.m_75.y = _2219;
    out.m_75.z = _2221;
    float _2231 = _2229;
    float _2233 = _2229;
    if (!_2203)
    {
        _2129 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2235 = _2129;
    float _2237 = _2235;
    float _2239 = _2235;
    if (!_2203)
    {
        _2131 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2241 = _2131;
    float _2243 = _2241;
    float _2245 = _2241;
    if (!_2203)
    {
        _2133 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2247 = _2133;
    float _2249 = _2247;
    float _2251 = _2247;
    if (!_2203)
    {
        _2225 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2253 = _2225;
    float _2255 = _2189 * _2046;
    float _2257 = _2065 * _2255;
    float _2259 = _2065 * _2217;
    float _2261 = _2253;
    float _2263 = _2253;
    if (!_2203)
    {
        _2227 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2265 = _2227;
    float _2267 = _2075 * _2255;
    float _2269 = fma(_2071, _2257, _2059);
    float _2271 = fma(_2073, _2257, _2061);
    float _2273 = fma(_2065, _2267, _2063);
    out.m_77.x = _2269;
    out.m_77.y = _2271;
    out.m_77.z = _2273;
    out.m_77.w = _2259;
    bool _2275 = !_2203;
    float _2277 = _2265;
    float _2279 = _2265;
    if (!_2275)
    {
        bool _2281 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2283 = isnan(_1758);
        bool _2285 = _2281 || _2283;
        bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2289 = _2285 || _2287;
        if (!_2289)
        {
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = _1758 + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2297 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2295;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2303 = 1.0 / _2297;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2321 = _2293 * _2303;
            float _2323 = precise::clamp(_2321, 0.0, 1.0);
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2329 = fma(_2323, _2301, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2331 = fma(_2323, _2327, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2333 = fma(_2323, _2307, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2335 = fma(_2323, _2311, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2337 = fma(_2323, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2339 = fma(_2323, _2319, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2239 = _2333;
            _2263 = _2337;
            _2279 = _2329;
            _2251 = _2335;
            _2245 = _2331;
            _2233 = _2339;
            _2341 = true;
        }
        else
        {
            bool _2343 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2345 = isnan(_1758);
            bool _2347 = _2343 || _2345;
            bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2351 = _2347 || _2349;
            if (!_2351)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2353 = _2277;
            _2279 = _2353;
            if (!_2351)
            {
                _2237 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2355 = _2237;
            _2239 = _2355;
            if (!_2351)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2357 = _2243;
            _2245 = _2357;
            if (!_2351)
            {
                _2249 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2359 = _2249;
            _2251 = _2359;
            if (!_2351)
            {
                _2261 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2361 = _2261;
            _2263 = _2361;
            if (!_2351)
            {
                _2231 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2363 = _2231;
            bool _2365 = !_2351;
            _2233 = _2363;
            if (!_2365)
            {
                bool _2367 = _1758 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2369 = isnan(_1758);
                bool _2371 = _2367 || _2369;
                bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2375 = _2371 || _2373;
                if (!_2375)
                {
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = _1758 + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2389 = 1.0 / _2383;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2407 = _2379 * _2389;
                    float _2409 = precise::clamp(_2407, 0.0, 1.0);
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2415 = fma(_2409, _2387, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2417 = fma(_2409, _2413, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2419 = fma(_2409, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2421 = fma(_2409, _2397, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2423 = fma(_2409, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2425 = fma(_2409, _2405, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2239 = _2419;
                    _2263 = _2423;
                    _2279 = _2415;
                    _2251 = _2421;
                    _2245 = _2417;
                    _2233 = _2425;
                    _2341 = true;
                }
                else
                {
                    _2239 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2263 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2251 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2233 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2341 = false;
    float _2427 = _2239;
    float _2429 = _2263;
    float _2431 = _2279;
    float _2433 = _2251;
    float _2435 = _2245;
    float _2437 = _2233;
    float _2439 = fma(_2219, -0.5, 0.5);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    float _2451 = -_2435;
    float _2453 = _2451 + _2437;
    bool _2455 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2457 = fma(_2441, _2445, _2427);
    float _2459 = fma(_2441, _2449, _2431);
    float _2461 = fma(_2441, _2453, _2435);
    float _2463 = _2457 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2465 = fma(_2459, 0.298911988735198974609375, _2463);
    float _2467 = fma(_2461, 0.114477999508380889892578125, _2465);
    out.m_79.x = 0.0;
    float _2469 = -_2467;
    float _2471 = _2459 + _2469;
    float _2473 = -_2467;
    float _2475 = _2457 + _2473;
    float _2477 = -_2467;
    float _2479 = _2461 + _2477;
    float _2481 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2483 = fma(_2471, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2485 = fma(_2475, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    float _2487 = fma(_2479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2467);
    out.m_81.w = _2481;
    out.m_83.x = _2483;
    out.m_83.y = _2485;
    out.m_83.z = _2487;
    if (!_2455)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2489 = -_1732;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2493 = -_1734;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2497 = -_1736;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2501 = _2491 * _2491;
    float _2503 = fma(_2495, _2495, _2501);
    float _2505 = fma(_2499, _2499, _2503);
    float _2507 = sqrt(_2505);
    float _2509 = rsqrt(_2505);
    float _2511 = -_2507;
    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2515 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = _2495 * _2509;
    float _2521 = _2491 * _2509;
    float _2523 = abs(_2517);
    float _2525 = log2(_2523);
    float _2527 = _2499 * _2509;
    float _2529 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2531 = _2219 * _2521;
    float _2533 = -_2521;
    float _2535 = -_2529;
    float _2537 = fma(_2533, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2535);
    float _2539 = fma(_2205, _2519, _2531);
    float _2541 = -_2527;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2537);
    float _2545 = fma(_2221, _2527, _2539);
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2551 = _2543 + _2549;
    float _2553 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2555 = _2551 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = exp2(_2553);
    float _2561 = _2559 * _2557;
    float _2563 = _2547 * _2561;
    float _2565 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2567 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2569 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _2565;
    out.m_79.y = _2567;
    out.m_79.z = _2569;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

