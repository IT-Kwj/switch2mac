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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_53 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1754 = false;
    bool _394 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2429 = as_type<float>(_114);
        out.gl_Position.z = _2429;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    int _148 = 0;
    if (_142)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_152);
        out.gl_Position.z = _2499;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _166 = _164 != 0;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _158 * _156;
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = _174 * 6.283185482025146484375;
    float _178 = floor(_174);
    float _180 = _176 * 0.15915493667125701904296875;
    bool _182 = !_162;
    int _184 = _182 ? 0 : 1;
    int _186 = abs(_184);
    float _188 = _180 * 6.283185482025146484375;
    float _190 = cos(_188);
    bool _192 = !_170;
    int _194 = _192 ? 0 : 1;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _198 = abs(_194);
    float _200 = -_178;
    float _202 = _174 + _200;
    bool _204 = !_166;
    int _206 = _204 ? 0 : 1;
    int _208 = abs(_206);
    float _210 = -_202;
    float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _214 = float(_186);
    float _216 = fma(_190, 0.5, 0.5);
    bool _218 = _202 < 0.5;
    float _220 = float(_218);
    float _222 = abs(_212);
    float _224 = _214 * _222;
    float _226 = float(_198);
    float _228 = -_216;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _232 = float(_208);
    float _234 = -_220;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = fma(_226, _230, _224);
    float _240 = abs(_236);
    float _242 = fma(_232, _240, _238);
    bool _244 = !_196;
    bool _246 = _166;
    float _262;
    if (!_244)
    {
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _250 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_98);
        float _268 = 1.0 / _266;
        float _270 = _130 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _276 = _272 + _274;
    bool _278 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _280 = isnan(_272);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _290;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _296 = 1.0 / _292;
    float _298 = -_288;
    float _300 = _298 + 1.0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _302;
    float _306 = _276 * _296;
    bool _308 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _310 = isnan(_272);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _320;
    float _324 = fma(_304, _306, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _326;
    float _330 = _318 * _300;
    float _332 = fma(_322, _306, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _334 = fma(_328, _306, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _336 = -_318;
    float _338 = _336 + 1.0;
    float _340 = _324 * _330;
    float _342 = _332 * _330;
    float _344 = _334 * _330;
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[107].z, _340);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[107].x, _342);
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[107].y, _344);
    float _352 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[108].z, _346);
    float _354 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[108].x, _348);
    float _356 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[108].y, _350);
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _360 = _352 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _362 = _354 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _364 = _356 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _366 = _360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _368 = _362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _370 = _364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _368;
    out.m_53.y = _370;
    out.m_53.z = _366;
    out.m_53.w = _358;
    bool _372 = !_294;
    int _374 = as_type<int>(_368);
    float _376 = _288;
    float _392;
    if (!_372)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _380 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_98);
        float _398 = 1.0 / _396;
        float _400 = _130 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = in.m_55.x;
    float _406 = in.m_55.y;
    float _408 = _154 * 2.0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _412 = _410 != 0;
    float _414 = in.m_57.x;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _424 = _422 != 0;
    float _426 = in.m_51.w;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _430 = _428 != 0;
    float _432 = in.m_44.x;
    float _434 = in.m_44.y;
    float _436 = in.m_44.z;
    float _438 = floor(_408);
    float _440 = in.m_57.y;
    if (_418)
    {
        bool _442 = _154 > 0.5;
        _246 = _442;
    }
    bool _444 = _246;
    float _446 = 0.0;
    if (_412)
    {
        float _448 = in.m_51.z;
        _446 = _448;
    }
    float _450 = _446;
    float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _454 = in.m_51.z;
    float _456 = abs(_404);
    float _458 = abs(_406);
    float _460 = precise::max(_456, _458);
    float _462 = in.m_51.y;
    if (_418)
    {
        float _464 = -_414;
        float _466 = _464 + 1.0;
        _374 = as_type<int>(_466);
    }
    int _468 = _374;
    bool _470 = _460 >= 16.0;
    int _472 = 0;
    if (_412)
    {
        float _474 = -_414;
        float _476 = _474 + 1.0;
        _472 = as_type<int>(_476);
    }
    int _478 = _472;
    bool _480 = _426 > 0.5;
    float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _484 = _480;
    if (!_418)
    {
        _376 = _414;
    }
    float _486 = _376;
    float _488 = _434 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _490 = _434 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _492 = _434 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _494 = _486;
    if (_418)
    {
        float _496 = _444 ? as_type<float>(_468) : _414;
        _494 = _496;
    }
    float _498 = _494;
    float _500 = -_440;
    float _502 = _500 + 1.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _504;
    float _508 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _488);
    float _510 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].x, _492);
    float _512 = 1.0 / _506;
    int _514 = _480 ? as_type<int>(_502) : as_type<int>(_440);
    float _516 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].x, _490);
    float _518 = _440;
    if (_412)
    {
        bool _520 = _450 > 0.5;
        _484 = _520;
    }
    bool _522 = _484;
    float _524 = _454 * 2.0;
    bool _526 = _438 > 0.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _530 = _402 + _528;
    float _532 = _462 * 2.0;
    bool _534 = _438 >= 0.0;
    bool _536 = isnan(_438);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _154 + _462;
    float _546 = floor(_524);
    float _548 = _462 + _454;
    float _550 = _498 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _552 = _544 + (-1.0);
    float _554 = _544;
    bool _556 = _542;
    if (!_412)
    {
        _554 = _414;
    }
    float _558 = _554;
    float _560 = _548 + (-1.0);
    float _562 = _558;
    if (_412)
    {
        float _564 = _522 ? as_type<float>(_478) : _414;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _570 = floor(_532);
    bool _572 = _462 > 0.5;
    float _574 = _530 * _512;
    float _576 = _424 ? as_type<float>(_514) : _440;
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_430)
    {
        float _580 = _572 ? _502 : _440;
        _518 = _580;
    }
    float _582 = _518;
    float _584 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _586 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[5].z, _516);
    bool _588 = _546 > 0.0;
    float _590 = _406 * 0.0625;
    bool _592 = _546 >= 0.0;
    bool _594 = isnan(_546);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _602;
    bool _606 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _608 = isnan(_402);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    bool _620 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _622 = isnan(_402);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = fma(_604, _574, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _634 = _404 * 0.0625;
    float _636 = -_630;
    float _638 = _636 + 1.0;
    bool _640 = _570 > 0.0;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _642;
    bool _646 = _570 >= 0.0;
    bool _648 = isnan(_570);
    bool _650 = _646 || _648;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _656;
    float _660 = _616 * _638;
    float _662 = fma(_644, _574, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _664 = _576 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _666 = fma(_658, _574, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _668 = _632 * _660;
    float _670 = _582 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _672 = _470 ? _590 : _406;
    float _674 = _662 * _660;
    float _676 = _666 * _660;
    float _678 = _664 * _420;
    int _680 = _542 ? 0 : 1;
    float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _684 = _470 ? _634 : _404;
    float _686 = _566 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _688 = abs(_672);
    bool _690 = _688 != 0.0;
    bool _692 = isnan(_688);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = _550 * _482;
    int _702 = ~_680;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = _686 * _452;
    int _710 = _706;
    int _712 = as_type<int>(_586);
    if (!_526)
    {
        int _714 = ~_680;
        int _716 = _714 + 1;
        _710 = _716;
    }
    int _718 = _710;
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    float _724 = abs(_684);
    bool _726 = _724 == 0.0;
    bool _728 = !_698;
    bool _730 = _726 && _728;
    float _732 = -_616;
    float _734 = _732 + 1.0;
    int _736 = _600 ? 0 : 1;
    float _738 = abs(_684);
    bool _740 = _738 == 0.0;
    float _742 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[123].x, _668);
    int _744 = _654 ? 0 : 1;
    float _746 = _670 * _682;
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[123].y, _674);
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[123].z, _676);
    int _752 = ~_744;
    int _754 = _752 + 1;
    int _756 = _754 + 1;
    out.m_59.x = _700;
    out.m_59.y = _746;
    out.m_59.z = _708;
    out.m_59.w = _678;
    int _758 = _756;
    int _760 = as_type<int>(_746);
    int _762 = _730 ? (-1) : 0;
    if (_730)
    {
        bool _764 = as_type<int>(_684) >= 0;
        _556 = _764;
    }
    bool _766 = _556;
    float _768 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].y, _748);
    int _770 = ~_736;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    float _776 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].z, _750);
    int _778 = _774;
    if (!_640)
    {
        int _780 = ~_744;
        int _782 = _780 + 1;
        _758 = _782;
    }
    int _784 = _758;
    if (!_588)
    {
        int _786 = ~_736;
        int _788 = _786 + 1;
        _778 = _788;
    }
    int _790 = _778;
    if (_730)
    {
        int _792 = _766 ? 0 : 1078530011;
        _760 = _792;
    }
    int _794 = _760;
    float _796 = _586 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].x, _742);
    if (_730)
    {
        int _800 = int(0x80000000) & as_type<int>(_672);
        int _802 = _794 | _800;
        _712 = _802;
    }
    int _804 = _712;
    bool _806 = !_698;
    bool _808 = _806 && _740;
    int _810 = _804;
    float _812 = as_type<float>(_804);
    if (!_808)
    {
        float _814 = abs(_672);
        bool _816 = _814 != as_type<float>(0x7f800000u /* inf */);
        bool _818 = isnan(_814);
        bool _820 = _816 || _818;
        bool _822 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _824 = _820 || _822;
        float _826 = abs(_684);
        bool _828 = _826 == as_type<float>(0x7f800000u /* inf */);
        float _830 = abs(_684);
        bool _832 = _830 == as_type<float>(0x7f800000u /* inf */);
        bool _834 = !_824;
        bool _836 = _832 && _834;
        if (_836)
        {
            bool _838 = as_type<int>(_684) >= 0;
            _762 = _838 ? (-1) : 0;
        }
        int _840 = _762;
        if (_836)
        {
            _810 = 1075235812;
        }
        int _842 = _810;
        int _844 = _842;
        if (_836)
        {
            int _846 = ~_840;
            int _848 = (_846 != 0) ? _842 : 1061752795;
            _844 = _848;
        }
        int _850 = _844;
        float _852 = as_type<float>(_850);
        if (_836)
        {
            int _854 = int(0x80000000) & as_type<int>(_672);
            int _856 = _850 | _854;
            _852 = as_type<float>(_856);
        }
        float _858 = _852;
        bool _860 = !_824;
        bool _862 = _860 && _828;
        _812 = _858;
        if (!_862)
        {
            float _864 = abs(_672);
            float _866 = abs(_684);
            float _868 = precise::max(_864, _866);
            float _870 = abs(_672);
            float _872 = abs(_684);
            float _874 = precise::min(_870, _872);
            float _876 = 1.0 / _868;
            float _878 = abs(_672);
            float _880 = abs(_684);
            bool _882 = _878 > _880;
            bool _884 = as_type<int>(_684) >= 0;
            float _886 = abs(_672);
            float _888 = abs(_684);
            float _890 = _886 + _888;
            int _892 = as_type<int>(_672) & int(0x80000000);
            bool _894 = _890 > as_type<float>(0x7f800000u /* inf */);
            bool _896 = isnan(_890);
            bool _898 = _894 || _896;
            bool _900 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _902 = _898 || _900;
            float _904 = _874 * _876;
            float _906 = _904 * _904;
            float _908 = _906 + 11.33538818359375;
            float _910 = fma(_906, _908, 28.84246826171875);
            float _912 = fma(_906, _910, 19.6966705322265625);
            float _914 = fma(_906, -0.82336294651031494140625, -5.674867153167724609375);
            float _916 = fma(_906, _914, -6.565555095672607421875);
            float _918 = 1.0 / _912;
            float _920 = _906 * _916;
            float _922 = _904 * _920;
            float _924 = fma(_922, _918, _904);
            float _926 = _924;
            _812 = _890;
            if (_882)
            {
                float _928 = -_924;
                float _930 = _928 + 1.57079637050628662109375;
                _926 = _930;
            }
            float _932 = _926;
            int _934 = as_type<int>(_932);
            if (!_884)
            {
                float _936 = -_932;
                float _938 = _936 + 3.1415927410125732421875;
                _934 = as_type<int>(_938);
            }
            int _940 = _934;
            if (!_902)
            {
                int _942 = _892 | _940;
                _812 = as_type<float>(_942);
            }
        }
    }
    float _944 = _812;
    float _946 = _584 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _950 = _796 + _948;
    float _952 = _618 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _954 = _722 * _130;
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _958 = _946 + _956;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _964 = _952 + _962;
    float _966 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _968 = _950 * _950;
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[28].x, _960);
    float _972 = exp2(_954);
    float _974 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[28].z, _970);
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _980 = fma(_958, _958, _968);
    float _982 = precise::max(_944, -3.1415927410125732421875);
    float _984 = _768 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _986 = _976 >= 0.0;
    float _988 = _776 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _992 = 1.0 + _990;
    float _994 = fma(_964, _964, _980);
    float _996 = _984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _998 = precise::min(_982, 3.1415927410125732421875);
    float _1000 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1012 = _1010 != 0;
    float _1014 = 1.0 / _992;
    bool _1016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1018 = isnan(1.0);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1024 = _1020 || _1022;
    float _1026 = fma(_998, 0.15915493667125701904296875, 0.5);
    out.m_61.x = _974;
    out.m_61.y = _996;
    out.m_61.z = _1000;
    out.m_61.w = _978;
    bool _1028 = !_1004;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = -_972;
    float _1034 = _1032 + 1.0;
    bool _1036 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = in.m_63.x;
    float _1048 = in.m_63.y;
    float _1050 = in.m_63.z;
    float _1052 = rsqrt(_994);
    float _1054 = float(_790);
    float _1056 = _1044 ? _1034 : 0.0;
    float _1058 = fma(_130, 0.06666667759418487548828125, _1026);
    float _1060 = float(_718);
    float _1062 = _1000;
    int _1064 = _1030;
    if (_986)
    {
        out.m_47.x = 0.0;
    }
    if (_1024)
    {
        float _1066 = _1056 * _1014;
        _132 = _1066;
    }
    float _1068 = _132;
    if (_986)
    {
        _1062 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1070 = _1062;
    int _1072 = abs(_1030);
    float _1074 = float(_784);
    if (_986)
    {
        float _1076 = _1070 * 5.0;
        _1064 = as_type<int>(_1076);
    }
    int _1078 = _1064;
    float _1080 = _950 * _1052;
    bool _1082 = !_1008;
    int _1084 = _1082 ? 0 : 1;
    float _1086 = _958 * _1052;
    float _1088 = float(_1072);
    if (_986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3953 = as_type<float>(_1078);
        out.gl_Position.z = _3953;
    }
    int _1090 = abs(_1084);
    float _1092 = -_1080;
    float _1094 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1096 = -_1086;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _1100 = _1088 * _1054;
    bool _1102 = !_1012;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = _1094 * _1094;
    float _1108 = _154 + (-0.5);
    float _1110 = _964 * _1052;
    float _1112 = fma(_1098, _1098, _1106);
    float _1114 = _1100 * (-2.0);
    float _1116 = -_1110;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _964);
    int _1120 = abs(_1104);
    float _1122 = fma(_1114, _1046, _1046);
    float _1124 = float(_1090);
    float _1126 = fma(_568, _1114, _568);
    float _1128 = float(_1120);
    float _1130 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1122);
    float _1132 = fma(_1118, _1118, _1112);
    float _1134 = _1124 * _1060;
    float _1136 = _1128 * _1074;
    float _1138 = fma(_1126, _1068, _1130);
    float _1140 = _1050;
    if (_986)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1142 = -_1080;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _1146 = -_1086;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[18].w, _946);
    float _1150 = _1058 * 6.283185482025146484375;
    float _1152 = -_1110;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1158 = _1144 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1162 = _1148 + _1160;
    float _1164 = _1134 * (-2.0);
    float _1166 = _1150 * 0.15915493667125701904296875;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1170 = _154 + _454;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1174 = _1154 + _1172;
    float _1176 = fma(_578, _1164, _578);
    float _1178 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1168);
    float _1180 = _1138 * 0.15915493667125701904296875;
    float _1182 = fma(_1164, _1048, _1048);
    float _1184 = _1170 + (-1.0);
    float _1186 = _1136 * (-2.0);
    float _1188 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1178);
    float _1190 = _462 + (-0.5);
    float _1192 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1194 = fma(_1186, _1050, _1050);
    float _1196 = _454 + (-0.5);
    bool _1198 = _1188 >= 0.0;
    float _1200 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1182);
    float _1202 = fma(_1192, _1186, _1192);
    float _1204 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1194);
    float _1206 = sqrt(_1132);
    float _1208 = fma(_1176, _1068, _1200);
    float _1210 = fma(_1202, _1068, _1204);
    float _1212 = in.m_55.z;
    float _1214 = _1208 * 0.15915493667125701904296875;
    float _1216 = _1210 * 0.15915493667125701904296875;
    float _1218 = _1166 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1180;
    float _1224 = _1148;
    if (_1198)
    {
        _1140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1226 = _1140;
    int _1228 = as_type<int>(_1226);
    if (_1198)
    {
        out.m_47.x = 0.0;
    }
    if (_1198)
    {
        float _1230 = _1226 * 5.0;
        _1228 = as_type<int>(_1230);
    }
    int _1232 = _1228;
    float _1234 = _1180 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    if (_1198)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4198 = as_type<float>(_1232);
        out.gl_Position.z = _4198;
    }
    float _1238 = _1180 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _1214 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = _1214 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = _1216 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    if (_1198)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1254 = in.m_65.x;
    float _1256 = in.m_65.y;
    float _1258 = in.m_65.z;
    float _1260 = _1216 * 6.283185482025146484375;
    float _1262 = cos(_1260);
    float _1264 = fma(_1220, 0.5, 1.5);
    float _1266 = _1236 * _1244;
    float _1268 = _1240 * _1248;
    float _1270 = _1052 * _1206;
    float _1272 = _1264 * _404;
    float _1274 = _1264 * _406;
    float _1276 = _1264 * _1212;
    float _1278 = _1236 * _1248;
    float _1280 = fma(_1252, _1268, _1266);
    float _1282 = fma(_1252, _1266, _1268);
    float _1284 = _1240 * _1244;
    float _1286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1276);
    float _1288 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1292 = _1274 != 0.0;
    bool _1294 = isnan(_1274);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    float _1302 = _1240 * _1262;
    float _1304 = _1248 * _1262;
    float _1306 = _1236 * _1262;
    float _1308 = _1244 * _1262;
    float _1310 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1274);
    float _1312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1272);
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1288);
    float _1316 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1318 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1320 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _1322 = _1272 == 0.0;
    bool _1324 = !_1300;
    bool _1326 = _1322 && _1324;
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1330 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1334 = -_1284;
    float _1336 = fma(_1252, _1278, _1334);
    float _1338 = _1270 * _1328;
    float _1340 = _1270 * _1330;
    float _1342 = _1270 * _1332;
    float _1344 = -_1278;
    float _1346 = fma(_1252, _1284, _1344);
    float _1348 = _1310 * _1338;
    float _1350 = _1312 * _1340;
    float _1352 = _1286 * _1342;
    float _1354 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1356 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1358 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1360 = _1302 * _1348;
    float _1362 = -_1252;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1354);
    float _1366 = -_1252;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1370 = -_1252;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1358);
    float _1374 = -_1348;
    float _1376 = _1252 * _1374;
    float _1378 = fma(_1280, _1350, _1360);
    float _1380 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1382 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1290);
    float _1384 = fma(_1304, _1350, _1376);
    float _1386 = _1306 * _1348;
    float _1388 = fma(_1346, _1352, _1378);
    float _1390 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1380);
    float _1392 = fma(_1308, _1352, _1384);
    float _1394 = fma(_1336, _1350, _1386);
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1400 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1390);
    float _1402 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1314);
    float _1404 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1382);
    float _1406 = fma(_1282, _1352, _1394);
    float _1408 = in.m_67.x;
    float _1410 = in.m_67.y;
    float _1412 = in.m_67.z;
    float _1414 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1396);
    float _1416 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1398);
    bool _1418 = _1276 == 0.0;
    bool _1420 = _1418 && _1326;
    float _1422 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1424 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1414);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1416);
    float _1428 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1430 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1436 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1428);
    float _1438 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1364);
    float _1440 = _946 + _1432;
    float _1442 = _952 + _1434;
    float _1444 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1422);
    float _1446 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1430);
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1450 = _1440 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1454 = _1442 + _1452;
    float _1456 = in.m_69.x;
    float _1458 = in.m_69.y;
    float _1460 = in.m_69.z;
    float _1462 = in.m_69.w;
    float _1464 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1368);
    float _1466 = _1450 * _1450;
    float _1468 = _1454 * _1454;
    float _1470 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1372);
    float _1472 = 0.0;
    float _1474 = _1434;
    float _1476 = _1466;
    float _1478 = _1468;
    float _1480 = _1440;
    float _1482 = _1442;
    if (_1420)
    {
        _1472 = _1408;
    }
    float _1484 = _1472;
    float _1486 = _1466 + _1468;
    float _1488 = 0.0;
    float _1490 = _1484;
    if (_1420)
    {
        _1488 = _1412;
    }
    float _1492 = _1488;
    float _1494 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1444);
    float _1496 = 0.0;
    float _1498 = _1492;
    if (_1420)
    {
        _1496 = _1484;
    }
    float _1500 = _1496;
    float _1502 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1436);
    float _1504 = _1500;
    if (!_1420)
    {
        _1490 = _1408;
    }
    float _1506 = _1490;
    float _1508 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1446);
    float _1510 = sqrt(_1486);
    if (_1420)
    {
        _1222 = _1492;
    }
    float _1512 = _1222;
    float _1514 = _1512;
    if (!_1420)
    {
        _1498 = _1412;
    }
    float _1516 = _1498;
    float _1518 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1420)
    {
        _1474 = _1410;
    }
    float _1520 = _1474;
    float _1522 = _1520;
    if (!_1420)
    {
        float _1524 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1506);
        _1504 = _1524;
    }
    float _1526 = _1504;
    if (!_1420)
    {
        float _1528 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1410);
        _1522 = _1528;
    }
    float _1530 = _1522;
    float _1532 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1518);
    if (!_1420)
    {
        float _1534 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1516);
        _1514 = _1534;
    }
    float _1536 = _1514;
    float _1538 = _1456 * _1410;
    float _1540 = _1438 * _1458;
    float _1542 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1532);
    float _1544 = _1458 * _1516;
    float _1546 = _1464 * _1458;
    float _1548 = _1470 * _1458;
    bool _1550 = _1510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1554 = -_1544;
    float _1556 = fma(_1460, _1410, _1554);
    float _1558 = _1460 * _1506;
    float _1560 = -_1538;
    float _1562 = fma(_1458, _1506, _1560);
    float _1564 = _796 + _1552;
    float _1566 = fma(_1400, _1456, _1540);
    float _1568 = fma(_1402, _1456, _1546);
    float _1570 = fma(_1404, _1456, _1548);
    float _1572 = -_1558;
    float _1574 = fma(_1456, _1516, _1572);
    float _1576 = _1458;
    if (!_1550)
    {
        _1576 = _1466;
    }
    float _1578 = _1576;
    float _1580 = _1578;
    if (!_1550)
    {
        _1476 = _1564;
    }
    float _1582 = _1476;
    bool _1584 = !_1550;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1510 + _1590;
        float _1594 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = rsqrt(_1486);
        float _1598 = _1592 * _1588;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1596 * _1610;
        float _1614 = _1608 + (-1.0);
        float _1616 = fma(_1450, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1618 = fma(_1454, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1624 = _1616 + _1622;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = fma(_1564, _1608, _1620);
        float _1632 = _1624 * _1624;
        float _1634 = _1628 * _1628;
        _1586 = _1630;
        _1580 = _1632;
        _1478 = _1634;
        _1480 = _1616;
        _1482 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1580;
    float _1640 = _1478;
    float _1642 = _1480;
    float _1644 = _1482;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    float _1650 = _1464 * _1530;
    float _1652 = _1470 * _1530;
    float _1654 = _1556 * _1462;
    float _1656 = fma(_1648, _1648, _1638);
    float _1658 = _1574 * _1462;
    float _1660 = _1562 * _1462;
    float _1662 = _1438 * _1530;
    float _1664 = _1656 + _1640;
    float _1666 = _1658 * _1464;
    float _1668 = _1658 * _1438;
    float _1670 = _1658 * _1470;
    float _1672 = fma(_1400, _1526, _1662);
    float _1674 = fma(_1654, _1402, _1666);
    float _1676 = sqrt(_1664);
    float _1678 = fma(_1402, _1526, _1650);
    float _1680 = fma(_1404, _1526, _1652);
    float _1682 = fma(_1654, _1400, _1668);
    float _1684 = fma(_1654, _1404, _1670);
    float _1686 = fma(_1494, _1460, _1566);
    float _1688 = fma(_1502, _1460, _1568);
    float _1690 = fma(_1508, _1460, _1570);
    float _1692 = fma(_1660, _1502, _1674);
    float _1694 = fma(_1494, _1536, _1672);
    float _1696 = fma(_1502, _1536, _1678);
    float _1698 = fma(_1508, _1536, _1680);
    float _1700 = fma(_1660, _1494, _1682);
    float _1702 = fma(_1660, _1508, _1684);
    out.m_71.x = _1686;
    out.m_71.y = _1688;
    out.m_71.z = _1690;
    bool _1704 = _1676 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1706 = isnan(_1676);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1712 = _1708 || _1710;
    out.m_73.x = _1694;
    out.m_73.y = _1696;
    out.m_73.z = _1698;
    out.m_75.x = _1700;
    out.m_75.y = _1692;
    out.m_75.z = _1702;
    float _1714 = _1682;
    float _1716 = _1700;
    float _1718 = _1692;
    if (!_1712)
    {
        _1714 = 1.0;
    }
    float _1720 = _1714;
    bool _1722 = !_1712;
    float _1724 = _1720;
    if (!_1722)
    {
        bool _1726 = _1676 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1728 = isnan(_1676);
        bool _1730 = _1726 || _1728;
        bool _1732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1734 = _1730 || _1732;
        if (!_1734)
        {
            float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1738 = _1676 + _1736;
            float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1742 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1740;
            float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1746 = _1744 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1748 = 1.0 / _1742;
            float _1750 = _1738 * _1748;
            float _1752 = fma(_1750, _1746, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1724 = _1752;
            _1754 = true;
        }
        else
        {
            bool _1756 = _1676 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1758 = isnan(_1676);
            bool _1760 = _1756 || _1758;
            bool _1762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1764 = _1760 || _1762;
            if (!_1764)
            {
                float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1768 = _1676 + _1766;
                float _1770 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1772 = _1770 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1774 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1776 = _1774 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1778 = 1.0 / _1772;
                float _1780 = _1768 * _1778;
                float _1782 = fma(_1780, _1776, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1724 = _1782;
                _1754 = true;
            }
            else
            {
                _1724 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1754 = false;
    float _1784 = _1724;
    float _1786 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1788 = _1642 + _1786;
    float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1792 = _1644 + _1790;
    bool _1794 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan(0.5);
    bool _1802 = _1798 || _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1806 = _1636 + _1804;
    float _1808 = fma(_1788, _1784, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1810 = fma(_1792, _1784, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1812 = fma(_1806, _1784, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1814 = -_1086;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1808);
    float _1818 = -_1110;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1810);
    float _1822 = -_1080;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1812);
    float _1826 = _1824;
    float _1828 = _1816;
    float _1830 = _1820;
    if (!_1802)
    {
        float _1832 = _1158 * _1158;
        float _1834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1836 = -_952;
        float _1838 = _1836 + _1810;
        float _1840 = fma(_1162, _1162, _1832);
        float _1842 = fma(_1174, _1174, _1840);
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1846 = sqrt(_1842);
        float _1848 = 1.0 / _1270;
        float _1850 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1852 = precise::min(_1846, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1854 = _1852 * _1834;
        float _1856 = -_946;
        float _1858 = _1856 + _1808;
        float _1860 = -_796;
        float _1862 = _1860 + _1812;
        float _1864 = _1854 * _1848;
        float _1866 = _1850 * _1864;
        float _1868 = _1838 * _1864;
        float _1870 = fma(_1858, _1866, _1148);
        float _1872 = fma(_1862, _1866, _1144);
        float _1874 = fma(_1850, _1868, _1154);
        _1826 = _1872;
        _1828 = _1870;
        _1830 = _1874;
    }
    float _1876 = _1826;
    float _1878 = _1828;
    float _1880 = _1830;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1884 = _1876 + _1882;
    float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1888 = _1878 + _1886;
    float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1892 = _1880 + _1890;
    float _1894 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1896 = _1884 * _1884;
    float _1898 = fma(_1888, _1888, _1896);
    float _1900 = fma(_1892, _1892, _1898);
    float _1902 = rsqrt(_1900);
    float _1904 = sqrt(_1900);
    float _1906 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1908 = _1888 * _1906;
    float _1910 = _1892 * _1906;
    float _1912 = _1908 * _1908;
    float _1914 = _1910 * _1910;
    float _1916 = _1912 + _1914;
    float _1918 = sqrt(_1916);
    bool _1920 = _1918 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1924 = _1918 + _1922;
    float _1926 = _1902;
    float _1928 = _1924;
    float _1930 = _1884;
    float _1932 = _1906;
    if (_1920)
    {
        float _1934 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1926 = _1934;
    }
    float _1936 = _1926;
    if (_1920)
    {
        float _1938 = rsqrt(_1916);
        _1716 = _1938;
    }
    float _1940 = _1716;
    float _1942 = _1940;
    if (_1920)
    {
        float _1944 = _1924 * _1936;
        _1928 = _1944;
    }
    float _1946 = _1928;
    if (_1920)
    {
        float _1948 = _1946 * 0.15915493667125701904296875;
        _1718 = _1948;
    }
    float _1950 = _1718;
    float _1952 = _1936;
    float _1954 = _1950;
    if (_1920)
    {
        float _1956 = _1950 * 6.283185482025146484375;
        float _1958 = sin(_1956);
        _1952 = _1958;
    }
    float _1960 = _1952;
    float _1962 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1964 = precise::max(0.0, _1962);
    float _1966 = _1892;
    float _1968 = _1964;
    if (_1920)
    {
        float _1970 = _1950 * 6.283185482025146484375;
        float _1972 = cos(_1970);
        _1966 = _1972;
    }
    float _1974 = _1966;
    float _1976 = -_1906;
    float _1978 = -_1964;
    float _1980 = fma(_1884, _1976, _1978);
    if (!_1920)
    {
        _1930 = _1910;
    }
    float _1982 = _1930;
    float _1984 = _1982;
    if (_1920)
    {
        float _1986 = _1980 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1968 = _1986;
    }
    float _1988 = _1968;
    float _1990 = _1960;
    float _1992 = _1988;
    if (_1920)
    {
        float _1994 = fma(_1960, _1988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1990 = _1994;
    }
    float _1996 = _1990;
    float _1998 = _1996;
    float _2000 = _1974;
    if (_1920)
    {
        float _2002 = _1974 + (-1.0);
        _1992 = _2002;
    }
    float _2004 = _1992;
    float _2006 = _2004;
    if (_1920)
    {
        float _2008 = _1940 * _1996;
        _1932 = _2008;
    }
    float _2010 = _1932;
    if (!_1920)
    {
        _1942 = _1908;
    }
    float _2012 = _1942;
    float _2014 = _2012;
    if (_1920)
    {
        float _2016 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _2016;
    }
    float _2018 = _1954;
    if (_1920)
    {
        float _2020 = _1908 * _2010;
        _2014 = _2020;
    }
    float _2022 = _2014;
    if (!_1920)
    {
        _1998 = _1980;
    }
    float _2024 = _1998;
    float _2026 = _2024;
    if (_1920)
    {
        float _2028 = _1910 * _2010;
        _1984 = _2028;
    }
    float _2030 = _1984;
    if (!_1920)
    {
        _2006 = _1912;
    }
    float _2032 = _2006;
    float _2034 = _2032;
    if (_1920)
    {
        float _2036 = fma(_1980, _1974, _2018);
        _2026 = _2036;
    }
    float _2038 = _2026;
    if (_1920)
    {
        float _2040 = _2022 * _2022;
        _2034 = _2040;
    }
    float _2042 = _2034;
    if (!_1920)
    {
        _2000 = _1914;
    }
    float _2044 = _2000;
    float _2046 = _2044;
    if (_1920)
    {
        float _2048 = _2030 * _2030;
        _2046 = _2048;
    }
    float _2050 = _2046;
    float _2052 = fma(_2038, _2038, _2042);
    float _2054 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2056 = _2052 + _2050;
    float _2058 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2054);
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2062 = fma(_1904, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2060);
    float _2064 = precise::clamp(_2062, 0.0, 1.0);
    float _2066 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2068 = rsqrt(_2056);
    float _2070 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2058);
    float _2072 = -_2064;
    float _2074 = _2072 + 1.0;
    float _2076 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2078 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2066);
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2082 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2084 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2076);
    float _2086 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2078);
    float _2088 = abs(_2074);
    float _2090 = log2(_2088);
    float _2092 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2082);
    float _2094 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2084);
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2098 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2100 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2102 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2104 = _2068 * _2022;
    float _2106 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2108 = _2068 * _2038;
    float _2110 = -_2098;
    float _2112 = fma(_2110, _1894, 1.0);
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2116 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2118 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2106);
    float _2120 = _2068 * _2030;
    float _2122 = -_2114;
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2122);
    float _2126 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2128 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2118);
    float _2130 = log2(_2112);
    float _2132 = -_2120;
    float _2134 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2124);
    float _2136 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2138 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2128);
    float _2140 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2142 = fma(_2134, -0.5, 0.5);
    float _2144 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2136);
    float _2146 = fma(_2134, 0.5, 0.5);
    float _2148 = exp2(_2126);
    float _2150 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2140);
    float _2152 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2144);
    float _2154 = _2108 + 1.0;
    float _2156 = fma(_2146, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2158 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2150);
    float _2160 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2152);
    float _2162 = 1.0 / _2138;
    float _2164 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2158);
    float _2166 = fma(_2146, _2156, -0.212114393711090087890625);
    float _2168 = _2130 * 0.693147182464599609375;
    float _2170 = fma(_2146, _2166, 1.570728778839111328125);
    float _2172 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2174 = sqrt(_2142);
    float _2176 = -_2108;
    float _2178 = fma(_2148, _2154, _2176);
    float _2180 = fma(_2178, 0.5, 0.5);
    float _2182 = _2160 * _2162;
    float _2184 = _2164 * _2162;
    float _2186 = fma(_2182, 0.5, 0.5);
    float _2188 = fma(_2184, -0.5, 0.5);
    float _2190 = _2174 * 0.636619746685028076171875;
    float3 _5798 = float3(_2186, _2188, _2172);
    float _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5798, float3(0.0), isnan(_5798)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5798, float3(0.0), isnan(_5798)), level(0.0)).x;
    float3 _5809 = float3(_2186, _2188, _2172);
    float4 _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5809, float3(0.0), isnan(_5809)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5809, float3(0.0), isnan(_5809)), level(0.0)).xyzw;
    float _2197 = _2195.x;
    float _2199 = _2195.y;
    float _2201 = _2195.z;
    float _2203 = _2195.w;
    float _2205 = -_2170;
    float _2207 = fma(_2190, _2205, 1.0);
    float2 _5831 = float2(_2207, _2180);
    float3 _2211 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5831, float2(0.0), isnan(_5831)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5831, float2(0.0), isnan(_5831)), level(0.0)).xyz;
    float _2213 = _2211.x;
    float _2215 = _2211.y;
    float _2217 = _2211.z;
    float _2219 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2221 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2219);
    bool _2223 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2225 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan(0.5);
    bool _2231 = _2227 || _2229;
    float _2233 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2221);
    float _2235 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2237 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2239 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2235);
    float _2241 = 1.0 / _2237;
    float _2243 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2239);
    float _2245 = _2096;
    float _2247 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2249 = _2237;
    if (!_2231)
    {
        _1224 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2251 = _1224;
    float _2253 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2255 = _2253 + _2237;
    float _2257 = _2255 * _2241;
    float _2259 = _2257 * 0.5;
    float _2261 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2263 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2265 = _2259;
    float _2267 = _2251;
    if (_2231)
    {
        _2245 = 1.0;
    }
    float _2269 = _2245;
    float _2271 = _2269;
    if (!_2231)
    {
        float _2273 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2275 = fma(_2259, _2251, _2273);
        _2265 = _2275;
    }
    float _2277 = _2265;
    if (!_2231)
    {
        _2267 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2279 = _2267;
    float _2281 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2263);
    float _2283 = exp2(_2261);
    if (!_2231)
    {
        float _2285 = -_2279;
        float _2287 = _2285 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2247 = _2287;
    }
    float _2289 = _2247;
    float _2291 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2281);
    float _2293 = _2277;
    if (!_2231)
    {
        float _2295 = 1.0 / _2277;
        _2293 = _2295;
    }
    float _2297 = _2293;
    float _2299 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2291);
    float _2301 = _2289;
    if (!_2231)
    {
        float _2303 = 1.0 / _2289;
        _2301 = _2303;
    }
    float _2305 = _2301;
    if (!_2231)
    {
        float _2307 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2309 = -_2279;
        float _2311 = fma(_2297, _2307, _2309);
        _2249 = _2311;
    }
    float _2313 = _2249;
    float _2315 = _2313;
    if (!_2231)
    {
        float _2317 = _2313 * _2305;
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        _2315 = _2319;
    }
    float _2321 = _2315;
    if (!_2231)
    {
        float _2323 = -_2321;
        float _2325 = _2323 + 1.0;
        _2271 = _2325;
    }
    float _2327 = _2271;
    float _2329 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2331 = _2327 > 0.0;
    bool _2333 = isnan(_2327);
    bool _2335 = _2331 || _2333;
    bool _2337 = isnan(0.0);
    bool _2339 = _2335 || _2337;
    float _2341 = _242 * _2329;
    float _2343 = -_2283;
    float _2345 = _2343 + 1.0;
    float _2347 = _2299 + _2138;
    float _2349 = _2341 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2351 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2353 = _2347 * 0.5;
    out.gl_Position.x = _2160;
    out.gl_Position.y = _2164;
    out.gl_Position.z = _2299;
    out.gl_Position.w = _2138;
    out.m_77.z = _2353;
    out.m_77.w = _2138;
    out.m_47.x = _2349;
    float _2355 = _2351 * _2192;
    float _2357 = -_2351;
    float _2359 = _2357 + 1.0;
    float _2361 = _2203 * _2355;
    float _2363 = _2217 * _2355;
    float _2365 = fma(_2213, _2361, _2197);
    float _2367 = fma(_2215, _2361, _2199);
    float _2369 = _2203 * _2359;
    float _2371 = fma(_2203, _2363, _2201);
    out.m_79.x = _2365;
    out.m_79.y = _2367;
    out.m_79.z = _2371;
    out.m_79.w = _2369;
    if (_2339)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2373;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1754 = false;
    bool _394 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2429 = as_type<float>(_114);
        out.gl_Position.z = _2429;
    }
    if (!_102)
    {
        return out;
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    int _148 = 0;
    if (_142)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_152);
        out.gl_Position.z = _2499;
    }
    if (_142)
    {
        return out;
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _166 = _164 != 0;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _158 * _156;
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = _174 * 6.283185482025146484375;
    float _178 = floor(_174);
    float _180 = _176 * 0.15915493667125701904296875;
    bool _182 = !_162;
    int _184 = _182 ? 0 : 1;
    int _186 = abs(_184);
    float _188 = _180 * 6.283185482025146484375;
    float _190 = cos(_188);
    bool _192 = !_170;
    int _194 = _192 ? 0 : 1;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _198 = abs(_194);
    float _200 = -_178;
    float _202 = _174 + _200;
    bool _204 = !_166;
    int _206 = _204 ? 0 : 1;
    int _208 = abs(_206);
    float _210 = -_202;
    float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _214 = float(_186);
    float _216 = fma(_190, 0.5, 0.5);
    bool _218 = _202 < 0.5;
    float _220 = float(_218);
    float _222 = abs(_212);
    float _224 = _214 * _222;
    float _226 = float(_198);
    float _228 = -_216;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _232 = float(_208);
    float _234 = -_220;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = fma(_226, _230, _224);
    float _240 = abs(_236);
    float _242 = fma(_232, _240, _238);
    bool _244 = !_196;
    bool _246 = _166;
    float _262;
    if (!_244)
    {
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _250 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_98);
        float _268 = 1.0 / _266;
        float _270 = _130 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _276 = _272 + _274;
    bool _278 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _280 = isnan(_272);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _290;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _296 = 1.0 / _292;
    float _298 = -_288;
    float _300 = _298 + 1.0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _302;
    float _306 = _276 * _296;
    bool _308 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _310 = isnan(_272);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _320;
    float _324 = fma(_304, _306, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _326;
    float _330 = _318 * _300;
    float _332 = fma(_322, _306, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _334 = fma(_328, _306, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _336 = -_318;
    float _338 = _336 + 1.0;
    float _340 = _324 * _330;
    float _342 = _332 * _330;
    float _344 = _334 * _330;
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[107].z, _340);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[107].x, _342);
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[107].y, _344);
    float _352 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[108].z, _346);
    float _354 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[108].x, _348);
    float _356 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[108].y, _350);
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _360 = _352 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _362 = _354 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _364 = _356 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _366 = _360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _368 = _362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _370 = _364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _368;
    out.m_53.y = _370;
    out.m_53.z = _366;
    out.m_53.w = _358;
    bool _372 = !_294;
    int _374 = as_type<int>(_368);
    float _376 = _288;
    float _392;
    if (!_372)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _380 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_98);
        float _398 = 1.0 / _396;
        float _400 = _130 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = in.m_55.x;
    float _406 = in.m_55.y;
    float _408 = _154 * 2.0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _412 = _410 != 0;
    float _414 = in.m_57.x;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _424 = _422 != 0;
    float _426 = in.m_51.w;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _430 = _428 != 0;
    float _432 = in.m_44.x;
    float _434 = in.m_44.y;
    float _436 = in.m_44.z;
    float _438 = floor(_408);
    float _440 = in.m_57.y;
    if (_418)
    {
        bool _442 = _154 > 0.5;
        _246 = _442;
    }
    bool _444 = _246;
    float _446 = 0.0;
    if (_412)
    {
        float _448 = in.m_51.z;
        _446 = _448;
    }
    float _450 = _446;
    float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _454 = in.m_51.z;
    float _456 = abs(_404);
    float _458 = abs(_406);
    float _460 = precise::max(_456, _458);
    float _462 = in.m_51.y;
    if (_418)
    {
        float _464 = -_414;
        float _466 = _464 + 1.0;
        _374 = as_type<int>(_466);
    }
    int _468 = _374;
    bool _470 = _460 >= 16.0;
    int _472 = 0;
    if (_412)
    {
        float _474 = -_414;
        float _476 = _474 + 1.0;
        _472 = as_type<int>(_476);
    }
    int _478 = _472;
    bool _480 = _426 > 0.5;
    float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _484 = _480;
    if (!_418)
    {
        _376 = _414;
    }
    float _486 = _376;
    float _488 = _434 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _490 = _434 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _492 = _434 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _494 = _486;
    if (_418)
    {
        float _496 = _444 ? as_type<float>(_468) : _414;
        _494 = _496;
    }
    float _498 = _494;
    float _500 = -_440;
    float _502 = _500 + 1.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _504;
    float _508 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _488);
    float _510 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].x, _492);
    float _512 = 1.0 / _506;
    int _514 = _480 ? as_type<int>(_502) : as_type<int>(_440);
    float _516 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].x, _490);
    float _518 = _440;
    if (_412)
    {
        bool _520 = _450 > 0.5;
        _484 = _520;
    }
    bool _522 = _484;
    float _524 = _454 * 2.0;
    bool _526 = _438 > 0.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _530 = _402 + _528;
    float _532 = _462 * 2.0;
    bool _534 = _438 >= 0.0;
    bool _536 = isnan(_438);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _154 + _462;
    float _546 = floor(_524);
    float _548 = _462 + _454;
    float _550 = _498 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _552 = _544 + (-1.0);
    float _554 = _544;
    bool _556 = _542;
    if (!_412)
    {
        _554 = _414;
    }
    float _558 = _554;
    float _560 = _548 + (-1.0);
    float _562 = _558;
    if (_412)
    {
        float _564 = _522 ? as_type<float>(_478) : _414;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _570 = floor(_532);
    bool _572 = _462 > 0.5;
    float _574 = _530 * _512;
    float _576 = _424 ? as_type<float>(_514) : _440;
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_430)
    {
        float _580 = _572 ? _502 : _440;
        _518 = _580;
    }
    float _582 = _518;
    float _584 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _586 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[5].z, _516);
    bool _588 = _546 > 0.0;
    float _590 = _406 * 0.0625;
    bool _592 = _546 >= 0.0;
    bool _594 = isnan(_546);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _602;
    bool _606 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _608 = isnan(_402);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    bool _620 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _622 = isnan(_402);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = fma(_604, _574, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _634 = _404 * 0.0625;
    float _636 = -_630;
    float _638 = _636 + 1.0;
    bool _640 = _570 > 0.0;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _642;
    bool _646 = _570 >= 0.0;
    bool _648 = isnan(_570);
    bool _650 = _646 || _648;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _656;
    float _660 = _616 * _638;
    float _662 = fma(_644, _574, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _664 = _576 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _666 = fma(_658, _574, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _668 = _632 * _660;
    float _670 = _582 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _672 = _470 ? _590 : _406;
    float _674 = _662 * _660;
    float _676 = _666 * _660;
    float _678 = _664 * _420;
    int _680 = _542 ? 0 : 1;
    float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _684 = _470 ? _634 : _404;
    float _686 = _566 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _688 = abs(_672);
    bool _690 = _688 != 0.0;
    bool _692 = isnan(_688);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = _550 * _482;
    int _702 = ~_680;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = _686 * _452;
    int _710 = _706;
    int _712 = as_type<int>(_586);
    if (!_526)
    {
        int _714 = ~_680;
        int _716 = _714 + 1;
        _710 = _716;
    }
    int _718 = _710;
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    float _724 = abs(_684);
    bool _726 = _724 == 0.0;
    bool _728 = !_698;
    bool _730 = _726 && _728;
    float _732 = -_616;
    float _734 = _732 + 1.0;
    int _736 = _600 ? 0 : 1;
    float _738 = abs(_684);
    bool _740 = _738 == 0.0;
    float _742 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[123].x, _668);
    int _744 = _654 ? 0 : 1;
    float _746 = _670 * _682;
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[123].y, _674);
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[123].z, _676);
    int _752 = ~_744;
    int _754 = _752 + 1;
    int _756 = _754 + 1;
    out.m_59.x = _700;
    out.m_59.y = _746;
    out.m_59.z = _708;
    out.m_59.w = _678;
    int _758 = _756;
    int _760 = as_type<int>(_746);
    int _762 = _730 ? (-1) : 0;
    if (_730)
    {
        bool _764 = as_type<int>(_684) >= 0;
        _556 = _764;
    }
    bool _766 = _556;
    float _768 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].y, _748);
    int _770 = ~_736;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    float _776 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].z, _750);
    int _778 = _774;
    if (!_640)
    {
        int _780 = ~_744;
        int _782 = _780 + 1;
        _758 = _782;
    }
    int _784 = _758;
    if (!_588)
    {
        int _786 = ~_736;
        int _788 = _786 + 1;
        _778 = _788;
    }
    int _790 = _778;
    if (_730)
    {
        int _792 = _766 ? 0 : 1078530011;
        _760 = _792;
    }
    int _794 = _760;
    float _796 = _586 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].x, _742);
    if (_730)
    {
        int _800 = int(0x80000000) & as_type<int>(_672);
        int _802 = _794 | _800;
        _712 = _802;
    }
    int _804 = _712;
    bool _806 = !_698;
    bool _808 = _806 && _740;
    int _810 = _804;
    float _812 = as_type<float>(_804);
    if (!_808)
    {
        float _814 = abs(_672);
        bool _816 = _814 != as_type<float>(0x7f800000u /* inf */);
        bool _818 = isnan(_814);
        bool _820 = _816 || _818;
        bool _822 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _824 = _820 || _822;
        float _826 = abs(_684);
        bool _828 = _826 == as_type<float>(0x7f800000u /* inf */);
        float _830 = abs(_684);
        bool _832 = _830 == as_type<float>(0x7f800000u /* inf */);
        bool _834 = !_824;
        bool _836 = _832 && _834;
        if (_836)
        {
            bool _838 = as_type<int>(_684) >= 0;
            _762 = _838 ? (-1) : 0;
        }
        int _840 = _762;
        if (_836)
        {
            _810 = 1075235812;
        }
        int _842 = _810;
        int _844 = _842;
        if (_836)
        {
            int _846 = ~_840;
            int _848 = (_846 != 0) ? _842 : 1061752795;
            _844 = _848;
        }
        int _850 = _844;
        float _852 = as_type<float>(_850);
        if (_836)
        {
            int _854 = int(0x80000000) & as_type<int>(_672);
            int _856 = _850 | _854;
            _852 = as_type<float>(_856);
        }
        float _858 = _852;
        bool _860 = !_824;
        bool _862 = _860 && _828;
        _812 = _858;
        if (!_862)
        {
            float _864 = abs(_672);
            float _866 = abs(_684);
            float _868 = precise::max(_864, _866);
            float _870 = abs(_672);
            float _872 = abs(_684);
            float _874 = precise::min(_870, _872);
            float _876 = 1.0 / _868;
            float _878 = abs(_672);
            float _880 = abs(_684);
            bool _882 = _878 > _880;
            bool _884 = as_type<int>(_684) >= 0;
            float _886 = abs(_672);
            float _888 = abs(_684);
            float _890 = _886 + _888;
            int _892 = as_type<int>(_672) & int(0x80000000);
            bool _894 = _890 > as_type<float>(0x7f800000u /* inf */);
            bool _896 = isnan(_890);
            bool _898 = _894 || _896;
            bool _900 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _902 = _898 || _900;
            float _904 = _874 * _876;
            float _906 = _904 * _904;
            float _908 = _906 + 11.33538818359375;
            float _910 = fma(_906, _908, 28.84246826171875);
            float _912 = fma(_906, _910, 19.6966705322265625);
            float _914 = fma(_906, -0.82336294651031494140625, -5.674867153167724609375);
            float _916 = fma(_906, _914, -6.565555095672607421875);
            float _918 = 1.0 / _912;
            float _920 = _906 * _916;
            float _922 = _904 * _920;
            float _924 = fma(_922, _918, _904);
            float _926 = _924;
            _812 = _890;
            if (_882)
            {
                float _928 = -_924;
                float _930 = _928 + 1.57079637050628662109375;
                _926 = _930;
            }
            float _932 = _926;
            int _934 = as_type<int>(_932);
            if (!_884)
            {
                float _936 = -_932;
                float _938 = _936 + 3.1415927410125732421875;
                _934 = as_type<int>(_938);
            }
            int _940 = _934;
            if (!_902)
            {
                int _942 = _892 | _940;
                _812 = as_type<float>(_942);
            }
        }
    }
    float _944 = _812;
    float _946 = _584 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _950 = _796 + _948;
    float _952 = _618 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _954 = _722 * _130;
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _958 = _946 + _956;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _964 = _952 + _962;
    float _966 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _968 = _950 * _950;
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[28].x, _960);
    float _972 = exp2(_954);
    float _974 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[28].z, _970);
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _980 = fma(_958, _958, _968);
    float _982 = precise::max(_944, -3.1415927410125732421875);
    float _984 = _768 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _986 = _976 >= 0.0;
    float _988 = _776 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _992 = 1.0 + _990;
    float _994 = fma(_964, _964, _980);
    float _996 = _984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _998 = precise::min(_982, 3.1415927410125732421875);
    float _1000 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1012 = _1010 != 0;
    float _1014 = 1.0 / _992;
    bool _1016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1018 = isnan(1.0);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1024 = _1020 || _1022;
    float _1026 = fma(_998, 0.15915493667125701904296875, 0.5);
    out.m_61.x = _974;
    out.m_61.y = _996;
    out.m_61.z = _1000;
    out.m_61.w = _978;
    bool _1028 = !_1004;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = -_972;
    float _1034 = _1032 + 1.0;
    bool _1036 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = in.m_63.x;
    float _1048 = in.m_63.y;
    float _1050 = in.m_63.z;
    float _1052 = rsqrt(_994);
    float _1054 = float(_790);
    float _1056 = _1044 ? _1034 : 0.0;
    float _1058 = fma(_130, 0.06666667759418487548828125, _1026);
    float _1060 = float(_718);
    float _1062 = _1000;
    int _1064 = _1030;
    if (_986)
    {
        out.m_47.x = 0.0;
    }
    if (_1024)
    {
        float _1066 = _1056 * _1014;
        _132 = _1066;
    }
    float _1068 = _132;
    if (_986)
    {
        _1062 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1070 = _1062;
    int _1072 = abs(_1030);
    float _1074 = float(_784);
    if (_986)
    {
        float _1076 = _1070 * 5.0;
        _1064 = as_type<int>(_1076);
    }
    int _1078 = _1064;
    float _1080 = _950 * _1052;
    bool _1082 = !_1008;
    int _1084 = _1082 ? 0 : 1;
    float _1086 = _958 * _1052;
    float _1088 = float(_1072);
    if (_986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3953 = as_type<float>(_1078);
        out.gl_Position.z = _3953;
    }
    int _1090 = abs(_1084);
    float _1092 = -_1080;
    float _1094 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1096 = -_1086;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _1100 = _1088 * _1054;
    bool _1102 = !_1012;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = _1094 * _1094;
    float _1108 = _154 + (-0.5);
    float _1110 = _964 * _1052;
    float _1112 = fma(_1098, _1098, _1106);
    float _1114 = _1100 * (-2.0);
    float _1116 = -_1110;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _964);
    int _1120 = abs(_1104);
    float _1122 = fma(_1114, _1046, _1046);
    float _1124 = float(_1090);
    float _1126 = fma(_568, _1114, _568);
    float _1128 = float(_1120);
    float _1130 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1122);
    float _1132 = fma(_1118, _1118, _1112);
    float _1134 = _1124 * _1060;
    float _1136 = _1128 * _1074;
    float _1138 = fma(_1126, _1068, _1130);
    float _1140 = _1050;
    if (_986)
    {
        return out;
    }
    float _1142 = -_1080;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _1146 = -_1086;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[18].w, _946);
    float _1150 = _1058 * 6.283185482025146484375;
    float _1152 = -_1110;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1158 = _1144 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1162 = _1148 + _1160;
    float _1164 = _1134 * (-2.0);
    float _1166 = _1150 * 0.15915493667125701904296875;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1170 = _154 + _454;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1174 = _1154 + _1172;
    float _1176 = fma(_578, _1164, _578);
    float _1178 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1168);
    float _1180 = _1138 * 0.15915493667125701904296875;
    float _1182 = fma(_1164, _1048, _1048);
    float _1184 = _1170 + (-1.0);
    float _1186 = _1136 * (-2.0);
    float _1188 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1178);
    float _1190 = _462 + (-0.5);
    float _1192 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1194 = fma(_1186, _1050, _1050);
    float _1196 = _454 + (-0.5);
    bool _1198 = _1188 >= 0.0;
    float _1200 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1182);
    float _1202 = fma(_1192, _1186, _1192);
    float _1204 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1194);
    float _1206 = sqrt(_1132);
    float _1208 = fma(_1176, _1068, _1200);
    float _1210 = fma(_1202, _1068, _1204);
    float _1212 = in.m_55.z;
    float _1214 = _1208 * 0.15915493667125701904296875;
    float _1216 = _1210 * 0.15915493667125701904296875;
    float _1218 = _1166 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1180;
    float _1224 = _1148;
    if (_1198)
    {
        _1140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1226 = _1140;
    int _1228 = as_type<int>(_1226);
    if (_1198)
    {
        out.m_47.x = 0.0;
    }
    if (_1198)
    {
        float _1230 = _1226 * 5.0;
        _1228 = as_type<int>(_1230);
    }
    int _1232 = _1228;
    float _1234 = _1180 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    if (_1198)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4198 = as_type<float>(_1232);
        out.gl_Position.z = _4198;
    }
    float _1238 = _1180 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _1214 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = _1214 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = _1216 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    if (_1198)
    {
        return out;
    }
    float _1254 = in.m_65.x;
    float _1256 = in.m_65.y;
    float _1258 = in.m_65.z;
    float _1260 = _1216 * 6.283185482025146484375;
    float _1262 = cos(_1260);
    float _1264 = fma(_1220, 0.5, 1.5);
    float _1266 = _1236 * _1244;
    float _1268 = _1240 * _1248;
    float _1270 = _1052 * _1206;
    float _1272 = _1264 * _404;
    float _1274 = _1264 * _406;
    float _1276 = _1264 * _1212;
    float _1278 = _1236 * _1248;
    float _1280 = fma(_1252, _1268, _1266);
    float _1282 = fma(_1252, _1266, _1268);
    float _1284 = _1240 * _1244;
    float _1286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1276);
    float _1288 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1292 = _1274 != 0.0;
    bool _1294 = isnan(_1274);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    float _1302 = _1240 * _1262;
    float _1304 = _1248 * _1262;
    float _1306 = _1236 * _1262;
    float _1308 = _1244 * _1262;
    float _1310 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1274);
    float _1312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1272);
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1288);
    float _1316 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1318 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1320 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _1322 = _1272 == 0.0;
    bool _1324 = !_1300;
    bool _1326 = _1322 && _1324;
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1330 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1334 = -_1284;
    float _1336 = fma(_1252, _1278, _1334);
    float _1338 = _1270 * _1328;
    float _1340 = _1270 * _1330;
    float _1342 = _1270 * _1332;
    float _1344 = -_1278;
    float _1346 = fma(_1252, _1284, _1344);
    float _1348 = _1310 * _1338;
    float _1350 = _1312 * _1340;
    float _1352 = _1286 * _1342;
    float _1354 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1356 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1358 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1360 = _1302 * _1348;
    float _1362 = -_1252;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1354);
    float _1366 = -_1252;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1370 = -_1252;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1358);
    float _1374 = -_1348;
    float _1376 = _1252 * _1374;
    float _1378 = fma(_1280, _1350, _1360);
    float _1380 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1382 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1290);
    float _1384 = fma(_1304, _1350, _1376);
    float _1386 = _1306 * _1348;
    float _1388 = fma(_1346, _1352, _1378);
    float _1390 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1380);
    float _1392 = fma(_1308, _1352, _1384);
    float _1394 = fma(_1336, _1350, _1386);
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1400 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1390);
    float _1402 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1314);
    float _1404 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1382);
    float _1406 = fma(_1282, _1352, _1394);
    float _1408 = in.m_67.x;
    float _1410 = in.m_67.y;
    float _1412 = in.m_67.z;
    float _1414 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1396);
    float _1416 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1398);
    bool _1418 = _1276 == 0.0;
    bool _1420 = _1418 && _1326;
    float _1422 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1424 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1414);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1416);
    float _1428 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1430 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1436 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1428);
    float _1438 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1364);
    float _1440 = _946 + _1432;
    float _1442 = _952 + _1434;
    float _1444 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1422);
    float _1446 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1430);
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1450 = _1440 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1454 = _1442 + _1452;
    float _1456 = in.m_69.x;
    float _1458 = in.m_69.y;
    float _1460 = in.m_69.z;
    float _1462 = in.m_69.w;
    float _1464 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1368);
    float _1466 = _1450 * _1450;
    float _1468 = _1454 * _1454;
    float _1470 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1372);
    float _1472 = 0.0;
    float _1474 = _1434;
    float _1476 = _1466;
    float _1478 = _1468;
    float _1480 = _1440;
    float _1482 = _1442;
    if (_1420)
    {
        _1472 = _1408;
    }
    float _1484 = _1472;
    float _1486 = _1466 + _1468;
    float _1488 = 0.0;
    float _1490 = _1484;
    if (_1420)
    {
        _1488 = _1412;
    }
    float _1492 = _1488;
    float _1494 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1444);
    float _1496 = 0.0;
    float _1498 = _1492;
    if (_1420)
    {
        _1496 = _1484;
    }
    float _1500 = _1496;
    float _1502 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1436);
    float _1504 = _1500;
    if (!_1420)
    {
        _1490 = _1408;
    }
    float _1506 = _1490;
    float _1508 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1446);
    float _1510 = sqrt(_1486);
    if (_1420)
    {
        _1222 = _1492;
    }
    float _1512 = _1222;
    float _1514 = _1512;
    if (!_1420)
    {
        _1498 = _1412;
    }
    float _1516 = _1498;
    float _1518 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1420)
    {
        _1474 = _1410;
    }
    float _1520 = _1474;
    float _1522 = _1520;
    if (!_1420)
    {
        float _1524 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1506);
        _1504 = _1524;
    }
    float _1526 = _1504;
    if (!_1420)
    {
        float _1528 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1410);
        _1522 = _1528;
    }
    float _1530 = _1522;
    float _1532 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1518);
    if (!_1420)
    {
        float _1534 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1516);
        _1514 = _1534;
    }
    float _1536 = _1514;
    float _1538 = _1456 * _1410;
    float _1540 = _1438 * _1458;
    float _1542 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1532);
    float _1544 = _1458 * _1516;
    float _1546 = _1464 * _1458;
    float _1548 = _1470 * _1458;
    bool _1550 = _1510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1554 = -_1544;
    float _1556 = fma(_1460, _1410, _1554);
    float _1558 = _1460 * _1506;
    float _1560 = -_1538;
    float _1562 = fma(_1458, _1506, _1560);
    float _1564 = _796 + _1552;
    float _1566 = fma(_1400, _1456, _1540);
    float _1568 = fma(_1402, _1456, _1546);
    float _1570 = fma(_1404, _1456, _1548);
    float _1572 = -_1558;
    float _1574 = fma(_1456, _1516, _1572);
    float _1576 = _1458;
    if (!_1550)
    {
        _1576 = _1466;
    }
    float _1578 = _1576;
    float _1580 = _1578;
    if (!_1550)
    {
        _1476 = _1564;
    }
    float _1582 = _1476;
    bool _1584 = !_1550;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1510 + _1590;
        float _1594 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = rsqrt(_1486);
        float _1598 = _1592 * _1588;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1596 * _1610;
        float _1614 = _1608 + (-1.0);
        float _1616 = fma(_1450, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1618 = fma(_1454, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1624 = _1616 + _1622;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = fma(_1564, _1608, _1620);
        float _1632 = _1624 * _1624;
        float _1634 = _1628 * _1628;
        _1586 = _1630;
        _1580 = _1632;
        _1478 = _1634;
        _1480 = _1616;
        _1482 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1580;
    float _1640 = _1478;
    float _1642 = _1480;
    float _1644 = _1482;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    float _1650 = _1464 * _1530;
    float _1652 = _1470 * _1530;
    float _1654 = _1556 * _1462;
    float _1656 = fma(_1648, _1648, _1638);
    float _1658 = _1574 * _1462;
    float _1660 = _1562 * _1462;
    float _1662 = _1438 * _1530;
    float _1664 = _1656 + _1640;
    float _1666 = _1658 * _1464;
    float _1668 = _1658 * _1438;
    float _1670 = _1658 * _1470;
    float _1672 = fma(_1400, _1526, _1662);
    float _1674 = fma(_1654, _1402, _1666);
    float _1676 = sqrt(_1664);
    float _1678 = fma(_1402, _1526, _1650);
    float _1680 = fma(_1404, _1526, _1652);
    float _1682 = fma(_1654, _1400, _1668);
    float _1684 = fma(_1654, _1404, _1670);
    float _1686 = fma(_1494, _1460, _1566);
    float _1688 = fma(_1502, _1460, _1568);
    float _1690 = fma(_1508, _1460, _1570);
    float _1692 = fma(_1660, _1502, _1674);
    float _1694 = fma(_1494, _1536, _1672);
    float _1696 = fma(_1502, _1536, _1678);
    float _1698 = fma(_1508, _1536, _1680);
    float _1700 = fma(_1660, _1494, _1682);
    float _1702 = fma(_1660, _1508, _1684);
    out.m_71.x = _1686;
    out.m_71.y = _1688;
    out.m_71.z = _1690;
    bool _1704 = _1676 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1706 = isnan(_1676);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1712 = _1708 || _1710;
    out.m_73.x = _1694;
    out.m_73.y = _1696;
    out.m_73.z = _1698;
    out.m_75.x = _1700;
    out.m_75.y = _1692;
    out.m_75.z = _1702;
    float _1714 = _1682;
    float _1716 = _1700;
    float _1718 = _1692;
    if (!_1712)
    {
        _1714 = 1.0;
    }
    float _1720 = _1714;
    bool _1722 = !_1712;
    float _1724 = _1720;
    if (!_1722)
    {
        bool _1726 = _1676 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1728 = isnan(_1676);
        bool _1730 = _1726 || _1728;
        bool _1732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1734 = _1730 || _1732;
        if (!_1734)
        {
            float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1738 = _1676 + _1736;
            float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1742 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1740;
            float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1746 = _1744 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1748 = 1.0 / _1742;
            float _1750 = _1738 * _1748;
            float _1752 = fma(_1750, _1746, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1724 = _1752;
            _1754 = true;
        }
        else
        {
            bool _1756 = _1676 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1758 = isnan(_1676);
            bool _1760 = _1756 || _1758;
            bool _1762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1764 = _1760 || _1762;
            if (!_1764)
            {
                float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1768 = _1676 + _1766;
                float _1770 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1772 = _1770 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1774 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1776 = _1774 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1778 = 1.0 / _1772;
                float _1780 = _1768 * _1778;
                float _1782 = fma(_1780, _1776, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1724 = _1782;
                _1754 = true;
            }
            else
            {
                _1724 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1754 = false;
    float _1784 = _1724;
    float _1786 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1788 = _1642 + _1786;
    float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1792 = _1644 + _1790;
    bool _1794 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan(0.5);
    bool _1802 = _1798 || _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1806 = _1636 + _1804;
    float _1808 = fma(_1788, _1784, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1810 = fma(_1792, _1784, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1812 = fma(_1806, _1784, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1814 = -_1086;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1808);
    float _1818 = -_1110;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1810);
    float _1822 = -_1080;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1812);
    float _1826 = _1824;
    float _1828 = _1816;
    float _1830 = _1820;
    if (!_1802)
    {
        float _1832 = _1158 * _1158;
        float _1834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1836 = -_952;
        float _1838 = _1836 + _1810;
        float _1840 = fma(_1162, _1162, _1832);
        float _1842 = fma(_1174, _1174, _1840);
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1846 = sqrt(_1842);
        float _1848 = 1.0 / _1270;
        float _1850 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1852 = precise::min(_1846, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1854 = _1852 * _1834;
        float _1856 = -_946;
        float _1858 = _1856 + _1808;
        float _1860 = -_796;
        float _1862 = _1860 + _1812;
        float _1864 = _1854 * _1848;
        float _1866 = _1850 * _1864;
        float _1868 = _1838 * _1864;
        float _1870 = fma(_1858, _1866, _1148);
        float _1872 = fma(_1862, _1866, _1144);
        float _1874 = fma(_1850, _1868, _1154);
        _1826 = _1872;
        _1828 = _1870;
        _1830 = _1874;
    }
    float _1876 = _1826;
    float _1878 = _1828;
    float _1880 = _1830;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1884 = _1876 + _1882;
    float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1888 = _1878 + _1886;
    float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1892 = _1880 + _1890;
    float _1894 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1896 = _1884 * _1884;
    float _1898 = fma(_1888, _1888, _1896);
    float _1900 = fma(_1892, _1892, _1898);
    float _1902 = rsqrt(_1900);
    float _1904 = sqrt(_1900);
    float _1906 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1908 = _1888 * _1906;
    float _1910 = _1892 * _1906;
    float _1912 = _1908 * _1908;
    float _1914 = _1910 * _1910;
    float _1916 = _1912 + _1914;
    float _1918 = sqrt(_1916);
    bool _1920 = _1918 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1924 = _1918 + _1922;
    float _1926 = _1902;
    float _1928 = _1924;
    float _1930 = _1884;
    float _1932 = _1906;
    if (_1920)
    {
        float _1934 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1926 = _1934;
    }
    float _1936 = _1926;
    if (_1920)
    {
        float _1938 = rsqrt(_1916);
        _1716 = _1938;
    }
    float _1940 = _1716;
    float _1942 = _1940;
    if (_1920)
    {
        float _1944 = _1924 * _1936;
        _1928 = _1944;
    }
    float _1946 = _1928;
    if (_1920)
    {
        float _1948 = _1946 * 0.15915493667125701904296875;
        _1718 = _1948;
    }
    float _1950 = _1718;
    float _1952 = _1936;
    float _1954 = _1950;
    if (_1920)
    {
        float _1956 = _1950 * 6.283185482025146484375;
        float _1958 = sin(_1956);
        _1952 = _1958;
    }
    float _1960 = _1952;
    float _1962 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1964 = precise::max(0.0, _1962);
    float _1966 = _1892;
    float _1968 = _1964;
    if (_1920)
    {
        float _1970 = _1950 * 6.283185482025146484375;
        float _1972 = cos(_1970);
        _1966 = _1972;
    }
    float _1974 = _1966;
    float _1976 = -_1906;
    float _1978 = -_1964;
    float _1980 = fma(_1884, _1976, _1978);
    if (!_1920)
    {
        _1930 = _1910;
    }
    float _1982 = _1930;
    float _1984 = _1982;
    if (_1920)
    {
        float _1986 = _1980 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1968 = _1986;
    }
    float _1988 = _1968;
    float _1990 = _1960;
    float _1992 = _1988;
    if (_1920)
    {
        float _1994 = fma(_1960, _1988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1990 = _1994;
    }
    float _1996 = _1990;
    float _1998 = _1996;
    float _2000 = _1974;
    if (_1920)
    {
        float _2002 = _1974 + (-1.0);
        _1992 = _2002;
    }
    float _2004 = _1992;
    float _2006 = _2004;
    if (_1920)
    {
        float _2008 = _1940 * _1996;
        _1932 = _2008;
    }
    float _2010 = _1932;
    if (!_1920)
    {
        _1942 = _1908;
    }
    float _2012 = _1942;
    float _2014 = _2012;
    if (_1920)
    {
        float _2016 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _2016;
    }
    float _2018 = _1954;
    if (_1920)
    {
        float _2020 = _1908 * _2010;
        _2014 = _2020;
    }
    float _2022 = _2014;
    if (!_1920)
    {
        _1998 = _1980;
    }
    float _2024 = _1998;
    float _2026 = _2024;
    if (_1920)
    {
        float _2028 = _1910 * _2010;
        _1984 = _2028;
    }
    float _2030 = _1984;
    if (!_1920)
    {
        _2006 = _1912;
    }
    float _2032 = _2006;
    float _2034 = _2032;
    if (_1920)
    {
        float _2036 = fma(_1980, _1974, _2018);
        _2026 = _2036;
    }
    float _2038 = _2026;
    if (_1920)
    {
        float _2040 = _2022 * _2022;
        _2034 = _2040;
    }
    float _2042 = _2034;
    if (!_1920)
    {
        _2000 = _1914;
    }
    float _2044 = _2000;
    float _2046 = _2044;
    if (_1920)
    {
        float _2048 = _2030 * _2030;
        _2046 = _2048;
    }
    float _2050 = _2046;
    float _2052 = fma(_2038, _2038, _2042);
    float _2054 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2056 = _2052 + _2050;
    float _2058 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2054);
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2062 = fma(_1904, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2060);
    float _2064 = precise::clamp(_2062, 0.0, 1.0);
    float _2066 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2068 = rsqrt(_2056);
    float _2070 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2058);
    float _2072 = -_2064;
    float _2074 = _2072 + 1.0;
    float _2076 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2078 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2066);
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2082 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2084 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2076);
    float _2086 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2078);
    float _2088 = abs(_2074);
    float _2090 = log2(_2088);
    float _2092 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2082);
    float _2094 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2084);
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2098 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2100 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2102 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2104 = _2068 * _2022;
    float _2106 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2108 = _2068 * _2038;
    float _2110 = -_2098;
    float _2112 = fma(_2110, _1894, 1.0);
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2116 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2118 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2106);
    float _2120 = _2068 * _2030;
    float _2122 = -_2114;
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2122);
    float _2126 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2128 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2118);
    float _2130 = log2(_2112);
    float _2132 = -_2120;
    float _2134 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2124);
    float _2136 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2138 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2128);
    float _2140 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2142 = fma(_2134, -0.5, 0.5);
    float _2144 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2136);
    float _2146 = fma(_2134, 0.5, 0.5);
    float _2148 = exp2(_2126);
    float _2150 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2140);
    float _2152 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2144);
    float _2154 = _2108 + 1.0;
    float _2156 = fma(_2146, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2158 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2150);
    float _2160 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2152);
    float _2162 = 1.0 / _2138;
    float _2164 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2158);
    float _2166 = fma(_2146, _2156, -0.212114393711090087890625);
    float _2168 = _2130 * 0.693147182464599609375;
    float _2170 = fma(_2146, _2166, 1.570728778839111328125);
    float _2172 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2174 = sqrt(_2142);
    float _2176 = -_2108;
    float _2178 = fma(_2148, _2154, _2176);
    float _2180 = fma(_2178, 0.5, 0.5);
    float _2182 = _2160 * _2162;
    float _2184 = _2164 * _2162;
    float _2186 = fma(_2182, 0.5, 0.5);
    float _2188 = fma(_2184, -0.5, 0.5);
    float _2190 = _2174 * 0.636619746685028076171875;
    float3 _5798 = float3(_2186, _2188, _2172);
    float _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5798, float3(0.0), isnan(_5798)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5798, float3(0.0), isnan(_5798)), level(0.0)).x;
    float3 _5809 = float3(_2186, _2188, _2172);
    float4 _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5809, float3(0.0), isnan(_5809)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5809, float3(0.0), isnan(_5809)), level(0.0)).xyzw;
    float _2197 = _2195.x;
    float _2199 = _2195.y;
    float _2201 = _2195.z;
    float _2203 = _2195.w;
    float _2205 = -_2170;
    float _2207 = fma(_2190, _2205, 1.0);
    float2 _5831 = float2(_2207, _2180);
    float3 _2211 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5831, float2(0.0), isnan(_5831)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5831, float2(0.0), isnan(_5831)), level(0.0)).xyz;
    float _2213 = _2211.x;
    float _2215 = _2211.y;
    float _2217 = _2211.z;
    float _2219 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2221 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2219);
    bool _2223 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2225 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan(0.5);
    bool _2231 = _2227 || _2229;
    float _2233 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2221);
    float _2235 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2237 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2239 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2235);
    float _2241 = 1.0 / _2237;
    float _2243 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2239);
    float _2245 = _2096;
    float _2247 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2249 = _2237;
    if (!_2231)
    {
        _1224 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2251 = _1224;
    float _2253 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2255 = _2253 + _2237;
    float _2257 = _2255 * _2241;
    float _2259 = _2257 * 0.5;
    float _2261 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2263 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2265 = _2259;
    float _2267 = _2251;
    if (_2231)
    {
        _2245 = 1.0;
    }
    float _2269 = _2245;
    float _2271 = _2269;
    if (!_2231)
    {
        float _2273 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2275 = fma(_2259, _2251, _2273);
        _2265 = _2275;
    }
    float _2277 = _2265;
    if (!_2231)
    {
        _2267 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2279 = _2267;
    float _2281 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2263);
    float _2283 = exp2(_2261);
    if (!_2231)
    {
        float _2285 = -_2279;
        float _2287 = _2285 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2247 = _2287;
    }
    float _2289 = _2247;
    float _2291 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2281);
    float _2293 = _2277;
    if (!_2231)
    {
        float _2295 = 1.0 / _2277;
        _2293 = _2295;
    }
    float _2297 = _2293;
    float _2299 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2291);
    float _2301 = _2289;
    if (!_2231)
    {
        float _2303 = 1.0 / _2289;
        _2301 = _2303;
    }
    float _2305 = _2301;
    if (!_2231)
    {
        float _2307 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2309 = -_2279;
        float _2311 = fma(_2297, _2307, _2309);
        _2249 = _2311;
    }
    float _2313 = _2249;
    float _2315 = _2313;
    if (!_2231)
    {
        float _2317 = _2313 * _2305;
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        _2315 = _2319;
    }
    float _2321 = _2315;
    if (!_2231)
    {
        float _2323 = -_2321;
        float _2325 = _2323 + 1.0;
        _2271 = _2325;
    }
    float _2327 = _2271;
    float _2329 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2331 = _2327 > 0.0;
    bool _2333 = isnan(_2327);
    bool _2335 = _2331 || _2333;
    bool _2337 = isnan(0.0);
    bool _2339 = _2335 || _2337;
    float _2341 = _242 * _2329;
    float _2343 = -_2283;
    float _2345 = _2343 + 1.0;
    float _2347 = _2299 + _2138;
    float _2349 = _2341 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2351 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2353 = _2347 * 0.5;
    out.gl_Position.x = _2160;
    out.gl_Position.y = _2164;
    out.gl_Position.z = _2299;
    out.gl_Position.w = _2138;
    out.m_77.z = _2353;
    out.m_77.w = _2138;
    out.m_47.x = _2349;
    float _2355 = _2351 * _2192;
    float _2357 = -_2351;
    float _2359 = _2357 + 1.0;
    float _2361 = _2203 * _2355;
    float _2363 = _2217 * _2355;
    float _2365 = fma(_2213, _2361, _2197);
    float _2367 = fma(_2215, _2361, _2199);
    float _2369 = _2203 * _2359;
    float _2371 = fma(_2203, _2363, _2201);
    out.m_79.x = _2365;
    out.m_79.y = _2367;
    out.m_79.z = _2371;
    out.m_79.w = _2369;
    if (_2339)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2373;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1754 = false;
    bool _394 = false;
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2429 = as_type<float>(_114);
        out.gl_Position.z = _2429;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    int _148 = 0;
    if (_142)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_152);
        out.gl_Position.z = _2499;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _166 = _164 != 0;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _158 * _156;
    float _174 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = _174 * 6.283185482025146484375;
    float _178 = floor(_174);
    float _180 = _176 * 0.15915493667125701904296875;
    bool _182 = !_162;
    int _184 = _182 ? 0 : 1;
    int _186 = abs(_184);
    float _188 = _180 * 6.283185482025146484375;
    float _190 = cos(_188);
    bool _192 = !_170;
    int _194 = _192 ? 0 : 1;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _198 = abs(_194);
    float _200 = -_178;
    float _202 = _174 + _200;
    bool _204 = !_166;
    int _206 = _204 ? 0 : 1;
    int _208 = abs(_206);
    float _210 = -_202;
    float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _214 = float(_186);
    float _216 = fma(_190, 0.5, 0.5);
    bool _218 = _202 < 0.5;
    float _220 = float(_218);
    float _222 = abs(_212);
    float _224 = _214 * _222;
    float _226 = float(_198);
    float _228 = -_216;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _232 = float(_208);
    float _234 = -_220;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _238 = fma(_226, _230, _224);
    float _240 = abs(_236);
    float _242 = fma(_232, _240, _238);
    bool _244 = !_196;
    bool _246 = _166;
    float _262;
    if (!_244)
    {
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _250 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_98);
        float _268 = 1.0 / _266;
        float _270 = _130 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _276 = _272 + _274;
    bool _278 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _280 = isnan(_272);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _290;
    bool _294 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _296 = 1.0 / _292;
    float _298 = -_288;
    float _300 = _298 + 1.0;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _302;
    float _306 = _276 * _296;
    bool _308 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _310 = isnan(_272);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _320;
    float _324 = fma(_304, _306, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _326;
    float _330 = _318 * _300;
    float _332 = fma(_322, _306, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _334 = fma(_328, _306, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _336 = -_318;
    float _338 = _336 + 1.0;
    float _340 = _324 * _330;
    float _342 = _332 * _330;
    float _344 = _334 * _330;
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[107].z, _340);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[107].x, _342);
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[107].y, _344);
    float _352 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[108].z, _346);
    float _354 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[108].x, _348);
    float _356 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[108].y, _350);
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _360 = _352 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _362 = _354 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _364 = _356 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _366 = _360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _368 = _362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _370 = _364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _368;
    out.m_53.y = _370;
    out.m_53.z = _366;
    out.m_53.w = _358;
    bool _372 = !_294;
    int _374 = as_type<int>(_368);
    float _376 = _288;
    float _392;
    if (!_372)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _380 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_98);
        float _398 = 1.0 / _396;
        float _400 = _130 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = in.m_55.x;
    float _406 = in.m_55.y;
    float _408 = _154 * 2.0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _412 = _410 != 0;
    float _414 = in.m_57.x;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _424 = _422 != 0;
    float _426 = in.m_51.w;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _430 = _428 != 0;
    float _432 = in.m_44.x;
    float _434 = in.m_44.y;
    float _436 = in.m_44.z;
    float _438 = floor(_408);
    float _440 = in.m_57.y;
    if (_418)
    {
        bool _442 = _154 > 0.5;
        _246 = _442;
    }
    bool _444 = _246;
    float _446 = 0.0;
    if (_412)
    {
        float _448 = in.m_51.z;
        _446 = _448;
    }
    float _450 = _446;
    float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _454 = in.m_51.z;
    float _456 = abs(_404);
    float _458 = abs(_406);
    float _460 = precise::max(_456, _458);
    float _462 = in.m_51.y;
    if (_418)
    {
        float _464 = -_414;
        float _466 = _464 + 1.0;
        _374 = as_type<int>(_466);
    }
    int _468 = _374;
    bool _470 = _460 >= 16.0;
    int _472 = 0;
    if (_412)
    {
        float _474 = -_414;
        float _476 = _474 + 1.0;
        _472 = as_type<int>(_476);
    }
    int _478 = _472;
    bool _480 = _426 > 0.5;
    float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _484 = _480;
    if (!_418)
    {
        _376 = _414;
    }
    float _486 = _376;
    float _488 = _434 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _490 = _434 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _492 = _434 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _494 = _486;
    if (_418)
    {
        float _496 = _444 ? as_type<float>(_468) : _414;
        _494 = _496;
    }
    float _498 = _494;
    float _500 = -_440;
    float _502 = _500 + 1.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _504;
    float _508 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _488);
    float _510 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].x, _492);
    float _512 = 1.0 / _506;
    int _514 = _480 ? as_type<int>(_502) : as_type<int>(_440);
    float _516 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].x, _490);
    float _518 = _440;
    if (_412)
    {
        bool _520 = _450 > 0.5;
        _484 = _520;
    }
    bool _522 = _484;
    float _524 = _454 * 2.0;
    bool _526 = _438 > 0.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _530 = _402 + _528;
    float _532 = _462 * 2.0;
    bool _534 = _438 >= 0.0;
    bool _536 = isnan(_438);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _154 + _462;
    float _546 = floor(_524);
    float _548 = _462 + _454;
    float _550 = _498 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _552 = _544 + (-1.0);
    float _554 = _544;
    bool _556 = _542;
    if (!_412)
    {
        _554 = _414;
    }
    float _558 = _554;
    float _560 = _548 + (-1.0);
    float _562 = _558;
    if (_412)
    {
        float _564 = _522 ? as_type<float>(_478) : _414;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _570 = floor(_532);
    bool _572 = _462 > 0.5;
    float _574 = _530 * _512;
    float _576 = _424 ? as_type<float>(_514) : _440;
    float _578 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_430)
    {
        float _580 = _572 ? _502 : _440;
        _518 = _580;
    }
    float _582 = _518;
    float _584 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _586 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[5].z, _516);
    bool _588 = _546 > 0.0;
    float _590 = _406 * 0.0625;
    bool _592 = _546 >= 0.0;
    bool _594 = isnan(_546);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _602;
    bool _606 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _608 = isnan(_402);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = fma(_436, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    bool _620 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _622 = isnan(_402);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = fma(_604, _574, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _634 = _404 * 0.0625;
    float _636 = -_630;
    float _638 = _636 + 1.0;
    bool _640 = _570 > 0.0;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _642;
    bool _646 = _570 >= 0.0;
    bool _648 = isnan(_570);
    bool _650 = _646 || _648;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _656;
    float _660 = _616 * _638;
    float _662 = fma(_644, _574, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _664 = _576 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _666 = fma(_658, _574, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _668 = _632 * _660;
    float _670 = _582 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _672 = _470 ? _590 : _406;
    float _674 = _662 * _660;
    float _676 = _666 * _660;
    float _678 = _664 * _420;
    int _680 = _542 ? 0 : 1;
    float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _684 = _470 ? _634 : _404;
    float _686 = _566 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _688 = abs(_672);
    bool _690 = _688 != 0.0;
    bool _692 = isnan(_688);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = _550 * _482;
    int _702 = ~_680;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = _686 * _452;
    int _710 = _706;
    int _712 = as_type<int>(_586);
    if (!_526)
    {
        int _714 = ~_680;
        int _716 = _714 + 1;
        _710 = _716;
    }
    int _718 = _710;
    float _720 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _722 = log2(_720);
    float _724 = abs(_684);
    bool _726 = _724 == 0.0;
    bool _728 = !_698;
    bool _730 = _726 && _728;
    float _732 = -_616;
    float _734 = _732 + 1.0;
    int _736 = _600 ? 0 : 1;
    float _738 = abs(_684);
    bool _740 = _738 == 0.0;
    float _742 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[123].x, _668);
    int _744 = _654 ? 0 : 1;
    float _746 = _670 * _682;
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[123].y, _674);
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[123].z, _676);
    int _752 = ~_744;
    int _754 = _752 + 1;
    int _756 = _754 + 1;
    out.m_59.x = _700;
    out.m_59.y = _746;
    out.m_59.z = _708;
    out.m_59.w = _678;
    int _758 = _756;
    int _760 = as_type<int>(_746);
    int _762 = _730 ? (-1) : 0;
    if (_730)
    {
        bool _764 = as_type<int>(_684) >= 0;
        _556 = _764;
    }
    bool _766 = _556;
    float _768 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].y, _748);
    int _770 = ~_736;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    float _776 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].z, _750);
    int _778 = _774;
    if (!_640)
    {
        int _780 = ~_744;
        int _782 = _780 + 1;
        _758 = _782;
    }
    int _784 = _758;
    if (!_588)
    {
        int _786 = ~_736;
        int _788 = _786 + 1;
        _778 = _788;
    }
    int _790 = _778;
    if (_730)
    {
        int _792 = _766 ? 0 : 1078530011;
        _760 = _792;
    }
    int _794 = _760;
    float _796 = _586 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[124].x, _742);
    if (_730)
    {
        int _800 = int(0x80000000) & as_type<int>(_672);
        int _802 = _794 | _800;
        _712 = _802;
    }
    int _804 = _712;
    bool _806 = !_698;
    bool _808 = _806 && _740;
    int _810 = _804;
    float _812 = as_type<float>(_804);
    if (!_808)
    {
        float _814 = abs(_672);
        bool _816 = _814 != as_type<float>(0x7f800000u /* inf */);
        bool _818 = isnan(_814);
        bool _820 = _816 || _818;
        bool _822 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _824 = _820 || _822;
        float _826 = abs(_684);
        bool _828 = _826 == as_type<float>(0x7f800000u /* inf */);
        float _830 = abs(_684);
        bool _832 = _830 == as_type<float>(0x7f800000u /* inf */);
        bool _834 = !_824;
        bool _836 = _832 && _834;
        if (_836)
        {
            bool _838 = as_type<int>(_684) >= 0;
            _762 = _838 ? (-1) : 0;
        }
        int _840 = _762;
        if (_836)
        {
            _810 = 1075235812;
        }
        int _842 = _810;
        int _844 = _842;
        if (_836)
        {
            int _846 = ~_840;
            int _848 = (_846 != 0) ? _842 : 1061752795;
            _844 = _848;
        }
        int _850 = _844;
        float _852 = as_type<float>(_850);
        if (_836)
        {
            int _854 = int(0x80000000) & as_type<int>(_672);
            int _856 = _850 | _854;
            _852 = as_type<float>(_856);
        }
        float _858 = _852;
        bool _860 = !_824;
        bool _862 = _860 && _828;
        _812 = _858;
        if (!_862)
        {
            float _864 = abs(_672);
            float _866 = abs(_684);
            float _868 = precise::max(_864, _866);
            float _870 = abs(_672);
            float _872 = abs(_684);
            float _874 = precise::min(_870, _872);
            float _876 = 1.0 / _868;
            float _878 = abs(_672);
            float _880 = abs(_684);
            bool _882 = _878 > _880;
            bool _884 = as_type<int>(_684) >= 0;
            float _886 = abs(_672);
            float _888 = abs(_684);
            float _890 = _886 + _888;
            int _892 = as_type<int>(_672) & int(0x80000000);
            bool _894 = _890 > as_type<float>(0x7f800000u /* inf */);
            bool _896 = isnan(_890);
            bool _898 = _894 || _896;
            bool _900 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _902 = _898 || _900;
            float _904 = _874 * _876;
            float _906 = _904 * _904;
            float _908 = _906 + 11.33538818359375;
            float _910 = fma(_906, _908, 28.84246826171875);
            float _912 = fma(_906, _910, 19.6966705322265625);
            float _914 = fma(_906, -0.82336294651031494140625, -5.674867153167724609375);
            float _916 = fma(_906, _914, -6.565555095672607421875);
            float _918 = 1.0 / _912;
            float _920 = _906 * _916;
            float _922 = _904 * _920;
            float _924 = fma(_922, _918, _904);
            float _926 = _924;
            _812 = _890;
            if (_882)
            {
                float _928 = -_924;
                float _930 = _928 + 1.57079637050628662109375;
                _926 = _930;
            }
            float _932 = _926;
            int _934 = as_type<int>(_932);
            if (!_884)
            {
                float _936 = -_932;
                float _938 = _936 + 3.1415927410125732421875;
                _934 = as_type<int>(_938);
            }
            int _940 = _934;
            if (!_902)
            {
                int _942 = _892 | _940;
                _812 = as_type<float>(_942);
            }
        }
    }
    float _944 = _812;
    float _946 = _584 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _950 = _796 + _948;
    float _952 = _618 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _954 = _722 * _130;
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _958 = _946 + _956;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _964 = _952 + _962;
    float _966 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _968 = _950 * _950;
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[28].x, _960);
    float _972 = exp2(_954);
    float _974 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[28].z, _970);
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _980 = fma(_958, _958, _968);
    float _982 = precise::max(_944, -3.1415927410125732421875);
    float _984 = _768 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _986 = _976 >= 0.0;
    float _988 = _776 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _992 = 1.0 + _990;
    float _994 = fma(_964, _964, _980);
    float _996 = _984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _998 = precise::min(_982, 3.1415927410125732421875);
    float _1000 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1012 = _1010 != 0;
    float _1014 = 1.0 / _992;
    bool _1016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1018 = isnan(1.0);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1024 = _1020 || _1022;
    float _1026 = fma(_998, 0.15915493667125701904296875, 0.5);
    out.m_61.x = _974;
    out.m_61.y = _996;
    out.m_61.z = _1000;
    out.m_61.w = _978;
    bool _1028 = !_1004;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = -_972;
    float _1034 = _1032 + 1.0;
    bool _1036 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = in.m_63.x;
    float _1048 = in.m_63.y;
    float _1050 = in.m_63.z;
    float _1052 = rsqrt(_994);
    float _1054 = float(_790);
    float _1056 = _1044 ? _1034 : 0.0;
    float _1058 = fma(_130, 0.06666667759418487548828125, _1026);
    float _1060 = float(_718);
    float _1062 = _1000;
    int _1064 = _1030;
    if (_986)
    {
        out.m_47.x = 0.0;
    }
    if (_1024)
    {
        float _1066 = _1056 * _1014;
        _132 = _1066;
    }
    float _1068 = _132;
    if (_986)
    {
        _1062 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1070 = _1062;
    int _1072 = abs(_1030);
    float _1074 = float(_784);
    if (_986)
    {
        float _1076 = _1070 * 5.0;
        _1064 = as_type<int>(_1076);
    }
    int _1078 = _1064;
    float _1080 = _950 * _1052;
    bool _1082 = !_1008;
    int _1084 = _1082 ? 0 : 1;
    float _1086 = _958 * _1052;
    float _1088 = float(_1072);
    if (_986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3953 = as_type<float>(_1078);
        out.gl_Position.z = _3953;
    }
    int _1090 = abs(_1084);
    float _1092 = -_1080;
    float _1094 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1096 = -_1086;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _1100 = _1088 * _1054;
    bool _1102 = !_1012;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = _1094 * _1094;
    float _1108 = _154 + (-0.5);
    float _1110 = _964 * _1052;
    float _1112 = fma(_1098, _1098, _1106);
    float _1114 = _1100 * (-2.0);
    float _1116 = -_1110;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _964);
    int _1120 = abs(_1104);
    float _1122 = fma(_1114, _1046, _1046);
    float _1124 = float(_1090);
    float _1126 = fma(_568, _1114, _568);
    float _1128 = float(_1120);
    float _1130 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1122);
    float _1132 = fma(_1118, _1118, _1112);
    float _1134 = _1124 * _1060;
    float _1136 = _1128 * _1074;
    float _1138 = fma(_1126, _1068, _1130);
    float _1140 = _1050;
    if (_986)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1142 = -_1080;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[18].w, _796);
    float _1146 = -_1086;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[18].w, _946);
    float _1150 = _1058 * 6.283185482025146484375;
    float _1152 = -_1110;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1158 = _1144 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1162 = _1148 + _1160;
    float _1164 = _1134 * (-2.0);
    float _1166 = _1150 * 0.15915493667125701904296875;
    float _1168 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1170 = _154 + _454;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1174 = _1154 + _1172;
    float _1176 = fma(_578, _1164, _578);
    float _1178 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1168);
    float _1180 = _1138 * 0.15915493667125701904296875;
    float _1182 = fma(_1164, _1048, _1048);
    float _1184 = _1170 + (-1.0);
    float _1186 = _1136 * (-2.0);
    float _1188 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1178);
    float _1190 = _462 + (-0.5);
    float _1192 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1194 = fma(_1186, _1050, _1050);
    float _1196 = _454 + (-0.5);
    bool _1198 = _1188 >= 0.0;
    float _1200 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1182);
    float _1202 = fma(_1192, _1186, _1192);
    float _1204 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1194);
    float _1206 = sqrt(_1132);
    float _1208 = fma(_1176, _1068, _1200);
    float _1210 = fma(_1202, _1068, _1204);
    float _1212 = in.m_55.z;
    float _1214 = _1208 * 0.15915493667125701904296875;
    float _1216 = _1210 * 0.15915493667125701904296875;
    float _1218 = _1166 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1180;
    float _1224 = _1148;
    if (_1198)
    {
        _1140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1226 = _1140;
    int _1228 = as_type<int>(_1226);
    if (_1198)
    {
        out.m_47.x = 0.0;
    }
    if (_1198)
    {
        float _1230 = _1226 * 5.0;
        _1228 = as_type<int>(_1230);
    }
    int _1232 = _1228;
    float _1234 = _1180 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    if (_1198)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4198 = as_type<float>(_1232);
        out.gl_Position.z = _4198;
    }
    float _1238 = _1180 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _1214 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = _1214 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = _1216 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    if (_1198)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1254 = in.m_65.x;
    float _1256 = in.m_65.y;
    float _1258 = in.m_65.z;
    float _1260 = _1216 * 6.283185482025146484375;
    float _1262 = cos(_1260);
    float _1264 = fma(_1220, 0.5, 1.5);
    float _1266 = _1236 * _1244;
    float _1268 = _1240 * _1248;
    float _1270 = _1052 * _1206;
    float _1272 = _1264 * _404;
    float _1274 = _1264 * _406;
    float _1276 = _1264 * _1212;
    float _1278 = _1236 * _1248;
    float _1280 = fma(_1252, _1268, _1266);
    float _1282 = fma(_1252, _1266, _1268);
    float _1284 = _1240 * _1244;
    float _1286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1276);
    float _1288 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1292 = _1274 != 0.0;
    bool _1294 = isnan(_1274);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan(0.0);
    bool _1300 = _1296 || _1298;
    float _1302 = _1240 * _1262;
    float _1304 = _1248 * _1262;
    float _1306 = _1236 * _1262;
    float _1308 = _1244 * _1262;
    float _1310 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1274);
    float _1312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1272);
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1288);
    float _1316 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1318 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1320 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _1322 = _1272 == 0.0;
    bool _1324 = !_1300;
    bool _1326 = _1322 && _1324;
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1330 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1334 = -_1284;
    float _1336 = fma(_1252, _1278, _1334);
    float _1338 = _1270 * _1328;
    float _1340 = _1270 * _1330;
    float _1342 = _1270 * _1332;
    float _1344 = -_1278;
    float _1346 = fma(_1252, _1284, _1344);
    float _1348 = _1310 * _1338;
    float _1350 = _1312 * _1340;
    float _1352 = _1286 * _1342;
    float _1354 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1356 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1358 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1360 = _1302 * _1348;
    float _1362 = -_1252;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1354);
    float _1366 = -_1252;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1370 = -_1252;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1358);
    float _1374 = -_1348;
    float _1376 = _1252 * _1374;
    float _1378 = fma(_1280, _1350, _1360);
    float _1380 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1382 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1290);
    float _1384 = fma(_1304, _1350, _1376);
    float _1386 = _1306 * _1348;
    float _1388 = fma(_1346, _1352, _1378);
    float _1390 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1380);
    float _1392 = fma(_1308, _1352, _1384);
    float _1394 = fma(_1336, _1350, _1386);
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1400 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1390);
    float _1402 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1314);
    float _1404 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1382);
    float _1406 = fma(_1282, _1352, _1394);
    float _1408 = in.m_67.x;
    float _1410 = in.m_67.y;
    float _1412 = in.m_67.z;
    float _1414 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1396);
    float _1416 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1398);
    bool _1418 = _1276 == 0.0;
    bool _1420 = _1418 && _1326;
    float _1422 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1424 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1414);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1416);
    float _1428 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1430 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1436 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1428);
    float _1438 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1364);
    float _1440 = _946 + _1432;
    float _1442 = _952 + _1434;
    float _1444 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1422);
    float _1446 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1430);
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1450 = _1440 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1454 = _1442 + _1452;
    float _1456 = in.m_69.x;
    float _1458 = in.m_69.y;
    float _1460 = in.m_69.z;
    float _1462 = in.m_69.w;
    float _1464 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1368);
    float _1466 = _1450 * _1450;
    float _1468 = _1454 * _1454;
    float _1470 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1372);
    float _1472 = 0.0;
    float _1474 = _1434;
    float _1476 = _1466;
    float _1478 = _1468;
    float _1480 = _1440;
    float _1482 = _1442;
    if (_1420)
    {
        _1472 = _1408;
    }
    float _1484 = _1472;
    float _1486 = _1466 + _1468;
    float _1488 = 0.0;
    float _1490 = _1484;
    if (_1420)
    {
        _1488 = _1412;
    }
    float _1492 = _1488;
    float _1494 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1444);
    float _1496 = 0.0;
    float _1498 = _1492;
    if (_1420)
    {
        _1496 = _1484;
    }
    float _1500 = _1496;
    float _1502 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1436);
    float _1504 = _1500;
    if (!_1420)
    {
        _1490 = _1408;
    }
    float _1506 = _1490;
    float _1508 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1446);
    float _1510 = sqrt(_1486);
    if (_1420)
    {
        _1222 = _1492;
    }
    float _1512 = _1222;
    float _1514 = _1512;
    if (!_1420)
    {
        _1498 = _1412;
    }
    float _1516 = _1498;
    float _1518 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1420)
    {
        _1474 = _1410;
    }
    float _1520 = _1474;
    float _1522 = _1520;
    if (!_1420)
    {
        float _1524 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1506);
        _1504 = _1524;
    }
    float _1526 = _1504;
    if (!_1420)
    {
        float _1528 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1410);
        _1522 = _1528;
    }
    float _1530 = _1522;
    float _1532 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1518);
    if (!_1420)
    {
        float _1534 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1516);
        _1514 = _1534;
    }
    float _1536 = _1514;
    float _1538 = _1456 * _1410;
    float _1540 = _1438 * _1458;
    float _1542 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1532);
    float _1544 = _1458 * _1516;
    float _1546 = _1464 * _1458;
    float _1548 = _1470 * _1458;
    bool _1550 = _1510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1554 = -_1544;
    float _1556 = fma(_1460, _1410, _1554);
    float _1558 = _1460 * _1506;
    float _1560 = -_1538;
    float _1562 = fma(_1458, _1506, _1560);
    float _1564 = _796 + _1552;
    float _1566 = fma(_1400, _1456, _1540);
    float _1568 = fma(_1402, _1456, _1546);
    float _1570 = fma(_1404, _1456, _1548);
    float _1572 = -_1558;
    float _1574 = fma(_1456, _1516, _1572);
    float _1576 = _1458;
    if (!_1550)
    {
        _1576 = _1466;
    }
    float _1578 = _1576;
    float _1580 = _1578;
    if (!_1550)
    {
        _1476 = _1564;
    }
    float _1582 = _1476;
    bool _1584 = !_1550;
    float _1586 = _1582;
    if (!_1584)
    {
        float _1588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1592 = _1510 + _1590;
        float _1594 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = rsqrt(_1486);
        float _1598 = _1592 * _1588;
        float _1600 = _1598 * 0.15915493667125701904296875;
        float _1602 = _1600 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = fma(_1604, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1612 = _1596 * _1610;
        float _1614 = _1608 + (-1.0);
        float _1616 = fma(_1450, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1618 = fma(_1454, _1612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1620 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1624 = _1616 + _1622;
        float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1628 = _1618 + _1626;
        float _1630 = fma(_1564, _1608, _1620);
        float _1632 = _1624 * _1624;
        float _1634 = _1628 * _1628;
        _1586 = _1630;
        _1580 = _1632;
        _1478 = _1634;
        _1480 = _1616;
        _1482 = _1618;
    }
    float _1636 = _1586;
    float _1638 = _1580;
    float _1640 = _1478;
    float _1642 = _1480;
    float _1644 = _1482;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1648 = _1636 + _1646;
    float _1650 = _1464 * _1530;
    float _1652 = _1470 * _1530;
    float _1654 = _1556 * _1462;
    float _1656 = fma(_1648, _1648, _1638);
    float _1658 = _1574 * _1462;
    float _1660 = _1562 * _1462;
    float _1662 = _1438 * _1530;
    float _1664 = _1656 + _1640;
    float _1666 = _1658 * _1464;
    float _1668 = _1658 * _1438;
    float _1670 = _1658 * _1470;
    float _1672 = fma(_1400, _1526, _1662);
    float _1674 = fma(_1654, _1402, _1666);
    float _1676 = sqrt(_1664);
    float _1678 = fma(_1402, _1526, _1650);
    float _1680 = fma(_1404, _1526, _1652);
    float _1682 = fma(_1654, _1400, _1668);
    float _1684 = fma(_1654, _1404, _1670);
    float _1686 = fma(_1494, _1460, _1566);
    float _1688 = fma(_1502, _1460, _1568);
    float _1690 = fma(_1508, _1460, _1570);
    float _1692 = fma(_1660, _1502, _1674);
    float _1694 = fma(_1494, _1536, _1672);
    float _1696 = fma(_1502, _1536, _1678);
    float _1698 = fma(_1508, _1536, _1680);
    float _1700 = fma(_1660, _1494, _1682);
    float _1702 = fma(_1660, _1508, _1684);
    out.m_71.x = _1686;
    out.m_71.y = _1688;
    out.m_71.z = _1690;
    bool _1704 = _1676 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1706 = isnan(_1676);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1712 = _1708 || _1710;
    out.m_73.x = _1694;
    out.m_73.y = _1696;
    out.m_73.z = _1698;
    out.m_75.x = _1700;
    out.m_75.y = _1692;
    out.m_75.z = _1702;
    float _1714 = _1682;
    float _1716 = _1700;
    float _1718 = _1692;
    if (!_1712)
    {
        _1714 = 1.0;
    }
    float _1720 = _1714;
    bool _1722 = !_1712;
    float _1724 = _1720;
    if (!_1722)
    {
        bool _1726 = _1676 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1728 = isnan(_1676);
        bool _1730 = _1726 || _1728;
        bool _1732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1734 = _1730 || _1732;
        if (!_1734)
        {
            float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1738 = _1676 + _1736;
            float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1742 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1740;
            float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1746 = _1744 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1748 = 1.0 / _1742;
            float _1750 = _1738 * _1748;
            float _1752 = fma(_1750, _1746, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1724 = _1752;
            _1754 = true;
        }
        else
        {
            bool _1756 = _1676 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1758 = isnan(_1676);
            bool _1760 = _1756 || _1758;
            bool _1762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1764 = _1760 || _1762;
            if (!_1764)
            {
                float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1768 = _1676 + _1766;
                float _1770 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1772 = _1770 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1774 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1776 = _1774 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1778 = 1.0 / _1772;
                float _1780 = _1768 * _1778;
                float _1782 = fma(_1780, _1776, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1724 = _1782;
                _1754 = true;
            }
            else
            {
                _1724 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1754 = false;
    float _1784 = _1724;
    float _1786 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1788 = _1642 + _1786;
    float _1790 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1792 = _1644 + _1790;
    bool _1794 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan(0.5);
    bool _1802 = _1798 || _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1806 = _1636 + _1804;
    float _1808 = fma(_1788, _1784, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1810 = fma(_1792, _1784, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1812 = fma(_1806, _1784, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1814 = -_1086;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1808);
    float _1818 = -_1110;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1810);
    float _1822 = -_1080;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1812);
    float _1826 = _1824;
    float _1828 = _1816;
    float _1830 = _1820;
    if (!_1802)
    {
        float _1832 = _1158 * _1158;
        float _1834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1836 = -_952;
        float _1838 = _1836 + _1810;
        float _1840 = fma(_1162, _1162, _1832);
        float _1842 = fma(_1174, _1174, _1840);
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1846 = sqrt(_1842);
        float _1848 = 1.0 / _1270;
        float _1850 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1852 = precise::min(_1846, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1854 = _1852 * _1834;
        float _1856 = -_946;
        float _1858 = _1856 + _1808;
        float _1860 = -_796;
        float _1862 = _1860 + _1812;
        float _1864 = _1854 * _1848;
        float _1866 = _1850 * _1864;
        float _1868 = _1838 * _1864;
        float _1870 = fma(_1858, _1866, _1148);
        float _1872 = fma(_1862, _1866, _1144);
        float _1874 = fma(_1850, _1868, _1154);
        _1826 = _1872;
        _1828 = _1870;
        _1830 = _1874;
    }
    float _1876 = _1826;
    float _1878 = _1828;
    float _1880 = _1830;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1884 = _1876 + _1882;
    float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1888 = _1878 + _1886;
    float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1892 = _1880 + _1890;
    float _1894 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1896 = _1884 * _1884;
    float _1898 = fma(_1888, _1888, _1896);
    float _1900 = fma(_1892, _1892, _1898);
    float _1902 = rsqrt(_1900);
    float _1904 = sqrt(_1900);
    float _1906 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1908 = _1888 * _1906;
    float _1910 = _1892 * _1906;
    float _1912 = _1908 * _1908;
    float _1914 = _1910 * _1910;
    float _1916 = _1912 + _1914;
    float _1918 = sqrt(_1916);
    bool _1920 = _1918 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1924 = _1918 + _1922;
    float _1926 = _1902;
    float _1928 = _1924;
    float _1930 = _1884;
    float _1932 = _1906;
    if (_1920)
    {
        float _1934 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1926 = _1934;
    }
    float _1936 = _1926;
    if (_1920)
    {
        float _1938 = rsqrt(_1916);
        _1716 = _1938;
    }
    float _1940 = _1716;
    float _1942 = _1940;
    if (_1920)
    {
        float _1944 = _1924 * _1936;
        _1928 = _1944;
    }
    float _1946 = _1928;
    if (_1920)
    {
        float _1948 = _1946 * 0.15915493667125701904296875;
        _1718 = _1948;
    }
    float _1950 = _1718;
    float _1952 = _1936;
    float _1954 = _1950;
    if (_1920)
    {
        float _1956 = _1950 * 6.283185482025146484375;
        float _1958 = sin(_1956);
        _1952 = _1958;
    }
    float _1960 = _1952;
    float _1962 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1964 = precise::max(0.0, _1962);
    float _1966 = _1892;
    float _1968 = _1964;
    if (_1920)
    {
        float _1970 = _1950 * 6.283185482025146484375;
        float _1972 = cos(_1970);
        _1966 = _1972;
    }
    float _1974 = _1966;
    float _1976 = -_1906;
    float _1978 = -_1964;
    float _1980 = fma(_1884, _1976, _1978);
    if (!_1920)
    {
        _1930 = _1910;
    }
    float _1982 = _1930;
    float _1984 = _1982;
    if (_1920)
    {
        float _1986 = _1980 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1968 = _1986;
    }
    float _1988 = _1968;
    float _1990 = _1960;
    float _1992 = _1988;
    if (_1920)
    {
        float _1994 = fma(_1960, _1988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1990 = _1994;
    }
    float _1996 = _1990;
    float _1998 = _1996;
    float _2000 = _1974;
    if (_1920)
    {
        float _2002 = _1974 + (-1.0);
        _1992 = _2002;
    }
    float _2004 = _1992;
    float _2006 = _2004;
    if (_1920)
    {
        float _2008 = _1940 * _1996;
        _1932 = _2008;
    }
    float _2010 = _1932;
    if (!_1920)
    {
        _1942 = _1908;
    }
    float _2012 = _1942;
    float _2014 = _2012;
    if (_1920)
    {
        float _2016 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _2016;
    }
    float _2018 = _1954;
    if (_1920)
    {
        float _2020 = _1908 * _2010;
        _2014 = _2020;
    }
    float _2022 = _2014;
    if (!_1920)
    {
        _1998 = _1980;
    }
    float _2024 = _1998;
    float _2026 = _2024;
    if (_1920)
    {
        float _2028 = _1910 * _2010;
        _1984 = _2028;
    }
    float _2030 = _1984;
    if (!_1920)
    {
        _2006 = _1912;
    }
    float _2032 = _2006;
    float _2034 = _2032;
    if (_1920)
    {
        float _2036 = fma(_1980, _1974, _2018);
        _2026 = _2036;
    }
    float _2038 = _2026;
    if (_1920)
    {
        float _2040 = _2022 * _2022;
        _2034 = _2040;
    }
    float _2042 = _2034;
    if (!_1920)
    {
        _2000 = _1914;
    }
    float _2044 = _2000;
    float _2046 = _2044;
    if (_1920)
    {
        float _2048 = _2030 * _2030;
        _2046 = _2048;
    }
    float _2050 = _2046;
    float _2052 = fma(_2038, _2038, _2042);
    float _2054 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2056 = _2052 + _2050;
    float _2058 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2054);
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2062 = fma(_1904, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2060);
    float _2064 = precise::clamp(_2062, 0.0, 1.0);
    float _2066 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2068 = rsqrt(_2056);
    float _2070 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2058);
    float _2072 = -_2064;
    float _2074 = _2072 + 1.0;
    float _2076 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2078 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2066);
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2082 = _1876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2084 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2076);
    float _2086 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2078);
    float _2088 = abs(_2074);
    float _2090 = log2(_2088);
    float _2092 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2082);
    float _2094 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2084);
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2098 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2100 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2102 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2104 = _2068 * _2022;
    float _2106 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2108 = _2068 * _2038;
    float _2110 = -_2098;
    float _2112 = fma(_2110, _1894, 1.0);
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2116 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2118 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2106);
    float _2120 = _2068 * _2030;
    float _2122 = -_2114;
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2122);
    float _2126 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2128 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2118);
    float _2130 = log2(_2112);
    float _2132 = -_2120;
    float _2134 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2124);
    float _2136 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2138 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2128);
    float _2140 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2142 = fma(_2134, -0.5, 0.5);
    float _2144 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2136);
    float _2146 = fma(_2134, 0.5, 0.5);
    float _2148 = exp2(_2126);
    float _2150 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2140);
    float _2152 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2144);
    float _2154 = _2108 + 1.0;
    float _2156 = fma(_2146, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2158 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2150);
    float _2160 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2152);
    float _2162 = 1.0 / _2138;
    float _2164 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2158);
    float _2166 = fma(_2146, _2156, -0.212114393711090087890625);
    float _2168 = _2130 * 0.693147182464599609375;
    float _2170 = fma(_2146, _2166, 1.570728778839111328125);
    float _2172 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2174 = sqrt(_2142);
    float _2176 = -_2108;
    float _2178 = fma(_2148, _2154, _2176);
    float _2180 = fma(_2178, 0.5, 0.5);
    float _2182 = _2160 * _2162;
    float _2184 = _2164 * _2162;
    float _2186 = fma(_2182, 0.5, 0.5);
    float _2188 = fma(_2184, -0.5, 0.5);
    float _2190 = _2174 * 0.636619746685028076171875;
    float3 _5798 = float3(_2186, _2188, _2172);
    float _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5798, float3(0.0), isnan(_5798)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5798, float3(0.0), isnan(_5798)), level(0.0)).x;
    float3 _5809 = float3(_2186, _2188, _2172);
    float4 _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5809, float3(0.0), isnan(_5809)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5809, float3(0.0), isnan(_5809)), level(0.0)).xyzw;
    float _2197 = _2195.x;
    float _2199 = _2195.y;
    float _2201 = _2195.z;
    float _2203 = _2195.w;
    float _2205 = -_2170;
    float _2207 = fma(_2190, _2205, 1.0);
    float2 _5831 = float2(_2207, _2180);
    float3 _2211 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5831, float2(0.0), isnan(_5831)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5831, float2(0.0), isnan(_5831)), level(0.0)).xyz;
    float _2213 = _2211.x;
    float _2215 = _2211.y;
    float _2217 = _2211.z;
    float _2219 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2221 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2219);
    bool _2223 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2225 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan(0.5);
    bool _2231 = _2227 || _2229;
    float _2233 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2221);
    float _2235 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2237 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2239 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2235);
    float _2241 = 1.0 / _2237;
    float _2243 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2239);
    float _2245 = _2096;
    float _2247 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2249 = _2237;
    if (!_2231)
    {
        _1224 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2251 = _1224;
    float _2253 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2255 = _2253 + _2237;
    float _2257 = _2255 * _2241;
    float _2259 = _2257 * 0.5;
    float _2261 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2263 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2265 = _2259;
    float _2267 = _2251;
    if (_2231)
    {
        _2245 = 1.0;
    }
    float _2269 = _2245;
    float _2271 = _2269;
    if (!_2231)
    {
        float _2273 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2275 = fma(_2259, _2251, _2273);
        _2265 = _2275;
    }
    float _2277 = _2265;
    if (!_2231)
    {
        _2267 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2279 = _2267;
    float _2281 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2263);
    float _2283 = exp2(_2261);
    if (!_2231)
    {
        float _2285 = -_2279;
        float _2287 = _2285 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2247 = _2287;
    }
    float _2289 = _2247;
    float _2291 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2281);
    float _2293 = _2277;
    if (!_2231)
    {
        float _2295 = 1.0 / _2277;
        _2293 = _2295;
    }
    float _2297 = _2293;
    float _2299 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2291);
    float _2301 = _2289;
    if (!_2231)
    {
        float _2303 = 1.0 / _2289;
        _2301 = _2303;
    }
    float _2305 = _2301;
    if (!_2231)
    {
        float _2307 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2309 = -_2279;
        float _2311 = fma(_2297, _2307, _2309);
        _2249 = _2311;
    }
    float _2313 = _2249;
    float _2315 = _2313;
    if (!_2231)
    {
        float _2317 = _2313 * _2305;
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        _2315 = _2319;
    }
    float _2321 = _2315;
    if (!_2231)
    {
        float _2323 = -_2321;
        float _2325 = _2323 + 1.0;
        _2271 = _2325;
    }
    float _2327 = _2271;
    float _2329 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2331 = _2327 > 0.0;
    bool _2333 = isnan(_2327);
    bool _2335 = _2331 || _2333;
    bool _2337 = isnan(0.0);
    bool _2339 = _2335 || _2337;
    float _2341 = _242 * _2329;
    float _2343 = -_2283;
    float _2345 = _2343 + 1.0;
    float _2347 = _2299 + _2138;
    float _2349 = _2341 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2351 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2353 = _2347 * 0.5;
    out.gl_Position.x = _2160;
    out.gl_Position.y = _2164;
    out.gl_Position.z = _2299;
    out.gl_Position.w = _2138;
    out.m_77.z = _2353;
    out.m_77.w = _2138;
    out.m_47.x = _2349;
    float _2355 = _2351 * _2192;
    float _2357 = -_2351;
    float _2359 = _2357 + 1.0;
    float _2361 = _2203 * _2355;
    float _2363 = _2217 * _2355;
    float _2365 = fma(_2213, _2361, _2197);
    float _2367 = fma(_2215, _2361, _2199);
    float _2369 = _2203 * _2359;
    float _2371 = fma(_2203, _2363, _2201);
    out.m_79.x = _2365;
    out.m_79.y = _2367;
    out.m_79.z = _2371;
    out.m_79.w = _2369;
    if (_2339)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2373;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

