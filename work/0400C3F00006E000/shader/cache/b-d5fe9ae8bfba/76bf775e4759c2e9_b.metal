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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_55 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2062 = false;
    bool _720 = false;
    bool _488 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2816 = as_type<float>(_120);
        out.gl_Position.z = _2816;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2886 = as_type<float>(_158);
        out.gl_Position.z = _2886;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    float _214 = float(_192);
    int _216 = abs(_212);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _222 = _208 < 0.5;
    float _224 = float(_222);
    float _226 = fma(_196, 0.5, 0.5);
    float _228 = abs(_220);
    float _230 = _214 * _228;
    float _232 = float(_204);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_216);
    float _244 = fma(_232, _240, _230);
    float _246 = abs(_236);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    float _266;
    if (!_250)
    {
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_104);
        float _272 = 1.0 / _270;
        float _274 = _138 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _276 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = 1.0 / _292;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _306 = 1.0 / _300;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    float _312 = 1.0 / _296;
    float _314 = _280 * _302;
    bool _316 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_276);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = fma(_310, _314, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_330, _314, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = _284 * _306;
    bool _338 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_276);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_326;
    float _352 = _350 + 1.0;
    float _354 = _348 * _352;
    bool _356 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_276);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _288 * _312;
    bool _370 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_276);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = -_348;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = fma(_384, _314, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = -_380;
    float _398 = _396 + 1.0;
    float _400 = _380 * _388;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _366 * _398;
    float _412 = -_366;
    float _414 = _412 + 1.0;
    float _416 = fma(_392, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_404, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _332 * _410;
    float _422 = _334 * _410;
    float _424 = _394 * _410;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _432 = fma(_408, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_416, _400, _426);
    float _448 = fma(_436, _336, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _336, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_444, _336, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_418, _400, _428);
    float _456 = fma(_432, _400, _430);
    float _458 = fma(_448, _354, _446);
    float _460 = fma(_450, _354, _454);
    float _462 = fma(_452, _354, _456);
    float _464 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].x, _458);
    float _466 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    bool _470 = !_304;
    float _486;
    if (!_470)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _474 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_104);
        float _492 = 1.0 / _490;
        float _494 = _138 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _496 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _510 = _496 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _520;
    bool _524 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _526 = isnan(_496);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _514;
    bool _538 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _540 = 1.0 / _518;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _542;
    float _546 = 1.0 / _522;
    float _548 = _468 * _502;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _552 = _496 + _550;
    float _554 = _466 * _500;
    float _556 = _464 * _498;
    float _558 = _552 * _536;
    float _560 = _506 * _540;
    bool _562 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _564 = isnan(_496);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _574;
    bool _578 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _580 = isnan(_496);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _590;
    float _594 = fma(_544, _558, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _596 = fma(_576, _558, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = _510 * _546;
    float _600 = -_534;
    float _602 = _600 + 1.0;
    float _604 = -_588;
    float _606 = _604 + 1.0;
    float _608 = fma(_592, _558, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _610 = _572 * _602;
    float _612 = -_572;
    float _614 = _612 + 1.0;
    bool _616 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _618 = isnan(_496);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _632 = _588 * _614;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _638 = _626 * _606;
    float _640 = -_626;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _648 = _608 * _638;
    float _650 = _594 * _638;
    float _652 = _596 * _638;
    float _654 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[107].y, _648);
    float _656 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[107].x, _650);
    float _658 = fma(_630, _560, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _660;
    float _664 = fma(_636, _560, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _666 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[107].z, _652);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _668;
    float _672 = fma(_646, _560, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _674;
    float _678 = fma(_658, _632, _656);
    float _680 = fma(_662, _598, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _682 = fma(_670, _598, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _684 = fma(_664, _632, _654);
    float _686 = fma(_676, _598, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _688 = fma(_672, _632, _666);
    float _690 = fma(_680, _610, _678);
    float _692 = fma(_682, _610, _684);
    float _694 = fma(_686, _610, _688);
    float _696 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[110].x, _690);
    float _698 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[110].y, _692);
    float _700 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[110].z, _694);
    bool _702 = !_538;
    float _718;
    if (!_702)
    {
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _706 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_104);
        float _724 = 1.0 / _722;
        float _726 = _138 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = in.m_55.y;
    float _732 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _734 = log2(_732);
    float _736 = _160 * 2.0;
    float _738 = in.m_51.w;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _742 = _740 != 0;
    float _744 = in.m_44.x;
    float _746 = in.m_44.y;
    float _748 = in.m_44.z;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _752 = _750 != 0;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _760 = _758 != 0;
    float _762 = floor(_736);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _766 = _764 != 0;
    float _768 = in.m_57.x;
    float _770 = in.m_57.y;
    float _772 = in.m_57.z;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _776 = _774 != 0;
    float _778 = in.m_51.y;
    float _780 = _734 * _138;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _786 = in.m_59.x;
    float _788 = in.m_59.y;
    float _790 = in.m_59.z;
    float _792 = 1.0 / _784;
    float _794 = in.m_61.x;
    float _796 = in.m_61.y;
    float _798 = in.m_61.z;
    float _800 = -_730;
    float _802 = _800 + 1.0;
    float _804 = in.m_55.x;
    bool _806 = _738 > 0.5;
    float _808 = exp2(_780);
    float _810 = in.m_51.z;
    int _812 = _806 ? as_type<int>(_802) : as_type<int>(_730);
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _816 = _814 != 0;
    float _818 = _746 * _770;
    float _820 = _816 ? as_type<float>(_812) : _730;
    float _822 = fma(_744, _768, _818);
    bool _824 = _778 > 0.5;
    float _826 = _746 * _788;
    float _828 = _730;
    bool _830 = _766;
    int _832 = as_type<int>(_796);
    float _834 = _738;
    float _836 = _768;
    if (_766)
    {
        float _838 = _824 ? _802 : _730;
        _828 = _838;
    }
    float _840 = _828;
    if (_742)
    {
        bool _842 = _160 > 0.5;
        _830 = _842;
    }
    bool _844 = _830;
    float _846 = _746 * _796;
    float _848 = fma(_744, _786, _826);
    float _850 = -_808;
    float _852 = _850 + 1.0;
    bool _854 = _844;
    if (_742)
    {
        float _856 = -_804;
        float _858 = _856 + 1.0;
        _832 = as_type<int>(_858);
    }
    int _860 = _832;
    float _862 = fma(_744, _794, _846);
    if (!_742)
    {
        _834 = _804;
    }
    float _864 = _834;
    float _866 = fma(_748, _790, _848);
    float _868 = _810 * 2.0;
    float _870 = _864;
    if (_742)
    {
        float _872 = _844 ? as_type<float>(_860) : _804;
        _870 = _872;
    }
    float _874 = _870;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _878 = 1.0 + _876;
    float _880 = fma(_748, _772, _822);
    float _882 = _778 * 2.0;
    float _884 = fma(_748, _798, _862);
    float _886 = _778 + _810;
    float _888 = 1.0 / _878;
    int _890 = 0;
    if (_776)
    {
        float _892 = -_804;
        float _894 = _892 + 1.0;
        _890 = as_type<int>(_894);
    }
    int _896 = _890;
    float _898 = _886 + (-1.0);
    if (_776)
    {
        bool _900 = _810 > 0.5;
        _854 = _900;
    }
    bool _902 = _854;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _904;
    bool _908 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _910 = isnan(1.0);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _916 = _912 || _914;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _920 = floor(_868);
    if (!_776)
    {
        _836 = _804;
    }
    float _922 = _836;
    float _924 = _906 * _792;
    float _926 = _922;
    if (_776)
    {
        float _928 = _902 ? as_type<float>(_896) : _804;
        _926 = _928;
    }
    float _930 = _926;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _934 = _728 + _932;
    bool _936 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _938 = isnan(_728);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _160 + _810;
    bool _950 = _762 > 0.0;
    float _952 = floor(_882);
    bool _954 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _962 = _958 || _960;
    float _964 = fma(_924, _934, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _966 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _968 = isnan(_728);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -_946;
    float _980 = _978 + 1.0;
    bool _982 = _762 >= 0.0;
    bool _984 = isnan(_762);
    bool _986 = _982 || _984;
    bool _988 = isnan(0.0);
    bool _990 = _986 || _988;
    float _992 = _948 + (-1.0);
    float _994 = _962 ? _852 : 0.0;
    float _996 = _976 * _980;
    float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1000 = _990 ? 0 : 1;
    if (_916)
    {
        float _1002 = _994 * _888;
        _140 = _1002;
    }
    float _1004 = _140;
    bool _1006 = _920 > 0.0;
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1010 = _964 * _996;
    bool _1012 = _952 > 0.0;
    float _1014 = -_976;
    float _1016 = _1014 + 1.0;
    bool _1018 = _952 >= 0.0;
    bool _1020 = isnan(_952);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1030 = ~_1000;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1010);
    int _1038 = _1034;
    if (!_950)
    {
        int _1040 = ~_1000;
        int _1042 = _1040 + 1;
        _1038 = _1042;
    }
    int _1044 = _1038;
    float _1046 = _874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1048 = !_756;
    int _1050 = _1048 ? 0 : 1;
    float _1052 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1036);
    bool _1054 = _920 >= 0.0;
    bool _1056 = isnan(_920);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan(0.0);
    bool _1062 = _1058 || _1060;
    float _1064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1066 = abs(_1050);
    float _1068 = _810 + (-0.5);
    int _1070 = _1062 ? 0 : 1;
    float _1072 = float(_1066);
    int _1074 = ~_1070;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1082 = _1078;
    if (!_1006)
    {
        int _1084 = ~_1070;
        int _1086 = _1084 + 1;
        _1082 = _1086;
    }
    int _1088 = _1082;
    float _1090 = _820 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1092 = float(_1044);
    float _1094 = _840 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1096 = _1026 ? 0 : 1;
    float _1098 = _1090 * _998;
    bool _1100 = !_760;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = _1072 * _1092;
    float _1106 = _1094 * _1028;
    int _1108 = ~_1096;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    float _1114 = in.m_63.x;
    float _1116 = in.m_63.y;
    float _1118 = in.m_63.z;
    int _1120 = _1112;
    if (!_1012)
    {
        int _1122 = ~_1096;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = _930 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1130 = !_752;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = _1046 * _1064;
    int _1136 = abs(_1102);
    float _1138 = _866 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1140 = abs(_1132);
    float _1142 = _1128 * _1080;
    float _1144 = _880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1148 = _1138 + _1146;
    float _1150 = float(_1126);
    out.m_65.x = _1134;
    out.m_65.y = _1106;
    out.m_65.z = _1142;
    out.m_65.w = _1098;
    float _1152 = float(_1136);
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1156 = _1144 + _1154;
    float _1158 = float(_1088);
    float _1160 = _884 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1162 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1164 = _1152 * _1150;
    float _1166 = _778 + (-0.5);
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1160 + _1168;
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1162);
    float _1174 = _1104 * (-2.0);
    float _1176 = _1164 * (-2.0);
    float _1178 = float(_1140);
    float _1180 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1172);
    float _1182 = fma(_1174, _1116, _1116);
    float _1184 = _1148 * _1148;
    float _1186 = fma(_918, _1174, _918);
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1182);
    bool _1190 = _1180 >= 0.0;
    float _1192 = fma(_1156, _1156, _1184);
    float _1194 = fma(_1186, _1004, _1188);
    float _1196 = _696 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1198 = fma(_1170, _1170, _1192);
    float _1200 = _1178 * _1158;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1204 = fma(_1176, _1118, _1118);
    float _1206 = rsqrt(_1198);
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1214 = _1144;
    if (_1190)
    {
        _1210 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1216 = _1210;
    float _1218 = fma(_1008, _1176, _1008);
    float _1220 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1222 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1190)
    {
        float _1228 = _1216 * 5.0;
        _1212 = as_type<int>(_1228);
    }
    int _1230 = _1212;
    float _1232 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1238 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1246 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1204);
    if (_1190)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4586 = as_type<float>(_1230);
        out.gl_Position.z = _4586;
    }
    float _1248 = _1148 * _1206;
    float _1250 = _1156 * _1206;
    float _1252 = fma(_1218, _1004, _1246);
    out.m_67.x = _1238;
    out.m_67.y = _1240;
    out.m_67.z = _1242;
    out.m_67.w = _1226;
    float _1254 = _1194 * 0.15915493667125701904296875;
    out.m_69.x = _1232;
    out.m_69.y = _1234;
    out.m_69.z = _1236;
    out.m_69.w = _1244;
    float _1256 = _1252;
    if (_1190)
    {
        out.m_47.x = 0.0;
    }
    if (_1190)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1258 = -_1248;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1138);
    float _1262 = _1170 * _1206;
    float _1264 = -_1250;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1268 = _160 + _778;
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1272 = _1260 + _1270;
    float _1274 = -_1262;
    float _1276 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1280 = _1266 + _1278;
    float _1282 = _1268 + (-1.0);
    float _1284 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1288 = _1276 + _1286;
    float _1290 = _1200 * (-2.0);
    float _1292 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1294 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1284);
    float _1296 = _160 + (-0.5);
    float _1298 = fma(_1290, _1114, _1114);
    float _1300 = -_1248;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1148);
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1294);
    float _1306 = fma(_1292, _1290, _1292);
    float _1308 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1298);
    float _1310 = -_1250;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1314 = _1302 * _1302;
    bool _1316 = _1304 >= 0.0;
    float _1318 = fma(_1306, _1004, _1308);
    float _1320 = -_1262;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1170);
    float _1324 = fma(_1312, _1312, _1314);
    float _1326 = _1252 * 0.15915493667125701904296875;
    float _1328 = _1318 * 0.15915493667125701904296875;
    float _1330 = _1254 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    float _1334 = fma(_1322, _1322, _1324);
    if (_1316)
    {
        _1256 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1336 = _1256;
    float _1338 = _1254 * 6.283185482025146484375;
    float _1340 = cos(_1338);
    int _1342 = as_type<int>(_1336);
    if (_1316)
    {
        out.m_47.x = 0.0;
    }
    if (_1316)
    {
        float _1344 = _1336 * 5.0;
        _1342 = as_type<int>(_1344);
    }
    int _1346 = _1342;
    float _1348 = _1326 * 6.283185482025146484375;
    float _1350 = sin(_1348);
    if (_1316)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4789 = as_type<float>(_1346);
        out.gl_Position.z = _4789;
    }
    float _1352 = _1326 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1328 * 6.283185482025146484375;
    float _1358 = sin(_1356);
    float _1360 = sqrt(_1334);
    if (_1316)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1362 = -_1138;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = -_1144;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1370 = _1328 * 6.283185482025146484375;
    float _1372 = cos(_1370);
    float _1374 = -_1160;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1378 = _1364 * _1364;
    float _1380 = _1340 * _1354;
    float _1382 = _1332 * _1350;
    float _1384 = _1206 * _1360;
    float _1386 = fma(_1368, _1368, _1378);
    float _1388 = _1340 * _1350;
    float _1390 = fma(_1358, _1382, _1380);
    float _1392 = fma(_1358, _1380, _1382);
    float _1394 = fma(_1376, _1376, _1386);
    float _1396 = _1332 * _1354;
    float _1398 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1400 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1402 = precise::clamp(_1400, 0.0, 1.0);
    float _1404 = rsqrt(_1394);
    float _1406 = _1350 * _1372;
    float _1408 = _1354 * _1372;
    float _1410 = _1332 * _1372;
    float _1412 = _1340 * _1372;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1416 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1414;
    float _1418 = in.m_71.x;
    float _1420 = in.m_71.y;
    float _1422 = in.m_71.z;
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1426 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1424;
    float _1428 = _1416 * _1416;
    float _1430 = -_1396;
    float _1432 = fma(_1358, _1388, _1430);
    float _1434 = -_1388;
    float _1436 = fma(_1358, _1396, _1434);
    float _1438 = _1384 * _1398;
    float _1440 = fma(_1402, -0.64999997615814208984375, 1.0);
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1444 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1442;
    float _1446 = _1368 * _1404;
    float _1448 = _1376 * _1404;
    float _1450 = _1364 * _1404;
    float _1452 = fma(_1426, _1426, _1428);
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1456 = _1446 * _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1460 = _1448 * _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1464 = _1450 * _1462;
    float _1466 = fma(_1444, _1444, _1452);
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1470 = -_1456;
    float _1472 = fma(_1448, _1468, _1470);
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1476 = -_1460;
    float _1478 = fma(_1450, _1474, _1476);
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1482 = -_1464;
    float _1484 = fma(_1446, _1480, _1482);
    float _1486 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1488 = _1472 * _1472;
    float _1490 = rsqrt(_1466);
    float _1492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1418);
    float _1494 = _1384 * _1486;
    float _1496 = fma(_1478, _1478, _1488);
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1420);
    float _1500 = _1492 * _1438;
    float _1502 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1504 = fma(_1484, _1484, _1496);
    float _1506 = sqrt(_1466);
    float _1508 = _1498 * _1494;
    float _1510 = _1384 * _1502;
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1422);
    bool _1514 = _1420 != 0.0;
    bool _1516 = isnan(_1420);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan(0.0);
    bool _1522 = _1518 || _1520;
    float _1524 = _1408 * _1508;
    float _1526 = _1392 * _1508;
    float _1528 = _1512 * _1510;
    float _1530 = rsqrt(_1504);
    float _1532 = _1436 * _1508;
    float _1534 = _1490 * (-0.20000000298023223876953125);
    float _1536 = fma(_1406, _1500, _1524);
    float _1538 = fma(_1432, _1500, _1526);
    float _1540 = fma(_1390, _1500, _1532);
    float _1542 = fma(_1426, _1534, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1544 = _1418 == 0.0;
    bool _1546 = !_1522;
    bool _1548 = _1544 && _1546;
    float _1550 = _1506 * 0.066666670143604278564453125;
    float _1552 = fma(_1410, _1528, _1540);
    float _1554 = fma(_1416, _1534, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1556 = -_1358;
    float _1558 = fma(_1556, _1528, _1536);
    float _1560 = fma(_1412, _1528, _1538);
    float _1562 = fma(_1444, _1534, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1564 = -_1554;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = precise::max(_1550, 1.0);
    float _1570 = _1484 * _1530;
    float _1572 = _1472 * _1530;
    float _1574 = _1478 * _1530;
    float _1576 = _1566 * _1566;
    float _1578 = _1446 * _1570;
    float _1580 = _1448 * _1572;
    float _1582 = precise::min(_1568, 2.0);
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1586 = _1554 + _1584;
    float _1588 = -_1578;
    float _1590 = fma(_1448, _1574, _1588);
    float _1592 = _1450 * _1574;
    float _1594 = -_1580;
    float _1596 = fma(_1450, _1570, _1594);
    float _1598 = _1582 * _1440;
    float _1600 = _1590 * _1558;
    float _1602 = -_1592;
    float _1604 = fma(_1446, _1572, _1602);
    float _1606 = _1596 * _1558;
    float _1608 = -_1542;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = fma(_1572, _1552, _1600);
    float _1614 = _1604 * _1558;
    float _1616 = fma(_1574, _1552, _1606);
    bool _1618 = _1422 == 0.0;
    bool _1620 = _1618 && _1548;
    float _1622 = fma(_1450, _1560, _1612);
    float _1624 = fma(_1570, _1552, _1614);
    float _1626 = fma(_1446, _1560, _1616);
    float _1628 = fma(_1610, _1610, _1576);
    float _1630 = _1138 + _1622;
    float _1632 = -_1562;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1636 = _1144 + _1626;
    float _1638 = in.m_73.x;
    float _1640 = in.m_73.y;
    float _1642 = in.m_73.z;
    float _1644 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1646 = _1630 + _1644;
    float _1648 = fma(_1448, _1560, _1624);
    float _1650 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1652 = _1636 + _1650;
    float _1654 = fma(_1634, _1634, _1628);
    float _1656 = fma(_1646, _1598, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1658 = _1160 + _1648;
    float _1660 = fma(_1652, _1598, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1664 = _1542 + _1662;
    float _1666 = -_1656;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1670 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1672 = _1658 + _1670;
    float _1674 = -_1660;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1678 = _1586 * _1586;
    float _1680 = _1668 * _1668;
    float _1682 = fma(_1672, _1598, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1686 = _1562 + _1684;
    float _1688 = fma(_1664, _1664, _1678);
    float _1690 = fma(_1676, _1676, _1680);
    float _1692 = -_1682;
    float _1694 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1696 = in.m_75.x;
    float _1698 = in.m_75.y;
    float _1700 = in.m_75.z;
    float _1702 = in.m_75.w;
    float _1704 = fma(_1686, _1686, _1688);
    float _1706 = sqrt(_1654);
    float _1708 = fma(_1694, _1694, _1690);
    float _1710 = _1406 * _1590;
    float _1712 = _1690;
    float _1714 = _1688;
    float _1716 = _1694;
    float _1718 = _1638;
    float _1720 = _1392;
    if (_1620)
    {
        _1712 = _1638;
    }
    float _1722 = _1712;
    float _1724 = _1406 * _1604;
    float _1726 = _1722;
    if (_1620)
    {
        _1714 = _1642;
    }
    float _1728 = _1714;
    float _1730 = _1728;
    if (!_1620)
    {
        float _1732 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1642);
        _1730 = _1732;
    }
    float _1734 = _1730;
    if (_1620)
    {
        _1716 = _1722;
    }
    float _1736 = _1716;
    float _1738 = sqrt(_1708);
    float _1740 = _1736;
    if (!_1620)
    {
        _1726 = _1638;
    }
    float _1742 = _1726;
    float _1744 = fma(_1390, _1570, _1724);
    if (_1620)
    {
        _1718 = _1640;
    }
    float _1746 = _1718;
    float _1748 = _1746;
    if (!_1620)
    {
        float _1750 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1640);
        _1748 = _1750;
    }
    float _1752 = _1748;
    if (!_1620)
    {
        float _1754 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1742);
        _1740 = _1754;
    }
    float _1756 = _1740;
    float _1758 = rsqrt(_1704);
    float _1760 = _1700 * _1742;
    float _1762 = _1698 * _1642;
    float _1764 = -_1706;
    float _1766 = _1738 + _1764;
    float _1768 = _1696 * _1640;
    float _1770 = -_1760;
    float _1772 = fma(_1696, _1642, _1770);
    float _1774 = -_1762;
    float _1776 = fma(_1700, _1640, _1774);
    float _1778 = _1408 * _1604;
    float _1780 = -_1768;
    float _1782 = fma(_1698, _1742, _1780);
    float _1784 = _1772 * _1702;
    float _1786 = _1776 * _1702;
    float _1788 = _1758 * _1766;
    float _1790 = _1782 * _1702;
    float _1792 = _1406 * _1596;
    float _1794 = _1408 * _1596;
    float _1796 = -_1788;
    float _1798 = fma(_1664, _1796, _1660);
    float _1800 = -_1788;
    float _1802 = fma(_1686, _1800, _1682);
    float _1804 = _1408 * _1590;
    float _1806 = -_1596;
    float _1808 = _1358 * _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1812 = _1798 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1816 = _1802 + _1814;
    float _1818 = -_1590;
    float _1820 = _1358 * _1818;
    float _1822 = -_1604;
    float _1824 = _1358 * _1822;
    float _1826 = _1812 * _1812;
    float _1828 = _1816 * _1816;
    float _1830 = fma(_1436, _1574, _1794);
    float _1832 = fma(_1436, _1572, _1804);
    float _1834 = fma(_1436, _1570, _1778);
    float _1836 = _1826 + _1828;
    float _1838 = fma(_1390, _1574, _1792);
    float _1840 = fma(_1390, _1572, _1710);
    float _1842 = fma(_1410, _1570, _1824);
    float _1844 = sqrt(_1836);
    float _1846 = fma(_1410, _1574, _1808);
    float _1848 = fma(_1410, _1572, _1820);
    float _1850 = fma(_1392, _1446, _1830);
    float _1852 = fma(_1392, _1450, _1832);
    float _1854 = fma(_1392, _1448, _1834);
    float _1856 = fma(_1432, _1446, _1838);
    float _1858 = fma(_1432, _1450, _1840);
    float _1860 = fma(_1432, _1448, _1744);
    float _1862 = fma(_1412, _1448, _1842);
    float _1864 = fma(_1412, _1446, _1846);
    float _1866 = fma(_1412, _1450, _1848);
    float _1868 = _1850 * _1698;
    float _1870 = _1852 * _1698;
    float _1872 = _1854 * _1698;
    float _1874 = _1850 * _1752;
    bool _1876 = _1844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1878 = _1784 * _1850;
    float _1880 = _1852 * _1752;
    float _1882 = _1784 * _1852;
    float _1884 = _1854 * _1752;
    float _1886 = _1784 * _1854;
    float _1888 = -_1788;
    float _1890 = fma(_1586, _1888, _1656);
    float _1892 = _1890;
    float _1894 = _1826;
    float _1896 = _1828;
    float _1898 = _1802;
    float _1900 = _1790;
    if (!_1876)
    {
        _1720 = _1798;
    }
    float _1902 = _1720;
    bool _1904 = !_1876;
    float _1906 = _1902;
    if (!_1904)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1912 = _1844 + _1910;
        float _1914 = rsqrt(_1836);
        float _1916 = _1912 * _1908;
        float _1918 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1920 = _1916 * 0.15915493667125701904296875;
        float _1922 = _1920 * 6.283185482025146484375;
        float _1924 = sin(_1922);
        float _1926 = _1920 * 6.283185482025146484375;
        float _1928 = cos(_1926);
        float _1930 = fma(_1924, _1918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1932 = _1914 * _1930;
        float _1934 = fma(_1812, _1932, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1936 = _1928 + (-1.0);
        float _1938 = fma(_1816, _1932, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1942 = _1934 + _1940;
        float _1944 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1948 = _1938 + _1946;
        float _1950 = _1942 * _1942;
        float _1952 = fma(_1890, _1928, _1944);
        float _1954 = _1948 * _1948;
        _1892 = _1952;
        _1894 = _1950;
        _1896 = _1954;
        _1906 = _1934;
        _1898 = _1938;
    }
    float _1956 = _1892;
    float _1958 = _1894;
    float _1960 = _1896;
    float _1962 = _1906;
    float _1964 = _1898;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1968 = _1956 + _1966;
    float _1970 = fma(_1856, _1756, _1874);
    float _1972 = fma(_1856, _1696, _1868);
    float _1974 = fma(_1858, _1696, _1870);
    float _1976 = fma(_1968, _1968, _1958);
    float _1978 = fma(_1858, _1756, _1880);
    float _1980 = fma(_1860, _1756, _1884);
    float _1982 = fma(_1786, _1856, _1878);
    float _1984 = _1976 + _1960;
    float _1986 = fma(_1860, _1696, _1872);
    float _1988 = fma(_1786, _1858, _1882);
    float _1990 = fma(_1786, _1860, _1886);
    float _1992 = fma(_1864, _1700, _1972);
    float _1994 = fma(_1866, _1700, _1974);
    float _1996 = sqrt(_1984);
    float _1998 = fma(_1864, _1734, _1970);
    float _2000 = fma(_1790, _1864, _1982);
    float _2002 = fma(_1866, _1734, _1978);
    float _2004 = fma(_1790, _1866, _1988);
    float _2006 = fma(_1790, _1862, _1990);
    float _2008 = fma(_1862, _1734, _1980);
    float _2010 = fma(_1862, _1700, _1986);
    out.m_69.x = _1232;
    out.m_69.y = _1234;
    out.m_69.z = _1236;
    out.m_69.w = _1244;
    out.m_67.x = _1238;
    out.m_67.y = _1240;
    out.m_67.z = _1242;
    out.m_67.w = _1226;
    out.m_77.x = _2000;
    out.m_77.y = _2004;
    out.m_77.z = _2006;
    bool _2012 = _1996 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2014 = isnan(_1996);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2020 = _2016 || _2018;
    out.m_79.x = _1998;
    out.m_79.y = _2002;
    out.m_79.z = _2008;
    out.m_81.x = _1992;
    out.m_81.y = _1994;
    out.m_81.z = _2010;
    float _2022 = _2010;
    float _2024 = _2000;
    float _2026 = _2004;
    if (!_2020)
    {
        _1900 = 1.0;
    }
    float _2028 = _1900;
    bool _2030 = !_2020;
    float _2032 = _2028;
    if (!_2030)
    {
        bool _2034 = _1996 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2036 = isnan(_1996);
        bool _2038 = _2034 || _2036;
        bool _2040 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2042 = _2038 || _2040;
        if (!_2042)
        {
            float _2044 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2046 = _1996 + _2044;
            float _2048 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2050 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2048;
            float _2052 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2054 = _2052 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2056 = 1.0 / _2050;
            float _2058 = _2046 * _2056;
            float _2060 = fma(_2058, _2054, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2032 = _2060;
            _2062 = true;
        }
        else
        {
            bool _2064 = _1996 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2066 = isnan(_1996);
            bool _2068 = _2064 || _2066;
            bool _2070 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2072 = _2068 || _2070;
            if (!_2072)
            {
                float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2076 = _1996 + _2074;
                float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2080 = _2078 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2084 = _2082 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2086 = 1.0 / _2080;
                float _2088 = _2076 * _2086;
                float _2090 = fma(_2088, _2084, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2032 = _2090;
                _2062 = true;
            }
            else
            {
                _2032 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2062 = false;
    float _2092 = _2032;
    float _2094 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2096 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2098 = _1962 + _2096;
    float _2100 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2094);
    float _2102 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2104 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2106 = _1956 + _2104;
    float _2108 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2100);
    bool _2110 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2112 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan(0.5);
    bool _2118 = _2114 || _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2122 = _1964 + _2120;
    bool _2124 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2128 = _2124 || _2126;
    bool _2130 = isnan(0.5);
    bool _2132 = _2128 || _2130;
    float _2134 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2136 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2102);
    float _2138 = fma(_2106, _2092, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2140 = fma(_2122, _2092, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2142 = 1.0 / _2134;
    float _2144 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2136);
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2148 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2132)
    {
        _2148 = 1.0;
    }
    float _2150 = _2148;
    float _2152 = _2146 + _2134;
    float _2154 = -_1248;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2138);
    float _2158 = _2152 * _2142;
    float _2160 = _2158 * 0.5;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2164 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2162);
    float _2166 = fma(_2098, _2092, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2168 = -_1262;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2140);
    float _2172 = 1.0 / _2164;
    float _2174 = -_1250;
    float _2176 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2166);
    float _2178 = _2156;
    float _2180 = _2176;
    float _2182 = _2170;
    float _2184 = _2166;
    float _2186 = _2150;
    if (!_2118)
    {
        float _2188 = _1272 * _1272;
        float _2190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2192 = -_1160;
        float _2194 = _2192 + _2140;
        float _2196 = -_1138;
        float _2198 = _2196 + _2138;
        float _2200 = fma(_1280, _1280, _2188);
        float _2202 = fma(_1288, _1288, _2200);
        float _2204 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2206 = sqrt(_2202);
        float _2208 = 1.0 / _1384;
        float _2210 = precise::min(_2206, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2212 = _2210 * _2190;
        float _2214 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2216 = _2212 * _2208;
        float _2218 = -_1144;
        float _2220 = _2218 + _2166;
        float _2222 = _2214 * _2216;
        float _2224 = _2194 * _2216;
        float _2226 = fma(_2220, _2222, _1266);
        float _2228 = fma(_2198, _2222, _1260);
        float _2230 = fma(_2214, _2224, _1276);
        _2178 = _2228;
        _2180 = _2226;
        _2182 = _2230;
    }
    float _2232 = _2178;
    float _2234 = _2180;
    float _2236 = _2182;
    if (_2132)
    {
        _2184 = 1.0;
    }
    float _2238 = _2184;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2242 = _2172 * _2240;
    float _2244 = _2238;
    if (!_2132)
    {
        float _2246 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2250 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2248;
        float _2252 = _2246 * 0.15915493667125701904296875;
        float _2254 = _2252 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2260 = _2258 * 0.15915493667125701904296875;
        float _2262 = _2252 * 6.283185482025146484375;
        float _2264 = sin(_2262);
        float _2266 = 1.0 / _2256;
        float _2268 = _2260 * 6.283185482025146484375;
        float _2270 = cos(_2268);
        float _2272 = _2264 * _2266;
        float _2274 = _2260 * 6.283185482025146484375;
        float _2276 = sin(_2274);
        float _2278 = _2270 * _2272;
        float _2280 = 1.0 / _2250;
        float _2282 = 1.0 / _2278;
        float _2284 = _2276 * _2282;
        float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2288 = fma(_2242, _2284, _2286);
        float _2290 = _2288 * _2280;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        _2022 = _2280;
        _2186 = _2292;
    }
    float _2294 = _2022;
    float _2296 = _2186;
    float _2298 = _2294;
    if (!_2132)
    {
        float _2300 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2302 = _2300 * 0.15915493667125701904296875;
        float _2304 = _2302 * 6.283185482025146484375;
        float _2306 = cos(_2304);
        float _2308 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2310 = _2308 * 0.15915493667125701904296875;
        float _2312 = _2302 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = 1.0 / _2306;
        float _2318 = _2310 * 6.283185482025146484375;
        float _2320 = cos(_2318);
        float _2322 = _2314 * _2316;
        float _2324 = _2310 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = _2320 * _2322;
        float _2330 = 1.0 / _2328;
        float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2334 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2332;
        float _2336 = 1.0 / _2334;
        float _2338 = _2326 * _2330;
        float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2342 = fma(_2242, _2338, _2340);
        float _2344 = _2342 * _2336;
        float _2346 = precise::clamp(_2344, 0.0, 1.0);
        float _2348 = -_2346;
        float _2350 = _2348 + 1.0;
        _2298 = _2306;
        _2244 = _2350;
    }
    float _2352 = _2298;
    float _2354 = _2244;
    float _2356 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2358 = _2232 + _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2362 = _2234 + _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2366 = _2236 + _2364;
    float _2368 = _2358 * _2358;
    float _2370 = fma(_2362, _2362, _2368);
    float _2372 = fma(_2366, _2366, _2370);
    float _2374 = rsqrt(_2372);
    float _2376 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2378 = _2362 * _2376;
    float _2380 = _2366 * _2376;
    float _2382 = _2378 * _2378;
    float _2384 = _2380 * _2380;
    float _2386 = _2382 + _2384;
    float _2388 = sqrt(_2386);
    bool _2390 = _2388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2394 = _2388 + _2392;
    float _2396 = _2366;
    float _2398 = _2386;
    float _2400 = _2394;
    float _2402 = _2378;
    if (_2390)
    {
        float _2404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2396 = _2404;
    }
    float _2406 = _2396;
    if (_2390)
    {
        float _2408 = rsqrt(_2386);
        _2398 = _2408;
    }
    float _2410 = _2398;
    float _2412 = _2410;
    if (_2390)
    {
        float _2414 = _2394 * _2406;
        _2400 = _2414;
    }
    float _2416 = _2400;
    if (_2390)
    {
        float _2418 = _2416 * 0.15915493667125701904296875;
        _2024 = _2418;
    }
    float _2420 = _2024;
    float _2422 = _2374;
    if (_2390)
    {
        float _2424 = _2420 * 6.283185482025146484375;
        float _2426 = sin(_2424);
        _2422 = _2426;
    }
    float _2428 = _2422;
    float _2430 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2432 = precise::max(0.0, _2430);
    float _2434 = _2352;
    float _2436 = _2432;
    float _2438 = _2430;
    if (_2390)
    {
        float _2440 = _2420 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        _2434 = _2442;
    }
    float _2444 = _2434;
    float _2446 = -_2376;
    float _2448 = -_2432;
    float _2450 = fma(_2358, _2446, _2448);
    if (_2390)
    {
        float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2436 = _2452;
    }
    float _2454 = _2436;
    float _2456 = sqrt(_2372);
    float _2458 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2460 = _2428;
    float _2462 = _2454;
    if (_2390)
    {
        float _2464 = fma(_2428, _2454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2460 = _2464;
    }
    float _2466 = _2460;
    float _2468 = _2466;
    if (!_2390)
    {
        _2462 = _2380;
    }
    float _2470 = _2462;
    float _2472 = _2470;
    if (_2390)
    {
        float _2474 = _2444 + (-1.0);
        _2438 = _2474;
    }
    float _2476 = _2438;
    float _2478 = _2476;
    if (_2390)
    {
        float _2480 = _2410 * _2466;
        _1214 = _2480;
    }
    float _2482 = _1214;
    if (!_2390)
    {
        _2468 = _2450;
    }
    float _2484 = _2468;
    float _2486 = _2484;
    if (_2390)
    {
        float _2488 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2026 = _2488;
    }
    float _2490 = _2026;
    if (_2390)
    {
        float _2492 = _2378 * _2482;
        _2402 = _2492;
    }
    float _2494 = _2402;
    if (!_2390)
    {
        _2412 = _2382;
    }
    float _2496 = _2412;
    float _2498 = _2496;
    if (_2390)
    {
        float _2500 = _2380 * _2482;
        _2472 = _2500;
    }
    float _2502 = _2472;
    if (_2390)
    {
        float _2504 = fma(_2450, _2444, _2490);
        _2486 = _2504;
    }
    float _2506 = _2486;
    if (_2390)
    {
        float _2508 = _2494 * _2494;
        _2498 = _2508;
    }
    float _2510 = _2498;
    if (!_2390)
    {
        _2478 = _2384;
    }
    float _2512 = _2478;
    float _2514 = _2512;
    if (_2390)
    {
        float _2516 = _2502 * _2502;
        _2514 = _2516;
    }
    float _2518 = _2514;
    float _2520 = fma(_2506, _2506, _2510);
    float _2522 = _2520 + _2518;
    float _2524 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2528 = fma(_2456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2526);
    float _2530 = precise::clamp(_2528, 0.0, 1.0);
    float _2532 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2534 = rsqrt(_2522);
    float _2536 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2524);
    float _2538 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2540 = -_2530;
    float _2542 = _2540 + 1.0;
    float _2544 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2546 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2536);
    float _2548 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2538);
    float _2550 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2544);
    float _2552 = _2546 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2554 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2548);
    float _2556 = abs(_2542);
    float _2558 = log2(_2556);
    float _2560 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2550);
    float _2562 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2458);
    float _2564 = _2554 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2566 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2568 = _2534 * _2494;
    float _2570 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2572 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2574 = _2534 * _2506;
    float _2576 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2578 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2562);
    float _2580 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2572);
    float _2582 = _2534 * _2502;
    float _2584 = -_2576;
    float _2586 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2584);
    float _2588 = _2578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2590 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2580);
    float _2592 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2594 = -_2582;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2586);
    float _2598 = -_2566;
    float _2600 = fma(_2598, _2532, 1.0);
    float _2602 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2590);
    float _2604 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2606 = fma(_2596, -0.5, 0.5);
    float _2608 = exp2(_2592);
    float _2610 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2612 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2604);
    float _2614 = fma(_2596, 0.5, 0.5);
    float _2616 = _2574 + 1.0;
    float _2618 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2610);
    float _2620 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2612);
    float _2622 = fma(_2614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2624 = log2(_2600);
    float _2626 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2618);
    float _2628 = fma(_2614, _2622, -0.212114393711090087890625);
    float _2630 = fma(_2614, _2628, 1.570728778839111328125);
    float _2632 = 1.0 / _2602;
    float _2634 = -_2574;
    float _2636 = fma(_2608, _2616, _2634);
    float _2638 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2620);
    float _2640 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2626);
    float _2642 = fma(_2636, 0.5, 0.5);
    float _2644 = sqrt(_2606);
    float _2646 = _2624 * 0.693147182464599609375;
    float _2648 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2650 = _2638 * _2632;
    float _2652 = _2640 * _2632;
    float _2654 = fma(_2650, 0.5, 0.5);
    float _2656 = fma(_2652, -0.5, 0.5);
    float _2658 = _2644 * 0.636619746685028076171875;
    float _2660 = -_2630;
    float _2662 = fma(_2658, _2660, 1.0);
    float3 _6897 = float3(_2654, _2656, _2648);
    float _2664 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6897, float3(0.0), isnan(_6897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6897, float3(0.0), isnan(_6897)), level(0.0)).x;
    float3 _6908 = float3(_2654, _2656, _2648);
    float4 _2667 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6908, float3(0.0), isnan(_6908)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6908, float3(0.0), isnan(_6908)), level(0.0)).xyzw;
    float _2669 = _2667.x;
    float _2671 = _2667.y;
    float _2673 = _2667.z;
    float _2675 = _2667.w;
    float2 _6925 = float2(_2662, _2642);
    float3 _2679 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6925, float2(0.0), isnan(_6925)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6925, float2(0.0), isnan(_6925)), level(0.0)).xyz;
    float _2681 = _2679.x;
    float _2683 = _2679.y;
    float _2685 = _2679.z;
    float _2687 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2689 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2691 = _2296 * _2354;
    bool _2693 = _2296 > 0.0;
    bool _2695 = isnan(_2296);
    bool _2697 = _2693 || _2695;
    bool _2699 = isnan(0.0);
    bool _2701 = _2697 || _2699;
    float _2703 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2689);
    float _2705 = exp2(_2687);
    float _2707 = _2691 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2709 = _2354 <= 0.0;
    bool _2711 = !_2701;
    bool _2713 = _2709 || _2711;
    float _2715 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2703);
    float _2717 = _2602 * 0.5;
    float _2719 = _248 * _2707;
    float _2721 = _2638 + _2602;
    float _2723 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2715);
    float _2725 = fma(_2640, -0.5, _2717);
    float _2727 = _2721 * 0.5;
    float _2729 = _2723 + _2602;
    out.gl_Position.x = _2638;
    out.gl_Position.y = _2640;
    out.gl_Position.z = _2723;
    out.gl_Position.w = _2602;
    float _2731 = _2719 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2733 = _2729 * 0.5;
    float _2735 = -_2705;
    float _2737 = _2735 + 1.0;
    out.m_47.x = _2731;
    float _2739 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2727;
    out.m_83.y = _2725;
    out.m_83.z = _2733;
    out.m_83.w = _2602;
    float _2741 = -_2739;
    float _2743 = _2741 + 1.0;
    float _2745 = _2739 * _2664;
    float _2747 = _2675 * _2743;
    float _2749 = _2675 * _2745;
    float _2751 = _2685 * _2745;
    float _2753 = fma(_2681, _2749, _2669);
    float _2755 = fma(_2683, _2749, _2671);
    float _2757 = fma(_2675, _2751, _2673);
    out.m_85.x = _2753;
    out.m_85.y = _2755;
    out.m_85.z = _2757;
    out.m_85.w = _2747;
    if (!_2713)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2759 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2759;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2062 = false;
    bool _720 = false;
    bool _488 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2816 = as_type<float>(_120);
        out.gl_Position.z = _2816;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2886 = as_type<float>(_158);
        out.gl_Position.z = _2886;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    float _214 = float(_192);
    int _216 = abs(_212);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _222 = _208 < 0.5;
    float _224 = float(_222);
    float _226 = fma(_196, 0.5, 0.5);
    float _228 = abs(_220);
    float _230 = _214 * _228;
    float _232 = float(_204);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_216);
    float _244 = fma(_232, _240, _230);
    float _246 = abs(_236);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    float _266;
    if (!_250)
    {
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_104);
        float _272 = 1.0 / _270;
        float _274 = _138 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _276 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = 1.0 / _292;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _306 = 1.0 / _300;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    float _312 = 1.0 / _296;
    float _314 = _280 * _302;
    bool _316 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_276);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = fma(_310, _314, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_330, _314, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = _284 * _306;
    bool _338 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_276);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_326;
    float _352 = _350 + 1.0;
    float _354 = _348 * _352;
    bool _356 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_276);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _288 * _312;
    bool _370 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_276);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = -_348;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = fma(_384, _314, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = -_380;
    float _398 = _396 + 1.0;
    float _400 = _380 * _388;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _366 * _398;
    float _412 = -_366;
    float _414 = _412 + 1.0;
    float _416 = fma(_392, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_404, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _332 * _410;
    float _422 = _334 * _410;
    float _424 = _394 * _410;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _432 = fma(_408, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_416, _400, _426);
    float _448 = fma(_436, _336, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _336, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_444, _336, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_418, _400, _428);
    float _456 = fma(_432, _400, _430);
    float _458 = fma(_448, _354, _446);
    float _460 = fma(_450, _354, _454);
    float _462 = fma(_452, _354, _456);
    float _464 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].x, _458);
    float _466 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    bool _470 = !_304;
    float _486;
    if (!_470)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _474 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_104);
        float _492 = 1.0 / _490;
        float _494 = _138 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _496 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _510 = _496 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _520;
    bool _524 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _526 = isnan(_496);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _514;
    bool _538 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _540 = 1.0 / _518;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _542;
    float _546 = 1.0 / _522;
    float _548 = _468 * _502;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _552 = _496 + _550;
    float _554 = _466 * _500;
    float _556 = _464 * _498;
    float _558 = _552 * _536;
    float _560 = _506 * _540;
    bool _562 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _564 = isnan(_496);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _574;
    bool _578 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _580 = isnan(_496);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _590;
    float _594 = fma(_544, _558, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _596 = fma(_576, _558, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = _510 * _546;
    float _600 = -_534;
    float _602 = _600 + 1.0;
    float _604 = -_588;
    float _606 = _604 + 1.0;
    float _608 = fma(_592, _558, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _610 = _572 * _602;
    float _612 = -_572;
    float _614 = _612 + 1.0;
    bool _616 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _618 = isnan(_496);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _632 = _588 * _614;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _638 = _626 * _606;
    float _640 = -_626;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _648 = _608 * _638;
    float _650 = _594 * _638;
    float _652 = _596 * _638;
    float _654 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[107].y, _648);
    float _656 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[107].x, _650);
    float _658 = fma(_630, _560, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _660;
    float _664 = fma(_636, _560, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _666 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[107].z, _652);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _668;
    float _672 = fma(_646, _560, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _674;
    float _678 = fma(_658, _632, _656);
    float _680 = fma(_662, _598, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _682 = fma(_670, _598, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _684 = fma(_664, _632, _654);
    float _686 = fma(_676, _598, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _688 = fma(_672, _632, _666);
    float _690 = fma(_680, _610, _678);
    float _692 = fma(_682, _610, _684);
    float _694 = fma(_686, _610, _688);
    float _696 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[110].x, _690);
    float _698 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[110].y, _692);
    float _700 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[110].z, _694);
    bool _702 = !_538;
    float _718;
    if (!_702)
    {
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _706 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_104);
        float _724 = 1.0 / _722;
        float _726 = _138 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = in.m_55.y;
    float _732 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _734 = log2(_732);
    float _736 = _160 * 2.0;
    float _738 = in.m_51.w;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _742 = _740 != 0;
    float _744 = in.m_44.x;
    float _746 = in.m_44.y;
    float _748 = in.m_44.z;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _752 = _750 != 0;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _760 = _758 != 0;
    float _762 = floor(_736);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _766 = _764 != 0;
    float _768 = in.m_57.x;
    float _770 = in.m_57.y;
    float _772 = in.m_57.z;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _776 = _774 != 0;
    float _778 = in.m_51.y;
    float _780 = _734 * _138;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _786 = in.m_59.x;
    float _788 = in.m_59.y;
    float _790 = in.m_59.z;
    float _792 = 1.0 / _784;
    float _794 = in.m_61.x;
    float _796 = in.m_61.y;
    float _798 = in.m_61.z;
    float _800 = -_730;
    float _802 = _800 + 1.0;
    float _804 = in.m_55.x;
    bool _806 = _738 > 0.5;
    float _808 = exp2(_780);
    float _810 = in.m_51.z;
    int _812 = _806 ? as_type<int>(_802) : as_type<int>(_730);
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _816 = _814 != 0;
    float _818 = _746 * _770;
    float _820 = _816 ? as_type<float>(_812) : _730;
    float _822 = fma(_744, _768, _818);
    bool _824 = _778 > 0.5;
    float _826 = _746 * _788;
    float _828 = _730;
    bool _830 = _766;
    int _832 = as_type<int>(_796);
    float _834 = _738;
    float _836 = _768;
    if (_766)
    {
        float _838 = _824 ? _802 : _730;
        _828 = _838;
    }
    float _840 = _828;
    if (_742)
    {
        bool _842 = _160 > 0.5;
        _830 = _842;
    }
    bool _844 = _830;
    float _846 = _746 * _796;
    float _848 = fma(_744, _786, _826);
    float _850 = -_808;
    float _852 = _850 + 1.0;
    bool _854 = _844;
    if (_742)
    {
        float _856 = -_804;
        float _858 = _856 + 1.0;
        _832 = as_type<int>(_858);
    }
    int _860 = _832;
    float _862 = fma(_744, _794, _846);
    if (!_742)
    {
        _834 = _804;
    }
    float _864 = _834;
    float _866 = fma(_748, _790, _848);
    float _868 = _810 * 2.0;
    float _870 = _864;
    if (_742)
    {
        float _872 = _844 ? as_type<float>(_860) : _804;
        _870 = _872;
    }
    float _874 = _870;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _878 = 1.0 + _876;
    float _880 = fma(_748, _772, _822);
    float _882 = _778 * 2.0;
    float _884 = fma(_748, _798, _862);
    float _886 = _778 + _810;
    float _888 = 1.0 / _878;
    int _890 = 0;
    if (_776)
    {
        float _892 = -_804;
        float _894 = _892 + 1.0;
        _890 = as_type<int>(_894);
    }
    int _896 = _890;
    float _898 = _886 + (-1.0);
    if (_776)
    {
        bool _900 = _810 > 0.5;
        _854 = _900;
    }
    bool _902 = _854;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _904;
    bool _908 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _910 = isnan(1.0);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _916 = _912 || _914;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _920 = floor(_868);
    if (!_776)
    {
        _836 = _804;
    }
    float _922 = _836;
    float _924 = _906 * _792;
    float _926 = _922;
    if (_776)
    {
        float _928 = _902 ? as_type<float>(_896) : _804;
        _926 = _928;
    }
    float _930 = _926;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _934 = _728 + _932;
    bool _936 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _938 = isnan(_728);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _160 + _810;
    bool _950 = _762 > 0.0;
    float _952 = floor(_882);
    bool _954 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _962 = _958 || _960;
    float _964 = fma(_924, _934, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _966 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _968 = isnan(_728);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -_946;
    float _980 = _978 + 1.0;
    bool _982 = _762 >= 0.0;
    bool _984 = isnan(_762);
    bool _986 = _982 || _984;
    bool _988 = isnan(0.0);
    bool _990 = _986 || _988;
    float _992 = _948 + (-1.0);
    float _994 = _962 ? _852 : 0.0;
    float _996 = _976 * _980;
    float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1000 = _990 ? 0 : 1;
    if (_916)
    {
        float _1002 = _994 * _888;
        _140 = _1002;
    }
    float _1004 = _140;
    bool _1006 = _920 > 0.0;
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1010 = _964 * _996;
    bool _1012 = _952 > 0.0;
    float _1014 = -_976;
    float _1016 = _1014 + 1.0;
    bool _1018 = _952 >= 0.0;
    bool _1020 = isnan(_952);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1030 = ~_1000;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1010);
    int _1038 = _1034;
    if (!_950)
    {
        int _1040 = ~_1000;
        int _1042 = _1040 + 1;
        _1038 = _1042;
    }
    int _1044 = _1038;
    float _1046 = _874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1048 = !_756;
    int _1050 = _1048 ? 0 : 1;
    float _1052 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1036);
    bool _1054 = _920 >= 0.0;
    bool _1056 = isnan(_920);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan(0.0);
    bool _1062 = _1058 || _1060;
    float _1064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1066 = abs(_1050);
    float _1068 = _810 + (-0.5);
    int _1070 = _1062 ? 0 : 1;
    float _1072 = float(_1066);
    int _1074 = ~_1070;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1082 = _1078;
    if (!_1006)
    {
        int _1084 = ~_1070;
        int _1086 = _1084 + 1;
        _1082 = _1086;
    }
    int _1088 = _1082;
    float _1090 = _820 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1092 = float(_1044);
    float _1094 = _840 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1096 = _1026 ? 0 : 1;
    float _1098 = _1090 * _998;
    bool _1100 = !_760;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = _1072 * _1092;
    float _1106 = _1094 * _1028;
    int _1108 = ~_1096;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    float _1114 = in.m_63.x;
    float _1116 = in.m_63.y;
    float _1118 = in.m_63.z;
    int _1120 = _1112;
    if (!_1012)
    {
        int _1122 = ~_1096;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = _930 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1130 = !_752;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = _1046 * _1064;
    int _1136 = abs(_1102);
    float _1138 = _866 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1140 = abs(_1132);
    float _1142 = _1128 * _1080;
    float _1144 = _880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1148 = _1138 + _1146;
    float _1150 = float(_1126);
    out.m_65.x = _1134;
    out.m_65.y = _1106;
    out.m_65.z = _1142;
    out.m_65.w = _1098;
    float _1152 = float(_1136);
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1156 = _1144 + _1154;
    float _1158 = float(_1088);
    float _1160 = _884 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1162 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1164 = _1152 * _1150;
    float _1166 = _778 + (-0.5);
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1160 + _1168;
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1162);
    float _1174 = _1104 * (-2.0);
    float _1176 = _1164 * (-2.0);
    float _1178 = float(_1140);
    float _1180 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1172);
    float _1182 = fma(_1174, _1116, _1116);
    float _1184 = _1148 * _1148;
    float _1186 = fma(_918, _1174, _918);
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1182);
    bool _1190 = _1180 >= 0.0;
    float _1192 = fma(_1156, _1156, _1184);
    float _1194 = fma(_1186, _1004, _1188);
    float _1196 = _696 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1198 = fma(_1170, _1170, _1192);
    float _1200 = _1178 * _1158;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1204 = fma(_1176, _1118, _1118);
    float _1206 = rsqrt(_1198);
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1214 = _1144;
    if (_1190)
    {
        _1210 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1216 = _1210;
    float _1218 = fma(_1008, _1176, _1008);
    float _1220 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1222 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1190)
    {
        float _1228 = _1216 * 5.0;
        _1212 = as_type<int>(_1228);
    }
    int _1230 = _1212;
    float _1232 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1238 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1246 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1204);
    if (_1190)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4586 = as_type<float>(_1230);
        out.gl_Position.z = _4586;
    }
    float _1248 = _1148 * _1206;
    float _1250 = _1156 * _1206;
    float _1252 = fma(_1218, _1004, _1246);
    out.m_67.x = _1238;
    out.m_67.y = _1240;
    out.m_67.z = _1242;
    out.m_67.w = _1226;
    float _1254 = _1194 * 0.15915493667125701904296875;
    out.m_69.x = _1232;
    out.m_69.y = _1234;
    out.m_69.z = _1236;
    out.m_69.w = _1244;
    float _1256 = _1252;
    if (_1190)
    {
        out.m_47.x = 0.0;
    }
    if (_1190)
    {
        return out;
    }
    float _1258 = -_1248;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1138);
    float _1262 = _1170 * _1206;
    float _1264 = -_1250;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1268 = _160 + _778;
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1272 = _1260 + _1270;
    float _1274 = -_1262;
    float _1276 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1280 = _1266 + _1278;
    float _1282 = _1268 + (-1.0);
    float _1284 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1288 = _1276 + _1286;
    float _1290 = _1200 * (-2.0);
    float _1292 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1294 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1284);
    float _1296 = _160 + (-0.5);
    float _1298 = fma(_1290, _1114, _1114);
    float _1300 = -_1248;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1148);
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1294);
    float _1306 = fma(_1292, _1290, _1292);
    float _1308 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1298);
    float _1310 = -_1250;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1314 = _1302 * _1302;
    bool _1316 = _1304 >= 0.0;
    float _1318 = fma(_1306, _1004, _1308);
    float _1320 = -_1262;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1170);
    float _1324 = fma(_1312, _1312, _1314);
    float _1326 = _1252 * 0.15915493667125701904296875;
    float _1328 = _1318 * 0.15915493667125701904296875;
    float _1330 = _1254 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    float _1334 = fma(_1322, _1322, _1324);
    if (_1316)
    {
        _1256 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1336 = _1256;
    float _1338 = _1254 * 6.283185482025146484375;
    float _1340 = cos(_1338);
    int _1342 = as_type<int>(_1336);
    if (_1316)
    {
        out.m_47.x = 0.0;
    }
    if (_1316)
    {
        float _1344 = _1336 * 5.0;
        _1342 = as_type<int>(_1344);
    }
    int _1346 = _1342;
    float _1348 = _1326 * 6.283185482025146484375;
    float _1350 = sin(_1348);
    if (_1316)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4789 = as_type<float>(_1346);
        out.gl_Position.z = _4789;
    }
    float _1352 = _1326 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1328 * 6.283185482025146484375;
    float _1358 = sin(_1356);
    float _1360 = sqrt(_1334);
    if (_1316)
    {
        return out;
    }
    float _1362 = -_1138;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = -_1144;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1370 = _1328 * 6.283185482025146484375;
    float _1372 = cos(_1370);
    float _1374 = -_1160;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1378 = _1364 * _1364;
    float _1380 = _1340 * _1354;
    float _1382 = _1332 * _1350;
    float _1384 = _1206 * _1360;
    float _1386 = fma(_1368, _1368, _1378);
    float _1388 = _1340 * _1350;
    float _1390 = fma(_1358, _1382, _1380);
    float _1392 = fma(_1358, _1380, _1382);
    float _1394 = fma(_1376, _1376, _1386);
    float _1396 = _1332 * _1354;
    float _1398 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1400 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1402 = precise::clamp(_1400, 0.0, 1.0);
    float _1404 = rsqrt(_1394);
    float _1406 = _1350 * _1372;
    float _1408 = _1354 * _1372;
    float _1410 = _1332 * _1372;
    float _1412 = _1340 * _1372;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1416 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1414;
    float _1418 = in.m_71.x;
    float _1420 = in.m_71.y;
    float _1422 = in.m_71.z;
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1426 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1424;
    float _1428 = _1416 * _1416;
    float _1430 = -_1396;
    float _1432 = fma(_1358, _1388, _1430);
    float _1434 = -_1388;
    float _1436 = fma(_1358, _1396, _1434);
    float _1438 = _1384 * _1398;
    float _1440 = fma(_1402, -0.64999997615814208984375, 1.0);
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1444 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1442;
    float _1446 = _1368 * _1404;
    float _1448 = _1376 * _1404;
    float _1450 = _1364 * _1404;
    float _1452 = fma(_1426, _1426, _1428);
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1456 = _1446 * _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1460 = _1448 * _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1464 = _1450 * _1462;
    float _1466 = fma(_1444, _1444, _1452);
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1470 = -_1456;
    float _1472 = fma(_1448, _1468, _1470);
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1476 = -_1460;
    float _1478 = fma(_1450, _1474, _1476);
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1482 = -_1464;
    float _1484 = fma(_1446, _1480, _1482);
    float _1486 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1488 = _1472 * _1472;
    float _1490 = rsqrt(_1466);
    float _1492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1418);
    float _1494 = _1384 * _1486;
    float _1496 = fma(_1478, _1478, _1488);
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1420);
    float _1500 = _1492 * _1438;
    float _1502 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1504 = fma(_1484, _1484, _1496);
    float _1506 = sqrt(_1466);
    float _1508 = _1498 * _1494;
    float _1510 = _1384 * _1502;
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1422);
    bool _1514 = _1420 != 0.0;
    bool _1516 = isnan(_1420);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan(0.0);
    bool _1522 = _1518 || _1520;
    float _1524 = _1408 * _1508;
    float _1526 = _1392 * _1508;
    float _1528 = _1512 * _1510;
    float _1530 = rsqrt(_1504);
    float _1532 = _1436 * _1508;
    float _1534 = _1490 * (-0.20000000298023223876953125);
    float _1536 = fma(_1406, _1500, _1524);
    float _1538 = fma(_1432, _1500, _1526);
    float _1540 = fma(_1390, _1500, _1532);
    float _1542 = fma(_1426, _1534, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1544 = _1418 == 0.0;
    bool _1546 = !_1522;
    bool _1548 = _1544 && _1546;
    float _1550 = _1506 * 0.066666670143604278564453125;
    float _1552 = fma(_1410, _1528, _1540);
    float _1554 = fma(_1416, _1534, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1556 = -_1358;
    float _1558 = fma(_1556, _1528, _1536);
    float _1560 = fma(_1412, _1528, _1538);
    float _1562 = fma(_1444, _1534, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1564 = -_1554;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = precise::max(_1550, 1.0);
    float _1570 = _1484 * _1530;
    float _1572 = _1472 * _1530;
    float _1574 = _1478 * _1530;
    float _1576 = _1566 * _1566;
    float _1578 = _1446 * _1570;
    float _1580 = _1448 * _1572;
    float _1582 = precise::min(_1568, 2.0);
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1586 = _1554 + _1584;
    float _1588 = -_1578;
    float _1590 = fma(_1448, _1574, _1588);
    float _1592 = _1450 * _1574;
    float _1594 = -_1580;
    float _1596 = fma(_1450, _1570, _1594);
    float _1598 = _1582 * _1440;
    float _1600 = _1590 * _1558;
    float _1602 = -_1592;
    float _1604 = fma(_1446, _1572, _1602);
    float _1606 = _1596 * _1558;
    float _1608 = -_1542;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = fma(_1572, _1552, _1600);
    float _1614 = _1604 * _1558;
    float _1616 = fma(_1574, _1552, _1606);
    bool _1618 = _1422 == 0.0;
    bool _1620 = _1618 && _1548;
    float _1622 = fma(_1450, _1560, _1612);
    float _1624 = fma(_1570, _1552, _1614);
    float _1626 = fma(_1446, _1560, _1616);
    float _1628 = fma(_1610, _1610, _1576);
    float _1630 = _1138 + _1622;
    float _1632 = -_1562;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1636 = _1144 + _1626;
    float _1638 = in.m_73.x;
    float _1640 = in.m_73.y;
    float _1642 = in.m_73.z;
    float _1644 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1646 = _1630 + _1644;
    float _1648 = fma(_1448, _1560, _1624);
    float _1650 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1652 = _1636 + _1650;
    float _1654 = fma(_1634, _1634, _1628);
    float _1656 = fma(_1646, _1598, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1658 = _1160 + _1648;
    float _1660 = fma(_1652, _1598, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1664 = _1542 + _1662;
    float _1666 = -_1656;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1670 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1672 = _1658 + _1670;
    float _1674 = -_1660;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1678 = _1586 * _1586;
    float _1680 = _1668 * _1668;
    float _1682 = fma(_1672, _1598, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1686 = _1562 + _1684;
    float _1688 = fma(_1664, _1664, _1678);
    float _1690 = fma(_1676, _1676, _1680);
    float _1692 = -_1682;
    float _1694 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1696 = in.m_75.x;
    float _1698 = in.m_75.y;
    float _1700 = in.m_75.z;
    float _1702 = in.m_75.w;
    float _1704 = fma(_1686, _1686, _1688);
    float _1706 = sqrt(_1654);
    float _1708 = fma(_1694, _1694, _1690);
    float _1710 = _1406 * _1590;
    float _1712 = _1690;
    float _1714 = _1688;
    float _1716 = _1694;
    float _1718 = _1638;
    float _1720 = _1392;
    if (_1620)
    {
        _1712 = _1638;
    }
    float _1722 = _1712;
    float _1724 = _1406 * _1604;
    float _1726 = _1722;
    if (_1620)
    {
        _1714 = _1642;
    }
    float _1728 = _1714;
    float _1730 = _1728;
    if (!_1620)
    {
        float _1732 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1642);
        _1730 = _1732;
    }
    float _1734 = _1730;
    if (_1620)
    {
        _1716 = _1722;
    }
    float _1736 = _1716;
    float _1738 = sqrt(_1708);
    float _1740 = _1736;
    if (!_1620)
    {
        _1726 = _1638;
    }
    float _1742 = _1726;
    float _1744 = fma(_1390, _1570, _1724);
    if (_1620)
    {
        _1718 = _1640;
    }
    float _1746 = _1718;
    float _1748 = _1746;
    if (!_1620)
    {
        float _1750 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1640);
        _1748 = _1750;
    }
    float _1752 = _1748;
    if (!_1620)
    {
        float _1754 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1742);
        _1740 = _1754;
    }
    float _1756 = _1740;
    float _1758 = rsqrt(_1704);
    float _1760 = _1700 * _1742;
    float _1762 = _1698 * _1642;
    float _1764 = -_1706;
    float _1766 = _1738 + _1764;
    float _1768 = _1696 * _1640;
    float _1770 = -_1760;
    float _1772 = fma(_1696, _1642, _1770);
    float _1774 = -_1762;
    float _1776 = fma(_1700, _1640, _1774);
    float _1778 = _1408 * _1604;
    float _1780 = -_1768;
    float _1782 = fma(_1698, _1742, _1780);
    float _1784 = _1772 * _1702;
    float _1786 = _1776 * _1702;
    float _1788 = _1758 * _1766;
    float _1790 = _1782 * _1702;
    float _1792 = _1406 * _1596;
    float _1794 = _1408 * _1596;
    float _1796 = -_1788;
    float _1798 = fma(_1664, _1796, _1660);
    float _1800 = -_1788;
    float _1802 = fma(_1686, _1800, _1682);
    float _1804 = _1408 * _1590;
    float _1806 = -_1596;
    float _1808 = _1358 * _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1812 = _1798 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1816 = _1802 + _1814;
    float _1818 = -_1590;
    float _1820 = _1358 * _1818;
    float _1822 = -_1604;
    float _1824 = _1358 * _1822;
    float _1826 = _1812 * _1812;
    float _1828 = _1816 * _1816;
    float _1830 = fma(_1436, _1574, _1794);
    float _1832 = fma(_1436, _1572, _1804);
    float _1834 = fma(_1436, _1570, _1778);
    float _1836 = _1826 + _1828;
    float _1838 = fma(_1390, _1574, _1792);
    float _1840 = fma(_1390, _1572, _1710);
    float _1842 = fma(_1410, _1570, _1824);
    float _1844 = sqrt(_1836);
    float _1846 = fma(_1410, _1574, _1808);
    float _1848 = fma(_1410, _1572, _1820);
    float _1850 = fma(_1392, _1446, _1830);
    float _1852 = fma(_1392, _1450, _1832);
    float _1854 = fma(_1392, _1448, _1834);
    float _1856 = fma(_1432, _1446, _1838);
    float _1858 = fma(_1432, _1450, _1840);
    float _1860 = fma(_1432, _1448, _1744);
    float _1862 = fma(_1412, _1448, _1842);
    float _1864 = fma(_1412, _1446, _1846);
    float _1866 = fma(_1412, _1450, _1848);
    float _1868 = _1850 * _1698;
    float _1870 = _1852 * _1698;
    float _1872 = _1854 * _1698;
    float _1874 = _1850 * _1752;
    bool _1876 = _1844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1878 = _1784 * _1850;
    float _1880 = _1852 * _1752;
    float _1882 = _1784 * _1852;
    float _1884 = _1854 * _1752;
    float _1886 = _1784 * _1854;
    float _1888 = -_1788;
    float _1890 = fma(_1586, _1888, _1656);
    float _1892 = _1890;
    float _1894 = _1826;
    float _1896 = _1828;
    float _1898 = _1802;
    float _1900 = _1790;
    if (!_1876)
    {
        _1720 = _1798;
    }
    float _1902 = _1720;
    bool _1904 = !_1876;
    float _1906 = _1902;
    if (!_1904)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1912 = _1844 + _1910;
        float _1914 = rsqrt(_1836);
        float _1916 = _1912 * _1908;
        float _1918 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1920 = _1916 * 0.15915493667125701904296875;
        float _1922 = _1920 * 6.283185482025146484375;
        float _1924 = sin(_1922);
        float _1926 = _1920 * 6.283185482025146484375;
        float _1928 = cos(_1926);
        float _1930 = fma(_1924, _1918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1932 = _1914 * _1930;
        float _1934 = fma(_1812, _1932, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1936 = _1928 + (-1.0);
        float _1938 = fma(_1816, _1932, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1942 = _1934 + _1940;
        float _1944 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1948 = _1938 + _1946;
        float _1950 = _1942 * _1942;
        float _1952 = fma(_1890, _1928, _1944);
        float _1954 = _1948 * _1948;
        _1892 = _1952;
        _1894 = _1950;
        _1896 = _1954;
        _1906 = _1934;
        _1898 = _1938;
    }
    float _1956 = _1892;
    float _1958 = _1894;
    float _1960 = _1896;
    float _1962 = _1906;
    float _1964 = _1898;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1968 = _1956 + _1966;
    float _1970 = fma(_1856, _1756, _1874);
    float _1972 = fma(_1856, _1696, _1868);
    float _1974 = fma(_1858, _1696, _1870);
    float _1976 = fma(_1968, _1968, _1958);
    float _1978 = fma(_1858, _1756, _1880);
    float _1980 = fma(_1860, _1756, _1884);
    float _1982 = fma(_1786, _1856, _1878);
    float _1984 = _1976 + _1960;
    float _1986 = fma(_1860, _1696, _1872);
    float _1988 = fma(_1786, _1858, _1882);
    float _1990 = fma(_1786, _1860, _1886);
    float _1992 = fma(_1864, _1700, _1972);
    float _1994 = fma(_1866, _1700, _1974);
    float _1996 = sqrt(_1984);
    float _1998 = fma(_1864, _1734, _1970);
    float _2000 = fma(_1790, _1864, _1982);
    float _2002 = fma(_1866, _1734, _1978);
    float _2004 = fma(_1790, _1866, _1988);
    float _2006 = fma(_1790, _1862, _1990);
    float _2008 = fma(_1862, _1734, _1980);
    float _2010 = fma(_1862, _1700, _1986);
    out.m_69.x = _1232;
    out.m_69.y = _1234;
    out.m_69.z = _1236;
    out.m_69.w = _1244;
    out.m_67.x = _1238;
    out.m_67.y = _1240;
    out.m_67.z = _1242;
    out.m_67.w = _1226;
    out.m_77.x = _2000;
    out.m_77.y = _2004;
    out.m_77.z = _2006;
    bool _2012 = _1996 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2014 = isnan(_1996);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2020 = _2016 || _2018;
    out.m_79.x = _1998;
    out.m_79.y = _2002;
    out.m_79.z = _2008;
    out.m_81.x = _1992;
    out.m_81.y = _1994;
    out.m_81.z = _2010;
    float _2022 = _2010;
    float _2024 = _2000;
    float _2026 = _2004;
    if (!_2020)
    {
        _1900 = 1.0;
    }
    float _2028 = _1900;
    bool _2030 = !_2020;
    float _2032 = _2028;
    if (!_2030)
    {
        bool _2034 = _1996 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2036 = isnan(_1996);
        bool _2038 = _2034 || _2036;
        bool _2040 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2042 = _2038 || _2040;
        if (!_2042)
        {
            float _2044 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2046 = _1996 + _2044;
            float _2048 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2050 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2048;
            float _2052 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2054 = _2052 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2056 = 1.0 / _2050;
            float _2058 = _2046 * _2056;
            float _2060 = fma(_2058, _2054, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2032 = _2060;
            _2062 = true;
        }
        else
        {
            bool _2064 = _1996 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2066 = isnan(_1996);
            bool _2068 = _2064 || _2066;
            bool _2070 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2072 = _2068 || _2070;
            if (!_2072)
            {
                float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2076 = _1996 + _2074;
                float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2080 = _2078 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2084 = _2082 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2086 = 1.0 / _2080;
                float _2088 = _2076 * _2086;
                float _2090 = fma(_2088, _2084, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2032 = _2090;
                _2062 = true;
            }
            else
            {
                _2032 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2062 = false;
    float _2092 = _2032;
    float _2094 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2096 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2098 = _1962 + _2096;
    float _2100 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2094);
    float _2102 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2104 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2106 = _1956 + _2104;
    float _2108 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2100);
    bool _2110 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2112 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan(0.5);
    bool _2118 = _2114 || _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2122 = _1964 + _2120;
    bool _2124 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2128 = _2124 || _2126;
    bool _2130 = isnan(0.5);
    bool _2132 = _2128 || _2130;
    float _2134 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2136 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2102);
    float _2138 = fma(_2106, _2092, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2140 = fma(_2122, _2092, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2142 = 1.0 / _2134;
    float _2144 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2136);
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2148 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2132)
    {
        _2148 = 1.0;
    }
    float _2150 = _2148;
    float _2152 = _2146 + _2134;
    float _2154 = -_1248;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2138);
    float _2158 = _2152 * _2142;
    float _2160 = _2158 * 0.5;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2164 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2162);
    float _2166 = fma(_2098, _2092, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2168 = -_1262;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2140);
    float _2172 = 1.0 / _2164;
    float _2174 = -_1250;
    float _2176 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2166);
    float _2178 = _2156;
    float _2180 = _2176;
    float _2182 = _2170;
    float _2184 = _2166;
    float _2186 = _2150;
    if (!_2118)
    {
        float _2188 = _1272 * _1272;
        float _2190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2192 = -_1160;
        float _2194 = _2192 + _2140;
        float _2196 = -_1138;
        float _2198 = _2196 + _2138;
        float _2200 = fma(_1280, _1280, _2188);
        float _2202 = fma(_1288, _1288, _2200);
        float _2204 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2206 = sqrt(_2202);
        float _2208 = 1.0 / _1384;
        float _2210 = precise::min(_2206, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2212 = _2210 * _2190;
        float _2214 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2216 = _2212 * _2208;
        float _2218 = -_1144;
        float _2220 = _2218 + _2166;
        float _2222 = _2214 * _2216;
        float _2224 = _2194 * _2216;
        float _2226 = fma(_2220, _2222, _1266);
        float _2228 = fma(_2198, _2222, _1260);
        float _2230 = fma(_2214, _2224, _1276);
        _2178 = _2228;
        _2180 = _2226;
        _2182 = _2230;
    }
    float _2232 = _2178;
    float _2234 = _2180;
    float _2236 = _2182;
    if (_2132)
    {
        _2184 = 1.0;
    }
    float _2238 = _2184;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2242 = _2172 * _2240;
    float _2244 = _2238;
    if (!_2132)
    {
        float _2246 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2250 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2248;
        float _2252 = _2246 * 0.15915493667125701904296875;
        float _2254 = _2252 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2260 = _2258 * 0.15915493667125701904296875;
        float _2262 = _2252 * 6.283185482025146484375;
        float _2264 = sin(_2262);
        float _2266 = 1.0 / _2256;
        float _2268 = _2260 * 6.283185482025146484375;
        float _2270 = cos(_2268);
        float _2272 = _2264 * _2266;
        float _2274 = _2260 * 6.283185482025146484375;
        float _2276 = sin(_2274);
        float _2278 = _2270 * _2272;
        float _2280 = 1.0 / _2250;
        float _2282 = 1.0 / _2278;
        float _2284 = _2276 * _2282;
        float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2288 = fma(_2242, _2284, _2286);
        float _2290 = _2288 * _2280;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        _2022 = _2280;
        _2186 = _2292;
    }
    float _2294 = _2022;
    float _2296 = _2186;
    float _2298 = _2294;
    if (!_2132)
    {
        float _2300 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2302 = _2300 * 0.15915493667125701904296875;
        float _2304 = _2302 * 6.283185482025146484375;
        float _2306 = cos(_2304);
        float _2308 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2310 = _2308 * 0.15915493667125701904296875;
        float _2312 = _2302 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = 1.0 / _2306;
        float _2318 = _2310 * 6.283185482025146484375;
        float _2320 = cos(_2318);
        float _2322 = _2314 * _2316;
        float _2324 = _2310 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = _2320 * _2322;
        float _2330 = 1.0 / _2328;
        float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2334 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2332;
        float _2336 = 1.0 / _2334;
        float _2338 = _2326 * _2330;
        float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2342 = fma(_2242, _2338, _2340);
        float _2344 = _2342 * _2336;
        float _2346 = precise::clamp(_2344, 0.0, 1.0);
        float _2348 = -_2346;
        float _2350 = _2348 + 1.0;
        _2298 = _2306;
        _2244 = _2350;
    }
    float _2352 = _2298;
    float _2354 = _2244;
    float _2356 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2358 = _2232 + _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2362 = _2234 + _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2366 = _2236 + _2364;
    float _2368 = _2358 * _2358;
    float _2370 = fma(_2362, _2362, _2368);
    float _2372 = fma(_2366, _2366, _2370);
    float _2374 = rsqrt(_2372);
    float _2376 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2378 = _2362 * _2376;
    float _2380 = _2366 * _2376;
    float _2382 = _2378 * _2378;
    float _2384 = _2380 * _2380;
    float _2386 = _2382 + _2384;
    float _2388 = sqrt(_2386);
    bool _2390 = _2388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2394 = _2388 + _2392;
    float _2396 = _2366;
    float _2398 = _2386;
    float _2400 = _2394;
    float _2402 = _2378;
    if (_2390)
    {
        float _2404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2396 = _2404;
    }
    float _2406 = _2396;
    if (_2390)
    {
        float _2408 = rsqrt(_2386);
        _2398 = _2408;
    }
    float _2410 = _2398;
    float _2412 = _2410;
    if (_2390)
    {
        float _2414 = _2394 * _2406;
        _2400 = _2414;
    }
    float _2416 = _2400;
    if (_2390)
    {
        float _2418 = _2416 * 0.15915493667125701904296875;
        _2024 = _2418;
    }
    float _2420 = _2024;
    float _2422 = _2374;
    if (_2390)
    {
        float _2424 = _2420 * 6.283185482025146484375;
        float _2426 = sin(_2424);
        _2422 = _2426;
    }
    float _2428 = _2422;
    float _2430 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2432 = precise::max(0.0, _2430);
    float _2434 = _2352;
    float _2436 = _2432;
    float _2438 = _2430;
    if (_2390)
    {
        float _2440 = _2420 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        _2434 = _2442;
    }
    float _2444 = _2434;
    float _2446 = -_2376;
    float _2448 = -_2432;
    float _2450 = fma(_2358, _2446, _2448);
    if (_2390)
    {
        float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2436 = _2452;
    }
    float _2454 = _2436;
    float _2456 = sqrt(_2372);
    float _2458 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2460 = _2428;
    float _2462 = _2454;
    if (_2390)
    {
        float _2464 = fma(_2428, _2454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2460 = _2464;
    }
    float _2466 = _2460;
    float _2468 = _2466;
    if (!_2390)
    {
        _2462 = _2380;
    }
    float _2470 = _2462;
    float _2472 = _2470;
    if (_2390)
    {
        float _2474 = _2444 + (-1.0);
        _2438 = _2474;
    }
    float _2476 = _2438;
    float _2478 = _2476;
    if (_2390)
    {
        float _2480 = _2410 * _2466;
        _1214 = _2480;
    }
    float _2482 = _1214;
    if (!_2390)
    {
        _2468 = _2450;
    }
    float _2484 = _2468;
    float _2486 = _2484;
    if (_2390)
    {
        float _2488 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2026 = _2488;
    }
    float _2490 = _2026;
    if (_2390)
    {
        float _2492 = _2378 * _2482;
        _2402 = _2492;
    }
    float _2494 = _2402;
    if (!_2390)
    {
        _2412 = _2382;
    }
    float _2496 = _2412;
    float _2498 = _2496;
    if (_2390)
    {
        float _2500 = _2380 * _2482;
        _2472 = _2500;
    }
    float _2502 = _2472;
    if (_2390)
    {
        float _2504 = fma(_2450, _2444, _2490);
        _2486 = _2504;
    }
    float _2506 = _2486;
    if (_2390)
    {
        float _2508 = _2494 * _2494;
        _2498 = _2508;
    }
    float _2510 = _2498;
    if (!_2390)
    {
        _2478 = _2384;
    }
    float _2512 = _2478;
    float _2514 = _2512;
    if (_2390)
    {
        float _2516 = _2502 * _2502;
        _2514 = _2516;
    }
    float _2518 = _2514;
    float _2520 = fma(_2506, _2506, _2510);
    float _2522 = _2520 + _2518;
    float _2524 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2528 = fma(_2456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2526);
    float _2530 = precise::clamp(_2528, 0.0, 1.0);
    float _2532 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2534 = rsqrt(_2522);
    float _2536 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2524);
    float _2538 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2540 = -_2530;
    float _2542 = _2540 + 1.0;
    float _2544 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2546 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2536);
    float _2548 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2538);
    float _2550 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2544);
    float _2552 = _2546 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2554 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2548);
    float _2556 = abs(_2542);
    float _2558 = log2(_2556);
    float _2560 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2550);
    float _2562 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2458);
    float _2564 = _2554 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2566 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2568 = _2534 * _2494;
    float _2570 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2572 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2574 = _2534 * _2506;
    float _2576 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2578 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2562);
    float _2580 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2572);
    float _2582 = _2534 * _2502;
    float _2584 = -_2576;
    float _2586 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2584);
    float _2588 = _2578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2590 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2580);
    float _2592 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2594 = -_2582;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2586);
    float _2598 = -_2566;
    float _2600 = fma(_2598, _2532, 1.0);
    float _2602 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2590);
    float _2604 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2606 = fma(_2596, -0.5, 0.5);
    float _2608 = exp2(_2592);
    float _2610 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2612 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2604);
    float _2614 = fma(_2596, 0.5, 0.5);
    float _2616 = _2574 + 1.0;
    float _2618 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2610);
    float _2620 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2612);
    float _2622 = fma(_2614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2624 = log2(_2600);
    float _2626 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2618);
    float _2628 = fma(_2614, _2622, -0.212114393711090087890625);
    float _2630 = fma(_2614, _2628, 1.570728778839111328125);
    float _2632 = 1.0 / _2602;
    float _2634 = -_2574;
    float _2636 = fma(_2608, _2616, _2634);
    float _2638 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2620);
    float _2640 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2626);
    float _2642 = fma(_2636, 0.5, 0.5);
    float _2644 = sqrt(_2606);
    float _2646 = _2624 * 0.693147182464599609375;
    float _2648 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2650 = _2638 * _2632;
    float _2652 = _2640 * _2632;
    float _2654 = fma(_2650, 0.5, 0.5);
    float _2656 = fma(_2652, -0.5, 0.5);
    float _2658 = _2644 * 0.636619746685028076171875;
    float _2660 = -_2630;
    float _2662 = fma(_2658, _2660, 1.0);
    float3 _6897 = float3(_2654, _2656, _2648);
    float _2664 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6897, float3(0.0), isnan(_6897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6897, float3(0.0), isnan(_6897)), level(0.0)).x;
    float3 _6908 = float3(_2654, _2656, _2648);
    float4 _2667 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6908, float3(0.0), isnan(_6908)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6908, float3(0.0), isnan(_6908)), level(0.0)).xyzw;
    float _2669 = _2667.x;
    float _2671 = _2667.y;
    float _2673 = _2667.z;
    float _2675 = _2667.w;
    float2 _6925 = float2(_2662, _2642);
    float3 _2679 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6925, float2(0.0), isnan(_6925)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6925, float2(0.0), isnan(_6925)), level(0.0)).xyz;
    float _2681 = _2679.x;
    float _2683 = _2679.y;
    float _2685 = _2679.z;
    float _2687 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2689 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2691 = _2296 * _2354;
    bool _2693 = _2296 > 0.0;
    bool _2695 = isnan(_2296);
    bool _2697 = _2693 || _2695;
    bool _2699 = isnan(0.0);
    bool _2701 = _2697 || _2699;
    float _2703 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2689);
    float _2705 = exp2(_2687);
    float _2707 = _2691 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2709 = _2354 <= 0.0;
    bool _2711 = !_2701;
    bool _2713 = _2709 || _2711;
    float _2715 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2703);
    float _2717 = _2602 * 0.5;
    float _2719 = _248 * _2707;
    float _2721 = _2638 + _2602;
    float _2723 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2715);
    float _2725 = fma(_2640, -0.5, _2717);
    float _2727 = _2721 * 0.5;
    float _2729 = _2723 + _2602;
    out.gl_Position.x = _2638;
    out.gl_Position.y = _2640;
    out.gl_Position.z = _2723;
    out.gl_Position.w = _2602;
    float _2731 = _2719 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2733 = _2729 * 0.5;
    float _2735 = -_2705;
    float _2737 = _2735 + 1.0;
    out.m_47.x = _2731;
    float _2739 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2727;
    out.m_83.y = _2725;
    out.m_83.z = _2733;
    out.m_83.w = _2602;
    float _2741 = -_2739;
    float _2743 = _2741 + 1.0;
    float _2745 = _2739 * _2664;
    float _2747 = _2675 * _2743;
    float _2749 = _2675 * _2745;
    float _2751 = _2685 * _2745;
    float _2753 = fma(_2681, _2749, _2669);
    float _2755 = fma(_2683, _2749, _2671);
    float _2757 = fma(_2675, _2751, _2673);
    out.m_85.x = _2753;
    out.m_85.y = _2755;
    out.m_85.z = _2757;
    out.m_85.w = _2747;
    if (!_2713)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2759 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2759;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2062 = false;
    bool _720 = false;
    bool _488 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2816 = as_type<float>(_120);
        out.gl_Position.z = _2816;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = _138;
    if (_134)
    {
        float _142 = float(_104);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _138 >= _144;
    bool _148 = !_134;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2886 = as_type<float>(_158);
        out.gl_Position.z = _2886;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _172 = _170 != 0;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _164 * _162;
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _182 = _180 * 6.283185482025146484375;
    float _184 = floor(_180);
    float _186 = _182 * 0.15915493667125701904296875;
    bool _188 = !_168;
    int _190 = _188 ? 0 : 1;
    int _192 = abs(_190);
    float _194 = _186 * 6.283185482025146484375;
    float _196 = cos(_194);
    bool _198 = !_176;
    int _200 = _198 ? 0 : 1;
    bool _202 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _204 = abs(_200);
    float _206 = -_184;
    float _208 = _180 + _206;
    bool _210 = !_172;
    int _212 = _210 ? 0 : 1;
    float _214 = float(_192);
    int _216 = abs(_212);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _222 = _208 < 0.5;
    float _224 = float(_222);
    float _226 = fma(_196, 0.5, 0.5);
    float _228 = abs(_220);
    float _230 = _214 * _228;
    float _232 = float(_204);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = -_226;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = float(_216);
    float _244 = fma(_232, _240, _230);
    float _246 = abs(_236);
    float _248 = fma(_242, _246, _244);
    bool _250 = !_202;
    float _266;
    if (!_250)
    {
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_104);
        float _272 = 1.0 / _270;
        float _274 = _138 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _276 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = 1.0 / _292;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _306 = 1.0 / _300;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    float _312 = 1.0 / _296;
    float _314 = _280 * _302;
    bool _316 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_276);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = fma(_310, _314, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_330, _314, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = _284 * _306;
    bool _338 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_276);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_326;
    float _352 = _350 + 1.0;
    float _354 = _348 * _352;
    bool _356 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_276);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _288 * _312;
    bool _370 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_276);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = -_348;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = fma(_384, _314, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _396 = -_380;
    float _398 = _396 + 1.0;
    float _400 = _380 * _388;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = _366 * _398;
    float _412 = -_366;
    float _414 = _412 + 1.0;
    float _416 = fma(_392, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_404, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = _332 * _410;
    float _422 = _334 * _410;
    float _424 = _394 * _410;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _432 = fma(_408, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _442;
    float _446 = fma(_416, _400, _426);
    float _448 = fma(_436, _336, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_440, _336, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_444, _336, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_418, _400, _428);
    float _456 = fma(_432, _400, _430);
    float _458 = fma(_448, _354, _446);
    float _460 = fma(_450, _354, _454);
    float _462 = fma(_452, _354, _456);
    float _464 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].x, _458);
    float _466 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].y, _460);
    float _468 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    bool _470 = !_304;
    float _486;
    if (!_470)
    {
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _474 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_104);
        float _492 = 1.0 / _490;
        float _494 = _138 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _496 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _510 = _496 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _520;
    bool _524 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _526 = isnan(_496);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _514;
    bool _538 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _540 = 1.0 / _518;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _542;
    float _546 = 1.0 / _522;
    float _548 = _468 * _502;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _552 = _496 + _550;
    float _554 = _466 * _500;
    float _556 = _464 * _498;
    float _558 = _552 * _536;
    float _560 = _506 * _540;
    bool _562 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _564 = isnan(_496);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _574;
    bool _578 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _580 = isnan(_496);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _590;
    float _594 = fma(_544, _558, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _596 = fma(_576, _558, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = _510 * _546;
    float _600 = -_534;
    float _602 = _600 + 1.0;
    float _604 = -_588;
    float _606 = _604 + 1.0;
    float _608 = fma(_592, _558, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _610 = _572 * _602;
    float _612 = -_572;
    float _614 = _612 + 1.0;
    bool _616 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _618 = isnan(_496);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _632 = _588 * _614;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _638 = _626 * _606;
    float _640 = -_626;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _648 = _608 * _638;
    float _650 = _594 * _638;
    float _652 = _596 * _638;
    float _654 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[107].y, _648);
    float _656 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[107].x, _650);
    float _658 = fma(_630, _560, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _660;
    float _664 = fma(_636, _560, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _666 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[107].z, _652);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _668;
    float _672 = fma(_646, _560, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _674;
    float _678 = fma(_658, _632, _656);
    float _680 = fma(_662, _598, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _682 = fma(_670, _598, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _684 = fma(_664, _632, _654);
    float _686 = fma(_676, _598, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _688 = fma(_672, _632, _666);
    float _690 = fma(_680, _610, _678);
    float _692 = fma(_682, _610, _684);
    float _694 = fma(_686, _610, _688);
    float _696 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[110].x, _690);
    float _698 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[110].y, _692);
    float _700 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[110].z, _694);
    bool _702 = !_538;
    float _718;
    if (!_702)
    {
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _706 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_104);
        float _724 = 1.0 / _722;
        float _726 = _138 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = in.m_55.y;
    float _732 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _734 = log2(_732);
    float _736 = _160 * 2.0;
    float _738 = in.m_51.w;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _742 = _740 != 0;
    float _744 = in.m_44.x;
    float _746 = in.m_44.y;
    float _748 = in.m_44.z;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _752 = _750 != 0;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _760 = _758 != 0;
    float _762 = floor(_736);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _766 = _764 != 0;
    float _768 = in.m_57.x;
    float _770 = in.m_57.y;
    float _772 = in.m_57.z;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _776 = _774 != 0;
    float _778 = in.m_51.y;
    float _780 = _734 * _138;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _786 = in.m_59.x;
    float _788 = in.m_59.y;
    float _790 = in.m_59.z;
    float _792 = 1.0 / _784;
    float _794 = in.m_61.x;
    float _796 = in.m_61.y;
    float _798 = in.m_61.z;
    float _800 = -_730;
    float _802 = _800 + 1.0;
    float _804 = in.m_55.x;
    bool _806 = _738 > 0.5;
    float _808 = exp2(_780);
    float _810 = in.m_51.z;
    int _812 = _806 ? as_type<int>(_802) : as_type<int>(_730);
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _816 = _814 != 0;
    float _818 = _746 * _770;
    float _820 = _816 ? as_type<float>(_812) : _730;
    float _822 = fma(_744, _768, _818);
    bool _824 = _778 > 0.5;
    float _826 = _746 * _788;
    float _828 = _730;
    bool _830 = _766;
    int _832 = as_type<int>(_796);
    float _834 = _738;
    float _836 = _768;
    if (_766)
    {
        float _838 = _824 ? _802 : _730;
        _828 = _838;
    }
    float _840 = _828;
    if (_742)
    {
        bool _842 = _160 > 0.5;
        _830 = _842;
    }
    bool _844 = _830;
    float _846 = _746 * _796;
    float _848 = fma(_744, _786, _826);
    float _850 = -_808;
    float _852 = _850 + 1.0;
    bool _854 = _844;
    if (_742)
    {
        float _856 = -_804;
        float _858 = _856 + 1.0;
        _832 = as_type<int>(_858);
    }
    int _860 = _832;
    float _862 = fma(_744, _794, _846);
    if (!_742)
    {
        _834 = _804;
    }
    float _864 = _834;
    float _866 = fma(_748, _790, _848);
    float _868 = _810 * 2.0;
    float _870 = _864;
    if (_742)
    {
        float _872 = _844 ? as_type<float>(_860) : _804;
        _870 = _872;
    }
    float _874 = _870;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _878 = 1.0 + _876;
    float _880 = fma(_748, _772, _822);
    float _882 = _778 * 2.0;
    float _884 = fma(_748, _798, _862);
    float _886 = _778 + _810;
    float _888 = 1.0 / _878;
    int _890 = 0;
    if (_776)
    {
        float _892 = -_804;
        float _894 = _892 + 1.0;
        _890 = as_type<int>(_894);
    }
    int _896 = _890;
    float _898 = _886 + (-1.0);
    if (_776)
    {
        bool _900 = _810 > 0.5;
        _854 = _900;
    }
    bool _902 = _854;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _904;
    bool _908 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _910 = isnan(1.0);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _916 = _912 || _914;
    float _918 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _920 = floor(_868);
    if (!_776)
    {
        _836 = _804;
    }
    float _922 = _836;
    float _924 = _906 * _792;
    float _926 = _922;
    if (_776)
    {
        float _928 = _902 ? as_type<float>(_896) : _804;
        _926 = _928;
    }
    float _930 = _926;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _934 = _728 + _932;
    bool _936 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _938 = isnan(_728);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _160 + _810;
    bool _950 = _762 > 0.0;
    float _952 = floor(_882);
    bool _954 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _962 = _958 || _960;
    float _964 = fma(_924, _934, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _966 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _968 = isnan(_728);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = -_946;
    float _980 = _978 + 1.0;
    bool _982 = _762 >= 0.0;
    bool _984 = isnan(_762);
    bool _986 = _982 || _984;
    bool _988 = isnan(0.0);
    bool _990 = _986 || _988;
    float _992 = _948 + (-1.0);
    float _994 = _962 ? _852 : 0.0;
    float _996 = _976 * _980;
    float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1000 = _990 ? 0 : 1;
    if (_916)
    {
        float _1002 = _994 * _888;
        _140 = _1002;
    }
    float _1004 = _140;
    bool _1006 = _920 > 0.0;
    float _1008 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1010 = _964 * _996;
    bool _1012 = _952 > 0.0;
    float _1014 = -_976;
    float _1016 = _1014 + 1.0;
    bool _1018 = _952 >= 0.0;
    bool _1020 = isnan(_952);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1030 = ~_1000;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1010);
    int _1038 = _1034;
    if (!_950)
    {
        int _1040 = ~_1000;
        int _1042 = _1040 + 1;
        _1038 = _1042;
    }
    int _1044 = _1038;
    float _1046 = _874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1048 = !_756;
    int _1050 = _1048 ? 0 : 1;
    float _1052 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1036);
    bool _1054 = _920 >= 0.0;
    bool _1056 = isnan(_920);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan(0.0);
    bool _1062 = _1058 || _1060;
    float _1064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1066 = abs(_1050);
    float _1068 = _810 + (-0.5);
    int _1070 = _1062 ? 0 : 1;
    float _1072 = float(_1066);
    int _1074 = ~_1070;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1082 = _1078;
    if (!_1006)
    {
        int _1084 = ~_1070;
        int _1086 = _1084 + 1;
        _1082 = _1086;
    }
    int _1088 = _1082;
    float _1090 = _820 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1092 = float(_1044);
    float _1094 = _840 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1096 = _1026 ? 0 : 1;
    float _1098 = _1090 * _998;
    bool _1100 = !_760;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = _1072 * _1092;
    float _1106 = _1094 * _1028;
    int _1108 = ~_1096;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    float _1114 = in.m_63.x;
    float _1116 = in.m_63.y;
    float _1118 = in.m_63.z;
    int _1120 = _1112;
    if (!_1012)
    {
        int _1122 = ~_1096;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = _930 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1130 = !_752;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = _1046 * _1064;
    int _1136 = abs(_1102);
    float _1138 = _866 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1140 = abs(_1132);
    float _1142 = _1128 * _1080;
    float _1144 = _880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1148 = _1138 + _1146;
    float _1150 = float(_1126);
    out.m_65.x = _1134;
    out.m_65.y = _1106;
    out.m_65.z = _1142;
    out.m_65.w = _1098;
    float _1152 = float(_1136);
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1156 = _1144 + _1154;
    float _1158 = float(_1088);
    float _1160 = _884 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1162 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1164 = _1152 * _1150;
    float _1166 = _778 + (-0.5);
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1170 = _1160 + _1168;
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1162);
    float _1174 = _1104 * (-2.0);
    float _1176 = _1164 * (-2.0);
    float _1178 = float(_1140);
    float _1180 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1172);
    float _1182 = fma(_1174, _1116, _1116);
    float _1184 = _1148 * _1148;
    float _1186 = fma(_918, _1174, _918);
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1182);
    bool _1190 = _1180 >= 0.0;
    float _1192 = fma(_1156, _1156, _1184);
    float _1194 = fma(_1186, _1004, _1188);
    float _1196 = _696 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1198 = fma(_1170, _1170, _1192);
    float _1200 = _1178 * _1158;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1204 = fma(_1176, _1118, _1118);
    float _1206 = rsqrt(_1198);
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1214 = _1144;
    if (_1190)
    {
        _1210 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1216 = _1210;
    float _1218 = fma(_1008, _1176, _1008);
    float _1220 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1222 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1190)
    {
        float _1228 = _1216 * 5.0;
        _1212 = as_type<int>(_1228);
    }
    int _1230 = _1212;
    float _1232 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1238 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1246 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1204);
    if (_1190)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4586 = as_type<float>(_1230);
        out.gl_Position.z = _4586;
    }
    float _1248 = _1148 * _1206;
    float _1250 = _1156 * _1206;
    float _1252 = fma(_1218, _1004, _1246);
    out.m_67.x = _1238;
    out.m_67.y = _1240;
    out.m_67.z = _1242;
    out.m_67.w = _1226;
    float _1254 = _1194 * 0.15915493667125701904296875;
    out.m_69.x = _1232;
    out.m_69.y = _1234;
    out.m_69.z = _1236;
    out.m_69.w = _1244;
    float _1256 = _1252;
    if (_1190)
    {
        out.m_47.x = 0.0;
    }
    if (_1190)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1258 = -_1248;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1138);
    float _1262 = _1170 * _1206;
    float _1264 = -_1250;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1268 = _160 + _778;
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1272 = _1260 + _1270;
    float _1274 = -_1262;
    float _1276 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1280 = _1266 + _1278;
    float _1282 = _1268 + (-1.0);
    float _1284 = _1272 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1288 = _1276 + _1286;
    float _1290 = _1200 * (-2.0);
    float _1292 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1294 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1284);
    float _1296 = _160 + (-0.5);
    float _1298 = fma(_1290, _1114, _1114);
    float _1300 = -_1248;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1148);
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1294);
    float _1306 = fma(_1292, _1290, _1292);
    float _1308 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1298);
    float _1310 = -_1250;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1314 = _1302 * _1302;
    bool _1316 = _1304 >= 0.0;
    float _1318 = fma(_1306, _1004, _1308);
    float _1320 = -_1262;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1170);
    float _1324 = fma(_1312, _1312, _1314);
    float _1326 = _1252 * 0.15915493667125701904296875;
    float _1328 = _1318 * 0.15915493667125701904296875;
    float _1330 = _1254 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    float _1334 = fma(_1322, _1322, _1324);
    if (_1316)
    {
        _1256 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1336 = _1256;
    float _1338 = _1254 * 6.283185482025146484375;
    float _1340 = cos(_1338);
    int _1342 = as_type<int>(_1336);
    if (_1316)
    {
        out.m_47.x = 0.0;
    }
    if (_1316)
    {
        float _1344 = _1336 * 5.0;
        _1342 = as_type<int>(_1344);
    }
    int _1346 = _1342;
    float _1348 = _1326 * 6.283185482025146484375;
    float _1350 = sin(_1348);
    if (_1316)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4789 = as_type<float>(_1346);
        out.gl_Position.z = _4789;
    }
    float _1352 = _1326 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1328 * 6.283185482025146484375;
    float _1358 = sin(_1356);
    float _1360 = sqrt(_1334);
    if (_1316)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1362 = -_1138;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = -_1144;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1370 = _1328 * 6.283185482025146484375;
    float _1372 = cos(_1370);
    float _1374 = -_1160;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1378 = _1364 * _1364;
    float _1380 = _1340 * _1354;
    float _1382 = _1332 * _1350;
    float _1384 = _1206 * _1360;
    float _1386 = fma(_1368, _1368, _1378);
    float _1388 = _1340 * _1350;
    float _1390 = fma(_1358, _1382, _1380);
    float _1392 = fma(_1358, _1380, _1382);
    float _1394 = fma(_1376, _1376, _1386);
    float _1396 = _1332 * _1354;
    float _1398 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1400 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1402 = precise::clamp(_1400, 0.0, 1.0);
    float _1404 = rsqrt(_1394);
    float _1406 = _1350 * _1372;
    float _1408 = _1354 * _1372;
    float _1410 = _1332 * _1372;
    float _1412 = _1340 * _1372;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1416 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1414;
    float _1418 = in.m_71.x;
    float _1420 = in.m_71.y;
    float _1422 = in.m_71.z;
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1426 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1424;
    float _1428 = _1416 * _1416;
    float _1430 = -_1396;
    float _1432 = fma(_1358, _1388, _1430);
    float _1434 = -_1388;
    float _1436 = fma(_1358, _1396, _1434);
    float _1438 = _1384 * _1398;
    float _1440 = fma(_1402, -0.64999997615814208984375, 1.0);
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1444 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1442;
    float _1446 = _1368 * _1404;
    float _1448 = _1376 * _1404;
    float _1450 = _1364 * _1404;
    float _1452 = fma(_1426, _1426, _1428);
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1456 = _1446 * _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1460 = _1448 * _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1464 = _1450 * _1462;
    float _1466 = fma(_1444, _1444, _1452);
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1470 = -_1456;
    float _1472 = fma(_1448, _1468, _1470);
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1476 = -_1460;
    float _1478 = fma(_1450, _1474, _1476);
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1482 = -_1464;
    float _1484 = fma(_1446, _1480, _1482);
    float _1486 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1488 = _1472 * _1472;
    float _1490 = rsqrt(_1466);
    float _1492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1418);
    float _1494 = _1384 * _1486;
    float _1496 = fma(_1478, _1478, _1488);
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1420);
    float _1500 = _1492 * _1438;
    float _1502 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1504 = fma(_1484, _1484, _1496);
    float _1506 = sqrt(_1466);
    float _1508 = _1498 * _1494;
    float _1510 = _1384 * _1502;
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1422);
    bool _1514 = _1420 != 0.0;
    bool _1516 = isnan(_1420);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan(0.0);
    bool _1522 = _1518 || _1520;
    float _1524 = _1408 * _1508;
    float _1526 = _1392 * _1508;
    float _1528 = _1512 * _1510;
    float _1530 = rsqrt(_1504);
    float _1532 = _1436 * _1508;
    float _1534 = _1490 * (-0.20000000298023223876953125);
    float _1536 = fma(_1406, _1500, _1524);
    float _1538 = fma(_1432, _1500, _1526);
    float _1540 = fma(_1390, _1500, _1532);
    float _1542 = fma(_1426, _1534, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _1544 = _1418 == 0.0;
    bool _1546 = !_1522;
    bool _1548 = _1544 && _1546;
    float _1550 = _1506 * 0.066666670143604278564453125;
    float _1552 = fma(_1410, _1528, _1540);
    float _1554 = fma(_1416, _1534, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1556 = -_1358;
    float _1558 = fma(_1556, _1528, _1536);
    float _1560 = fma(_1412, _1528, _1538);
    float _1562 = fma(_1444, _1534, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1564 = -_1554;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = precise::max(_1550, 1.0);
    float _1570 = _1484 * _1530;
    float _1572 = _1472 * _1530;
    float _1574 = _1478 * _1530;
    float _1576 = _1566 * _1566;
    float _1578 = _1446 * _1570;
    float _1580 = _1448 * _1572;
    float _1582 = precise::min(_1568, 2.0);
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1586 = _1554 + _1584;
    float _1588 = -_1578;
    float _1590 = fma(_1448, _1574, _1588);
    float _1592 = _1450 * _1574;
    float _1594 = -_1580;
    float _1596 = fma(_1450, _1570, _1594);
    float _1598 = _1582 * _1440;
    float _1600 = _1590 * _1558;
    float _1602 = -_1592;
    float _1604 = fma(_1446, _1572, _1602);
    float _1606 = _1596 * _1558;
    float _1608 = -_1542;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = fma(_1572, _1552, _1600);
    float _1614 = _1604 * _1558;
    float _1616 = fma(_1574, _1552, _1606);
    bool _1618 = _1422 == 0.0;
    bool _1620 = _1618 && _1548;
    float _1622 = fma(_1450, _1560, _1612);
    float _1624 = fma(_1570, _1552, _1614);
    float _1626 = fma(_1446, _1560, _1616);
    float _1628 = fma(_1610, _1610, _1576);
    float _1630 = _1138 + _1622;
    float _1632 = -_1562;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1636 = _1144 + _1626;
    float _1638 = in.m_73.x;
    float _1640 = in.m_73.y;
    float _1642 = in.m_73.z;
    float _1644 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1646 = _1630 + _1644;
    float _1648 = fma(_1448, _1560, _1624);
    float _1650 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1652 = _1636 + _1650;
    float _1654 = fma(_1634, _1634, _1628);
    float _1656 = fma(_1646, _1598, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1658 = _1160 + _1648;
    float _1660 = fma(_1652, _1598, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1664 = _1542 + _1662;
    float _1666 = -_1656;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1670 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1672 = _1658 + _1670;
    float _1674 = -_1660;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1678 = _1586 * _1586;
    float _1680 = _1668 * _1668;
    float _1682 = fma(_1672, _1598, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1686 = _1562 + _1684;
    float _1688 = fma(_1664, _1664, _1678);
    float _1690 = fma(_1676, _1676, _1680);
    float _1692 = -_1682;
    float _1694 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1696 = in.m_75.x;
    float _1698 = in.m_75.y;
    float _1700 = in.m_75.z;
    float _1702 = in.m_75.w;
    float _1704 = fma(_1686, _1686, _1688);
    float _1706 = sqrt(_1654);
    float _1708 = fma(_1694, _1694, _1690);
    float _1710 = _1406 * _1590;
    float _1712 = _1690;
    float _1714 = _1688;
    float _1716 = _1694;
    float _1718 = _1638;
    float _1720 = _1392;
    if (_1620)
    {
        _1712 = _1638;
    }
    float _1722 = _1712;
    float _1724 = _1406 * _1604;
    float _1726 = _1722;
    if (_1620)
    {
        _1714 = _1642;
    }
    float _1728 = _1714;
    float _1730 = _1728;
    if (!_1620)
    {
        float _1732 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1642);
        _1730 = _1732;
    }
    float _1734 = _1730;
    if (_1620)
    {
        _1716 = _1722;
    }
    float _1736 = _1716;
    float _1738 = sqrt(_1708);
    float _1740 = _1736;
    if (!_1620)
    {
        _1726 = _1638;
    }
    float _1742 = _1726;
    float _1744 = fma(_1390, _1570, _1724);
    if (_1620)
    {
        _1718 = _1640;
    }
    float _1746 = _1718;
    float _1748 = _1746;
    if (!_1620)
    {
        float _1750 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1640);
        _1748 = _1750;
    }
    float _1752 = _1748;
    if (!_1620)
    {
        float _1754 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1742);
        _1740 = _1754;
    }
    float _1756 = _1740;
    float _1758 = rsqrt(_1704);
    float _1760 = _1700 * _1742;
    float _1762 = _1698 * _1642;
    float _1764 = -_1706;
    float _1766 = _1738 + _1764;
    float _1768 = _1696 * _1640;
    float _1770 = -_1760;
    float _1772 = fma(_1696, _1642, _1770);
    float _1774 = -_1762;
    float _1776 = fma(_1700, _1640, _1774);
    float _1778 = _1408 * _1604;
    float _1780 = -_1768;
    float _1782 = fma(_1698, _1742, _1780);
    float _1784 = _1772 * _1702;
    float _1786 = _1776 * _1702;
    float _1788 = _1758 * _1766;
    float _1790 = _1782 * _1702;
    float _1792 = _1406 * _1596;
    float _1794 = _1408 * _1596;
    float _1796 = -_1788;
    float _1798 = fma(_1664, _1796, _1660);
    float _1800 = -_1788;
    float _1802 = fma(_1686, _1800, _1682);
    float _1804 = _1408 * _1590;
    float _1806 = -_1596;
    float _1808 = _1358 * _1806;
    float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1812 = _1798 + _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1816 = _1802 + _1814;
    float _1818 = -_1590;
    float _1820 = _1358 * _1818;
    float _1822 = -_1604;
    float _1824 = _1358 * _1822;
    float _1826 = _1812 * _1812;
    float _1828 = _1816 * _1816;
    float _1830 = fma(_1436, _1574, _1794);
    float _1832 = fma(_1436, _1572, _1804);
    float _1834 = fma(_1436, _1570, _1778);
    float _1836 = _1826 + _1828;
    float _1838 = fma(_1390, _1574, _1792);
    float _1840 = fma(_1390, _1572, _1710);
    float _1842 = fma(_1410, _1570, _1824);
    float _1844 = sqrt(_1836);
    float _1846 = fma(_1410, _1574, _1808);
    float _1848 = fma(_1410, _1572, _1820);
    float _1850 = fma(_1392, _1446, _1830);
    float _1852 = fma(_1392, _1450, _1832);
    float _1854 = fma(_1392, _1448, _1834);
    float _1856 = fma(_1432, _1446, _1838);
    float _1858 = fma(_1432, _1450, _1840);
    float _1860 = fma(_1432, _1448, _1744);
    float _1862 = fma(_1412, _1448, _1842);
    float _1864 = fma(_1412, _1446, _1846);
    float _1866 = fma(_1412, _1450, _1848);
    float _1868 = _1850 * _1698;
    float _1870 = _1852 * _1698;
    float _1872 = _1854 * _1698;
    float _1874 = _1850 * _1752;
    bool _1876 = _1844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1878 = _1784 * _1850;
    float _1880 = _1852 * _1752;
    float _1882 = _1784 * _1852;
    float _1884 = _1854 * _1752;
    float _1886 = _1784 * _1854;
    float _1888 = -_1788;
    float _1890 = fma(_1586, _1888, _1656);
    float _1892 = _1890;
    float _1894 = _1826;
    float _1896 = _1828;
    float _1898 = _1802;
    float _1900 = _1790;
    if (!_1876)
    {
        _1720 = _1798;
    }
    float _1902 = _1720;
    bool _1904 = !_1876;
    float _1906 = _1902;
    if (!_1904)
    {
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1912 = _1844 + _1910;
        float _1914 = rsqrt(_1836);
        float _1916 = _1912 * _1908;
        float _1918 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1920 = _1916 * 0.15915493667125701904296875;
        float _1922 = _1920 * 6.283185482025146484375;
        float _1924 = sin(_1922);
        float _1926 = _1920 * 6.283185482025146484375;
        float _1928 = cos(_1926);
        float _1930 = fma(_1924, _1918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1932 = _1914 * _1930;
        float _1934 = fma(_1812, _1932, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1936 = _1928 + (-1.0);
        float _1938 = fma(_1816, _1932, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1942 = _1934 + _1940;
        float _1944 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1948 = _1938 + _1946;
        float _1950 = _1942 * _1942;
        float _1952 = fma(_1890, _1928, _1944);
        float _1954 = _1948 * _1948;
        _1892 = _1952;
        _1894 = _1950;
        _1896 = _1954;
        _1906 = _1934;
        _1898 = _1938;
    }
    float _1956 = _1892;
    float _1958 = _1894;
    float _1960 = _1896;
    float _1962 = _1906;
    float _1964 = _1898;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1968 = _1956 + _1966;
    float _1970 = fma(_1856, _1756, _1874);
    float _1972 = fma(_1856, _1696, _1868);
    float _1974 = fma(_1858, _1696, _1870);
    float _1976 = fma(_1968, _1968, _1958);
    float _1978 = fma(_1858, _1756, _1880);
    float _1980 = fma(_1860, _1756, _1884);
    float _1982 = fma(_1786, _1856, _1878);
    float _1984 = _1976 + _1960;
    float _1986 = fma(_1860, _1696, _1872);
    float _1988 = fma(_1786, _1858, _1882);
    float _1990 = fma(_1786, _1860, _1886);
    float _1992 = fma(_1864, _1700, _1972);
    float _1994 = fma(_1866, _1700, _1974);
    float _1996 = sqrt(_1984);
    float _1998 = fma(_1864, _1734, _1970);
    float _2000 = fma(_1790, _1864, _1982);
    float _2002 = fma(_1866, _1734, _1978);
    float _2004 = fma(_1790, _1866, _1988);
    float _2006 = fma(_1790, _1862, _1990);
    float _2008 = fma(_1862, _1734, _1980);
    float _2010 = fma(_1862, _1700, _1986);
    out.m_69.x = _1232;
    out.m_69.y = _1234;
    out.m_69.z = _1236;
    out.m_69.w = _1244;
    out.m_67.x = _1238;
    out.m_67.y = _1240;
    out.m_67.z = _1242;
    out.m_67.w = _1226;
    out.m_77.x = _2000;
    out.m_77.y = _2004;
    out.m_77.z = _2006;
    bool _2012 = _1996 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2014 = isnan(_1996);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2020 = _2016 || _2018;
    out.m_79.x = _1998;
    out.m_79.y = _2002;
    out.m_79.z = _2008;
    out.m_81.x = _1992;
    out.m_81.y = _1994;
    out.m_81.z = _2010;
    float _2022 = _2010;
    float _2024 = _2000;
    float _2026 = _2004;
    if (!_2020)
    {
        _1900 = 1.0;
    }
    float _2028 = _1900;
    bool _2030 = !_2020;
    float _2032 = _2028;
    if (!_2030)
    {
        bool _2034 = _1996 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2036 = isnan(_1996);
        bool _2038 = _2034 || _2036;
        bool _2040 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2042 = _2038 || _2040;
        if (!_2042)
        {
            float _2044 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2046 = _1996 + _2044;
            float _2048 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2050 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2048;
            float _2052 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2054 = _2052 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2056 = 1.0 / _2050;
            float _2058 = _2046 * _2056;
            float _2060 = fma(_2058, _2054, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2032 = _2060;
            _2062 = true;
        }
        else
        {
            bool _2064 = _1996 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2066 = isnan(_1996);
            bool _2068 = _2064 || _2066;
            bool _2070 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2072 = _2068 || _2070;
            if (!_2072)
            {
                float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2076 = _1996 + _2074;
                float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2080 = _2078 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2084 = _2082 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2086 = 1.0 / _2080;
                float _2088 = _2076 * _2086;
                float _2090 = fma(_2088, _2084, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2032 = _2090;
                _2062 = true;
            }
            else
            {
                _2032 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2062 = false;
    float _2092 = _2032;
    float _2094 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2096 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2098 = _1962 + _2096;
    float _2100 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2094);
    float _2102 = _1260 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2104 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2106 = _1956 + _2104;
    float _2108 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2100);
    bool _2110 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2112 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan(0.5);
    bool _2118 = _2114 || _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2122 = _1964 + _2120;
    bool _2124 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2128 = _2124 || _2126;
    bool _2130 = isnan(0.5);
    bool _2132 = _2128 || _2130;
    float _2134 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2136 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2102);
    float _2138 = fma(_2106, _2092, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2140 = fma(_2122, _2092, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2142 = 1.0 / _2134;
    float _2144 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2136);
    float _2146 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2148 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2132)
    {
        _2148 = 1.0;
    }
    float _2150 = _2148;
    float _2152 = _2146 + _2134;
    float _2154 = -_1248;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2138);
    float _2158 = _2152 * _2142;
    float _2160 = _2158 * 0.5;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2164 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2162);
    float _2166 = fma(_2098, _2092, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2168 = -_1262;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2140);
    float _2172 = 1.0 / _2164;
    float _2174 = -_1250;
    float _2176 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2166);
    float _2178 = _2156;
    float _2180 = _2176;
    float _2182 = _2170;
    float _2184 = _2166;
    float _2186 = _2150;
    if (!_2118)
    {
        float _2188 = _1272 * _1272;
        float _2190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2192 = -_1160;
        float _2194 = _2192 + _2140;
        float _2196 = -_1138;
        float _2198 = _2196 + _2138;
        float _2200 = fma(_1280, _1280, _2188);
        float _2202 = fma(_1288, _1288, _2200);
        float _2204 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2206 = sqrt(_2202);
        float _2208 = 1.0 / _1384;
        float _2210 = precise::min(_2206, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2212 = _2210 * _2190;
        float _2214 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2216 = _2212 * _2208;
        float _2218 = -_1144;
        float _2220 = _2218 + _2166;
        float _2222 = _2214 * _2216;
        float _2224 = _2194 * _2216;
        float _2226 = fma(_2220, _2222, _1266);
        float _2228 = fma(_2198, _2222, _1260);
        float _2230 = fma(_2214, _2224, _1276);
        _2178 = _2228;
        _2180 = _2226;
        _2182 = _2230;
    }
    float _2232 = _2178;
    float _2234 = _2180;
    float _2236 = _2182;
    if (_2132)
    {
        _2184 = 1.0;
    }
    float _2238 = _2184;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2242 = _2172 * _2240;
    float _2244 = _2238;
    if (!_2132)
    {
        float _2246 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2250 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2248;
        float _2252 = _2246 * 0.15915493667125701904296875;
        float _2254 = _2252 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2260 = _2258 * 0.15915493667125701904296875;
        float _2262 = _2252 * 6.283185482025146484375;
        float _2264 = sin(_2262);
        float _2266 = 1.0 / _2256;
        float _2268 = _2260 * 6.283185482025146484375;
        float _2270 = cos(_2268);
        float _2272 = _2264 * _2266;
        float _2274 = _2260 * 6.283185482025146484375;
        float _2276 = sin(_2274);
        float _2278 = _2270 * _2272;
        float _2280 = 1.0 / _2250;
        float _2282 = 1.0 / _2278;
        float _2284 = _2276 * _2282;
        float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2288 = fma(_2242, _2284, _2286);
        float _2290 = _2288 * _2280;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        _2022 = _2280;
        _2186 = _2292;
    }
    float _2294 = _2022;
    float _2296 = _2186;
    float _2298 = _2294;
    if (!_2132)
    {
        float _2300 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2302 = _2300 * 0.15915493667125701904296875;
        float _2304 = _2302 * 6.283185482025146484375;
        float _2306 = cos(_2304);
        float _2308 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2310 = _2308 * 0.15915493667125701904296875;
        float _2312 = _2302 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = 1.0 / _2306;
        float _2318 = _2310 * 6.283185482025146484375;
        float _2320 = cos(_2318);
        float _2322 = _2314 * _2316;
        float _2324 = _2310 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = _2320 * _2322;
        float _2330 = 1.0 / _2328;
        float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2334 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2332;
        float _2336 = 1.0 / _2334;
        float _2338 = _2326 * _2330;
        float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2342 = fma(_2242, _2338, _2340);
        float _2344 = _2342 * _2336;
        float _2346 = precise::clamp(_2344, 0.0, 1.0);
        float _2348 = -_2346;
        float _2350 = _2348 + 1.0;
        _2298 = _2306;
        _2244 = _2350;
    }
    float _2352 = _2298;
    float _2354 = _2244;
    float _2356 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2358 = _2232 + _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2362 = _2234 + _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2366 = _2236 + _2364;
    float _2368 = _2358 * _2358;
    float _2370 = fma(_2362, _2362, _2368);
    float _2372 = fma(_2366, _2366, _2370);
    float _2374 = rsqrt(_2372);
    float _2376 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2378 = _2362 * _2376;
    float _2380 = _2366 * _2376;
    float _2382 = _2378 * _2378;
    float _2384 = _2380 * _2380;
    float _2386 = _2382 + _2384;
    float _2388 = sqrt(_2386);
    bool _2390 = _2388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2394 = _2388 + _2392;
    float _2396 = _2366;
    float _2398 = _2386;
    float _2400 = _2394;
    float _2402 = _2378;
    if (_2390)
    {
        float _2404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2396 = _2404;
    }
    float _2406 = _2396;
    if (_2390)
    {
        float _2408 = rsqrt(_2386);
        _2398 = _2408;
    }
    float _2410 = _2398;
    float _2412 = _2410;
    if (_2390)
    {
        float _2414 = _2394 * _2406;
        _2400 = _2414;
    }
    float _2416 = _2400;
    if (_2390)
    {
        float _2418 = _2416 * 0.15915493667125701904296875;
        _2024 = _2418;
    }
    float _2420 = _2024;
    float _2422 = _2374;
    if (_2390)
    {
        float _2424 = _2420 * 6.283185482025146484375;
        float _2426 = sin(_2424);
        _2422 = _2426;
    }
    float _2428 = _2422;
    float _2430 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2432 = precise::max(0.0, _2430);
    float _2434 = _2352;
    float _2436 = _2432;
    float _2438 = _2430;
    if (_2390)
    {
        float _2440 = _2420 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        _2434 = _2442;
    }
    float _2444 = _2434;
    float _2446 = -_2376;
    float _2448 = -_2432;
    float _2450 = fma(_2358, _2446, _2448);
    if (_2390)
    {
        float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2436 = _2452;
    }
    float _2454 = _2436;
    float _2456 = sqrt(_2372);
    float _2458 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2460 = _2428;
    float _2462 = _2454;
    if (_2390)
    {
        float _2464 = fma(_2428, _2454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2460 = _2464;
    }
    float _2466 = _2460;
    float _2468 = _2466;
    if (!_2390)
    {
        _2462 = _2380;
    }
    float _2470 = _2462;
    float _2472 = _2470;
    if (_2390)
    {
        float _2474 = _2444 + (-1.0);
        _2438 = _2474;
    }
    float _2476 = _2438;
    float _2478 = _2476;
    if (_2390)
    {
        float _2480 = _2410 * _2466;
        _1214 = _2480;
    }
    float _2482 = _1214;
    if (!_2390)
    {
        _2468 = _2450;
    }
    float _2484 = _2468;
    float _2486 = _2484;
    if (_2390)
    {
        float _2488 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2026 = _2488;
    }
    float _2490 = _2026;
    if (_2390)
    {
        float _2492 = _2378 * _2482;
        _2402 = _2492;
    }
    float _2494 = _2402;
    if (!_2390)
    {
        _2412 = _2382;
    }
    float _2496 = _2412;
    float _2498 = _2496;
    if (_2390)
    {
        float _2500 = _2380 * _2482;
        _2472 = _2500;
    }
    float _2502 = _2472;
    if (_2390)
    {
        float _2504 = fma(_2450, _2444, _2490);
        _2486 = _2504;
    }
    float _2506 = _2486;
    if (_2390)
    {
        float _2508 = _2494 * _2494;
        _2498 = _2508;
    }
    float _2510 = _2498;
    if (!_2390)
    {
        _2478 = _2384;
    }
    float _2512 = _2478;
    float _2514 = _2512;
    if (_2390)
    {
        float _2516 = _2502 * _2502;
        _2514 = _2516;
    }
    float _2518 = _2514;
    float _2520 = fma(_2506, _2506, _2510);
    float _2522 = _2520 + _2518;
    float _2524 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2528 = fma(_2456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2526);
    float _2530 = precise::clamp(_2528, 0.0, 1.0);
    float _2532 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2534 = rsqrt(_2522);
    float _2536 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2524);
    float _2538 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2540 = -_2530;
    float _2542 = _2540 + 1.0;
    float _2544 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2546 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2536);
    float _2548 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2538);
    float _2550 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2544);
    float _2552 = _2546 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2554 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2548);
    float _2556 = abs(_2542);
    float _2558 = log2(_2556);
    float _2560 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2550);
    float _2562 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2458);
    float _2564 = _2554 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2566 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2568 = _2534 * _2494;
    float _2570 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2572 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2574 = _2534 * _2506;
    float _2576 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2578 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2562);
    float _2580 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2572);
    float _2582 = _2534 * _2502;
    float _2584 = -_2576;
    float _2586 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2584);
    float _2588 = _2578 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2590 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2580);
    float _2592 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2594 = -_2582;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2586);
    float _2598 = -_2566;
    float _2600 = fma(_2598, _2532, 1.0);
    float _2602 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2590);
    float _2604 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2606 = fma(_2596, -0.5, 0.5);
    float _2608 = exp2(_2592);
    float _2610 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2612 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2604);
    float _2614 = fma(_2596, 0.5, 0.5);
    float _2616 = _2574 + 1.0;
    float _2618 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2610);
    float _2620 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2612);
    float _2622 = fma(_2614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2624 = log2(_2600);
    float _2626 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2618);
    float _2628 = fma(_2614, _2622, -0.212114393711090087890625);
    float _2630 = fma(_2614, _2628, 1.570728778839111328125);
    float _2632 = 1.0 / _2602;
    float _2634 = -_2574;
    float _2636 = fma(_2608, _2616, _2634);
    float _2638 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2620);
    float _2640 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2626);
    float _2642 = fma(_2636, 0.5, 0.5);
    float _2644 = sqrt(_2606);
    float _2646 = _2624 * 0.693147182464599609375;
    float _2648 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2650 = _2638 * _2632;
    float _2652 = _2640 * _2632;
    float _2654 = fma(_2650, 0.5, 0.5);
    float _2656 = fma(_2652, -0.5, 0.5);
    float _2658 = _2644 * 0.636619746685028076171875;
    float _2660 = -_2630;
    float _2662 = fma(_2658, _2660, 1.0);
    float3 _6897 = float3(_2654, _2656, _2648);
    float _2664 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6897, float3(0.0), isnan(_6897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6897, float3(0.0), isnan(_6897)), level(0.0)).x;
    float3 _6908 = float3(_2654, _2656, _2648);
    float4 _2667 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6908, float3(0.0), isnan(_6908)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6908, float3(0.0), isnan(_6908)), level(0.0)).xyzw;
    float _2669 = _2667.x;
    float _2671 = _2667.y;
    float _2673 = _2667.z;
    float _2675 = _2667.w;
    float2 _6925 = float2(_2662, _2642);
    float3 _2679 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6925, float2(0.0), isnan(_6925)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6925, float2(0.0), isnan(_6925)), level(0.0)).xyz;
    float _2681 = _2679.x;
    float _2683 = _2679.y;
    float _2685 = _2679.z;
    float _2687 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2689 = _2564 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2691 = _2296 * _2354;
    bool _2693 = _2296 > 0.0;
    bool _2695 = isnan(_2296);
    bool _2697 = _2693 || _2695;
    bool _2699 = isnan(0.0);
    bool _2701 = _2697 || _2699;
    float _2703 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2689);
    float _2705 = exp2(_2687);
    float _2707 = _2691 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2709 = _2354 <= 0.0;
    bool _2711 = !_2701;
    bool _2713 = _2709 || _2711;
    float _2715 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2703);
    float _2717 = _2602 * 0.5;
    float _2719 = _248 * _2707;
    float _2721 = _2638 + _2602;
    float _2723 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2715);
    float _2725 = fma(_2640, -0.5, _2717);
    float _2727 = _2721 * 0.5;
    float _2729 = _2723 + _2602;
    out.gl_Position.x = _2638;
    out.gl_Position.y = _2640;
    out.gl_Position.z = _2723;
    out.gl_Position.w = _2602;
    float _2731 = _2719 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2733 = _2729 * 0.5;
    float _2735 = -_2705;
    float _2737 = _2735 + 1.0;
    out.m_47.x = _2731;
    float _2739 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2727;
    out.m_83.y = _2725;
    out.m_83.z = _2733;
    out.m_83.w = _2602;
    float _2741 = -_2739;
    float _2743 = _2741 + 1.0;
    float _2745 = _2739 * _2664;
    float _2747 = _2675 * _2743;
    float _2749 = _2675 * _2745;
    float _2751 = _2685 * _2745;
    float _2753 = fma(_2681, _2749, _2669);
    float _2755 = fma(_2683, _2749, _2671);
    float _2757 = fma(_2675, _2751, _2673);
    out.m_85.x = _2753;
    out.m_85.y = _2755;
    out.m_85.z = _2757;
    out.m_85.w = _2747;
    if (!_2713)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2759 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2759;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

