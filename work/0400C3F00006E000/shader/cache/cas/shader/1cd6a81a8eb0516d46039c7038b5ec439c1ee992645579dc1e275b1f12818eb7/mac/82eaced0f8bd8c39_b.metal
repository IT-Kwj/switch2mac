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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_65 [[user(locn7)]];
    float4 m_71 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_49 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _774 = false;
    bool _582 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2670 = as_type<float>(_106);
        out.gl_Position.z = _2670;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2739 = as_type<float>(_144);
        out.gl_Position.z = _2739;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.x;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_49.y;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.w;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _148;
    if (!_160)
    {
        float _180 = _148 * _148;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_53.x = _146;
    out.m_53.y = _150;
    bool _192 = !_160;
    float _194 = _190;
    float _196 = _146;
    if (!_192)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _148 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _148);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _226;
    }
    float _228 = _194;
    bool _230 = !_160;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _148 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _178 = _250;
    }
    float _252 = _178;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _164, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _168, _260);
    float _268 = fma(_262, _162, _170);
    float _270 = fma(_264, _162, _172);
    float _272 = fma(_266, _162, _174);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_55.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_90);
        float _298 = 1.0 / _296;
        float _300 = _124 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _310 = _302 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _314 = _302 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _332 = 1.0 / _318;
    bool _334 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _336 = isnan(_302);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _322;
    bool _348 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _350 = isnan(_302);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _362 = 1.0 / _326;
    float _364 = _306 * _332;
    bool _366 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _368 = isnan(_302);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = 1.0 / _330;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _382 = _302 + _380;
    float _384 = _382 * _346;
    bool _386 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _388 = isnan(_302);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = _310 * _362;
    float _400 = -_376;
    float _402 = _400 + 1.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _404;
    float _408 = -_396;
    float _410 = _408 + 1.0;
    float _412 = _358 * _402;
    float _414 = -_358;
    float _416 = _414 + 1.0;
    float _418 = _376 * _410;
    float _420 = _314 * _378;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _426;
    float _430 = fma(_406, _398, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _432 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _434 = isnan(_302);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_424, _398, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _446 = fma(_428, _398, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _448 = _344 * _416;
    float _450 = -_344;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _466 = _442 * _452;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = fma(_456, _420, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _474 = fma(_460, _420, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _476 = _430 * _466;
    float _478 = _444 * _466;
    float _480 = _446 * _466;
    float _482 = fma(_464, _420, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _484 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[107].x, _476);
    float _486 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[107].y, _478);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _496;
    float _500 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[107].z, _480);
    float _502 = fma(_472, _448, _484);
    float _504 = fma(_474, _448, _486);
    float _506 = fma(_490, _364, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _508 = fma(_494, _364, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _510 = fma(_498, _364, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _524 = fma(_482, _448, _500);
    float _526 = fma(_514, _384, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _528 = fma(_518, _384, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _530 = fma(_522, _384, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _532 = fma(_506, _412, _502);
    float _534 = fma(_508, _412, _504);
    float _536 = fma(_510, _412, _524);
    float _538 = fma(_526, _418, _532);
    float _540 = fma(_528, _418, _534);
    float _542 = fma(_530, _418, _536);
    float _544 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[111].x, _538);
    float _546 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[111].y, _540);
    float _548 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[111].z, _542);
    float _550 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _552 = _546 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _554 = _548 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _556 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _562 = !_360;
    float _580;
    if (!_562)
    {
        float _564 = in.m_55.x;
        float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _568 = _564 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _572 = _570 * _566;
        float _574 = floor(_572);
        float _576 = -_574;
        float _578 = _572 + _576;
        _580 = _578;
        _582 = true;
    }
    else
    {
        float _584 = float(_90);
        float _586 = 1.0 / _584;
        float _588 = _124 * _586;
        _580 = _588;
    }
    _582 = false;
    float _590 = _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _594 = _590 + _592;
    bool _596 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _598 = isnan(_590);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _610 = _590 + _608;
    bool _612 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _614 = isnan(_590);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _632 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _634 = isnan(_590);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -_606;
    float _646 = _644 + 1.0;
    float _648 = 1.0 / _630;
    float _650 = _642 * _646;
    float _652 = -_642;
    float _654 = _652 + 1.0;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _656;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _662 = 1.0 / _626;
    float _664 = _622 * _654;
    float _666 = -_622;
    float _668 = _666 + 1.0;
    float _670 = _610 * _648;
    float _672 = _594 * _662;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _678;
    float _682 = fma(_658, _672, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _684 = fma(_676, _672, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _686 = fma(_680, _672, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _688 = in.m_51.x;
    float _690 = in.m_51.y;
    float _692 = in.m_51.z;
    float _694 = _682 * _664;
    float _696 = _684 * _664;
    float _698 = _686 * _664;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _712 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[123].x, _694);
    float _714 = fma(_702, _670, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _716 = fma(_706, _670, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _718 = fma(_710, _670, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _720 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[123].y, _696);
    float _722 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[123].z, _698);
    float _724 = fma(_714, _650, _712);
    float _726 = fma(_716, _650, _720);
    float _728 = fma(_718, _650, _722);
    float _730 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[125].x, _724);
    float _732 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[125].y, _726);
    float _734 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[125].z, _728);
    float _736 = _730 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _738 = _692 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _740 = _690 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _742 = _732 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _744 = _734 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _746 = _688 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _754 = !_660;
    float _772;
    if (!_754)
    {
        float _756 = in.m_55.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_90);
        float _778 = 1.0 / _776;
        float _780 = _124 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = in.m_55.x;
    float _786 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _788 = in.m_55.y;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _792 = _790 != 0;
    float _794 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _796 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _802 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _794);
    float _804 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _786);
    float _806 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _796);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _812 = 1.0 / _800;
    float _814 = 1.0 / _810;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _826 = _824 != 0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _834 = _784 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _836 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _844 = -_832;
    float _846 = fma(_834, 2.0, _844);
    float _848 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _850 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _836);
    float _852 = 1.0 / _842;
    float _854 = fma(_848, -2.0, _838);
    float _856 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _858 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _804);
    float _860 = -_124;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[76].x, _846);
    float _864 = 1.0 / _830;
    float _866 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _872 = in.m_55.z;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _882 = 1.0 / _870;
    float _884 = _876 * _814;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _886;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _898;
    float _902 = 1.0 / _880;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _916 = _906 * _864;
    float _918 = _914 * _812;
    float _920 = 1.0 / _896;
    float _922 = _892 * _882;
    float _924 = _788 * 2.0;
    float _926 = _872 * 2.0;
    float _928 = _788 + _872;
    float _930 = _900 * _852;
    float _932 = _928 + (-1.0);
    float _934 = _784 + _872;
    float _936 = floor(_926);
    float _938 = _888 * _902;
    float _940 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _942 = _934 + (-1.0);
    float _944 = (*spvDescriptorSet0.vp_c8)._m0[32].y * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _946 = _910 * _920;
    float _948 = _784 * 2.0;
    float _950 = floor(_924);
    float _952 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _954 = _784 + _788;
    float _956 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _850);
    bool _958 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _960 = isnan(_782);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _954 + (-1.0);
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _974 = _924;
    bool _976 = _822;
    float _978 = _784;
    if (!_792)
    {
        _972 = _872;
    }
    float _980 = _972;
    float _982 = floor(_948);
    float _984 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _944);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _988 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _990 = isnan(_782);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = -_968;
    float _1002 = _1000 + 1.0;
    bool _1004 = _936 >= 0.0;
    bool _1006 = isnan(_936);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan(0.0);
    bool _1012 = _1008 || _1010;
    float _1014 = _858 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1016 = _936 > 0.0;
    float _1018 = -_998;
    float _1020 = _1018 + 1.0;
    bool _1022 = _950 >= 0.0;
    bool _1024 = isnan(_950);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    float _1032 = _998 * _1002;
    bool _1034 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1036 = isnan(_782);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1048 = log2(_1046);
    float _1050 = _936;
    float _1052 = _980;
    if (!_792)
    {
        _974 = _788;
    }
    float _1054 = _974;
    float _1056 = _856 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1058 = _1054;
    if (!_792)
    {
        _1050 = _872;
    }
    float _1060 = _1050;
    float _1062 = -_1044;
    float _1064 = _1062 + 1.0;
    float _1066 = _1060;
    if (_792)
    {
        _1058 = _784;
    }
    float _1068 = _1058;
    float _1070 = _1044 * _1020;
    if (_792)
    {
        _1066 = _788;
    }
    float _1072 = _1066;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1076 = _1014 + _1074;
    if (_792)
    {
        _1052 = _788;
    }
    float _1078 = _1052;
    float _1080 = _866 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1082 = _950 > 0.0;
    float _1084 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1086 = _1012 ? 0 : 1;
    float _1088 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _854);
    int _1090 = _1030 ? 0 : 1;
    float _1092 = _1048 * _124;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1096 = _1056 + _1094;
    bool _1098 = _982 > 0.0;
    float _1100 = _1076 * _1076;
    bool _1102 = _982 >= 0.0;
    bool _1104 = isnan(_982);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.0);
    bool _1110 = _1106 || _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1114 = _782 + _1112;
    bool _1116 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1118 = isnan(_782);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = fma((*spvDescriptorSet0.vp_c8)._m0[32].z, (*spvDescriptorSet0.vp_c8)._m0[32].z, _984);
    bool _1130 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1132 = isnan(_782);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = fma(_884, _1114, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1146 = _782 + _1144;
    float _1148 = _1126 * _1064;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1152 = _782 + _1150;
    float _1154 = -_1126;
    float _1156 = _1154 + 1.0;
    bool _1158 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1160 = isnan(_782);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    float _1170 = -_1140;
    float _1172 = _1170 + 1.0;
    float _1174 = fma(_918, _1146, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1176 = fma(_930, _1152, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1180 = _782 + _1178;
    bool _1182 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1184 = isnan(_782);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = _1140 * _1156;
    float _1196 = _1168 * _1172;
    float _1198 = -_1168;
    float _1200 = _1198 + 1.0;
    float _1202 = fma(_916, _1180, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1204 = _1192 * _1200;
    bool _1206 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1208 = isnan(_782);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -_1192;
    float _1220 = _1218 + 1.0;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1226 = _1216 * _1220;
    float _1228 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1222);
    float _1230 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1224);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1234 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1236 = _1142 * _1226;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1240 = -_1216;
    float _1242 = _1240 + 1.0;
    float _1244 = -_1232;
    float _1246 = fma(_1234, 2.0, _1244);
    bool _1248 = !_818;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = fma(_1084, -2.0, _1238);
    int _1254 = ~_1086;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    float _1260 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1236);
    int _1262 = _1258;
    bool _1264 = _1110;
    int _1266 = as_type<int>(_1260);
    if (!_1016)
    {
        int _1268 = ~_1086;
        int _1270 = _1268 + 1;
        _1262 = _1270;
    }
    int _1272 = _1262;
    float _1274 = exp2(_1092);
    int _1276 = abs(_1250);
    float _1278 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1230);
    int _1280 = ~_1090;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    float _1286 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1252);
    int _1288 = _1110 ? 0 : 1;
    float _1290 = fma(_1096, _1096, _1100);
    int _1292 = _1284;
    if (!_1082)
    {
        int _1294 = ~_1090;
        int _1296 = _1294 + 1;
        _1292 = _1296;
    }
    int _1298 = _1292;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1302 = _1080 + _1300;
    bool _1304 = !_826;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = float(_1276);
    float _1310 = fma(_1302, _1302, _1290);
    float _1312 = float(_1272);
    float _1314 = -_1274;
    float _1316 = _1314 + 1.0;
    int _1318 = ~_1288;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    int _1324 = _1322;
    if (!_1098)
    {
        int _1326 = ~_1288;
        int _1328 = _1326 + 1;
        _1324 = _1328;
    }
    int _1330 = _1324;
    float _1332 = _1308 * _1312;
    int _1334 = abs(_1306);
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1338 = float(_1298);
    float _1340 = _1332 * (-2.0);
    float _1342 = float(_1334);
    float _1344 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1336);
    float _1346 = -_124;
    float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1246);
    float _1350 = _1342 * _1338;
    bool _1352 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1354 = isnan(0.0);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1360 = _1356 || _1358;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1364 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1344);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1368 = 1.0 + _1366;
    float _1370 = rsqrt(_956);
    bool _1372 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1374 = isnan(1.0);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1380 = _1376 || _1378;
    float _1382 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1362);
    float _1384 = _1360 ? _1316 : 0.0;
    float _1386 = float(_1330);
    float _1388 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1382);
    float _1390 = 1.0 / _1368;
    float _1392 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _788);
    float _1394 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1396 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1228);
    float _1398 = _1350 * (-2.0);
    float _1400 = fma(_986, _1340, _986);
    bool _1402 = !_822;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = _1394 * (-0.15915493667125701904296875);
    float _1408 = fma(_952, _1398, _952);
    float _1410 = -_1080;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1414 = in.m_57.x;
    float _1416 = in.m_57.y;
    float _1418 = in.m_57.z;
    int _1420 = abs(_1404);
    float _1422 = _1406 * 6.283185482025146484375;
    float _1424 = cos(_1422);
    float _1426 = _1412;
    if (_1380)
    {
        float _1428 = _1384 * _1390;
        _128 = _1428;
    }
    float _1430 = _128;
    float _1432 = _784 + (-0.5);
    float _1434 = float(_1420);
    float _1436 = _872 + (-0.5);
    float _1438 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1440 = abs(_1096);
    float _1442 = abs(_1412);
    float _1444 = precise::max(_1440, _1442);
    float _1446 = _1406 * 6.283185482025146484375;
    float _1448 = sin(_1446);
    float _1450 = _1434 * _1386;
    float _1452 = fma(_1400, _1430, _1438);
    bool _1454 = _1444 >= 16.0;
    float _1456 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1458 = in.m_59.x;
    float _1460 = _1452 * 0.15915493667125701904296875;
    float _1462 = _1096 * 0.0625;
    float _1464 = rsqrt(_1310);
    float _1466 = fma(_1408, _1430, _1456);
    float _1468 = _1450 * (-2.0);
    float _1470 = _1454 ? _1462 : _1096;
    float _1472 = _1466 * 0.15915493667125701904296875;
    float _1474 = _1416 + 0.100000001490116119384765625;
    float _1476 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _784);
    float _1478 = _1448 * _1418;
    if (_1454)
    {
        float _1480 = _1412 * 0.0625;
        _1426 = _1480;
    }
    float _1482 = _1426;
    float _1484 = abs(_1470);
    bool _1486 = _1484 != 0.0;
    bool _1488 = isnan(_1484);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.0);
    bool _1494 = _1490 || _1492;
    float _1496 = _1460 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = -_1478;
    float _1502 = fma(_1424, _1474, _1500);
    float _1504 = fma(_940, _1468, _940);
    float _1506 = abs(_1482);
    bool _1508 = _1506 == 0.0;
    bool _1510 = !_1494;
    bool _1512 = _1508 && _1510;
    float _1514 = _1502 + (-0.100000001490116119384765625);
    float _1516 = _1076 * _1464;
    float _1518 = _1096 * _1464;
    float _1520 = _1460 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = _1514 + _1476;
    float _1526 = _1514 + _1392;
    float _1528 = abs(_1482);
    bool _1530 = _1528 == 0.0;
    float _1532 = _1302 * _1464;
    float _1534 = _1524 * 8.0;
    float _1536 = _1472 * 6.283185482025146484375;
    float _1538 = cos(_1536);
    float _1540 = _1534 * 0.15915493667125701904296875;
    float _1542 = _1526 * 10.0;
    float _1544 = fma(_1174, _1204, _1260);
    float _1546 = -_1516;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1076);
    float _1550 = -_1518;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1096);
    float _1554 = _1542 * 0.15915493667125701904296875;
    float _1556 = _788 + (-0.5);
    float _1558 = _1540 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = _1548 * _1548;
    if (_1512)
    {
        bool _1564 = as_type<int>(_1482) >= 0;
        _1264 = _1564;
    }
    bool _1566 = _1264;
    float _1568 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1570 = -_1532;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1302);
    float _1574 = fma(_1552, _1552, _1562);
    float _1576 = _1572;
    int _1578 = _1566 ? (-1) : 0;
    if (_1512)
    {
        int _1580 = _1566 ? 0 : 1078530011;
        _1266 = _1580;
    }
    int _1582 = _1266;
    float _1584 = fma(_1176, _1196, _1544);
    float _1586 = _1554 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    float _1590 = fma(_1504, _1430, _1568);
    float _1592 = fma(_1572, _1572, _1574);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1596 = _782 + _1594;
    int _1598 = _1582;
    if (_1512)
    {
        int _1600 = int(0x80000000) & as_type<int>(_1470);
        int _1602 = _1582 | _1600;
        _1576 = as_type<float>(_1602);
    }
    float _1604 = _1576;
    bool _1606 = !_1494;
    bool _1608 = _1606 && _1530;
    float _1610 = _1604;
    float _1612 = _1604;
    if (!_1608)
    {
        float _1614 = abs(_1470);
        bool _1616 = _1614 != as_type<float>(0x7f800000u /* inf */);
        bool _1618 = isnan(_1614);
        bool _1620 = _1616 || _1618;
        bool _1622 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1624 = _1620 || _1622;
        float _1626 = abs(_1482);
        bool _1628 = _1626 == as_type<float>(0x7f800000u /* inf */);
        float _1630 = abs(_1482);
        bool _1632 = _1630 == as_type<float>(0x7f800000u /* inf */);
        bool _1634 = !_1624;
        bool _1636 = _1632 && _1634;
        if (_1636)
        {
            bool _1638 = as_type<int>(_1482) >= 0;
            _1578 = _1638 ? (-1) : 0;
        }
        int _1640 = _1578;
        if (_1636)
        {
            _1598 = 1075235812;
        }
        int _1642 = _1598;
        int _1644 = _1642;
        if (_1636)
        {
            int _1646 = ~_1640;
            int _1648 = (_1646 != 0) ? _1642 : 1061752795;
            _1644 = _1648;
        }
        int _1650 = _1644;
        if (_1636)
        {
            int _1652 = int(0x80000000) & as_type<int>(_1470);
            int _1654 = _1650 | _1652;
            _1610 = as_type<float>(_1654);
        }
        float _1656 = _1610;
        bool _1658 = !_1624;
        bool _1660 = _1658 && _1628;
        _1612 = _1656;
        if (!_1660)
        {
            float _1662 = abs(_1470);
            float _1664 = abs(_1482);
            float _1666 = precise::max(_1662, _1664);
            float _1668 = abs(_1470);
            float _1670 = abs(_1482);
            float _1672 = precise::min(_1668, _1670);
            float _1674 = 1.0 / _1666;
            float _1676 = abs(_1470);
            float _1678 = abs(_1482);
            bool _1680 = _1676 > _1678;
            bool _1682 = as_type<int>(_1482) >= 0;
            float _1684 = _1672 * _1674;
            float _1686 = abs(_1470);
            float _1688 = abs(_1482);
            float _1690 = _1686 + _1688;
            int _1692 = as_type<int>(_1470) & int(0x80000000);
            float _1694 = _1684 * _1684;
            bool _1696 = _1690 > as_type<float>(0x7f800000u /* inf */);
            bool _1698 = isnan(_1690);
            bool _1700 = _1696 || _1698;
            bool _1702 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1704 = _1700 || _1702;
            float _1706 = _1694 + 11.33538818359375;
            float _1708 = fma(_1694, _1706, 28.84246826171875);
            float _1710 = fma(_1694, _1708, 19.6966705322265625);
            float _1712 = fma(_1694, -0.82336294651031494140625, -5.674867153167724609375);
            float _1714 = fma(_1694, _1712, -6.565555095672607421875);
            float _1716 = 1.0 / _1710;
            float _1718 = _1694 * _1714;
            float _1720 = _1684 * _1718;
            float _1722 = fma(_1720, _1716, _1684);
            float _1724 = _1722;
            _1612 = _1690;
            if (_1680)
            {
                float _1726 = -_1722;
                float _1728 = _1726 + 1.57079637050628662109375;
                _1724 = _1728;
            }
            float _1730 = _1724;
            int _1732 = as_type<int>(_1730);
            if (!_1682)
            {
                float _1734 = -_1730;
                float _1736 = _1734 + 3.1415927410125732421875;
                _1732 = as_type<int>(_1736);
            }
            int _1738 = _1732;
            if (!_1704)
            {
                int _1740 = _1692 | _1738;
                _1612 = as_type<float>(_1740);
            }
        }
    }
    float _1742 = _1612;
    float _1744 = -_1742;
    float _1746 = _1590 + _1744;
    float _1748 = fma(_1202, _1194, _1584);
    float _1750 = sqrt(_1592);
    float _1752 = fma(_938, _1596, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1756 = _782 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1760 = _782 + _1758;
    float _1762 = fma(_1752, _1148, _1748);
    float _1764 = fma(_922, _1756, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1766 = _1746 * 0.15915493667125701904296875;
    float _1768 = fma(_946, _1760, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1770 = _1424 * _1418;
    float _1772 = fma(_1764, _1070, _1762);
    float _1774 = fma(_1394, -0.100000001490116119384765625, 0.100000001490116119384765625);
    float _1776 = _1394 * 0.0500000007450580596923828125;
    float _1778 = _1766 * 6.283185482025146484375;
    float _1780 = sin(_1778);
    float _1782 = fma(_1448, _1474, _1770);
    float _1784 = _1774 * _1458;
    float _1786 = fma(_1776, _1458, _1514);
    float _1788 = _1464 * _1750;
    float _1790 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1792 = fma(_1768, _1032, _1772);
    float _1794 = _1766 * 6.283185482025146484375;
    float _1796 = cos(_1794);
    float _1798 = fma(_1560, _1784, _1414);
    float _1800 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1786);
    float _1804 = _1788 * _1790;
    float _1806 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1808 = fma(_1588, _1784, _1782);
    float _1810 = _1788 * _1800;
    float _1812 = _1472 * 6.283185482025146484375;
    float _1814 = sin(_1812);
    float _1816 = _1804 * _1802;
    float _1818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1798);
    float _1820 = _1788 * _1806;
    float _1822 = _1522 * _1780;
    float _1824 = _1538 * _1816;
    float _1826 = _1810 * _1818;
    float _1828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1808);
    float _1830 = rsqrt(_1128);
    float _1832 = _1498 * _1796;
    float _1834 = _1498 * _1824;
    float _1836 = _1820 * _1828;
    float _1838 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1792);
    float _1840 = _1498 * _1780;
    float _1842 = _1522 * _1796;
    float _1844 = _1796 * _1538;
    float _1846 = -_1822;
    float _1848 = fma(_1814, _1832, _1846);
    float _1850 = _1838 * 0.3499999940395355224609375;
    float _1852 = _1780 * _1538;
    float _1854 = _1522 * _1824;
    float _1856 = fma(_1848, _1826, _1834);
    float _1858 = -_1816;
    float _1860 = _1814 * _1858;
    float _1862 = fma(_1814, _1840, _1842);
    float _1864 = -_1832;
    float _1866 = fma(_1814, _1822, _1864);
    float _1868 = _1830 * _1850;
    float _1870 = fma(_1844, _1826, _1860);
    float _1872 = fma(_1862, _1836, _1856);
    float _1874 = _1458 * _1868;
    float _1876 = fma(_1852, _1836, _1870);
    float _1878 = _1080 + _1872;
    float _1880 = _1056 + _1876;
    float _1882 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1878);
    float _1884 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1880);
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1888 = _1882 + _1886;
    float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1892 = _1884 + _1890;
    float _1894 = _1888 * _1888;
    float _1896 = fma(_1892, _1892, _1894);
    float _1898 = fma(_1814, _1842, _1840);
    float _1900 = sqrt(_1896);
    float _1902 = fma(_1898, _1826, _1854);
    float _1904 = fma(_1866, _1836, _1902);
    float _1906 = _1014 + _1904;
    float _1908 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1906);
    bool _1910 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1912 = _1906;
    float _1914 = _1866;
    float _1916 = _1884;
    float _1918 = _1888;
    float _1920 = _1882;
    if (!_1910)
    {
        _1912 = _1882;
    }
    float _1922 = _1912;
    float _1924 = _1922;
    if (!_1910)
    {
        _1914 = _1908;
    }
    float _1926 = _1914;
    bool _1928 = !_1910;
    float _1930 = _1926;
    if (!_1928)
    {
        float _1932 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1936 = _1900 + _1934;
        float _1938 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = rsqrt(_1896);
        float _1942 = _1936 * _1932;
        float _1944 = _1942 * 0.15915493667125701904296875;
        float _1946 = _1944 * 6.283185482025146484375;
        float _1948 = cos(_1946);
        float _1950 = _1944 * 6.283185482025146484375;
        float _1952 = sin(_1950);
        float _1954 = _1948 + (-1.0);
        float _1956 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1958 = fma(_1952, _1938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1960 = fma(_1908, _1948, _1956);
        float _1962 = _1940 * _1958;
        float _1964 = fma(_1892, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1966 = fma(_1888, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1930 = _1960;
        _1916 = _1964;
        _1924 = _1966;
    }
    float _1968 = _1930;
    float _1970 = _1916;
    float _1972 = _1924;
    float _1974 = -_1516;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1968);
    float _1978 = -_1518;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1970);
    float _1982 = -_1532;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1976 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1980 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1996 = _1984 + _1994;
    float _1998 = _1988 * _1988;
    float _2000 = fma(_1992, _1992, _1998);
    float _2002 = fma(_1996, _1996, _2000);
    float _2004 = rsqrt(_2002);
    float _2006 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2008 = _1992 * _2006;
    float _2010 = _1996 * _2006;
    float _2012 = _2008 * _2008;
    float _2014 = _2010 * _2010;
    float _2016 = _2012 + _2014;
    float _2018 = sqrt(_2016);
    bool _2020 = _2018 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2024 = _2018 + _2022;
    float _2026 = _1996;
    float _2028 = _2016;
    float _2030 = _2024;
    float _2032 = _1988;
    if (_2020)
    {
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2026 = _2034;
    }
    float _2036 = _2026;
    if (_2020)
    {
        float _2038 = rsqrt(_2016);
        _2028 = _2038;
    }
    float _2040 = _2028;
    if (_2020)
    {
        float _2042 = _2024 * _2036;
        _2030 = _2042;
    }
    float _2044 = _2030;
    if (_2020)
    {
        float _2046 = _2044 * 0.15915493667125701904296875;
        _1918 = _2046;
    }
    float _2048 = _1918;
    float _2050 = _2000;
    float _2052 = _2048;
    if (_2020)
    {
        float _2054 = _2048 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        _2050 = _2056;
    }
    float _2058 = _2050;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2062 = precise::max(0.0, _2060);
    float _2064 = _2004;
    float _2066 = _2062;
    float _2068 = _2060;
    if (_2020)
    {
        float _2070 = _2048 * 6.283185482025146484375;
        float _2072 = cos(_2070);
        _2064 = _2072;
    }
    float _2074 = _2064;
    float _2076 = -_2006;
    float _2078 = -_2062;
    float _2080 = fma(_1988, _2076, _2078);
    if (!_2020)
    {
        _2032 = _2008;
    }
    float _2082 = _2032;
    float _2084 = _2082;
    if (_2020)
    {
        float _2086 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2066 = _2086;
    }
    float _2088 = _2066;
    float _2090 = _2088;
    float _2092 = _2058;
    if (_2020)
    {
        float _2094 = fma(_2058, _2088, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1920 = _2094;
    }
    float _2096 = _1920;
    if (!_2020)
    {
        _2090 = _2080;
    }
    float _2098 = _2090;
    float _2100 = _2098;
    float _2102 = _2074;
    if (_2020)
    {
        float _2104 = _2074 + (-1.0);
        _2068 = _2104;
    }
    float _2106 = _2068;
    float _2108 = _2106;
    if (_2020)
    {
        float _2110 = _2040 * _2096;
        _2052 = _2110;
    }
    float _2112 = _2052;
    float _2114 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2116 = sqrt(_2002);
    if (_2020)
    {
        float _2118 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2092 = _2118;
    }
    float _2120 = _2092;
    float _2122 = _2120;
    if (_2020)
    {
        float _2124 = _2008 * _2112;
        _2084 = _2124;
    }
    float _2126 = _2084;
    if (!_2020)
    {
        _2108 = _2010;
    }
    float _2128 = _2108;
    float _2130 = _2128;
    if (_2020)
    {
        float _2132 = _2010 * _2112;
        _2130 = _2132;
    }
    float _2134 = _2130;
    if (_2020)
    {
        float _2136 = fma(_2080, _2074, _2120);
        _2100 = _2136;
    }
    float _2138 = _2100;
    if (!_2020)
    {
        _2122 = _2012;
    }
    float _2140 = _2122;
    float _2142 = _2140;
    if (_2020)
    {
        float _2144 = _2126 * _2126;
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_2020)
    {
        _2102 = _2014;
    }
    float _2150 = _2102;
    float _2152 = _2150;
    if (_2020)
    {
        float _2154 = _2134 * _2134;
        _2152 = _2154;
    }
    float _2156 = _2152;
    float _2158 = fma(_2138, _2138, _2146);
    float _2160 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2162 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2164 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2148);
    float _2166 = _2158 + _2156;
    float _2168 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2114);
    float _2170 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2160);
    float _2172 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2162);
    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2176 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2174);
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2164);
    float _2182 = rsqrt(_2166);
    float _2184 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2170);
    float _2186 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2168);
    float _2188 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2190 = -_2178;
    float _2192 = _2190 + 1.0;
    float _2194 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2196 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2198 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2200 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2172);
    float _2202 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2204 = abs(_2192);
    float _2206 = log2(_2204);
    float _2208 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2198);
    float _2210 = _2200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2212 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2214 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2208);
    float _2216 = _2182 * _2126;
    float _2218 = _2182 * _2134;
    float _2220 = -_2212;
    float _2222 = fma(_2220, _2202, 1.0);
    float _2224 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2214);
    float _2226 = _2182 * _2138;
    float _2228 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2230 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2232 = 1.0 / _2224;
    float _2234 = -_2228;
    float _2236 = fma(_2226, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2234);
    float _2238 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2240 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2230);
    float _2242 = -_2218;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2236);
    float _2246 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2248 = log2(_2222);
    float _2250 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2240);
    float _2252 = fma(_2244, -0.5, 0.5);
    float _2254 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2246);
    float _2256 = fma(_2244, 0.5, 0.5);
    float _2258 = _2226 + 1.0;
    float _2260 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2254);
    float _2262 = exp2(_2238);
    float _2264 = fma(_2256, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2266 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2260);
    float _2268 = fma(_2256, _2264, -0.212114393711090087890625);
    float _2270 = sqrt(_2252);
    float _2272 = fma(_2256, _2268, 1.570728778839111328125);
    float _2274 = -_2226;
    float _2276 = fma(_2262, _2258, _2274);
    float _2278 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2250);
    float _2280 = _2248 * 0.693147182464599609375;
    float _2282 = _2266 * _2232;
    float _2284 = _2278 * _2232;
    float _2286 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2288 = fma(_2282, 0.5, 0.5);
    float _2290 = _2270 * 0.636619746685028076171875;
    float _2292 = fma(_2284, -0.5, 0.5);
    float _2294 = fma(_2276, 0.5, 0.5);
    float _2296 = -_2272;
    float _2298 = fma(_2290, _2296, 1.0);
    float3 _6152 = float3(_2288, _2292, _2286);
    float _2300 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6152, float3(0.0), isnan(_6152)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6152, float3(0.0), isnan(_6152)), level(0.0)).x;
    float3 _6163 = float3(_2288, _2292, _2286);
    float4 _2303 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6163, float3(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6163, float3(0.0), isnan(_6163)), level(0.0)).xyzw;
    float _2305 = _2303.x;
    float _2307 = _2303.y;
    float _2309 = _2303.z;
    float _2311 = _2303.w;
    float2 _6180 = float2(_2298, _2294);
    float3 _2315 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6180, float2(0.0), isnan(_6180)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6180, float2(0.0), isnan(_6180)), level(0.0)).xyz;
    float _2317 = _2315.x;
    float _2319 = _2315.y;
    float _2321 = _2315.z;
    float _2323 = in.m_55.w;
    float _2325 = -_1516;
    float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1014);
    bool _2329 = _788 > 0.5;
    out.m_61.x = _748;
    out.m_61.y = _750;
    out.m_61.z = _752;
    int _2331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2333 = _2331 != 0;
    float _2335 = -_1518;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1056);
    int _2339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2341 = _2339 != 0;
    float _2343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_63.x = _556;
    out.m_63.y = _558;
    out.m_63.z = _560;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2347 = _2345 != 0;
    float _2349 = -_1532;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2355 = _2353 != 0;
    out.m_65.y = _150;
    float _2357 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2361 = as_type<int>(_2288);
    if (_2333)
    {
        float _2363 = -_146;
        float _2365 = _2363 + 1.0;
        _2361 = as_type<int>(_2365);
    }
    int _2367 = _2361;
    if (_2333)
    {
        bool _2369 = _784 > 0.5;
        _976 = _2369;
    }
    bool _2371 = _976;
    float _2373 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2357);
    if (!_2333)
    {
        _978 = _146;
    }
    float _2375 = _978;
    float _2377 = _2327 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2379 = _2375;
    if (_2333)
    {
        float _2381 = _2371 ? as_type<float>(_2367) : _146;
        _2379 = _2381;
    }
    float _2383 = _2379;
    float _2385 = _2327 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2387 = _872 > 0.5;
    bool _2389 = _2387 && _2341;
    float _2391 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2377);
    bool _2393 = _2323 > 0.5;
    float _2395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2397 = -_150;
    float _2399 = _2397 + 1.0;
    float _2401 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2391);
    float _2403 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2385);
    float _2405 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2407 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2373);
    int _2409 = _2393 ? as_type<int>(_2399) : as_type<int>(_150);
    float _2411 = _2401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2413 = _2329 ? as_type<int>(_2399) : as_type<int>(_150);
    float _2415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2417 = _2347 ? as_type<float>(_2409) : _150;
    float _2419 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2421 = _2355 ? as_type<float>(_2413) : _150;
    float _2423 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2403);
    float _2425 = fma(_2405, _2383, -0.5);
    float _2427 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2429 = fma(_2419, _2421, -0.5);
    float _2431 = _2419;
    if (!_2341)
    {
        _2431 = _146;
    }
    float _2433 = _2431;
    float _2435 = _2433;
    if (_2389)
    {
        float _2437 = -_146;
        float _2439 = _2437 + 1.0;
        _196 = _2439;
    }
    float _2441 = _196;
    float _2443 = fma(_2417, _2427, -0.5);
    float _2445 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2447 = 1.0 / _2411;
    float _2449 = _2423 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_2341)
    {
        _2435 = _2441;
    }
    float _2451 = _2435;
    float _2453 = _2415 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2455 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2457 = isnan(0.5);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2463 = _2459 || _2461;
    float _2465 = _2449 + _2411;
    float _2467 = fma(_1364, _2425, _862);
    float _2469 = fma(_2453, _2451, -0.5);
    float _2471 = exp2(_2445);
    float _2473 = -_1088;
    float _2475 = fma(_1388, _2429, _2473);
    float _2477 = -_1286;
    float _2479 = fma(_1396, _2443, _2477);
    float _2481 = fma(_1278, _2469, _1348);
    float _2483 = _2465 * _2447;
    float _2485 = _2483 * 0.5;
    float _2487 = _2469;
    if (_2463)
    {
        _2487 = 1.0;
    }
    float _2489 = _2487;
    float _2491 = _2489;
    if (!_2463)
    {
        float _2493 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2495 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2497 = _2493 * 0.15915493667125701904296875;
        float _2499 = _2495 * 0.15915493667125701904296875;
        float _2501 = _2497 * 6.283185482025146484375;
        float _2503 = cos(_2501);
        float _2505 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2507 = fma(_2485, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2505);
        float _2509 = _2497 * 6.283185482025146484375;
        float _2511 = sin(_2509);
        float _2513 = 1.0 / _2503;
        float _2515 = _2499 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        float _2519 = _2511 * _2513;
        float _2521 = _2499 * 6.283185482025146484375;
        float _2523 = sin(_2521);
        float _2525 = _2517 * _2519;
        float _2527 = 1.0 / _2507;
        float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2531 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2529;
        float _2533 = 1.0 / _2525;
        float _2535 = 1.0 / _2531;
        float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2539 = _2527 * _2537;
        float _2541 = _2523 * _2533;
        float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2545 = fma(_2541, _2539, _2543);
        float _2547 = _2545 * _2535;
        float _2549 = precise::clamp(_2547, 0.0, 1.0);
        _2491 = _2549;
    }
    float _2551 = _2491;
    float _2553 = -_2471;
    float _2555 = _2553 + 1.0;
    float _2557 = _2479 + 0.5;
    float _2559 = _2224 * 0.5;
    float _2561 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2407);
    float _2563 = _2555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2565 = _2551 > 0.0;
    bool _2567 = isnan(_2551);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan(0.0);
    bool _2573 = _2569 || _2571;
    float _2575 = _2467 + 0.5;
    float _2577 = fma(_2278, -0.5, _2559);
    float _2579 = _2563 * _2300;
    float _2581 = _2266 + _2224;
    float _2583 = _2551 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2585 = _2561 + _2224;
    float _2587 = _2311 * _2579;
    float _2589 = _2321 * _2579;
    float _2591 = -_2563;
    float _2593 = _2591 + 1.0;
    float _2595 = _2581 * 0.5;
    float _2597 = fma(_2317, _2587, _2305);
    float _2599 = fma(_2319, _2587, _2307);
    float _2601 = _2475 + 0.5;
    float _2603 = _2481 + 0.5;
    float _2605 = _2585 * 0.5;
    float _2607 = _2583 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2609 = _2311 * _2593;
    float _2611 = fma(_2311, _2589, _2309);
    out.m_67.x = _2575;
    out.m_67.y = _2601;
    out.m_67.z = _2603;
    out.m_67.w = _2557;
    out.gl_Position.x = _2266;
    out.gl_Position.y = _2278;
    out.gl_Position.z = _2561;
    out.gl_Position.w = _2224;
    out.m_69.x = _2595;
    out.m_69.y = _2577;
    out.m_69.z = _2605;
    out.m_69.w = _2224;
    out.m_45.x = _2607;
    out.m_71.x = _2597;
    out.m_71.y = _2599;
    out.m_71.z = _2611;
    out.m_71.w = _2609;
    if (_2573)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2613 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2613;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _774 = false;
    bool _582 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2670 = as_type<float>(_106);
        out.gl_Position.z = _2670;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2739 = as_type<float>(_144);
        out.gl_Position.z = _2739;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_49.x;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_49.y;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.w;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _148;
    if (!_160)
    {
        float _180 = _148 * _148;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_53.x = _146;
    out.m_53.y = _150;
    bool _192 = !_160;
    float _194 = _190;
    float _196 = _146;
    if (!_192)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _148 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _148);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _226;
    }
    float _228 = _194;
    bool _230 = !_160;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _148 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _178 = _250;
    }
    float _252 = _178;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _164, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _168, _260);
    float _268 = fma(_262, _162, _170);
    float _270 = fma(_264, _162, _172);
    float _272 = fma(_266, _162, _174);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_55.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_90);
        float _298 = 1.0 / _296;
        float _300 = _124 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _310 = _302 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _314 = _302 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _332 = 1.0 / _318;
    bool _334 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _336 = isnan(_302);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _322;
    bool _348 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _350 = isnan(_302);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _362 = 1.0 / _326;
    float _364 = _306 * _332;
    bool _366 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _368 = isnan(_302);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = 1.0 / _330;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _382 = _302 + _380;
    float _384 = _382 * _346;
    bool _386 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _388 = isnan(_302);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = _310 * _362;
    float _400 = -_376;
    float _402 = _400 + 1.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _404;
    float _408 = -_396;
    float _410 = _408 + 1.0;
    float _412 = _358 * _402;
    float _414 = -_358;
    float _416 = _414 + 1.0;
    float _418 = _376 * _410;
    float _420 = _314 * _378;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _426;
    float _430 = fma(_406, _398, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _432 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _434 = isnan(_302);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_424, _398, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _446 = fma(_428, _398, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _448 = _344 * _416;
    float _450 = -_344;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _466 = _442 * _452;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = fma(_456, _420, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _474 = fma(_460, _420, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _476 = _430 * _466;
    float _478 = _444 * _466;
    float _480 = _446 * _466;
    float _482 = fma(_464, _420, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _484 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[107].x, _476);
    float _486 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[107].y, _478);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _496;
    float _500 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[107].z, _480);
    float _502 = fma(_472, _448, _484);
    float _504 = fma(_474, _448, _486);
    float _506 = fma(_490, _364, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _508 = fma(_494, _364, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _510 = fma(_498, _364, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _524 = fma(_482, _448, _500);
    float _526 = fma(_514, _384, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _528 = fma(_518, _384, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _530 = fma(_522, _384, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _532 = fma(_506, _412, _502);
    float _534 = fma(_508, _412, _504);
    float _536 = fma(_510, _412, _524);
    float _538 = fma(_526, _418, _532);
    float _540 = fma(_528, _418, _534);
    float _542 = fma(_530, _418, _536);
    float _544 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[111].x, _538);
    float _546 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[111].y, _540);
    float _548 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[111].z, _542);
    float _550 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _552 = _546 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _554 = _548 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _556 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _562 = !_360;
    float _580;
    if (!_562)
    {
        float _564 = in.m_55.x;
        float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _568 = _564 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _572 = _570 * _566;
        float _574 = floor(_572);
        float _576 = -_574;
        float _578 = _572 + _576;
        _580 = _578;
        _582 = true;
    }
    else
    {
        float _584 = float(_90);
        float _586 = 1.0 / _584;
        float _588 = _124 * _586;
        _580 = _588;
    }
    _582 = false;
    float _590 = _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _594 = _590 + _592;
    bool _596 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _598 = isnan(_590);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _610 = _590 + _608;
    bool _612 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _614 = isnan(_590);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _632 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _634 = isnan(_590);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -_606;
    float _646 = _644 + 1.0;
    float _648 = 1.0 / _630;
    float _650 = _642 * _646;
    float _652 = -_642;
    float _654 = _652 + 1.0;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _656;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _662 = 1.0 / _626;
    float _664 = _622 * _654;
    float _666 = -_622;
    float _668 = _666 + 1.0;
    float _670 = _610 * _648;
    float _672 = _594 * _662;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _678;
    float _682 = fma(_658, _672, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _684 = fma(_676, _672, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _686 = fma(_680, _672, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _688 = in.m_51.x;
    float _690 = in.m_51.y;
    float _692 = in.m_51.z;
    float _694 = _682 * _664;
    float _696 = _684 * _664;
    float _698 = _686 * _664;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _712 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[123].x, _694);
    float _714 = fma(_702, _670, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _716 = fma(_706, _670, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _718 = fma(_710, _670, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _720 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[123].y, _696);
    float _722 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[123].z, _698);
    float _724 = fma(_714, _650, _712);
    float _726 = fma(_716, _650, _720);
    float _728 = fma(_718, _650, _722);
    float _730 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[125].x, _724);
    float _732 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[125].y, _726);
    float _734 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[125].z, _728);
    float _736 = _730 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _738 = _692 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _740 = _690 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _742 = _732 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _744 = _734 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _746 = _688 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _754 = !_660;
    float _772;
    if (!_754)
    {
        float _756 = in.m_55.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_90);
        float _778 = 1.0 / _776;
        float _780 = _124 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = in.m_55.x;
    float _786 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _788 = in.m_55.y;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _792 = _790 != 0;
    float _794 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _796 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _802 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _794);
    float _804 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _786);
    float _806 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _796);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _812 = 1.0 / _800;
    float _814 = 1.0 / _810;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _826 = _824 != 0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _834 = _784 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _836 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _844 = -_832;
    float _846 = fma(_834, 2.0, _844);
    float _848 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _850 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _836);
    float _852 = 1.0 / _842;
    float _854 = fma(_848, -2.0, _838);
    float _856 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _858 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _804);
    float _860 = -_124;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[76].x, _846);
    float _864 = 1.0 / _830;
    float _866 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _872 = in.m_55.z;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _882 = 1.0 / _870;
    float _884 = _876 * _814;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _886;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _898;
    float _902 = 1.0 / _880;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _916 = _906 * _864;
    float _918 = _914 * _812;
    float _920 = 1.0 / _896;
    float _922 = _892 * _882;
    float _924 = _788 * 2.0;
    float _926 = _872 * 2.0;
    float _928 = _788 + _872;
    float _930 = _900 * _852;
    float _932 = _928 + (-1.0);
    float _934 = _784 + _872;
    float _936 = floor(_926);
    float _938 = _888 * _902;
    float _940 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _942 = _934 + (-1.0);
    float _944 = (*spvDescriptorSet0.vp_c8)._m0[32].y * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _946 = _910 * _920;
    float _948 = _784 * 2.0;
    float _950 = floor(_924);
    float _952 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _954 = _784 + _788;
    float _956 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _850);
    bool _958 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _960 = isnan(_782);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _954 + (-1.0);
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _974 = _924;
    bool _976 = _822;
    float _978 = _784;
    if (!_792)
    {
        _972 = _872;
    }
    float _980 = _972;
    float _982 = floor(_948);
    float _984 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _944);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _988 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _990 = isnan(_782);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = -_968;
    float _1002 = _1000 + 1.0;
    bool _1004 = _936 >= 0.0;
    bool _1006 = isnan(_936);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan(0.0);
    bool _1012 = _1008 || _1010;
    float _1014 = _858 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1016 = _936 > 0.0;
    float _1018 = -_998;
    float _1020 = _1018 + 1.0;
    bool _1022 = _950 >= 0.0;
    bool _1024 = isnan(_950);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    float _1032 = _998 * _1002;
    bool _1034 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1036 = isnan(_782);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1048 = log2(_1046);
    float _1050 = _936;
    float _1052 = _980;
    if (!_792)
    {
        _974 = _788;
    }
    float _1054 = _974;
    float _1056 = _856 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1058 = _1054;
    if (!_792)
    {
        _1050 = _872;
    }
    float _1060 = _1050;
    float _1062 = -_1044;
    float _1064 = _1062 + 1.0;
    float _1066 = _1060;
    if (_792)
    {
        _1058 = _784;
    }
    float _1068 = _1058;
    float _1070 = _1044 * _1020;
    if (_792)
    {
        _1066 = _788;
    }
    float _1072 = _1066;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1076 = _1014 + _1074;
    if (_792)
    {
        _1052 = _788;
    }
    float _1078 = _1052;
    float _1080 = _866 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1082 = _950 > 0.0;
    float _1084 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1086 = _1012 ? 0 : 1;
    float _1088 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _854);
    int _1090 = _1030 ? 0 : 1;
    float _1092 = _1048 * _124;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1096 = _1056 + _1094;
    bool _1098 = _982 > 0.0;
    float _1100 = _1076 * _1076;
    bool _1102 = _982 >= 0.0;
    bool _1104 = isnan(_982);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.0);
    bool _1110 = _1106 || _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1114 = _782 + _1112;
    bool _1116 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1118 = isnan(_782);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = fma((*spvDescriptorSet0.vp_c8)._m0[32].z, (*spvDescriptorSet0.vp_c8)._m0[32].z, _984);
    bool _1130 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1132 = isnan(_782);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = fma(_884, _1114, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1146 = _782 + _1144;
    float _1148 = _1126 * _1064;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1152 = _782 + _1150;
    float _1154 = -_1126;
    float _1156 = _1154 + 1.0;
    bool _1158 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1160 = isnan(_782);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    float _1170 = -_1140;
    float _1172 = _1170 + 1.0;
    float _1174 = fma(_918, _1146, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1176 = fma(_930, _1152, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1180 = _782 + _1178;
    bool _1182 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1184 = isnan(_782);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = _1140 * _1156;
    float _1196 = _1168 * _1172;
    float _1198 = -_1168;
    float _1200 = _1198 + 1.0;
    float _1202 = fma(_916, _1180, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1204 = _1192 * _1200;
    bool _1206 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1208 = isnan(_782);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -_1192;
    float _1220 = _1218 + 1.0;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1226 = _1216 * _1220;
    float _1228 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1222);
    float _1230 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1224);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1234 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1236 = _1142 * _1226;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1240 = -_1216;
    float _1242 = _1240 + 1.0;
    float _1244 = -_1232;
    float _1246 = fma(_1234, 2.0, _1244);
    bool _1248 = !_818;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = fma(_1084, -2.0, _1238);
    int _1254 = ~_1086;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    float _1260 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1236);
    int _1262 = _1258;
    bool _1264 = _1110;
    int _1266 = as_type<int>(_1260);
    if (!_1016)
    {
        int _1268 = ~_1086;
        int _1270 = _1268 + 1;
        _1262 = _1270;
    }
    int _1272 = _1262;
    float _1274 = exp2(_1092);
    int _1276 = abs(_1250);
    float _1278 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1230);
    int _1280 = ~_1090;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    float _1286 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1252);
    int _1288 = _1110 ? 0 : 1;
    float _1290 = fma(_1096, _1096, _1100);
    int _1292 = _1284;
    if (!_1082)
    {
        int _1294 = ~_1090;
        int _1296 = _1294 + 1;
        _1292 = _1296;
    }
    int _1298 = _1292;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1302 = _1080 + _1300;
    bool _1304 = !_826;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = float(_1276);
    float _1310 = fma(_1302, _1302, _1290);
    float _1312 = float(_1272);
    float _1314 = -_1274;
    float _1316 = _1314 + 1.0;
    int _1318 = ~_1288;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    int _1324 = _1322;
    if (!_1098)
    {
        int _1326 = ~_1288;
        int _1328 = _1326 + 1;
        _1324 = _1328;
    }
    int _1330 = _1324;
    float _1332 = _1308 * _1312;
    int _1334 = abs(_1306);
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1338 = float(_1298);
    float _1340 = _1332 * (-2.0);
    float _1342 = float(_1334);
    float _1344 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1336);
    float _1346 = -_124;
    float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1246);
    float _1350 = _1342 * _1338;
    bool _1352 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1354 = isnan(0.0);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1360 = _1356 || _1358;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1364 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1344);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1368 = 1.0 + _1366;
    float _1370 = rsqrt(_956);
    bool _1372 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1374 = isnan(1.0);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1380 = _1376 || _1378;
    float _1382 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1362);
    float _1384 = _1360 ? _1316 : 0.0;
    float _1386 = float(_1330);
    float _1388 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1382);
    float _1390 = 1.0 / _1368;
    float _1392 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _788);
    float _1394 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1396 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1228);
    float _1398 = _1350 * (-2.0);
    float _1400 = fma(_986, _1340, _986);
    bool _1402 = !_822;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = _1394 * (-0.15915493667125701904296875);
    float _1408 = fma(_952, _1398, _952);
    float _1410 = -_1080;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1414 = in.m_57.x;
    float _1416 = in.m_57.y;
    float _1418 = in.m_57.z;
    int _1420 = abs(_1404);
    float _1422 = _1406 * 6.283185482025146484375;
    float _1424 = cos(_1422);
    float _1426 = _1412;
    if (_1380)
    {
        float _1428 = _1384 * _1390;
        _128 = _1428;
    }
    float _1430 = _128;
    float _1432 = _784 + (-0.5);
    float _1434 = float(_1420);
    float _1436 = _872 + (-0.5);
    float _1438 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1440 = abs(_1096);
    float _1442 = abs(_1412);
    float _1444 = precise::max(_1440, _1442);
    float _1446 = _1406 * 6.283185482025146484375;
    float _1448 = sin(_1446);
    float _1450 = _1434 * _1386;
    float _1452 = fma(_1400, _1430, _1438);
    bool _1454 = _1444 >= 16.0;
    float _1456 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1458 = in.m_59.x;
    float _1460 = _1452 * 0.15915493667125701904296875;
    float _1462 = _1096 * 0.0625;
    float _1464 = rsqrt(_1310);
    float _1466 = fma(_1408, _1430, _1456);
    float _1468 = _1450 * (-2.0);
    float _1470 = _1454 ? _1462 : _1096;
    float _1472 = _1466 * 0.15915493667125701904296875;
    float _1474 = _1416 + 0.100000001490116119384765625;
    float _1476 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _784);
    float _1478 = _1448 * _1418;
    if (_1454)
    {
        float _1480 = _1412 * 0.0625;
        _1426 = _1480;
    }
    float _1482 = _1426;
    float _1484 = abs(_1470);
    bool _1486 = _1484 != 0.0;
    bool _1488 = isnan(_1484);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.0);
    bool _1494 = _1490 || _1492;
    float _1496 = _1460 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = -_1478;
    float _1502 = fma(_1424, _1474, _1500);
    float _1504 = fma(_940, _1468, _940);
    float _1506 = abs(_1482);
    bool _1508 = _1506 == 0.0;
    bool _1510 = !_1494;
    bool _1512 = _1508 && _1510;
    float _1514 = _1502 + (-0.100000001490116119384765625);
    float _1516 = _1076 * _1464;
    float _1518 = _1096 * _1464;
    float _1520 = _1460 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = _1514 + _1476;
    float _1526 = _1514 + _1392;
    float _1528 = abs(_1482);
    bool _1530 = _1528 == 0.0;
    float _1532 = _1302 * _1464;
    float _1534 = _1524 * 8.0;
    float _1536 = _1472 * 6.283185482025146484375;
    float _1538 = cos(_1536);
    float _1540 = _1534 * 0.15915493667125701904296875;
    float _1542 = _1526 * 10.0;
    float _1544 = fma(_1174, _1204, _1260);
    float _1546 = -_1516;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1076);
    float _1550 = -_1518;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1096);
    float _1554 = _1542 * 0.15915493667125701904296875;
    float _1556 = _788 + (-0.5);
    float _1558 = _1540 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = _1548 * _1548;
    if (_1512)
    {
        bool _1564 = as_type<int>(_1482) >= 0;
        _1264 = _1564;
    }
    bool _1566 = _1264;
    float _1568 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1570 = -_1532;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1302);
    float _1574 = fma(_1552, _1552, _1562);
    float _1576 = _1572;
    int _1578 = _1566 ? (-1) : 0;
    if (_1512)
    {
        int _1580 = _1566 ? 0 : 1078530011;
        _1266 = _1580;
    }
    int _1582 = _1266;
    float _1584 = fma(_1176, _1196, _1544);
    float _1586 = _1554 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    float _1590 = fma(_1504, _1430, _1568);
    float _1592 = fma(_1572, _1572, _1574);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1596 = _782 + _1594;
    int _1598 = _1582;
    if (_1512)
    {
        int _1600 = int(0x80000000) & as_type<int>(_1470);
        int _1602 = _1582 | _1600;
        _1576 = as_type<float>(_1602);
    }
    float _1604 = _1576;
    bool _1606 = !_1494;
    bool _1608 = _1606 && _1530;
    float _1610 = _1604;
    float _1612 = _1604;
    if (!_1608)
    {
        float _1614 = abs(_1470);
        bool _1616 = _1614 != as_type<float>(0x7f800000u /* inf */);
        bool _1618 = isnan(_1614);
        bool _1620 = _1616 || _1618;
        bool _1622 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1624 = _1620 || _1622;
        float _1626 = abs(_1482);
        bool _1628 = _1626 == as_type<float>(0x7f800000u /* inf */);
        float _1630 = abs(_1482);
        bool _1632 = _1630 == as_type<float>(0x7f800000u /* inf */);
        bool _1634 = !_1624;
        bool _1636 = _1632 && _1634;
        if (_1636)
        {
            bool _1638 = as_type<int>(_1482) >= 0;
            _1578 = _1638 ? (-1) : 0;
        }
        int _1640 = _1578;
        if (_1636)
        {
            _1598 = 1075235812;
        }
        int _1642 = _1598;
        int _1644 = _1642;
        if (_1636)
        {
            int _1646 = ~_1640;
            int _1648 = (_1646 != 0) ? _1642 : 1061752795;
            _1644 = _1648;
        }
        int _1650 = _1644;
        if (_1636)
        {
            int _1652 = int(0x80000000) & as_type<int>(_1470);
            int _1654 = _1650 | _1652;
            _1610 = as_type<float>(_1654);
        }
        float _1656 = _1610;
        bool _1658 = !_1624;
        bool _1660 = _1658 && _1628;
        _1612 = _1656;
        if (!_1660)
        {
            float _1662 = abs(_1470);
            float _1664 = abs(_1482);
            float _1666 = precise::max(_1662, _1664);
            float _1668 = abs(_1470);
            float _1670 = abs(_1482);
            float _1672 = precise::min(_1668, _1670);
            float _1674 = 1.0 / _1666;
            float _1676 = abs(_1470);
            float _1678 = abs(_1482);
            bool _1680 = _1676 > _1678;
            bool _1682 = as_type<int>(_1482) >= 0;
            float _1684 = _1672 * _1674;
            float _1686 = abs(_1470);
            float _1688 = abs(_1482);
            float _1690 = _1686 + _1688;
            int _1692 = as_type<int>(_1470) & int(0x80000000);
            float _1694 = _1684 * _1684;
            bool _1696 = _1690 > as_type<float>(0x7f800000u /* inf */);
            bool _1698 = isnan(_1690);
            bool _1700 = _1696 || _1698;
            bool _1702 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1704 = _1700 || _1702;
            float _1706 = _1694 + 11.33538818359375;
            float _1708 = fma(_1694, _1706, 28.84246826171875);
            float _1710 = fma(_1694, _1708, 19.6966705322265625);
            float _1712 = fma(_1694, -0.82336294651031494140625, -5.674867153167724609375);
            float _1714 = fma(_1694, _1712, -6.565555095672607421875);
            float _1716 = 1.0 / _1710;
            float _1718 = _1694 * _1714;
            float _1720 = _1684 * _1718;
            float _1722 = fma(_1720, _1716, _1684);
            float _1724 = _1722;
            _1612 = _1690;
            if (_1680)
            {
                float _1726 = -_1722;
                float _1728 = _1726 + 1.57079637050628662109375;
                _1724 = _1728;
            }
            float _1730 = _1724;
            int _1732 = as_type<int>(_1730);
            if (!_1682)
            {
                float _1734 = -_1730;
                float _1736 = _1734 + 3.1415927410125732421875;
                _1732 = as_type<int>(_1736);
            }
            int _1738 = _1732;
            if (!_1704)
            {
                int _1740 = _1692 | _1738;
                _1612 = as_type<float>(_1740);
            }
        }
    }
    float _1742 = _1612;
    float _1744 = -_1742;
    float _1746 = _1590 + _1744;
    float _1748 = fma(_1202, _1194, _1584);
    float _1750 = sqrt(_1592);
    float _1752 = fma(_938, _1596, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1756 = _782 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1760 = _782 + _1758;
    float _1762 = fma(_1752, _1148, _1748);
    float _1764 = fma(_922, _1756, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1766 = _1746 * 0.15915493667125701904296875;
    float _1768 = fma(_946, _1760, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1770 = _1424 * _1418;
    float _1772 = fma(_1764, _1070, _1762);
    float _1774 = fma(_1394, -0.100000001490116119384765625, 0.100000001490116119384765625);
    float _1776 = _1394 * 0.0500000007450580596923828125;
    float _1778 = _1766 * 6.283185482025146484375;
    float _1780 = sin(_1778);
    float _1782 = fma(_1448, _1474, _1770);
    float _1784 = _1774 * _1458;
    float _1786 = fma(_1776, _1458, _1514);
    float _1788 = _1464 * _1750;
    float _1790 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1792 = fma(_1768, _1032, _1772);
    float _1794 = _1766 * 6.283185482025146484375;
    float _1796 = cos(_1794);
    float _1798 = fma(_1560, _1784, _1414);
    float _1800 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1786);
    float _1804 = _1788 * _1790;
    float _1806 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1808 = fma(_1588, _1784, _1782);
    float _1810 = _1788 * _1800;
    float _1812 = _1472 * 6.283185482025146484375;
    float _1814 = sin(_1812);
    float _1816 = _1804 * _1802;
    float _1818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1798);
    float _1820 = _1788 * _1806;
    float _1822 = _1522 * _1780;
    float _1824 = _1538 * _1816;
    float _1826 = _1810 * _1818;
    float _1828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1808);
    float _1830 = rsqrt(_1128);
    float _1832 = _1498 * _1796;
    float _1834 = _1498 * _1824;
    float _1836 = _1820 * _1828;
    float _1838 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1792);
    float _1840 = _1498 * _1780;
    float _1842 = _1522 * _1796;
    float _1844 = _1796 * _1538;
    float _1846 = -_1822;
    float _1848 = fma(_1814, _1832, _1846);
    float _1850 = _1838 * 0.3499999940395355224609375;
    float _1852 = _1780 * _1538;
    float _1854 = _1522 * _1824;
    float _1856 = fma(_1848, _1826, _1834);
    float _1858 = -_1816;
    float _1860 = _1814 * _1858;
    float _1862 = fma(_1814, _1840, _1842);
    float _1864 = -_1832;
    float _1866 = fma(_1814, _1822, _1864);
    float _1868 = _1830 * _1850;
    float _1870 = fma(_1844, _1826, _1860);
    float _1872 = fma(_1862, _1836, _1856);
    float _1874 = _1458 * _1868;
    float _1876 = fma(_1852, _1836, _1870);
    float _1878 = _1080 + _1872;
    float _1880 = _1056 + _1876;
    float _1882 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1878);
    float _1884 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1880);
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1888 = _1882 + _1886;
    float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1892 = _1884 + _1890;
    float _1894 = _1888 * _1888;
    float _1896 = fma(_1892, _1892, _1894);
    float _1898 = fma(_1814, _1842, _1840);
    float _1900 = sqrt(_1896);
    float _1902 = fma(_1898, _1826, _1854);
    float _1904 = fma(_1866, _1836, _1902);
    float _1906 = _1014 + _1904;
    float _1908 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1906);
    bool _1910 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1912 = _1906;
    float _1914 = _1866;
    float _1916 = _1884;
    float _1918 = _1888;
    float _1920 = _1882;
    if (!_1910)
    {
        _1912 = _1882;
    }
    float _1922 = _1912;
    float _1924 = _1922;
    if (!_1910)
    {
        _1914 = _1908;
    }
    float _1926 = _1914;
    bool _1928 = !_1910;
    float _1930 = _1926;
    if (!_1928)
    {
        float _1932 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1936 = _1900 + _1934;
        float _1938 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = rsqrt(_1896);
        float _1942 = _1936 * _1932;
        float _1944 = _1942 * 0.15915493667125701904296875;
        float _1946 = _1944 * 6.283185482025146484375;
        float _1948 = cos(_1946);
        float _1950 = _1944 * 6.283185482025146484375;
        float _1952 = sin(_1950);
        float _1954 = _1948 + (-1.0);
        float _1956 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1958 = fma(_1952, _1938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1960 = fma(_1908, _1948, _1956);
        float _1962 = _1940 * _1958;
        float _1964 = fma(_1892, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1966 = fma(_1888, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1930 = _1960;
        _1916 = _1964;
        _1924 = _1966;
    }
    float _1968 = _1930;
    float _1970 = _1916;
    float _1972 = _1924;
    float _1974 = -_1516;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1968);
    float _1978 = -_1518;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1970);
    float _1982 = -_1532;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1976 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1980 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1996 = _1984 + _1994;
    float _1998 = _1988 * _1988;
    float _2000 = fma(_1992, _1992, _1998);
    float _2002 = fma(_1996, _1996, _2000);
    float _2004 = rsqrt(_2002);
    float _2006 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2008 = _1992 * _2006;
    float _2010 = _1996 * _2006;
    float _2012 = _2008 * _2008;
    float _2014 = _2010 * _2010;
    float _2016 = _2012 + _2014;
    float _2018 = sqrt(_2016);
    bool _2020 = _2018 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2024 = _2018 + _2022;
    float _2026 = _1996;
    float _2028 = _2016;
    float _2030 = _2024;
    float _2032 = _1988;
    if (_2020)
    {
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2026 = _2034;
    }
    float _2036 = _2026;
    if (_2020)
    {
        float _2038 = rsqrt(_2016);
        _2028 = _2038;
    }
    float _2040 = _2028;
    if (_2020)
    {
        float _2042 = _2024 * _2036;
        _2030 = _2042;
    }
    float _2044 = _2030;
    if (_2020)
    {
        float _2046 = _2044 * 0.15915493667125701904296875;
        _1918 = _2046;
    }
    float _2048 = _1918;
    float _2050 = _2000;
    float _2052 = _2048;
    if (_2020)
    {
        float _2054 = _2048 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        _2050 = _2056;
    }
    float _2058 = _2050;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2062 = precise::max(0.0, _2060);
    float _2064 = _2004;
    float _2066 = _2062;
    float _2068 = _2060;
    if (_2020)
    {
        float _2070 = _2048 * 6.283185482025146484375;
        float _2072 = cos(_2070);
        _2064 = _2072;
    }
    float _2074 = _2064;
    float _2076 = -_2006;
    float _2078 = -_2062;
    float _2080 = fma(_1988, _2076, _2078);
    if (!_2020)
    {
        _2032 = _2008;
    }
    float _2082 = _2032;
    float _2084 = _2082;
    if (_2020)
    {
        float _2086 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2066 = _2086;
    }
    float _2088 = _2066;
    float _2090 = _2088;
    float _2092 = _2058;
    if (_2020)
    {
        float _2094 = fma(_2058, _2088, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1920 = _2094;
    }
    float _2096 = _1920;
    if (!_2020)
    {
        _2090 = _2080;
    }
    float _2098 = _2090;
    float _2100 = _2098;
    float _2102 = _2074;
    if (_2020)
    {
        float _2104 = _2074 + (-1.0);
        _2068 = _2104;
    }
    float _2106 = _2068;
    float _2108 = _2106;
    if (_2020)
    {
        float _2110 = _2040 * _2096;
        _2052 = _2110;
    }
    float _2112 = _2052;
    float _2114 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2116 = sqrt(_2002);
    if (_2020)
    {
        float _2118 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2092 = _2118;
    }
    float _2120 = _2092;
    float _2122 = _2120;
    if (_2020)
    {
        float _2124 = _2008 * _2112;
        _2084 = _2124;
    }
    float _2126 = _2084;
    if (!_2020)
    {
        _2108 = _2010;
    }
    float _2128 = _2108;
    float _2130 = _2128;
    if (_2020)
    {
        float _2132 = _2010 * _2112;
        _2130 = _2132;
    }
    float _2134 = _2130;
    if (_2020)
    {
        float _2136 = fma(_2080, _2074, _2120);
        _2100 = _2136;
    }
    float _2138 = _2100;
    if (!_2020)
    {
        _2122 = _2012;
    }
    float _2140 = _2122;
    float _2142 = _2140;
    if (_2020)
    {
        float _2144 = _2126 * _2126;
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_2020)
    {
        _2102 = _2014;
    }
    float _2150 = _2102;
    float _2152 = _2150;
    if (_2020)
    {
        float _2154 = _2134 * _2134;
        _2152 = _2154;
    }
    float _2156 = _2152;
    float _2158 = fma(_2138, _2138, _2146);
    float _2160 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2162 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2164 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2148);
    float _2166 = _2158 + _2156;
    float _2168 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2114);
    float _2170 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2160);
    float _2172 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2162);
    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2176 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2174);
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2164);
    float _2182 = rsqrt(_2166);
    float _2184 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2170);
    float _2186 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2168);
    float _2188 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2190 = -_2178;
    float _2192 = _2190 + 1.0;
    float _2194 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2196 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2198 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2200 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2172);
    float _2202 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2204 = abs(_2192);
    float _2206 = log2(_2204);
    float _2208 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2198);
    float _2210 = _2200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2212 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2214 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2208);
    float _2216 = _2182 * _2126;
    float _2218 = _2182 * _2134;
    float _2220 = -_2212;
    float _2222 = fma(_2220, _2202, 1.0);
    float _2224 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2214);
    float _2226 = _2182 * _2138;
    float _2228 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2230 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2232 = 1.0 / _2224;
    float _2234 = -_2228;
    float _2236 = fma(_2226, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2234);
    float _2238 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2240 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2230);
    float _2242 = -_2218;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2236);
    float _2246 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2248 = log2(_2222);
    float _2250 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2240);
    float _2252 = fma(_2244, -0.5, 0.5);
    float _2254 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2246);
    float _2256 = fma(_2244, 0.5, 0.5);
    float _2258 = _2226 + 1.0;
    float _2260 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2254);
    float _2262 = exp2(_2238);
    float _2264 = fma(_2256, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2266 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2260);
    float _2268 = fma(_2256, _2264, -0.212114393711090087890625);
    float _2270 = sqrt(_2252);
    float _2272 = fma(_2256, _2268, 1.570728778839111328125);
    float _2274 = -_2226;
    float _2276 = fma(_2262, _2258, _2274);
    float _2278 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2250);
    float _2280 = _2248 * 0.693147182464599609375;
    float _2282 = _2266 * _2232;
    float _2284 = _2278 * _2232;
    float _2286 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2288 = fma(_2282, 0.5, 0.5);
    float _2290 = _2270 * 0.636619746685028076171875;
    float _2292 = fma(_2284, -0.5, 0.5);
    float _2294 = fma(_2276, 0.5, 0.5);
    float _2296 = -_2272;
    float _2298 = fma(_2290, _2296, 1.0);
    float3 _6152 = float3(_2288, _2292, _2286);
    float _2300 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6152, float3(0.0), isnan(_6152)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6152, float3(0.0), isnan(_6152)), level(0.0)).x;
    float3 _6163 = float3(_2288, _2292, _2286);
    float4 _2303 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6163, float3(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6163, float3(0.0), isnan(_6163)), level(0.0)).xyzw;
    float _2305 = _2303.x;
    float _2307 = _2303.y;
    float _2309 = _2303.z;
    float _2311 = _2303.w;
    float2 _6180 = float2(_2298, _2294);
    float3 _2315 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6180, float2(0.0), isnan(_6180)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6180, float2(0.0), isnan(_6180)), level(0.0)).xyz;
    float _2317 = _2315.x;
    float _2319 = _2315.y;
    float _2321 = _2315.z;
    float _2323 = in.m_55.w;
    float _2325 = -_1516;
    float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1014);
    bool _2329 = _788 > 0.5;
    out.m_61.x = _748;
    out.m_61.y = _750;
    out.m_61.z = _752;
    int _2331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2333 = _2331 != 0;
    float _2335 = -_1518;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1056);
    int _2339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2341 = _2339 != 0;
    float _2343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_63.x = _556;
    out.m_63.y = _558;
    out.m_63.z = _560;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2347 = _2345 != 0;
    float _2349 = -_1532;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2355 = _2353 != 0;
    out.m_65.y = _150;
    float _2357 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2361 = as_type<int>(_2288);
    if (_2333)
    {
        float _2363 = -_146;
        float _2365 = _2363 + 1.0;
        _2361 = as_type<int>(_2365);
    }
    int _2367 = _2361;
    if (_2333)
    {
        bool _2369 = _784 > 0.5;
        _976 = _2369;
    }
    bool _2371 = _976;
    float _2373 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2357);
    if (!_2333)
    {
        _978 = _146;
    }
    float _2375 = _978;
    float _2377 = _2327 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2379 = _2375;
    if (_2333)
    {
        float _2381 = _2371 ? as_type<float>(_2367) : _146;
        _2379 = _2381;
    }
    float _2383 = _2379;
    float _2385 = _2327 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2387 = _872 > 0.5;
    bool _2389 = _2387 && _2341;
    float _2391 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2377);
    bool _2393 = _2323 > 0.5;
    float _2395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2397 = -_150;
    float _2399 = _2397 + 1.0;
    float _2401 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2391);
    float _2403 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2385);
    float _2405 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2407 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2373);
    int _2409 = _2393 ? as_type<int>(_2399) : as_type<int>(_150);
    float _2411 = _2401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2413 = _2329 ? as_type<int>(_2399) : as_type<int>(_150);
    float _2415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2417 = _2347 ? as_type<float>(_2409) : _150;
    float _2419 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2421 = _2355 ? as_type<float>(_2413) : _150;
    float _2423 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2403);
    float _2425 = fma(_2405, _2383, -0.5);
    float _2427 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2429 = fma(_2419, _2421, -0.5);
    float _2431 = _2419;
    if (!_2341)
    {
        _2431 = _146;
    }
    float _2433 = _2431;
    float _2435 = _2433;
    if (_2389)
    {
        float _2437 = -_146;
        float _2439 = _2437 + 1.0;
        _196 = _2439;
    }
    float _2441 = _196;
    float _2443 = fma(_2417, _2427, -0.5);
    float _2445 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2447 = 1.0 / _2411;
    float _2449 = _2423 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_2341)
    {
        _2435 = _2441;
    }
    float _2451 = _2435;
    float _2453 = _2415 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2455 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2457 = isnan(0.5);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2463 = _2459 || _2461;
    float _2465 = _2449 + _2411;
    float _2467 = fma(_1364, _2425, _862);
    float _2469 = fma(_2453, _2451, -0.5);
    float _2471 = exp2(_2445);
    float _2473 = -_1088;
    float _2475 = fma(_1388, _2429, _2473);
    float _2477 = -_1286;
    float _2479 = fma(_1396, _2443, _2477);
    float _2481 = fma(_1278, _2469, _1348);
    float _2483 = _2465 * _2447;
    float _2485 = _2483 * 0.5;
    float _2487 = _2469;
    if (_2463)
    {
        _2487 = 1.0;
    }
    float _2489 = _2487;
    float _2491 = _2489;
    if (!_2463)
    {
        float _2493 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2495 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2497 = _2493 * 0.15915493667125701904296875;
        float _2499 = _2495 * 0.15915493667125701904296875;
        float _2501 = _2497 * 6.283185482025146484375;
        float _2503 = cos(_2501);
        float _2505 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2507 = fma(_2485, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2505);
        float _2509 = _2497 * 6.283185482025146484375;
        float _2511 = sin(_2509);
        float _2513 = 1.0 / _2503;
        float _2515 = _2499 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        float _2519 = _2511 * _2513;
        float _2521 = _2499 * 6.283185482025146484375;
        float _2523 = sin(_2521);
        float _2525 = _2517 * _2519;
        float _2527 = 1.0 / _2507;
        float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2531 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2529;
        float _2533 = 1.0 / _2525;
        float _2535 = 1.0 / _2531;
        float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2539 = _2527 * _2537;
        float _2541 = _2523 * _2533;
        float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2545 = fma(_2541, _2539, _2543);
        float _2547 = _2545 * _2535;
        float _2549 = precise::clamp(_2547, 0.0, 1.0);
        _2491 = _2549;
    }
    float _2551 = _2491;
    float _2553 = -_2471;
    float _2555 = _2553 + 1.0;
    float _2557 = _2479 + 0.5;
    float _2559 = _2224 * 0.5;
    float _2561 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2407);
    float _2563 = _2555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2565 = _2551 > 0.0;
    bool _2567 = isnan(_2551);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan(0.0);
    bool _2573 = _2569 || _2571;
    float _2575 = _2467 + 0.5;
    float _2577 = fma(_2278, -0.5, _2559);
    float _2579 = _2563 * _2300;
    float _2581 = _2266 + _2224;
    float _2583 = _2551 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2585 = _2561 + _2224;
    float _2587 = _2311 * _2579;
    float _2589 = _2321 * _2579;
    float _2591 = -_2563;
    float _2593 = _2591 + 1.0;
    float _2595 = _2581 * 0.5;
    float _2597 = fma(_2317, _2587, _2305);
    float _2599 = fma(_2319, _2587, _2307);
    float _2601 = _2475 + 0.5;
    float _2603 = _2481 + 0.5;
    float _2605 = _2585 * 0.5;
    float _2607 = _2583 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2609 = _2311 * _2593;
    float _2611 = fma(_2311, _2589, _2309);
    out.m_67.x = _2575;
    out.m_67.y = _2601;
    out.m_67.z = _2603;
    out.m_67.w = _2557;
    out.gl_Position.x = _2266;
    out.gl_Position.y = _2278;
    out.gl_Position.z = _2561;
    out.gl_Position.w = _2224;
    out.m_69.x = _2595;
    out.m_69.y = _2577;
    out.m_69.z = _2605;
    out.m_69.w = _2224;
    out.m_45.x = _2607;
    out.m_71.x = _2597;
    out.m_71.y = _2599;
    out.m_71.z = _2611;
    out.m_71.w = _2609;
    if (_2573)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2613 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2613;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _774 = false;
    bool _582 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2670 = as_type<float>(_106);
        out.gl_Position.z = _2670;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2739 = as_type<float>(_144);
        out.gl_Position.z = _2739;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.x;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_49.y;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.w;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _148;
    if (!_160)
    {
        float _180 = _148 * _148;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_53.x = _146;
    out.m_53.y = _150;
    bool _192 = !_160;
    float _194 = _190;
    float _196 = _146;
    if (!_192)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _148 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _148);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _226;
    }
    float _228 = _194;
    bool _230 = !_160;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _148 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _178 = _250;
    }
    float _252 = _178;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _164, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _168, _260);
    float _268 = fma(_262, _162, _170);
    float _270 = fma(_264, _162, _172);
    float _272 = fma(_266, _162, _174);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_55.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_90);
        float _298 = 1.0 / _296;
        float _300 = _124 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _310 = _302 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _314 = _302 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _332 = 1.0 / _318;
    bool _334 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _336 = isnan(_302);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = 1.0 / _322;
    bool _348 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _350 = isnan(_302);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _362 = 1.0 / _326;
    float _364 = _306 * _332;
    bool _366 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _368 = isnan(_302);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = 1.0 / _330;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _382 = _302 + _380;
    float _384 = _382 * _346;
    bool _386 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _388 = isnan(_302);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = _310 * _362;
    float _400 = -_376;
    float _402 = _400 + 1.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _404;
    float _408 = -_396;
    float _410 = _408 + 1.0;
    float _412 = _358 * _402;
    float _414 = -_358;
    float _416 = _414 + 1.0;
    float _418 = _376 * _410;
    float _420 = _314 * _378;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _426;
    float _430 = fma(_406, _398, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _432 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _434 = isnan(_302);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_424, _398, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _446 = fma(_428, _398, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _448 = _344 * _416;
    float _450 = -_344;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _466 = _442 * _452;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = fma(_456, _420, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _474 = fma(_460, _420, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _476 = _430 * _466;
    float _478 = _444 * _466;
    float _480 = _446 * _466;
    float _482 = fma(_464, _420, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _484 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[107].x, _476);
    float _486 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[107].y, _478);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _496;
    float _500 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[107].z, _480);
    float _502 = fma(_472, _448, _484);
    float _504 = fma(_474, _448, _486);
    float _506 = fma(_490, _364, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _508 = fma(_494, _364, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _510 = fma(_498, _364, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _524 = fma(_482, _448, _500);
    float _526 = fma(_514, _384, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _528 = fma(_518, _384, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _530 = fma(_522, _384, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _532 = fma(_506, _412, _502);
    float _534 = fma(_508, _412, _504);
    float _536 = fma(_510, _412, _524);
    float _538 = fma(_526, _418, _532);
    float _540 = fma(_528, _418, _534);
    float _542 = fma(_530, _418, _536);
    float _544 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[111].x, _538);
    float _546 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[111].y, _540);
    float _548 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[111].z, _542);
    float _550 = _544 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _552 = _546 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _554 = _548 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _556 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _562 = !_360;
    float _580;
    if (!_562)
    {
        float _564 = in.m_55.x;
        float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _568 = _564 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _572 = _570 * _566;
        float _574 = floor(_572);
        float _576 = -_574;
        float _578 = _572 + _576;
        _580 = _578;
        _582 = true;
    }
    else
    {
        float _584 = float(_90);
        float _586 = 1.0 / _584;
        float _588 = _124 * _586;
        _580 = _588;
    }
    _582 = false;
    float _590 = _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _594 = _590 + _592;
    bool _596 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _598 = isnan(_590);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _610 = _590 + _608;
    bool _612 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _614 = isnan(_590);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _632 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _634 = isnan(_590);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -_606;
    float _646 = _644 + 1.0;
    float _648 = 1.0 / _630;
    float _650 = _642 * _646;
    float _652 = -_642;
    float _654 = _652 + 1.0;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _656;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _662 = 1.0 / _626;
    float _664 = _622 * _654;
    float _666 = -_622;
    float _668 = _666 + 1.0;
    float _670 = _610 * _648;
    float _672 = _594 * _662;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _678;
    float _682 = fma(_658, _672, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _684 = fma(_676, _672, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _686 = fma(_680, _672, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _688 = in.m_51.x;
    float _690 = in.m_51.y;
    float _692 = in.m_51.z;
    float _694 = _682 * _664;
    float _696 = _684 * _664;
    float _698 = _686 * _664;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _712 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[123].x, _694);
    float _714 = fma(_702, _670, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _716 = fma(_706, _670, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _718 = fma(_710, _670, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _720 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[123].y, _696);
    float _722 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[123].z, _698);
    float _724 = fma(_714, _650, _712);
    float _726 = fma(_716, _650, _720);
    float _728 = fma(_718, _650, _722);
    float _730 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[125].x, _724);
    float _732 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[125].y, _726);
    float _734 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[125].z, _728);
    float _736 = _730 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _738 = _692 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _740 = _690 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _742 = _732 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _744 = _734 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _746 = _688 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _754 = !_660;
    float _772;
    if (!_754)
    {
        float _756 = in.m_55.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_90);
        float _778 = 1.0 / _776;
        float _780 = _124 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = in.m_55.x;
    float _786 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _788 = in.m_55.y;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _792 = _790 != 0;
    float _794 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _796 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _802 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _794);
    float _804 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _786);
    float _806 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _796);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _812 = 1.0 / _800;
    float _814 = 1.0 / _810;
    int _816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _818 = _816 != 0;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _826 = _824 != 0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _834 = _784 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _836 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _844 = -_832;
    float _846 = fma(_834, 2.0, _844);
    float _848 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _850 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _836);
    float _852 = 1.0 / _842;
    float _854 = fma(_848, -2.0, _838);
    float _856 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _858 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _804);
    float _860 = -_124;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[76].x, _846);
    float _864 = 1.0 / _830;
    float _866 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _872 = in.m_55.z;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _882 = 1.0 / _870;
    float _884 = _876 * _814;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _886;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _898;
    float _902 = 1.0 / _880;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _916 = _906 * _864;
    float _918 = _914 * _812;
    float _920 = 1.0 / _896;
    float _922 = _892 * _882;
    float _924 = _788 * 2.0;
    float _926 = _872 * 2.0;
    float _928 = _788 + _872;
    float _930 = _900 * _852;
    float _932 = _928 + (-1.0);
    float _934 = _784 + _872;
    float _936 = floor(_926);
    float _938 = _888 * _902;
    float _940 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _942 = _934 + (-1.0);
    float _944 = (*spvDescriptorSet0.vp_c8)._m0[32].y * (*spvDescriptorSet0.vp_c8)._m0[32].y;
    float _946 = _910 * _920;
    float _948 = _784 * 2.0;
    float _950 = floor(_924);
    float _952 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _954 = _784 + _788;
    float _956 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _850);
    bool _958 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _960 = isnan(_782);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _954 + (-1.0);
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _974 = _924;
    bool _976 = _822;
    float _978 = _784;
    if (!_792)
    {
        _972 = _872;
    }
    float _980 = _972;
    float _982 = floor(_948);
    float _984 = fma((*spvDescriptorSet0.vp_c8)._m0[32].x, (*spvDescriptorSet0.vp_c8)._m0[32].x, _944);
    float _986 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _988 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _990 = isnan(_782);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = -_968;
    float _1002 = _1000 + 1.0;
    bool _1004 = _936 >= 0.0;
    bool _1006 = isnan(_936);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan(0.0);
    bool _1012 = _1008 || _1010;
    float _1014 = _858 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1016 = _936 > 0.0;
    float _1018 = -_998;
    float _1020 = _1018 + 1.0;
    bool _1022 = _950 >= 0.0;
    bool _1024 = isnan(_950);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    float _1032 = _998 * _1002;
    bool _1034 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1036 = isnan(_782);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1048 = log2(_1046);
    float _1050 = _936;
    float _1052 = _980;
    if (!_792)
    {
        _974 = _788;
    }
    float _1054 = _974;
    float _1056 = _856 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1058 = _1054;
    if (!_792)
    {
        _1050 = _872;
    }
    float _1060 = _1050;
    float _1062 = -_1044;
    float _1064 = _1062 + 1.0;
    float _1066 = _1060;
    if (_792)
    {
        _1058 = _784;
    }
    float _1068 = _1058;
    float _1070 = _1044 * _1020;
    if (_792)
    {
        _1066 = _788;
    }
    float _1072 = _1066;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1076 = _1014 + _1074;
    if (_792)
    {
        _1052 = _788;
    }
    float _1078 = _1052;
    float _1080 = _866 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1082 = _950 > 0.0;
    float _1084 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1086 = _1012 ? 0 : 1;
    float _1088 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _854);
    int _1090 = _1030 ? 0 : 1;
    float _1092 = _1048 * _124;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1096 = _1056 + _1094;
    bool _1098 = _982 > 0.0;
    float _1100 = _1076 * _1076;
    bool _1102 = _982 >= 0.0;
    bool _1104 = isnan(_982);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.0);
    bool _1110 = _1106 || _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1114 = _782 + _1112;
    bool _1116 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1118 = isnan(_782);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = fma((*spvDescriptorSet0.vp_c8)._m0[32].z, (*spvDescriptorSet0.vp_c8)._m0[32].z, _984);
    bool _1130 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1132 = isnan(_782);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = fma(_884, _1114, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1146 = _782 + _1144;
    float _1148 = _1126 * _1064;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1152 = _782 + _1150;
    float _1154 = -_1126;
    float _1156 = _1154 + 1.0;
    bool _1158 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1160 = isnan(_782);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1166 = _1162 || _1164;
    float _1168 = float(_1166);
    float _1170 = -_1140;
    float _1172 = _1170 + 1.0;
    float _1174 = fma(_918, _1146, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1176 = fma(_930, _1152, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1180 = _782 + _1178;
    bool _1182 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1184 = isnan(_782);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = _1140 * _1156;
    float _1196 = _1168 * _1172;
    float _1198 = -_1168;
    float _1200 = _1198 + 1.0;
    float _1202 = fma(_916, _1180, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1204 = _1192 * _1200;
    bool _1206 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1208 = isnan(_782);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = -_1192;
    float _1220 = _1218 + 1.0;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1226 = _1216 * _1220;
    float _1228 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1222);
    float _1230 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1224);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1234 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1236 = _1142 * _1226;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1240 = -_1216;
    float _1242 = _1240 + 1.0;
    float _1244 = -_1232;
    float _1246 = fma(_1234, 2.0, _1244);
    bool _1248 = !_818;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = fma(_1084, -2.0, _1238);
    int _1254 = ~_1086;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    float _1260 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1236);
    int _1262 = _1258;
    bool _1264 = _1110;
    int _1266 = as_type<int>(_1260);
    if (!_1016)
    {
        int _1268 = ~_1086;
        int _1270 = _1268 + 1;
        _1262 = _1270;
    }
    int _1272 = _1262;
    float _1274 = exp2(_1092);
    int _1276 = abs(_1250);
    float _1278 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1230);
    int _1280 = ~_1090;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    float _1286 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1252);
    int _1288 = _1110 ? 0 : 1;
    float _1290 = fma(_1096, _1096, _1100);
    int _1292 = _1284;
    if (!_1082)
    {
        int _1294 = ~_1090;
        int _1296 = _1294 + 1;
        _1292 = _1296;
    }
    int _1298 = _1292;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1302 = _1080 + _1300;
    bool _1304 = !_826;
    int _1306 = _1304 ? 0 : 1;
    float _1308 = float(_1276);
    float _1310 = fma(_1302, _1302, _1290);
    float _1312 = float(_1272);
    float _1314 = -_1274;
    float _1316 = _1314 + 1.0;
    int _1318 = ~_1288;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    int _1324 = _1322;
    if (!_1098)
    {
        int _1326 = ~_1288;
        int _1328 = _1326 + 1;
        _1324 = _1328;
    }
    int _1330 = _1324;
    float _1332 = _1308 * _1312;
    int _1334 = abs(_1306);
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1338 = float(_1298);
    float _1340 = _1332 * (-2.0);
    float _1342 = float(_1334);
    float _1344 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1336);
    float _1346 = -_124;
    float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1246);
    float _1350 = _1342 * _1338;
    bool _1352 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1354 = isnan(0.0);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1360 = _1356 || _1358;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1364 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1344);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1368 = 1.0 + _1366;
    float _1370 = rsqrt(_956);
    bool _1372 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1374 = isnan(1.0);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1380 = _1376 || _1378;
    float _1382 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1362);
    float _1384 = _1360 ? _1316 : 0.0;
    float _1386 = float(_1330);
    float _1388 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1382);
    float _1390 = 1.0 / _1368;
    float _1392 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _788);
    float _1394 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1396 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1228);
    float _1398 = _1350 * (-2.0);
    float _1400 = fma(_986, _1340, _986);
    bool _1402 = !_822;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = _1394 * (-0.15915493667125701904296875);
    float _1408 = fma(_952, _1398, _952);
    float _1410 = -_1080;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1414 = in.m_57.x;
    float _1416 = in.m_57.y;
    float _1418 = in.m_57.z;
    int _1420 = abs(_1404);
    float _1422 = _1406 * 6.283185482025146484375;
    float _1424 = cos(_1422);
    float _1426 = _1412;
    if (_1380)
    {
        float _1428 = _1384 * _1390;
        _128 = _1428;
    }
    float _1430 = _128;
    float _1432 = _784 + (-0.5);
    float _1434 = float(_1420);
    float _1436 = _872 + (-0.5);
    float _1438 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1440 = abs(_1096);
    float _1442 = abs(_1412);
    float _1444 = precise::max(_1440, _1442);
    float _1446 = _1406 * 6.283185482025146484375;
    float _1448 = sin(_1446);
    float _1450 = _1434 * _1386;
    float _1452 = fma(_1400, _1430, _1438);
    bool _1454 = _1444 >= 16.0;
    float _1456 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1458 = in.m_59.x;
    float _1460 = _1452 * 0.15915493667125701904296875;
    float _1462 = _1096 * 0.0625;
    float _1464 = rsqrt(_1310);
    float _1466 = fma(_1408, _1430, _1456);
    float _1468 = _1450 * (-2.0);
    float _1470 = _1454 ? _1462 : _1096;
    float _1472 = _1466 * 0.15915493667125701904296875;
    float _1474 = _1416 + 0.100000001490116119384765625;
    float _1476 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0199999995529651641845703125, _784);
    float _1478 = _1448 * _1418;
    if (_1454)
    {
        float _1480 = _1412 * 0.0625;
        _1426 = _1480;
    }
    float _1482 = _1426;
    float _1484 = abs(_1470);
    bool _1486 = _1484 != 0.0;
    bool _1488 = isnan(_1484);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.0);
    bool _1494 = _1490 || _1492;
    float _1496 = _1460 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    float _1500 = -_1478;
    float _1502 = fma(_1424, _1474, _1500);
    float _1504 = fma(_940, _1468, _940);
    float _1506 = abs(_1482);
    bool _1508 = _1506 == 0.0;
    bool _1510 = !_1494;
    bool _1512 = _1508 && _1510;
    float _1514 = _1502 + (-0.100000001490116119384765625);
    float _1516 = _1076 * _1464;
    float _1518 = _1096 * _1464;
    float _1520 = _1460 * 6.283185482025146484375;
    float _1522 = cos(_1520);
    float _1524 = _1514 + _1476;
    float _1526 = _1514 + _1392;
    float _1528 = abs(_1482);
    bool _1530 = _1528 == 0.0;
    float _1532 = _1302 * _1464;
    float _1534 = _1524 * 8.0;
    float _1536 = _1472 * 6.283185482025146484375;
    float _1538 = cos(_1536);
    float _1540 = _1534 * 0.15915493667125701904296875;
    float _1542 = _1526 * 10.0;
    float _1544 = fma(_1174, _1204, _1260);
    float _1546 = -_1516;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1076);
    float _1550 = -_1518;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1096);
    float _1554 = _1542 * 0.15915493667125701904296875;
    float _1556 = _788 + (-0.5);
    float _1558 = _1540 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = _1548 * _1548;
    if (_1512)
    {
        bool _1564 = as_type<int>(_1482) >= 0;
        _1264 = _1564;
    }
    bool _1566 = _1264;
    float _1568 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1570 = -_1532;
    float _1572 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1302);
    float _1574 = fma(_1552, _1552, _1562);
    float _1576 = _1572;
    int _1578 = _1566 ? (-1) : 0;
    if (_1512)
    {
        int _1580 = _1566 ? 0 : 1078530011;
        _1266 = _1580;
    }
    int _1582 = _1266;
    float _1584 = fma(_1176, _1196, _1544);
    float _1586 = _1554 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    float _1590 = fma(_1504, _1430, _1568);
    float _1592 = fma(_1572, _1572, _1574);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1596 = _782 + _1594;
    int _1598 = _1582;
    if (_1512)
    {
        int _1600 = int(0x80000000) & as_type<int>(_1470);
        int _1602 = _1582 | _1600;
        _1576 = as_type<float>(_1602);
    }
    float _1604 = _1576;
    bool _1606 = !_1494;
    bool _1608 = _1606 && _1530;
    float _1610 = _1604;
    float _1612 = _1604;
    if (!_1608)
    {
        float _1614 = abs(_1470);
        bool _1616 = _1614 != as_type<float>(0x7f800000u /* inf */);
        bool _1618 = isnan(_1614);
        bool _1620 = _1616 || _1618;
        bool _1622 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1624 = _1620 || _1622;
        float _1626 = abs(_1482);
        bool _1628 = _1626 == as_type<float>(0x7f800000u /* inf */);
        float _1630 = abs(_1482);
        bool _1632 = _1630 == as_type<float>(0x7f800000u /* inf */);
        bool _1634 = !_1624;
        bool _1636 = _1632 && _1634;
        if (_1636)
        {
            bool _1638 = as_type<int>(_1482) >= 0;
            _1578 = _1638 ? (-1) : 0;
        }
        int _1640 = _1578;
        if (_1636)
        {
            _1598 = 1075235812;
        }
        int _1642 = _1598;
        int _1644 = _1642;
        if (_1636)
        {
            int _1646 = ~_1640;
            int _1648 = (_1646 != 0) ? _1642 : 1061752795;
            _1644 = _1648;
        }
        int _1650 = _1644;
        if (_1636)
        {
            int _1652 = int(0x80000000) & as_type<int>(_1470);
            int _1654 = _1650 | _1652;
            _1610 = as_type<float>(_1654);
        }
        float _1656 = _1610;
        bool _1658 = !_1624;
        bool _1660 = _1658 && _1628;
        _1612 = _1656;
        if (!_1660)
        {
            float _1662 = abs(_1470);
            float _1664 = abs(_1482);
            float _1666 = precise::max(_1662, _1664);
            float _1668 = abs(_1470);
            float _1670 = abs(_1482);
            float _1672 = precise::min(_1668, _1670);
            float _1674 = 1.0 / _1666;
            float _1676 = abs(_1470);
            float _1678 = abs(_1482);
            bool _1680 = _1676 > _1678;
            bool _1682 = as_type<int>(_1482) >= 0;
            float _1684 = _1672 * _1674;
            float _1686 = abs(_1470);
            float _1688 = abs(_1482);
            float _1690 = _1686 + _1688;
            int _1692 = as_type<int>(_1470) & int(0x80000000);
            float _1694 = _1684 * _1684;
            bool _1696 = _1690 > as_type<float>(0x7f800000u /* inf */);
            bool _1698 = isnan(_1690);
            bool _1700 = _1696 || _1698;
            bool _1702 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1704 = _1700 || _1702;
            float _1706 = _1694 + 11.33538818359375;
            float _1708 = fma(_1694, _1706, 28.84246826171875);
            float _1710 = fma(_1694, _1708, 19.6966705322265625);
            float _1712 = fma(_1694, -0.82336294651031494140625, -5.674867153167724609375);
            float _1714 = fma(_1694, _1712, -6.565555095672607421875);
            float _1716 = 1.0 / _1710;
            float _1718 = _1694 * _1714;
            float _1720 = _1684 * _1718;
            float _1722 = fma(_1720, _1716, _1684);
            float _1724 = _1722;
            _1612 = _1690;
            if (_1680)
            {
                float _1726 = -_1722;
                float _1728 = _1726 + 1.57079637050628662109375;
                _1724 = _1728;
            }
            float _1730 = _1724;
            int _1732 = as_type<int>(_1730);
            if (!_1682)
            {
                float _1734 = -_1730;
                float _1736 = _1734 + 3.1415927410125732421875;
                _1732 = as_type<int>(_1736);
            }
            int _1738 = _1732;
            if (!_1704)
            {
                int _1740 = _1692 | _1738;
                _1612 = as_type<float>(_1740);
            }
        }
    }
    float _1742 = _1612;
    float _1744 = -_1742;
    float _1746 = _1590 + _1744;
    float _1748 = fma(_1202, _1194, _1584);
    float _1750 = sqrt(_1592);
    float _1752 = fma(_938, _1596, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1756 = _782 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1760 = _782 + _1758;
    float _1762 = fma(_1752, _1148, _1748);
    float _1764 = fma(_922, _1756, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1766 = _1746 * 0.15915493667125701904296875;
    float _1768 = fma(_946, _1760, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1770 = _1424 * _1418;
    float _1772 = fma(_1764, _1070, _1762);
    float _1774 = fma(_1394, -0.100000001490116119384765625, 0.100000001490116119384765625);
    float _1776 = _1394 * 0.0500000007450580596923828125;
    float _1778 = _1766 * 6.283185482025146484375;
    float _1780 = sin(_1778);
    float _1782 = fma(_1448, _1474, _1770);
    float _1784 = _1774 * _1458;
    float _1786 = fma(_1776, _1458, _1514);
    float _1788 = _1464 * _1750;
    float _1790 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1792 = fma(_1768, _1032, _1772);
    float _1794 = _1766 * 6.283185482025146484375;
    float _1796 = cos(_1794);
    float _1798 = fma(_1560, _1784, _1414);
    float _1800 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1786);
    float _1804 = _1788 * _1790;
    float _1806 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1808 = fma(_1588, _1784, _1782);
    float _1810 = _1788 * _1800;
    float _1812 = _1472 * 6.283185482025146484375;
    float _1814 = sin(_1812);
    float _1816 = _1804 * _1802;
    float _1818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1798);
    float _1820 = _1788 * _1806;
    float _1822 = _1522 * _1780;
    float _1824 = _1538 * _1816;
    float _1826 = _1810 * _1818;
    float _1828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1808);
    float _1830 = rsqrt(_1128);
    float _1832 = _1498 * _1796;
    float _1834 = _1498 * _1824;
    float _1836 = _1820 * _1828;
    float _1838 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1792);
    float _1840 = _1498 * _1780;
    float _1842 = _1522 * _1796;
    float _1844 = _1796 * _1538;
    float _1846 = -_1822;
    float _1848 = fma(_1814, _1832, _1846);
    float _1850 = _1838 * 0.3499999940395355224609375;
    float _1852 = _1780 * _1538;
    float _1854 = _1522 * _1824;
    float _1856 = fma(_1848, _1826, _1834);
    float _1858 = -_1816;
    float _1860 = _1814 * _1858;
    float _1862 = fma(_1814, _1840, _1842);
    float _1864 = -_1832;
    float _1866 = fma(_1814, _1822, _1864);
    float _1868 = _1830 * _1850;
    float _1870 = fma(_1844, _1826, _1860);
    float _1872 = fma(_1862, _1836, _1856);
    float _1874 = _1458 * _1868;
    float _1876 = fma(_1852, _1836, _1870);
    float _1878 = _1080 + _1872;
    float _1880 = _1056 + _1876;
    float _1882 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1878);
    float _1884 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1880);
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1888 = _1882 + _1886;
    float _1890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1892 = _1884 + _1890;
    float _1894 = _1888 * _1888;
    float _1896 = fma(_1892, _1892, _1894);
    float _1898 = fma(_1814, _1842, _1840);
    float _1900 = sqrt(_1896);
    float _1902 = fma(_1898, _1826, _1854);
    float _1904 = fma(_1866, _1836, _1902);
    float _1906 = _1014 + _1904;
    float _1908 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1906);
    bool _1910 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1912 = _1906;
    float _1914 = _1866;
    float _1916 = _1884;
    float _1918 = _1888;
    float _1920 = _1882;
    if (!_1910)
    {
        _1912 = _1882;
    }
    float _1922 = _1912;
    float _1924 = _1922;
    if (!_1910)
    {
        _1914 = _1908;
    }
    float _1926 = _1914;
    bool _1928 = !_1910;
    float _1930 = _1926;
    if (!_1928)
    {
        float _1932 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1936 = _1900 + _1934;
        float _1938 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = rsqrt(_1896);
        float _1942 = _1936 * _1932;
        float _1944 = _1942 * 0.15915493667125701904296875;
        float _1946 = _1944 * 6.283185482025146484375;
        float _1948 = cos(_1946);
        float _1950 = _1944 * 6.283185482025146484375;
        float _1952 = sin(_1950);
        float _1954 = _1948 + (-1.0);
        float _1956 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1958 = fma(_1952, _1938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1960 = fma(_1908, _1948, _1956);
        float _1962 = _1940 * _1958;
        float _1964 = fma(_1892, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1966 = fma(_1888, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1930 = _1960;
        _1916 = _1964;
        _1924 = _1966;
    }
    float _1968 = _1930;
    float _1970 = _1916;
    float _1972 = _1924;
    float _1974 = -_1516;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1968);
    float _1978 = -_1518;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1970);
    float _1982 = -_1532;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1972);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1976 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1992 = _1980 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1996 = _1984 + _1994;
    float _1998 = _1988 * _1988;
    float _2000 = fma(_1992, _1992, _1998);
    float _2002 = fma(_1996, _1996, _2000);
    float _2004 = rsqrt(_2002);
    float _2006 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2008 = _1992 * _2006;
    float _2010 = _1996 * _2006;
    float _2012 = _2008 * _2008;
    float _2014 = _2010 * _2010;
    float _2016 = _2012 + _2014;
    float _2018 = sqrt(_2016);
    bool _2020 = _2018 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2024 = _2018 + _2022;
    float _2026 = _1996;
    float _2028 = _2016;
    float _2030 = _2024;
    float _2032 = _1988;
    if (_2020)
    {
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2026 = _2034;
    }
    float _2036 = _2026;
    if (_2020)
    {
        float _2038 = rsqrt(_2016);
        _2028 = _2038;
    }
    float _2040 = _2028;
    if (_2020)
    {
        float _2042 = _2024 * _2036;
        _2030 = _2042;
    }
    float _2044 = _2030;
    if (_2020)
    {
        float _2046 = _2044 * 0.15915493667125701904296875;
        _1918 = _2046;
    }
    float _2048 = _1918;
    float _2050 = _2000;
    float _2052 = _2048;
    if (_2020)
    {
        float _2054 = _2048 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        _2050 = _2056;
    }
    float _2058 = _2050;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2062 = precise::max(0.0, _2060);
    float _2064 = _2004;
    float _2066 = _2062;
    float _2068 = _2060;
    if (_2020)
    {
        float _2070 = _2048 * 6.283185482025146484375;
        float _2072 = cos(_2070);
        _2064 = _2072;
    }
    float _2074 = _2064;
    float _2076 = -_2006;
    float _2078 = -_2062;
    float _2080 = fma(_1988, _2076, _2078);
    if (!_2020)
    {
        _2032 = _2008;
    }
    float _2082 = _2032;
    float _2084 = _2082;
    if (_2020)
    {
        float _2086 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2066 = _2086;
    }
    float _2088 = _2066;
    float _2090 = _2088;
    float _2092 = _2058;
    if (_2020)
    {
        float _2094 = fma(_2058, _2088, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1920 = _2094;
    }
    float _2096 = _1920;
    if (!_2020)
    {
        _2090 = _2080;
    }
    float _2098 = _2090;
    float _2100 = _2098;
    float _2102 = _2074;
    if (_2020)
    {
        float _2104 = _2074 + (-1.0);
        _2068 = _2104;
    }
    float _2106 = _2068;
    float _2108 = _2106;
    if (_2020)
    {
        float _2110 = _2040 * _2096;
        _2052 = _2110;
    }
    float _2112 = _2052;
    float _2114 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2116 = sqrt(_2002);
    if (_2020)
    {
        float _2118 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2092 = _2118;
    }
    float _2120 = _2092;
    float _2122 = _2120;
    if (_2020)
    {
        float _2124 = _2008 * _2112;
        _2084 = _2124;
    }
    float _2126 = _2084;
    if (!_2020)
    {
        _2108 = _2010;
    }
    float _2128 = _2108;
    float _2130 = _2128;
    if (_2020)
    {
        float _2132 = _2010 * _2112;
        _2130 = _2132;
    }
    float _2134 = _2130;
    if (_2020)
    {
        float _2136 = fma(_2080, _2074, _2120);
        _2100 = _2136;
    }
    float _2138 = _2100;
    if (!_2020)
    {
        _2122 = _2012;
    }
    float _2140 = _2122;
    float _2142 = _2140;
    if (_2020)
    {
        float _2144 = _2126 * _2126;
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_2020)
    {
        _2102 = _2014;
    }
    float _2150 = _2102;
    float _2152 = _2150;
    if (_2020)
    {
        float _2154 = _2134 * _2134;
        _2152 = _2154;
    }
    float _2156 = _2152;
    float _2158 = fma(_2138, _2138, _2146);
    float _2160 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2162 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2164 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2148);
    float _2166 = _2158 + _2156;
    float _2168 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2114);
    float _2170 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2160);
    float _2172 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2162);
    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2176 = fma(_2116, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2174);
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2164);
    float _2182 = rsqrt(_2166);
    float _2184 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2170);
    float _2186 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2168);
    float _2188 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2190 = -_2178;
    float _2192 = _2190 + 1.0;
    float _2194 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2196 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2198 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2200 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2172);
    float _2202 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2204 = abs(_2192);
    float _2206 = log2(_2204);
    float _2208 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2198);
    float _2210 = _2200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2212 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2214 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2208);
    float _2216 = _2182 * _2126;
    float _2218 = _2182 * _2134;
    float _2220 = -_2212;
    float _2222 = fma(_2220, _2202, 1.0);
    float _2224 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2214);
    float _2226 = _2182 * _2138;
    float _2228 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2230 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2232 = 1.0 / _2224;
    float _2234 = -_2228;
    float _2236 = fma(_2226, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2234);
    float _2238 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2240 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2230);
    float _2242 = -_2218;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2236);
    float _2246 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2248 = log2(_2222);
    float _2250 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2240);
    float _2252 = fma(_2244, -0.5, 0.5);
    float _2254 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2246);
    float _2256 = fma(_2244, 0.5, 0.5);
    float _2258 = _2226 + 1.0;
    float _2260 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2254);
    float _2262 = exp2(_2238);
    float _2264 = fma(_2256, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2266 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2260);
    float _2268 = fma(_2256, _2264, -0.212114393711090087890625);
    float _2270 = sqrt(_2252);
    float _2272 = fma(_2256, _2268, 1.570728778839111328125);
    float _2274 = -_2226;
    float _2276 = fma(_2262, _2258, _2274);
    float _2278 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2250);
    float _2280 = _2248 * 0.693147182464599609375;
    float _2282 = _2266 * _2232;
    float _2284 = _2278 * _2232;
    float _2286 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2288 = fma(_2282, 0.5, 0.5);
    float _2290 = _2270 * 0.636619746685028076171875;
    float _2292 = fma(_2284, -0.5, 0.5);
    float _2294 = fma(_2276, 0.5, 0.5);
    float _2296 = -_2272;
    float _2298 = fma(_2290, _2296, 1.0);
    float3 _6152 = float3(_2288, _2292, _2286);
    float _2300 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6152, float3(0.0), isnan(_6152)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6152, float3(0.0), isnan(_6152)), level(0.0)).x;
    float3 _6163 = float3(_2288, _2292, _2286);
    float4 _2303 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6163, float3(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6163, float3(0.0), isnan(_6163)), level(0.0)).xyzw;
    float _2305 = _2303.x;
    float _2307 = _2303.y;
    float _2309 = _2303.z;
    float _2311 = _2303.w;
    float2 _6180 = float2(_2298, _2294);
    float3 _2315 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6180, float2(0.0), isnan(_6180)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6180, float2(0.0), isnan(_6180)), level(0.0)).xyz;
    float _2317 = _2315.x;
    float _2319 = _2315.y;
    float _2321 = _2315.z;
    float _2323 = in.m_55.w;
    float _2325 = -_1516;
    float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1014);
    bool _2329 = _788 > 0.5;
    out.m_61.x = _748;
    out.m_61.y = _750;
    out.m_61.z = _752;
    int _2331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2333 = _2331 != 0;
    float _2335 = -_1518;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1056);
    int _2339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2341 = _2339 != 0;
    float _2343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_63.x = _556;
    out.m_63.y = _558;
    out.m_63.z = _560;
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2347 = _2345 != 0;
    float _2349 = -_1532;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2355 = _2353 != 0;
    out.m_65.y = _150;
    float _2357 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2361 = as_type<int>(_2288);
    if (_2333)
    {
        float _2363 = -_146;
        float _2365 = _2363 + 1.0;
        _2361 = as_type<int>(_2365);
    }
    int _2367 = _2361;
    if (_2333)
    {
        bool _2369 = _784 > 0.5;
        _976 = _2369;
    }
    bool _2371 = _976;
    float _2373 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2357);
    if (!_2333)
    {
        _978 = _146;
    }
    float _2375 = _978;
    float _2377 = _2327 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2379 = _2375;
    if (_2333)
    {
        float _2381 = _2371 ? as_type<float>(_2367) : _146;
        _2379 = _2381;
    }
    float _2383 = _2379;
    float _2385 = _2327 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2387 = _872 > 0.5;
    bool _2389 = _2387 && _2341;
    float _2391 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2377);
    bool _2393 = _2323 > 0.5;
    float _2395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2397 = -_150;
    float _2399 = _2397 + 1.0;
    float _2401 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2391);
    float _2403 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2385);
    float _2405 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2407 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2373);
    int _2409 = _2393 ? as_type<int>(_2399) : as_type<int>(_150);
    float _2411 = _2401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _2413 = _2329 ? as_type<int>(_2399) : as_type<int>(_150);
    float _2415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2417 = _2347 ? as_type<float>(_2409) : _150;
    float _2419 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2421 = _2355 ? as_type<float>(_2413) : _150;
    float _2423 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2403);
    float _2425 = fma(_2405, _2383, -0.5);
    float _2427 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2429 = fma(_2419, _2421, -0.5);
    float _2431 = _2419;
    if (!_2341)
    {
        _2431 = _146;
    }
    float _2433 = _2431;
    float _2435 = _2433;
    if (_2389)
    {
        float _2437 = -_146;
        float _2439 = _2437 + 1.0;
        _196 = _2439;
    }
    float _2441 = _196;
    float _2443 = fma(_2417, _2427, -0.5);
    float _2445 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2447 = 1.0 / _2411;
    float _2449 = _2423 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_2341)
    {
        _2435 = _2441;
    }
    float _2451 = _2435;
    float _2453 = _2415 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2455 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2457 = isnan(0.5);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2463 = _2459 || _2461;
    float _2465 = _2449 + _2411;
    float _2467 = fma(_1364, _2425, _862);
    float _2469 = fma(_2453, _2451, -0.5);
    float _2471 = exp2(_2445);
    float _2473 = -_1088;
    float _2475 = fma(_1388, _2429, _2473);
    float _2477 = -_1286;
    float _2479 = fma(_1396, _2443, _2477);
    float _2481 = fma(_1278, _2469, _1348);
    float _2483 = _2465 * _2447;
    float _2485 = _2483 * 0.5;
    float _2487 = _2469;
    if (_2463)
    {
        _2487 = 1.0;
    }
    float _2489 = _2487;
    float _2491 = _2489;
    if (!_2463)
    {
        float _2493 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2495 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2497 = _2493 * 0.15915493667125701904296875;
        float _2499 = _2495 * 0.15915493667125701904296875;
        float _2501 = _2497 * 6.283185482025146484375;
        float _2503 = cos(_2501);
        float _2505 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2507 = fma(_2485, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2505);
        float _2509 = _2497 * 6.283185482025146484375;
        float _2511 = sin(_2509);
        float _2513 = 1.0 / _2503;
        float _2515 = _2499 * 6.283185482025146484375;
        float _2517 = cos(_2515);
        float _2519 = _2511 * _2513;
        float _2521 = _2499 * 6.283185482025146484375;
        float _2523 = sin(_2521);
        float _2525 = _2517 * _2519;
        float _2527 = 1.0 / _2507;
        float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2531 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2529;
        float _2533 = 1.0 / _2525;
        float _2535 = 1.0 / _2531;
        float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2539 = _2527 * _2537;
        float _2541 = _2523 * _2533;
        float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2545 = fma(_2541, _2539, _2543);
        float _2547 = _2545 * _2535;
        float _2549 = precise::clamp(_2547, 0.0, 1.0);
        _2491 = _2549;
    }
    float _2551 = _2491;
    float _2553 = -_2471;
    float _2555 = _2553 + 1.0;
    float _2557 = _2479 + 0.5;
    float _2559 = _2224 * 0.5;
    float _2561 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2407);
    float _2563 = _2555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2565 = _2551 > 0.0;
    bool _2567 = isnan(_2551);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan(0.0);
    bool _2573 = _2569 || _2571;
    float _2575 = _2467 + 0.5;
    float _2577 = fma(_2278, -0.5, _2559);
    float _2579 = _2563 * _2300;
    float _2581 = _2266 + _2224;
    float _2583 = _2551 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2585 = _2561 + _2224;
    float _2587 = _2311 * _2579;
    float _2589 = _2321 * _2579;
    float _2591 = -_2563;
    float _2593 = _2591 + 1.0;
    float _2595 = _2581 * 0.5;
    float _2597 = fma(_2317, _2587, _2305);
    float _2599 = fma(_2319, _2587, _2307);
    float _2601 = _2475 + 0.5;
    float _2603 = _2481 + 0.5;
    float _2605 = _2585 * 0.5;
    float _2607 = _2583 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2609 = _2311 * _2593;
    float _2611 = fma(_2311, _2589, _2309);
    out.m_67.x = _2575;
    out.m_67.y = _2601;
    out.m_67.z = _2603;
    out.m_67.w = _2557;
    out.gl_Position.x = _2266;
    out.gl_Position.y = _2278;
    out.gl_Position.z = _2561;
    out.gl_Position.w = _2224;
    out.m_69.x = _2595;
    out.m_69.y = _2577;
    out.m_69.z = _2605;
    out.m_69.w = _2224;
    out.m_45.x = _2607;
    out.m_71.x = _2597;
    out.m_71.y = _2599;
    out.m_71.z = _2611;
    out.m_71.w = _2609;
    if (_2573)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2613 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2613;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

